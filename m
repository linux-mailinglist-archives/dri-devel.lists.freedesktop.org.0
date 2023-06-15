Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7AD73172C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 13:40:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E62B610E4DA;
	Thu, 15 Jun 2023 11:40:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6147510E4DA
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 11:40:30 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0CED66248B;
 Thu, 15 Jun 2023 11:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98CA0C433D9;
 Thu, 15 Jun 2023 11:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686829228;
 bh=cu7YdInQVwlBR8BC09ytCG19a+Ch8gkY/lmCKo8J1k0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jR88JGtOIqc/ey7y694yO54WlVdLXdtbBlO7e96GbP5s8oeQdXSSwlobaGaJ/E+b6
 07dCLrSn4f6w3jiOhHm+kWgZqqbe/vezXDB854pJgpZR1cNypgwyoFt5zj+P6O1WtB
 8FVRBmVsEBdW+wCWiUnDCjCLMtg47ZQd+fvv7CN0G5y54cjPDN2H/l29PNb08ArHDj
 V5A12gkR9oWti5uHdWqW0J0ffvLG4qRKTHESRzxf5d0O9Y1Wwk8RbJPfNvnFCRvY2R
 P+1B2ZEj6QdY7au89/m7/p4MoyC6EK4gjQSKfdNhCf8HHJQQUpyLbLft5b6e3+rn8l
 +BaCbW6EpS45w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 5/6] fbdev: imsttfb: Release framebuffer and
 dealloc cmap on error path
Date: Thu, 15 Jun 2023 07:40:13 -0400
Message-Id: <20230615114016.649846-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615114016.649846-1-sashal@kernel.org>
References: <20230615114016.649846-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 4.14.318
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Helge Deller <deller@gmx.de>, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, zyytlz.wz@163.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Helge Deller <deller@gmx.de>

[ Upstream commit 5cf9a090a39c97f4506b7b53739d469b1c05a7e9 ]

Add missing cleanups in error path.

Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/imsttfb.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/imsttfb.c b/drivers/video/fbdev/imsttfb.c
index ecdcf358ad5ea..6589d5f0a5a40 100644
--- a/drivers/video/fbdev/imsttfb.c
+++ b/drivers/video/fbdev/imsttfb.c
@@ -1452,9 +1452,13 @@ static void init_imstt(struct fb_info *info)
 	              FBINFO_HWACCEL_FILLRECT |
 	              FBINFO_HWACCEL_YPAN;
 
-	fb_alloc_cmap(&info->cmap, 0, 0);
+	if (fb_alloc_cmap(&info->cmap, 0, 0)) {
+		framebuffer_release(info);
+		return -ENODEV;
+	}
 
 	if (register_framebuffer(info) < 0) {
+		fb_dealloc_cmap(&info->cmap);
 		framebuffer_release(info);
 		return;
 	}
-- 
2.39.2

