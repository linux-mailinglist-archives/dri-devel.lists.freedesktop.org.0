Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iARXJpw8qWkd3QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:19:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC4120D5BC
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 09:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9948410EB7E;
	Thu,  5 Mar 2026 08:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHVYKJOP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C6F10EB87;
 Thu,  5 Mar 2026 08:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772698776; x=1804234776;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=RzfOAZ1IUoC73v/c6AaUayIWIxPr2FEHZO4TNwbpp/k=;
 b=gHVYKJOPVydrTe1jQ3IDl6uUGJ5kVLOHdvVMkaKhbIdvafmbuRmqUdB3
 CvvrmrA8j3NnHWopPxmvud32chfGNTE/2vT7xMQQIdocrhpBarMvPcJH9
 +bYp2v8OzuxpIJunvnTkvssz89r4TtEWHX74ckxus/0KKzAE4bCH3rorK
 VJM+LntsKTzu0xOOCQ4UskP786HbEpf/BjJ4tIeA1UwqbUowK6yLW6c/h
 2LHTGFp4pDHQDAFHapALukeD9TNLY8739x8jRxPjpV0DV7Sv3qqhTd5BF
 2lkCNYDzyxHC7RP1jjs2u9egOG8pKdvFKt3LGD2wayJFFse9e0Alj7Lpl w==;
X-CSE-ConnectionGUID: rnitboqnR9SCh9Yu3zBBrQ==
X-CSE-MsgGUID: XrXgDeLTTmezqgXFmsy35Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="91349138"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="91349138"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 00:19:36 -0800
X-CSE-ConnectionGUID: c+vDxGxtQ4ulf0WgoFsVlA==
X-CSE-MsgGUID: uVONp2ySTfqw7Xf/C+2dGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; d="scan'208";a="256492856"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 05 Mar 2026 00:19:33 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Thu, 05 Mar 2026 13:48:11 +0530
Subject: [PATCH RFC 1/4] drm/display/dp: Read LTTPR caps without DPRX caps
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-dp_aux-v1-1-54ee0b5f5158@intel.com>
References: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
In-Reply-To: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
To: Imre Deak <imre.deak@intel.com>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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
X-Rspamd-Queue-Id: 4CC4120D5BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arun.r.murthy@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email,intel.com:mid];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action

We at present have drm_dp_Read_lttpr_common_caps to read the LTTPR caps,
but this function required DPRX caps to be passed. As per the DP2.1 spec
section 3.6.8.6.1, section 2.12.1, section 2.12.3 (Link Policy) the
LTTPR caps is to be read first followed by the DPRX capability.
Hence adding another function to read the LTTPR caps without the need
for DPRX caps.

In order to handle the issue
https://gitlab.freedesktop.org/drm/intel/-/issues/4531
of reading corrupted values for LTTPR caps on few pannels with DP Rev 1.2
the workaround of reducing the block size to 1 and reading one block at a
time is done by checking for a valid link rate.

Fixes: 657586e474bd ("drm/i915: Add a DP1.2 compatible way to read LTTPR capabilities")
Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 63 +++++++++++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  2 ++
 2 files changed, 65 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index a697cc227e28964cd8322803298178e7d788e820..9fe7db73027a43b01c4d12927f1f0e61444658e5 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -3050,6 +3050,69 @@ static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
 	return 0;
 }
 
+static bool drm_dp_valid_link_rate(u8 link_rate)
+{
+	switch (link_rate) {
+	case 0x06:
+	case 0x0a:
+	case 0x14:
+	case 0x1e:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/**
+ * drm_dp_read_lttpr_caps - read the LTTPR capabilities
+ * @aux: DisplayPort AUX channel
+ * @caps: buffer to return the capability info in
+ *
+ * Read capabilities common to all LTTPRs.
+ *
+ * Returns 0 on success or a negative error code on failure.
+ */
+int drm_dp_read_lttpr_caps(struct drm_dp_aux *aux,
+			   u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
+{
+	/*
+	 * At least the DELL P2715Q monitor with a DPCD_REV < 0x14 returns
+	 * corrupted values when reading from the 0xF0000- range with a block
+	 * size bigger than 1.
+	 * For DP as per the spec DP2.1 section 3.6.8.6.1, section 2.12.1, section
+	 * 2.12.3 (Link Policy) the LTTPR caps is to be read first followed by the
+	 * DPRX capability.
+	 * So ideally we dont have DPCD_REV yet to check for the revision, instead
+	 * check for the correctness of the read value and in found corrupted read
+	 * block by block.
+	 */
+	int block_size;
+	int offset;
+	int ret;
+	int address = DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV;
+	int buf_size = DP_LTTPR_COMMON_CAP_SIZE;
+
+	ret = drm_dp_dpcd_read_data(aux, address, &caps, buf_size);
+	if (ret < 0)
+		return ret;
+
+	if (caps[0] == 0x14) {
+		if (!drm_dp_valid_link_rate(caps[1])) {
+			block_size = 1;
+			for (offset = 0; offset < buf_size; offset += block_size) {
+				ret = drm_dp_dpcd_read_data(aux,
+							    address + offset,
+							    &caps[offset],
+							    block_size);
+				if (ret < 0)
+					return ret;
+			}
+		}
+	}
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_read_lttpr_caps);
+
 /**
  * drm_dp_read_lttpr_common_caps - read the LTTPR common capabilities
  * @aux: DisplayPort AUX channel
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 1d0acd58f48676f60ff6a07cc6812f72cbb452e8..def145e67011c325b790c807f934b288304260c1 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -755,6 +755,8 @@ bool drm_dp_read_sink_count_cap(struct drm_connector *connector,
 				const struct drm_dp_desc *desc);
 int drm_dp_read_sink_count(struct drm_dp_aux *aux);
 
+int drm_dp_read_lttpr_caps(struct drm_dp_aux *aux,
+				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
 int drm_dp_read_lttpr_common_caps(struct drm_dp_aux *aux,
 				  const u8 dpcd[DP_RECEIVER_CAP_SIZE],
 				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);

-- 
2.25.1

