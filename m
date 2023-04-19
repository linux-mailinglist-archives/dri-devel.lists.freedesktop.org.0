Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFA46E7A80
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 15:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA5910E170;
	Wed, 19 Apr 2023 13:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6BA10E170
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 13:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681910469; x=1713446469;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=sQu+EGztomOf0wJcq47X3hsD6fAQUa1otr26HmJHEN4=;
 b=n+smekcv8yr1JmgjQYklvRpxlXn2sVDhdYvvw8u4stxXAlYqrEYIPyH2
 utHMFBGXCSJvuTqMuW6yVXyWbC1ijesm/41ka9aKgW5/xoPxCw22YlYaU
 RupGTVPdHBgMAasee+igWtvECPxPjWIDsXrvNh+v5OBPSV7jDdBrm4qCe
 dlIEk80Mu6LBQgORv+VA4OPPgu/WIXArSIIKgA8pNTzpYh1sOKYAda2sl
 qKQuFArjfy/yN9tLg4cq2wig44nZlNbIC4Ms5mahCEh9/yqa/6Rd3EnT6
 b1CRQP1xEeZN76akO6ywe+63aqrk6LRUksoRoJP5/QBK6e/hTFwKxkbpz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="345445532"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="345445532"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 06:21:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="802916028"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="802916028"
Received: from yedidyal-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.47.37])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 06:21:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jeff Layton <jlayton@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2] drm: use mgr->dev in drm_dbg_kms in
 drm_dp_add_payload_part2
In-Reply-To: <20230419112447.18471-1-jlayton@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230419112447.18471-1-jlayton@kernel.org>
Date: Wed, 19 Apr 2023 16:21:03 +0300
Message-ID: <87o7nkypmo.fsf@intel.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Wayne.Lin@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Apr 2023, Jeff Layton <jlayton@kernel.org> wrote:
> I've been experiencing some intermittent crashes down in the display
> driver code. The symptoms are ususally a line like this in dmesg:
>
>     amdgpu 0000:30:00.0: [drm] Failed to create MST payload for port 000000006d3a3885: -5
>
> ...followed by an Oops due to a NULL pointer dereference.
>
> Switch to using mgr->dev instead of state->dev since "state" can be
> NULL in some cases.
>
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2184855
> Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
> Signed-off-by: Jeff Layton <jlayton@kernel.org>

Thanks,

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> I've been running this patch for a couple of days, but the problem
> hasn't occurred again as of yet. It seems sane though as long as we can
> assume that mgr->dev will be valid even when "state" is a NULL pointer.
>
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 38dab76ae69e..e2e21ce79510 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -3404,7 +3404,7 @@ int drm_dp_add_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
>  
>  	/* Skip failed payloads */
>  	if (payload->vc_start_slot == -1) {
> -		drm_dbg_kms(state->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
> +		drm_dbg_kms(mgr->dev, "Part 1 of payload creation for %s failed, skipping part 2\n",
>  			    payload->port->connector->name);
>  		return -EIO;
>  	}

-- 
Jani Nikula, Intel Open Source Graphics Center
