Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 911BC4A7494
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 16:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6486810E2CF;
	Wed,  2 Feb 2022 15:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6FD810E2CF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 15:28:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72B2A60B89;
 Wed,  2 Feb 2022 15:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590F3C340EF;
 Wed,  2 Feb 2022 15:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643815702;
 bh=8Bi2IfGYn49J1OPZx8Swg5kgcUGo31SmzEqJLAPIt6Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PSdqpwwt2XWuSndjntT7lHU8kbISW/w7lfSMig3MBvG22h8DVSWgdE/Q2LgDIKEC+
 T/ISmBA+mmIIBEq16yzUhZRnFNQescrpdvjzDTifjq0xZaKe+PiWKtctHyFAk7Hc7+
 0np7ygCglN/m6inDh54uV7PKwiJYemSz+lHkFHoFJieDls6NFtCkp3GrSY1Pqa5MmR
 0cvgB8s29gIw5OFeD8pfEyDoGO+uV8XA/dVcaeW+cXdIzdxyzGg8D9cPq/mv9nNMs5
 IXQf1be8Can2uTCOsC+jk8H31+Nq1tSeqQdcLsV7HbRbcJ+WWu5CwLDOLT2xUuVsmm
 H2uiCXhShqHlQ==
From: Mark Brown <broonie@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 1/2] drm/ili9486: Add SPI ID table
Date: Wed,  2 Feb 2022 15:26:30 +0000
Message-Id: <20220202152631.20704-2-broonie@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220202152631.20704-1-broonie@kernel.org>
References: <20220202152631.20704-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; h=from:subject;
 bh=8Bi2IfGYn49J1OPZx8Swg5kgcUGo31SmzEqJLAPIt6Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBh+qKlGUXmqAQVcau4c6lkD+meITWtN60lWSWqhQy1
 3M1Znp2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYfqipQAKCRAk1otyXVSH0NMuB/
 0W6/gCzjBhrwBLMUw28dshvvSdZivd1V3r9RdEVE1giVcRwYs3Uumxg1ngdkjzdR6IVb5v7/V/kiXG
 LY1F+T5SVilq5NZGzfLX8TNJkO1+QSDt9fvguCIsP1bjxxJo5exrp17YdbrfjaSQpj/Joc1HakWBtD
 Z6TCBvucrvDf2fOS6FSBtbchGzt8jvg83m2XKdXEIcBlEPV9PSHC5vzjl6oBnCbbsK4vSIeBka9TFJ
 5oM4uOso3QFDFodv854ISchLiStRcpshY+5PvyWvxCLRQJH+0ZfkVHZdDPEVKqX0dJZVAtl1jqfF6y
 hV/ojp8QjEsCsjaokLMgmgXhCq3SRR
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

