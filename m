Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHrcNnpKqWn+3wAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:18:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F93320E319
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 10:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713AE10EBCA;
	Thu,  5 Mar 2026 09:18:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQ9SNWm/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E014A10EBCA;
 Thu,  5 Mar 2026 09:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772702326; x=1804238326;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=BXzAUTiKj5HwGFCiCJkRyXpWu7IkPmlenPetUuj2SaE=;
 b=hQ9SNWm/tVnlOdev/64EHGVeI6UB4OCod80VRU1tlkr1Il0wXRz+MQth
 I5cJsNPIGT/62P4X0z47kXhTEesD1+5NdsyOqPqmm2LutJtkgn0XdclrJ
 wbormavFse+1JwC9faDidTLBjGppsELXDQOIG51HJDlDKgzAHFsneQ0L5
 s1YhdyDEM0cTEMdlACElv2cpSF+nU9sayNYiWQkV0OlgZvJ0B+f8p1SUW
 UDAnaaNYBgf49Wx7OUcOrnOdHuSBAUFH75WmEiEajtnob/81mVWypN1Ow
 RfGNlRmf0aKI3YKiISLrsI934Mstp54WbzhUZn9QggBCtLG3YEW4aOljx A==;
X-CSE-ConnectionGUID: oHgdxkA+TwKcBmRSLrbbnQ==
X-CSE-MsgGUID: TaKvsqZySaWbWFFyhOuGpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="77654194"
X-IronPort-AV: E=Sophos;i="6.23,325,1770624000"; d="scan'208";a="77654194"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:18:44 -0800
X-CSE-ConnectionGUID: 7pQVRJ7AR3e7Ep3saSntAw==
X-CSE-MsgGUID: U2mJ2UdCTNC9lJTjWmeCcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,325,1770624000"; d="scan'208";a="249084544"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.134])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:18:42 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arun R Murthy <arun.r.murthy@intel.com>, Imre Deak
 <imre.deak@intel.com>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Arun R Murthy <arun.r.murthy@intel.com>
Subject: Re: [PATCH RFC 1/4] drm/display/dp: Read LTTPR caps without DPRX caps
In-Reply-To: <20260305-dp_aux-v1-1-54ee0b5f5158@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260305-dp_aux-v1-0-54ee0b5f5158@intel.com>
 <20260305-dp_aux-v1-1-54ee0b5f5158@intel.com>
Date: Thu, 05 Mar 2026 11:18:38 +0200
Message-ID: <33d050c09290955321f01d61166e7763b6db2e77@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
X-Rspamd-Queue-Id: 4F93320E319
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@linux.intel.com,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,intel.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,gitlab.freedesktop.org:url]
X-Rspamd-Action: no action

On Thu, 05 Mar 2026, Arun R Murthy <arun.r.murthy@intel.com> wrote:
> We at present have drm_dp_Read_lttpr_common_caps to read the LTTPR caps,
> but this function required DPRX caps to be passed. As per the DP2.1 spec
> section 3.6.8.6.1, section 2.12.1, section 2.12.3 (Link Policy) the
> LTTPR caps is to be read first followed by the DPRX capability.
> Hence adding another function to read the LTTPR caps without the need
> for DPRX caps.

If the spec says something, why are we keeping the function that does it
the other way?

> In order to handle the issue
> https://gitlab.freedesktop.org/drm/intel/-/issues/4531
> of reading corrupted values for LTTPR caps on few pannels with DP Rev 1.2
> the workaround of reducing the block size to 1 and reading one block at a
> time is done by checking for a valid link rate.
>
> Fixes: 657586e474bd ("drm/i915: Add a DP1.2 compatible way to read LTTPR capabilities")

You're not calling the code being added here. This can't fix anything on
its own. This is not how the Fixes: tag works.

> Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c | 63 +++++++++++++++++++++++++++++++++
>  include/drm/display/drm_dp_helper.h     |  2 ++
>  2 files changed, 65 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
> index a697cc227e28964cd8322803298178e7d788e820..9fe7db73027a43b01c4d12927f1f0e61444658e5 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -3050,6 +3050,69 @@ static int drm_dp_read_lttpr_regs(struct drm_dp_aux *aux,
>  	return 0;
>  }
>  
> +static bool drm_dp_valid_link_rate(u8 link_rate)
> +{
> +	switch (link_rate) {
> +	case 0x06:
> +	case 0x0a:
> +	case 0x14:
> +	case 0x1e:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +/**
> + * drm_dp_read_lttpr_caps - read the LTTPR capabilities
> + * @aux: DisplayPort AUX channel
> + * @caps: buffer to return the capability info in
> + *
> + * Read capabilities common to all LTTPRs.
> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> +int drm_dp_read_lttpr_caps(struct drm_dp_aux *aux,
> +			   u8 caps[DP_LTTPR_COMMON_CAP_SIZE])
> +{
> +	/*
> +	 * At least the DELL P2715Q monitor with a DPCD_REV < 0x14 returns
> +	 * corrupted values when reading from the 0xF0000- range with a block
> +	 * size bigger than 1.
> +	 * For DP as per the spec DP2.1 section 3.6.8.6.1, section 2.12.1, section
> +	 * 2.12.3 (Link Policy) the LTTPR caps is to be read first followed by the
> +	 * DPRX capability.
> +	 * So ideally we dont have DPCD_REV yet to check for the revision, instead
> +	 * check for the correctness of the read value and in found corrupted read
> +	 * block by block.
> +	 */
> +	int block_size;
> +	int offset;
> +	int ret;
> +	int address = DP_LT_TUNABLE_PHY_REPEATER_FIELD_DATA_STRUCTURE_REV;
> +	int buf_size = DP_LTTPR_COMMON_CAP_SIZE;
> +
> +	ret = drm_dp_dpcd_read_data(aux, address, &caps, buf_size);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (caps[0] == 0x14) {
> +		if (!drm_dp_valid_link_rate(caps[1])) {

So you first read the whole thing once, and then in some cases read the
whole thing again one byte at a time?

Everything about this smells like a quirk for a specific display, not
something you do normally. We shouldn't have to have two ways to read
the lttpr caps in the normal case.

> +			block_size = 1;

What's the point with the variable?

> +			for (offset = 0; offset < buf_size; offset += block_size) {
> +				ret = drm_dp_dpcd_read_data(aux,
> +							    address + offset,
> +							    &caps[offset],
> +							    block_size);
> +				if (ret < 0)
> +					return ret;
> +			}
> +		}
> +	}
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_dp_read_lttpr_caps);
> +
>  /**
>   * drm_dp_read_lttpr_common_caps - read the LTTPR common capabilities
>   * @aux: DisplayPort AUX channel
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
> index 1d0acd58f48676f60ff6a07cc6812f72cbb452e8..def145e67011c325b790c807f934b288304260c1 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -755,6 +755,8 @@ bool drm_dp_read_sink_count_cap(struct drm_connector *connector,
>  				const struct drm_dp_desc *desc);
>  int drm_dp_read_sink_count(struct drm_dp_aux *aux);
>  
> +int drm_dp_read_lttpr_caps(struct drm_dp_aux *aux,
> +				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);
>  int drm_dp_read_lttpr_common_caps(struct drm_dp_aux *aux,
>  				  const u8 dpcd[DP_RECEIVER_CAP_SIZE],
>  				  u8 caps[DP_LTTPR_COMMON_CAP_SIZE]);

-- 
Jani Nikula, Intel
