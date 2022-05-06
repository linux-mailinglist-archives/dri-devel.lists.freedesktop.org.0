Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8802E51DE77
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 19:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F389810E391;
	Fri,  6 May 2022 17:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF33910E290;
 Fri,  6 May 2022 17:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651859408; x=1683395408;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=LQJjYu1I3rkKljzYGdfluPYAruv2ypErSYT1ecqjMvE=;
 b=CFOAefolrz5+5I2tn+p+ml7YhENqe+esQs+Mb5QMVe8M5RuOIGRFwUPK
 FMRNWgpApcLEgCZc87ty5T9VsxBFSRxmGXFP1v0if/vqQpdaPY6CD1B4Y
 mud3V9QVqRhGMsw0WubWBC1PhqkdfW7HbH9JGHLi9f4fqkSq52dQoOq/m
 owbUfLXdhl/9IrXTUVw+fcYDYioB4vIuSY+D1zPjseuHzFFfr20XPsHBu
 BHB3G75RBKZFTiWTcfpLQ6Ck3AHUap9Kifxl92qIS/F5/Sx6jTSDg+dEE
 TCF0Kb+/Q73HR2zuoH4Adv9rwlsEIvOaoPIF4fzY0e0Wt62V6I2QeG/dY g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10339"; a="268429609"
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="268429609"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 10:50:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,205,1647327600"; d="scan'208";a="563952344"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by orsmga007.jf.intel.com with SMTP; 06 May 2022 10:50:05 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 06 May 2022 20:50:05 +0300
Date: Fri, 6 May 2022 20:50:05 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 02/25] drm/edid: convert drm_for_each_detailed_block() to
 edid iter
Message-ID: <YnVfzUAAx0reZ4wX@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
 <26e5a04f13803a151ff832e0bccde06e44768c38.1651830938.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26e5a04f13803a151ff832e0bccde06e44768c38.1651830938.git.jani.nikula@intel.com>
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

On Fri, May 06, 2022 at 01:10:09PM +0300, Jani Nikula wrote:
> We have an iterator for this, use it. It does include the base block,
> but its tag is 0 and will be skipped.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> ---
>  drivers/gpu/drm/drm_edid.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index efc1999b9573..dcef92c8887a 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -2574,6 +2574,8 @@ vtb_for_each_detailed_block(const u8 *ext, detailed_cb *cb, void *closure)
>  static void
>  drm_for_each_detailed_block(const struct edid *edid, detailed_cb *cb, void *closure)
>  {
> +	struct drm_edid_iter edid_iter;
> +	const u8 *ext;
>  	int i;
>  
>  	if (edid == NULL)
> @@ -2582,9 +2584,8 @@ drm_for_each_detailed_block(const struct edid *edid, detailed_cb *cb, void *clos
>  	for (i = 0; i < EDID_DETAILED_TIMINGS; i++)
>  		cb(&(edid->detailed_timings[i]), closure);
>  
> -	for (i = 0; i < edid_extension_block_count(edid); i++) {
> -		const u8 *ext = edid_extension_block_data(edid, i);
> -
> +	drm_edid_iter_begin(edid, &edid_iter);
> +	drm_edid_iter_for_each(ext, &edid_iter) {
>  		switch (*ext) {
>  		case CEA_EXT:
>  			cea_for_each_detailed_block(ext, cb, closure);
> @@ -2596,6 +2597,7 @@ drm_for_each_detailed_block(const struct edid *edid, detailed_cb *cb, void *clos
>  			break;
>  		}
>  	}
> +	drm_edid_iter_end(&edid_iter);
>  }
>  
>  static void
> -- 
> 2.30.2

-- 
Ville Syrjälä
Intel
