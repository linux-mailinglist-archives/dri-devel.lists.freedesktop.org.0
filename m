Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE53FC594CA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 18:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC83810E8FB;
	Thu, 13 Nov 2025 17:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q/KQ27u4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8F110E1E9
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 17:57:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1BB39446E0;
 Thu, 13 Nov 2025 17:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9BC60C4AF17;
 Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763056663;
 bh=Bx37k0L1IbjcU9mqRIdk43KBpDeg4zmaNkPRXHOD9Wg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Q/KQ27u4zTv29m+MjdXPAhf9lJ7mo56Y1KNWGUZ1sgEUplZw5YefEy5xlO+W1a0mP
 1VbwwqJhH0mgkLteNOM4dkZCob1578VS9UZ6O7IEZ9cAdvLyxNoGoO1s/Acka6bjQm
 CuuBMf+AX+WLJkMJkWHf+0A+DuVjVvNhoc+PsyXfx/E9mUxJ/gaY49RsFE+wJvGE6X
 uj6QlQDHysv88ZUe8l5vnrJc8c8qR10M1/uHUxVHI2oQrtAkkBSRNX80urrrslUxYu
 we9ura+z492bJ0/9qNnlRjzH4iMCPdAxtVIO84D1tNTgYDUwJxs4vArZ/CJemGnZ4U
 4uFOaq/OvVsnQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 79CA9CD8CBF;
 Thu, 13 Nov 2025 17:57:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 13 Nov 2025 18:57:41 +0100
Subject: [PATCH v2 07/12] drm/panel: sofef00: Add prepare_prev_first flag
 to drm_panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251113-sofef00-rebuild-v2-7-e175053061ec@ixit.cz>
References: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
In-Reply-To: <20251113-sofef00-rebuild-v2-0-e175053061ec@ixit.cz>
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
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpFhwUfInDpnot2Lif7w3ILqlTPGJJ3Br0iShCu
 3feEgt+KOeJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRYcFAAKCRBgAj/E00kg
 cnYBEACQAwA9BeyyljPq7HJOHrhvZh9FYpzIvYsmzMx3dCPmLQ/Uuw3LgrnfNRZkC+Pw3exppn8
 jzW7JJE8SQTfdIpZ9KegVyMdvSGzayBPe/vya5/rpDatH1qHs2LDN1lWS1V2ZC64dqQjue/33nG
 Dupj+36uT2MTYklpig2tboB0osJHbvpPNPRLKkE3avGtHppiH7mVkA//heK4AEKvpFmAITJc0Qg
 D3vFzVAe5efNs2HDairb2vJSrMHPG9oevbvRhREYdQ7Iy1StCr6qaL/6lzkIDr/Boh1JdKb0zEg
 RDh3RTAHI4x7CrvIPy5MEHVx36S0ZDY90NDxQoOOW4QVNho2HUkrsT8lMImL/yUP7xz6hiCIdiD
 9SIgjrNey5IpWRhMOjKArSiwlVxxOB2t4QHqc64/cdNAf+6WYQSwBHnmox2t71YR4Ydhc0Yydy7
 wbCi6RffWzZOOK8fsLd9Q31rvBKAhzsk2RaSo4cX0EOwlY32dCQXqefs1uMh20IrUJWfHLEoGLh
 N3HWjT+TwPCtVeO/SBd1DZkef9+Utm+ks75ibtQ99W83nr3yyT3qfnZrILqV6n+tCUJgFEfRzNL
 QNYr2U7UuKm0a7SWVZaeYmPUEK1nAPoVUzrvOmiW/kn9LUPwUChXDnoccGnvvkCE8E5B98VFI+h
 CYW5lWzbe6JxS7w==
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


