Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C8FA6ADC9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 19:54:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FABB10E6A4;
	Thu, 20 Mar 2025 18:54:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hek7K1GX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA43A10E6A8;
 Thu, 20 Mar 2025 18:54:00 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-85b5e49615aso98874239f.1; 
 Thu, 20 Mar 2025 11:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742496840; x=1743101640; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVuxeJKKK9Rs+v9Dxb1+k9xlxA6UW5kge7MRPvzoPYI=;
 b=Hek7K1GXXe5rjZ7lcEGUtH7ZXZpYj1gDY6aQh5rfCtpYD8JcnYUjb9Lu2Fi4tpWGZt
 /fTxFoVTPkjTj/fxEl6MOLZ5tEo5wz/TnwVJyvKt7k+A9SUJ/71SOCFfj1iXcBKAQK0b
 15jGekiZZZMck+/LJRDCdFCjK9FPz2GfOPrB1oip3UXHG+YZaqF2NM9A65cZkeGLYP2Y
 A/lWYkA0YX9tp37WHgiX9p+A5uCxUBB7nKJJ6rbrJSPmy+8l8dgxceN/aRS+EgMjrHlZ
 YmntU0oDLTbK6tpUWn75SPE7/UcqTEG9eo2LqQlMkHClU+kn+02KWKgajyVp/9Un2Zpn
 bGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742496840; x=1743101640;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XVuxeJKKK9Rs+v9Dxb1+k9xlxA6UW5kge7MRPvzoPYI=;
 b=oFFe36JoRzR6VD8zs5dJq/dQ4BWGG15+bOcuZgsOOUe8k19U85gKgJUC/fyIq3K9Jo
 9n7stePcVnp8PpZK7tFuNvCxqhhHoeazS8xq8KGeWcnWFt8dipZPb3edF7n1O4O/4r51
 mQsCxzo5S6+t4W1UlCCZk8U9+hRlIB6QZXhtY0D7ZkDX/rcTSXP2M1iW4jbZxpXDYCBG
 tDloMWbgupA8bA+gMGWZMeOm7UwXm+HFM3a80D3CB1dSAeQlvOpFbK97MSPz7oKvb0LO
 UlQo/flCTzMDIox8JxzX22L3QblnM00u5L8zW09XpTsDV+TDaR1+xFI7/ii/u4rey/Rk
 ZfNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5YZtB5eV1NsIvDwFE8KfanUXveDHoJ/Zdq54Oi8hOR8W6HOBGFc+6YLPb5ZJNzln6HIXhpM2bPEhV5PZysU32sw==@lists.freedesktop.org,
 AJvYcCUr8teUEb5iYcpahbhDU5Shz/tqnj66PfjgnlF6n4Ffs0DJrB4TIBkL7iiB1TyU2Gkd9ivnIy0oFSLda1taGQ==@lists.freedesktop.org,
 AJvYcCWWa29nbSSc58eeZKxk03jvTJLJ5AZtlbelrhwXcaI22hyd6p1hVOVkmpUqdgzcC94rtfs1KrjaAqBq@lists.freedesktop.org,
 AJvYcCWj7UCSKA7QsuaPaabCyht2p9wt0HSYgWwDJSRFwdMr6JbwOBWxFXxOHxuoRkZdG6RObsCK7iP9@lists.freedesktop.org,
 AJvYcCXudTzSiqKJAmBxn2+euQvJFmIG2eBbdrx39KoZI4VH2sdm1UPHE+FecOxaM0czPLqopTyAJcCBnjhD@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxToFuchBgzGgldVdHAkLPv4G5YG/nI/8ZMOIwbVGCZT4Qhtq+h
 wf+IySwnV2UjXSr7Vxj/sJV613rx9r348hmWij84xtGgK0ARDoDQ
X-Gm-Gg: ASbGnctDL4UrfpLY0AhFbRi83zKo+gwpVbCoKmGnQbPG+Xy2Niao1v1xM1Xjs5AIHOa
 pFBOws7VxNWi/mtkpBzy5BOsiWxZzWCSr8UUoFXqOjywyWIo66zrS/qI6aPvCRbtfPb9Qs/aLLT
 BkMvExwrH6/u20b/6Zgui/niCp+lxF0Yt8HehMr8aXqsFPFbhLuOUGXklThPSgtPJTniDjSCilS
 nhfagDMtiiv52q8OXScc12BZqHwbScBNZPeo8UXIXUXiDd+idFBUerIoFOqT7wFRf65+uzmzM37
 DrPRGpmjhDJwxvInUNaUWl5/ImWUOuMSQ0cX+VZPHnXdaAyRj/CObMA0tyV16rfT9Re1j2GNlpQ
 b7A==
X-Google-Smtp-Source: AGHT+IEgtZhnFWdPHG6hTurl2TJTpACa9ncEjZ7DOX6uv9rTIlbze+MtBpfCYmXm8khqb7FwjH6Qaw==
X-Received: by 2002:a05:6602:7218:b0:85b:5564:2d51 with SMTP id
 ca18e2360f4ac-85e2cc52346mr35719439f.11.1742496840061; 
 Thu, 20 Mar 2025 11:54:00 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-85e2bc273e7sm7078039f.17.2025.03.20.11.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Mar 2025 11:53:59 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-gfx-trybot@lists.freedesktop.org
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v2 49/59] drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
Date: Thu, 20 Mar 2025 12:52:27 -0600
Message-ID: <20250320185238.447458-50-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250320185238.447458-1-jim.cromie@gmail.com>
References: <20250320185238.447458-1-jim.cromie@gmail.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The gma500 has 126 DRM_UT_* debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 85d3557c2eb9..dc72388ed08d 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -40,6 +40,8 @@
 static const struct drm_driver driver;
 static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /*
  * The table below contains a mapping of the PCI vendor ID and the PCI Device ID
  * to the different groups of PowerVR 5-series chip designs
-- 
2.49.0

