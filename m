Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A745EAECA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 19:57:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3F910E736;
	Mon, 26 Sep 2022 17:57:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969BB10E736;
 Mon, 26 Sep 2022 17:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 456FEFB03;
 Mon, 26 Sep 2022 19:57:13 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pMmDfPNJ_4Pi; Mon, 26 Sep 2022 19:57:12 +0200 (CEST)
Date: Mon, 26 Sep 2022 19:57:10 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH] drm/fourcc: add Vivante tile status modifiers
Message-ID: <YzHn9l0P7gA4m0uM@qwark.sigxcpu.org>
References: <20220909093000.3458413-1-l.stach@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220909093000.3458413-1-l.stach@pengutronix.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, etnaviv@lists.freedesktop.org,
 patchwork-lst@pengutronix.de, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Fri, Sep 09, 2022 at 11:30:00AM +0200, Lucas Stach wrote:
> The tile status modifiers can be combined with all of the usual
> color buffer modifiers. When they are present an additional plane
> is added to the surfaces to share the tile status buffer. The
> TS modifiers describe the interpretation of the tag bits in this
> buffer.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  include/uapi/drm/drm_fourcc.h | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 0980678d502d..93b022498900 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -718,6 +718,35 @@ extern "C" {
>   */
>  #define DRM_FORMAT_MOD_VIVANTE_SPLIT_SUPER_TILED fourcc_mod_code(VIVANTE, 4)
>  
> +/*
> + * Vivante TS (tile-status) buffer modifiers. They can be combined with all of
> + * the color buffer tiling modifiers defined above. When TS is present it's a
> + * separate buffer containing the clear/compression status of each tile. The
> + * modifiers are defined as VIVANTE_MOD_TS_c_s, where c is the color buffer
> + * tile size in bytes covered by one entry in the status buffer and s is the
> + * number of status bits per entry.
> + * We reserve the top 8 bits of the Vivante modifier space for tile status
> + * clear/compression modifiers, as future cores might add some more TS layout
> + * variations.
> + */
> +#define VIVANTE_MOD_TS_64_4               (1ULL << 48)
> +#define VIVANTE_MOD_TS_64_2               (2ULL << 48)
> +#define VIVANTE_MOD_TS_128_4              (3ULL << 48)
> +#define VIVANTE_MOD_TS_256_4              (4ULL << 48)
> +#define VIVANTE_MOD_TS_MASK               (0xfULL << 48)
> +
> +/*
> + * Vivante compression modifiers. Those depend on a TS modifier being present
> + * as the TS bits get reinterpreted as compression tags instead of simple
> + * clear markers when compression is enabled.
> + */
> +#define VIVANTE_MOD_COMP_DEC400           (1ULL << 52)
> +#define VIVANTE_MOD_COMP_MASK             (0xfULL << 52)
> +
> +/* Masking out the extension bits will yield the base modifier. */
> +#define VIVANTE_MOD_EXT_MASK              (VIVANTE_MOD_TS_MASK | \
> +                                           VIVANTE_MOD_COMP_MASK)
> +
>  /* NVIDIA frame buffer modifiers */
>  
>  /*


Reviewed-by: Guido Günther <agx@sigxcpu.org>

Cheers,
 -- Guido
