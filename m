Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2AEA18F711
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:39:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02BE889954;
	Mon, 23 Mar 2020 14:39:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD4B89954;
 Mon, 23 Mar 2020 14:39:29 +0000 (UTC)
IronPort-SDR: qoeU6zcQOHXzPNo4dmHGVZyTPjdLStPabTHOxOzfzCQunUAFQOnxgcPi9JqP0nZq7w+33J5+B+
 Oa2XwRCOlLDg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2020 07:39:28 -0700
IronPort-SDR: w8IOn90TKhQVbC1pNNXJF4osf7cQzL6XzwkJUa+2rTmDAs5367aYQdqDo1ykY91BB03KLKht/u
 +fxW51tebt2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,296,1580803200"; d="scan'208";a="281172748"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 23 Mar 2020 07:39:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 23 Mar 2020 16:39:24 +0200
Date: Mon, 23 Mar 2020 16:39:24 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
Subject: Re: [PATCH v2 3/5] drm/i915: Introduce scaling filter related
 registers and bit fields.
Message-ID: <20200323143924.GT13686@intel.com>
References: <20200319102103.28895-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200319102103.28895-4-pankaj.laxminarayan.bharadiya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200319102103.28895-4-pankaj.laxminarayan.bharadiya@intel.com>
X-Patchwork-Hint: comment
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: sameer.lattannavar@intel.com, daniels@collabora.com,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 19, 2020 at 03:51:01PM +0530, Pankaj Bharadiya wrote:
> Introduce scaler registers and bit fields needed to configure the
> scaling filter in prgrammed mode and configure scaling filter
> coefficients.
> =

> changes since v1:
> * None
> changes since RFC:
> * Parametrize scaler coeffient macros by 'set' (Ville)
> =

> Signed-off-by: Shashank Sharma <shashank.sharma@intel.com>
> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> ---
>  drivers/gpu/drm/i915/i915_reg.h | 48 +++++++++++++++++++++++++++++++++
>  1 file changed, 48 insertions(+)
> =

> diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_=
reg.h
> index 9c53fe918be6..d40f12d2a6b5 100644
> --- a/drivers/gpu/drm/i915/i915_reg.h
> +++ b/drivers/gpu/drm/i915/i915_reg.h
> @@ -7205,6 +7205,7 @@ enum {
>  #define PS_PLANE_SEL(plane) (((plane) + 1) << 25)
>  #define PS_FILTER_MASK         (3 << 23)
>  #define PS_FILTER_MEDIUM       (0 << 23)
> +#define PS_FILTER_PROGRAMMED   (1 << 23)
>  #define PS_FILTER_EDGE_ENHANCE (2 << 23)
>  #define PS_FILTER_BILINEAR     (3 << 23)
>  #define PS_VERT3TAP            (1 << 21)
> @@ -7219,6 +7220,10 @@ enum {
>  #define PS_VADAPT_MODE_MOST_ADAPT  (3 << 5)
>  #define PS_PLANE_Y_SEL_MASK  (7 << 5)
>  #define PS_PLANE_Y_SEL(plane) (((plane) + 1) << 5)
> +#define PS_Y_VERT_FILTER_SELECT(set)   ((set) << 4)
> +#define PS_Y_HORZ_FILTER_SELECT(set)   ((set) << 3)
> +#define PS_UV_VERT_FILTER_SELECT(set)  ((set) << 2)
> +#define PS_UV_HORZ_FILTER_SELECT(set)  ((set) << 1)
>  =

>  #define _PS_PWR_GATE_1A     0x68160
>  #define _PS_PWR_GATE_2A     0x68260
> @@ -7281,6 +7286,25 @@ enum {
>  #define _PS_ECC_STAT_2B     0x68AD0
>  #define _PS_ECC_STAT_1C     0x691D0
>  =

> +#define _PS_COEF_SET0_INDEX_1A	   0x68198
> +#define _PS_COEF_SET0_INDEX_2A	   0x68298
> +#define _PS_COEF_SET0_INDEX_1B	   0x68998
> +#define _PS_COEF_SET0_INDEX_2B	   0x68A98
> +#define _PS_COEF_SET1_INDEX_1A	   0x681A0
> +#define _PS_COEF_SET1_INDEX_2A	   0x682A0
> +#define _PS_COEF_SET1_INDEX_1B	   0x689A0
> +#define _PS_COEF_SET1_INDEX_2B	   0x68AA0
> +#define PS_COEE_INDEX_AUTO_INC	   (1 << 10)
> +
> +#define _PS_COEF_SET0_DATA_1A	   0x6819C
> +#define _PS_COEF_SET0_DATA_2A	   0x6829C
> +#define _PS_COEF_SET0_DATA_1B	   0x6899C
> +#define _PS_COEF_SET0_DATA_2B	   0x68A9C
> +#define _PS_COEF_SET1_DATA_1A	   0x681A4
> +#define _PS_COEF_SET1_DATA_2A	   0x682A4
> +#define _PS_COEF_SET1_DATA_1B	   0x689A4
> +#define _PS_COEF_SET1_DATA_2B	   0x68AA4
> +
>  #define _ID(id, a, b) _PICK_EVEN(id, a, b)
>  #define SKL_PS_CTRL(pipe, id) _MMIO_PIPE(pipe,        \
>  			_ID(id, _PS_1A_CTRL, _PS_2A_CTRL),       \
> @@ -7310,6 +7334,30 @@ enum {
>  			_ID(id, _PS_ECC_STAT_1A, _PS_ECC_STAT_2A),   \
>  			_ID(id, _PS_ECC_STAT_1B, _PS_ECC_STAT_2B))
>  =

> +#define _SKL_PS_COEF_INDEX_SET0(pipe, id)  _ID(pipe,    \
> +			_ID(id, _PS_COEF_SET0_INDEX_1A, _PS_COEF_SET0_INDEX_2A), \
> +			_ID(id, _PS_COEF_SET0_INDEX_1B, _PS_COEF_SET0_INDEX_2B))
> +
> +#define _SKL_PS_COEF_INDEX_SET1(pipe, id)  _ID(pipe,    \
> +			_ID(id, _PS_COEF_SET1_INDEX_1A, _PS_COEF_SET1_INDEX_2A), \
> +			_ID(id, _PS_COEF_SET1_INDEX_1B, _PS_COEF_SET1_INDEX_2B))
> +
> +#define _SKL_PS_COEF_DATA_SET0(pipe, id)  _ID(pipe,     \
> +			_ID(id, _PS_COEF_SET0_DATA_1A, _PS_COEF_SET0_DATA_2A), \
> +			_ID(id, _PS_COEF_SET0_DATA_1B, _PS_COEF_SET0_DATA_2B))
> +
> +#define _SKL_PS_COEF_DATA_SET1(pipe, id)  _ID(pipe,     \
> +			_ID(id, _PS_COEF_SET1_DATA_1A, _PS_COEF_SET1_DATA_2A), \
> +			_ID(id, _PS_COEF_SET1_DATA_1B, _PS_COEF_SET1_DATA_2B))
> +
> +#define SKL_PS_COEF_INDEX_SET(pipe, id, set) \
> +			_MMIO_PIPE(set, _SKL_PS_COEF_INDEX_SET0(pipe, id), \
> +			    _SKL_PS_COEF_INDEX_SET1(pipe, id))
> +
> +#define SKL_PS_COEF_DATA_SET(pipe, id, set) \
> +			_MMIO_PIPE(set, _SKL_PS_COEF_DATA_SET0(pipe, id), \
> +			    _SKL_PS_COEF_DATA_SET1(pipe, id))

I'd name those CNL_PS_COEF_{DATA,INDEX}(). Or maybe eeven GLK_ since it
already has this despite not being officially supported.

Also I'd probably just have used +(set)*8 instead of adding another trip
through _PICK_EVEN(). It's getting a bit hard to read this.

> +
>  /* legacy palette */
>  #define _LGC_PALETTE_A           0x4a000
>  #define _LGC_PALETTE_B           0x4a800
> -- =

> 2.23.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
