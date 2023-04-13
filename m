Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C646E0D7D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 14:31:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F1DD10EADE;
	Thu, 13 Apr 2023 12:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C094F10E138
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 12:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681389111; x=1712925111;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=T1qN+BEy+nB1sRu7UoFdHmbhBDz2OmE2p2qIBhyTCLE=;
 b=lnVXeNIFHuHtjaaA9/MM165m0mD7hAAx7MEG+Y0uAHo/NWdiQMJLeHTk
 ql/uv6b0hQFlOV7T9v60NOhGDz9bln/I0BAVp3/fw6FMIoLsG6ajdOkaY
 a/cCECZkak/vT2cpefrU3EjN+CLCQtveAjT6ZZs3Mlor0Ne4N28JipPAh
 f9DzGI8pzk9GoXx8VmUD2nk+ORfybEhR4hHBp74n7341XaldeIqFuOFWb
 IsjwB99MuNsYICj+I8N+tGuE1QPYDo57SeYSOCLM5Hl4LdMioKfr71i7G
 e6jBalkZ+QwBtXxLybSe06KLno7RptpF/lrl1utIWP8vXI09tRHoSy/Uw A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="346855154"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; d="scan'208";a="346855154"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 05:31:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="722039812"
X-IronPort-AV: E=Sophos;i="5.99,341,1677571200"; d="scan'208";a="722039812"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 05:31:47 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jeff Layton <jlayton@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm: make drm_dp_add_payload_part2 gracefully handle
 NULL state pointer
In-Reply-To: <20230413111254.22458-1-jlayton@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230413111254.22458-1-jlayton@kernel.org>
Date: Thu, 13 Apr 2023 15:31:45 +0300
Message-ID: <87edooarpq.fsf@intel.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 13 Apr 2023, Jeff Layton <jlayton@kernel.org> wrote:
> I've been experiencing some intermittent crashes down in the display
> driver code. The symptoms are ususally a line like this in dmesg:
>
>     amdgpu 0000:30:00.0: [drm] Failed to create MST payload for port 000000006d3a3885: -5
>
> ...followed by an Oops due to a NULL pointer dereference.
>
> The real bug is probably in the caller of this function, which is
> passing it a NULL state pointer, but this patch at least keeps my
> machine from oopsing when this occurs.

My fear is that papering over this makes the root cause harder to find.

Cc: Harry, Alex


BR,
Jani.


>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2184855
> Signed-off-by: Jeff Layton <jlayton@kernel.org>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 38dab76ae69e..87ad406c50f9 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3404,7 +3404,8 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
>  
>  	/* Skip failed payloads */
>  	if (payload->vc_start_slot == -1) {
> -		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
> +		drm_dbg_kms(state ? state->dev : NULL,
> +			    "Part 1 of payload creation for %s failed, skipping part 2\n",
>  			    payload->port->connector->name);
>  		return -EIO;
>  	}

-- 
Jani Nikula, Intel Open Source Graphics Center
