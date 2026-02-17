Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Po5NGonlGkcAQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 09:31:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69A3149F1E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Feb 2026 09:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7141289CC4;
	Tue, 17 Feb 2026 08:31:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=puri.sm header.i=@puri.sm header.b="aUbiPg23";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05DBC89CC4
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Feb 2026 08:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
 t=1771317091; bh=yxR5JGJB1T65K6tWKDS6jRiE5806q9CcHo3BP2uS3jU=;
 h=From:Date:Subject:To:Cc;
 b=aUbiPg23UK2aE7K8mvCNbJ3hmhHBh0in922MivrvEr2CB8utC93hCaHWROpTEqTwF
 AktIzpUt39Y2xEVW+iZTjXw8NdUtgLbkWulYAzw8MLIJIFPYPNGYPNHKsXGwdOapPi
 klJXJUovusNfnoAQcqKHv3PS2EwYI5Fy/5TVnn64efJKEpg5JZ3MIcWzbEFu1Kjk9V
 62hoJEmkaWE4LG5pu66OtKkyDUQwzuVbWxcc+SMrHP5RN9ISFfk3FMeOuINWdCjP/z
 Zx3YSbwQLmU8tqYJUeD7FTZVrVgjEjKiY+dlzt2TsbFOaMWGwkNOnAMkLWJM2Y6NtP
 uq0478e9HXN9g==
Received: from pliszka.localdomain (79.184.40.11.ipv4.supernova.orange.pl
 [79.184.40.11]) by ms.puri.sm (Postfix) with ESMTPSA id 463241FCBF;
 Tue, 17 Feb 2026 00:31:29 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Date: Tue, 17 Feb 2026 09:31:02 +0100
Subject: [PATCH v2] drm/bridge: nwl-dsi: Correct MIPI DSI horizontal sync
 timing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260217-nwl-sync-timing-v2-1-a306c1ef2426@puri.sm>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNQQ6CMBBFr2K6drRtTBVX3sOwaMsUJoFCOoASw
 t0t7F2+5P/3VsGYCFk8T6tIOBNTHzPo80n4xsYagarMQkttpFYG4qcFXqKHkTqKNdwfhdTWmUK
 6SuTXkDDQ9zC+y8zOMoJLNvpm97QUJ752lkdM+7whHvu0HP1Z7af/qVmBAidDMOiDljf7GqZEF
 +5EuW3bD9a+nWnLAAAA
