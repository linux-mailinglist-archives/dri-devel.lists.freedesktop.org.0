Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6463B7E4BFC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Nov 2023 23:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC9F10E153;
	Tue,  7 Nov 2023 22:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA21010E15A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Nov 2023 22:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699397128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6iKh9csB9alchwNpZOODVIQFvUx0Qrq82u3XPPQK6oc=;
 b=KIvBAU8tSQSCwqg0YiysyH5WcLU0q1NqZeRufdQ7en5y8BVY0kc5EOZ2Qftr7MpsvOofJN
 InFgWnFqZQMhBSqQYkKMeks34zLWEmprv/Ghcjql5IlGZRdIb29gZjhRx9KPfZdbqbeUnP
 Bi5MBwP0IdqvAWiYAsJFcn6C7fFevh0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-LOwzIAgAPgO7HUkUoVpayQ-1; Tue, 07 Nov 2023 17:45:26 -0500
X-MC-Unique: LOwzIAgAPgO7HUkUoVpayQ-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7788fa5f1b0so723701485a.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Nov 2023 14:45:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699397126; x=1700001926;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BkG3U5juIJKNauzZgFT2hs63Pyxgqumx0bBfuuTOQq0=;
 b=qSrWQZlPwdsNeQtRxydZoSITypcEx/UHlt4HAgwLPbf1QB0xB6HZ5IsQcJ3JpcYi+k
 xO4jT33IOpMgqA7uEKiOCx+7AJtDpfHT5Ni0amfOfjRMdvP9A2tyY25eKslVG5lap/NX
 TsHY/N0hlNJPEfiV2i1nvud57XTy11e2U1BEMWlpckjpaKRST1ZTHmJsP40v1CgB9ZUJ
 xKW8diBlMYqqNmRW1XAKUwxVBO8RtCPbAHunzS+5WU1b6Pvzeh7x4M8nMMvHl4ZIhCFc
 nw/0W+IvscWXSISOEG5Fkrc2w7+gV9P8/jjVM0ug0963bgbOlJfX/tj8Xb9MrjDxTbhh
 u4SQ==
X-Gm-Message-State: AOJu0YwVA5hjSk0Bn68RNMPF1YLxxV5/J6hyRoNoiGOpApm9jbn7OQ2g
 ATXAQgkLuHuKpI8Smdxir8ir4ti7Wq0HvQKqYZ89ExnYZ98FjwX4h93S5g/0LiKbmW8YRyddF85
 Hf/oXHE0cMU4QAycIGtdcwXBCV1gN
X-Received: by 2002:a05:620a:2ae2:b0:77a:1476:fb6d with SMTP id
 bn34-20020a05620a2ae200b0077a1476fb6dmr33779431qkb.41.1699397126283; 
 Tue, 07 Nov 2023 14:45:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+nggIsfxTxG2AlIA6wdCoiNkHNEoidVexg9BlhA+X4ykwMzaXdrdtLNGQEGjVrRXMt/aZHw==
X-Received: by 2002:a05:620a:2ae2:b0:77a:1476:fb6d with SMTP id
 bn34-20020a05620a2ae200b0077a1476fb6dmr33779409qkb.41.1699397125974; 
 Tue, 07 Nov 2023 14:45:25 -0800 (PST)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 l18-20020a37f512000000b00774830b40d4sm370851qkk.47.2023.11.07.14.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 14:45:25 -0800 (PST)
Message-ID: <f0f4f8c69d2a794f71cc75092db7eaa5e2465fb8.camel@redhat.com>
Subject: Re: [PATCH v5 09/30] drm/dp: Add helpers to calculate the link BW
 overhead
From: Lyude Paul <lyude@redhat.com>
To: Imre Deak <imre.deak@intel.com>, intel-gfx@lists.freedesktop.org
Date: Tue, 07 Nov 2023 17:45:24 -0500
In-Reply-To: <20231107001505.3370108-1-imre.deak@intel.com>
References: <20231030155843.2251023-10-imre.deak@intel.com>
 <20231107001505.3370108-1-imre.deak@intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 Maxime Ripard <mripard@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2023-11-07 at 02:14 +0200, Imre Deak wrote:
