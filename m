Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA223F2FFC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Aug 2021 17:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C186EAB1;
	Fri, 20 Aug 2021 15:47:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADF06EAAC
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 15:45:08 +0000 (UTC)
Received: by mail-il1-f200.google.com with SMTP id
 o12-20020a92dacc000000b00224baf7b16fso4612962ilq.12
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Aug 2021 08:45:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
 :from:to;
 bh=C/764d47f9BqIhAgXfMN7s6wRczQbgVQBUoxA/nuXAk=;
 b=UIKG155wVxIbzf3ixyLOB/GzxklQ1ekya0WpA1vmcVwtEgODKYt0n2wK87BvmJnR7t
 2ybC4F08EYEDY8XhMhZDp14FEiKAFgYri+Lyx4HA7PJzOmHWEwjOdElBXygtSd90wGZV
 Oxl12wETN2S8v1dT+56gfnOtzL87LuYq6PVXibZqM1C0p9oizv2+UGG5cNvf2YNc10I5
 yGT4tjftp342hZl+bCiQlxQ25Cpk+bV9ArwAUNfM3Bo5/CD1i97WOYb2tWNayorlOdgC
 KzScTnAozem9tsfzr5aNYh8+hcPFSDe8KZGDLQ5DoC7Afd9DcVqCG6iklOtd8gzgkRap
 LIpg==
X-Gm-Message-State: AOAM5328sIdNuhpwXFloLgdWClyvZIrpEJQ/e1Cft0oX9VstwrnUe3IC
 5sy2+/Vmx7TbN1JgNhPoPYsK6YBe26mpgbgZlCgXelqapUog
X-Google-Smtp-Source: ABdhPJyIdR2IpSoaS+ZJXlVx5Fzsmf7Slk+cMg4U2DAEwIy+JEtW6jamlvFI5GIp6I8WEWSshVAwBFPRLSFLcMM3VHUgcDZ7hNq0
MIME-Version: 1.0
X-Received: by 2002:a92:dd82:: with SMTP id g2mr14479298iln.279.1629474307681; 
 Fri, 20 Aug 2021 08:45:07 -0700 (PDT)
Date: Fri, 20 Aug 2021 08:45:07 -0700
In-Reply-To: <0000000000008a7a1c05c9e53c87@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000047b52b05c9ff8d0b@google.com>
Subject: Re: [syzbot] WARNING in drm_gem_shmem_vm_open
From: syzbot <syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com>
To: airlied@linux.ie, christian.koenig@amd.com, daniel.vetter@ffwll.ch, 
 daniel.vetter@intel.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig-owner@lists.linaro.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, melissa.srw@gmail.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Fri, 20 Aug 2021 15:47:16 +0000
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

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=11c31d55300000
start commit:   614cb2751d31 Merge tag 'trace-v5.14-rc6' of git://git.kern..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=13c31d55300000
console output: https://syzkaller.appspot.com/x/log.txt?x=15c31d55300000
kernel config:  https://syzkaller.appspot.com/x/.config?x=96f0602203250753
dashboard link: https://syzkaller.appspot.com/bug?extid=91525b2bd4b5dff71619
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=122bce0e300000

Reported-by: syzbot+91525b2bd4b5dff71619@syzkaller.appspotmail.com
Fixes: ea40d7857d52 ("drm/vkms: fbdev emulation support")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
