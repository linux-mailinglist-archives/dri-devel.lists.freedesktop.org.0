Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BE384D103
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 19:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEFD10FCD1;
	Wed,  7 Feb 2024 18:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A0010EFAB
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 18:17:09 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-7bfeae6a263so45797639f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 10:17:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707329825; x=1707934625;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=be3GbaZ/I/Bw54yVwIBFkvdPJfjdH73IwIL5QtbBR9E=;
 b=Z07UtPNxIBX/K5l8cSWDCfeN0/EO/oNTVtyDVpbBLhE0rn+Ms0nXSfBlZ1r3RDkaEa
 nuZ3iwo1LeJ4l2qAO9Anrg3Poi0FcO1UAilQq37V5w4+MDbUfpR4cziBeYckKB5PKXWl
 LOsitvkikR+XnN07xC3XRrIxMF3cqO5Ic2IMkWELd0LhalPi/oB3Xqq/IkbN+cQU3XUe
 hbPAEhnU7qx2krIjFFypkogTDdDZGbB+MylUDlY5cw34qA5Ii5W09Ts8c+qquBcy5lpA
 GjwLObPlNz/SXPLxKBrVNvi7vQPM9L1rUtvTgtLh8NKG0xt93LvMdSYlaAA9gnkJNkQL
 2MEg==
X-Gm-Message-State: AOJu0Yz5b+5y4zkgYoO/U3TL0LpdvJVmnBiRjOCRsu9L11SzGxh7T2n2
 Js3uJXv+6vtcK5jlb3ofcd4ALe4ZHAheK9je0/bxrgCPRStoEHgAlxbl/pxXNLMhyMbPgiE0Ptm
 kwW1l7efbyZduOVmKDZqIp2IjPTlSLsjWPtcw9urajDpTa/owfV9yvqo=
X-Google-Smtp-Source: AGHT+IHfir+A+/gYcaMQmPZSB8NET3r6FooBj5GlmYy8UvJN9Uul0QpZesXws4oFQggR75nC6+t3Sqg2/GSAJxTFEBpiKWJBaxiH
MIME-Version: 1.0
X-Received: by 2002:a02:9999:0:b0:470:b4f0:f762 with SMTP id
 a25-20020a029999000000b00470b4f0f762mr43403jal.1.1707329825085; Wed, 07 Feb
 2024 10:17:05 -0800 (PST)
Date: Wed, 07 Feb 2024 10:17:05 -0800
In-Reply-To: <00000000000067322b05fdfa973f@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000bd244b0610ceb32c@google.com>
Subject: Re: [syzbot] [dri?] WARNING in vkms_get_vblank_timestamp (2)
From: syzbot <syzbot+93bd128a383695391534@syzkaller.appspotmail.com>
To: airlied@gmail.com, airlied@linux.ie, daniel.vetter@ffwll.ch, 
 daniel.vetter@intel.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 hamohammed.sa@gmail.com, linux-kernel@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mairacanal@riseup.net, 
 melissa.srw@gmail.com, mripard@kernel.org, rodrigosiqueiramelo@gmail.com, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

syzbot has bisected this issue to:

commit ea40d7857d5250e5400f38c69ef9e17321e9c4a2
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri Oct 9 23:21:56 2020 +0000

    drm/vkms: fbdev emulation support

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1282dbffe80000
start commit:   6764c317b6bb Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1182dbffe80000
console output: https://syzkaller.appspot.com/x/log.txt?x=1682dbffe80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2c0ac5dfae6ecc58
dashboard link: https://syzkaller.appspot.com/bug?extid=93bd128a383695391534
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12067e60180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=102774b7e80000

Reported-by: syzbot+93bd128a383695391534@syzkaller.appspotmail.com
Fixes: ea40d7857d52 ("drm/vkms: fbdev emulation support")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
