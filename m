Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8280FCA2E47
	for <lists+dri-devel@lfdr.de>; Thu, 04 Dec 2025 10:04:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C6E10E068;
	Thu,  4 Dec 2025 09:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DdhCwYB5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 143A710E832
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Dec 2025 02:46:52 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-297ec50477aso1972865ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Dec 2025 18:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764816411; x=1765421211; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=frVRxgUXItSpGo/h8T6oAJiNox96tXmzIcQmwTObjOY=;
 b=DdhCwYB5hHp2/RYFrkH7+BR43ql9HZ0KnXcjVojjZ67FypHC6lZN2nze8m7eToGu4C
 VMcGFp9fHD2nCI4OISFJxNOowcGU6plDwDpK0N+259vcQXw4yTw5M+oHDQVBNvz4ooTs
 h7WvDfOeTfsO/Caf5a1Dw8IJ2nmbZuKoF2/GZuiS1/6CAKIK2I77PVZvR0qgCzeTOXo5
 IbHspsJsHJOLnwRNz5lYxQK7VuGqoS6SZF80U0fGEKOBwnOpU/+11sSjLNi7Eitwhj6l
 2ju+UOGgpoeWtvemOSWkQ2FmgzBNcCnvSS8Y1Tpl24H/T233hjA8poj5TYb53Rdud5eB
 qdzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764816411; x=1765421211;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=frVRxgUXItSpGo/h8T6oAJiNox96tXmzIcQmwTObjOY=;
 b=PC7aOuPOPFPNT93TDLIqmAXL1K9PRSo5ypv6TBdpqC0pS1JQ+TVkOiQROMS6N04hhU
 9431XNbKspE4v2w+6j9RJKVgtOJ85aQ4DV2oNCX10n8EhCtX3OdB7arEVAlv/t/8knqm
 M42dB3IJyrov9EWBbbtcqz80G0tISxAH7vNDqeMjPPUMFP+EwBdtuzSxLFWGbI/IxAa+
 4xpKNw/EBOXX1pOBzdbOl/btPl/hFbqBt3QmCBeACkg0hL5QnhHgqmw4U7zlpXMnOyys
 3AO+c6sONHx4xbQXFDiRRJLrJWY2pZq1IvimfyOrQpeFsLCxpDwZe81DCl3iqicqVxuv
 MEyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfdxPKxBWzqkzhN8xcTOKE9MZ2LyZD/xRRQtdNigjEV4hLPljdSNu7S3sZdZCL1um3v/8Wuz2+GtM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzb2LT5bc+iK8p8ftOjHRW6ZNxLGAQPkZgZxxZvgZspa8Ent2H/
 Vsm9Wel6uuI/32MNNWbXxYizz6jZHs0osRrHJBoLHo+wTEK7LqFU9k1J
X-Gm-Gg: ASbGncuQSezcHLADGT9AW+qXBDLU2Yl5j20CysrMvug3mSp+tmCWLlSKCgkO0KZWIpU
 4MVLQaDt5BcqbrambaH9+Hytgrv5cQVRy4UKjSupjBgBFWoio3mxzciyShg6mWo8oiDKX2vWeXa
 0H8fX1ynqvYLQSFh6TZcOxKbZ9hGcA2dY8ziSKFLVBHc6N8WlDjEJxuRpU+2ShQQHzJPI6Innh6
 RI2am37f0xopwUI4rkdeMrS1Cb+J1wOJUwKVL731sMhr4PMEK+bnZ9pPRQxPiSWTnJNRzdL32Uq
 XWEiphl+2PgR5BAPOPClp5lsxpKjijiG5dSYrTTqm+P/uXFRTjb3wajzFuDXJj0QHr0SPA6Avwq
 iGS1hCfUIQdGGNCIWlbeoNeanA3k9Jr/Gh4/0/xLB0+xzzuD+OvlZ0n89C+G3L7a70UAjOebADV
 xzw6a8ApkdTF3PKpClA0OC29V9MZUu57n1/fE98hQK
X-Google-Smtp-Source: AGHT+IF2m74fFfZmU0EP2t+pkz/tuRQRQ2kS8oViKcuA5Mfr64v7m3a62qqFG0Uac2W7fo2Eg2OlUQ==
X-Received: by 2002:a17:902:ebc4:b0:297:df84:bd18 with SMTP id
 d9443c01a7336-29d9ee2003emr19912225ad.30.1764816411402; 
 Wed, 03 Dec 2025 18:46:51 -0800 (PST)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29daeaaba21sm2494995ad.70.2025.12.03.18.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Dec 2025 18:46:50 -0800 (PST)
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Suraj Kandpal <suraj.kandpal@intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Imre Deak <imre.deak@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Dave Airlie <airlied@redhat.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/dp: Add byte-by-byte fallback for broken USB-C adapters
Date: Thu,  4 Dec 2025 10:46:47 +0800
Message-ID: <20251204024647.1462866-1-acelan.kao@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Dec 2025 09:04:28 +0000
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

