Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E08489CFE
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jan 2022 17:01:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 958E710F0E5;
	Mon, 10 Jan 2022 16:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C387210F0E5;
 Mon, 10 Jan 2022 16:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641830511; x=1673366511;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GnVr/GmwLwcIVXk9r4H3y3BMTDns3zwQ6+20Fu6PE/U=;
 b=b22x9BtCj2sT5dV33aTo0jXzQXC1lMiAk5Gm/jkBdFJFda+vuWZZJtCx
 kN2IDty6CfNL0HWJD/dqz7GcUpgkfPv6eDcFPTIckpY3IO7wv+Lzod3k1
 3emOYt5j9FHli6GMczT8Zpx1liargv6F4B8PyZINvrV2B2lAK+iQXE7bp
 0UROSlaRgAsdtY6fo9IDIPeKF77IYU71AFGjlE0xJYS5UlTpN/2c9LtSW
 ZD9KEuRHtYcQmLX7CIoer/b8vdr6heAbo5AWo9YvXH/ItjfqnZXZIMhNg
 INA/ZMasXWDV50pSgacUhaiRuhLCDfZhdlZRu2Qa+NRcIu4rh9EHyHtFi Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10222"; a="306608986"
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="306608986"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 08:01:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,277,1635231600"; d="scan'208";a="528323244"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.147])
 by orsmga008.jf.intel.com with SMTP; 10 Jan 2022 08:01:22 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 10 Jan 2022 18:01:22 +0200
Date: Mon, 10 Jan 2022 18:01:22 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [Intel-gfx] [PATCH 2/2] drm/mst: use DP_GET_SINK_COUNT() for
 sink count in ESI
Message-ID: <YdxYUokZ5Qo4VuoG@intel.com>
References: <20220104184857.784563-1-jani.nikula@intel.com>
 <20220104184857.784563-2-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220104184857.784563-2-jani.nikula@intel.com>
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

On Tue, Jan 04, 2022 at 08:48:57PM +0200, Jani Nikula wrote:
> Take bit 7 into account when reading sink count from
> DP_DEVICE_SERVICE_IRQ_VECTOR_ESI0.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/drm_dp_mst_topology.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
> index f3d79eda94bb..ab4372e9fe43 100644
> --- a/drivers/gpu/drm/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/drm_dp_mst_topology.c
> @@ -4196,7 +4196,7 @@ int drm_dp_mst_hpd_irq(struct drm_dp_mst_topology_mgr *mgr, u8 *esi, bool *handl
>  	int ret = 0;
>  	int sc;
>  	*handled = false;
> -	sc = esi[0] & 0x3f;
> +	sc = DP_GET_SINK_COUNT(esi[0]);

I wouldn't mind a s/sc/sink_count/ as well.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

>  
>  	if (sc != mgr->sink_count) {
>  		mgr->sink_count = sc;
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
