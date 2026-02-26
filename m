Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YB6jKT01oGkqgwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:57:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ECE1A572B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 12:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D6310E8ED;
	Thu, 26 Feb 2026 11:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UM/e6rW2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E474410E8F3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 11:57:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2778A60103;
 Thu, 26 Feb 2026 11:57:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CA87AC2BCAF;
 Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772107058;
 bh=ucMHsHxdf5TzE3hMpGAQ+kPv9CQG3ym/5WbC5qqBuxo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=UM/e6rW2uXpEJxzg2GBM8qz0nXyhL7nuVp9MXxo9vUajsuYCsAHU/DLp1GaAoS56a
 nrQmUeCiL1B5h2ZsEd6x1jI0IHXS5bdWlREOD3rj+T1y1Y9eSzracC3otWs37EBwGp
 XRRVyyAk1QlAEVKm64QBqT6+j0j0qEhky7FvicBT/t+Qw2Vr3eQu3K7qKchyStiJZb
 VDXmJ1DfaTTpVPQrb2vM1GZJQXFnyc6R7TzNru2sJ9lycb+oCNKW4EFIL2VL52miwn
 9DNdMPNSDOHuU22HEhnvgIdrMkN7IMQn7yUbADxPOHsO55hfUaZLozfyVOgz4K/lhq
 Adj2EEtqn/zCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C52AEFC5915;
 Thu, 26 Feb 2026 11:57:38 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 26 Feb 2026 12:57:39 +0100
Subject: [PATCH 4/4] drm/panel: Enable GPIOLIB for panels which uses
 functions from it
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-panel-clean-up-kconfig-dep-v1-4-bb28a2355b4c@ixit.cz>
References: <20260226-panel-clean-up-kconfig-dep-v1-0-bb28a2355b4c@ixit.cz>
In-Reply-To: <20260226-panel-clean-up-kconfig-dep-v1-0-bb28a2355b4c@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 marijn.suijten@somainline.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1697; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=kZqVQhCz8mO/Ob0x0kf6kkJ6bC/I+HuiI6tMN2lM1HQ=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpoDUxIb1oNiM1pQcZ1IRqumsJw/dWkq/+JQ72L
 yYs7x/cI8OJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaaA1MQAKCRBgAj/E00kg
 cgk0D/9bMlMKwYH2QWAlbPPeFxQyphU8IEwQperjlEj13B5GyXRUVAF5IT13WBCltEfkzK1fNK1
 ots0iZrioqvhVXQJ4y1cowvEscmdFo/lGCPpoG6Zy7tO8ylbY//PzKvWC1A3vV+kkfQA5JatwpE
 KDBozz6jSEuQkRfqg4GmvLJ0qZC8JP/j7u/OB6OXseY1eB6nqDQln/H49CobFFuIJtlEW2Q08Ky
 M3iDbelVcMffLySyDOum9RrQXflc7VAUV+jOBZdwTCZkql2H+07iXNtQdzrYEDQKck7pH4JjIgT
 dlDXjev/3FuOGOCmHMR8FQiXauN+Cm4sdhsgJrO3q0EKb8TxBXt/X+LCQ/RAinjARKC7g4KfhuK
 +srBpQSt+w6RCIyXTG/X7BHkwX4+N5f8/z/ysTTkM+Lw0eI3MErK/61BEF1A8tbxzClN+o1jsS6
 pXKSTL1GGidr1Gui6quQ7D7HeUaY52incKuuczwRh//J4luWrPyEuIM2kSIqFN/lYQnVbTuyln4
 mR5qquUglVQPPViiC/f3wuL0d/7H1dHxhyPSVRnkfxnitoZbNyego7zW4gHs3TsQ5/Nti2ywa6D
 Lj1XkJyWj5l6vS7/zXNEtFpNeujObWu04wBxABirImfsADFrZhX9exvdyedCUxYkXp8/fwvYRp3
 v02FFURHEOZPYjw==
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:dmitry.baryshkov@oss.qualcomm.com,m:dsankouski@gmail.com,m:sam@ravnborg.org,m:casey.connolly@linaro.org,m:marijn.suijten@somainline.org,m:linux-kernel@vger.kernel.org,m:phone-devel@vger.kernel.org,m:david@ixit.cz,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,linux.intel.com,kernel.org,suse.de,ffwll.ch,oss.qualcomm.com,ravnborg.org];
	FORGED_SENDER(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[david.ixit.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[david@ixit.cz];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ixit.cz:mid,ixit.cz:email,ixit.cz:replyto,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 51ECE1A572B
X-Rspamd-Action: no action

From: David Heidelberg <david@ixit.cz>

These panels used on sdm845 devices are using GPIOLIB functions,
ensure it's enabled.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/Kconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 4e7b4808f6e7c..3e819b4b23962 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -107,7 +107,7 @@ config DRM_PANEL_BOE_TV101WUM_LL2
 
 config DRM_PANEL_EBBG_FT8719
 	tristate "EBBG FT8719 panel driver"
-	depends on OF
+	depends on OF && GPIOLIB
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
@@ -432,7 +432,7 @@ config DRM_PANEL_LG_LG4573
 
 config DRM_PANEL_LG_SW43408
 	tristate "LG SW43408 panel"
-	depends on OF
+	depends on OF && GPIOLIB
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	select DRM_DISPLAY_DSC_HELPER
@@ -536,7 +536,7 @@ config DRM_PANEL_NOVATEK_NT36523
 
 config DRM_PANEL_NOVATEK_NT36672A
 	tristate "Novatek NT36672A DSI panel"
-	depends on OF
+	depends on OF && GPIOLIB
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
@@ -546,7 +546,7 @@ config DRM_PANEL_NOVATEK_NT36672A
 
 config DRM_PANEL_NOVATEK_NT36672E
 	tristate "Novatek NT36672E DSI panel"
-	depends on OF
+	depends on OF && GPIOLIB
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	help
@@ -1182,7 +1182,7 @@ config DRM_PANEL_VISIONOX_R66451
 
 config DRM_PANEL_VISIONOX_RM69299
 	tristate "Visionox RM69299"
-	depends on OF
+	depends on OF && GPIOLIB
 	depends on DRM_MIPI_DSI
 	depends on BACKLIGHT_CLASS_DEVICE
 	help

-- 
2.51.0


