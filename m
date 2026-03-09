Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4UNoB553rmlwFAIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 08:32:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3045234D14
	for <lists+dri-devel@lfdr.de>; Mon, 09 Mar 2026 08:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A64710E499;
	Mon,  9 Mar 2026 07:32:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fl7JSZia";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3768A10E0D8;
 Mon,  9 Mar 2026 07:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773041557; x=1804577557;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=lJ8E4ZxIoPsvLDyPf5xPOgjs/2rkmGqWz7hirornyf8=;
 b=fl7JSZiam88XiCnBzgXIXz2f6sqIOUucHeme4A4mWSHpk8dsT/MD2deB
 u4yQVNperqGaJG7f9r/XLy77ia+qCLTKWsER1HJwWKQSpy9pQ6Ky6T3Qv
 5L7fIcXasINTSPm5eMAUPrfqw5K6E0AQZfrhuJ7s79y60Vf3t4fQHJNpH
 120ba+kl0CNSrFokqOmK0Fyk2StDGPN9LZjnpQlE3L/jlq3BLGBNQQkuH
 FpaiAgr0CrrIH/T5qXZMev7n+GE2EUEdqEcYEXwWelLAVcSX4uRJe4vCA
 0DAcqUAHMqtbanwzVuCuXktsaF3lMoM6xyjA0tOrIVvs2dM4WBev8UTfn Q==;
X-CSE-ConnectionGUID: XMZbvQd+Trq0xbwtrWEW7g==
X-CSE-MsgGUID: RieWgYdgQ2a+5i7MvVnd5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="77935659"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="77935659"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 00:31:07 -0700
X-CSE-ConnectionGUID: 7US0M7c8TTS+CzJ9UDVhAA==
X-CSE-MsgGUID: dBau2nXoTPeYdXKgGdjwuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="217286736"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 09 Mar 2026 00:31:04 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 09 Mar 2026 12:59:25 +0530
Subject: [PATCH RFC 2/3] drm/i915/dp: On AUX_CH tx timeout, wake up the
 sink
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-dp_aux_timeout-v1-2-08c610a63a84@intel.com>
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
X-Rspamd-Queue-Id: E3045234D14
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

On a native AUX_CH transaction when the timer on DPTX timesout this can
be due to DPTX sending invalid command or the sink is waking up from
sleept state and hence there is a No Reply from DPRX. In this case try
to wake up the sink device.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux.c b/drivers/gpu/drm/i915/display/intel_dp_aux.c
index b20ec3e589fadc4972efb77286978f38a527bd1c..0a9e2d6cdbc5d9e0d17b2db60a32cf20a3bad6b6 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux.c
@@ -372,8 +372,17 @@ intel_dp_aux_xfer(struct intel_dp *intel_dp,
 			 *   Timeout errors from the HW already meet this
 			 *   requirement so skip to next iteration
 			 */
-			if (status & DP_AUX_CH_CTL_TIME_OUT_ERROR)
+			if (status & DP_AUX_CH_CTL_TIME_OUT_ERROR) {
+				/*
+				 * Timeout can occur when there is no reply
+				 * from the sink and this can be either due to
+				 * DPTX sending wrong command or sink is sleep
+				 * state/waking up from sleep state.
+				 * Spec DP2.1 Section 2.11.7.1.5.8
+				 */
+				drm_dp_wake_sink(&intel_dp->aux);
 				continue;
+			}
 
 			if (status & DP_AUX_CH_CTL_RECEIVE_ERROR) {
 				usleep_range(400, 500);

-- 
2.25.1

