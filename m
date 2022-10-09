Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2AD5F9414
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 01:52:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9D0310E583;
	Sun,  9 Oct 2022 23:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C678610E57D
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Oct 2022 23:52:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 52ECE60CF5;
 Sun,  9 Oct 2022 23:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA2FBC43146;
 Sun,  9 Oct 2022 23:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665359551;
 bh=MaQazHfFY/HDy6I/LWmFBbykNt6P66Lp3uE6fOgsq4Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gOw6C4QCJURDiQLDtBpS34fqB6RvPxYPRw06uFORPbSliLhrK70UHaAF3i7I8c09I
 faNChn72+pEDaKLpPrvJ2Ln1kcKDjCtTyXOpIrSdj/0vglURUuDIc/H/CRbha7w94j
 31ptIU4AHVATPXgHnSGh041R0T7VOIHgLdjw0q4j/tfKo7R+3r6AgPJipZiGSqMOiK
 u6NR0bHNGdfuSsPbme++4QxmOfiYClFyXX3kOtL9jqyozT3XH4yOZ1m9OwlcMfwMMY
 6WKHB9IzVJQ3wWWmSb48Jsi7WWCaEVEbYm4Vl84kUKmhizpgbGfyT2zyY4R9DuG9f0
 zDwoCS2uD000Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.19 05/36] gpu: lontium-lt9611: Fix NULL pointer
 dereference in lt9611_connector_init()
Date: Sun,  9 Oct 2022 19:51:51 -0400
Message-Id: <20221009235222.1230786-5-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221009235222.1230786-1-sashal@kernel.org>
References: <20221009235222.1230786-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, neil.armstrong@linaro.org,
 Zeng Jingxiang <linuszeng@tencent.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, andrzej.hajda@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zeng Jingxiang <linuszeng@tencent.com>

[ Upstream commit ef8886f321c5dab8124b9153d25afa2a71d05323 ]

A NULL check for bridge->encoder shows that it may be NULL, but it
already been dereferenced on all paths leading to the check.
812	if (!bridge->encoder) {

Dereference the pointer bridge->encoder.
810	drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);

Signed-off-by: Zeng Jingxiang <linuszeng@tencent.com>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20220727073119.1578972-1-zengjx95@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index c0b182d1374e..7f688ebd36eb 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -807,13 +807,14 @@ static int lt9611_connector_init(struct drm_bridge *bridge, struct lt9611 *lt961
 
 	drm_connector_helper_add(&lt9611->connector,
 				 &lt9611_bridge_connector_helper_funcs);
-	drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
 
 	if (!bridge->encoder) {
 		DRM_ERROR("Parent encoder object not found");
 		return -ENODEV;
 	}
 
+	drm_connector_attach_encoder(&lt9611->connector, bridge->encoder);
+
 	return 0;
 }
 
-- 
2.35.1

