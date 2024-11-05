Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3A99BC4F4
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2024 06:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C9410E514;
	Tue,  5 Nov 2024 05:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Qg5P9zbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95D3D10E517
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2024 05:54:11 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2e2cc47f1d7so3598866a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Nov 2024 21:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730786051; x=1731390851; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yqWywPOux7fqYBvqYq3BCUnN8cTvh6z1oVaGkKCV3Z0=;
 b=Qg5P9zbMCLFuR9F4aGAg/XUa/XdQhMIbup45CeZdb/XSiUyyeZdlYAWrTe1oGWQ+p+
 XkJWDtzWyDumP1wbenEJy72YWGZDPpsGlfAkknkATa9fBEb/8b30+4IbJhd2cU+K/++w
 otKi8adoRLmqLNcCXX9Wn5j46OckEn38spSGKklP/ZWfNNlvn6Kygm1B6P56wH32VlVZ
 x269b3PcAPt0dJnhzSpkvTVFYtXcmgoe9z+z3KrLnYheoAjUlSgQhvFEgyLisWm5GVYx
 lKHntuYPf3RSxMCb66M15RH7mSrS/lUbQbsLIGSCsj/PtMDGb5NXW0Ws+YVoqWlyMUNo
 MFYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730786051; x=1731390851;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yqWywPOux7fqYBvqYq3BCUnN8cTvh6z1oVaGkKCV3Z0=;
 b=YyyS+OmT1iPkb7atjyZ85MLvGs77GA9CpyQtSZmaSUsAsM5LNy3xgBAK+3OdeCySsR
 kgJzDK+K5Y79ZtHob+fKFKNyiLI3qJDGmyeV3UgoDt2ZoxecMQFoQzn1Sr993OyfOJes
 wuuj2gZ1zvI5A+EpEWQ20TSE7KdlgyE4QAr/Q8C1lotwGAxhnXomT/HCZu3D6BQQj8Pf
 Rbie/uchh3CmP953WzP3vTXI8v6/LXM4RPIg5lfJfUBgVpfl4qoO31tMrgaD0WHRO3UV
 CUAL/m/1HEEaV5AIlpE9GsrElqQ7EV4s4RQdznzrCxcgRGOcbl88xuKVRBvFHHIM1At5
 Gu+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXJxmw5pRueydkV8ZELhVP9Kb17n2cUmf8w0O0lOMeNtu9F3dXpTk7jbZ+9FdoMgZPwb4PXL3li1k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzw1I65ZxuRxItY3+VS44eqKhv2dAAyvRCnMUQtyujS2YT8D2x7
 N03wBc2Q2YvVnylXaEe0UwewrLAJRHVk3S5rZq1gQf3W5OuLynQW
X-Google-Smtp-Source: AGHT+IG5o3ju0226IekHiik9p3aigT44lyf9BFM2fSX/r2B4qqsGKRgWfSSjNoQR5pAezQYfIFsAmA==
X-Received: by 2002:a17:90b:1b44:b0:2e0:7e80:2011 with SMTP id
 98e67ed59e1d1-2e94c21cd58mr24157797a91.16.1730786050963; 
 Mon, 04 Nov 2024 21:54:10 -0800 (PST)
Received: from noel.flets-west.jp ([2405:6586:4480:a10:fa8f:7c3e:835f:c642])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e92fa4570fsm10952198a91.30.2024.11.04.21.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Nov 2024 21:54:10 -0800 (PST)
From: Hironori KIKUCHI <kikuchan98@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hironori KIKUCHI <kikuchan98@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ryan Walklin <ryan@testtoast.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH 3/7] drm: panel: nv3052c: Fix size of WL-355608-A8
Date: Tue,  5 Nov 2024 14:52:31 +0900
Message-ID: <20241105055239.1577275-4-kikuchan98@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241105055239.1577275-1-kikuchan98@gmail.com>
References: <20241105055239.1577275-1-kikuchan98@gmail.com>
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

It is 3.45 inches in size (diagonally).

Signed-off-by: Hironori KIKUCHI <kikuchan98@gmail.com>
---
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index 2da1e924177..2f3a8eaade4 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -906,8 +906,8 @@ static const struct nv3052c_panel_info fs035vg158_panel_info = {
 static const struct nv3052c_panel_info wl_355608_a8_panel_info = {
 	.display_modes = wl_355608_a8_mode,
 	.num_modes = ARRAY_SIZE(wl_355608_a8_mode),
-	.width_mm = 150,
-	.height_mm = 94,
+	.width_mm = 70,
+	.height_mm = 53,
 	.bus_format = MEDIA_BUS_FMT_RGB888_1X24,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH | DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE,
 	.panel_regs = wl_355608_a8_panel_regs,
-- 
2.47.0

