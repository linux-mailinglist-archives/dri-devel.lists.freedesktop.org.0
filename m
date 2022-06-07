Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F30540ACE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 20:24:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9824410F28F;
	Tue,  7 Jun 2022 18:23:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B8510F26F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 18:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654626235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hkQx7yHQRkPbdTnula/SBJrpw+Sj9SwG2uOeS/prAHE=;
 b=QyCWwQhMiN7UTmQQwvO2lyTQKGF5gJdqeKaleIsHzFzUcf7ivUeUs0Lr9ST8XZkoJhp/WC
 FEbGCqc2odg6g/LtyHFvebJojOlfrwmSjfhYqnFH1vdIOy3qd2NtTnkXLNgUlBEV54U2Vj
 4iCu6ASIZu4C1gTG3NQx/DKQv/xDuj0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-kpLzEo30OYqPWFmpdnOJ1Q-1; Tue, 07 Jun 2022 14:23:46 -0400
X-MC-Unique: kpLzEo30OYqPWFmpdnOJ1Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 c125-20020a1c3583000000b003978decffedso13095105wma.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 11:23:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hkQx7yHQRkPbdTnula/SBJrpw+Sj9SwG2uOeS/prAHE=;
 b=ECjIiO6d/G+KTzqM1XkS4YyrzmpCZm/PTA6T4qTV0yrUEQPme7iB68t6C1cBfRRg0p
 JYYUj+iAEC+xJX99YK9hi2ZKpFYktOes34bu5XTbro3Z3INbzQWOYOBVKCvholzWDv0n
 FMaYcgPO8MEYgV82r0vHJlfhJll81jDxpKth1iWi8a/jtBO3gzCsKVMNaHAEJdnA+vs4
 rn37LL0Aw6HUiyhDYGYJHisLu3QGfOcAHgnOqf3mvqsRjR3amIF2SMJbxg8FDMZv+clz
 vEqdRezCRz06f7CsunRc1mHfAZHUyvmXbeuPULNodYWJ/38P1l6/e15z+/Bdv1z+eRN8
 w24w==
X-Gm-Message-State: AOAM532LJBwfFHJZyeCBgfPaqTH53RnwKJMo/lsawAaqNxYNRb300apY
 LK2V4K6fQdlULrqJpLjJJdK07iedsAmANee9Fhe09qDcUyWs9aX+g+xC8DfWeD3SHxwN+uazzYe
 FZbFI7/O+I/rXzfUrrs0RGgCk3vV8
X-Received: by 2002:a05:6000:18aa:b0:210:eef2:1137 with SMTP id
 b10-20020a05600018aa00b00210eef21137mr29273089wri.134.1654626224717; 
 Tue, 07 Jun 2022 11:23:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxN4w6wiLjoJYUQMubo1fIcQNXev6xL+517nU/KlMZgD8bGIW170MGyDzMCn47TwhWHZ6WTgQ==
X-Received: by 2002:a05:6000:18aa:b0:210:eef2:1137 with SMTP id
 b10-20020a05600018aa00b00210eef21137mr29273059wri.134.1654626224460; 
 Tue, 07 Jun 2022 11:23:44 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m8-20020a05600c4f4800b003942a244f51sm28267502wmq.42.2022.06.07.11.23.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 11:23:44 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/5] Fix some races between sysfb device registration and
 drivers probe
Date: Tue,  7 Jun 2022 20:23:33 +0200
Message-Id: <20220607182338.344270-1-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-doc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Jones <pjones@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Laszlo Ersek <lersek@redhat.com>
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

A symptom of this issue, was worked around with the commit fb561bf9abde
("fbdev: Prevent probing generic drivers if a FB is already registered")
but that's really a hack and should be reverted instead.

This series attempt to fix it more correctly and revert the mentioned hack.
That will also allow to make the num_registered_fb variable not visible to
drivers anymore, since that's internal to fbdev core.

Pach 1 is just a simple cleanup in preparation for later patches.

Patch 2 add a sysfb_disable() helper to allow disabling sysfb and unregister
devices registered by sysfb.

Patch 3 fixes the race that exists between sysfb devices registration and
fbdev framebuffer devices registration, by disabling the sysfb when a DRM
or fbdev driver requests to remove conflicting framebuffers.

Patch 4 is the revert patch that was posted by Daniel before but dropped
from his set and finally patch 5 is the one that makes num_registered_fb
private to fbmem.c, to not allow drivers to use it anymore.

The patches were tested on a rpi4 with the vc4, simpledrm and simplefb
drivers, using different combinations of built-in and as a module.

Best regards,
Javier

Changes in v6:
- Drop sysfb_try_unregister() helper since is no longer needed.
- Move the sysfb_disable() before the remove conflicting framebuffers
  loop (Daniel Vetter).
- Drop patch "fbdev: Make sysfb to unregister its own registered devices"
  since was no longer needed.

Changes in v5:
- Move the sysfb_disable() call at conflicting framebuffers again to
  avoid the need of a DRIVER_FIRMWARE capability flag.
- Add Daniel Vetter's Reviewed-by tag again since reverted to the old
  patch that he already reviewed in v2.
- Drop patches that added a DRM_FIRMWARE capability and use them
  since the case those prevented could be ignored (Daniel Vetter).

Changes in v4:
- Make sysfb_disable() to also attempt to unregister a device.
- Add patch to make registered_fb[] private.
- Add patches that introduce the DRM_FIRMWARE capability and usage.

Changes in v3:
- Add Thomas Zimmermann's Reviewed-by tag to patch #1.
- Call sysfb_disable() when a DRM dev and a fbdev are registered rather
  than when conflicting framebuffers are removed (Thomas Zimmermann).
- Call sysfb_disable() when a fbdev framebuffer is registered rather
  than when conflicting framebuffers are removed (Thomas Zimmermann).
- Drop Daniel Vetter's Reviewed-by tag since patch changed a lot.
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

Daniel Vetter (2):
  Revert "fbdev: Prevent probing generic drivers if a FB is already
    registered"
  fbdev: Make registered_fb[] private to fbmem.c

Javier Martinez Canillas (3):
  firmware: sysfb: Make sysfb_create_simplefb() return a pdev pointer
  firmware: sysfb: Add sysfb_disable() helper function
  fbdev: Disable sysfb device registration when removing conflicting FBs

 .../driver-api/firmware/other_interfaces.rst  |  6 ++
 drivers/firmware/sysfb.c                      | 58 ++++++++++++++++---
 drivers/firmware/sysfb_simplefb.c             | 16 ++---
 drivers/video/fbdev/core/fbmem.c              | 20 ++++++-
 drivers/video/fbdev/efifb.c                   | 11 ----
 drivers/video/fbdev/simplefb.c                | 11 ----
 include/linux/fb.h                            |  7 +--
 include/linux/sysfb.h                         | 23 ++++++--
 8 files changed, 103 insertions(+), 49 deletions(-)

-- 
2.36.1

