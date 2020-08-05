Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C49EA23D37F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 23:15:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAEEA6E83D;
	Wed,  5 Aug 2020 21:15:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770084.outbound.protection.outlook.com [40.107.77.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36ABF6E83A;
 Wed,  5 Aug 2020 21:15:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MKow0WPodYp2UWaP+5KwENcgwHOFGJKVMRHhm+3tWJ0xQ6qDu/awb3MnahItXZQw+zX+Z5eNtiBWOtvTfddPXzmwjWQOyzYPvfgrtxeAUqf55tEmtLHEihZGSg7ubMG6q4OGcXInOBh6i83QhLzPSsvcYxGwupScoz6KXK5gJOjXnWckIjKEPJzHN9X75h+Es49/fC5IzSE91yDouSoEftNDRne6GO9XVT9DfU1LhEoY/Fiw1rpBiOXk/TkcRnm/3RWCNrkrKuBRbRl4U4fWonxv6Q54GXkDcOaGpHH8c4hEk3ye9NKY8n4eFVuVMw6hlB675g4fLRGBgoxNAMWjxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa7TVw8VD6UmRxRRkXTvn3WeazgPb/6eA847h7Vb1Uo=;
 b=EOqMJU2xdIa79yHjf8A3gdAUBjcuFSOaZVLWTaL48xrLwhpbcD6twqmblV4hKAHIP/FT8Gsd2LQia22XBqYlCGTpGKnw1zMTvqe2YGBpyp4Bu0VezdpCa8WtQ2s1NvH2nypgcNTuV5malSTF4ejsVyO1J3VOe+yw49yR7bKQN2HjwB+5cUJbS1vvtHEhsLKINv3k4zRICphqXNqunGOKCBL+lGyGBgeaJBLSNTUfvM8Mq+oOsAbVVeaYy8RKVMkhzhZzOZr3QWOC85OzeUp5RgFFtmIm5NKU+u8zf3GbiakbJYorRmn88RcJ8SfyN0T5EsIspkaXtyqBCDilTbFA0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sa7TVw8VD6UmRxRRkXTvn3WeazgPb/6eA847h7Vb1Uo=;
 b=1vxHcN7wbUtJnpODoudYhugW9z/Pn3ijwx9fMwFlE7cQaJUD6qIlgSjeb0xGJcllVcENaDIxyXwoZC1/oH6CeXMvMe9P6RmdrDpe63ksOi4ctJF1QDxS8HKCRhthx7Fod3OHG97z+pY5g4WF+3sxOZQmUGWoOMIOy1yDl0CsB2Q=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM5PR12MB1259.namprd12.prod.outlook.com (2603:10b6:3:75::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.20; Wed, 5 Aug
 2020 21:15:10 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::75f2:ebaa:bca6:3db7]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::75f2:ebaa:bca6:3db7%9]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 21:15:10 +0000
Date: Wed, 5 Aug 2020 17:15:06 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH 4/7] drm/amd/display: Use validated tiling_flags and
 tmz_surface in commit_tail
Message-ID: <20200805211506.7njihyllikgnchez@outlook.office365.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-5-nicholas.kazlauskas@amd.com>
In-Reply-To: <20200730203642.17553-5-nicholas.kazlauskas@amd.com>
X-ClientProxiedBy: YT1PR01CA0100.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::9) To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60::80d1) by
 YT1PR01CA0100.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Wed, 5 Aug 2020 21:15:09 +0000