Some USB-C hubs and adapters have buggy firmware where multi-byte AUX
reads consistently timeout, while single-byte reads from the same address
work correctly.

Known affected devices that exhibit this issue:
- Lenovo USB-C to VGA adapter (VIA VL817 chipset)
  idVendor=17ef, idProduct=7217
- Dell DA310 USB-C mobile adapter hub
  idVendor=413c, idProduct=c010

Analysis of the failure pattern shows:
- Single-byte probes to 0xf0000 (LTTPR) succeed
- Single-byte probes to 0x00102 (TRAINING_AUX_RD_INTERVAL) succeed
- Multi-byte reads from 0x00000 (DPCD capabilities) timeout with -ETIMEDOUT
- Retrying does not help - the failure is consistent across all attempts

The issue appears to be a firmware bug in the AUX transaction handling
that specifically affects multi-byte reads.

Add a fallback mechanism in drm_dp_dpcd_read_data() that attempts
byte-by-byte reading when the normal multi-byte read fails. This
workaround only activates for adapters that fail the standard read path,
ensuring no impact on correctly functioning hardware.

Tested with:
- Lenovo USB-C to VGA adapter (VIA VL817) - now works with fallback
- Dell DA310 USB-C hub - now works with fallback
- Dell/Analogix Slimport adapter - continues to work with normal path

Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
---
v2. 1. Move the workaround from intel_dp_read_dprx_caps() to
       drm_dp_dpcd_read_data(), so that it applies to all DPCD reads across
       all DRM drivers benefit from this fix, not just i915.
    2. Move the definition of drm_dp_dpcd_readb() before
       drm_dp_dpcd_read_data()
---
 include/drm/display/drm_dp_helper.h | 57 +++++++++++++++++++----------
 1 file changed, 37 insertions(+), 20 deletions(-)

diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index df2f24b950e4..14d2859f0bda 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -551,6 +551,22 @@ ssize_t drm_dp_dpcd_read(struct drm_dp_aux *aux, unsigned int offset,
 ssize_t drm_dp_dpcd_write(struct drm_dp_aux *aux, unsigned int offset,
 			  void *buffer, size_t size);
 
+/**
+ * drm_dp_dpcd_readb() - read a single byte from the DPCD
+ * @aux: DisplayPort AUX channel
+ * @offset: address of the register to read
+ * @valuep: location where the value of the register will be stored
+ *
+ * Returns the number of bytes transferred (1) on success, or a negative
+ * error code on failure. In most of the cases you should be using
+ * drm_dp_dpcd_read_byte() instead.
+ */
+static inline ssize_t drm_dp_dpcd_readb(struct drm_dp_aux *aux,
+					unsigned int offset, u8 *valuep)
+{
+	return drm_dp_dpcd_read(aux, offset, valuep, 1);
+}
+
 /**
  * drm_dp_dpcd_read_data() - read a series of bytes from the DPCD
  * @aux: DisplayPort AUX channel (SST or MST)
@@ -570,12 +586,29 @@ static inline int drm_dp_dpcd_read_data(struct drm_dp_aux *aux,
 					void *buffer, size_t size)
 {
 	int ret;
+	size_t i;
+	u8 *buf = buffer;
 
 	ret = drm_dp_dpcd_read(aux, offset, buffer, size);
-	if (ret < 0)
-		return ret;
-	if (ret < size)
-		return -EPROTO;
+	if (ret >= 0) {
+		if (ret < size)
+			return -EPROTO;
+		return 0;
+	}
+
+	/*
+	 * Workaround for USB-C hubs/adapters with buggy firmware that fail
+	 * multi-byte AUX reads but work with single-byte reads.
+	 * Known affected devices:
+	 * - Lenovo USB-C to VGA adapter (VIA VL817, idVendor=17ef, idProduct=7217)
+	 * - Dell DA310 USB-C hub (idVendor=413c, idProduct=c010)
+	 * Attempt byte-by-byte reading as a fallback.
+	 */
+	for (i = 0; i < size; i++) {
+		ret = drm_dp_dpcd_readb(aux, offset + i, &buf[i]);
+		if (ret < 0)
+			return ret;
+	}
 
 	return 0;
 }
@@ -609,22 +642,6 @@ static inline int drm_dp_dpcd_write_data(struct drm_dp_aux *aux,
 	return 0;
 }
 
-/**
- * drm_dp_dpcd_readb() - read a single byte from the DPCD
- * @aux: DisplayPort AUX channel
- * @offset: address of the register to read
- * @valuep: location where the value of the register will be stored
- *
- * Returns the number of bytes transferred (1) on success, or a negative
- * error code on failure. In most of the cases you should be using
- * drm_dp_dpcd_read_byte() instead.
- */
-static inline ssize_t drm_dp_dpcd_readb(struct drm_dp_aux *aux,
-					unsigned int offset, u8 *valuep)
-{
-	return drm_dp_dpcd_read(aux, offset, valuep, 1);
-}
-
 /**
  * drm_dp_dpcd_writeb() - write a single byte to the DPCD
  * @aux: DisplayPort AUX channel
-- 
2.43.0

