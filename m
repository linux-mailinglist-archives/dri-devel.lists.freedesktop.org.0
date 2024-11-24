Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6FC79D6FCE
	for <lists+dri-devel@lfdr.de>; Sun, 24 Nov 2024 14:20:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA1910E280;
	Sun, 24 Nov 2024 13:20:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ankNOU+s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91E3210E280
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Nov 2024 13:20:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 32B5C5C4AA9;
 Sun, 24 Nov 2024 13:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EBF28C4CED1;
 Sun, 24 Nov 2024 13:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732454420;
 bh=COLrg2AbV+4KaQRU2Xw2S5L8rp55JjS366Yv/REeB7o=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=ankNOU+sNlvPzu7aVcv0Nu1rt1QNXgVfLjuGXSUK+0Q1S0nZjoHzhSp36ytGu5QDj
 hg1xUjxiTzBXcRjMD4WbYcyiGIFkemDnHDdK7yr1PgkFIBeleapXR3Ay/b98dtKOBi
 UOrJbzvOobUxOg4Hc1dT0f6+FkVWT3Ntxpb1h7iSsOBCGpopb/7zxRGcavhw3S45J0
 as/+CzNwvAjdbx9PYKMEabJcmjmaqRYCiXPUSCNzVIshpVF2HbBVFsJesRWxVOJU5U
 fxXVrenqewtVy9ziGlfTWPpz4eHrBu9F8+TTmWtrHiC0lV6SNB61t7CICoWzIlON9U
 k12O0E3FreXDA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id DD89FE668B3;
 Sun, 24 Nov 2024 13:20:19 +0000 (UTC)
From: Jens Glathe via B4 Relay
 <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Sun, 24 Nov 2024 14:20:16 +0100
Subject: [PATCH 2/4] firmware: qcom: scm: Allow QSEECOM for HP Omnibook X14
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-hp-omnibook-x14-v1-2-e4262f0254fa@oldschoolsolutions.biz>
References: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
In-Reply-To: <20241124-hp-omnibook-x14-v1-0-e4262f0254fa@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kalle Valo <kvalo@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732454418; l=867;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=5Oq4MdNKXVyJJvjmJFPu8lXVv7qb44phd5FkFC6DLHc=;
 b=c1BV0KHilcb39Fjlaivy9pRBPbkrXPTJ7cIkxiZwJZVYVc+U8jilpWaBMB6TjhPWu/qN/IZo8
 2ci2cUXmz9kCmvqqde42vuEO4ydIFYLXIpIeY8BEKSnOw2pjlgwFFPY
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
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
Reply-To: jens.glathe@oldschoolsolutions.biz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

add "hp,omnibook-x14" as compatible device for QSEECOM

This is required to get access to efivars and uefi boot loader support.

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 72bf87ddcd969..2e148fb7167be 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1769,6 +1769,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "dell,xps13-9345" },
+	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "lenovo,flex-5g" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
 	{ .compatible = "lenovo,thinkpad-x13s", },

-- 
2.43.0


