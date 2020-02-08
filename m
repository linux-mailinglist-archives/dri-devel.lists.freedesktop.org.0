Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F7D157150
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2020 09:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C366EB80;
	Mon, 10 Feb 2020 08:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5908E6E169
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2020 04:06:02 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id w62so1522752ila.22
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2020 20:06:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=YdmzA7D11PRTJN9WOgeGykpVtC5L5hrmQEgxtcYNPyo=;
 b=PNA68UsTzGXnDLMit9hWUeEJNuy8w6ZYmWhRtT4va1wR+w7+TQuSOD3W0RpZ22+DhR
 QOkIQflU183lpHmhNFsWUl+CL4MXtbquAzAams45h9u+mn95DTQLPFOxVtbJgTDddLxP
 Iy0pOmiSIME/7DDgZYY+bar3lmso8gHDf82MgZZ/G2NvCd5ypNZhYNonfa3bG1dgEqBU
 EyWYCpny9HllLrWD5QcW5yAEUC28a5O8BiYrKjeQJttlgM+pX0svGo+HwpfYuWukCRxd
 QgC4XiepI0StCsIGsV3+tw+dDbx9gyEwtlhrQ4qQWBXhDGA/cAA+gfJfFZDb0U2FPvEh
 F3Mg==
X-Gm-Message-State: APjAAAW0X3Z00Crm5xc7/xc6AOqP2Pt94pTaTfuvFg/s07a5RBwO6kPf
 rKobzy2qqHecWTMR5Da3ViftwMJcwVKQBkZluy5D56WQsODi
X-Google-Smtp-Source: APXvYqx6+g7SHOZaaddW/1HIQIDO4JPcYx9LGs3vtbUQW2sQVYO85DabjDjhW9x29TzuvSOjB3EzxFCGFghJ6FpaAZ4nvi+3pD+q
MIME-Version: 1.0
X-Received: by 2002:a6b:92d4:: with SMTP id u203mr1503471iod.288.1581134761739; 
 Fri, 07 Feb 2020 20:06:01 -0800 (PST)
Date: Fri, 07 Feb 2020 20:06:01 -0800
In-Reply-To: <000000000000861441059e047626@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d0cac6059e089f5a@google.com>
Subject: Re: INFO: task hung in tls_sw_cancel_work_tx
From: syzbot <syzbot+ba431dd9afc3a918981a@syzkaller.appspotmail.com>
To: airlied@linux.ie, andriin@fb.com, ast@kernel.org, aviadye@mellanox.com, 
 borisp@mellanox.com, bpf@vger.kernel.org, chris@chris-wilson.co.uk, 
 daniel@iogearbox.net, davejwatson@fb.com, davem@davemloft.net, 
 dri-devel@lists.freedesktop.org, ilyal@mellanox.com, 
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, 
 john.fastabend@gmail.com, joonas.lahtinen@linux.intel.com, kafai@fb.com, 
 kuba@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 rodrigo.vivi@intel.com, songliubraving@fb.com, 
 syzkaller-bugs@googlegroups.com, tvrtko.ursulin@intel.com, yhs@fb.com
X-Mailman-Approved-At: Mon, 10 Feb 2020 08:59:10 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

syzbot has bisected this bug to:

commit f75f91574617a3c6fbc821c6b156f5777a59d0ed
Author: Chris Wilson <chris@chris-wilson.co.uk>
Date:   Tue May 15 14:31:49 2018 +0000

    drm/i915: Shrink search list for active timelines

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=121dc6b5e00000
start commit:   90568ecf Merge tag 'kvm-5.6-2' of git://git.kernel.org/pub..
git tree:       upstream
final crash:    https://syzkaller.appspot.com/x/report.txt?x=111dc6b5e00000
console output: https://syzkaller.appspot.com/x/log.txt?x=161dc6b5e00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=69fa012479f9a62
dashboard link: https://syzkaller.appspot.com/bug?extid=ba431dd9afc3a918981a
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1036b6b5e00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1651f6e9e00000

Reported-by: syzbot+ba431dd9afc3a918981a@syzkaller.appspotmail.com
Fixes: f75f91574617 ("drm/i915: Shrink search list for active timelines")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
