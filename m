Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UO23CqsNcGlyUwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 00:20:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C3F4DB22
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 00:20:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B835410E665;
	Tue, 20 Jan 2026 23:20:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VmEMVAST";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2192110E665
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 23:20:07 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-2b6a93d15ddso5895341eec.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jan 2026 15:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768951206; x=1769556006; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a14UJSKywxQPG3jydJYjQCkFGY5UM/uMPPP66w0Rim0=;
 b=VmEMVASTDeC8Fauz04WKF1gE6e+heGgQvUSioXIBmatTvZ2bhYsuwn23DiEatu7Q5v
 fQ/RC0O0EDNLEDFHu4v9Mjcrd1Wy7f4z5FnowYzoUxz2rOtg630mA0EuI85lA8hI8D6L
 4y2gM9CmCm/UKuZoJhxoXwmakp3ZVm+dCUC2IVuYJtbuKEKBjPWXaiY+BVlylW97yRiz
 PFvvq4pa8UunyHoZNVg/ihbGeEyarSXeaHvYo8+2xhjTZezsIe9lZS2KSkBoJMl8z3nd
 vgkQNWmp2mhIc1nH/TU7SFg+IHDQXku0oCD7XT5Qz5clKparK/v1wsBuFuoXTCUQNhoH
 qSQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768951206; x=1769556006;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=a14UJSKywxQPG3jydJYjQCkFGY5UM/uMPPP66w0Rim0=;
 b=iu4Z6MDcRU4Duvk5azpgjyg6I+BYzLJRAvRRdrLM3mK0qy7rilLA7Z1BJJNfnSdT/M
 f6g28MC1TdjwqembfVliG4mXYdeIWf7WIPDtc2H1uYr7+bjgnffP5/hHpi2jO1yECpKj
 QqVEwFTc6jltx1d2/vQsMzTXhcQUC+Ufmyfx3xwTd1MhMiVqSFKJbQWYeWuN6XyGp2eg
 DTVW91zkKDRJkkJSYIqOdh4XJ5K6Q6QVVc4E6Kid7iyYrLCQ3PF5AY6ff14n9ZaYlP24
 RkTco9tJ7g1whaenuP+8i2/Zss7pvtdX6GGth2J9Wn897W/0lGy0cGm61XSODbVX0twx
 T5nw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRrQOtjGj5ZRaPUHNIPkXQSJwGRfEs9f1uGLP7XGHIBxAgsrvl5hykhXezcGWJ2YkezWPT75k91ZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIzhH/l1oFaYdIMjqamoMSnI8G0ZstJQDu8fOb0QWnOkJ3RIg1
 WywQ93mjrmWSTOgzoFTBT/tRWxuIT6MO7hLJZqKsYf5DYBgyzo35/RbCDoyzvA==
X-Gm-Gg: AZuq6aL9g25xs9o4lT5En3OiN8KbgnZhhxlrBmqQSD4ON4KlO9ktG9rvb1BYREdxhqB
 vv5DiPjW1PfM7z/rkjGeJdWFwgssbjndkDyiaY6/OXX90UXNGnZTw4+2YPyNEoWUTcypKk5rNbT
 jLfDOKePWXblPMeG8vjnVAWXxXBpL9xVB3Zjo7dxaRv4nxUV3So2kUWYd2pCBcVjgTxk0YtpsaU
 h/EEr1ctIkrAnzzoXsWVeQonLnrlc58GZAxWKCosOBMNpFtmkwIlP51rbxcKl+sup4WpqejizBC
 sNE2pLPuy/mnhJ7y0VXScxMHrT698AiW/aCCV0SBnY5puzUb58piKU97cRk1vOvwCJA7AAmOsXT
 b6TupPs75imEHRjTi3CC5cOmuQmKrdx/4Z/sShh3EZIUj4xqkziL0L+C4fOM9HAXPmL0BqkFKKx
 ZA30myJQ==
X-Received: by 2002:a05:7301:4192:b0:2a4:3593:466d with SMTP id
 5a478bee46e88-2b6fd5d7f52mr2740674eec.9.1768951206303; 
 Tue, 20 Jan 2026 15:20:06 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61::1000])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b6fc2820a2sm4326816eec.35.2026.01.20.15.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 15:20:05 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: victor.liu@nxp.com
Cc: marek.vasut@mailbox.org, neil.armstrong@linaro.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, frank.li@nxp.com,
 Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v3 2/2] drm/bridge: fsl-ldb: Allow the termination resistor to
 be enabled
Date: Tue, 20 Jan 2026 20:19:30 -0300
Message-Id: <20260120231930.2782444-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120231930.2782444-1-festevam@gmail.com>
References: <20260120231930.2782444-1-festevam@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[festevam@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:victor.liu@nxp.com,m:marek.vasut@mailbox.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:devicetree@vger.kernel.org,m:frank.li@nxp.com,m:festevam@nabladev.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[festevam@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: D0C3F4DB22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Fabio Estevam <festevam@nabladev.com>

The LVDS Control Register (LVDS_CTRL) register has an HS_EN bit that allows
the 100 Ohm termination resistor in the chip to be enabled.

Add support to setting the HS_EN bit when the optional property
"nxp,enable-termination-resistor" is present.

The motivation for introducing this property was a custom i.MX8MP board
that was showing visual artifacts. After enabling the 100 Ohm termination
resistor the LVDS signal quality improved causing the artifacts to
disappear.

Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v2:
- Rename variable to 'use_termination_resistor'. (Liu Ying)
- Remove clearing the LVDS_CTRL_HS_EN bit. (Liu Ying)
- Use dev->of_node. (Liu Ying)

 drivers/gpu/drm/bridge/fsl-ldb.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 5c3cf37200bc..7b71cde173e0 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -92,6 +92,7 @@ struct fsl_ldb {
 	const struct fsl_ldb_devdata *devdata;
 	bool ch0_enabled;
 	bool ch1_enabled;
+	bool use_termination_resistor;
 };
 
 static bool fsl_ldb_is_dual(const struct fsl_ldb *fsl_ldb)
@@ -212,6 +213,9 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
 	/* Program LVDS_CTRL */
 	reg = LVDS_CTRL_CC_ADJ(2) | LVDS_CTRL_PRE_EMPH_EN |
 	      LVDS_CTRL_PRE_EMPH_ADJ(3) | LVDS_CTRL_VBG_EN;
+
+	if (fsl_ldb->use_termination_resistor)
+		reg |= LVDS_CTRL_HS_EN;
 	regmap_write(fsl_ldb->regmap, fsl_ldb->devdata->lvds_ctrl, reg);
 
 	/* Wait for VBG to stabilize. */
@@ -340,6 +344,9 @@ static int fsl_ldb_probe(struct platform_device *pdev)
 	if (IS_ERR(panel))
 		return PTR_ERR(panel);
 
+	if (of_property_present(dev->of_node, "nxp,enable-termination-resistor"))
+		fsl_ldb->use_termination_resistor = true;
+
 	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
 	if (IS_ERR(fsl_ldb->panel_bridge))
 		return PTR_ERR(fsl_ldb->panel_bridge);
-- 
2.34.1

