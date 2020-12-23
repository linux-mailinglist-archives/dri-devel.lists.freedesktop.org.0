Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9951E2E11CD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Dec 2020 03:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C066E89F;
	Wed, 23 Dec 2020 02:17:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2056E8A6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Dec 2020 02:17:36 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D40802339D;
 Wed, 23 Dec 2020 02:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1608689856;
 bh=VvXvEW1RDgg5wGctb1IXHpEUGrkdqawmRiT3EwkA874=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cdyn4uxmfPpuECll+nej6tKujmh8/ZU2Tp0WKhvO+Q5doCgy7t3SVyaRKmvgd/5vX
 Kqy9hmDsjffgzgcMGlrO3PTScUgOSCtovvTSe8FNAvzrobXLdFShUeL0DB968Oe57C
 xad6q/+Qq7tLxBy9Y9z+JvbqKwq83IGeZlEM0og5I1lXg1mgpz83Lp2+VBXkVYuJvB
 uwyFOorO87BlgXHM1fVToZXLY+1Cjzyhs/Cd1gVfq62dL8GBqQOBSwTshtTgYHkhY2
 sG9ongEzY9VgkF1ogJsqpIJ6yNMdogNrxOTduTbSeNRgGnQSNrtRv89Jo7HQR7aVq0
 mr2g8idEkMlOw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 054/217] drm/ast: Fixed 1920x1080 sync. polarity
 issue
Date: Tue, 22 Dec 2020 21:13:43 -0500
Message-Id: <20201223021626.2790791-54-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223021626.2790791-1-sashal@kernel.org>
References: <20201223021626.2790791-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>

[ Upstream commit 2d26123dd9075df82f217364f585a3a6aab5412d ]

[Bug] Change the vertical synchroous polary of 1920x1080 @60Hz
      from  Negtive to Positive

Signed-off-by: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20201105094729.106059-1-kuohsiang_chou@aspeedtech.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ast/ast_tables.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_tables.h b/drivers/gpu/drm/ast/ast_tables.h
index d665dd5af5dd8..dbe1cc620f6e6 100644
--- a/drivers/gpu/drm/ast/ast_tables.h
+++ b/drivers/gpu/drm/ast/ast_tables.h
@@ -293,10 +293,10 @@ static const struct ast_vbios_enhtable res_1600x900[] = {
 
 static const struct ast_vbios_enhtable res_1920x1080[] = {
 	{2200, 1920, 88, 44, 1125, 1080, 4, 5, VCLK148_5,	/* 60Hz */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
+	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
 	  AST2500PreCatchCRT), 60, 1, 0x38 },
 	{2200, 1920, 88, 44, 1125, 1080, 4, 5, VCLK148_5,	/* 60Hz */
-	 (SyncNP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
+	 (SyncPP | Charx8Dot | LineCompareOff | WideScreenMode | NewModeInfo |
 	  AST2500PreCatchCRT), 0xFF, 1, 0x38 },
 };
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
