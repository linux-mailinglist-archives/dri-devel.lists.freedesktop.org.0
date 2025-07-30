Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5FEB15B01
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 10:57:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2A010E42F;
	Wed, 30 Jul 2025 08:57:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hyl9tMrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5828E10E433
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 08:57:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EED4A5C5420;
 Wed, 30 Jul 2025 08:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D3C3C4CEE7;
 Wed, 30 Jul 2025 08:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753865838;
 bh=bkLVe2XldDNNSNpRPNT/dLJIjNP/DhhAJl1lPaX/SsQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Hyl9tMrt6H46igkWQMrC4KuPDiVeh53jAxZsEZ3MD5VsSbblYHRlmBq+cce4DlYMC
 1Z2tQbS8TLexrsILrcjCVaGwib7AXdmb3XELo8FVMtEvLaKwaxowlPGpW3Az9+OVM+
 CdO4g/k8HOlvSvbrt12XKytowS43sCTKtX+j9kCgpG4PGuH9eWf4gUOpRSxNbbHTYP
 t8ASYrE0uNizjGiNlYS8ovcsHimMp5LGLEi9ozyrRAUjDduouDVOHoltb6rHz1+9Hn
 MHNHO1At+ejsTpd67wP1NkOnzIA8WGYbXt3ZCiAtMnh+NqAakFyEtzknbnJZ24wYZh
 DjpZs7ahOKuiQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 30 Jul 2025 10:57:02 +0200
Subject: [PATCH 02/14] drm/tidss: dispc: Switch to GENMASK instead of FLD_MASK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-drm-tidss-field-api-v1-2-a71ae8dd2782@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532; i=mripard@kernel.org;
 h=from:subject:message-id; bh=bkLVe2XldDNNSNpRPNT/dLJIjNP/DhhAJl1lPaX/SsQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmd9xKmbpyxo8Ih/+jppS8TWVa8X9m67c/9RUqKhWeyv
 ALjpk2b2TGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmsrWQsU7NWtfQu/nvceag
 C/Yvgsrrpq/b8Z733NTlVapu/+I1Le5zrgmWEfCxaKxheLPHO2hfNGPD3hfiK3+yvn1pNPW9Unz
 +Ga/Tv3Nm/rzskZlxOUnVykYpw6S1MVgkz1/2N5NoTEH0jx4A
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

The dispc FLD_MASK function is an exact equivalent of the GENMASK macro.
Let's convert the dispc driver to the latter.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 8ec06412cffa71512cead9725bb43440258eb1ec..5a0904acbed279506df2edad559dfe06f25cd7b5 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -607,28 +607,23 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
 /*
  * TRM gives bitfields as start:end, where start is the higher bit
  * number. For example 7:0
  */
 
-static u32 FLD_MASK(u32 start, u32 end)
-{
-	return ((1 << (start - end + 1)) - 1) << end;
-}
-
 static u32 FLD_VAL(u32 val, u32 start, u32 end)
 {
-	return (val << end) & FLD_MASK(start, end);
+	return (val << end) & GENMASK(start, end);
 }
 
 static u32 FLD_GET(u32 val, u32 start, u32 end)
 {
-	return (val & FLD_MASK(start, end)) >> end;
+	return (val & GENMASK(start, end)) >> end;
 }
 
 static u32 FLD_MOD(u32 orig, u32 val, u32 start, u32 end)
 {
-	return (orig & ~FLD_MASK(start, end)) | FLD_VAL(val, start, end);
+	return (orig & ~GENMASK(start, end)) | FLD_VAL(val, start, end);
 }
 
 static u32 REG_GET(struct dispc_device *dispc, u32 idx, u32 start, u32 end)
 {
 	return FLD_GET(dispc_read(dispc, idx), start, end);

-- 
2.50.1

