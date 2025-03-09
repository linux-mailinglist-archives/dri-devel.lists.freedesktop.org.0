Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76856A5817D
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 09:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67AD10E2F8;
	Sun,  9 Mar 2025 08:14:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VJOIn9if";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E20710E2FC;
 Sun,  9 Mar 2025 08:14:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BEF6DA45B37;
 Sun,  9 Mar 2025 08:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB33EC4CEEF;
 Sun,  9 Mar 2025 08:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741508047;
 bh=53oqEdMve9KUjRbc06p98HomGfbvDNqcOd4avDOE3+4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=VJOIn9ifCz+q6EmxTO1sobATldLALRSF0vY4ohDsPI94kVyijI7UFzJWhFLAIXZhv
 AXk4aVgfoqjGSprsQT3V6E9v74AXFgyLXnUuDdG5lwWiUDXc2n6aIzwbBX+zFxxVml
 BMiztwE3m83mRdtKAMSKPZumysd5FV9R7T5NaxyemyPmd4KvRvw+UfWQPXs8A9JgT0
 r8cqvsXdSEa6Mif64N50BQk53tqkxI7nU9d6IATRzeFeIEEpVTkvhWmjsldQm6AXVW
 8X97yeFLV4PMF6WuUUDvjMZOAVB2rD14PjvkciKTuH+OZ0uR2zIvQV3zPmdfZoZTLo
 dn89qSGtiNXaw==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sun, 09 Mar 2025 10:13:56 +0200
Subject: [PATCH 1/4] drm/display: hdmi: provide central data authority for
 ACR params
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250309-drm-hdmi-acr-v1-1-bb9c242f4d4b@linaro.org>
References: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
In-Reply-To: <20250309-drm-hdmi-acr-v1-0-bb9c242f4d4b@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7197;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=e5rKHAIrRhvOrVwwZ/dNoJcMiCgbRsKK/fDPerK9GDc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnzU3GKii0BMlGAcXjmIjpmJ9WmEUQN5FsjibnN
 RIwgY4AgtKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ81NxgAKCRCLPIo+Aiko
 1QYeCACqHh/JLFPH1L+YS43WPNexSdsseKzSQ8+XiO1EEtqdwDZ0UUJslMxDRPAKNpppdxGIxAF
 UKWs33gKiV2qxGRrNx6nDO3m96KrADw5/jfQNUSjWjCvL455fVyYvaP1ysfQdyZTxOWWTk8YVPQ
 rLrItcF9gQnb6txpQmeV4GbKpmSUUx5ORsEyDXoAEZ4CKH5IjpCw9pjs56G3cPK6pn/PYddTrf/
 knIs3CGSVcbl5O3GUeo/p2Vsm2XC3Wc/Du0X/tDtBZ1LyDUTkMsrLH2yKTYTI4FODXoXiYAsCcQ
 jWlBbsD2MpLSR7+neB7aIDnd6kYuJLhM7MQSo7pA09REv7+t
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

HDMI standard defines recommended N and CTS values for Audio Clock
Regeneration. Currently each driver implements those, frequently in
somewhat unique way. Provide a generic helper for getting those values
to be used by the HDMI drivers.

The helper is added to drm_hdmi_helper.c rather than drm_hdmi_audio.c
since HDMI drivers can be using this helper function even without
switching to DRM HDMI Audio helpers.

Note: currently this only handles the values per HDMI 1.4b Section 7.2
and HDMI 2.0 Section 9.2.1. Later the table can be expanded to
accommodate for Deep Color TMDS char rates per HDMI 1.4 Appendix D
and/or HDMI 2.0 / 2.1 Appendix C).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/display/drm_hdmi_helper.c | 164 ++++++++++++++++++++++++++++++
 include/drm/display/drm_hdmi_helper.h     |   6 ++
 2 files changed, 170 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
index 74dd4d01dd9bb2c9e69ec1c60b0056bd69417e8a..89d25571bfd21c56c6835821d2272a12c816a76e 100644
--- a/drivers/gpu/drm/display/drm_hdmi_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -256,3 +256,167 @@ drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
 	return DIV_ROUND_CLOSEST_ULL(clock * bpc, 8);
 }
 EXPORT_SYMBOL(drm_hdmi_compute_mode_clock);
