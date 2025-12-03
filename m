Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F8FC9EFC9
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 13:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D3E10E78F;
	Wed,  3 Dec 2025 12:27:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QYArkndf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B7510E146;
 Wed,  3 Dec 2025 12:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764764862; x=1796300862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QAnt8xMWTEFOGqh8jaKSYsiOTBC+evsQtew/Tzx5rcA=;
 b=QYArkndfPltjqx4AtGTOLSAdwzBegajP6jL1mEY94LbFi+CBuHf7UETW
 iVeghWDHkFoIryaKatosmLkqMwEKNw8aEv/XpSZ3+Cp+31xfm3WM4TxP2
 pmT6EUOnDa3FDGT6w6all7rHKJVlexDzDY8ohEb12WqcTQxwBpAR0x7qY
 taq4RnY1oEWSbZKAqhd0wv0T3ysVUoHbbSgtS9hJhO6UgGV2sEESk7AE7
 ZCStVYAEvY/Hh1qJEXmMW/qCzVluShAstN02tzDBhf4S6QdC83LOSFZSW
 k894rTCUPOPbvraiSNqdIrMo6BdvY4B+fimeCnTZ1BIqngPXh7kAgSOjz w==;
X-CSE-ConnectionGUID: nGeoYpKmTaqKHmfhZzf+Zg==
X-CSE-MsgGUID: WPhH77J8SQOHaK7R7WPcIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="65753778"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="65753778"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 04:27:42 -0800
X-CSE-ConnectionGUID: ZYzhnvoAQ+Kd4/WK8R14FA==
X-CSE-MsgGUID: RbuGZ89pQ0GW6MQ6GjcMxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="194759836"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.70])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 04:27:40 -0800
Date: Wed, 3 Dec 2025 14:27:37 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH] nouveau: use proper atomic accessor to get crtc state
Message-ID: <aTAsueO-OwP5pd4h@intel.com>
References: <20251130214206.1469934-1-airlied@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251130214206.1469934-1-airlied@gmail.com>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Mon, Dec 01, 2025 at 07:42:06AM +1000, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> This gets the crtc state from the current state, instead of
> trying to lookup or create a state.
> 
> atomic core started warning about this recently.
> 
> Fixes: 0a0e79a2d9ed ("drm/atomic: WARN about invalid drm_foo_get_state() usage")
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/atom.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/atom.h b/drivers/gpu/drm/nouveau/dispnv50/atom.h
> index 93f8f4f64578..ada8fb6f1a9a 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/atom.h
> +++ b/drivers/gpu/drm/nouveau/dispnv50/atom.h
> @@ -151,7 +151,7 @@ struct nv50_head_atom {
>  static inline struct nv50_head_atom *
>  nv50_head_atom_get(struct drm_atomic_state *state, struct drm_crtc *crtc)
>  {
> -	struct drm_crtc_state *statec = drm_atomic_get_crtc_state(state, crtc);
> +	struct drm_crtc_state *statec = drm_atomic_get_new_crtc_state(state, crtc);
>  	if (IS_ERR(statec))

drm_atomic_get_new_crtc_state() will never return an error.
It's either a valid pointer or NULL.

The somewhat oddball terminology used in the nouveau code makes it
a bit hard to read, but to me it looks like this this is only used
to get the crtc state for a plane's old/new crtc. Those should always
be included in the atomic state along with the plane itself, so I
*think* you could just nuke all the error checks in the callers and
not bother with any NULL checks.

>  		return (void *)statec;
>  	return nv50_head_atom(statec);
> -- 
> 2.51.1

-- 
Ville Syrjälä
Intel
