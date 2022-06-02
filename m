Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B0D53BFFD
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 22:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C401E1136FB;
	Thu,  2 Jun 2022 20:42:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA4C1136F8
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 20:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654202528; x=1685738528;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=Sok3m5diANN7wooonIOw/1EsMvSV7BlM/zWiPdcGKEg=;
 b=FqDNb9xaRKNP5v8k/PK81gpwvvqck16TYWih0EqXMeFlIU3sJaoFY6Wy
 frn+8/hdWNk7tdXKse2MhXLGM0mW9qnHFcV4UkTHXXxQk7cn+5S3CLY0I
 yCHLLFH8VSSs8ipUIo5zO4NFdjxS9ljRh3BYoHqICJkLIqI2ziftBVTWH
 juxNMg0Pu8RMI/9/VMEjXyaBeURSQFKVE6UHZmlGTtXiyq4fAK9zVdrL/
 ldtL+uvJ0ojuGuDI2IccZZTAHbh5+Oy1lV6MMlm8YolMgQtATZ/ueIC5h
 5hg6l8GGcULP/kPZtIslrPHejn15u5Qe4AGgflNSR1rQDcwRdwA/TrHra Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10366"; a="256555006"
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; d="scan'208";a="256555006"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2022 13:42:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,272,1647327600"; d="scan'208";a="607038074"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.163])
 by orsmga008.jf.intel.com with SMTP; 02 Jun 2022 13:42:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 02 Jun 2022 23:42:02 +0300
Date: Thu, 2 Jun 2022 23:42:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 2/3] drm/display/dp_mst: Fix
 drm_atomic_get_mst_topology_state()
Message-ID: <YpkgmvBeX6L7Bs5y@intel.com>
References: <20220602201757.30431-1-lyude@redhat.com>
 <20220602201757.30431-3-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220602201757.30431-3-lyude@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Imran Khan <imran.f.khan@oracle.com>,
 Javier Martinez Canillas <javierm@redhat.com>, stable@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, dri-devel@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 02, 2022 at 04:17:56PM -0400, Lyude Paul wrote:
> I noticed a rather surprising issue here while working on removing all of
> the non-atomic MST code: drm_atomic_get_mst_topology_state() doesn't check
> the return value of drm_atomic_get_private_obj_state() and instead just
> passes it directly to to_dp_mst_topology_state(). This means that if we
> hit a deadlock or something else which would return an error code pointer,
> we'll likely segfault the kernel.
> 
> This is definitely another one of those fixes where I'm astonished we
> somehow managed never to discover this issue until now…

It has been discussed before.

struct drm_dp_mst_topology_state {
	struct drm_private_state base;
	...
}

so offsetof(base)==0.

> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Fixes: a4370c777406 ("drm/atomic: Make private objs proper objects")
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v4.14+
> ---
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 2 +-
>  include/drm/display/drm_dp_mst_helper.h       | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> index d84673b3294b..d6e595b95f07 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -5468,7 +5468,7 @@ EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
>  struct drm_dp_mst_topology_state *drm_atomic_get_mst_topology_state(struct drm_atomic_state *state,
>  								    struct drm_dp_mst_topology_mgr *mgr)
>  {
> -	return to_dp_mst_topology_state(drm_atomic_get_private_obj_state(state, &mgr->base));
> +	return to_dp_mst_topology_state_safe(drm_atomic_get_private_obj_state(state, &mgr->base));
>  }
>  EXPORT_SYMBOL(drm_atomic_get_mst_topology_state);
>  
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
> index 10adec068b7f..fe7577e7f305 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -541,6 +541,8 @@ struct drm_dp_payload {
>  };
>  
>  #define to_dp_mst_topology_state(x) container_of(x, struct drm_dp_mst_topology_state, base)
> +#define to_dp_mst_topology_state_safe(x) \
> +	container_of_safe(x, struct drm_dp_mst_topology_state, base)

Wasn't aware of container_of_safe(). I suppose no real harm 
in using it. Not sure why we'd even keep the non-safe version
around?

Though the use of container_of_safe() everywhere won't help
when "casting" the other way (&foo->base, when foo==NULL/errptr).
In order to make that work for non-zero offsets we'd have to
introduce a casting macro for that direction as well.

>  
>  struct drm_dp_vcpi_allocation {
>  	struct drm_dp_mst_port *port;
> -- 
> 2.35.3

-- 
Ville Syrjälä
Intel