+
+struct drm_hdmi_acr_n_cts_entry {
+	unsigned int n;
+	unsigned int cts;
+};
+
+struct drm_hdmi_acr_data {
+	unsigned long tmds_clock_khz;
+	struct drm_hdmi_acr_n_cts_entry n_cts_32k,
+					n_cts_44k1,
+					n_cts_48k;
+};
+
+static const struct drm_hdmi_acr_data hdmi_acr_n_cts[] = {
+	{
+		/* "Other" entry */
+		.n_cts_32k =  { .n = 4096, },
+		.n_cts_44k1 = { .n = 6272, },
+		.n_cts_48k =  { .n = 6144, },
+	}, {
+		.tmds_clock_khz = 25175,
+		.n_cts_32k =  { .n = 4576,  .cts = 28125, },
+		.n_cts_44k1 = { .n = 7007,  .cts = 31250, },
+		.n_cts_48k =  { .n = 6864,  .cts = 28125, },
+	}, {
+		.tmds_clock_khz = 25200,
+		.n_cts_32k =  { .n = 4096,  .cts = 25200, },
+		.n_cts_44k1 = { .n = 6272,  .cts = 28000, },
+		.n_cts_48k =  { .n = 6144,  .cts = 25200, },
+	}, {
+		.tmds_clock_khz = 27000,
+		.n_cts_32k =  { .n = 4096,  .cts = 27000, },
+		.n_cts_44k1 = { .n = 6272,  .cts = 30000, },
+		.n_cts_48k =  { .n = 6144,  .cts = 27000, },
+	}, {
+		.tmds_clock_khz = 27027,
+		.n_cts_32k =  { .n = 4096,  .cts = 27027, },
+		.n_cts_44k1 = { .n = 6272,  .cts = 30030, },
+		.n_cts_48k =  { .n = 6144,  .cts = 27027, },
+	}, {
+		.tmds_clock_khz = 54000,
+		.n_cts_32k =  { .n = 4096,  .cts = 54000, },
+		.n_cts_44k1 = { .n = 6272,  .cts = 60000, },
+		.n_cts_48k =  { .n = 6144,  .cts = 54000, },
+	}, {
+		.tmds_clock_khz = 54054,
+		.n_cts_32k =  { .n = 4096,  .cts = 54054, },
+		.n_cts_44k1 = { .n = 6272,  .cts = 60060, },
+		.n_cts_48k =  { .n = 6144,  .cts = 54054, },
+	}, {
+		.tmds_clock_khz = 74176,
+		.n_cts_32k =  { .n = 11648, .cts = 210937, }, /* and 210938 */
+		.n_cts_44k1 = { .n = 17836, .cts = 234375, },
+		.n_cts_48k =  { .n = 11648, .cts = 140625, },
+	}, {
+		.tmds_clock_khz = 74250,
+		.n_cts_32k =  { .n = 4096,  .cts = 74250, },
+		.n_cts_44k1 = { .n = 6272,  .cts = 82500, },
+		.n_cts_48k =  { .n = 6144,  .cts = 74250, },
+	}, {
+		.tmds_clock_khz = 148352,
+		.n_cts_32k =  { .n = 11648, .cts = 421875, },
+		.n_cts_44k1 = { .n = 8918,  .cts = 234375, },
+		.n_cts_48k =  { .n = 5824,  .cts = 140625, },
+	}, {
+		.tmds_clock_khz = 148500,
+		.n_cts_32k =  { .n = 4096,  .cts = 148500, },
+		.n_cts_44k1 = { .n = 6272,  .cts = 165000, },
+		.n_cts_48k =  { .n = 6144,  .cts = 148500, },
+	}, {
+		.tmds_clock_khz = 296703,
+		.n_cts_32k =  { .n = 5824,  .cts = 421875, },
+		.n_cts_44k1 = { .n = 4459,  .cts = 234375, },
+		.n_cts_48k =  { .n = 5824,  .cts = 281250, },
+	}, {
+		.tmds_clock_khz = 297000,
+		.n_cts_32k =  { .n = 3072,  .cts = 222750, },
+		.n_cts_44k1 = { .n = 4704,  .cts = 247500, },
+		.n_cts_48k =  { .n = 5120,  .cts = 247500, },
+	}, {
+		.tmds_clock_khz = 593407,
+		.n_cts_32k =  { .n = 5824,  .cts = 843750, },
+		.n_cts_44k1 = { .n = 8918,  .cts = 937500, },
+		.n_cts_48k =  { .n = 5824,  .cts = 562500, },
+	}, {
+		.tmds_clock_khz = 594000,
+		.n_cts_32k =  { .n = 3072,  .cts = 445500, },
+		.n_cts_44k1 = { .n = 9408,  .cts = 990000, },
+		.n_cts_48k =  { .n = 6144,  .cts = 594000, },
+	},
+};
+
+static int drm_hdmi_acr_find_tmds_entry(unsigned long tmds_clock_khz)
+{
+	int i;
+
+	/* skip the "other" entry */
+	for (i = 1; i < ARRAY_SIZE(hdmi_acr_n_cts); i++) {
+		if (hdmi_acr_n_cts[i].tmds_clock_khz == tmds_clock_khz)
+			return i;
+	}
+
+	return 0;
+}
+
+/**
+ * drm_hdmi_acr_get_n_cts() - get N and CTS values for Audio Clock Regeneration
+ *
+ * @tmds_char_rate: TMDS clock (char rate) as used by the HDMI connector
+ * @sample_rate: audio sample rate
+ * @out_n: a pointer to write the N value
+ * @out_cts: a pointer to write the CTS value
+ *
+ * Get the N and CTS values (either by calculating them or by returning data
+ * from the tables. This follows the HDMI 1.4b Section 7.2 "Audio Sample Clock
+ * Capture and Regeneration".
+ */
+void
+drm_hdmi_acr_get_n_cts(unsigned long long tmds_char_rate,
+		       unsigned int sample_rate,
+		       unsigned int *out_n,
+		       unsigned int *out_cts)
+{
+	/* be a bit more tolerant, especially for the 1.001 entries */
+	unsigned long tmds_clock_khz = DIV_ROUND_CLOSEST_ULL(tmds_char_rate, 1000);
+	const struct drm_hdmi_acr_n_cts_entry *entry;
+	unsigned int n, cts, mult;
+	int tmds_idx;
+
+	tmds_idx = drm_hdmi_acr_find_tmds_entry(tmds_clock_khz);
+
+	/*
+	 * Don't change the order, 192 kHz is divisible by 48k and 32k, but it
+	 * should use 48k entry.
+	 */
+	if (sample_rate % 48000 == 0) {
+		entry = &hdmi_acr_n_cts[tmds_idx].n_cts_48k;
+		mult = sample_rate / 48000;
+	} else if (sample_rate % 44100 == 0) {
+		entry = &hdmi_acr_n_cts[tmds_idx].n_cts_44k1;
+		mult = sample_rate / 44100;
+	} else if (sample_rate % 32000 == 0) {
+		entry = &hdmi_acr_n_cts[tmds_idx].n_cts_32k;
+		mult = sample_rate / 32000;
+	} else {
+		entry = NULL;
+	}
+
+	if (entry) {
+		n = entry->n * mult;
+		cts = entry->cts;
+	} else {
+		/* Recommended optimal value, HDMI 1.4b, Section 7.2.1 */
+		n = 128 * sample_rate / 1000;
+		cts = 0;
+	}
+
+	if (!cts)
+		cts = DIV_ROUND_CLOSEST_ULL(tmds_char_rate * n,
+					    128 * sample_rate);
+
+	*out_n = n;
+	*out_cts = cts;
+}
diff --git a/include/drm/display/drm_hdmi_helper.h b/include/drm/display/drm_hdmi_helper.h
index 57e3b18c15ec79636d89267aba0e88f434c5d4db..09145c9ee9fc0cd839242f2373b305940e06e157 100644
--- a/include/drm/display/drm_hdmi_helper.h
+++ b/include/drm/display/drm_hdmi_helper.h
@@ -28,4 +28,10 @@ unsigned long long
 drm_hdmi_compute_mode_clock(const struct drm_display_mode *mode,
 			    unsigned int bpc, enum hdmi_colorspace fmt);
 
+void
+drm_hdmi_acr_get_n_cts(unsigned long long tmds_char_rate,
+		       unsigned int sample_rate,
+		       unsigned int *out_n,
+		       unsigned int *out_cts);
+
 #endif

-- 
2.39.5

