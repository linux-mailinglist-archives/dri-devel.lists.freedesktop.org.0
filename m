Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB854966C12
	for <lists+dri-devel@lfdr.de>; Sat, 31 Aug 2024 00:09:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF5F10E818;
	Fri, 30 Aug 2024 22:08:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PiUii/6J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847A510E21F
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 15:21:55 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id
 e9e14a558f8ab-39d30f0f831so6889615ab.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 08:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725031315; x=1725636115; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jwcy2RWpl0Jy35HmMik2lryKjWDim5fRSydnX94H64Q=;
 b=PiUii/6JjvQuGXDoelPd5Keh2EqkIJy1i/FsSkMg+eg93AEW85LpdkkXB4C+qYg/Rc
 et+y6wKCRyCFi3xk3vCwPCb7nmMK8F0pLOuxjMIbWqfjnli1WDViFY4dYBY/mmm2EEaK
 lL7R/oPALBnre/4r4qSEtNREdUAvZ2kDIU6AVHVkkcd2Yjx4RwFfVw/CwDw4LdZhx69w
 5k+DcTMi2YnhjrsjjSnNDCzSgFQzauAXdrqQuxCLizOezWkjNGxP7JmAMC4uvqMT6j27
 syC0Yl5bRy+1/c7kbjlVb/Ks2fRqkAtkSXCFLPGxEQOAoKo0vyHrk/mcT4yOJ/+K61gX
 zwPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725031315; x=1725636115;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jwcy2RWpl0Jy35HmMik2lryKjWDim5fRSydnX94H64Q=;
 b=cBynFLsHcRXfReJI/QEJ2MUIuVkJISIUr+KQrcB7Le/tP3pWOvD8YbVT/OjULECo0E
 D36q7FFLQKOr6/LahuHMDd+WnPdDLgxRH7MVWZ9uf/7/ypvkifAArsaym8Fr/iZq5YAT
 B9SC6/f4Ko3PFsBX3Hsuj2NW8P5g7sbBtpF3Omuao9LTH3skwnhFHKxdLsXb23Z2FK1J
 NSAThZg5ydhUK+b4/5YYJzVSrFgV57lTEuJ7b5/pjK/HKpZ0vNp81Imf1seVsdJ4lEjI
 GhR85HK5/he2PUb3ry8y1PZZ0dqvQkEKd38C7hOuQ6bmOmtAelMSE4pXaNG1cDq8dvra
 1zZg==
X-Gm-Message-State: AOJu0YxIHI7eF5ZzZzGGY82so2zqVr9YIlRJfDg2aOF3jcNXx/LOLtKg
 Tpsi1+lwoKm9NmNRp2RD72b/nNTnwg4hwhmgesOVR2MOVFNxlOc+
X-Google-Smtp-Source: AGHT+IE6+7F4IwUjoUpungdPIgK7N7zKDEIZ0Pa/PFwI4Lam2pC3QvZ+yFwkBy87CRSIvERTOe7b3Q==
X-Received: by 2002:a05:6e02:1d04:b0:39d:286c:5b72 with SMTP id
 e9e14a558f8ab-39f378acb8emr64753255ab.28.1725031314408; 
 Fri, 30 Aug 2024 08:21:54 -0700 (PDT)
Received: from localhost.localdomain (174-20-195-90.mpls.qwest.net.
 [174.20.195.90]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-39f3af97203sm8826155ab.1.2024.08.30.08.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 08:21:53 -0700 (PDT)
From: Shimrra Shai <shimrrashai@gmail.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, hjc@rock-chips.com, heiko@sntech.de,
 andy.yan@rock-chips.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, markyao0591@gmail.com, s.hauer@pengutronix.de
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, aarnoud@me.com, ldearquer@gmail.com,
 algea.cao@rock-chips.com, cristian.ciocaltea@collabora.com,
 Shimrra Shai <shimrrashai@gmail.com>
Subject: [PATCH v5? 0/6] Tweaked basic Synopsys DW HDMI QP TX driver for
 Rockchip RK3588
Date: Fri, 30 Aug 2024 10:21:24 -0500
Message-ID: <20240830152132.8894-1-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 30 Aug 2024 22:08:56 +0000
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

Hi,

I saw Cristian Ciocaltea's proposed basic driver for the Synopsys DW
HDMI QP transmit (TX) facility on the Rockchip RK3588 and noticed that
it had seen some critique and thought I'd help it along a little by
making some of the changes that others had suggested in the discussion
thread. This package is mostly like his(?) original but features the
following changes suggested by Conor Dooley and Heiko Stuebner:

 * Documentation for the device tree bindings specifies the various
   clocks explicitly in both the general (synopsys,dw-hdmi-qp.yaml)
   and Rockchip-specific (rockchip,rk3588-dw-hdmi-qp.yaml) files.
 * Changed the compatibles for the RK3588 VO0 and VO1 GRFs in the
   Device Trees (rk3588-base.dtsi) to reflect their different natures.

and some of my own changes:

 * Tweaked the driver code slightly - mostly organizational, but also
   added a mutex around device access in the dw_hdmi_qp_... method
   that was present in the downstream BSP driver which might have been
   necessary to prevent thread bugs.
 * Improved grammar & punctuation in some of the English on the
   Kconfigs and output messages.

Let me know how you like it. I hope this is suitable enough for kernel
integration as I'd really like to be able to get some of the newest
kernels having video bringup out of the box. I'm testing and
developing on the Firefly ITX-3588J board; not sure if this will also
work on the Rock 5B too, as I don't have one, but since little was
done to the original driver I don't think it should break anything.
Moreover, I wanna get the device tree bindings nailed on this point
because I'd like to prepare a UEFI firmware package for this board
that would be capable of booting mainline kernels from this (or a
soon-to-be) version onward, without needing a separate device tree
file with the kernel, like a "proper" PC. That naturally implies
having at least all basic desktop functionality down, including video
output, before the DT is "baked" into the firmware.

- Shimrra Shai

Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
---
Link to Cristian's original w/previous versions' history: https://lore.kernel.org/linux-rockchip/20240819-b4-rk3588-bridge-upstream-v4-0-6417c72a2749@collabora.com/

Total changes:
 Documentation/devicetree/bindings/display/bridge/synopsys,dw-hdmi-qp.yaml          |  89 +++++++++++
 Documentation/devicetree/bindings/display/rockchip/rockchip,rk3588-dw-hdmi-qp.yaml | 171 ++++++++++++++++++++
 Documentation/devicetree/bindings/soc/rockchip/grf.yaml                            |   6 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi                                      |  44 ++++-
 drivers/gpu/drm/bridge/synopsys/Kconfig                                            |   8 +
 drivers/gpu/drm/bridge/synopsys/Makefile                                           |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c                                       | 780 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.h                                       | 834 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/rockchip/Kconfig                                                   |   9 ++
 drivers/gpu/drm/rockchip/Makefile                                                  |   1 +
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c                                     | 431 +++++++++++++++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c                                        |   2 +
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h                                        |   1 +
 include/drm/bridge/dw_hdmi_qp.h                                                    |  36 +++++
 14 files changed, 2409 insertions(+), 4 deletions(-)
