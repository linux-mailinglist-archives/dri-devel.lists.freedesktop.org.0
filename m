Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A5D62E48B
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 19:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B4810E66A;
	Thu, 17 Nov 2022 18:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DBE10E66A
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 18:40:57 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id s12so3865771edd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 10:40:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KBWaH/vKohLUzSe6QLXlh4Mx7QgSFZjyZMz+JYtKxxI=;
 b=PN2H4XymqqWem8S5cTcjWj54sE7zShRhQiFrsQNFZmaqE4nDDPF+zx1c/CGLFv2OSy
 3Gswa2GOYRqjT76c748Qwv9+8xkpJ8/cRmmME4jfzEt9cT5e9FDF436nO11EQ6QzGdih
 KLWGcIHS8regNMFEAkWFvgEmOdmqBduf/vLBjRP+LlMPBmM4im0dIXJv8dhxbFF82WID
 rvhXXAMbBcbNEfnREGGf636/VVz8o0mi4XCKYk6sioZWhM8v3XxqNe2zU7H/m+j/bqqR
 pmP9S9PfENRTyn99XM6bP4pJf+D54gYGqXBRWRd08QTQRk6cCJzD/adaeTiP2gsR5K9b
 Wb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KBWaH/vKohLUzSe6QLXlh4Mx7QgSFZjyZMz+JYtKxxI=;
 b=p/zKDmafYh+rlDYgk1GCVUY7VAxg/VwjdO9raYfHNm+OdsO+A6B6OWvUMQUoeBHklU
 L6Uejf8PRrmiDVOEdp0W20EQ/Rt8bgOzU0+t1c+vj4a6y0eLOnIQKSmwnlCeBrSvOXNa
 gsovlVVyiREg/T393bzb4RwwEBQu0LOGSnJpjS8i5UpkSaXaje+7G7ENdNFV+T1se8zK
 S0dMMi0KKbZrvM21NjkTXuZLTTeIG6nX3CJc7IhlH5XOHkpNJpVKxn7+2DFTf+W96PQJ
 8oVU/eJWYGBsTC74bgZWt+ddFdIQde8waSfd7WA/DZleLvSS2OpfUEWEeb9gWiLFjcgu
 C5Yw==
X-Gm-Message-State: ANoB5pmmDvHyboL4Hib1gbBMeyuqy6HEDy72GCLqrRKJxYjVjzmGaOyc
 NZTdXMgw5f9jf/jesryF8cs=
X-Google-Smtp-Source: AA0mqf77/+b+VHZt2iTNuQJF8SBFQKPCJUFtQbHHRL8xCl1iwGBfNl9qWYmvSkfDDyQ+w91qlTVhiQ==
X-Received: by 2002:a05:6402:5412:b0:460:e19c:15a3 with SMTP id
 ev18-20020a056402541200b00460e19c15a3mr3432932edb.252.1668710456001; 
 Thu, 17 Nov 2022 10:40:56 -0800 (PST)
Received: from localhost
 (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 8-20020a170906310800b007aee7ca1199sm730053ejx.10.2022.11.17.10.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Nov 2022 10:40:55 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@redhat.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 7/8] drm/simpledrm: Support the XB24/AB24 format
Date: Thu, 17 Nov 2022 19:40:38 +0100
Message-Id: <20221117184039.2291937-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221117184039.2291937-1-thierry.reding@gmail.com>
References: <20221117184039.2291937-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Add XB24 and AB24 to the list of supported formats. The format helpers
support conversion to these formats and they are documented in the
simple-framebuffer device tree bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v2:
- treat AB24 as XB24 and support both at the same time

 drivers/gpu/drm/tiny/simpledrm.c       | 2 ++
 include/linux/platform_data/simplefb.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 7f39bc58da52..ba1c2057fc65 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -483,6 +483,8 @@ static int simpledrm_device_init_regulators(struct simpledrm_device *sdev)
 static const uint32_t simpledrm_primary_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_RGB565,
 	//DRM_FORMAT_XRGB1555,
 	//DRM_FORMAT_ARGB1555,
diff --git a/include/linux/platform_data/simplefb.h b/include/linux/platform_data/simplefb.h
index 27ea99af6e1d..4f94d52ac99f 100644
--- a/include/linux/platform_data/simplefb.h
+++ b/include/linux/platform_data/simplefb.h
@@ -22,6 +22,7 @@
 	{ "r8g8b8", 24, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_RGB888 }, \
 	{ "x8r8g8b8", 32, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_XRGB8888 }, \
 	{ "a8r8g8b8", 32, {16, 8}, {8, 8}, {0, 8}, {24, 8}, DRM_FORMAT_ARGB8888 }, \
+	{ "x8b8g8r8", 32, {0, 8}, {8, 8}, {16, 8}, {0, 0}, DRM_FORMAT_XBGR8888 }, \
 	{ "a8b8g8r8", 32, {0, 8}, {8, 8}, {16, 8}, {24, 8}, DRM_FORMAT_ABGR8888 }, \
 	{ "x2r10g10b10", 32, {20, 10}, {10, 10}, {0, 10}, {0, 0}, DRM_FORMAT_XRGB2101010 }, \
 	{ "a2r10g10b10", 32, {20, 10}, {10, 10}, {0, 10}, {30, 2}, DRM_FORMAT_ARGB2101010 }, \
-- 
2.38.1

