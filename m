Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7F1CAA6EC
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 14:34:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FFB210E2E6;
	Sat,  6 Dec 2025 13:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JhHA1rHq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A775E10E2E5
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 13:34:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5EC074446B;
 Sat,  6 Dec 2025 13:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 39129C19425;
 Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765028084;
 bh=KuQJjNrGdJL/Ni63TPQm2LwQNOy6M3cg97mb6xmv7yE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=JhHA1rHqRk3EhIOjvcz1ohZe9sT5mihJlChHeywfSEtHccNaqY7OsL0K2cLFDgtkb
 J7iDseTO0oFbu41It/cj+ahu4Pr5A7MggjE03/ObRptPVTp/fvegZCxaTX+43qZowS
 /EV4oxtDffoDgWsGUpz050Z+s1hUMpSztMTeTE3/iwBBML86/tnfRQwp8iw9aJA/gM
 VZYXBJHY+LWtJGmahTd9NYERY/RbTFvJAQBOZe0IszZXUtJNVuk/059n+NE333g/CS
 0wSyf1vIhJUUOIG/3jsyFTJRM4mLbeiGVcPerL13O4Spc9aDzm7sVLHbvDDkKZSPNH
 BDmF2Nu0RFrLw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 2EF36D3B7D8;
 Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 06 Dec 2025 14:34:22 +0100
Subject: [PATCH v5 5/8] drm/panel: sw43408: Remove manual invocation of
 unprepare at remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-pixel-3-v5-5-dc99732e7d35@ixit.cz>
References: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
In-Reply-To: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNDDwY0ERXfUW3N0g+94UgwVhtHdJ8Tb8p35Em
 7P1729P9UiJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTQw8AAKCRBgAj/E00kg
 coylD/wK7IsESE8JYD63DU9hna3qtf3ILJfjOrCsRvoMGkh9B2dZiRDS+611tSJGMaw7lWKdCs6
 vGJwrMMB/EWlKH6U+RJRq4SN+UXr1SmsSa/Bi2slc9FT4fmiPTI+CrpO8dEVkPTqWL+jJ84GTXo
 p4VtTNPO+/IirdnEGh2/J6q558CwVbCc/+UkNjlG4Ucd/5pZHeKs9oGSmt5s8ZsmPfm/ncrur5c
 FNnbAXgtXlmDpnhpak8xqhW+ekRm/WHgrK0U7kGAMBhg58fMP7iMuOIz9y8PizdPs3gqkQdQOrx
 ZJ+jqEUNUv8+iDnzldO3m6E9675pFVw0Bh7vBqcxMHAWQ8mmb2az8zGCko7Msv6SgK2aR2/XYtJ
 CgKe8+uZ8FjEh+Foa2q+BH8V2o1Jm/ByQ/pQ2rnB2CKCKU36SrqyXyjvqf8qOthLlHBrfL7K2nj
 Mn9dVRIRyTiqacYi2FPSqsA3Jw/OZrZwZOK0MijnMTJ+UcOXB7ut3gZVgWJXa5N4i83Ges+PRGN
 UpAIKZ79FL4VwfxGGxVwvbdjO1RuXTKJYkgzD4wZqzlNGAAYfg2XXZ4PfMGhCM/tw0Rq7PmXVlL
 s3AoltXGw5Om5q9W5xR7GmJJXUFKTSoWW9WWZBXp+OOeFzYVoxS5slH/rWG+ZTC/645OZdBB4ZP
 3o7N9HFPy+cJgXw==
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


