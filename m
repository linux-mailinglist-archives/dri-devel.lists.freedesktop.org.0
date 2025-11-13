Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD1DC56415
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 09:25:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22D0910E157;
	Thu, 13 Nov 2025 08:25:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q8yxmXQC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D856610E157;
 Thu, 13 Nov 2025 08:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763022340; x=1794558340;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=GSJ5a64dynzTRqvvAx14TR4skpSaLs7YUkENENcVnY4=;
 b=Q8yxmXQCX2fBy2Ov8h201ayWTIk2ucwjD7wrzg8QYQKgdwe9phBScC/2
 nkBBqV1FxHdCRQ0TnNaDLK6oKSxUT9phpy6fehXJLT2qVrQJIJgejT1HB
 wVlK1shekDgyz5kExMEWb3GwvX6Pxykj+dBdI8w3UpG/7bG1RosWFS20Z
 89fxF5WpDo8pzBS8G59+Ql+gzhM5Mir6mq/JXKB/r4kECWiBt4OH0zS+U
 BntTXIIzGqTKLRktva1hPYDmLnkuTfLBYpHtj6XGJx3j+28Gj4gPH8f3M
 5+5KBaojoGm4ImDWxCodL8g0B/n+/761J2+FUdHPtRVMFg9YSrJam7hCj A==;
X-CSE-ConnectionGUID: 56cK2QzqSGeWXegKWxPDBw==
X-CSE-MsgGUID: XQh+v5fTR5mZzVZ+BLy8sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="90569665"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="90569665"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:25:39 -0800
X-CSE-ConnectionGUID: Jz+SNo7+QguSy0a0Ohua9Q==
X-CSE-MsgGUID: 4sPzZUtdQJKrRd4RcAkCmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="193696788"
Received: from aotchere-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:25:37 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Suraj Kandpal <suraj.kandpal@intel.com>,
 dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: ankit.k.nautiyal@intel.com, arun.r.murthy@intel.com,
 imre.deak@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: Re: [PATCH] drm/display/dp_mst: Add protection against 0 vcpi
In-Reply-To: <20251113043918.716367-1-suraj.kandpal@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251113043918.716367-1-suraj.kandpal@intel.com>
Date: Thu, 13 Nov 2025 10:25:34 +0200
Message-ID: <c47f1221281e998f53169ffd0a2e06b301bb1605@intel.com>
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

On Thu, 13 Nov 2025, Suraj Kandpal <suraj.kandpal@intel.com> wrote:
> When releasing a timeslot there is a slight chance we may end up
> with the wrong payload mask due to overflow if the delayed_destroy_work
> ends up coming into play after a DP 2.1 monitor gets disconnected
> which causes vcpi to become 0 then we try to make the payload =
> ~BIT(vcpi - 1) which is a negative shift.

Is that a real scenario or a hypothetical one?

>
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 64e5c176d5cc..3cf1eafcfcb5 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4531,6 +4531,7 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
>  	struct drm_dp_mst_atomic_payload *payload;
>  	struct drm_connector_state *old_conn_state, *new_conn_state;
>  	bool update_payload = true;
> +	int bit;
>  
>  	old_conn_state = drm_atomic_get_old_connector_state(state, port->connector);
>  	if (!old_conn_state->crtc)
> @@ -4572,7 +4573,8 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
>  	if (!payload->delete) {
>  		payload->pbn = 0;
>  		payload->delete = true;
> -		topology_state->payload_mask &= ~BIT(payload->vcpi - 1);
> +		bit = payload->vcpi ? payload->vcpi - 1 : 0;
> +		topology_state->payload_mask &= ~BIT(bit);
>  	}
>  
>  	return 0;

-- 
Jani Nikula, Intel
