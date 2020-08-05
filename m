Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 696C123D35E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 23:05:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CD536E83B;
	Wed,  5 Aug 2020 21:04:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2065.outbound.protection.outlook.com [40.107.94.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD216E83A;
 Wed,  5 Aug 2020 21:04:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GtsvLfC5v6/xTSLwIsrfZJ72NE3oPfZ5ejFjU0aeRQ59IJPnWyBSZVMwP5IghjeimfU0huX0AJD6fysMJNED6r49HUiuOKDbvurb2loZfrKIIPere8eNmprk89WQI90WzMpGphT6CX3qYhT70i4XSLNWBIjd5Cb8Fe9lDgU4yX6a2C2A+YTR41sjHOOcg7naBYYWhmCFqGfscuZ1r643pKSwQdj4RZ7wSB0MgJvnjPSlOM2JlmuoLRACJZzcGQzlJ0vxSy+pg+LSU1/PxgB2n/51k7LqrJSbeupkxydwYiGqpKf+NGJusqkuZtFjWdkMYwK8dvWv6RWRKnKnlDs5Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vRBSG5OnYtTMHdN8nwtrqTBTNW1QQQ8rwR/1yj2RV4=;
 b=Km/VdIOUOLGm++SXFu6eozDKNtFqXNrfrsvpAMET1Qd1XM6jdBdoCDCvyS+maMUYf+/577mOqhkkR7VpBuyp4jqnSTNNpfBzKs3HksAcOTmJVxSvoXi1nqoVlZzMsk2wGI/P9Bd7eEchifMYsUjqLKOIPHTU9RJzdr/v5FMUY6bZpT0CXnN3zcOEvRT6prWqZppG4pp8FvM/o9QmhOOiRRtCWmIFd9UVumJwBdEP76PdPHVC5elcWlQXrdHTcUQT2ukFBHZ5MQqqwy/21t4TCy/VawTnxEQJj3VBnLLKr2OxqNLILEDLNzgDlTbTlzL0iOJzSHmqFM+bn2+g3OU7tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7vRBSG5OnYtTMHdN8nwtrqTBTNW1QQQ8rwR/1yj2RV4=;
 b=biqZraULVRWgcvGSpwEpDpOep10fgA7z9MNl7shT0Y1dg39EWrVj3Mrrj5Y212q1wL2Yhdreq5zPruXU7YgsB5uyZD2ylDvoM2tHPS+oK46+kVziMPtyeuzpWkG+bEHvTV0hTk+gW1hne6ny+NhNP75+U3loPH2yXZz8lMSoH8A=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM6PR12MB3577.namprd12.prod.outlook.com (2603:10b6:5:3a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Wed, 5 Aug
 2020 21:04:56 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::75f2:ebaa:bca6:3db7]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::75f2:ebaa:bca6:3db7%9]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 21:04:56 +0000
Date: Wed, 5 Aug 2020 17:04:52 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH 1/7] drm/amd/display: Store tiling_flags and tmz_surface
 on dm_plane_state
Message-ID: <20200805210452.tktnn5ct6znfjbnd@outlook.office365.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-2-nicholas.kazlauskas@amd.com>
In-Reply-To: <20200730203642.17553-2-nicholas.kazlauskas@amd.com>
X-ClientProxiedBy: YTXPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::45) To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60::80d1) by
 YTXPR0101CA0068.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Wed, 5 Aug 2020 21:04:55 +0000
