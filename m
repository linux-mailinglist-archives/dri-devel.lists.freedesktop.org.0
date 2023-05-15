Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A227C702ECD
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 15:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA92A10E1E3;
	Mon, 15 May 2023 13:52:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0A810E1E1
 for <dri-devel@lists.freedesktop.org>; Mon, 15 May 2023 13:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rusY3SRofvPXt9JTF+RMu2ZZiJAKl8cNpCF54TluHxE=; b=euYSfLpEKwUJ2sIxuWD9Hr+vL+
 nId66Bs/T0AUs26aGhC7s60V3B2uCfW471E5VkRJIcM2kMEZo5zjwweOiHuMCqUCEp1ibmf5mPL/F
 d8rDrwOe6UqY2VtKVFwMHBBe7g+OP4CQeHbPy6iUW9eZluAZAfxzDvF0/WIwKwt9UDtY4Z6WxYI+1
 jKaRHs8ExAqmcesvtIjaluespD1XC/6XKiiqZx6uZQsuYUcBZdSacwwK9f2edDNytyf889kvTQ4go
 Ae4jhKt0JABzbAnKWwomyQu8MUhNUDfWEK5rgkIFucfDgiRN+Vc12Dam70tM+f4erI5d60yMnFaMW
 VSZznOzw==;
Received: from gwsc.sc.usp.br ([143.107.225.16] helo=bowie.sc.usp.br)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pyYcv-009tiB-UR; Mon, 15 May 2023 15:52:38 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Haneen Mohammed <hamohammed.sa@gmail.com>,
 Arthur Grillo <arthurgrillo@riseup.net>
Subject: [PATCH 2/3] drm/vkms: Enable ARGB8888 support for writeback
Date: Mon, 15 May 2023 10:52:04 -0300
Message-Id: <20230515135204.115393-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230515135204.115393-1-mcanal@igalia.com>
References: <20230515135204.115393-1-mcanal@igalia.com>
MIME-Version: 1.0
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VKMS already has a function to convert ARGB16161616 to ARGB8888, so
it is possible to use this function to provide the writeback support for
the ARGB8888 format. Therefore, add the ARGB8888 format to the writeback
format list.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vkms/vkms_writeback.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 9a126f678d73..36e75fcefc1a 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -15,6 +15,7 @@
 #include "vkms_formats.h"
 
 static const u32 vkms_wb_formats[] = {
+	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_XRGB16161616,
 	DRM_FORMAT_ARGB16161616,
-- 
2.40.1

