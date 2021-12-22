Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8B547CE38
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 09:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF57A1126C3;
	Wed, 22 Dec 2021 08:28:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD9E10F4D9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 08:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640161723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E4JXbmbKDkqfAMNbIkv/r6xGh5or/gMN+DXKn1vGRis=;
 b=BcRIfC/Fb0vUofEyunt+GN4JYY4MaqaSfBiOEDjT73jF4ps9M6g0peKTYgacxJZGoWeM/J
 DA2ErGz/d1iV7dFm09FOqSQkOU34QeURkzJ4LI3zZVXKzm1enHcpzzTJ+UDrx2vMgRgpzV
 90q6SILFbq5IewG9K5d+bZV+HMjRENI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-221-4iCDRy_xNrOA0R30L2JeDw-1; Wed, 22 Dec 2021 03:28:42 -0500
X-MC-Unique: 4iCDRy_xNrOA0R30L2JeDw-1
Received: by mail-wm1-f70.google.com with SMTP id
 g126-20020a1c2084000000b00345c1603997so359189wmg.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:28:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=E4JXbmbKDkqfAMNbIkv/r6xGh5or/gMN+DXKn1vGRis=;
 b=Cva4VvuNFNyY+oJ6CvhiXZ4TjD8ATijj6Nw6sWfUd4BrtLQyujOQ+jf59YiOueaAi3
 wgEteRmsKpLlZcpMYayxxy2MTZHI9pRJVo7fFLoYr67HBKq8NifqbE4asHDLTSSwg1Cq
 sPaJkfR08h8tGyfM4abiUwIsgPB5b7JyFWHAC6abQNDCE38hxZrmMW+fbPkZGEzZcOPa
 ywhaF+2oKpnntaSKj1RBzcAiE/8tc7w2aPPtU7AFqs3C/XLWtyw23rX3MGpstr3IDPnK
 cjtZypmviU5fMzf0uH02KmWd+b/kLfvE+TB9QsDT/qwa/KE63pgXTFbVW6uSPbtkNNnL
 lrMg==
X-Gm-Message-State: AOAM532JmTXwFBtRrsNk/Lzf5hpxH1CYhom0G55V5x9y4ofm+2MCEbuL
 G8IUYq+Lfj216uVUQFdMqFJYwB7vPdHAja7M8av8s3E3MxWAjBj7tx41PWco4ft/jgYCQv0Ka2t
 6VOA+g5grU8NniI11nOSPVT5+glNz
X-Received: by 2002:adf:80ca:: with SMTP id 68mr1271917wrl.528.1640161720885; 
 Wed, 22 Dec 2021 00:28:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwkoCJtHVX3pDhOPdiUKxxW7/e5x5c7YtwSOGtxy8UoUjYgTN5fseYcbOxjAI29EVId5+1dNg==
X-Received: by 2002:adf:80ca:: with SMTP id 68mr1271896wrl.528.1640161720623; 
 Wed, 22 Dec 2021 00:28:40 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m17sm1247080wrz.91.2021.12.22.00.28.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:28:40 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 00/10] drm: Make drivers to honour the nomodeset parameter
Date: Wed, 22 Dec 2021 09:28:21 +0100
Message-Id: <20211222082831.196562-1-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, virtualization@lists.linux-foundation.org,
 Gerd Hoffmann <kraxel@redhat.com>, Mihail Atanassov <mihail.atanassov@arm.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Xinliang Liu <xinliang.liu@linaro.org>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 NXP Linux Team <linux-imx@nxp.com>, Dave Airlie <airlied@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chen Feng <puck.chen@hisilicon.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 linux-arm-kernel@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Tian Tao <tiantao6@hisilicon.com>, Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The nomodeset kernel command line parameter is used to prevent the KMS/DRM
drivers to be registered/probed. But only a few drivers implement support
for this and most DRM drivers just ignore it.

This patch series is a v3 to make DRM drivers to honour nomodeset. It is
posted as separate patches to make easier for drivers maintainers to ack
or pick them independently at their own pace.

The drm_module_{pci,platform}_driver() helper macros are added, which are
just wrappers around module_{pci,platform}_driver() but adding a check for
drm_firmware_drivers_only() and returning -ENODEV if that is true.

PCI and platform DRM drivers are then modified in the following patches to
make use of those macros.

Only KMS drivers will be ported to use these new macros, and only for PCI
and platform DRM drivers. A follow-up series might do the same for drivers
that are rendering-only and for USB/SPI/I2C devices, but it will need more
discussion to agree whether that's desirable or not.

Not all drivers were posted in v3 to avoid flooding the list with too many
patches. I'm only including the patches adding the macros and some patches
as an example of their usage.

I've built tested with 'make allmodconfig && make M=drivers/gpu/drm' but I
don't have hardware to test the drivers, so review/testing is appreciated.

Best regards,
Javier

Changes in v3:
- Include Thomas Zimmermann's patches in the series and rebase on top.
- Add collected Acked-by tags from v2.

Changes in v2:
- Add drm_module_{pci,platform}_driver() macros and put the check there
  (Thomas Zimmermann).
- Use the drm_module_*_driver() macros if possible (Thomas Zimmermann).
- Leave the DRM drivers that don't set the DRIVER_MODESET driver feature
  (Lucas Stach).
- Leave USB/SPI/I2C drivers and only include PCI and platform ones
  (Noralf Trønnes).
- Add collected Reviewed-by tags

Javier Martinez Canillas (5):
  drm: Provide platform module-init macro
  drm/imx/dcss: Replace module initialization with DRM helpers
  drm/komeda: Replace module initialization with DRM helpers
  drm/arm/hdlcd: Replace module initialization with DRM helpers
  drm/malidp: Replace module initialization with DRM helpers

Thomas Zimmermann (5):
  drm: Provide PCI module-init macros
  drm/ast: Replace module-init boiler-plate code with DRM helpers
  drm/bochs: Replace module-init boiler-plate code with DRM helpers
  drm/cirrus: Replace module-init boiler-plate code with DRM helpers
  drm/hisilicon/hibmc: Replace module initialization with DRM helpers

 Documentation/gpu/drm-internals.rst           |   6 +
 .../gpu/drm/arm/display/komeda/komeda_drv.c   |   3 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |   3 +-
 drivers/gpu/drm/arm/malidp_drv.c              |   3 +-
 drivers/gpu/drm/ast/ast_drv.c                 |  18 +--
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |   3 +-
 drivers/gpu/drm/imx/dcss/dcss-drv.c           |   3 +-
 drivers/gpu/drm/tiny/bochs.c                  |  20 +--
 drivers/gpu/drm/tiny/cirrus.c                 |  17 +--
 include/drm/drm_module.h                      | 125 ++++++++++++++++++
 10 files changed, 147 insertions(+), 54 deletions(-)
 create mode 100644 include/drm/drm_module.h

-- 
2.33.1

