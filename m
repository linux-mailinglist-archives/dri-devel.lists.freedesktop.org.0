Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5306B2511C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 19:07:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0844910E7AF;
	Wed, 13 Aug 2025 17:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="BgQ7U1Pt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B9A10E7AF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 17:07:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755104808; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=PAGuhxR2YhUK8K3VF4BIokTaB4M7vntbYj8RXIQQ8r1DnMmrgEdJ0T+YyK98A/pZPjYMAx7KLQGfx1IeYI6d4NzzoHnpA3J6pPkgueetinSEPVplcgOD4reo8INIzpAtVmQFoLKTUIeRiPYa5Ji7Yrc+UO4z16JlBdDkdlH/Inw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755104808;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=w0PqVYUegSVSVB4MGPXy8XG4ZnBYgOwvFDckX/NV0/s=; 
 b=bkWRqed5ESmOAqc3MejKRGUvJrAlMI9jCFtYQ78284yI6PGiayJABBXg4YDIlQ1WAmM1jBIl65gdinI6IFIy8ztmjeTOcIOKAsmtKB64JTT3F73tifxVxs43XqQzFhafS0o7xLKwXUdnRQ8idZVfTWTh6b2MaMxOgja4/s8ELiM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755104808; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=w0PqVYUegSVSVB4MGPXy8XG4ZnBYgOwvFDckX/NV0/s=;
 b=BgQ7U1PtfUSquIWhbFvKiQxpumrvf4lQZjp/nitdlws+bCiJO5FmwIvJHuywNXRj
 rDr3MvYp7/fLrNz8jHyBWOfZeLgzY6/Hn4Mzh/SE5URdv6VNhc6Jr2cGpgBFbHqfHTO
 RL0kmqinHdqUyY0jnayjipJkz3bfObeAJEm/6rXw=
Received: by mx.zohomail.com with SMTPS id 1755104806547972.771505234537;
 Wed, 13 Aug 2025 10:06:46 -0700 (PDT)
From: Robert Mader <robert.mader@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Daniel Stone <daniels@collabora.com>, Melissa Wen <melissa.srw@gmail.com>,
 Maira Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Robert Mader <robert.mader@collabora.com>
Subject: [PATCH v1 5/5] drm/vkms: Add YUV formats to writeback connector
Date: Wed, 13 Aug 2025 19:05:42 +0200
Message-ID: <20250813170542.331206-6-robert.mader@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813170542.331206-1-robert.mader@collabora.com>
References: <20250813170542.331206-1-robert.mader@collabora.com>
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

Now that all plumbing is done expose the new formats.

Signed-off-by: Robert Mader <robert.mader@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_writeback.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 59e7a980533c..f3fbfeff01be 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -23,7 +23,22 @@ static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
-	DRM_FORMAT_RGB565
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV24,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_NV42,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YUV444,
+	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YVU422,
+	DRM_FORMAT_YVU444,
+	DRM_FORMAT_P010,
+	DRM_FORMAT_P012,
+	DRM_FORMAT_P016,
 };
 
 static void vkms_wb_connector_reset(struct drm_connector *connector)
-- 
2.50.1

