Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285847E5971
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 15:46:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D0110E78D;
	Wed,  8 Nov 2023 14:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CD610E78D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 14:46:05 +0000 (UTC)
Received: by mail-oi1-f200.google.com with SMTP id
 5614622812f47-3b3edaef525so10091558b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Nov 2023 06:46:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699454764; x=1700059564;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eyg+x1sdBdUCTK9dEOdpm/i8Z98iZDIp/TYoaCFtNfI=;
 b=HbQFljvpAcoKYlLiLHb2KV7g2ZhlSRL5BZszMj9vDqEeaDbD0gB+XriMNyeN2A/5Ul
 14qbf/drhqVbIkOOOPlBGl+DMClQ6jHIPXjqcMfQ/sSE50p1jPiR8bopCAR+FJ7bN80U
 v4f9gWm2ma98BYodgJ55bkYo2q5HCM2h5umMz3I1YeAyu4tt7q5vNp4jF681XAQzJYC9
 J+ST1qRRk/aezR/TIykZU6WDbE1Jn1OtC8Mk/I16rtjdwYlDmslJzmxeKf5fieeVr/xV
 brNtkhCWMeN45zt/DJBlRE1Svv+Sr30zhSUPYo5hGDNgqWkmsw/WNdTPp9aMleJ55Zum
 80Fg==
X-Gm-Message-State: AOJu0Yxa9rpPtym4reuveXN1/sx/PcOPMApiF7jP71etm5WqX4xwAci7
 6lIC+1EawpjsU3TaceeIGJ1dXHmFvtHydkWQriOfZ42cemDZ
X-Google-Smtp-Source: AGHT+IHYVbPqVKNGXu+BvwkE/pRq1+khXE9q8J8tLhTwkKxlwRoFhUls2Br/4J25UUlY0OHXWCPFT/tsDkP8SnIUAsiU7jVq8Mz6
MIME-Version: 1.0
X-Received: by 2002:a05:6808:138d:b0:3a7:86b2:1950 with SMTP id
 c13-20020a056808138d00b003a786b21950mr789798oiw.0.1699454764313; Wed, 08 Nov
 2023 06:46:04 -0800 (PST)
Date: Wed, 08 Nov 2023 06:46:04 -0800
In-Reply-To: <0000000000002a4da90603a5cbbf@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000089f4110609a525b2@google.com>
Subject: Re: [syzbot] [dri?] kernel BUG in vmf_insert_pfn_prot (2)
From: syzbot <syzbot+398e17b61dab22cc56bc@syzkaller.appspotmail.com>
To: airlied@gmail.com, airlied@linux.ie, christian.koenig@amd.com, 
 daniel.vetter@ffwll.ch, daniel.vetter@intel.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, hdanton@sina.com, 
 linaro-mm-sig-bounces@lists.linaro.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 sumit.semwal@linaro.org, syzkaller-bugs@googlegroups.com, tzimmermann@suse.de
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

commit 45d9c8dde4cd8589f9180309ec60f0da2ce486e4
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu Aug 12 13:14:12 2021 +0000

    drm/vgem: use shmem helpers

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=126094df680000
start commit:   d2f51b3516da Merge tag 'rtc-6.7' of git://git.kernel.org/p..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=116094df680000
console output: https://syzkaller.appspot.com/x/log.txt?x=166094df680000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1ffa1cec3b40f3ce
dashboard link: https://syzkaller.appspot.com/bug?extid=398e17b61dab22cc56bc
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16344918e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=156bb2c0e80000

Reported-by: syzbot+398e17b61dab22cc56bc@syzkaller.appspotmail.com
Fixes: 45d9c8dde4cd ("drm/vgem: use shmem helpers")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
