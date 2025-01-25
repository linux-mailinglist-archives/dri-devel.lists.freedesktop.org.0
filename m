Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D74F2A1C1AD
	for <lists+dri-devel@lfdr.de>; Sat, 25 Jan 2025 07:47:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5E110EAA3;
	Sat, 25 Jan 2025 06:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lYNYJk1C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFAB10EA8E;
 Sat, 25 Jan 2025 06:47:40 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-844e1020253so73051939f.3; 
 Fri, 24 Jan 2025 22:47:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737787660; x=1738392460; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/mUFZ8Fx8Uy3QqB/hbqxnrTn1Tk9spmVb/f/WA3FR9Q=;
 b=lYNYJk1CvS3BzqD3oVOsmfUZxe7pm/AggrZ0qpzv16zMncBIHMP0jF2V7MwV6+F/kZ
 /+VMcgJzZXE6nPpL8q17rPm5MXX8zUTP0M1d9QERG/GlH3+XX8/EcF7p6+9X4GI8mI1Z
 leGuy+HGwvfaXBdEW2TXSrD5OzurSGCCCFG7sMgGuT1Jg1cwoTAREP0UCdckD9bMWdFV
 iJzFZ8PnJZQrlH5sX7FnzuAbpNgDO8+AF1FvtLWCen83FJ5PhWywnp0m8foEBvtNHesZ
 e38BWULbAQxmePKeanF0AyC8PMB807WiF7oYKozLkUglXEj/RgbrwwmzsTYfgA8B/yvJ
 cj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737787660; x=1738392460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/mUFZ8Fx8Uy3QqB/hbqxnrTn1Tk9spmVb/f/WA3FR9Q=;
 b=OVawFSf2DKA2VWYG4uFFW2YLTdtBmEThzdIqARszZirgkd3GsULDLgeeH01+F0Adwj
 0Ie+Vu9bW9PKhBmXB+m7BFWSVm63oIygrpRoz/WGZVWevN5w4werTsWJ9Q5esW9SNtMs
 cqx6TRROlDj6D1UAEkBxi4cqNRhz8c4Yd4l6vxTeX42nLAlJTaXhKWMxqQ3ZP5Dptmhp
 j+dYiZt6cP0Or8SDdPiAAGuBqfsAN8b7sttkmunluhd0rt/PdJUn+zuXtXvn2P7mFwFE
 HribBWhoXLfuD8qGUUbIBE1y4eOycRdr8GfcUiclkS+TV9ahbY80DO84GkFFzyHY54hN
 TLCg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjXZtd7SUZEm18b+n1F1lF7Ui7pgoXAVlk+/AvO0oWuTz41e5Fu2gOAEwL6uZHTTUgTtWZO6ly9bSJ@lists.freedesktop.org,
 AJvYcCVo833oufDwlO/WwytvzDUOlV/pUbg0mIRm2QhIK+CipkftYZD7a3bPZnK64bNeHCbwxEHjKz/nog7pG4CGNg==@lists.freedesktop.org,
 AJvYcCVzexYSgs13D6aE7UjFOyTcqxqhPByS6IjL/n49c5Zc/aavAYBfFOJJCwejwIK1N9KsK7BfDneE@lists.freedesktop.org,
 AJvYcCWAl1WVxzoy2aW0YuCOjKKV0Qxdl+bZNyeeSYSz+jLhqb83wFQtdmwIeqi00WUdQUmrhLcTg1qAYuc4@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzcTrhuuIyf2gXlIJXBC4jjp27Ok3E3dsVHRuvV3Tz6h6cWRMR5
 kduUv7wH0APuVtFkE85+tuuDX6BvATHb2nrq5dBA/3c7BGZKREc9
X-Gm-Gg: ASbGnctHOAfb1flwIhOJxSjeGUqaTXTWfbTMJ/OSX3+ptRJTl3DmaAY+QYT2cBUJa5N
 TvrpyTn2ys2pXnSL7Zme/M1Ri4T6cRHzC47Oma0VJRCfC/rZUCDmFZfsgGGHx1l4xCCC3CzvlVq
 GL26cbEBF59L3Cb12DzHfKt9uNUOG+rAJjHQeiJaCX2ROEyKBPGwR7bX6jRGZgJ/g1U4Mosn3EV
 6hfsgsHo7h8m7NmZa3uqVWHtf9dDDuZ3pm7n6KfrEIoA5UWgPI5aV/vuyCQRaUgW3jKyTiUiGUO
 3xm+BpNV9uEzdifsBSTEcDsZZp+BpVyQY2RZiA==
X-Google-Smtp-Source: AGHT+IE5SydaMohjo2fPiL9Eo34PldUnXG2CByWM5igrHsaDbtwNWE8E1i65BN9D+ZF5lfplsXjZ9w==
X-Received: by 2002:a05:6602:4186:b0:807:f0fb:1192 with SMTP id
 ca18e2360f4ac-851b6169a31mr2832582039f.1.1737787660094; 
 Fri, 24 Jan 2025 22:47:40 -0800 (PST)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4ec1da476fesm1174144173.58.2025.01.24.22.47.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 22:47:39 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: intel-gfx-trybot@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH 59/63] drm-dyndbg: add DRM_CLASSMAP_USE to mgag200 driver
Date: Fri, 24 Jan 2025 23:46:13 -0700
Message-ID: <20250125064619.8305-60-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250125064619.8305-1-jim.cromie@gmail.com>
References: <20250125064619.8305-1-jim.cromie@gmail.com>
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

The mgag200 driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/mgag200/mgag200_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
index 97fd7eb765b4..c6000692b5ce 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.c
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
@@ -27,6 +27,8 @@ static int mgag200_modeset = -1;
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, mgag200_modeset, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 int mgag200_init_pci_options(struct pci_dev *pdev, u32 option, u32 option2)
 {
 	struct device *dev = &pdev->dev;
-- 
2.48.1

