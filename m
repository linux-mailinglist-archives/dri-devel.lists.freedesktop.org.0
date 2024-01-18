Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 333BC832620
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 10:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D741E10E989;
	Fri, 19 Jan 2024 09:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2026 seconds by postgrey-1.36 at gabe;
 Thu, 18 Jan 2024 14:52:27 UTC
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EB4910E7B7
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 14:52:27 +0000 (UTC)
Received: from fsav111.sakura.ne.jp (fsav111.sakura.ne.jp [27.133.134.238])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 40IEI4Vt090994;
 Thu, 18 Jan 2024 23:18:04 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav111.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav111.sakura.ne.jp);
 Thu, 18 Jan 2024 23:18:04 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav111.sakura.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 40IEI33U090989
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 18 Jan 2024 23:18:03 +0900 (JST)
 (envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <83414cb6-df16-4b6d-92e3-d54d22ba26cc@I-love.SAKURA.ne.jp>
Date: Thu, 18 Jan 2024 23:18:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [dri?] BUG: scheduling while atomic in
 drm_atomic_helper_wait_for_flip_done
Content-Language: en-US
To: syzbot <syzbot+06fa1063cca8163ea541@syzkaller.appspotmail.com>,
 syzkaller-bugs@googlegroups.com,
 linux-serial <linux-serial@vger.kernel.org>
References: <00000000000039f237060f354ef7@google.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <00000000000039f237060f354ef7@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 19 Jan 2024 09:03:38 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

#syz set subsystems: serial

include/linux/tty_ldisc.h says "struct tty_ldisc_ops"->write is allowed to sleep.

include/linux/tty_driver.h says "struct tty_operations"->write is not allowed to sleep.

drivers/tty/vt/vt.c implements do_con_write() from con_write() sleeping, violating what
include/linux/tty_driver.h says. But how to fix?

-	if (in_interrupt())
+	if (in_interrupt() || in_atomic())
 		return count;

in do_con_write() and con_flush_chars() ? But include/linux/preempt.h says
in_atomic() cannot know about held spinlocks in non-preemptible kernels.

Is there a way to detect spin_lock_irqsave(&gsm->tx_lock, flags) from gsmld_write() ?
Something like whether irq is disabled?

On 2024/01/18 18:51, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    1b1934dbbdcf Merge tag 'docs-6.8-2' of git://git.lwn.net/l..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1029adbde80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=68ea41b98043e6e8
> dashboard link: https://syzkaller.appspot.com/bug?extid=06fa1063cca8163ea541
> compiler:       aarch64-linux-gnu-gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: arm64

