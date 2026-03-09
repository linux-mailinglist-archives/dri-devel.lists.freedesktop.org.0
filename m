Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBliLpx3rmliFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 08:32:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DABA234D06
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 08:32:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B0810E496;
	Mon,  9 Mar 2026 07:32:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a2qj8pCD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D9510E0D8;
 Mon,  9 Mar 2026 07:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773041556; x=1804577556;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=0qNNpnP3lyZH3HdmWjAPRNRTyd2jswfseZV6vLDwdXM=;
 b=a2qj8pCDqIDmlO7i2L8y7VZ39nQn8/opSV2o2TQLzlf4bAA6rzHb9bOA
 nMhC5Paxn+ec/mUyMGz4aWej/VrsVw5gHPlGuzufK1ME75ohkXrznD1Fp
 AvrTWigLaxEI3sSLok6aLg5oJU5+Hz27CfcA5MBmcCdXKe0x9ynHAw/OG
 ue6DSkLE9Cv6HP9pH8f0mFrfChdvJrbNmFlhaS0b/vLAgoO+mA7EWco0y
 s8+CjiyVjwGJatBisRm9PuBKVy4yz6iS7tR3QyYwt4KwcUB7QggnhsEdT
 OpfU07wtSl4g9zJN0fERFcDTWsSidXyMD7cRSSXYxRfCjZOHZnzQAUf3Y A==;
X-CSE-ConnectionGUID: 5Sgpw1dWQXq3eeNYGF17cQ==
X-CSE-MsgGUID: lQQXfl/ARO2pWYrqFhHiew==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77935647"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77935647"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 00:31:06 -0700
X-CSE-ConnectionGUID: /iEYHDqqQSyCz+NV4+ewNg==
X-CSE-MsgGUID: zdJlzA9pTQSXq1tTIPc88Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="217286718"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 09 Mar 2026 00:31:01 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 09 Mar 2026 12:59:24 +0530
Subject: [PATCH RFC 1/3] drm/display/dp: Export function to wake the sink
 AUX_CH
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-dp_aux_timeout-v1-1-08c610a63a84@intel.com>
References: <20260309-dp_aux_timeout-v1-0-08c610a63a84@intel.com>
In-Reply-To: <20260309-dp_aux_timeout-v1-0-08c610a63a84@intel.com>
To: Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>, ville.syrjala@linux.intel.com, 
 suraj.kandpal@intel.com, imre.deak@intel.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
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
X-Rspamd-Queue-Id: 6DABA234D06
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
	NEURAL_HAM(-0.00)[-0.932];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	DKIM_TRACE(0.00)[intel.com:+]
X-Rspamd-Action: no action

On a native AUX_CH transaction timeout, as per Spec 2.1 Section 2.3.4
says that if the AUX Reply Timeout timer timesout, DPTX can rety for 3
times because the No Reply may be due to the DPRX waking up from
power-saving state.
Export a function to wake the DP sink AUX_CH.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c | 36 +++++++++++++++++++++++++++++++++
 include/drm/display/drm_dp_helper.h     |  1 +
 2 files changed, 37 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index a697cc227e28964cd8322803298178e7d788e820..1b8aa543ec3dc5819948af6f2724f3514b96b918 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -701,6 +701,42 @@ void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered)
 }
 EXPORT_SYMBOL(drm_dp_dpcd_set_powered);
 
+/**
+ * drm_dp_wake_sink() - Try to wake up the sink device AUX_CH if in sleep
+ *
+ * @aux: DisplayPort AUX channel
+ */
+void drm_dp_wake_sink(struct drm_dp_aux *aux)
+{
+	const u8 wake_retry = 6;
+	u8 value = 0;
+	int ret = 0;
+
+	/*
+	 * Wake the sink device
+	 * Spec DP2.1 section 2.3.1.2 if AUX CH is powered down by writing 0x02
+	 * to DP_SET_POWER dpcd reg, 1ms time would be required to wake it up
+	 */
+	ret = poll_timeout_us(ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value),
+			      ret > 0,
+			      1000, wake_retry * 1000, true);
+
+	/*
+	 * If sink is in D3 then it may not respond to the AUX tx so
+	 * wake it up to D3_AUX_ON state
+	 * If the above poll_timeout_us fails, try waking the sink.
+	 */
+	if (value == DP_SET_POWER_D3 || ret < 0) {
+		/* After setting to D0 need a min of 1ms to wake(Spec DP2.1 sec 2.3.1.2) */
+		drm_dp_dpcd_writeb(aux, DP_SET_POWER,
+				   DP_SET_POWER_D0);
+		fsleep(1000);
+		drm_dp_dpcd_writeb(aux, DP_SET_POWER,
+				   DP_SET_POWER_D3_AUX_ON);
+	}
+}
+EXPORT_SYMBOL(drm_dp_wake_sink);
+
 /**
  * drm_dp_dpcd_set_probe() - Set whether a probing before DPCD access is done
  * @aux: DisplayPort AUX channel
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 1d0acd58f48676f60ff6a07cc6812f72cbb452e8..933428025c4d75ab7a0aa63039ed5f8e45ca625b 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -546,6 +546,7 @@ struct drm_dp_aux {
 	bool dpcd_probe_disabled;
 };
 
+void drm_dp_wake_sink(struct drm_dp_aux *aux);
 int drm_dp_dpcd_probe(struct drm_dp_aux *aux, unsigned int offset);
 void drm_dp_dpcd_set_powered(struct drm_dp_aux *aux, bool powered);
 void drm_dp_dpcd_set_probe(struct drm_dp_aux *aux, bool enable);

-- 
2.25.1

