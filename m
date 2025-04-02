Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89195A79450
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037F610E8AB;
	Wed,  2 Apr 2025 17:42:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OUixhfQh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D4410E899;
 Wed,  2 Apr 2025 17:42:57 +0000 (UTC)
Received: by mail-il1-f173.google.com with SMTP id
 e9e14a558f8ab-3d58908c43fso506905ab.0; 
 Wed, 02 Apr 2025 10:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615777; x=1744220577; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XVuxeJKKK9Rs+v9Dxb1+k9xlxA6UW5kge7MRPvzoPYI=;
 b=OUixhfQh9kBz0qkedhPrzG/UKzFzpU/uI9z8zKg7xvarD9RgXR/8/udsspZJlgcriO
 C2j2Ta6JvZlatos4grMJvUicgigOinE9kKs1OV6/zad7MlBEC/cfVHT1oBQxGDvM8/Y3
 AOrLoV7hat/iO0YQ/KNznWlegjJtScgQUaQhOs5aWuuW/ONKmcb8vaYbO4lnsaEyMP6w
 dQOwZVl2amsHL4KbDKUQZwO+33MQiRnsMtevHK4I3p+YZW4o9GwbMdQxeTYyMCFmz0Mj
 7blQ2QPPspyemz1LNHY9cxFXY4aFDWGlcWXPz4J5ODM1dIoidu4joq1mCB5MXz2NXgwU
 V9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615777; x=1744220577;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XVuxeJKKK9Rs+v9Dxb1+k9xlxA6UW5kge7MRPvzoPYI=;
 b=c1XclUXQC7atlLl6ilLFBWr5ikpF/M+uo6c2q4LwNibj5RqWsAATQf8lM+tRLqaY92
 7l+8W6Vr8fi53NGcoiqqwlxvBZ8vVe4zNsQPp3dutu5fGZH/89fdcSgf72omYA2/CQsv
 CJ49xfiOFgi8jZmzfPDlMKfZHVhhxmDcyfWTX/ZRpl9j9yPCNc5ZigW9tQa2JE7Ytg7z
 ZnwYCUalTnTWwRWXcJCgpiK6IPSlzUBn6LLq5w3cKxVG5WlC6puQTVOX9XGCTxmA8dXU
 w8+a273j3EU+JHnPUCSu3+a8aF8IwkF3DLJ4SvMths1Dh4qkh+UGKRlgDbobPCjBvc2l
 6Nmw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnHkBqgnGovoLQ/4jrQOCzcJH5rkzXCouGWmCHbqjvfFWNneiVCB8hkZXWD2L/RfH/g7h7Shl0@lists.freedesktop.org,
 AJvYcCVAOxpEOh9BUhIUuQjxIuH6E0P/svZAhKe1VeHTObFp6IF+QMwZK4x6IfiTvteRwNdr6gdg6gkkWx9euZxSrg==@lists.freedesktop.org,
 AJvYcCXOBOKr64goJiZkf2UW3swqtvykvsSAZsRz8Z6U1CNeAc9Vq0vS55zTolIYAmuP2aT4HzTGIJFp5xYp@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9NJdFqRPxP+qqv0eBBoV3m42wDfkHPV32ro6oH6IdgV/vo0KR
 wEbWbIkTpq9F1lYtlF6ws7NewUxdGls37L5xg7/Pr1q7roG0dRMM
X-Gm-Gg: ASbGncsyUTq3YozljjyPwLgS+zVlP5bZYwoYb6colgUwFU3onoPalf6GVwYueE9GS2C
 UbHu/0Un5y11r+dmQQ9lr48AHE5Gdid00FXmm7z+u9bP+n7lq4FJKeffsg/v80fO/9h1b3WoFsh
 wP0FqE1b0lLlR1XoOUdcVbB8ATnP1DsYFj/MYh0WGpB2Afh602+VHfAMiC+/ZHxMxpw6tqMAPV+
 6BzrfexwZiIbikTK2a3kMl9/QeW8JcQizjpX/+MhX8KFSpDpYzkCUxcGJ5u8f86aA+fzQk/ph9s
 zywCVntZjsumydppU3CjqDb9bfZhmpUY6U0MU6YG9aFfC0KyRSmpOVMYQbuZ6H2QND5iwLBxtAD
 tkw==
X-Google-Smtp-Source: AGHT+IHC7Ea8gqOI7SUhdkIs0stRkMgjiR8iRe4Z1Hury5vPgr/hHoKAmFAKEUAuImZWm4ZQOlbLag==
X-Received: by 2002:a05:6e02:2504:b0:3d4:6f37:3724 with SMTP id
 e9e14a558f8ab-3d5e09e467emr214829515ab.18.1743615777081; 
 Wed, 02 Apr 2025 10:42:57 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.42.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:42:56 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 44/54] drm-dyndbg: add DRM_CLASSMAP_USE to gma500 driver
Date: Wed,  2 Apr 2025 11:41:46 -0600
Message-ID: <20250402174156.1246171-45-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
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

