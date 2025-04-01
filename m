Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D582A77E14
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 16:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5478710E5EB;
	Tue,  1 Apr 2025 14:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cOmAXulF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E67D10E5EB;
 Tue,  1 Apr 2025 14:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743518600; x=1775054600;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=K6WJY3tfkFhz/muLLbEhJ7qHN/xkLBt2I7DVfEWfKWw=;
 b=cOmAXulFoWVJwxPq2MYzsUm42Ork1EhgE9efyl1BobzmKHU9xD61l2VQ
 5CEG8vWkQcjg0A97ELr+eqEk6Z9YNKuFDKwWNikm7pyaFy9tGJKkL/T7x
 CkoPt8CcrfUJdpgpqOr1MvHO/Ck6RcClXBC6flZRS0da5LyUElEREA/BJ
 9RY0dPtvAZXL3Yn2WvZ3lYcAi2HW9tfQ5y8KVez4H71dz8/17KoyKinQk
 XyKTRHQl3ZTNPQI5M2O4VYIN+myMQDQr4flKhGnftlF7J1FUNT9WKhMNv
 CV3Fb85kA/gfVI0AZf9FaoMfd619qowRZpj4KAyt2bpUlubN2HMGVS7k0 A==;
X-CSE-ConnectionGUID: E/4GTyeOQsuo90sdZzycJA==
X-CSE-MsgGUID: xpXoUQTORIWG+dzZsUeMUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="44095946"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="44095946"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 07:43:19 -0700
X-CSE-ConnectionGUID: rfAdMOvnSAy03oJnx0kCmg==
X-CSE-MsgGUID: 3ySWbYOHTWquYSPc0wG4Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; d="scan'208";a="131543480"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2025 07:43:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Dmitry Baryshkov
 <dmitry.baryshkov@linaro.org>, Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 1/2] drm/dp_mst: Fix GUID DPCD write to non-root MST
 branch devices
In-Reply-To: <20250401103846.686408-1-imre.deak@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250401103846.686408-1-imre.deak@intel.com>
Date: Tue, 01 Apr 2025 17:43:13 +0300
Message-ID: <87ikno2b9a.fsf@intel.com>
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

On Tue, 01 Apr 2025, Imre Deak <imre.deak@intel.com> wrote:
> The return value on success of drm_dp_send_dpcd_write() called for
> non-root MST branch devices from drm_dp_check_mstb_guid() is the number
> of bytes transferred. Atm this return value (in case of a complete read)
> will be regarded incorrectly as an error by the caller of
> drm_dp_check_mstb_guid(). Fix this by converting the return value for a
> complete read to the expected success code (0) and for a partial read to
> a failure code (-EPROTO).
>
> Fixes: 2554da0de3e8 ("drm/display: dp-mst-topology: use new DCPD access helpers")
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Imre Deak <imre.deak@intel.com>

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index de3fc6090c906..619f461e02f76 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -2200,6 +2200,8 @@ static int drm_dp_check_mstb_guid(struct drm_dp_mst_branch *mstb, guid_t *guid)
>  			ret = drm_dp_send_dpcd_write(mstb->mgr,
>  						     mstb->port_parent,
>  						     DP_GUID, sizeof(buf), buf);
> +			if (ret >= 0)
> +				ret = ret == sizeof(buf) ? 0 : -EPROTO;
>  		} else {
>  			ret = drm_dp_dpcd_write_data(mstb->mgr->aux,
>  						     DP_GUID, buf, sizeof(buf));

-- 
Jani Nikula, Intel