X-Originating-IP: [2607:fea8:56e0:6d60::80d1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: bb372dcc-445e-4456-31a3-08d83984a280
X-MS-TrafficTypeDiagnostic: DM5PR12MB1259:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR12MB12592628CD51B69E800F3ED5984B0@DM5PR12MB1259.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HLdob/NoOs08RzXkz+wjDONMjrUpm/YXnNSk1L6IUFmQ5MrKXHCdePyQ2GHWIPVDn8Lo9WUSsMKMN0EhQ9tCVzeYXAzTD4mdbgirg6JtZTwJ+A8tJGSKR4g1JwQkxgKdp36FvlNN2D3fpKDYMOYOlisycCOddbEjqLXhaLc4nXRE7jhpnZRaENRNk/EenG4+6nWAmiz4aGbx2QETJ5NbCKyYxl1lO1Mv04xGO+aw6QmzOrrz2WdCK68Yq2mEHuwsx6eho7V6zl9uLxksN7x/siI+si5CO5yvmgCSusp7wQiOMtzPcAFmL4RFhDm7+VrMTCSt/cZstwYe7nh6NNl2M38qngZzz5D8f7duycIsZ4rTc9ixni1fyTt97ZSze7tnWDsKCDYB3QsE0AmlWBiO3qP6csA+v8awxLPFHG2n9MLpNv52SbVwuf+jGOBI/s+r3pXYIrNyH8tJJ0+vAST/LA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(346002)(136003)(39860400002)(376002)(15650500001)(6506007)(966005)(316002)(55016002)(16526019)(186003)(44144004)(9686003)(6636002)(5660300002)(7696005)(478600001)(52116002)(8676002)(21480400003)(6666004)(4326008)(1076003)(66946007)(83380400001)(66556008)(86362001)(6862004)(8936002)(2906002)(54906003)(66476007)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: UBCgDESHq1fX08Nsz5rSqdpx4ZsQtx6IuKEiEFkj4J3IHXPkFJDzaaZIS+9xM43lLa+WlU4j06F6VU3XE+nZc7/QtBY0eaHDmSaPPJiKzkarFQsQVzzs32tezXKhsfsG8H+4MDAhvhrBOTGElmeAq98J8lRp/ReTMYF49dMN3DdIsOZKP4bO25TZDTjq13YhxyGHWm9JxYNwUZnAEdxBelpBA4nsTTd4kS/iNPCyUiSqE7WdPwdejE091caaMLlWKTzwZI4vKYUB8x6uDFHXo+ZkQLgmYAmM6CESxaWM8WLwdSWu1dJ/WKRke/6gb+1hQDrafnWedgKP90YukNYRwKzkjAo9ZS/Bs/caP+VwPG8lKQ9R2MUWWM3Q3ife6j6N9GGPtLQ02dxXiwGTr6nVfODFS2b8iToIiXolUMG1Ip7I0U6V6u0mmnjVPamebeks3rMkuBHRZkMdCGZ6zGCShkRzjlS1ztNVSIpZPjSMzBegztzxfiwIMcJ9/jbkFh+ypyrm+AOIXFgkTQ5JPnAAzYvepnq3M6S7rpERCWD6DsbqaGP9UPSLajaBThzsNuoZwXjfq4XOFVVa7AcDK49Lcnc5PY7ObhlPcwRI78mbHWr/wcH86WB3FE96Zat8aG4sAfUNL3J0mWwoYMol2t8pAkIkCz2mNANBYfklZ4ZZbtlY+3rTTyVP+tQLlsAPbGz0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb372dcc-445e-4456-31a3-08d83984a280
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 21:15:09.9503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fwqhskuqfc164QnJ8B1gGJoxijOvk7xnXRF8Tx1Iuq1L3rvgKtKyGyA9OcS3pCFHW/HA05SPS463Kq36YjEnOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1259
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1140055336=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1140055336==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="by6rtyed5rpde636"
Content-Disposition: inline

--by6rtyed5rpde636
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

On 07/30, Nicholas Kazlauskas wrote:
> [Why]
> So we're not racing with userspace or deadlocking DM.
>=20
> [How]
> These flags are now stored on dm_plane_state itself and acquried and
> validated during commit_check, so just use those instead.
>=20
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 18 ++++--------------
>  1 file changed, 4 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index f78c09c9585e..0d5f45742bb5 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -7094,8 +7094,6 @@ static void amdgpu_dm_commit_planes(struct drm_atom=
ic_state *state,
>  	long r;
>  	unsigned long flags;
>  	struct amdgpu_bo *abo;
> -	uint64_t tiling_flags;
> -	bool tmz_surface =3D false;
>  	uint32_t target_vblank, last_flip_vblank;
>  	bool vrr_active =3D amdgpu_dm_vrr_active(acrtc_state);
>  	bool pflip_present =3D false;
> @@ -7179,20 +7177,12 @@ static void amdgpu_dm_commit_planes(struct drm_at=
omic_state *state,
>  		if (unlikely(r <=3D 0))
>  			DRM_ERROR("Waiting for fences timed out!");
> =20
> -		/*
> -		 * We cannot reserve buffers here, which means the normal flag
> -		 * access functions don't work. Paper over this with READ_ONCE,
> -		 * but maybe the flags are invariant enough that not even that
> -		 * would be needed.
> -		 */
> -		tiling_flags =3D READ_ONCE(abo->tiling_flags);
> -		tmz_surface =3D READ_ONCE(abo->flags) & AMDGPU_GEM_CREATE_ENCRYPTED;
> -
>  		fill_dc_plane_info_and_addr(
> -			dm->adev, new_plane_state, tiling_flags,
> +			dm->adev, new_plane_state,
> +			dm_new_plane_state->tiling_flags,
>  			&bundle->plane_infos[planes_count],
> -			&bundle->flip_addrs[planes_count].address, tmz_surface,
> -			false);
> +			&bundle->flip_addrs[planes_count].address,
> +			dm_new_plane_state->tmz_surface, false);
> =20
>  		DRM_DEBUG_DRIVER("plane: id=3D%d dcc_en=3D%d\n",
>  				 new_plane_state->plane->index,
> --=20
> 2.25.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--by6rtyed5rpde636
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl8rIVoACgkQWJzP/com
vP8p+w/6A8BmIeOGnTrsAczClF0pBJrvt4ksxx2IE+fk6nfUOozY9DP2PefrzNf0
SR92gXGVTzIZdRdnzu0sL/lWl/ZIJqB3YMS2dm5AGjo74W1lLY+CI/fwbFtVJTGY
XKam5Rlp05JjJg5Hs6U450XBqh8SPT6UcCMQGB0Z0MdOF9uarRU9a93S7CtA/hYp
g3Nc2EvwPd/P5FzTEZvmhjLSYWOxhmEOHH9fZiWpD89/8ianHPTqWbEGNDWkLT3R
B7Pv/wNd5A8+qd5F6pQBMNqUb8MVbgFNII139eFdpN2e3QU/fNf9jSBuf0XwBaqL
JMuMU5c7cLp14GgMRXi64+Y5o5o07F7/TYWeiHLDyI+35pAdXhDYMYRC/3e8UrHO
cz6tBeylB9JEwkPof+iNF80PaOdIWS5EKaHR36fGABzLPtJNcgmQcfgFEFHaximH
8QX2ur3c/A0TSp1mP2JmtjFroLwGlcXb6mETlRxaojx6r7AUdcEl796ZCzdsyd27
wIgLKXspnUEdagP5oSFnmv2Amm2Prs8onbCfc0TvCjAKON5yBQBGc1rbP5dvrFqE
riIRJeD9waNeLZOQkcO6ahE2TVHKVv2/QmP3Wv/Q0/rSVYyMspIAzMU/8aglnwY6
chJIEcu/vxffoavDdcrGFk4DbibJxWiKRoKsHg8vUawxu/OBtT0=
=Auzt
-----END PGP SIGNATURE-----

--by6rtyed5rpde636--

--===============1140055336==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1140055336==--