X-Originating-IP: [2607:fea8:56e0:6d60::80d1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 87e055c3-25f4-4ca6-6b50-08d839833479
X-MS-TrafficTypeDiagnostic: DM6PR12MB3577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3577B7457C445C318D27EC47984B0@DM6PR12MB3577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1227;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJXPwnUcmd9tPI5GunR4hHtFiFv7ZeUw1Qisamgy4KVZirbXuR+YXbQSnIRiL+KIPpuDM8kPifHeItEijCEWex/cM8fThgBWiU7XLQoWxWsveKoJhZUs2TmBsuMmeFBcmqRP0csM27iWePk4jORkC+pwWC0sL7udXk16kaGDVTWemECfXx9UwKSFpd1AHY6ep2cGvrbTow0OVMV/+5I5GksRBmtWKh3cRiDQOYYJVXYIwFn5L/eAI2QQk+cX4cz7l4Endrk8uDuWNUFXRJ8kaLiaT3a6CfRGwK5+6an6DxfrrYvqKVfG4MiRHM5p6skqnzM2UUogZWdFICNXNrS/JhPFCCJrD4Pyt03X9Ivk29I4ohC9xAzjlyZ1Dy9KFN9iPUmFQ6hoimPbf/iI26cdJpGRswOZCMM+jC0V4GcHkPBBp1wzb97Au57DAFcLR/OgnuYfpBNpBeCZHHmBHnyBcA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(478600001)(9686003)(21480400003)(2906002)(6862004)(86362001)(5660300002)(6636002)(4326008)(8936002)(55016002)(1076003)(966005)(8676002)(450100002)(66476007)(16526019)(66946007)(66556008)(186003)(7696005)(6666004)(83380400001)(52116002)(6506007)(44144004)(316002)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 41x9pKMP43ZHfzCT5sbMGOUHHA3jDhqUzX90H50/kT6HF5ufFX3cyXqzxNwXd72Ri4i79HxopumDdtVNDfU4D/WccszPEX1fSw7hTTydM0Qec25p0zGpVZ5eDHxAHGJt3Uh1eGTjpVIWYP7IQlDBxXBxduZlSOFpP7r7qxlQPQ7NSBRO+/KOxTCdXdEXj3Rr8C98+yNZX9thijeODyjR/lfUS61mqlIzMYTxh8rpNm9vpg13pNIecVurHoLG0eb/PZCPGdMmfvebTNkiX1WmyWob9hzoSNHMOqi6xeeFhVnId0zwbyeJDdmeVH1L9Jn2axrX2H1XQIbiiOXo/yKoIwMd85fZ6jy3PyG3H5JABnonTEWi+x7GERiAum+vHlG0OaaIrJvQgmrGRprR8wQneW19oPkcEweTF0wW0TSi72MHNEPYheAQdCb0ERF1O6uXrWxvWCjV/AuhYjlBYPiWUM4Gn5a4qcwCFSOUvK/hTJw6LmWN1nndxycPXXLr8t6gDVzl/OpH1WhTqX2iGeC8z+K386tx3BW06O3mTPCAXVpMH8LRuDNWLra0+0714uZkXr+0m5Nvs/SJe+VsHmWPLP9mjP961Qeq50H5ubA2VYVjwc/K/KsvKIzzq+Fo3Nu39GfW0W2LUolTqpfyoh2z31a8GQoMY2t9hUT689Cj2WnPCJWA+UV6GCfVtC68VXby
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e055c3-25f4-4ca6-6b50-08d839833479
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 21:04:55.8688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9dydhMIOmc0TwkhpM5KkS3VCBRj+y6KItRdH/HeUX1UiVzkI0FKK8zW9RFvhEaQcKkw5/0d2l7cN35RKoXhOhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3577
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
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1628254709=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1628254709==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t6sdrdefj6jx6s7i"
Content-Disposition: inline

--t6sdrdefj6jx6s7i
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 07/30, Nicholas Kazlauskas wrote:
> [Why]
> Store these in advance so we can reuse them later in commit_tail without
> having to reserve the fbo again.
>=20
> These will also be used for checking for tiling changes when deciding
> to reset the plane or not.
>=20
> [How]
> This change should mostly be a refactor. Only commit check is affected
> for now and I'll drop the get_fb_info calls in prepare_planes and
> commit_tail after.
>=20
> This runs a prepass loop once we think that all planes have been added
> to the context and replaces the get_fb_info calls with accessing the
> dm_plane_state instead.
>=20
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 60 +++++++++++--------
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
>  2 files changed, 37 insertions(+), 25 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 8d64f5fde7e2..7cc5ab90ce13 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3700,8 +3700,17 @@ static int fill_dc_scaling_info(const struct drm_p=
lane_state *state,
>  static int get_fb_info(const struct amdgpu_framebuffer *amdgpu_fb,
>  		       uint64_t *tiling_flags, bool *tmz_surface)
>  {
> -	struct amdgpu_bo *rbo =3D gem_to_amdgpu_bo(amdgpu_fb->base.obj[0]);
> -	int r =3D amdgpu_bo_reserve(rbo, false);
> +	struct amdgpu_bo *rbo;
> +	int r;
> +
> +	if (!amdgpu_fb) {
> +		*tiling_flags =3D 0;
> +		*tmz_surface =3D false;
> +		return 0;
> +	}
> +
> +	rbo =3D gem_to_amdgpu_bo(amdgpu_fb->base.obj[0]);
> +	r =3D amdgpu_bo_reserve(rbo, false);
> =20
>  	if (unlikely(r)) {
>  		/* Don't show error message when returning -ERESTARTSYS */
> @@ -4124,13 +4133,10 @@ static int fill_dc_plane_attributes(struct amdgpu=
_device *adev,
>  				    struct drm_crtc_state *crtc_state)
>  {
>  	struct dm_crtc_state *dm_crtc_state =3D to_dm_crtc_state(crtc_state);
> -	const struct amdgpu_framebuffer *amdgpu_fb =3D
> -		to_amdgpu_framebuffer(plane_state->fb);
> +	struct dm_plane_state *dm_plane_state =3D to_dm_plane_state(plane_state=
);
>  	struct dc_scaling_info scaling_info;
>  	struct dc_plane_info plane_info;
> -	uint64_t tiling_flags;
>  	int ret;
> -	bool tmz_surface =3D false;
>  	bool force_disable_dcc =3D false;
> =20
>  	ret =3D fill_dc_scaling_info(plane_state, &scaling_info);
> @@ -4142,15 +4148,12 @@ static int fill_dc_plane_attributes(struct amdgpu=
_device *adev,
>  	dc_plane_state->clip_rect =3D scaling_info.clip_rect;
>  	dc_plane_state->scaling_quality =3D scaling_info.scaling_quality;
> =20
> -	ret =3D get_fb_info(amdgpu_fb, &tiling_flags, &tmz_surface);
> -	if (ret)
> -		return ret;
> -
>  	force_disable_dcc =3D adev->asic_type =3D=3D CHIP_RAVEN && adev->in_sus=
pend;
> -	ret =3D fill_dc_plane_info_and_addr(adev, plane_state, tiling_flags,
> +	ret =3D fill_dc_plane_info_and_addr(adev, plane_state,
> +					  dm_plane_state->tiling_flags,
>  					  &plane_info,
>  					  &dc_plane_state->address,
> -					  tmz_surface,
> +					  dm_plane_state->tmz_surface,
>  					  force_disable_dcc);
>  	if (ret)
>  		return ret;
> @@ -5753,6 +5756,10 @@ dm_drm_plane_duplicate_state(struct drm_plane *pla=
ne)
>  		dc_plane_state_retain(dm_plane_state->dc_state);
>  	}
> =20
> +	/* Framebuffer hasn't been updated yet, so retain old flags. */
> +	dm_plane_state->tiling_flags =3D old_dm_plane_state->tiling_flags;
> +	dm_plane_state->tmz_surface =3D old_dm_plane_state->tmz_surface;
> +
>  	return &dm_plane_state->base;
>  }
> =20
> @@ -8557,13 +8564,9 @@ dm_determine_update_type_for_commit(struct amdgpu_=
display_manager *dm,
>  			continue;
> =20
>  		for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plan=
e_state, j) {
> -			const struct amdgpu_framebuffer *amdgpu_fb =3D
> -				to_amdgpu_framebuffer(new_plane_state->fb);
>  			struct dc_plane_info *plane_info =3D &bundle->plane_infos[num_plane];
>  			struct dc_flip_addrs *flip_addr =3D &bundle->flip_addrs[num_plane];
>  			struct dc_scaling_info *scaling_info =3D &bundle->scaling_infos[num_p=
lane];
> -			uint64_t tiling_flags;
> -			bool tmz_surface =3D false;
> =20
>  			new_plane_crtc =3D new_plane_state->crtc;
>  			new_dm_plane_state =3D to_dm_plane_state(new_plane_state);
> @@ -8610,16 +8613,12 @@ dm_determine_update_type_for_commit(struct amdgpu=
_display_manager *dm,
> =20
>  			bundle->surface_updates[num_plane].scaling_info =3D scaling_info;
> =20
> -			if (amdgpu_fb) {
> -				ret =3D get_fb_info(amdgpu_fb, &tiling_flags, &tmz_surface);
> -				if (ret)
> -					goto cleanup;
> -
> +			if (new_plane_state->fb) {
>  				ret =3D fill_dc_plane_info_and_addr(
> -					dm->adev, new_plane_state, tiling_flags,
> -					plane_info,
> -					&flip_addr->address, tmz_surface,
> -					false);
> +					dm->adev, new_plane_state,
> +					new_dm_plane_state->tiling_flags,
> +					plane_info, &flip_addr->address,
> +					new_dm_plane_state->tmz_surface, false);
>  				if (ret)
>  					goto cleanup;
> =20
> @@ -8833,6 +8832,17 @@ static int amdgpu_dm_atomic_check(struct drm_devic=
e *dev,
>  		}
>  	}
> =20
> +	/* Prepass for updating tiling flags on new planes. */
> +	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
> +		struct dm_plane_state *new_dm_plane_state =3D to_dm_plane_state(new_pl=
ane_state);
> +		struct amdgpu_framebuffer *new_afb =3D to_amdgpu_framebuffer(new_plane=
_state->fb);
> +
> +		ret =3D get_fb_info(new_afb, &new_dm_plane_state->tiling_flags,
> +				  &new_dm_plane_state->tmz_surface);
> +		if (ret)
> +			goto fail;
> +	}
> +
>  	/* Remove exiting planes if they are modified */
>  	for_each_oldnew_plane_in_state_reverse(state, plane, old_plane_state, n=
ew_plane_state, i) {
>  		ret =3D dm_update_plane_state(dc, state, plane,
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> index 5b6f879a108c..ad025f5cfd3e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> @@ -409,6 +409,8 @@ struct dc_plane_state;
>  struct dm_plane_state {
>  	struct drm_plane_state base;
>  	struct dc_plane_state *dc_state;
> +	uint64_t tiling_flags;
> +	bool tmz_surface;
>  };
> =20
>  struct dm_crtc_state {
> --=20
> 2.25.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--t6sdrdefj6jx6s7i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl8rHvAACgkQWJzP/com
vP99JA/+NyQM/h7HbHPdJOBWpnYzi2cER+1pQGUfrtMoGFPnzqFVYt6QPnnLKSyi
7X1MZ+gmpjutjEh/myVB6EjOQj3mxbHgf9ObVIA2xrBZbSFpU+R5w/uRgyts62DQ
m5SOuj3dR/bINTgIklmx9diZxsoj1vUWVQpdZBQzRUSd2wUpX6FHHLuE44YtsBnZ
nREFFJdWtgGsXE8t0eVhcg6WGeioRidGVaRV0irD8jLO3CEvv+J4JjxNcOGJr3/F
79dMaz58njjzwqxToprXAYPVEJjUKkXARBZig/yY4w6jLFLXB97aLf2YUIg0jr8m
ygWPoJwanTaOGNkTgSIxFWKCIqRhn/3DsvnqD2cPXdZMbpXNrVeKLmJ7Oxj/NL5s
0/DUL6p4coKZ+srVJax2RRYTMUh/Bbown3WeCKlLauVdLLI52tUq6sBegaatg+mn
hARgEOSlMVdW6+sfizWesYv3ic/w1R73pCSOxo66SzD+IyDA6yIn5oEfzrggosVt
n5XF6P6xkG1XCnHxvnnjseV90/W0ZcFV8HDkBGuwcbdQMrSdp5SlLX2rLvwa9oat
pFdsOajGpSomLnHMEtMtPSTH56KwukE+PQGZbHgJ+Cat4vE+nFK1Zd+jNiRX+Zc1
WY0zE9P0mwXT1jdUBuDT4N2VQ0eNTIBi+TIhZX5reC/zTbQ0RSw=
=5xOt
-----END PGP SIGNATURE-----

--t6sdrdefj6jx6s7i--

--===============1628254709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1628254709==--
