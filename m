Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B66AE6F6023
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 22:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C776B10E2EF;
	Wed,  3 May 2023 20:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3752A10E2EF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 20:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683146247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ejBjiwg9Kdo3OOL75f3icHdtYQn0MR8jOeEcVkge5gY=;
 b=Qlxazdp0QVseSd5tiQpRqaAGPBEz9qnoqkJB/+2Jc00r96gKtusChz3CMmjlcyLgAvMFzN
 BIDaxwEsBx/zAqoNSqjdvqB53sTpe8LRn+dQ+kizay9896Vxy5HC06j5/DBMOTmKe3JMGs
 +HOzT6lIOtc0EnDDgqAdd1bDo4+ye1k=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-gW7ibr6kMYar_BzLtsAuGA-1; Wed, 03 May 2023 16:37:26 -0400
X-MC-Unique: gW7ibr6kMYar_BzLtsAuGA-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-61b5dc2d9bdso21036406d6.2
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 13:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683146245; x=1685738245;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jxZmEvSZLIclMjAyiJjtXAUboU5I2x1ZKnLr6hWf8t0=;
 b=jJlxJ4tT8tFLt++cjhKdQ5eehQgNfCA7Hkf9rTLtY46GgTpG4tx3lpIJYH+088/CiM
 wnibxBJFN+GoK1iekUpZZrmwpqCE6wCighk2HEtPYgjUFrLsebeJytFTMMOcc9tGg3OE
 7i9NSkEn2975PUYSKCO7LrnMAB3K/mgO+WsUpQnN0viFcVmWJREEtdlH7dHezMJQQuMA
 ZEenWtw2Yc/wPUSkP3sfPU8pR1TT1BVY42MlwjunqApZ6Fep0jHxZQxTttGb1V/2VwCv
 mpYd29C0olle286CU27djDdwX0/7HqD7ETEe4m8hcUiSYUMGZQ+yiUnl2hYWJZ21SGFn
 BOiQ==
X-Gm-Message-State: AC+VfDx2Pz40kB/TpWh/2fqmcdSZTCS1NspwvMumDMDVH5TJZNl3cTi3
 MOVVF1IWLHNl9s1nfqZwfi3c8i74tpz84oks11YWouK/tPpEovOQFDfU+9vtPJ6D4EgItGszakH
 6X7G4qHFFEGtBVALYYhwCZU/owr2F6jD6uP7s
X-Received: by 2002:ad4:5c82:0:b0:5a9:c758:ba0e with SMTP id
 o2-20020ad45c82000000b005a9c758ba0emr14540555qvh.16.1683146245329; 
 Wed, 03 May 2023 13:37:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5FkLXtDlKK5ZFqmVZuzMls6ee2W+aFWLHgO+ofkmr1cDxTbpsoEQ2ttAKhp5ub41b9ZCbbYQ==
X-Received: by 2002:ad4:5c82:0:b0:5a9:c758:ba0e with SMTP id
 o2-20020ad45c82000000b005a9c758ba0emr14540529qvh.16.1683146245071; 
 Wed, 03 May 2023 13:37:25 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 w10-20020a0cb54a000000b005ef81cc63ccsm10855948qvd.117.2023.05.03.13.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 May 2023 13:37:24 -0700 (PDT)
Message-ID: <b2256be0b12ed8c2791eb8f859d3b88f17489239.camel@redhat.com>
Subject: Re: [PATCH 01/11] drm/dp_mst: Fix fractional DSC bpp handling
From: Lyude Paul <lyude@redhat.com>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, 
 dri-devel@lists.freedesktop.org
Date: Wed, 03 May 2023 16:37:23 -0400
In-Reply-To: <20230502143906.2401-2-ville.syrjala@linux.intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
 <20230502143906.2401-2-ville.syrjala@linux.intel.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
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
Cc: intel-gfx@lists.freedesktop.org, Manasi Navare <manasi.d.navare@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, David Francis <David.Francis@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks!

