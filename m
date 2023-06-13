Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B588B72EBD7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jun 2023 21:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADAE10E0C8;
	Tue, 13 Jun 2023 19:23:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEFB10E0C8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 19:23:35 +0000 (UTC)
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-340664dfd94so11050635ab.2
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jun 2023 12:23:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686684214; x=1689276214;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EWR0nHL39obXZ4tJlQ5WVdz7nMKP7k+coo8SdN3K02E=;
 b=CVAiBG3enCPjamVbC+AcIBt4YLj7x9WCrwFRq+EsB2GM/TCxcPTYjqsbh9EUU4PDxT
 bAjFnmMoJ2whwnFaNixREjVHJFAj++hrgRp3HiuNgeB3Tnnk5yDB3gGU7gzr/j+1UjOw
 Ubl+DPxCZm0LcPZeewnCWTVV05GWBo11ZzR1uj0zbCOQT9GDOhYUcmLOXewYPCarDntz
 jsj+ZrHeFoviizOV7RWIgl+w/8KANEqeK27YunvZzwRUtril8Jap6Y78tPUyLwGX0nbP
 NJkaXH282sCnY9Cuw0mJb6VZwN9OBH3l4OE+p6MQ1EgaRSv707etaYOm5mDrpRaLzOjM
 8qiQ==
X-Gm-Message-State: AC+VfDw4uPIqGg4Obsl+myGINkLW94b9732zytFFkpqYIlIZ5tga3/n2
 PKmigesuvCAEPiOdjxhYDd+J9pc3nGvRRBiZz14rROf13ERX
X-Google-Smtp-Source: ACHHUZ5mm+7XBQyFXmAboSSa7oz3FdFPxuwVp/0Ka1gF66Q3bahA2vN1w+3xFfJxjFNUEWcjVOreDOitShpXj9ttEQQ5k5mP9vg1
MIME-Version: 1.0
X-Received: by 2002:a92:c948:0:b0:33e:7b40:18bd with SMTP id
 i8-20020a92c948000000b0033e7b4018bdmr5844858ilq.5.1686684214063; Tue, 13 Jun
 2023 12:23:34 -0700 (PDT)
Date: Tue, 13 Jun 2023 12:23:34 -0700
In-Reply-To: <000000000000fe7dd005cc2d77c0@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006d819905fe07c52f@google.com>
Subject: Re: [syzbot] kernel BUG in vmf_insert_pfn_prot
From: syzbot <syzbot+2d4f8693f438d2bd4bdb@syzkaller.appspotmail.com>
To: airlied@gmail.com, airlied@linux.ie, christian.koenig@amd.com, 
 daniel.vetter@ffwll.ch, daniel.vetter@intel.com, daniel@ffwll.ch, 
 dri-devel@lists.freedesktop.org, javierm@redhat.com, 
 linaro-mm-sig-owner@lists.linaro.org, linaro-mm-sig@lists.linaro.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 suijingfeng@loongson.cn, sumit.semwal@linaro.org, 
 syzkaller-bugs@googlegroups.com, tzimmermann@suse.de, zackr@vmware.com
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

syzbot suspects this issue was fixed by commit:

commit a5b44c4adb1699661d22e5152fb26885f30a2e4c
Author: Thomas Zimmermann <tzimmermann@suse.de>
Date:   Mon Mar 20 15:07:44 2023 +0000

    drm/fbdev-generic: Always use shadow buffering

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1025ee07280000
start commit:   0326074ff465 Merge tag 'net-next-6.1' of git://git.kernel...
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=d323d85b1f8a4ed7
dashboard link: https://syzkaller.appspot.com/bug?extid=2d4f8693f438d2bd4bdb
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14fd1182880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17567514880000

If the result looks correct, please mark the issue as fixed by replying with:

#syz fix: drm/fbdev-generic: Always use shadow buffering

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
