Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD862A9233
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 10:14:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C516E34B;
	Fri,  6 Nov 2020 09:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87176E34B
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 09:14:27 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fa513f60001>; Fri, 06 Nov 2020 01:14:30 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 09:14:26 +0000
Received: from moonraker.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 6 Nov 2020 09:14:25 +0000
From: Jon Hunter <jonathanh@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH V3] drm/tegra: sor: Don't warn on probe deferral
Date: Fri, 6 Nov 2020 09:14:20 +0000
Message-ID: <20201106091420.773062-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1604654070; bh=aKTFlrpqLCkiGuH1D+3SmNI+TCihd2e9AeWXjqSfdIQ=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
 X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
 b=TjxdrtYpeRrwSpVHKEE2GTnd4ALHUZOUhGiAaZgWx4a8cutp4FUt09DCSiL2TgwC0
 GQKSTwmHh1ObVWNd/XBHOEXSrqkomKWlccX6WcleeXrSLr1lOFDOB1ydvh3/ZBvGVK
 RJfP7rtgqVMGFc9xQiZD2lG3JU8WAJS/Ma0GE9i0hz3A0xLCRPMsRjWuCR4SZER2VR
 c0Ufgjdah5Jic/zRzKpBnhfWKqjwKiq9XVKqN+Uo5jQD/5CuVn4kWEZei/TrllCrnQ
 PxWPXCGOEnm9Utc3I/Cb9jqUdX0daiTVJ1GbZlUj1vJZ5tVXSVQd4jd77AFOdo/y+g
 hHryeCHzsu5Mw==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Deferred probe is an expected return value for tegra_output_probe().
Given that the driver deals with it properly, there's no need to output
a warning that may potentially confuse users.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V2:
- Removed duplicate errno print
Changes since V1:
- This time, I actually validated it!

 drivers/gpu/drm/tegra/sor.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index e88a17c2937f..a5b944dacb35 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3764,10 +3764,9 @@ static int tegra_sor_probe(struct platform_device *pdev)
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
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
