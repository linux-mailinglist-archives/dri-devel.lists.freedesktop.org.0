Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7BF4B12CE
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 17:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECAD710E89B;
	Thu, 10 Feb 2022 16:33:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C0310E89B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 16:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644510799; x=1676046799;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=OpeIuzHU+tS8pQ1NYCSyCC2tb8bKaARQvg3Az9En6js=;
 b=nfir+LEN5SQ8h/aDAPCoay5IODRw7Ds3bO378AadBsFGRE4z5D5FkopG
 Fnwv0BOMDGV8Z8q3kPpJ5TRDsIu4EuPaQCiY5TttaOfdHH9DqF0m3y7xC
 TOSyIBBSM0l8L3OHts2++4mAw+1OMWpfEhHNuAxL8+DoDYxkVcfD4iMEX
 3EBU8g5a+xC3oWJdhoNm+U/BW76n3I1YpuZjU3NENh/M0M+4v+RE0VDYz
 MfYspDiJgetMeBuEQSAZlKpWQiyQxzrDdA1liNjs89GMTlw0NbYLm11P8
 tKzh7gVQzHT1Ag8ueqJjDup3QoOKUQEmwqTK/M9eki4HLPoch/ZcivvkD g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10254"; a="249284309"
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="249284309"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 08:33:18 -0800
X-IronPort-AV: E=Sophos;i="5.88,359,1635231600"; d="scan'208";a="541678209"
Received: from dhogarty-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.10.221])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2022 08:33:17 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/dp_mst: fix drm_dp_dpcd_read return value checks
In-Reply-To: <20220210154012.118472-1-contact@emersion.fr>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220210154012.118472-1-contact@emersion.fr>
Date: Thu, 10 Feb 2022 18:33:13 +0200
Message-ID: <87y22i7kc6.fsf@intel.com>
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
Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Feb 2022, Simon Ser <contact@emersion.fr> wrote:
> drm_dp_dpcd_read returns the number of bytes read. The previous code
> would print garbage on DPCD error, and would exit with on error on
> success.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

I do wish we'd just made dpcd access return 0 when the number of bytes
transferred matches the request, and an error otherwise.

BR,
Jani.

>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Fixes: cb897542c6d2 ("drm/dp_mst: Fix W=1 warnings")
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
>  drivers/gpu/drm/dp/drm_dp_mst_topology.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/dp/drm_dp_mst_topology.c b/drivers/gpu/drm/dp/drm_dp_mst_topology.c
> index 11300b53d24f..f5998b7cf602 100644
> --- a/drivers/gpu/drm/dp/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/dp/drm_dp_mst_topology.c
> @@ -4912,21 +4912,21 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>  		int ret;
>  
>  		ret = drm_dp_dpcd_read(mgr->aux, DP_DPCD_REV, buf, DP_RECEIVER_CAP_SIZE);
> -		if (ret) {
> +		if (ret != DP_RECEIVER_CAP_SIZE) {
>  			seq_printf(m, "dpcd read failed\n");
>  			goto out;
>  		}
>  		seq_printf(m, "dpcd: %*ph\n", DP_RECEIVER_CAP_SIZE, buf);
>  
>  		ret = drm_dp_dpcd_read(mgr->aux, DP_FAUX_CAP, buf, 2);
> -		if (ret) {
> +		if (ret != 2) {
>  			seq_printf(m, "faux/mst read failed\n");
>  			goto out;
>  		}
>  		seq_printf(m, "faux/mst: %*ph\n", 2, buf);
>  
>  		ret = drm_dp_dpcd_read(mgr->aux, DP_MSTM_CTRL, buf, 1);
> -		if (ret) {
> +		if (ret != 1) {
>  			seq_printf(m, "mst ctrl read failed\n");
>  			goto out;
>  		}
> @@ -4934,7 +4934,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>  
>  		/* dump the standard OUI branch header */
>  		ret = drm_dp_dpcd_read(mgr->aux, DP_BRANCH_OUI, buf, DP_BRANCH_OUI_HEADER_SIZE);
> -		if (ret) {
> +		if (ret != DP_BRANCH_OUI_HEADER_SIZE) {
>  			seq_printf(m, "branch oui read failed\n");
>  			goto out;
>  		}
>
> base-commit: ded74cafeea9311c1eaf6fccce963de2516145f7

-- 
Jani Nikula, Intel Open Source Graphics Center
