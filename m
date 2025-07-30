Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263E8B15B03
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 10:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC5F10E431;
	Wed, 30 Jul 2025 08:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IeRfxubk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03ACB10E42E
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 08:57:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 810BB5C542E;
 Wed, 30 Jul 2025 08:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00987C4CEF8;
 Wed, 30 Jul 2025 08:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753865844;
 bh=w27UoqUceMQEYOVXBT40nQLYhN3aneD/BafQ1QuXRhE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=IeRfxubkqu4oxCBCwwetWWfBurhzTe+I5K5H3PULR5TpgEs5pDN14Q1Lw78amLSLM
 Acs3AaTQ35tLjmqjlytUAy46ev+xvO9IvcTg6Wy7E95kY3chcsyvn3v+FWHSR2ACME
 dOUr+B9p8ktpODQ8A9FZU8i9W9Jc1p29a2u+698VEUY+QP5/Us6elinR+TAxpGWBGj
 H/9B0OabvgjLUs0XZN/GcH5URkvUMBM8GcTWso/qQGlN0UjhE6zZKWllC+OcwpB05u
 rwpZdZMUGJekcy4meX86BaaP6csaeWqdLA7GkEcrKw5LAO51fbGk2kjqcuBPmEwe4n
 wgl09sTdmsS3g==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 30 Jul 2025 10:57:04 +0200
Subject: [PATCH 04/14] drm/tidss: dispc: Get rid of FLD_GET
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-drm-tidss-field-api-v1-4-a71ae8dd2782@kernel.org>
References: <20250730-drm-tidss-field-api-v1-0-a71ae8dd2782@kernel.org>
In-Reply-To: <20250730-drm-tidss-field-api-v1-0-a71ae8dd2782@kernel.org>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2296; i=mripard@kernel.org;
 h=from:subject:message-id; bh=w27UoqUceMQEYOVXBT40nQLYhN3aneD/BafQ1QuXRhE=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmd9xK/JR/mvPhui2Zes3Dkaad/7F9FimVXJJVd5lHfp
 Rl6qPdIx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIxK2MDX8O9y8oVFbyYvu0
 9iPLw/c+uZLBNubvXmSEpNk/YO9Ie8rzaev5n++5Wz79zgw7Y8M/l7E+NM31hFGTgVPFudIeq1c
 90w8ETTa+/fOr60WRvRplz4WZNT3nftFewfOmVeHn21/3pP4DAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The FLD_GET function is an equivalent to what FIELD_GET + GENMASK
provide, so let's drop it and switch to the latter.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 7e36f5af666342dc4f5fa9159d829d88362de18c..974387313632cc85fb6c4d559b4d35656b1119da 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -612,23 +612,18 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 static u32 FLD_VAL(u32 val, u32 start, u32 end)
 {
 	return FIELD_PREP(GENMASK(start, end), val);
 }
 
-static u32 FLD_GET(u32 val, u32 start, u32 end)
-{
-	return (val & GENMASK(start, end)) >> end;
-}
-
 static u32 FLD_MOD(u32 orig, u32 val, u32 start, u32 end)
 {
 	return (orig & ~GENMASK(start, end)) | FLD_VAL(val, start, end);
 }
 
 static u32 REG_GET(struct dispc_device *dispc, u32 idx, u32 start, u32 end)
 {
-	return FLD_GET(dispc_read(dispc, idx), start, end);
+	return FIELD_GET(GENMASK(start, end), dispc_read(dispc, idx));
 }
 
 static void REG_FLD_MOD(struct dispc_device *dispc, u32 idx, u32 val,
 			u32 start, u32 end)
 {
@@ -637,11 +632,12 @@ static void REG_FLD_MOD(struct dispc_device *dispc, u32 idx, u32 val,
 }
 
 static u32 VID_REG_GET(struct dispc_device *dispc, u32 hw_plane, u32 idx,
 		       u32 start, u32 end)
 {
-	return FLD_GET(dispc_vid_read(dispc, hw_plane, idx), start, end);
+	return FIELD_GET(GENMASK(start, end),
+			 dispc_vid_read(dispc, hw_plane, idx));
 }
 
 static void VID_REG_FLD_MOD(struct dispc_device *dispc, u32 hw_plane, u32 idx,
 			    u32 val, u32 start, u32 end)
 {
@@ -651,11 +647,11 @@ static void VID_REG_FLD_MOD(struct dispc_device *dispc, u32 hw_plane, u32 idx,
 }
 
 static u32 VP_REG_GET(struct dispc_device *dispc, u32 vp, u32 idx,
 		      u32 start, u32 end)
 {
-	return FLD_GET(dispc_vp_read(dispc, vp, idx), start, end);
+	return FIELD_GET(GENMASK(start, end), dispc_vp_read(dispc, vp, idx));
 }
 
 static void VP_REG_FLD_MOD(struct dispc_device *dispc, u32 vp, u32 idx, u32 val,
 			   u32 start, u32 end)
 {

-- 
2.50.1

