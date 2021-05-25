Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD82390684
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 18:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53116E250;
	Tue, 25 May 2021 16:21:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371866E1DE;
 Tue, 25 May 2021 16:21:29 +0000 (UTC)
IronPort-SDR: l/yVTWCXm1zBWjgdI9nIPLIZFh9li27zPZdKVfzoy99cQRGUWk3s7kssdjzRRRuMFe+3iBKCW0
 BrC0Ni1URN5Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="199180067"
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="199180067"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 09:21:19 -0700
IronPort-SDR: ZYvh00jSFfb50ry1KiChMWNaJtU7Jn7EJU1PSKHG6qahM2MJ3kl5MA1X71zCT+4r4zIspdzmgl
 oRJ72+ygIc6w==
X-IronPort-AV: E=Sophos;i="5.82,328,1613462400"; d="scan'208";a="464286695"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 May 2021 09:21:18 -0700
Date: Tue, 25 May 2021 09:14:10 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH 17/97] drm/i915/guc: Stop using mutex while sending
 CTB messages
Message-ID: <20210525161410.GA9227@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-18-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210506191451.77768-18-matthew.brost@intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: tvrtko.ursulin@intel.com, daniele.ceraolospurio@intel.com,
 jason.ekstrand@intel.com, jon.bloomfield@intel.com, daniel.vetter@intel.com,
 john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 06, 2021 at 12:13:31PM -0700, Matthew Brost wrote:
> From: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> We are no longer using descriptor to hold G2H replies and we are
> protecting access to the descriptor and command buffer by the
> separate spinlock, so we can stop using mutex.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index bee0958d8bae..cb58fa7f970c 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -537,7 +537,6 @@ static int ct_send(struct intel_guc_ct *ct,
>  int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
>  		      u32 *response_buf, u32 response_buf_size)
>  {
> -	struct intel_guc *guc = ct_to_guc(ct);
>  	u32 status = ~0; /* undefined */
>  	int ret;
>  
> @@ -546,8 +545,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
>  		return -ENODEV;
>  	}
>  
> -	mutex_lock(&guc->send_mutex);
> -
>  	ret = ct_send(ct, action, len, response_buf, response_buf_size, &status);
>  	if (unlikely(ret < 0)) {
>  		CT_ERROR(ct, "Sending action %#x failed (err=%d status=%#X)\n",
> @@ -557,7 +554,6 @@ int intel_guc_ct_send(struct intel_guc_ct *ct, const u32 *action, u32 len,
>  			 action[0], ret, ret);
>  	}
>  
> -	mutex_unlock(&guc->send_mutex);
>  	return ret;
>  }
>  
> -- 
> 2.28.0
> 
