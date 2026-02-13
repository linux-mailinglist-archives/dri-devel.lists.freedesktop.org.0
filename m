Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNlZEVBzj2kARAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 19:54:08 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D42C51390CE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Feb 2026 19:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BACB810E310;
	Fri, 13 Feb 2026 18:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="mSRflkiX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBC810E302
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Feb 2026 18:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CQFK7fNypXqHYahd2jW/2UtLh5zyB5BpeUAqJ0QJCwo=; b=mSRflkiXG5Bliu6L6tMjJGNI2G
 qeasDKBrm/3OFZUHVB4GXagzSPKKYnCKngfdOEk6bKK4Chduxvz422MRzCqD29XuBbXrlei21wINf
 etoxrWuGIMImQOtW7VHiq7JVECstahXNEK9dtPygepwnB3S5YIoR4d+SGfgggNUZg3yPaehB+TC2I
 42EAfLE2q06g2tstTpbNC+xtiuPqT2QvbPq1OjZ8APKiFzb940+yBx+gOKtdDynukieBGDpWovHad
 KEH0Rp/u3GlqVpBwCoYCza186bUYb/QZxPbEH3E1hibZ0aSjjoAX5nO94R8Sbm7JbZvlt0zoZETjC
 61PyafZA==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vqyIL-000Sqv-KD; Fri, 13 Feb 2026 19:53:37 +0100
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 13 Feb 2026 15:52:54 -0300
Subject: [PATCH v5 1/7] clk: bcm: rpi: Let V3D consumers manage clock rate
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260213-v3d-power-management-v5-1-7a8b381eb379@igalia.com>
References: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
In-Reply-To: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Maxime Ripard <mripard@kernel.org>, 
 Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Chema Casanova <jmcasanova@igalia.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 kernel-dev@igalia.com, =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1709; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=VVOb/XUviLeT12jZtnMIPJt73eqnYgRxcBkulCeWd3s=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBpj3MmrFXrabZfr6bZk8LDXdl0LlEUejJ4I0bHl
 mzpe0ZEVviJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaY9zJgAKCRA/8w6Kdoj6
 qt+lB/0XaoS+KO47FfTJn5zrTtiWF/AgdfDn9ovVNuGlLNOmPLL56UUnpUXprSFbpmMG919vw9Z
 cgouYx4C2sUxeiMjrxDm/uFtlxBtelmXKlk6F84zvTDHb+7593XVyt6zic7VQFZjh68aLPGFhDH
 NANKLMQ3VJhNQcwCVgni7lMnQajs+ZqnK5mR1hFSWa4scgzcUMT23ZVdNEy+Mso4Ff9C5xert0+
 STtasmhKVSru+oAwVoyKscGz4jbTdQmFCGbsqeiRuLpEWdqSSIQX4gcp1LarxFpdEGrwRnTtpD0
 MIM7Kah9o9dZ3PGTmv3Mn6gvrJ8JloK/tf3OPI7+Z6OH9juE
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	R_DKIM_REJECT(1.00)[igalia.com:s=20170329];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	DMARC_POLICY_SOFTFAIL(0.10)[igalia.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:mturquette@baylibre.com,m:sboyd@kernel.org,m:nsaenz@kernel.org,m:florian.fainelli@broadcom.com,m:wahrenst@gmx.net,m:mripard@kernel.org,m:mwen@igalia.com,m:itoral@igalia.com,m:jmcasanova@igalia.com,m:dave.stevenson@raspberrypi.com,m:p.zabel@pengutronix.de,m:linux-clk@vger.kernel.org,m:linux-rpi-kernel@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:bcm-kernel-feedback-list@broadcom.com,m:kernel-dev@igalia.com,m:mcanal@igalia.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[baylibre.com,kernel.org,broadcom.com,gmx.net,igalia.com,raspberrypi.com,pengutronix.de];
	FORGED_SENDER(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mcanal@igalia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[igalia.com:-];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[igalia.com:mid,igalia.com:email]
X-Rspamd-Queue-Id: D42C51390CE
X-Rspamd-Action: no action

Remove the `maximize` infrastructure and don't set `minimize` for the
V3D clock, giving consumers full control over its rate.

On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
actually power off the clock. To achieve meaningful power consumption
reduction, consumers need to set the clock rate to minimum before
disabling it. Forcing the clock to maximum rate in the clock framework
prevents this, as consumers don't have any flexibility over the clock
rate.

This change enables the v3d driver to control the clock rate directly
in its suspend/resume callbacks.

Fixes: 6526402b9bac ("clk: bcm: rpi: Maximize V3D clock")
Acked-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/clk/bcm/clk-raspberrypi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 1a9162f0ae31e330c46f6eafdd00350599b0eede..9783385d5859836898683209e320fcc928dfdc71 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -68,7 +68,6 @@ struct raspberrypi_clk_variant {
 	char		*clkdev;
 	unsigned long	min_rate;
 	bool		minimize;
-	bool		maximize;
 	u32		flags;
 };
 
@@ -136,7 +135,6 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] = {
 	},
 	[RPI_FIRMWARE_V3D_CLK_ID] = {
 		.export = true,
-		.maximize = true,
 	},
 	[RPI_FIRMWARE_PIXEL_CLK_ID] = {
 		.export = true,
@@ -387,9 +385,6 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 		}
 	}
 
-	if (variant->maximize)
-		variant->min_rate = max_rate;
-
 	if (variant->min_rate) {
 		unsigned long rate;
 

-- 
2.52.0

