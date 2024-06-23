Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC41C913AE9
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 15:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACE010E135;
	Sun, 23 Jun 2024 13:44:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CJhWGD1x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC8110E135
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 13:44:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A92DDCE0EB9;
 Sun, 23 Jun 2024 13:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34680C32781;
 Sun, 23 Jun 2024 13:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719150269;
 bh=2VViG7Ljb3t8VZRFZHT3YXOFyq8TksW57NNk5hqXajk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CJhWGD1xtFS3JoQZHj1qPIdUbbl0i4oGly7NqtnG3ZgWqFR6KaUU5L0dXI7U0ehG2
 EHjItsmYd2VsEoNUEtCp6Xq9mpm1KR43uBdSSEr96S2gUPeXBLRvejP7gsT0VJibqN
 9Pdra4S50lH4EUqWVrDW7F0eI/lNDE+sWszeGNb1Rc8BNWurPR2v6891KZMs8H7Pak
 2mp2LIAougvYN1gy1Pi0rFIlvpKjkgr8Qb+aZNsCkWttMtMvo4YlUiboV1Whld3F6k
 PYcjeiyTWJ2iAF67hIiggX6o05HlazOF5TJv+02YOOaU3UFGVUyLTS4JfclCgT4fRU
 ap5AC/w67wLDg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Inki Dae <inki.dae@samsung.com>, Sasha Levin <sashal@kernel.org>,
 jingoohan1@gmail.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 airlied@gmail.com, daniel@ffwll.ch, krzk@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.9 14/21] drm/exynos: dp: drop driver owner
 initialization
Date: Sun, 23 Jun 2024 09:43:47 -0400
Message-ID: <20240623134405.809025-14-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623134405.809025-1-sashal@kernel.org>
References: <20240623134405.809025-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.9.6
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit 1f3512cdf8299f9edaea9046d53ea324a7730bab ]

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_dp.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_dp.c b/drivers/gpu/drm/exynos/exynos_dp.c
index f48c4343f4690..3e6d4c6aa877e 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -285,7 +285,6 @@ struct platform_driver dp_driver = {
 	.remove_new	= exynos_dp_remove,
 	.driver		= {
 		.name	= "exynos-dp",
-		.owner	= THIS_MODULE,
 		.pm	= pm_ptr(&exynos_dp_pm_ops),
 		.of_match_table = exynos_dp_match,
 	},
-- 
2.43.0

