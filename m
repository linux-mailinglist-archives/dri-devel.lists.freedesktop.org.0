Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEbVG44Mq2nCZgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 18:19:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11249225DB4
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 18:19:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0764A10EDC7;
	Fri,  6 Mar 2026 17:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mf1AF4Pd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A416210EDD3;
 Fri,  6 Mar 2026 17:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772817546; x=1804353546;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sDdrR1L0lrQxnbzxqXHNMe+ZN4h2vWyGcBd4mcWXRMw=;
 b=mf1AF4Pd9laTVrhU/IHvaeeO0fkxHbNiBdG+dAO3QNssW4QYk9F5PhE9
 TtxIX7dkBKymDFdUFM8nghtJAz7xVfwLxPPXcqVxvfloUZ/TzMSamgZ9I
 P3kQ5pSjfFlptNgUULF4Tp5aK4MxclJTus3BQkpok4FOrxUygzgEVq3Y9
 JHw8vD7arXlfhiIMBmLSa0mEDK5FNj1hMjxQUVrTlMFYKzDmqouVRs11K
 INrLLyDuRXSJfK9qmtORisGjBayz/+norZxIWX7cQ43MYxee160AZahm3
 CjtpWIduY07U313CNqKZ3isKNLC3hCIRiLv2Qzr31xLUBP3IFsFK5C0LP A==;
X-CSE-ConnectionGUID: rK2W2rx6QNmkNTiJWydb2Q==
X-CSE-MsgGUID: Ku/XDWX6Rea/K1/oNjgJiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77530898"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="77530898"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:19:06 -0800
X-CSE-ConnectionGUID: 76dKPckxTYeK8NLu8c6Iag==
X-CSE-MsgGUID: Qo10xYAjRbabRrUZoogTIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="216175238"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2026 09:19:02 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: harry.wentland@amd.com, louis.chauvet@bootlin.com, mwen@igalia.com,
 contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 uma.shankar@intel.com, maarten.lankhorst@intel.com,
 pekka.paalanen@collabora.com, pranay.samala@intel.com,
 swati2.sharma@intel.com
Subject: [PATCH 07/10] drm/i915/color: Program Pre-CSC registers for SDR
Date: Fri,  6 Mar 2026 22:23:04 +0530
Message-Id: <20260306165307.3233194-8-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
References: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
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
X-Rspamd-Queue-Id: 11249225DB4
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.982];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

From: Pranay Samala <pranay.samala@intel.com>

Implement plane pre-CSC LUT support for SDR planes.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 17ab4364faea..9f7c2a328868 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3992,6 +3992,59 @@ xelpd_load_hdr_pre_csc_lut(struct intel_display *display,
 	intel_de_write_dsb(display, dsb, PLANE_PRE_CSC_GAMC_INDEX_ENH(pipe, plane, 0), 0);
 }
 
+static void
+xelpd_load_sdr_pre_csc_lut(struct intel_display *display,
+			   struct intel_dsb *dsb,
+			   enum pipe pipe,
+			   enum plane_id plane,
+			   const struct drm_color_lut32 *pre_csc_lut)
+{
+	u32 lut_size = 32;
+	u32 lut_val;
+	int i;
+
+	/*
+	 * First 3 planes are HDR, so reduce by 3 to get to the right
+	 * SDR plane offset
+	 */
+	plane = plane - 3;
+
+	intel_de_write_dsb(display, dsb,
+			   PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0),
+			   PLANE_PAL_PREC_AUTO_INCREMENT);
+
+	if (pre_csc_lut) {
+		for (i = 0; i < lut_size; i++) {
+			lut_val = drm_color_lut_extract(pre_csc_lut[i].green, 16);
+
+			intel_de_write_dsb(display, dsb,
+					   PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+					   lut_val);
+		}
+
+		do {
+			intel_de_write_dsb(display, dsb,
+					   PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+					   (1 << 16));
+		} while (i++ < 34);
+	} else {
+		for (i = 0; i < lut_size; i++) {
+			lut_val = (i * ((1 << 16) - 1)) / (lut_size - 1);
+
+			intel_de_write_dsb(display, dsb,
+					   PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0), lut_val);
+		}
+
+		do {
+			intel_de_write_dsb(display, dsb,
+					   PLANE_PRE_CSC_GAMC_DATA(pipe, plane, 0),
+					   1 << 16);
+		} while (i++ < 34);
+	}
+
+	intel_de_write_dsb(display, dsb, PLANE_PRE_CSC_GAMC_INDEX(pipe, plane, 0), 0);
+}
+
 static void
 xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 				const struct intel_plane_state *plane_state)
@@ -4004,6 +4057,8 @@ xelpd_program_plane_pre_csc_lut(struct intel_dsb *dsb,
 
 	if (icl_is_hdr_plane(display, plane))
 		xelpd_load_hdr_pre_csc_lut(display, dsb, pipe, plane, pre_csc_lut);
+	else
+		xelpd_load_sdr_pre_csc_lut(display, dsb, pipe, plane, pre_csc_lut);
 }
 
 static void
-- 
2.25.1

