Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDDF514480
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 10:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B296710F981;
	Fri, 29 Apr 2022 08:43:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 053C210FC87
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 08:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651221793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=O+D/lXpklfq+8wvoJL4WqSLyZYHeykKORq3ghDDfCNk=;
 b=RN9r+OlsnRvDMnCU8jH7f1JOrhCHJtZUBjarzfIIm8EWz59Jy/aOzgbzhD9P1qdJPOvoks
 PQQ2hEAQ0v0nlYIobM2bSSerN0lTcyXkswT/sJbGNkAqEak+BbeIpOZ11yiScc8PIbZ3UJ
 Bs0MJUkIkTCSTazFwmsqCkGpBtF/XhY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-639-o7kUYd29OG-6fBoiMv9M6w-1; Fri, 29 Apr 2022 04:43:08 -0400
X-MC-Unique: o7kUYd29OG-6fBoiMv9M6w-1
Received: by mail-wm1-f70.google.com with SMTP id
 v191-20020a1cacc8000000b0038ce818d2efso2714773wme.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 01:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O+D/lXpklfq+8wvoJL4WqSLyZYHeykKORq3ghDDfCNk=;
 b=IpSpXfqf+uQoi1lxMi3unkJ074MKVdJGsFZL8aYbq2EARESBzOTVPu/PARDnhItNPq
 tYJ/OWFotlukx/LB1znShBxlEBE3c91qZEaTfHpXh/8vBp9WiC2FE+OqWPm+jk+L2LT7
 5SSDW2U9LsC1UYQcK9Mrp7tfSOf7buxUj3X9yB1gFzN4pDTqiKcjuf7/CkdxoJ5IabBI
 nz04fc0tkEoG7l3nXqOOmBYjkCJlKZMl86K1IdHwqHFnlRid/e7HPGx3JrSniTa8xnBR
 737Y7rDBYhNQZTBC9kUaQaSNKodrmFKuwqvqUxfxIoEPLiII/kmSb+ed4Ai+0kZ1RuZm
 WB5g==
X-Gm-Message-State: AOAM531dtRRqwYClwNnqrlWg8awEbF6R5Ln5QpylMdXYxjJ+susiQAff
 Fz4o0ZnlJARf8xDidoQr21OVZCHjFoUB2h5jJnwk0tnBVMugpG8JQA5OXBOieLTHbNF0scQzxRW
 CFEdylDN9UM68ZgVYj1TvjLb3IpIC
X-Received: by 2002:a05:600c:1f0e:b0:392:8b04:9b26 with SMTP id
 bd14-20020a05600c1f0e00b003928b049b26mr2125578wmb.106.1651221786806; 
 Fri, 29 Apr 2022 01:43:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFPu5i9uIaA8HyARC22sqTOXWCEAPFZw0X8BSM+9g/zQpViY352JC38fzukmqcZeLoqR+Pfw==
X-Received: by 2002:a05:600c:1f0e:b0:392:8b04:9b26 with SMTP id
 bd14-20020a05600c1f0e00b003928b049b26mr2125550wmb.106.1651221786551; 
 Fri, 29 Apr 2022 01:43:06 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a05600c4e8700b00393f1393abfsm7199256wmq.41.2022.04.29.01.43.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 01:43:06 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v4 00/11] Fix some race between sysfb device registration
 and drivers probe
Date: Fri, 29 Apr 2022 10:42:42 +0200
Message-Id: <20220429084253.1085911-1-javierm@redhat.com>
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
Cc: Miaoqian Lin <linmq006@gmail.com>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Peter Jones <pjones@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jonathan Corbet <corbet@lwn.net>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, Borislav Petkov <bp@suse.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Changcheng Deng <deng.changcheng@zte.com.cn>, Johan Hovold <johan@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, Zhen Lei <thunder.leizhen@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

The patches in this series contain mostly changes suggested by Daniel Vetter
Thomas Zimmermann. They aim to fix existing races between the Generic System
Framebuffer (sysfb) infrastructure and the fbdev and DRM device registration.

For example, it is currently possible for sysfb to register a platform
device after a real DRM driver was registered and requested to remove the
conflicting framebuffers. Or is possible for a simple{fb,drm} to match with
a device previously registered by sysfb, even after a real driver is present.

A symptom of this issue, was worked around with by commit fb561bf9abde
("fbdev: Prevent probing generic drivers if a FB is already registered")
but that's really a hack and should be reverted.

