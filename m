Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DAA6493A40
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 13:28:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D02D10F0D8;
	Wed, 19 Jan 2022 12:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53AA610F0D4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 12:28:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso14239130wmj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 04:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r544K7uLseHgCwnr0wVsLsWb82uTNW4lOUdN19AMQDw=;
 b=ceClqTAml5TYR5w+T+ZUWlwr1D+2NbFkj4hG8uCQABlOpUcRyrrtPMpIl7N/U2sTCd
 uHy+5wvddi5ifxY2MRj4gPyKyMexkgoGN2BcnSdELPzOdgrBLXVyhyKFTVTAnBhjCaSq
 upeG3CpIhfmFfjyZER+/wNiTMnAqdPBwK7PG6rB+BdYy2kmLDEzlVPLDAa6+9yQl51Mn
 uX+3SYqEG0XjAQNmKp1DJRxIp2NdNDAuQZpw1PKuN0l4rJajkxh12xqHAqy5lQ0kE3yY
 WmT6OzgdO2wTmA62wb/p7F09kM9gYqtMxelo/nX7EFeTqku29l9GNYSzhaAS2x8hkClm
 sW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=r544K7uLseHgCwnr0wVsLsWb82uTNW4lOUdN19AMQDw=;
 b=I2v6/o2IMKa+uoXbN8i5RPoErZ/ick7nVzvhN0eAJn+VFxDX2m+/VopgCwFmtt1deh
 IfQNpd6d0MH4coI75Q78CtgujYSI7f1AeB/gn8i128MpY9CON6MZBLG6ow7bdbDiGAZK
 dYea78IQ9eblVPSDRzkUVIS/19FwrQT0w/srvPeadSnHx+dvJ4V4++/58DstxO4V0ru1
 gWBzCAtqMu+4JXflUA/f8zlHKaV+DBxcVHbbDHXG9YE1l0ZmF/6WT/rzX4yRBfB+X0o4
 QLf8odyO9Er8oFwVbR2waRcUjH6MI/hliFpVU7rX2fWrz5Fwfw7QxE4BUiddvJtXsoJP
 W2qw==
X-Gm-Message-State: AOAM530Ketd9z+QciY9iH66zyrCOL+iQGeEuHzUAemNyaQeRirSkwaRP
 9ZwaBaQ/SQIwa584mwyKj6LUTQ==
X-Google-Smtp-Source: ABdhPJyW0VTGSUd7xafQtG4NJPiTaXvdlNPbOk8sepjeULE2SjuZDvmR9Pomag4u/PrmPjUi+Tsqmw==
X-Received: by 2002:adf:f94c:: with SMTP id q12mr28259235wrr.166.1642595325796; 
 Wed, 19 Jan 2022 04:28:45 -0800 (PST)
Received: from localhost.localdomain ([2001:861:44c0:66c0:d394:97d0:bc02:3846])
 by smtp.gmail.com with ESMTPSA id j16sm19406933wrp.76.2022.01.19.04.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 04:28:45 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
To: robert.foss@linaro.org
Subject: [PATCH v2] drm/bridge: dw-hdmi: use safe format when first in bridge
 chain
Date: Wed, 19 Jan 2022 13:28:43 +0100
Message-Id: <20220119122843.1455611-1-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: jernej.skrabec@gmail.com, jonas@kwiboo.se,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kieran.bingham@ideasonboard.com,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent.pinchart@ideasonboard.com, biju.das.jz@bp.renesas.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the dw-hdmi bridge is in first place of the bridge chain, this
means there is no way to select an input format of the dw-hdmi HW
component.

Since introduction of display-connector, negotiation was broken since
the dw-hdmi negotiation code only worked when the dw-hdmi bridge was
in last position of the bridge chain or behind another bridge also
supporting input & output format negotiation.

Commit 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts callbacks")
was introduced to make negotiation work again by making display-connector
act as a pass-through concerning input & output format negotiation.

But in the case where the dw-hdmi is single in the bridge chain, for
example on Renesas SoCs, with the display-connector bridge the dw-hdmi
is no more single, breaking output format.

Reported-by: Biju Das <biju.das.jz@bp.renesas.com>
Bisected-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Fixes: 0656d1285b79 ("drm/bridge: display-connector: implement bus fmts callbacks").
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
Changes since v1:
- Remove bad fix in dw_hdmi_bridge_atomic_get_input_bus_fmts
- Fix typos in commit message

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 54d8fdad395f..97cdc61b57f6 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2551,8 +2551,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
 	if (!output_fmts)
 		return NULL;
 
-	/* If dw-hdmi is the only bridge, avoid negociating with ourselves */
-	if (list_is_singular(&bridge->encoder->bridge_chain)) {
+	/* If dw-hdmi is the first or only bridge, avoid negociating with ourselves */
+	if (list_is_singular(&bridge->encoder->bridge_chain) ||
+	    list_is_first(&bridge->chain_node, &bridge->encoder->bridge_chain)) {
 		*num_output_fmts = 1;
 		output_fmts[0] = MEDIA_BUS_FMT_FIXED;
 
-- 
2.25.1

