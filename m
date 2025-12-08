Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715C5CACB50
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BC810E400;
	Mon,  8 Dec 2025 09:42:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tLqJFeEM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 817B810E3E6
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 09:42:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2E688444A7;
 Mon,  8 Dec 2025 09:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBBDAC2BCB4;
 Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765186945;
 bh=KuQJjNrGdJL/Ni63TPQm2LwQNOy6M3cg97mb6xmv7yE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=tLqJFeEMUox9WvvKuYsI1sHIzp2F83ntQkxp13tJ4DYQwDoVx6xxN6EHmckpfO4N4
 IqYLpsM2BiYRBs8C1RqXfO4xoV1QM5wi7b7HG0cPblzzs4Zp0gtshdNiAZwtCHaZDY
 8zjCvmbn7B51OxeGw4i8NORASxTVbdnH7qPqsDlSzRyOSydeuSgSOLymE5SEw+o/op
 qs0Zwf79gjIbbi0eKiWW58RoHrjHfyIJk9v1a5+fNxSezjYgdrGFKkM0gzNb3lC2t7
 M4yhBHni3U3ioBnrVO0+Id+Q47HmRlAiA5VX3AlKB4Zkwepzu3O5wuhLRd88co4HFG
 5AIFrIPGSdE1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C1D14D3B7DE;
 Mon,  8 Dec 2025 09:42:25 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 08 Dec 2025 10:41:58 +0100
Subject: [PATCH v6 5/8] drm/panel: sw43408: Remove manual invocation of
 unprepare at remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-pixel-3-v6-5-e9e559d6f412@ixit.cz>
References: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
In-Reply-To: <20251208-pixel-3-v6-0-e9e559d6f412@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=PuiywuMQuz5mfrzYWDI/bKjfM/bNSPMPp8guUiS9OJE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNp1/nT0ncW/HN8DC1BrbtohoM1XJFWXxG4QT6
 OckF71CXOiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTadfwAKCRBgAj/E00kg
 crxGEACM8tsp7iNoZNIaes9bqO8Zr6PDCG/oAIECR2DvXy2Vni+p678GWQNjcGvI38Hf1taUiVg
 r1TfFU1aEzPMsxTeT3bH6D0cx3w4r2/+IJTZf5UJZhctl4V79mtnkgz6viBkGw59JTNM+oGUN7b
 CHnxaIcMqa+NH5O/cREOpRg/OXhiKfkUSsRdRAVCOXCCd9V+gR7w3fXTzbYo6epz4rx9la9UzLy
 1nFqTjlxRjXjS5f2PULAFzI2ByvJPk0OoN9fVHUbJCdK0YvufAwEA41Kxq8rIq7JMqfdRO38Q71
 aIL9SadNQExjV31pxmCSxrc4mq1N0JmfyzKv/g4RaKs2iQlknnITiwstVxgrb4QX04OjNiBQpGt
 +OYjOTTHW6r0/LrQI5eZx2Qe3NWLxOVjCk3NkXGqqNNo6HvRBs3ivAK3qEwnlsJsVW7FectspfS
 bxsOqUKfBSNCMNTvDCQn6L82njuZTFL+ak8fZapzB2cKO+brL6efoBSPIo17dazXgMQ0z+nWNiK
 mXcBEEFyLHWqFECMmeBkPNg6ZSybM//j7t6cvi373+8oxYedT67JK3sDd+PIXkascIS422oN0fC
 S9V0hFX8xShPPguAw7+UgnwXife3rDFaeNdB1phTbSNBhstsrNLkdoh95FTpfLFimONdA4bYAds
 i4EnvBYzfzewT2A==
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

From: David Heidelberg <david@ixit.cz>

The drm_panel_remove should take care of disable/unprepare. Remove the
manual call from the sw43408_remove function.

Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index dad6b967b92c2..06b9c5e650edf 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -318,10 +318,6 @@ static void sw43408_remove(struct mipi_dsi_device *dsi)
 	struct sw43408_panel *ctx = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	ret = sw43408_unprepare(&ctx->base);
-	if (ret < 0)
-		dev_err(&dsi->dev, "failed to unprepare panel: %d\n", ret);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "failed to detach from DSI host: %d\n", ret);

-- 
2.51.0


