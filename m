Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2609B15B02
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 10:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F2010E42E;
	Wed, 30 Jul 2025 08:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i5GdIDge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5293210E42F
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 08:57:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D2DE05C5408;
 Wed, 30 Jul 2025 08:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54412C4CEF5;
 Wed, 30 Jul 2025 08:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753865841;
 bh=H/6/5bAJLbAq+nuixRMqwlb5Gusenrm0K1/fZ3hIW4I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=i5GdIDgeuGlIiIA3wR9Rs9JJnKFpuc2eviF1jmVGo64vVIpEi5ApdBe9Trj3hRX46
 quFS0hzcVYDwjYjjmzHwL6EpTdRPxmS6TaDN1j3TWfibcAr4lWnRkTtHj8JXat+QLu
 Cpu7KCS7TjaoUA9RpAS2OhM7dmZpd1pBDpiH/dUWgJYV6emhtC+ivs2S0LHOfKn9jP
 PtFpZjTcNbOecNrsnFUA4hFtoZnc3MuVnymuOOG2dMQfFNvNRSHS9O+8JFSn/vA/te
 fj7uoXBGTlL3g6D+eJ6/9LoWMvCAaIQU7NugogaPaoBNDxeoMHLWxXMiZrnOYd8vMh
 PcOw08aS84e1Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 30 Jul 2025 10:57:03 +0200
Subject: [PATCH 03/14] drm/tidss: dispc: Switch to FIELD_PREP for FLD_VAL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250730-drm-tidss-field-api-v1-3-a71ae8dd2782@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=943; i=mripard@kernel.org;
 h=from:subject:message-id; bh=H/6/5bAJLbAq+nuixRMqwlb5Gusenrm0K1/fZ3hIW4I=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBmd9xJCLIrEl5pk5V7bMq9SzTOwcO/3+f6nj7zYpOmin
 9pQ5BbQMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZyV4exYXvx38ur0t9eyLyn
 wm1zXV91wbm0TaUbe5zkdVymzVyjysruahURqxAy98LfnstnGb7LMdZHTp296NKV0NKMO78rp65
 fu25zZ1JUpkxS5KL/E2L+u01f4fHF4I5I85dz+yrbPbjYLpoCAA==
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

The FLD_VAL function in the dispc driver hand-rolls what the FIELD_PREP
macro provides. Let's switch to the latter.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_dispc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 5a0904acbed279506df2edad559dfe06f25cd7b5..7e36f5af666342dc4f5fa9159d829d88362de18c 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -609,11 +609,11 @@ void tidss_disable_oldi(struct tidss_device *tidss, u32 hw_videoport)
  * number. For example 7:0
  */
 
 static u32 FLD_VAL(u32 val, u32 start, u32 end)
 {
-	return (val << end) & GENMASK(start, end);
+	return FIELD_PREP(GENMASK(start, end), val);
 }
 
 static u32 FLD_GET(u32 val, u32 start, u32 end)
 {
 	return (val & GENMASK(start, end)) >> end;

-- 
2.50.1

