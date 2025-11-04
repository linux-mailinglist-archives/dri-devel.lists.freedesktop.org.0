Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EBAC33256
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 23:16:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B9510E67A;
	Tue,  4 Nov 2025 22:16:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OMGXr2iJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123EC10E67A
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 22:16:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3A66660213;
 Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E2C0DC2BCB3;
 Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762294574;
 bh=Bx37k0L1IbjcU9mqRIdk43KBpDeg4zmaNkPRXHOD9Wg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=OMGXr2iJf/8rsWuWsRkQEUCt+QG848alhmv3H82egl+ikPpaD+geGALpMg533n1tR
 b5KshPhiU9pnog0sUP4pd2HD2Z9fVsksteHP1zLrX0ErslHeZIBdjbvQM8VFxq1R4j
 kSHUDwUV82/NcdO4f8CYrMqwpQWLCQC6A15cOlInEJrAV5uDJEqqTjA/ZnVP7UXh3d
 6w+r0F5BnlhuN0jkAWYVtFZ9uDWEfhHeoxFeNW5XrlXg8ysDAiDM32WbHy5LMmOzik
 yHrxdsESXox1uNyvJg1D08VVy7MrRD8+yZvLXsqVoCyxBAWZeF9YwLQ+w3Tf8KvsZ6
 ZDgVi4+VuIy6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id DAABECCFA04;
 Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 04 Nov 2025 23:16:15 +0100
Subject: [PATCH 07/12] drm/panel: sofef00: Add prepare_prev_first flag to
 drm_panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-sofef00-rebuild-v1-7-dfcfa17eb176@ixit.cz>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
In-Reply-To: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=918; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=4SM9hcft9HxR/OcdKpSF5Ee1W0Jyu8dLyBp//WZCcbk=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCnss+C9hk8uD4rNM/1XSy6pPmwJAizKBdA2Tk
 +J08t4NnMOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQp7LAAKCRBgAj/E00kg
 ckpzD/sGiOdjJOm67e/IWCJRiB70hkmMzwyd7d2X1z27QAASZbQDVydTNZ6yBZPkWcYHqe+a7PG
 qE4V4j27CFp3Ks7KZKWcqBw+la5eWDawaBHsOrgxgEUoBFj2WOsOdLjGfSaotZMjwXVh6w9/qpY
 EboGao+eScyFL0p3wP/DNJ15mmbIJvRZ/D5jxNjNvrPoVmrTIb//y5Fi8nVZMU8P5Vc0UIbgpvo
 zniS3Vs8zxet5f++N/VEs8MeSG3kI2qSZ7c9/17NQmGizFjojUd0LqpBkJ89OPJNKPkLxbRoQpT
 gwBchZoh18w7tnfhVFEdhvM0gIQjdN2FMRxMJKAzNBDMEc16gQ1da34gEFfaA7J0zlJawO5Ok+7
 SLGEySIfPvat/echxOdjop+X8H4Mjhnk4XPjI/xIVmXYbhbYHoE6pRKWm++sIAEDourhE06vr34
 jdgDtjJe6g08+7dFznx4A6HxkPemJR8NqY0WYD9X7hH2zjVkIgdE7Lr5BTraQwPayCuSPPMrcFC
 jtf/6a2sUlStigVdz83Z1Yd7edf/gpKuyFwZ48aJVK/WHz1E2oMP2ZkmifyTU3YU3VgI+xk2qFW
 6S0WcWoI2rnaH7YNLOmB3LGy/va8bKB71QsAr7l4nOg1TdsDnR0mXYloCgWqAzXWIg1A3EFvPnY
 tzxRrQfx8vbCrkQ==
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

From: Casey Connolly <casey.connolly@linaro.org>

This corrects the host initialisation sequence so that we can send
DSI/DCS commands in prepare().

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 97122ec8872a1..0d3ae0689a19b 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -242,6 +242,8 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 
+	ctx->panel.prepare_prev_first = true;
+
 	ctx->panel.backlight = sofef00_create_backlight(dsi);
 	if (IS_ERR(ctx->panel.backlight))
 		return dev_err_probe(dev, PTR_ERR(ctx->panel.backlight),

-- 
2.51.0


