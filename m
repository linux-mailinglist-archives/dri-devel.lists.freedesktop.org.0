Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1642205AB
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747256E440;
	Wed, 15 Jul 2020 06:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4DBF6E82D
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 10:27:53 +0000 (UTC)
Received: from fsav403.sakura.ne.jp (fsav403.sakura.ne.jp [133.242.250.102])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 06EARkFL000526;
 Tue, 14 Jul 2020 19:27:46 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav403.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp);
 Tue, 14 Jul 2020 19:27:46 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav403.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 06EARkMn000520
 (version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
 Tue, 14 Jul 2020 19:27:46 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: Re: [PATCH] fbdev: Detect integer underflow at "struct
 fbcon_ops"->clear_margins.
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <189fc902-db7c-9886-cc31-c0348435303a@i-love.sakura.ne.jp>
 <20200712111013.11881-1-penguin-kernel@I-love.SAKURA.ne.jp>
 <20200712111013.11881-2-penguin-kernel@I-love.SAKURA.ne.jp>
 <CGME20200714072231eucas1p17c53f0a661346ebfd316ebd5796ca346@eucas1p1.samsung.com>
 <db4b3346-b9f8-a428-1445-1fcbd8521e1d@samsung.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <e00078d1-e5fb-a019-3036-cb182ed2e40b@i-love.sakura.ne.jp>
Date: Tue, 14 Jul 2020 19:27:46 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <db4b3346-b9f8-a428-1445-1fcbd8521e1d@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, George Kennedy <george.kennedy@oracle.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, Jiri Slaby <jslaby@suse.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020/07/14 16:22, Bartlomiej Zolnierkiewicz wrote:
> How does this patch relate to:
> 
> 	https://marc.info/?l=linux-fbdev&m=159415024816722&w=2
> 
> ?
> 
> It seems to address the same issue, I've added George and Dan to Cc:.

George Kennedy's patch does not help for my case.

You can try a.out built from

----------
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/fb.h>

int main(int argc, char *argv[])
{
        const int fd = open("/dev/fb0", O_ACCMODE);
        struct fb_var_screeninfo var = { };
        ioctl(fd, FBIOGET_VSCREENINFO, &var);
        var.xres = var.yres = 16;
        ioctl(fd, FBIOPUT_VSCREENINFO, &var);
        return 0;
}
----------

with a fault injection patch

----------
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -1214,6 +1214,10 @@ static int vc_do_resize(struct tty_struct *tty, struct vc_data *vc,
 
 	if (new_screen_size > KMALLOC_MAX_SIZE)
 		return -EINVAL;
+	if (!strcmp(current->comm, "a.out")) {
+		printk(KERN_INFO "Forcing memory allocation failure.\n");
+		return -ENOMEM;
+	}
 	newscreen = kzalloc(new_screen_size, GFP_USER);
 	if (!newscreen)
 		return -ENOMEM;
----------

. What my patch workarounds is cases when vc_do_resize() did not update vc->vc_{cols,rows} .
Unless vc->vc_{cols,rows} are updated by vc_do_resize() in a way that avoids integer underflow at

	unsigned int rw = info->var.xres - (vc->vc_cols*cw);
	unsigned int bh = info->var.yres - (vc->vc_rows*ch);

, this crash won't go away.

[   39.995757][ T2788] Forcing memory allocation failure.
[   39.996527][ T2788] BUG: unable to handle page fault for address: ffffa9d180d7b000
[   39.996529][ T2788] #PF: supervisor write access in kernel mode
[   39.996530][ T2788] #PF: error_code(0x0002) - not-present page
[   39.996531][ T2788] PGD 13a48c067 P4D 13a48c067 PUD 13a48d067 PMD 1324e4067 PTE 0
[   39.996547][ T2788] Oops: 0002 [#1] SMP
[   39.996550][ T2788] CPU: 2 PID: 2788 Comm: a.out Not tainted 5.8.0-rc5+ #757
[   39.996551][ T2788] Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 02/27/2020
[   39.996555][ T2788] RIP: 0010:bitfill_aligned+0x87/0x120 [cfbfillrect]
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
