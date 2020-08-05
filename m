Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E6423D37A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 23:12:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D4AA6E83C;
	Wed,  5 Aug 2020 21:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B85646E83A;
 Wed,  5 Aug 2020 21:12:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lY8LzwW1vMhVhmy2n5C/Ppy4z7dtNc41wAsc68NnZM2sBacaLXYbh7jgWwkbX1FBtUUF2pdRrRZicNB6WAj4c3u2d7utNDK4KwlUhpn+38El8vaQA3wPhJNFLYV/Okv9T8P8tTyCpQUbO8HmrHKH/x2pckoahbZSgk1WOVRwwCg8oTvjdvYH2qVFMK0CePgGZkbhuuSn5TDMmho0chAKVy/kQE5Ch/5IXX8g+6Kt7Y9usNYIsA8CoRDCRePzKCiE9VRhM/iWEesDB/oIyuUssdNGEP0gkL4x4N1sAQGGXX5Zw3K1G7zvxD1frn0iSYjpCWFq5Lhd7fu57BJ+RTWoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fD7Zng0ZX0YTXQkkktBiVsQ1a/EUXqTwvT07Pt0HUjw=;
 b=GqOjt3UtfjjplyOOglQA/GjQFQmvK36DUyGwo7Dqolqi4yX/O08vUVd//iLfwLYlcRAJNTnwuAiD+HrQ0in7kWE2bRucsUN8zMAJJQEgZKjd16/e+Ix/KP/ov/CMeVcn+JmztnC3ujK6YW/GBDIiR9hpsiD/iKFi6y6+v3CL2/OzqBJ+fwGuSLziWh3GaArooYTSonz8TLf9EELZVFFNndpKF9RseRWVgg2zRn4g2pLrL3m5ITwCXEQyfclAZkioLuqBknKlOCjMwRvutZNGjP4DFQkrEXXsEtUmueQ/Dk+C5ntGii0zoqBAbxLBgPLhQ6A6Q1xUQL4Nb2InVtWfVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fD7Zng0ZX0YTXQkkktBiVsQ1a/EUXqTwvT07Pt0HUjw=;
 b=o9Ffr3y4y50uX7rdwx3fCCKboXvRUkx9eHbEfhdHCuSuVIx1J90kwOT5YE0PJO3PhSHZT2Vw2qPwNmF8uwyxAHLoelhv0cUkY9gTZgTX6mKx8lHYMaDHLt9zH+JuThdXCWbQhniJL4gqMrvjFQNs/vgaPM/M7prQcS7BfRZeDVw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM6PR12MB2891.namprd12.prod.outlook.com (2603:10b6:5:188::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3261.18; Wed, 5 Aug
 2020 21:12:35 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::75f2:ebaa:bca6:3db7]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::75f2:ebaa:bca6:3db7%9]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 21:12:35 +0000
Date: Wed, 5 Aug 2020 17:12:26 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH 3/7] drm/amd/display: Avoid using unvalidated
 tiling_flags and tmz_surface in prepare_planes
Message-ID: <20200805211226.7psydjikushgsckp@outlook.office365.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-4-nicholas.kazlauskas@amd.com>
In-Reply-To: <20200730203642.17553-4-nicholas.kazlauskas@amd.com>
X-ClientProxiedBy: YT1PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::15)
 To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60::80d1) by
 YT1PR01CA0002.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3261.18 via Frontend Transport; Wed, 5 Aug 2020 21:12:34 +0000
