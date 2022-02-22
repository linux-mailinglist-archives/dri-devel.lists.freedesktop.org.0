Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A014BF842
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 13:43:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D79F10E47D;
	Tue, 22 Feb 2022 12:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 144A110E47D;
 Tue, 22 Feb 2022 12:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645533809; x=1677069809;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=V3OvJzcIYv9Xc/I5EnGnnaoV/n9suE3zy47qd9uxvdY=;
 b=gK4Oz1K++Q+l4mWdegjTrTbXOPmPvBnW28s+gM2NR1nAqvV/JB5iqtkw
 xQf8RUfETBUDk9GyqHsDDec1twG9VshsXxEfh+H9mpxkCwt9T/bYzXYeU
 zCWHWSNwwSYvL8GWJNdKqpkGuw5jBTC4ITyX0oRABkYw8P1YGTZqyQYZ4
 a5E+v0bTtTdVaZe7EkCOrURxaXSYD3bOfeeESbLD15Rki/e6PDGlK86kO
 zFJvPHj8LwZzq4ImoqmjWBTen82PKEnNQkX4vYn//HJr9Fnq1eBekrV8o
 rvcIw0NP8+B1FxTmdY4qR45qLNjoq3EFT47IWwtcuNulBpCJU47SaOsbF w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="276292984"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="276292984"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 04:43:28 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="547725699"
Received: from torta-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.49.14])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 04:43:24 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Colin Ian King <colin.i.king@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/i915: make a handful of read-only arrays static const
In-Reply-To: <20220222120323.86480-1-colin.i.king@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220222120323.86480-1-colin.i.king@gmail.com>
Date: Tue, 22 Feb 2022 14:43:22 +0200
Message-ID: <87tucr6phx.fsf@intel.com>
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Vandita Kulkarni <vandita.kulkarni@intel.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Feb 2022, Colin Ian King <colin.i.king@gmail.com> wrote:
> Don't populate the read-only arrays on the stack but instead make
> them static const. Also makes the object code a little smaller.
> Reformat the statements to clear up checkpatch warning.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/i915/display/intel_vdsc.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
> index 3faea903b9ae..d49f66237ec3 100644
> --- a/drivers/gpu/drm/i915/display/intel_vdsc.c
> +++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
> @@ -378,10 +378,18 @@ calculate_rc_params(struct rc_parameters *rc,
>  {
>  	int bpc = vdsc_cfg->bits_per_component;
>  	int bpp = vdsc_cfg->bits_per_pixel >> 4;
> -	int ofs_und6[] = { 0, -2, -2, -4, -6, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12 };
> -	int ofs_und8[] = { 2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12 };
> -	int ofs_und12[] = { 2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12 };
> -	int ofs_und15[] = { 10, 8, 6, 4, 2, 0, -2, -4, -6, -8, -10, -10, -12, -12, -12 };
> +	static const int ofs_und6[] = {
> +		0, -2, -2, -4, -6, -6, -8, -8, -8, -10, -10, -12, -12, -12, -12
> +	};
> +	static const int ofs_und8[] = {
> +		2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12
> +	};
> +	static const int ofs_und12[] = {
> +		2, 0, 0, -2, -4, -6, -8, -8, -8, -10, -10, -10, -12, -12, -12
> +	};

Hmm, I wonder why the same values are duplicated in ofs_und8 and
ofs_und12. Cc: Vandita, Manasi.

Regardless, the patch is sane.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

> +	static const int ofs_und15[] = {
> +		10, 8, 6, 4, 2, 0, -2, -4, -6, -8, -10, -10, -12, -12, -12
> +	};
>  	int qp_bpc_modifier = (bpc - 8) * 2;
>  	u32 res, buf_i, bpp_i;

-- 
Jani Nikula, Intel Open Source Graphics Center
