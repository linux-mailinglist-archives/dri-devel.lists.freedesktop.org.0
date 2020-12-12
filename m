Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 999A82D877B
	for <lists+dri-devel@lfdr.de>; Sat, 12 Dec 2020 17:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6666E884;
	Sat, 12 Dec 2020 16:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0636E884
 for <dri-devel@lists.freedesktop.org>; Sat, 12 Dec 2020 16:08:06 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.9 01/23] drm/tegra: sor: Don't warn on probe deferral
Date: Sat, 12 Dec 2020 11:07:42 -0500
Message-Id: <20201212160804.2334982-1-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
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
Cc: Sasha Levin <sashal@kernel.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <treding@nvidia.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jon Hunter <jonathanh@nvidia.com>

[ Upstream commit cb7ff314e1d9f3d6c62fa2c392e41174721ed0b3 ]

Deferred probe is an expected return value for tegra_output_probe().
Given that the driver deals with it properly, there's no need to output
a warning that may potentially confuse users.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/tegra/sor.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 45b5258c77a29..5d9a7f008fc6c 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3759,10 +3759,9 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		return err;
 
 	err = tegra_output_probe(&sor->output);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to probe output: %d\n", err);
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to probe output\n");
 
 	if (sor->ops && sor->ops->probe) {
 		err = sor->ops->probe(sor);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