X-Originating-IP: [2607:fea8:56e0:6d60::80d1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2bc8b125-2e26-4755-7cf8-08d839844645
X-MS-TrafficTypeDiagnostic: DM6PR12MB2891:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB2891ECD24CCF8893DD82BE72984B0@DM6PR12MB2891.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ua5Q5mw8yNTKzS6BLI0ZeBhRLbVcrwxvfHqJ5pJ3Pw6nz2kL+lDRnOo5UjCzNq9LfdqC+wRCaSwj/cdfLtggHxx6Nz5F6RhAkXd7vCI/hs7F2W+wxZU7tLzIH3ngiPcRAaUiEgIiU9GBlxT+yWFCGiAnIWVXlD7jN6agzMYIR/WwTUqvbo5VDUW/mZU2QapiLMQWsyS2WcQgBiq+phjmArjHDP1VxyPlzwm/Wpj3xI2ZI/jK0SY5Q4p8juRbXLcAOXltydhHe4NNxNewzPaVko9AHA3b/Y7wnURUi2NapoYDsxqXob0YlmylJmjzoPahdvC+xO4E7r/mVOpfx28MK97Kx4W4Z/Rp0MdpSW6wKUAUZr5sXOVom5Jcbz5WzrPzTR649XUexfiXTRuCbkSaOYhajLrljOtQFbBZGRE2WMF4ft0uNkCc3n8J6oSKXOSf3Bm6cqT7XTk9Fx0xbFAOkg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(55016002)(6506007)(4326008)(6862004)(9686003)(478600001)(66556008)(66476007)(186003)(16526019)(966005)(44144004)(450100002)(83380400001)(7696005)(52116002)(86362001)(6666004)(6636002)(316002)(21480400003)(8936002)(8676002)(66946007)(2906002)(1076003)(5660300002)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: yg2razpxJ46uTo3wqfdtK0wvmiwcCV6k2Z63eUxyvd5RY9MAeKPRPkAd5zPehQxgvuPF5x/qP106q+pDMvQeO8tIyKw25brL+BF1OZ1UrYvD9XQ5tQsM3SP0mlC42H4DtT9+BXKyg9Q4q/585eAvE47Sb5AFq1B6gDPMFVhpWMNgPKVplJHm1DRPIK+0yD4/qkdwBLd0IyiwxTkd1kewQDM/Xx7ug4P0ajGNSob2/lLoQgnqgX4+WyKDDqLT06RaGaCKt6c/NJJzrOza1nzJa02ZqpgWWC3b1WK0dwu5JcPOkuQB9kqEX0aJBuEE1dVtSj5YgLaQAoZ9D8VR2VsRlrG9YrU5CZ9dz3i8/MLedPzxi2IUyMDpyDUIGdggQ6cab4SJ8wNFatN8nNag66MrvFaG0NemKi5oA+djK/VjcmmT4yI4nCGSyWZoJ+Vr9JdIuVFb54BarY0idMC251/sk0JOHlLo0m4jgyC77iEgO2i9fkKsNGqYi/PIS52eyDYEDkDGtL2RzSJyI1s5W+WIFryry5n3GqSYzD2kuBcn+4Y11ao+nalRJNc69LprxKd/NYj4IQjRJL/IBfBA3vxV5pn3t3ypRE6/vtHxgCF+4txN7sahuzgyTocfcG4crLZ1YL3oX6hoXr+NHoIJdiEk5DH/0Ks0/ehd4SKBSeR9XE7jPf+ZsZ4Rv5vLZqMaZjAO
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc8b125-2e26-4755-7cf8-08d839844645
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 21:12:35.1565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hiPOz1wsU4HKN6ayiEuL/MRF/HgYKnDf1K3l6vsTyAuT2FOFpEn5lY3m9ey6+KeXCBN6cjxl/4kOS40NVBlwdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2891
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
Content-Type: multipart/mixed; boundary="===============0115891074=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0115891074==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="evb5rbqqrnblvhci"
Content-Disposition: inline

--evb5rbqqrnblvhci
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 07/30, Nicholas Kazlauskas wrote:
> [Why]
> We're racing with userspace as the flags could potentially change
> from when we acquired and validated them in commit_check.
>=20
> [How]
> We unfortunately can't drop this function in its entirety from
> prepare_planes since we don't know the afb->address at commit_check
> time yet.
>=20
> So instead of querying new tiling_flags and tmz_surface use the ones
> from the plane_state directly.
>=20
> While we're at it, also update the force_disable_dcc option based
> on the state from atomic check.
>=20
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 36 ++++++++++---------
>  1 file changed, 19 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index bf1881bd492c..f78c09c9585e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -5794,14 +5794,8 @@ static int dm_plane_helper_prepare_fb(struct drm_p=
lane *plane,
>  	struct list_head list;
>  	struct ttm_validate_buffer tv;
>  	struct ww_acquire_ctx ticket;
> -	uint64_t tiling_flags;
>  	uint32_t domain;
>  	int r;
> -	bool tmz_surface =3D false;
> -	bool force_disable_dcc =3D false;
> -
> -	dm_plane_state_old =3D to_dm_plane_state(plane->state);
> -	dm_plane_state_new =3D to_dm_plane_state(new_state);
> =20
>  	if (!new_state->fb) {
>  		DRM_DEBUG_DRIVER("No FB bound\n");
> @@ -5845,27 +5839,35 @@ static int dm_plane_helper_prepare_fb(struct drm_=
plane *plane,
>  		return r;
>  	}
> =20
> -	amdgpu_bo_get_tiling_flags(rbo, &tiling_flags);
> -
> -	tmz_surface =3D amdgpu_bo_encrypted(rbo);
> -
>  	ttm_eu_backoff_reservation(&ticket, &list);
> =20
>  	afb->address =3D amdgpu_bo_gpu_offset(rbo);
> =20
>  	amdgpu_bo_ref(rbo);
> =20
> +	/**
> +	 * We don't do surface updates on planes that have been newly created,
> +	 * but we also don't have the afb->address during atomic check.
> +	 *
> +	 * Fill in buffer attributes depending on the address here, but only on
> +	 * newly created planes since they're not being used by DC yet and this
> +	 * won't modify global state.
> +	 */
> +	dm_plane_state_old =3D to_dm_plane_state(plane->state);
> +	dm_plane_state_new =3D to_dm_plane_state(new_state);
> +
>  	if (dm_plane_state_new->dc_state &&
> -			dm_plane_state_old->dc_state !=3D dm_plane_state_new->dc_state) {
> -		struct dc_plane_state *plane_state =3D dm_plane_state_new->dc_state;
> +	    dm_plane_state_old->dc_state !=3D dm_plane_state_new->dc_state) {
> +		struct dc_plane_state *plane_state =3D
> +			dm_plane_state_new->dc_state;
> +		bool force_disable_dcc =3D !plane_state->dcc.enable;
> =20
> -		force_disable_dcc =3D adev->asic_type =3D=3D CHIP_RAVEN && adev->in_su=
spend;
>  		fill_plane_buffer_attributes(
>  			adev, afb, plane_state->format, plane_state->rotation,
> -			tiling_flags, &plane_state->tiling_info,
> -			&plane_state->plane_size, &plane_state->dcc,
> -			&plane_state->address, tmz_surface,
> -			force_disable_dcc);
> +			dm_plane_state_new->tiling_flags,
> +			&plane_state->tiling_info, &plane_state->plane_size,
> +			&plane_state->dcc, &plane_state->address,
> +			dm_plane_state_new->tmz_surface, force_disable_dcc);
>  	}
> =20
>  	return 0;
> --=20
> 2.25.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--evb5rbqqrnblvhci
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl8rILoACgkQWJzP/com
vP/atQ//RREU7DD2/PqaoTDoy/dvYsAdLLrR7rzT8MruT1tKO91Ix1QK/sjN6cnN
t9QSl55Tglko07qwFbKAJaZ/wP0NMsbtrp8reicgEXr4feEXoGPmfg6JCc1Q1NqG
7YUsoTp7uyI1L3c7MrlZAogp009EYp07oQ4V3Cxn2FBNJwgfjrsuhmbqyy60jFYD
5i/Ge7d3G3k92/c8sd+zqCSiNAn/d6rDL+37N27YqmS4rMMHZzL8JZJDi7uGGrAu
fGp5RyWJVOO4WTYfl5Yb3MdxpgMDKrzU9eCGDGTZHmszxsXkJoD1H+kRWDHwiU5L
UUBDuEHnkb2pj+WgytuuE9WN8t9/bLYmPD2M3pi1yO4C/eQ/thU5psAS0325yTHG
iJZoJO+/dGOJY+uSjBhK8w07SKq04LxswOHtlejsp1s7cG92fX/AuoBo97HkgLBM
Avh2Io2ra24E/d3Do0364cQDzT+ryYrL3lmkF19ljJiUtTLCUjTtnp86qgcgz3B/
U9ekOoDzmVv1bjmEtq1bURSBedn560N63EPgUzSRWoEFkMVSBnqizdS7Cm4Xdo9f
d+yLGvekslXjHttfG2gnUCnDeGqF6J4bWtgcG8nHupuMtWSBt7PDt3oAfaEvicTt
97HcaAhloG5hoJQkCfWeD8wvTlZKUGNQ5Fp/nm7/tb4bz0pu6Vc=
=KVVi
-----END PGP SIGNATURE-----

--evb5rbqqrnblvhci--

--===============0115891074==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0115891074==--
