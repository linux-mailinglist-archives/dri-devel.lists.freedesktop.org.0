Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF0B913AF4
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 15:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD68310E21D;
	Sun, 23 Jun 2024 13:45:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DwuB7TXT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FC910E1BF
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 13:45:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E1F8CCE0E83;
 Sun, 23 Jun 2024 13:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 844A5C2BD10;
 Sun, 23 Jun 2024 13:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719150308;
 bh=e2nUYJcqOmmveWyyVEjm37yY43tInovyngLChMBlzxk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DwuB7TXTo7YsLtj6eD3P2F2R9JBEY38oJEV6l4e4EF9xvx0BohQeuHLaaw2n1SFvG
 xmHMBwpAnBNg8cKRDEs4oSbwcmWFdy9rHesKQXDU5SBTUaWwqfFKU3J67inTmzDQis
 hro/i+xzKre55ffavLdmfW+B+sY4c55Onw1sZw2BClWxBH0u7vtWL6R5uDLzTaqhZm
 YIZ/WzNxpDo5diSW5j75RHnJBfM3xDCTOAugYzcj30K6ZkcQ/qmWgabzIvor3KNm/U
 //y9WIEr1AfVmcYP45YMwd2noCMoJv5RnmL20OMzFiAukBIW0oFTgyQNUg4Q69hULb
 jUY2nHEwSSRPw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Inki Dae <inki.dae@samsung.com>, Sasha Levin <sashal@kernel.org>,
 jingoohan1@gmail.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 airlied@gmail.com, daniel@ffwll.ch, krzk@kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.6 12/16] drm/exynos: dp: drop driver owner
 initialization
Date: Sun, 23 Jun 2024 09:44:41 -0400
Message-ID: <20240623134448.809470-12-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240623134448.809470-1-sashal@kernel.org>
References: <20240623134448.809470-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.35
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
index 3404ec1367fb9..71ee824c4140b 100644
--- a/drivers/gpu/drm/exynos/exynos_dp.c
+++ b/drivers/gpu/drm/exynos/exynos_dp.c
@@ -288,7 +288,6 @@ struct platform_driver dp_driver = {
 	.remove		= exynos_dp_remove,
 	.driver		= {
 		.name	= "exynos-dp",
-		.owner	= THIS_MODULE,
 		.pm	= pm_ptr(&exynos_dp_pm_ops),
 		.of_match_table = exynos_dp_match,
 	},
-- 
2.43.0