This series attempt to fix it more correctly and revert the mentioned hack.
That will also allow to make the num_registered_fb variable not visible to
drivers anymore, since that's internal to fbdev core.

Even though the series is a v4, I've marked it as RFC again since some of
the patches are controversial and the approach will need more discussion.

Patches 1-3 add a new DRIVER_FIRMWARE capability to denote that a DRM driver
uses a firmware provided framebuffer, to mark the emulated fbdev registered
also as a firmware provided framebuffer.

Pach 4 is just a simple cleanup in preparation for later patches.

Patch 5 add a sysfb_disable() and sysfb_try_unregister() helpers to allow
disabling sysfb and attempt to unregister registered devices respectively.

Patch 6 changes how is dealt with conflicting framebuffers unregistering,
rather than having a variable to determine if a lock should be take, it
just drops the lock before unregistering the platform device.

Patch 7 changes the fbdev core to not attempt to unregister devices that
were registered by sysfb, let the same code doing the registration to also
handle the unregistration.

Patch 8 fixes the race that exists between sysfb devices registration and
fbdev framebuffer devices registration.

Patch 9 does the same but to fix the race that exists between sysfb and
the DRM subsystem.

Patch 10 is the revert patch that was posted by Daniel before but dropped
from his set and finally patch 11 is the one that makes num_registered_fb
private to fbmem.c and not allow drivers to use it anymore.

The patches were tested on a rpi4 with the vc4, simpledrm and simplefb
drivers, using different combinations of built-in and as a module. But
being an RFC, I didn't test all possible cases.

Best regards,
Javier

Changes in v4:
- Make sysfb_disable() to also attempt to unregister a device.
- Drop call to sysfb_disable() in fbmem since is done in other places now.
- Add patch to make registered_fb[] private.
- Add patches that introduce the DRM_FIRMWARE capability and usage.

Changes in v3:
- Add Thomas Zimmermann's Reviewed-by tag to patch #1.
- Call sysfb_disable() when a fbdev framebuffer is registered rather
  than when conflicting framebuffers are removed (Thomas Zimmermann).
- Drop Daniel Vetter's Reviewed-by tag since patch changed a lot.
- Call sysfb_disable() when a DRM device is registered rather than
  when conflicting framebuffers are removed (Thomas Zimmermann).
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
- Explain in the commit message that fbmem has to unregister the device
  as fallback if a driver registered the device itself (Daniel Vetter).
- Also explain that fallback in a comment in the code (Daniel Vetter).
- Don't encode in fbmem the assumption that sysfb will always register
  platform devices (Daniel Vetter).
- Add a FIXME comment about drivers registering devices (Daniel Vetter).
- Drop RFC prefix since patches were already reviewed by Daniel Vetter.
- Add Daniel Reviewed-by tags to the patches.

Daniel Vetter (2):
  Revert "fbdev: Prevent probing generic drivers if a FB is already
    registered"
  fbdev: Make registered_fb[] private to fbmem.c

Javier Martinez Canillas (9):
  drm: Add a capability flag for simple framebuffer drivers
  drm/fb-helper: Set FBINFO_MISC_FIRMWARE flag for DRIVER_FIRMWARE fb
  drm/simpledrm: Set the DRM_FIRMWARE capability
  firmware: sysfb: Make sysfb_create_simplefb() return a pdev pointer
  firmware: sysfb: Add helpers to unregister a pdev and disable
    registration
  fbdev: Restart conflicting fb removal loop when unregistering devices
  fbdev: Make sysfb to unregister its own registered devices
  fbdev: Fix race between sysfb and framebuffer devices registration
  drm: Fix race between sysfb and DRM devices registration

 .../driver-api/firmware/other_interfaces.rst  |  6 ++
 drivers/firmware/sysfb.c                      | 91 +++++++++++++++++--
 drivers/firmware/sysfb_simplefb.c             | 16 ++--
 drivers/gpu/drm/drm_drv.c                     | 12 +++
 drivers/gpu/drm/drm_fb_helper.c               |  4 +
 drivers/gpu/drm/tiny/simpledrm.c              |  2 +-
 drivers/video/fbdev/core/fbmem.c              | 67 +++++++++++---
 drivers/video/fbdev/efifb.c                   | 11 ---
 drivers/video/fbdev/simplefb.c                | 11 ---
 include/drm/drm_drv.h                         |  6 ++
 include/linux/fb.h                            |  8 +-
 include/linux/sysfb.h                         | 29 +++++-
 12 files changed, 201 insertions(+), 62 deletions(-)

-- 
2.35.1

