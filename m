Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DEDA47A65D
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 09:58:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C993411329D;
	Mon, 20 Dec 2021 08:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567F711B8A5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 15:57:08 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id
 m127-20020a6b3f85000000b005f045ba51f9so5569195ioa.4
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Dec 2021 07:57:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=J1Z0E8FYOyeGYmMCih47JGz9INwvVqcSBEE3r+oJjRA=;
 b=OAjkHSYX7gra0zNrZn/3eESBXzwAW/IlDbLC+C/p+6jjE8/LELH9ftm7GxBAgu0Bg9
 Qk7HIS3oDoGWNoWUUaRXa8SOwzsCzR6CEuksrvy/3wqtqcWSmsShxrROBj70d3QoIacZ
 bSedig+m92xGVS45948ZxfKGggJD2UgWJlfybqkY0bS5wCcVH39tVLwiXh58wsUy+gOl
 jp4txiMMRCpUkH3el8XZNuC7keErdMkwYFA/i6tOxtcQGyKGT5doitgdrQeU/OFbMBoP
 +/xDN2HOebEUS5AVwSY0RXU/nCosn4WR6QzHjhe772suQaxCaSbeqnfElO57ovCXj95K
 T5oQ==
X-Gm-Message-State: AOAM531NqE/WoAFk7lC23rsJSVRfa1PnO/8NlX8wgzZIZuxvmDbydzyn
 rdx4gwZwJ/IpyeC1TyzoH4wkJ1uyNO65mJYl+dlgpGCy4tPb
X-Google-Smtp-Source: ABdhPJzibjb8GU6GjM7AflOG1x8TLswRn7G6hxR5g2tBuxN6SrcEX/7NjUMQhAmD4CNcXRBnPUoAQBEM5E0iq4KRPSEZAzxtSFzJ
MIME-Version: 1.0
X-Received: by 2002:a6b:2cc1:: with SMTP id s184mr6122309ios.63.1639929427727; 
 Sun, 19 Dec 2021 07:57:07 -0800 (PST)
Date: Sun, 19 Dec 2021 07:57:07 -0800
In-Reply-To: <000000000000685c4605d0e47dad@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ff1c4105d381d24f@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in
 drm_gem_object_release_handle
From: syzbot <syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com>
To: airlied@linux.ie, christian.koenig@amd.com, daniel.vetter@ffwll.ch, 
 daniel.vetter@intel.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig-owner@lists.linaro.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 20 Dec 2021 08:57:56 +0000
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

commit 45d9c8dde4cd8589f9180309ec60f0da2ce486e4
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu Aug 12 13:14:12 2021 +0000

    drm/vgem: use shmem helpers

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=147953cbb00000
start commit:   3f667b5d4053 Merge tag 'tty-5.16-rc6' of git://git.kernel...
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=167953cbb00000
console output: https://syzkaller.appspot.com/x/log.txt?x=127953cbb00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=fa556098924b78f0
dashboard link: https://syzkaller.appspot.com/bug?extid=c8ae65286134dd1b800d
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16fd41ebb00000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1483c7d5b00000

Reported-by: syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com
Fixes: 45d9c8dde4cd ("drm/vgem: use shmem helpers")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
