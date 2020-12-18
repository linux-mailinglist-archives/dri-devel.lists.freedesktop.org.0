Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA27E2DF51A
	for <lists+dri-devel@lfdr.de>; Sun, 20 Dec 2020 12:10:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB656E140;
	Sun, 20 Dec 2020 11:10:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD306E1A4
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 15:26:04 +0000 (UTC)
Received: by mail-il1-f199.google.com with SMTP id e10so2350169ils.5
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 07:26:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=sk5wsene1nN0m/ZwzAMFtPnzrH/E8P/WHO8ceDjivzI=;
 b=BxkYhSR+MGvPcShceJGQZqAVcuf/UAlsXCYisLq0ywIowPblU1W7zjjsdkXIiKTPXZ
 jiuA8SIpGPY3AJ3ngTP20tN6LZBDUv+IO7zo8DOUFt8qkvdkqGEItmcWPqBHxAfj6zLP
 EyISl1AgzWa8GOYV21wkV7BzEE1quPZxChZtfrdMIlX6koNKWCyaErdUfW3z4r2nYgag
 Y6+Mx+7GFc3JOKFSfywrKXCHSgDSdlK3MZvF35dKoouuQO8ilT1N7DjuSfJ/Giagv5iT
 7rlRPjBhXCVMrTCXqiD4DvmA2phwcE9I4JbmX3GVZm4AK0t6v5/uIxigP10BVkvpKUuy
 kwVw==
X-Gm-Message-State: AOAM5323h45rV+juch0A+fWN8wYyTdclJ5uB/i1ynn+8FD/6wZMamoXh
 IGKVmT3yJbCci7lUFUoKbtrOf0VSPbDxiwE/2fPTmzArtWnX
X-Google-Smtp-Source: ABdhPJzuvrPtRbQYMrW7TokBn0kIwTaf/V843TfLKQjba/B7jwxt5ruzQvW2+psjnlXsskbIbwR8PyAsQ+KrYXz+osh7v24vwsOS
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:152f:: with SMTP id
 i15mr4326230ilu.104.1608305163890; 
 Fri, 18 Dec 2020 07:26:03 -0800 (PST)
Date: Fri, 18 Dec 2020 07:26:03 -0800
In-Reply-To: <000000000000b30cad05b0fc3d74@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fbf57305b6beb939@google.com>
Subject: Re: BUG: unable to handle kernel paging request in cfb_imageblit
From: syzbot <syzbot+dfd0b1c6705301cc4847@syzkaller.appspotmail.com>
To: b.zolnierkie@samsung.com, dan.carpenter@oracle.com, 
 dri-devel@lists.freedesktop.org, george.kennedy@oracle.com, 
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Mailman-Approved-At: Sun, 20 Dec 2020 11:10:15 +0000
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

syzbot suspects this issue was fixed by commit:

commit a49145acfb975d921464b84fe00279f99827d816
Author: George Kennedy <george.kennedy@oracle.com>
Date:   Tue Jul 7 19:26:03 2020 +0000

    fbmem: add margin check to fb_check_caps()

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1149f30f500000
start commit:   22fbc037 Merge tag 'for-linus' of git://git.kernel.org/pub..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=4e672827d2ffab1f
dashboard link: https://syzkaller.appspot.com/bug?extid=dfd0b1c6705301cc4847
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11ba9a5d900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17cfd4af900000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: fbmem: add margin check to fb_check_caps()

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