On Tue, 2023-05-02 at 17:38 +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> The current code does '(bpp << 4) / 16' in the MST PBN
> calculation, but that is just the same as 'bpp' so the
> DSC codepath achieves absolutely nothing. Fix it up so that
> the fractional part of the bpp value is actually used instead
> of truncated away. 64*1006 has enough zero lsbs that we can
> just shift that down in the dividend and thus still manage
> to stick to a 32bit divisor.
>=20
> And while touching this, let's just make the whole thing more
> straightforward by making the passed in bpp value .4 binary
> fixed point always, instead of having to pass in different
> things based on whether DSC is enabled or not.
>=20
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: David Francis <David.Francis@amd.com>
> Cc: Mikita Lipski <mikita.lipski@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Fixes: dc48529fb14e ("drm/dp_mst: Add PBN calculation for DSC modes")
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
>  .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  2 +-
>  drivers/gpu/drm/display/drm_dp_mst_topology.c | 20 +++++--------------
>  drivers/gpu/drm/i915/display/intel_dp_mst.c   |  5 ++---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c       |  3 +--
>  .../gpu/drm/tests/drm_dp_mst_helper_test.c    |  2 +-
>  include/drm/display/drm_dp_mst_helper.h       |  2 +-
>  7 files changed, 12 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 6cacb76f389e..7d58f08a5444 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -6763,7 +6763,7 @@ static int dm_encoder_helper_atomic_check(struct dr=
m_encoder *encoder,
>  =09=09=09=09=09=09=09=09    max_bpc);
>  =09=09bpp =3D convert_dc_color_depth_into_bpc(color_depth) * 3;
>  =09=09clock =3D adjusted_mode->clock;
> -=09=09dm_new_connector_state->pbn =3D drm_dp_calc_pbn_mode(clock, bpp, f=
alse);
> +=09=09dm_new_connector_state->pbn =3D drm_dp_calc_pbn_mode(clock, bpp <<=
 4);