X-Change-ID: 20260216-nwl-sync-timing-78902ab690bd
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sam Ravnborg <sam@ravnborg.org>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Robert Chiras <robert.chiras@nxp.com>, Fabio Estevam <festevam@gmail.com>
Cc: kernel@puri.sm, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, "Oliver F. Brown" <oliver.brown@oss.nxp.com>, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4577;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=D9CvC01Y2oerVviwRC3is0xWP25amqh/QDhoJ8mumlk=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBplCdgpSWlnJliiuWJbDmRsLDNGpcSw9jh+cceo
 VHtsxsPFA+JAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaZQnYAAKCRDo8jXPO9vD
 /9zTEAChTJ+O2F/5tZ8/KNepf4BcWznRGCZredHsuAk5iNYo9+vr0ER7UtkL413StHBAo/vrGM7
 cXDfqiNIXhmvj8vIUS1zNqWXG5gHwlRhgwGLuySNVvND6TisjBCbKxbWn9X7gmVTBDAbHG4B4Pc
 vONBVqP5ReyXmOsv0XjHgC3FA+kjdJY/+pHA+2o3sbvL4fwoMhn7co2sn0Bv42xFkFEfkbdmk5T
 pmIp5H3vEH0fFlwB//48UOPDgGn30JIFtNRLprI8cHquCKnoB0fchVepU8CZa0rUZVYxe6PXM34
 ktBbFt6PMIPl44T5avQeP6kbv2TdIB2f8k3Q6JhJva/yssflkseQaev1Ip6wPErn3VpUx73Ik3y
 9bsgECZeyqblJLG7ZCQ/zRVKi7VSAMUVQIrjJbdOqqbd+1xudqwOAKIK5wNcYs4gyxK8vP1Saul
 84fVsohiaKbjQK6VpZXekuIsI5n3/IHcInI0eCPRl+YreQdt3HEL6/FTL2WFtpHhKXyg8KIT4CT
 DecMDkdE3O8x2rMRf6SzP8yDvWqw0lfKwK9nlBbtluwLFRVeSkbN5XdX4KGcKYJloQWECCPeHEP
 7GhmBPuXet7MFd+jy/laWboc74KPGPZbYjPdYC0ChX8Aw5ox4uyCmOgLSLPUEfSBZmzsyaJftXc
 QHpfvw49eppkV1Q==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[puri.sm,reject];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[puri.sm:s=smtp2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sam@ravnborg.org,m:agx@sigxcpu.org,m:robert.chiras@nxp.com,m:festevam@gmail.com,m:kernel@puri.sm,m:linux-kernel@vger.kernel.org,m:oliver.brown@oss.nxp.com,m:sebastian.krzyszkowiak@puri.sm,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[sebastian.krzyszkowiak@puri.sm,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,ravnborg.org,sigxcpu.org,nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[puri.sm:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[sebastian.krzyszkowiak@puri.sm,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: E69A3149F1E
X-Rspamd-Action: no action

From: Robert Chiras <robert.chiras@nxp.com>

The NWL MIPI Host controller registers set the number of bytes for the
horzontal front porch, sync pulse, and back porch, not the number of
pixels. The formula converts the hfp, hsa, and hbp to bytes then subtracts
the number of packet overhead bytes in the horizontal line which totals 32.
The overhead is split into three proportional chunks and subtracted from
fp, hsa, and hbp.

Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
Signed-off-by: Oliver F. Brown <oliver.brown@oss.nxp.com>
Fixes: 44cfc6233447 ("drm/bridge: Add NWL MIPI DSI host controller support")
[SK: Replaced division operator with div64_u64 in 64-bit divisions]
Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
Taken from the NXP linux-imx fork. This makes it possible to e.g.
correctly drive the Librem 5's internal DSI panel at 60 Hz.
---
Changes in v2:
- Replaced division operator with div64_u64 to fix build failure on 32-bit
  archs reported by kernel test robot.
- Link to v1: https://lore.kernel.org/r/20260216-nwl-sync-timing-v1-1-b0ff6ecf204a@puri.sm
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 66 ++++++++++++++++++++++++++++++++++++++--
 1 file changed, 63 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index 2f7429b24fc2..b99cb841983e 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -260,6 +260,10 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
 	bool burst_mode;
 	int hfront_porch, hback_porch, vfront_porch, vback_porch;
 	int hsync_len, vsync_len;
+	int hfp, hbp, hsa;
+	unsigned long long pclk_period;
+	unsigned long long hs_period;
+	int h_blank, pkt_hdr_len, pkt_len;
 
 	hfront_porch = dsi->mode.hsync_start - dsi->mode.hdisplay;
 	hsync_len = dsi->mode.hsync_end - dsi->mode.hsync_start;
@@ -313,9 +317,65 @@ static int nwl_dsi_config_dpi(struct nwl_dsi *dsi)
 			      dsi->mode.hdisplay);
 	}
 
-	nwl_dsi_write(dsi, NWL_DSI_HFP, hfront_porch);
-	nwl_dsi_write(dsi, NWL_DSI_HBP, hback_porch);
-	nwl_dsi_write(dsi, NWL_DSI_HSA, hsync_len);
+	pclk_period = ALIGN(PSEC_PER_SEC, dsi->mode.clock * 1000);
+	do_div(pclk_period, dsi->mode.clock * 1000);
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "pclk_period: %llu\n", pclk_period);
+
+	hs_period = ALIGN(PSEC_PER_SEC, dsi->phy_cfg.mipi_dphy.hs_clk_rate);
+	do_div(hs_period, dsi->phy_cfg.mipi_dphy.hs_clk_rate);
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "hs_period: %llu\n", hs_period);
+
+	/*
+	 * Calculate the bytes needed, according to the RM formula:
+	 * Time of DPI event = time to transmit x number of bytes on the DSI
+	 * interface
+	 * dpi_event_size * dpi_pclk_period = dsi_bytes * 8 * hs_bit_period /
+	 * num_lanes
+	 * ===>
+	 * dsi_bytes = dpi_event_size * dpi_pclk_period * num_lanes /
+	 * (8 * hs_bit_period)
+	 */
+	hfp = div64_u64(hfront_porch * pclk_period * dsi->lanes, 8 * hs_period);
+	hbp = div64_u64(hback_porch * pclk_period * dsi->lanes, 8 * hs_period);
+	hsa = div64_u64(hsync_len * pclk_period * dsi->lanes, 8 * hs_period);
+
+	/* Make sure horizontal blankins are even numbers */
+	hfp = roundup(hfp, 2);
+	hbp = roundup(hbp, 2);
+	hsa = roundup(hsa, 2);
+
+	/*
+	 * We need to subtract the packet header length: 32
+	 * In order to make sure we don't get negative values,
+	 * subtract a proportional value to the total length of the
+	 * horizontal blanking duration.
+	 */
+	h_blank = hfp + hbp + hsa;
+
+	pkt_len = roundup(((hfp * 100 / h_blank) * 32) / 100, 2);
+	pkt_hdr_len = pkt_len;
+	hfp -= pkt_len;
+
+	pkt_len = roundup(((hbp * 100 / h_blank) * 32) / 100, 2);
+	pkt_hdr_len += pkt_len;
+	hbp -= pkt_len;
+
+	hsa -= (32 - pkt_hdr_len);
+
+	if (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_NO_HFP)
+		hfp = hfront_porch;
+	if (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_NO_HBP)
+		hbp = hback_porch;
+	if (dsi->dsi_mode_flags & MIPI_DSI_MODE_VIDEO_NO_HSA)
+		hsa = hsync_len;
+
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Actual hfp: %d\n", hfp);
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Actual hbp: %d\n", hbp);
+	DRM_DEV_DEBUG_DRIVER(dsi->dev, "Actual hsa: %d\n", hsa);
+
+	nwl_dsi_write(dsi, NWL_DSI_HFP, hfp);
+	nwl_dsi_write(dsi, NWL_DSI_HBP, hbp);
+	nwl_dsi_write(dsi, NWL_DSI_HSA, hsa);
 
 	nwl_dsi_write(dsi, NWL_DSI_ENABLE_MULT_PKTS, 0x0);
 	nwl_dsi_write(dsi, NWL_DSI_BLLP_MODE, 0x1);

---
base-commit: 0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
change-id: 20260216-nwl-sync-timing-78902ab690bd

Best regards,
-- 
Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

