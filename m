Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD49D50841F
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 10:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3A610F218;
	Wed, 20 Apr 2022 08:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9BE010F216
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 08:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650444796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E0YhsAgzYjv+lmX1BaJJCZkRLt/I7LvOa39GZEIhqUY=;
 b=MQzzijLkLSyfXDbk4/rrT8ByJ7Mv45KeXTKUxj3A0di1f6ytJn2525rTlvGM7zKfY9D9ht
 7FYyrProi4ZBV5XADBGZ2s+gVARtv1/8p1fxDNpfUMy8BKpGHS4KOQf5cfzprRFOfr2zU+
 Z1acyeDMaVsu1vydggqL4kIqHQMzo6o=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-9bJx6AgDMTeY1Hg8exy6Mw-1; Wed, 20 Apr 2022 04:53:15 -0400
X-MC-Unique: 9bJx6AgDMTeY1Hg8exy6Mw-1
Received: by mail-wm1-f72.google.com with SMTP id
 m125-20020a1c2683000000b00391893a2febso637604wmm.4
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 01:53:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E0YhsAgzYjv+lmX1BaJJCZkRLt/I7LvOa39GZEIhqUY=;
 b=nLPggh7qgaEI5PdZ69UuiGD4ts2OWX4jQQ7mXgyvbce3/5l3Ztuk8FKCRVs0RKNkrv
 CH2aU0lAMJUMokWsTymMRtzNLdHVWZTQE6kqd02zqHe2VjPC9AOvEeh0k2YSZ3cb8wpl
 RK87ABtb+WUCTRmSmK5UTpLc/Dw0JuGucGy14zRwyyHZ/epTqtfzIhatVdz9oIwOjWRX
 l+/HDfRc2RHQ86vRR6MeK/MeTeFpLTfYnZsSNxGBdcxJf4fTcw0lOYokmYe/rICLftxF
 QKUH5L6ODEiRC/UWOS+yPbvBkEzRZWsxRvJZwWvnSYeWIzQ4nb65EQkMMJfFTTUV/jLr
 TqbQ==
X-Gm-Message-State: AOAM530pK6852aT3diJ8e21s9Xd2vlTtXeHsdDCRhOuFqEiz82AYCgTW
 9a+ZwLDvBEpFha3TnXeLEmEPBfhva4UvQZFkFQaKsknJKSWzNS7LEUeR5ITVycY2xC6Cbw7Y5+B
 jmeeQV42gyGeQZZ5oSKzk4+cXp0K1
X-Received: by 2002:a1c:f018:0:b0:37b:c13c:3128 with SMTP id
 a24-20020a1cf018000000b0037bc13c3128mr2496887wmb.157.1650444794362; 
 Wed, 20 Apr 2022 01:53:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxheIU3MZtHSmbm2S30h9XB//sGVs+fBzUrdX6TE0Ye/x/JWHfdB5GuD6LrNgo08kTzLr689Q==
X-Received: by 2002:a1c:f018:0:b0:37b:c13c:3128 with SMTP id
 a24-20020a1cf018000000b0037bc13c3128mr2496874wmb.157.1650444794081; 
 Wed, 20 Apr 2022 01:53:14 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a0560001ace00b0020aac00f862sm1895343wry.98.2022.04.20.01.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 01:53:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] Fix some race conditions that exists between fbmem and
 sysfb
Date: Wed, 20 Apr 2022 10:52:58 +0200
Message-Id: <20220420085303.100654-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Zhen Lei <thunder.leizhen@huawei.com>, linux-doc@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Yizhuo Zhai <yzhai003@ucr.edu>,
 Hans de Goede <hdegoede@redhat.com>, linux-fbdev@vger.kernel.org,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Alex Deucher <alexander.deucher@amd.com>, Johan Hovold <johan@kernel.org>,
 Borislav Petkov <bp@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

The patches in this series are mostly changes suggested by Daniel Vetter
to fix some race conditions that exists between the fbdev core (fbmem)
and sysfb with regard to device registration and removal.

For example, it is currently possible for sysfb to register a platform
device after a real DRM driver was registered and requested to remove the
conflicting framebuffers.

A symptom of this issue, was worked around with by commit fb561bf9abde
("fbdev: Prevent probing generic drivers if a FB is already registered")
but that's really a hack and should be reverted.

This series attempt to fix it more properly and revert the mentioned hack.
That will also unblock a pending patch to not make the num_registered_fb
variable visible to drivers anymore, since that's internal to fbdev core.

Patch #1 is just a trivial preparatory change.

Patch #2 add sysfb_disable() and sysfb_try_unregister() helpers for fbmem
to use them.

Patch #3 changes how is dealt with conflicting framebuffers unregistering,
rather than having a variable to determine if a lock should be take, it
just drops the lock before unregistering the platform device.

Patch #4 fixes the mentioned race conditions and finally patch #5 is the
revert patch that was posted by Daniel before but he dropped from his set.

The patches were tested on a rpi4 using different video configurations:
(simpledrm -> vc4 both builtin, only vc4 builtin, only simpledrm builtin
and simpledrm builtin with vc4 built as a module).

Best regards,
Javier

Changes in v3:
- Rebase on top of latest drm-misc-next branch.

Changes in v2:
- Rebase on top of latest drm-misc-next and fix conflicts (Daniel Vetter).
- Add kernel-doc comments and include in other_interfaces.rst (Daniel Vetter).
- Explain in the commit message that fbmem has to unregister the device
  as fallback if a driver registered the device itself (Daniel Vetter).
- Also explain that fallback in a comment in the code (Daniel Vetter).
- Don't encode in fbmem the assumption that sysfb will always register
  platform devices (Daniel Vetter).
- Add a FIXME comment about drivers registering devices (Daniel Vetter).
- Drop RFC prefix since patches were already reviewed by Daniel Vetter.
- Add Daniel Reviewed-by tags to the patches.

Daniel Vetter (1):
  Revert "fbdev: Prevent probing generic drivers if a FB is already
    registered"

Javier Martinez Canillas (4):
  firmware: sysfb: Make sysfb_create_simplefb() return a pdev pointer
  firmware: sysfb: Add helpers to unregister a pdev and disable
    registration
  fbdev: Restart conflicting fb removal loop when unregistering devices
  fbdev: Fix some race conditions between fbmem and sysfb

 .../driver-api/firmware/other_interfaces.rst  |  6 ++
 drivers/firmware/sysfb.c                      | 77 +++++++++++++++++--
 drivers/firmware/sysfb_simplefb.c             | 16 ++--
 drivers/video/fbdev/core/fbmem.c              | 62 ++++++++++++---
 drivers/video/fbdev/efifb.c                   | 11 ---
 drivers/video/fbdev/simplefb.c                | 11 ---
 include/linux/fb.h                            |  1 -
 include/linux/sysfb.h                         | 29 +++++--
 8 files changed, 158 insertions(+), 55 deletions(-)

-- 
2.35.1

