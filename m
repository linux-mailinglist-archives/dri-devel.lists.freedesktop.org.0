Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52AED6D5344
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 23:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90EB210E1B3;
	Mon,  3 Apr 2023 21:16:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1440D10E1B3;
 Mon,  3 Apr 2023 21:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680556604; x=1712092604;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=N3ra2AO4hWBwhw91KuhVXI56Yt6E3/AoYlap5ePN/dI=;
 b=ccm2hTEt105Pkl4TKAe9X3LBRtnD4fCalvx4riY537CgcWYAcQ1YzMke
 nmwg8bHlySQV1OuCQoWS6i5yy739JFEGGasBVij0wWEC2+xHZHgkS43lI
 2hyDjd3oo1mlt6LmX64fQIlx8g7IlRh77JM0cJ/C8Dpiuj12YErAj/NW0
 K6vphAdxjEBphSJSm29/ZWR6HtYZmLt6Cql4TxPoxoeXc7SrfSZGtwUcB
 HBeaHZbaXnMlDnwpo0bIINrYLZg8vZHnVOMgJV2CtVNP2K10bwUWI+nzq
 dvjUZ6JC9fFVn+Ts5lOuO3uDbjjH0wMwbxWEdz32l8XZCYeN/1d0V8acK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="330593317"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="330593317"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2023 14:16:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="797211667"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; d="scan'208";a="797211667"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga002.fm.intel.com with SMTP; 03 Apr 2023 14:16:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 04 Apr 2023 00:16:39 +0300
Date: Tue, 4 Apr 2023 00:16:39 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Erico Nunes <nunes.erico@gmail.com>
Subject: Re: [PATCH 1/3] drm/lima: add usage counting method to ctx_mgr
Message-ID: <ZCtCNx5JUKFcoCCp@intel.com>
References: <20230312233052.21095-1-nunes.erico@gmail.com>
 <20230312233052.21095-2-nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230312233052.21095-2-nunes.erico@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Qiang Yu <yuq825@gmail.com>, dri-devel@lists.freedesktop.org,
 lima@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 13, 2023 at 12:30:50AM +0100, Erico Nunes wrote:
> lima maintains a context manager per drm_file, similar to amdgpu.
> In order to account for the complete usage per drm_file, all of the
> associated contexts need to be considered.
> Previously released contexts also need to be accounted for but their
> drm_sched_entity info is gone once they get released, so account for it
> in the ctx_mgr.
> 
> Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
> ---
>  drivers/gpu/drm/lima/lima_ctx.c | 30 +++++++++++++++++++++++++++++-
>  drivers/gpu/drm/lima/lima_ctx.h |  3 +++
>  2 files changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/lima/lima_ctx.c b/drivers/gpu/drm/lima/lima_ctx.c
> index 891d5cd5019a..e008e586fad0 100644
> --- a/drivers/gpu/drm/lima/lima_ctx.c
> +++ b/drivers/gpu/drm/lima/lima_ctx.c
> @@ -15,6 +15,7 @@ int lima_ctx_create(struct lima_device *dev, struct lima_ctx_mgr *mgr, u32 *id)
>  	if (!ctx)
>  		return -ENOMEM;
>  	ctx->dev = dev;
> +	ctx->mgr = mgr;
>  	kref_init(&ctx->refcnt);
>  
>  	for (i = 0; i < lima_pipe_num; i++) {
> @@ -42,10 +43,17 @@ int lima_ctx_create(struct lima_device *dev, struct lima_ctx_mgr *mgr, u32 *id)
>  static void lima_ctx_do_release(struct kref *ref)
>  {
>  	struct lima_ctx *ctx = container_of(ref, struct lima_ctx, refcnt);
> +	struct lima_ctx_mgr *mgr = ctx->mgr;
>  	int i;
>  
> -	for (i = 0; i < lima_pipe_num; i++)
> +	for (i = 0; i < lima_pipe_num; i++) {
> +		struct lima_sched_context *context = &ctx->context[i];
> +		struct drm_sched_entity *entity = &context->base;
> +
> +		mgr->elapsed_ns[i] += entity->elapsed_ns;

drm-tip build is now broken because of this vs. 
commit baad10973fdb ("Revert "drm/scheduler: track GPU active time per entity"")

../drivers/gpu/drm/lima/lima_ctx.c: In function ‘lima_ctx_do_release’:
../drivers/gpu/drm/lima/lima_ctx.c:53:45: error: ‘struct
drm_sched_entity’ has no member named ‘elapsed_ns’
   53 |                 mgr->elapsed_ns[i] += entity->elapsed_ns;

-- 
Ville Syrjälä
Intel
