Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDDC67EE85
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 20:43:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F1B710E1AA;
	Fri, 27 Jan 2023 19:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F92D10E1A6;
 Fri, 27 Jan 2023 19:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674848589; x=1706384589;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=WP014AgyaRJ/8TEypXMJbjhpn92lCKYiy5ErTpKlnLM=;
 b=cycW11snp6xHDpoNVjSwgPdb97tIKq0CXUJGxgz7gAXWLw49kCugGTLA
 Epl6frNDPA7dXAYOGQHaWGERQ1BVFRgGLEORSqXSS/QY1TcR4TdlMjqr6
 kEh3OhqFmwY6YPfN+e7oL/Wi3KfuP6/sxoBbeA/PrwKxadploVtCxASFL
 ZpJOTrlNQMzRjM46RD+nIP/GhmJn8+ujUHk08GUES/5yRXbclkHWXR6vA
 2nKlrGzc5TEFLEUjbqA7H4ZBiGJf6/hV2eXTaC2E0v7Sa4ovrwmkvpzMn
 Uld7mI2L0ScMtrGtwrb2NzuGvwFdexbA+K4ltKUzAUStrw/0vOlYEzC3+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="391726915"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="391726915"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2023 11:42:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10603"; a="752095820"
X-IronPort-AV: E=Sophos;i="5.97,252,1669104000"; d="scan'208";a="752095820"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.55])
 by FMSMGA003.fm.intel.com with SMTP; 27 Jan 2023 11:42:40 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 27 Jan 2023 21:42:39 +0200
Date: Fri, 27 Jan 2023 21:42:39 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH 5/9] drm/display/dp_mst: Fix the payload VCPI check in
 drm_dp_mst_dump_topology()
Message-ID: <Y9QpL1Y110IZcrSK@intel.com>
References: <20230125114852.748337-1-imre.deak@intel.com>
 <20230125114852.748337-6-imre.deak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230125114852.748337-6-imre.deak@intel.com>
X-Patchwork-Hint: comment
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 25, 2023 at 01:48:48PM +0200, Imre Deak wrote:
> Fix an off-by-one error in the VCPI check in drm_dp_mst_dump_topology().
> 
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index 81cc0c3b1e000..619f616d69e20 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4770,7 +4770,7 @@ void drm_dp_mst_dump_topology(struct seq_file *m,
>  		list_for_each_entry(payload, &state->payloads, next) {
>  			char name[14];
>  
> -			if (payload->vcpi != i || payload->delete)
> +			if (payload->vcpi != i + 1 || payload->delete)

Why does this code even do that funny nested double loop?

>  				continue;
>  
>  			fetch_monitor_name(mgr, payload->port, name, sizeof(name));
> -- 
> 2.37.1

-- 
Ville Syrjälä
Intel