> Add helpers drivers can use to calculate the BW allocation overhead -
> due to SSC, FEC, DSC and data alignment on symbol cycles - and the
> channel coding efficiency - due to the 8b/10b, 128b/132b encoding. On
> 128b/132b links the FEC overhead is part of the coding efficiency, so
> not accounted for in the BW allocation overhead.
>=20
> The drivers can use these functions to calculate a ratio, controlling
> the stream symbol insertion rate of the source device in each SST TU
> or MST MTP frame. Drivers can calculate this
>=20
> m/n =3D (pixel_data_rate * drm_dp_bw_overhead()) /
>       (link_data_rate * drm_dp_bw_channel_coding_efficiency())
>=20
> ratio for a given link and pixel stream and with that the
>=20
> slots_per_mtp =3D CEIL(64 * m / n)
>=20
> allocated slots per MTP for the stream in a link frame and with
> that the
>=20
> pbn =3D slots_per_mtp * drm_mst_get_pbn_divider()
>=20
> allocated PBNs for the stream on the MST link path.
>=20
> Take drm_dp_bw_overhead() into use in drm_dp_calc_pbn_mode(), for
> drivers calculating the PBN value directly.
>=20
> v2:
> - Add dockbook description to drm_dp_bw_channel_coding_efficiency().
>   (LKP).
> - Clarify the way m/n ratio is calculated in the commit log.
> v3:
> - Fix compile breakage for !CONFIG_BACKLIGHT_CLASS_DEVICE. (LKP)
> - Account for FEC_PM overhead (+ 0.0015625 %), add comment
>   with the formula to calculate the total FEC overhead. (Ville)
> v4:
> - Rename DRM_DP_OVERHEAD_SSC to DRM_DP_OVERHEAD_SSC_REF_CLK. (Ville)
> v5:
> - Clarify in the commit log what MTP means.
> - Simplify the commit log's formula to calculate PBN.
>=20
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> Cc: kernel test robot <lkp@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> Reviewed-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com> (v2)
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>  drivers/gpu/drm/display/drm_dp_helper.c       | 132 ++++++++++++++++++
>  drivers/gpu/drm/display/drm_dp_mst_topology.c |  23 ++-
>  include/drm/display/drm_dp_helper.h           |  11 ++
>  3 files changed, 160 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/di=
splay/drm_dp_helper.c
> index e5d7970a9ddd0..72ba9ae89f862 100644
> --- a/drivers/gpu/drm/display/drm_dp_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_helper.c
> @@ -3900,3 +3900,135 @@ int drm_panel_dp_aux_backlight(struct drm_panel *=
panel, struct drm_dp_aux *aux)
>  EXPORT_SYMBOL(drm_panel_dp_aux_backlight);
> =20
>  #endif
> +
> +/* See DP Standard v2.1 2.6.4.4.1.1, 2.8.4.4, 2.8.7 */
> +static int drm_dp_link_symbol_cycles(int lane_count, int pixels, int bpp=
_x16,
> +=09=09=09=09     int symbol_size, bool is_mst)
> +{
> +=09int cycles =3D DIV_ROUND_UP(pixels * bpp_x16, 16 * symbol_size * lane=
_count);
> +=09int align =3D is_mst ? 4 / lane_count : 1;
> +
> +=09return ALIGN(cycles, align);
> +}
> +
> +static int drm_dp_link_dsc_symbol_cycles(int lane_count, int pixels, int=
 slice_count,
> +=09=09=09=09=09 int bpp_x16, int symbol_size, bool is_mst)
> +{
> +=09int slice_pixels =3D DIV_ROUND_UP(pixels, slice_count);
> +=09int slice_data_cycles =3D drm_dp_link_symbol_cycles(lane_count, slice=
_pixels,
> +=09=09=09=09=09=09=09  bpp_x16, symbol_size, is_mst);
> +=09int slice_eoc_cycles =3D is_mst ? 4 / lane_count : 1;
> +
> +=09return slice_count * (slice_data_cycles + slice_eoc_cycles);
> +}
> +
> +/**
> + * drm_dp_bw_overhead - Calculate the BW overhead of a DP link stream
> + * @lane_count: DP link lane count
> + * @hactive: pixel count of the active period in one scanline of the str=
eam
> + * @dsc_slice_count: DSC slice count if @flags/DRM_DP_LINK_BW_OVERHEAD_D=
SC is set
> + * @bpp_x16: bits per pixel in .4 binary fixed point
> + * @flags: DRM_DP_OVERHEAD_x flags
> + *
> + * Calculate the BW allocation overhead of a DP link stream, depending
> + * on the link's
> + * - @lane_count
> + * - SST/MST mode (@flags / %DRM_DP_OVERHEAD_MST)
> + * - symbol size (@flags / %DRM_DP_OVERHEAD_UHBR)
> + * - FEC mode (@flags / %DRM_DP_OVERHEAD_FEC)
> + * - SSC/REF_CLK mode (@flags / %DRM_DP_OVERHEAD_SSC_REF_CLK)
> + * as well as the stream's
> + * - @hactive timing
> + * - @bpp_x16 color depth
> + * - compression mode (@flags / %DRM_DP_OVERHEAD_DSC).
> + * Note that this overhead doesn't account for the 8b/10b, 128b/132b
> + * channel coding efficiency, for that see
> + * @drm_dp_link_bw_channel_coding_efficiency().
> + *
> + * Returns the overhead as 100% + overhead% in 1ppm units.
> + */
> +int drm_dp_bw_overhead(int lane_count, int hactive,
> +=09=09       int dsc_slice_count,
> +=09=09       int bpp_x16, unsigned long flags)
> +{
> +=09int symbol_size =3D flags & DRM_DP_BW_OVERHEAD_UHBR ? 32 : 8;
> +=09bool is_mst =3D flags & DRM_DP_BW_OVERHEAD_MST;
> +=09u32 overhead =3D 1000000;
> +=09int symbol_cycles;
> +
> +=09/*
> +=09 * DP Standard v2.1 2.6.4.1
> +=09 * SSC downspread and ref clock variation margin:
> +=09 *   5300ppm + 300ppm ~ 0.6%
> +=09 */
> +=09if (flags & DRM_DP_BW_OVERHEAD_SSC_REF_CLK)
> +=09=09overhead +=3D 6000;
> +
> +=09/*
> +=09 * DP Standard v2.1 2.6.4.1.1, 3.5.1.5.4:
> +=09 * FEC symbol insertions for 8b/10b channel coding:
> +=09 * After each 250 data symbols on 2-4 lanes:
> +=09 *   250 LL + 5 FEC_PARITY_PH + 1 CD_ADJ   (256 byte FEC block)
> +=09 * After each 2 x 250 data symbols on 1 lane:
> +=09 *   2 * 250 LL + 11 FEC_PARITY_PH + 1 CD_ADJ (512 byte FEC block)
> +=09 * After 256 (2-4 lanes) or 128 (1 lane) FEC blocks:
> +=09 *   256 * 256 bytes + 1 FEC_PM
> +=09 * or
> +=09 *   128 * 512 bytes + 1 FEC_PM
> +=09 * (256 * 6 + 1) / (256 * 250) =3D 2.4015625 %
> +=09 */
> +=09if (flags & DRM_DP_BW_OVERHEAD_FEC)
> +=09=09overhead +=3D 24016;
> +
> +=09/*
> +=09 * DP Standard v2.1 2.7.9, 5.9.7
> +=09 * The FEC overhead for UHBR is accounted for in its 96.71% channel
> +=09 * coding efficiency.
> +=09 */
> +=09WARN_ON((flags & DRM_DP_BW_OVERHEAD_UHBR) &&
> +=09=09(flags & DRM_DP_BW_OVERHEAD_FEC));
> +
> +=09if (flags & DRM_DP_BW_OVERHEAD_DSC)
> +=09=09symbol_cycles =3D drm_dp_link_dsc_symbol_cycles(lane_count, hactiv=
e,
> +=09=09=09=09=09=09=09      dsc_slice_count,
> +=09=09=09=09=09=09=09      bpp_x16, symbol_size,
> +=09=09=09=09=09=09=09      is_mst);
> +=09else
> +=09=09symbol_cycles =3D drm_dp_link_symbol_cycles(lane_count, hactive,
> +=09=09=09=09=09=09=09  bpp_x16, symbol_size,
> +=09=09=09=09=09=09=09  is_mst);
> +
> +=09return DIV_ROUND_UP_ULL(mul_u32_u32(symbol_cycles * symbol_size * lan=
e_count,
> +=09=09=09=09=09    overhead * 16),
> +=09=09=09=09hactive * bpp_x16);
> +}
> +EXPORT_SYMBOL(drm_dp_bw_overhead);
> +
> +/**
> + * drm_dp_bw_channel_coding_efficiency - Get a DP link's channel coding =
efficiency
> + * @is_uhbr: Whether the link has a 128b/132b channel coding
> + *
> + * Return the channel coding efficiency of the given DP link type, which=
 is
> + * either 8b/10b or 128b/132b (aka UHBR). The corresponding overhead inc=
ludes
> + * the 8b -> 10b, 128b -> 132b pixel data to link symbol conversion over=
head
> + * and for 128b/132b any link or PHY level control symbol insertion over=
head
> + * (LLCP, FEC, PHY sync, see DP Standard v2.1 3.5.2.18). For 8b/10b the
> + * corresponding FEC overhead is BW allocation specific, included in the=
 value
> + * returned by drm_dp_bw_overhead().
> + *
> + * Returns the efficiency in the 100%/coding-overhead% ratio in
> + * 1ppm units.
> + */
> +int drm_dp_bw_channel_coding_efficiency(bool is_uhbr)
> +{
> +=09if (is_uhbr)
> +=09=09return 967100;
> +=09else
> +=09=09/*
> +=09=09 * Note that on 8b/10b MST the efficiency is only
> +=09=09 * 78.75% due to the 1 out of 64 MTPH packet overhead,
> +=09=09 * not accounted for here.
> +=09=09 */
> +=09=09return 800000;
> +}
> +EXPORT_SYMBOL(drm_dp_bw_channel_coding_efficiency);
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index cc0a8fe84d290..4d72c9a32026e 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4726,17 +4726,28 @@ EXPORT_SYMBOL(drm_dp_check_act_status);
>  int drm_dp_calc_pbn_mode(int clock, int bpp)
>  {
>  =09/*
> -=09 * margin 5300ppm + 300ppm ~ 0.6% as per spec, factor is 1.006
>  =09 * The unit of 54/64Mbytes/sec is an arbitrary unit chosen based on
>  =09 * common multiplier to render an integer PBN for all link rate/lane
>  =09 * counts combinations
>  =09 * calculate
> -=09 * peak_kbps *=3D (1006/1000)
> -=09 * peak_kbps *=3D (64/54)
> -=09 * peak_kbps *=3D 8    convert to bytes
> +=09 * peak_kbps =3D clock * bpp / 16
> +=09 * peak_kbps *=3D SSC overhead / 1000000
> +=09 * peak_kbps /=3D 8    convert to Kbytes
> +=09 * peak_kBps *=3D (64/54) / 1000    convert to PBN
>  =09 */
> -=09return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006 >> 4),
> -=09=09=09=091000 * 8 * 54 * 1000);
> +=09/*
> +=09 * TODO: Use the actual link and mode parameters to calculate
> +=09 * the overhead. For now it's assumed that these are
> +=09 * 4 link lanes, 4096 hactive pixels, which don't add any
> +=09 * significant data padding overhead and that there is no DSC
> +=09 * or FEC overhead.
> +=09 */
> +=09int overhead =3D drm_dp_bw_overhead(4, 4096, 0, bpp,
> +=09=09=09=09=09  DRM_DP_BW_OVERHEAD_MST |
> +=09=09=09=09=09  DRM_DP_BW_OVERHEAD_SSC_REF_CLK);
> +
> +=09return DIV64_U64_ROUND_UP(mul_u32_u32(clock * bpp, 64 * overhead >> 4=
),
> +=09=09=09=09  1000000ULL * 8 * 54 * 1000);
>  }
>  EXPORT_SYMBOL(drm_dp_calc_pbn_mode);
> =20
> diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/dr=
m_dp_helper.h
> index da94932f4262b..caee29d28463c 100644
> --- a/include/drm/display/drm_dp_helper.h
> +++ b/include/drm/display/drm_dp_helper.h
> @@ -788,4 +788,15 @@ bool drm_dp_downstream_rgb_to_ycbcr_conversion(const=
 u8 dpcd[DP_RECEIVER_CAP_SIZ
>  =09=09=09=09=09       const u8 port_cap[4], u8 color_spc);
>  int drm_dp_pcon_convert_rgb_to_ycbcr(struct drm_dp_aux *aux, u8 color_sp=
c);
> =20
> +#define DRM_DP_BW_OVERHEAD_MST=09=09BIT(0)
> +#define DRM_DP_BW_OVERHEAD_UHBR=09=09BIT(1)
> +#define DRM_DP_BW_OVERHEAD_SSC_REF_CLK=09BIT(2)
> +#define DRM_DP_BW_OVERHEAD_FEC=09=09BIT(3)
> +#define DRM_DP_BW_OVERHEAD_DSC=09=09BIT(4)
> +
> +int drm_dp_bw_overhead(int lane_count, int hactive,
> +=09=09       int dsc_slice_count,
> +=09=09       int bpp_x16, unsigned long flags);
> +int drm_dp_bw_channel_coding_efficiency(bool is_uhbr);
> +
>  #endif /* _DRM_DP_HELPER_H_ */

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

