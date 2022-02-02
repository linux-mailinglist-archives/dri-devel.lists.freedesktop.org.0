Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E1B4A748D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 16:24:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 306B410E2C9;
	Wed,  2 Feb 2022 15:24:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03B0910E276
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 15:24:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 77D2B615C4;
 Wed,  2 Feb 2022 15:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C7CC340EB;
 Wed,  2 Feb 2022 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643815472;
 bh=8Bi2IfGYn49J1OPZx8Swg5kgcUGo31SmzEqJLAPIt6Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QRCEtAYM9N/4J2Qaty/D5hID4pAEFZpUljOukDJgnOomBUATc/9biTeVlOAGCncgw
 w0O/KdKT6dhy6GCiDN/noo7pdtFyD5NER3klcKDOHrAVXk/Zx8UeXbNXzBaToNb9IS
 zzmvk4+k8Tzb8/0wkVdHcRpiXPybihgofz6tALR04LPK5D+Mw9Ui1VjzocyzUr+ks7
 W4szE79EN4VVOFeWeAIzf/smMhjg7qMA46NqRUGsRvz8AiGanZPauwEHn/L7BafoS7
 L5xBgG9hsanevxBkIc7PnVUNcpYcO9EnXKBOjRG2jz1M7aIqGh8vCnMm75sPSBRyyI
 pnYTrVwTd6qWw==
From: Mark Brown <broonie@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/3] drm/ili9486: Add SPI ID table
Date: Wed,  2 Feb 2022 15:23:52 +0000
Message-Id: <20220202152352.20342-4-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202152352.20342-1-broonie@kernel.org>
References: <20220202152352.20342-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; h=from:subject;
 bh=8Bi2IfGYn49J1OPZx8Swg5kgcUGo31SmzEqJLAPIt6Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+qIGGUXmqAQVcau4c6lkD+meITWtN60lWSWqhQy1
 3M1Znp2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfqiBgAKCRAk1otyXVSH0I0QB/
 46xjhigWmNH2nLTkg6bGiO9zHTMWcu/gK4QtqklMn9ZxF/tIblGEoq1oSgPvvz0U0JAqd99KKJkff9
 1+/k80e2nK1OQ4yT7BB62pdCEiIjHFw+IPM1swCcTweNDPW6vkHfWV7oPCySov68XeHLmwxS6dS6bM
 Ne57vOJIGOcipFC96B7RP3i8e0ayFPmiD93gDzP0SmacFZ0E3akqRJ7QwEHmdGDOa1xEX648JdgL0g
 EX7avg/UBBYFCvsMxqrZ83PLg17qIMFkcLEwW20zTu4YBfi2dpfe4YCS/Pye9cj7nwOci0dL2hBUDo
 hviwSOoWGBGVSbGy8Zqsoso2AW8lz1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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
Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently autoloading for SPI devices does not use the DT ID table, it uses
SPI modalises. Supporting OF modalises is going to be difficult if not
impractical, an attempt was made but has been reverted, so ensure that
module autoloading works for this driver by ensuring that there are SPI IDs
for all OF IDs.

Fixes: 96c8395e2166 ("spi: Revert modalias changes")
Signed-off-by: Mark Brown <broonie@kernel.org>
Cc: Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
---
 drivers/gpu/drm/tiny/ili9486.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tiny/ili9486.c b/drivers/gpu/drm/tiny/ili9486.c
index e9a63f4b2993..da4dc48db030 100644
--- a/drivers/gpu/drm/tiny/ili9486.c
+++ b/drivers/gpu/drm/tiny/ili9486.c
@@ -182,6 +182,8 @@ MODULE_DEVICE_TABLE(of, ili9486_of_match);
 
 static const struct spi_device_id ili9486_id[] = {
 	{ "ili9486", 0 },
+	{ "rpi-lcd-35", 0 },
+	{ "piscreen", 0 },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, ili9486_id);
-- 
2.30.2