>  =09}
> =20
>  =09dm_new_connector_state->vcpi_slots =3D
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c =
b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 994ba426ca66..eb4b666e50e8 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -1515,7 +1515,7 @@ enum dc_status dm_dp_mst_is_port_support_mode(
>  =09} else {
>  =09=09/* check if mode could be supported within full_pbn */
>  =09=09bpp =3D convert_dc_color_depth_into_bpc(stream->timing.display_col=
or_depth) * 3;
> -=09=09pbn =3D drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, bp=
p, false);
> +=09=09pbn =3D drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, bp=
p << 4);
> =20
>  =09=09if (pbn > aconnector->mst_output_port->full_pbn)
>  =09=09=09return DC_FAIL_BANDWIDTH_VALIDATE;
> diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/=
drm/display/drm_dp_mst_topology.c
> index 38dab76ae69e..cd4c4f22c903 100644
> --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> @@ -4619,13 +4619,12 @@ EXPORT_SYMBOL(drm_dp_check_act_status);
> =20
>  /**
>   * drm_dp_calc_pbn_mode() - Calculate the PBN for a mode.
> - * @clock: dot clock for the mode
> - * @bpp: bpp for the mode.
> - * @dsc: DSC mode. If true, bpp has units of 1/16 of a bit per pixel
> + * @clock: dot clock
> + * @bpp: bpp as .4 binary fixed point
>   *
>   * This uses the formula in the spec to calculate the PBN value for a mo=
de.
>   */
> -int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc)
> +int drm_dp_calc_pbn_mode(int clock, int bpp)
>  {
>  =09/*
>  =09 * margin 5300ppm + 300ppm ~ 0.6% as per spec, factor is 1.006
> @@ -4636,18 +4635,9 @@ int drm_dp_calc_pbn_mode(int clock, int bpp, bool =
dsc)
>  =09 * peak_kbps *=3D (1006/1000)
>  =09 * peak_kbps *=3D (64/54)
>  =09 * peak_kbps *=3D 8    convert to bytes
> -=09 *
> -=09 * If the bpp is in units of 1/16, further divide by 16. Put this
> -=09 * factor in the numerator rather than the denominator to avoid
> -=09 * integer overflow
>  =09 */
> -
> -=09if (dsc)
> -=09=09return DIV_ROUND_UP_ULL(mul_u32_u32(clock * (bpp / 16), 64 * 1006)=
,
> -=09=09=09=09=098 * 54 * 1000 * 1000);
> -
> -=09return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006),
> -=09=09=09=098 * 54 * 1000 * 1000);
> +=09return DIV_ROUND_UP_ULL(mul_u32_u32(clock * bpp, 64 * 1006 >> 4),
> +=09=09=09=091000 * 8 * 54 * 1000);
>  }
>  EXPORT_SYMBOL(drm_dp_calc_pbn_mode);
> =20
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/dr=
m/i915/display/intel_dp_mst.c
> index 2c49d9ab86a2..44c15d6faac4 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -109,8 +109,7 @@ static int intel_dp_mst_find_vcpi_slots_for_bpp(struc=
t intel_encoder *encoder,
>  =09=09=09continue;
> =20
>  =09=09crtc_state->pbn =3D drm_dp_calc_pbn_mode(adjusted_mode->crtc_clock=
,
> -=09=09=09=09=09=09       dsc ? bpp << 4 : bpp,
> -=09=09=09=09=09=09       dsc);
> +=09=09=09=09=09=09       bpp << 4);
> =20
>  =09=09slots =3D drm_dp_atomic_find_time_slots(state, &intel_dp->mst_mgr,
>  =09=09=09=09=09=09      connector->port,
> @@ -936,7 +935,7 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector *con=
nector,
>  =09=09return ret;
> =20
>  =09if (mode_rate > max_rate || mode->clock > max_dotclk ||
> -=09    drm_dp_calc_pbn_mode(mode->clock, min_bpp, false) > port->full_pb=
n) {
> +=09    drm_dp_calc_pbn_mode(mode->clock, min_bpp << 4) > port->full_pbn)=
 {
>  =09=09*status =3D MODE_CLOCK_HIGH;
>  =09=09return 0;
>  =09}
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index 5bb777ff1313..d896cbb8cf3d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -961,8 +961,7 @@ nv50_msto_atomic_check(struct drm_encoder *encoder,
>  =09=09const int clock =3D crtc_state->adjusted_mode.clock;
> =20
>  =09=09asyh->or.bpc =3D connector->display_info.bpc;
> -=09=09asyh->dp.pbn =3D drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3,
> -=09=09=09=09=09=09    false);
> +=09=09asyh->dp.pbn =3D drm_dp_calc_pbn_mode(clock, asyh->or.bpc * 3 << 4=
);
>  =09}
> =20
>  =09mst_state =3D drm_atomic_get_mst_topology_state(state, &mstm->mgr);
> diff --git a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c b/drivers/gpu=
/drm/tests/drm_dp_mst_helper_test.c
> index 545beea33e8c..39fc449148e1 100644
> --- a/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> +++ b/drivers/gpu/drm/tests/drm_dp_mst_helper_test.c
> @@ -56,7 +56,7 @@ static void drm_test_dp_mst_calc_pbn_mode(struct kunit =
*test)
>  {
>  =09const struct drm_dp_mst_calc_pbn_mode_test *params =3D test->param_va=
lue;
> =20
> -=09KUNIT_EXPECT_EQ(test, drm_dp_calc_pbn_mode(params->clock, params->bpp=
, params->dsc),
> +=09KUNIT_EXPECT_EQ(test, drm_dp_calc_pbn_mode(params->clock, params->bpp=
 << 4),
>  =09=09=09params->expected);
>  }
> =20
> diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/displa=
y/drm_dp_mst_helper.h
> index 32c764fb9cb5..c254500b4507 100644
> --- a/include/drm/display/drm_dp_mst_helper.h
> +++ b/include/drm/display/drm_dp_mst_helper.h
> @@ -829,7 +829,7 @@ struct edid *drm_dp_mst_get_edid(struct drm_connector=
 *connector, struct drm_dp_
>  int drm_dp_get_vc_payload_bw(const struct drm_dp_mst_topology_mgr *mgr,
>  =09=09=09     int link_rate, int link_lane_count);
> =20
> -int drm_dp_calc_pbn_mode(int clock, int bpp, bool dsc);
> +int drm_dp_calc_pbn_mode(int clock, int bpp);
> =20
>  void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state=
, uint8_t link_encoding_cap);
> =20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

