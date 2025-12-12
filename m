Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61921CBA05C
	for <lists+dri-devel@lfdr.de>; Sat, 13 Dec 2025 00:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F298110E97D;
	Fri, 12 Dec 2025 23:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hyUVN5pp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C576610E97C;
 Fri, 12 Dec 2025 23:08:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8887B44132;
 Fri, 12 Dec 2025 23:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5B067C113D0;
 Fri, 12 Dec 2025 23:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765580902;
 bh=oo7GvUxe2lBq6REq4/TLwjJ3sGMJYzNJk0cYx9cbmgM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=hyUVN5ppha9Y0i57OFEdIurTfLj7qRam7lwBp3CXxIooZTnJJq65X+CkhIVSiELTr
 6XXLtznrktwKQazONUhgvG2V5V4j34N4PThAhzCwWIJA+DpR9xJjynSwYnIfelOoIm
 jogc/3ZcM68FSXSuMKKeRZTT5+e8og/Kn6xk9roKBkXcI08Yp8ulUMF85RL9yuszqi
 w1fsYlYISorzsntZ8nZw3Pt6js5KOzA4KkW0nJG6IAqvgZkZy0hxl2Ke7y+2k/IxWi
 10yNzLewR36GSJouatecjFX9k1jz6uWe7vCNu2LftNFPRVmsHAYaI8EbmFoV2D1v/b
 rjmRpczX7lRTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 4AB06D59F59;
 Fri, 12 Dec 2025 23:08:22 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 13 Dec 2025 00:08:16 +0100
Subject: [PATCH 1/2] drm/msm/dpu: Add NULL pointer check in
 dpu_crtc_duplicate_state()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251213-stability-discussion-v1-1-b25df8453526@ixit.cz>
References: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
In-Reply-To: <20251213-stability-discussion-v1-0-b25df8453526@ixit.cz>
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=awDmg5Kg+/H+XtPy9XCo+xTI0vQQ43OvbZYHDH2Enjg=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpPKBkQII8PO5Rx7SPn6kSRID2R3/4fFdTDpgTQ
 6NT9bZjZRmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTygZAAKCRBgAj/E00kg
 cre1D/4qT03GfZl67wFuGoKIC52PWR93WXzhpcyxxqXURURCzRjux81RsAZNGYBQ6KcvootGuoZ
 u+XINmGXam4V36KXA4L+eNWKSAgt3bjmOl/bYRUM4fiontyWVNW9iFRFX+jMMoLxoLgKczELK2a
 vwyrj6sox1kACoZTj3uOdioc+CXpB3WkwoaFigEF/DaADT0UGInAtoYN46i6nsKoILmWmFKIJbe
 Zsrfah+aIkb9eWQDv/qQnhFqM4NYEYxeQ1hZgeMe8VbOsWzTxKS7y1lLkWonsOw01b9Eq9KA4UA
 LKPuSyhG9ignyTxyu/Qfxf2le3dYLmPIl3cldheMs6PpUejbzju4FguLVx/k36VdjM1wps6NBnr
 abs8r5Zv45L2/t8kd9kQhUW1qlntqAa3V9vsjTtoRp5ukF/eo6MMMiKBikroszOX2wEWijDPnEk
 tREiIrVdloT37C+fJz2mrIh+rdK8fmQ13oIzgDIOPnhnyssd8fJcv8WufOcMC+Q47vpBz2FNTHQ
 B0HQczn3OJS8GBDYYVG4a+LrQ7esvBawK50zaVNVvCJ7dLKOtX79IJo4WP6MAT4dU+WqFt1zDwR
 rOuuV0KPCKa7dS19Cyz89fYSv0Fo0RQdFe7h6lEMweBcwr6T6XPlODYtuWS0CgBAM+DhnOFvz0U
 w9JMVAO15wIgjtQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Petr Hodina <petr.hodina@protonmail.com>

dpu_crtc_duplicate_state() assumes that crtc->state is always valid,
but under certain error or teardown paths it may be NULL, leading to
a NULL-pointer dereference when calling to_dpu_crtc_state().

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index c39f1908ea654..d03666e14d7de 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1114,7 +1114,12 @@ static void dpu_crtc_reset(struct drm_crtc *crtc)
  */
 static struct drm_crtc_state *dpu_crtc_duplicate_state(struct drm_crtc *crtc)
 {
-	struct dpu_crtc_state *cstate, *old_cstate = to_dpu_crtc_state(crtc->state);
+	struct dpu_crtc_state *cstate, *old_cstate;
+
+	if (WARN_ON(!crtc->state))
+		return NULL;
+
+	old_cstate = to_dpu_crtc_state(crtc->state);
 
 	cstate = kmemdup(old_cstate, sizeof(*old_cstate), GFP_KERNEL);
 	if (!cstate) {

-- 
2.51.0


