Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 533154F6D1D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 23:41:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A2B10E0AD;
	Wed,  6 Apr 2022 21:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A72910E0A0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 21:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649281254;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HYliOFP5D5aEhYg/JNms+LtE3G2AOKbcjH7HxyHb8vw=;
 b=c3UiYnr089Pak7KwbEIRyiYLHx0gToFiyDR9+mB7zG4K26F7yC20vXsK755+DhO44ztnzX
 fPfMgBNrZkZhxENiBDPQZFFOEBfiq2I7Qguxo0+Oik22zWf4+crUNqFkE5mgBlyji61wLm
 QQTiFtNEzwYyNFYNHuMqPc2MwbLsUKE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-491-SR6-Z5SmOC6ZlHxFAVh-xA-1; Wed, 06 Apr 2022 17:40:51 -0400
X-MC-Unique: SR6-Z5SmOC6ZlHxFAVh-xA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m35-20020a05600c3b2300b0038c90ef2dceso3537936wms.4
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 14:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HYliOFP5D5aEhYg/JNms+LtE3G2AOKbcjH7HxyHb8vw=;
 b=eW4Ccl8pMt7LWz+oBMPvs8fbMfNTkjOCkPb9vXHdKsTW5kYGjsBOZvH4UOnLWgm6q2
 9VouKKkT3oM3zf79ZdKd4rGumjRHZy/jLePgIl30CctpU/UFHBoHlxFkUIdeaJ6BiSJC
 pFz5W3ca4gSMalV0bv/mNaREuaOxS/nSe8lJQrXgsWoqQidkq7q5f57avCB4HLe2okDv
 Phfu26tsxk6bdFjYXUekzXpVINmRZFwqW3VOSdF6PxArgWbNry8dEQE1S/J1ANxltGLh
 mTAfAzKcZZaHmmQPCclBe5VNK6inoAMPkhOKEVhSj4OjEM9DC3xbWwLNr3uk+xlXGHDF
 AzIA==
X-Gm-Message-State: AOAM531HAnvFmRqMJXaOHlG0782S5nrX0vxSIl8fmUQ/D30zLX2+VkGo
 vVnf5bIkdYKyZABC/makjXVDY6llXSAAX7n7dZh+AM/u9l4dyv6JUdXvJbdxbpsd97RQSQG9NyB
 XLotD2UU4HLCU/RYODr+iBgsivj75
X-Received: by 2002:a7b:c111:0:b0:38e:7077:e650 with SMTP id
 w17-20020a7bc111000000b0038e7077e650mr9147324wmi.114.1649281250345; 
 Wed, 06 Apr 2022 14:40:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz6hhwgShELHlodQTRxrKt29AWUJxRNlWgookBuUhICSyykfZrbEYfYfVmqPCNphwSJ5AP/dw==
X-Received: by 2002:a7b:c111:0:b0:38e:7077:e650 with SMTP id
 w17-20020a7bc111000000b0038e7077e650mr9147307wmi.114.1649281250073; 
 Wed, 06 Apr 2022 14:40:50 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 o29-20020a05600c511d00b0038e3532b23csm5876020wms.15.2022.04.06.14.40.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Apr 2022 14:40:49 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH 0/5] Fix some race conditions that exists between
 fbmem and sysfb
Date: Wed,  6 Apr 2022 23:39:14 +0200
Message-Id: <20220406213919.600294-1-javierm@redhat.com>
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
Cc: Miaoqian Lin <linmq006@gmail.com>, Zheyu Ma <zheyuma97@gmail.com>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Zhen Lei <thunder.leizhen@huawei.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 Peter Jones <pjones@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>, Borislav Petkov <bp@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[ resend since dri-devel wasn't Cc'ed on all patches, sorry for the noise ]

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

This series attempt to fix it more properly and reverted the mentioned
hack. This will also unblock a pending patch to not make num_registered_fb
visible to drivers anymore, since that's really internal to fbdev core.

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

I'm sending as an RFC since there are many changes to the locking scheme
and that is always tricky to get right. Please let me know what you think.

Best regards,
Javier


Daniel Vetter (1):
  Revert "fbdev: Prevent probing generic drivers if a FB is already
    registered"

Javier Martinez Canillas (4):
  firmware: sysfb: Make sysfb_create_simplefb() return a pdev pointer
  firmware: sysfb: Add helpers to unregister a pdev and disable
    registration
  fbdev: Restart conflicting fb removal loop when unregistering devices
  fbdev: Fix some race conditions between fbmem and sysfb

 drivers/firmware/sysfb.c          | 51 ++++++++++++++++++++++++++-----
 drivers/firmware/sysfb_simplefb.c | 24 +++++++++------
 drivers/video/fbdev/core/fbmem.c  | 38 ++++++++++++++++++-----
 drivers/video/fbdev/efifb.c       | 11 -------
 drivers/video/fbdev/simplefb.c    | 11 -------
 include/linux/fb.h                |  1 -
 include/linux/sysfb.h             | 29 +++++++++++++++---
 7 files changed, 112 insertions(+), 53 deletions(-)

-- 
2.35.1

