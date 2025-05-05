Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95915AAA0AA
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:38:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB47C10E4EF;
	Mon,  5 May 2025 22:38:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Slsmkli4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B1E10E4EF
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 22:38:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 60985629C8;
 Mon,  5 May 2025 22:37:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5AA9C4CEEF;
 Mon,  5 May 2025 22:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484684;
 bh=fZ/k/sC8FQk0k0la1SgTsQ/eyOeJI4qHzs6b9tOGb04=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Slsmkli4hZUISzOO/0b8T/hLx5xo+EFxWa01/ipoPtDjxne4NNRKHEGtWro5LNxlf
 Lj3tG5RqASNiB65W8pTrGSbBqOXbMoT7vDoqvErPqhLq17wcNEUhdlry136nQAU/jG
 ebsjRD8+Ir5TmlStfPzln+EDzNcQwnWP7Wh+Bdk/0dR0mSdMGuCvVq6u3vgZncKXBt
 /0MJan+Sn3YI4IzIzD7ler7RWatTTICLjuGTRjzEfkkohmVGLOYHf7KwNYZ2s4exzE
 vzra8BtgS0GJWEz/q2/7h0/wuzcivzVPaMAt6+aRBxNTe3xla8lGSXEW2jTbkIo469
 x1W1QRiWOV0DQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, Sasha Levin <sashal@kernel.org>,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 605/642] drm/ast: Hide Gens 1 to 3 TX detection
 in branch
Date: Mon,  5 May 2025 18:13:41 -0400
Message-Id: <20250505221419.2672473-605-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
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

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit 87478ba50a05a1f44508316ae109622e8a85adc9 ]

Gen7 only supports ASTDP. Gens 4 to 6 support various TX chips,
except ASTDP. These boards detect the TX chips by reading the SoC
scratch register as VGACRD1.

Gens 1 to 3 only support SIL164. These boards read the DVO bit from
VGACRA3. Hence move this test behind a branch, so that it does not
run on later generations.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250117103450.28692-6-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ast/ast_main.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_main.c b/drivers/gpu/drm/ast/ast_main.c
index bc37c65305d48..96470fc8e6e53 100644
--- a/drivers/gpu/drm/ast/ast_main.c
+++ b/drivers/gpu/drm/ast/ast_main.c
@@ -96,21 +96,21 @@ static void ast_detect_tx_chip(struct ast_device *ast, bool need_post)
 	/* Check 3rd Tx option (digital output afaik) */
 	ast->tx_chip = AST_TX_NONE;
 
-	/*
-	 * VGACRA3 Enhanced Color Mode Register, check if DVO is already
-	 * enabled, in that case, assume we have a SIL164 TMDS transmitter
-	 *
-	 * Don't make that assumption if we the chip wasn't enabled and
-	 * is at power-on reset, otherwise we'll incorrectly "detect" a
-	 * SIL164 when there is none.
-	 */
-	if (!need_post) {
-		jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
-		if (jreg & 0x80)
-			ast->tx_chip = AST_TX_SIL164;
-	}
-
-	if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
+	if (AST_GEN(ast) <= 3) {
+		/*
+		 * VGACRA3 Enhanced Color Mode Register, check if DVO is already
+		 * enabled, in that case, assume we have a SIL164 TMDS transmitter
+		 *
+		 * Don't make that assumption if we the chip wasn't enabled and
+		 * is at power-on reset, otherwise we'll incorrectly "detect" a
+		 * SIL164 when there is none.
+		 */
+		if (!need_post) {
+			jreg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xff);
+			if (jreg & 0x80)
+				ast->tx_chip = AST_TX_SIL164;
+		}
+	} else if (IS_AST_GEN4(ast) || IS_AST_GEN5(ast) || IS_AST_GEN6(ast)) {
 		/*
 		 * On AST GEN4+, look the configuration set by the SoC in
 		 * the SOC scratch register #1 bits 11:8 (interestingly marked
-- 
2.39.5

