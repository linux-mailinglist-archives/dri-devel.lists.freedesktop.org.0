Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D01C23D376
	for <lists+dri-devel@lfdr.de>; Wed,  5 Aug 2020 23:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B1D6E838;
	Wed,  5 Aug 2020 21:11:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2070.outbound.protection.outlook.com [40.107.223.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F0B26E838;
 Wed,  5 Aug 2020 21:11:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HQhjHKM1rXP29A/Amu+6M7ndt3E2dM5KmqyL7GZq1RjUEDfOLCMtDK9Kdm4hE5gJ05wYIOff984iU3jV08h2uzTcfEguiTCXcgdJKA+FlLkHoNwVJ4Gkdg0cuCJ2QQ9ZDoF7jsthdGpzgAv7OxJFlDXhFo1v6tOLfY9CtiZHRXBtghY8dyPh5zQESncvpuxHs+IwfcEAVr8FgVY+4wBQGsFn4Rh4/Uhg1HU2gKqCCApXNZJbZTAf0PJRexFcEFSYWRH8hSWnbzs5CrYAPYDx9/qRoUq4wkI4/0Ve1npmm41h3YtoBC12FHSMBTe5QR5qiv9mvtKAebYvjbN93p+uzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16Uh3GL3K1mr2N6Cgu2TvQe42pOnN5Ikg1OR6r3j3PE=;
 b=boYQ29AgxUQi90+ixLY82OzAur85SwMls8j7LCDtPFizq/UO7dt4TwRxsSpOFGDHNlHGQx0aLP0bpnCcur7LfAPvcudvHJqqwLtEtZL5VyqxrMpm6LHQVOINV4njBL0W+G8qHcwDbU5n/vCdngJPOqYheVIVNPIndvGlwQ5t49ynO7fBqUBfNNlrvSo4PVclKDJOhQ3sibJnHnUzWyvI/niCHeaVpEXKz5zkxlrvouljPGFXRv38gpMg0GmRD/LHU2uFVtA4gloXVFe0/rGAJ1kO97dOfP0Qh7+/neHySkFund2fp1ad3bfgdqI26B1iM4sPG5SlpaTs7oGRO7aUxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=16Uh3GL3K1mr2N6Cgu2TvQe42pOnN5Ikg1OR6r3j3PE=;
 b=bzlu3e+WuhcKk7tEMUwl20qxVLM7wiij/kypk6PJy1fTeSbvfV7UnwZaniM9r8V+hPOWgotaQXHki6pLLrn6y7bb2lSm9V3s9XuXcC9YHjIVV8bo4dqeU81Ex2LHK5aIVcWYPtHdgnWxTCt8CXboVXk/zx9Rr7wDN/2rIk5LWBE=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB4124.namprd12.prod.outlook.com (2603:10b6:5:221::20)
 by DM6PR12MB3577.namprd12.prod.outlook.com (2603:10b6:5:3a::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Wed, 5 Aug
 2020 21:11:17 +0000
Received: from DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::75f2:ebaa:bca6:3db7]) by DM6PR12MB4124.namprd12.prod.outlook.com
 ([fe80::75f2:ebaa:bca6:3db7%9]) with mapi id 15.20.3239.022; Wed, 5 Aug 2020
 21:11:17 +0000
Date: Wed, 5 Aug 2020 17:11:14 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH 2/7] drm/amd/display: Reset plane when tiling flags change
Message-ID: <20200805211114.m5iw6f5usj2b2yrt@outlook.office365.com>
References: <20200730203642.17553-1-nicholas.kazlauskas@amd.com>
 <20200730203642.17553-3-nicholas.kazlauskas@amd.com>
In-Reply-To: <20200730203642.17553-3-nicholas.kazlauskas@amd.com>
X-ClientProxiedBy: YTBPR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::40) To DM6PR12MB4124.namprd12.prod.outlook.com
 (2603:10b6:5:221::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60::80d1) by
 YTBPR01CA0027.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3239.17 via Frontend Transport; Wed, 5 Aug 2020 21:11:17 +0000
X-Originating-IP: [2607:fea8:56e0:6d60::80d1]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1f57805f-6b4a-4e25-c6d7-08d8398417f4
X-MS-TrafficTypeDiagnostic: DM6PR12MB3577:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB3577BAFDC8DAD340DAC08BC8984B0@DM6PR12MB3577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DvfW+EOVdMo7ISI8stMIdf0Uttw0Y3wLlHs0hSINnbr8SGI/ImelRp1Bx0eyOVIL7F2qvW2r09iWRnTIiEWFac1JcjulJM5c6K96Z3DkGVxaKMteDe/27WEs5BRwi9UUfmFxed31U6IT4BmZ7ektKxNsDYO+izgmfK5QFwdVGGVLAq85AELOsfijzwhCg7hTE+PcCa9MirEwfwuc5kJI0tWg163vPNwSJvDXKiUhAltCR0qsvEC7R+SqEkkXuXloJdhijtTupgyptqy5C0/rFuGUQ/Ao4NDdCUYKje2SfSDLsJeHKO+RdPYEcHXqzKYBGyR2CVLSxbjBXi2uRuYehT4QclaWKtLsk8rfZWQ9IxY5kg5vHJP+uSxgLsafPlVR1CQ+5YyPgzAZj62Qsum7QdWLfIIqYSbziJk6h8+hQQ+1GHz+u7frxO4YCg4RqkmsDsmfC8ZFwoZbfyyDGcegug==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB4124.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(396003)(39860400002)(346002)(136003)(376002)(478600001)(9686003)(21480400003)(2906002)(6862004)(86362001)(5660300002)(6636002)(54906003)(4326008)(8936002)(55016002)(1076003)(966005)(8676002)(450100002)(66476007)(16526019)(66946007)(66556008)(186003)(7696005)(6666004)(83380400001)(52116002)(6506007)(44144004)(316002)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: cJWwsQsI5zfo3Q1X0oTrZqgVoHkzwc2LGAWxYqWP14wL86JINENs8h3UjWa0ILyjH+uWhe/wRWQq7384y3Grg8NvxKKpqtD7PoUv3Ro7nBi2lfXdGG/aiKTOHpCiMxPCi3jsHSkHw/PaMWC3UhHxLXEcCOT4pehSp9IHfxVt1KCIumxarVtMW1zUDSs3n4pe9EnKzM5BdECBB99EEyR8yQeHAVKrocXWHOxKNKC/orwEkeFbaF6mPLLBAkbjrCM6aeSo2l+81Zwunexj3wjH8Oz80W6I2yNtL6Vmj54cBi5rs7dnhhSAY3JQc7DLse4eeOvT221YfSnoHdxxOYCjdWp6ObxeBqiCYjTfQZSt8DOCjSdu3qxJyyH1FDCDYTBVN9UZv0kxI9vh4+c+T0GhtB6+2HGdGVg+q8Kaj9P7zRzm3KGuQ9F/PXaUUJ8dEYrB/Eq8JiihPmK1pfJI0LJ8al9Kqb5/ZyvT+I7DG5LqLKfIu8czG2UyEYAv0s8eA+r4AT5xfG4Msg0Riqos/2F4j9ojHrOjv+LxgQphSoANwCKp2u9QBGTlRnEBdmV3zskWrvutEonCmwyQnttJ07+2yaubsbSNcSkZDNFnaS0ZVHAWZUnEgMWmNhgqWgKAnRilRvfOaAkJ/IHo+6pbla11KwiWaF0iVNGpuLExO3xXkus9HMg2Cu2E2z/vLojUx/e6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f57805f-6b4a-4e25-c6d7-08d8398417f4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2020 21:11:17.4832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zsthbXVqKs8Whdtmp1wJPlZiabGAi5rDGZhEa41IjTGAbsw2vY41/I0IvokY6LmZw1Js0Yqinsx03T5XkCt9qg==
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
Cc: Hersen Wu <hersenxs.wu@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1648442588=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1648442588==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ywrppvxlaige3bnn"
Content-Disposition: inline

--ywrppvxlaige3bnn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/30, Nicholas Kazlauskas wrote:
> [Why]
> Enabling or disable DCC or switching between tiled and linear formats
> can require bandwidth updates.
>=20
> They're currently skipping all DC validation by being treated as purely
> surface updates.
>=20
> [How]
> Treat tiling_flag changes (which encode DCC state) as a condition for
> resetting the plane.
>=20
> Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
> Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Cc: Hersen Wu <hersenxs.wu@amd.com>
> Signed-off-by: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/=
gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 7cc5ab90ce13..bf1881bd492c 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -8332,6 +8332,8 @@ static bool should_reset_plane(struct drm_atomic_st=
ate *state,
>  	 * TODO: Come up with a more elegant solution for this.
>  	 */
>  	for_each_oldnew_plane_in_state(state, other, old_other_state, new_other=
_state, i) {
> +		struct dm_plane_state *old_dm_plane_state, *new_dm_plane_state;
> +
>  		if (other->type =3D=3D DRM_PLANE_TYPE_CURSOR)
>  			continue;
> =20
> @@ -8342,9 +8344,20 @@ static bool should_reset_plane(struct drm_atomic_s=
tate *state,
>  		if (old_other_state->crtc !=3D new_other_state->crtc)
>  			return true;
> =20
> -		/* TODO: Remove this once we can handle fast format changes. */
> -		if (old_other_state->fb && new_other_state->fb &&
> -		    old_other_state->fb->format !=3D new_other_state->fb->format)
> +		/* Framebuffer checks fall at the end. */
> +		if (!old_other_state->fb || !new_other_state->fb)
> +			continue;
> +
> +		/* Pixel format changes can require bandwidth updates. */
> +		if (old_other_state->fb->format !=3D new_other_state->fb->format)
> +			return true;
> +
> +		old_dm_plane_state =3D to_dm_plane_state(old_other_state);
> +		new_dm_plane_state =3D to_dm_plane_state(new_other_state);
> +
> +		/* Tiling and DCC changes also require bandwidth updates. */
> +		if (old_dm_plane_state->tiling_flags !=3D
> +		    new_dm_plane_state->tiling_flags)

Why not add a case when we move to a TMZ area?

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

>  			return true;
>  	}
> =20
> --=20
> 2.25.1
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--ywrppvxlaige3bnn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl8rIHIACgkQWJzP/com
vP9WyhAAub7x3egjcFHt/VVvX/2OdLbAiUC2muEKSzRh1j4pN3ZvMtEVmgypvdjD
PY3EdRoNBkdFVYaw2NU8lLYE7V2GOlgNQpAyu8OSDIcRsx7kIBNmQV6ni2fG44XG
gWQaHp1WmKB1wjl1ER3bb1VmhrQqo9jrVaWfejdAyF0lBvRytELwU9ineVX0goPZ
M8YHKh3LqKjpv1RhfpQzDpITUP17ZxoUx7e/2CH3jyBnPdq7AzcFGHb9Z7r3/PnO
OXBPZbV5eKMdySfvqkIAkDs5pFHC9/ZVt6c5urtBSx3IPIzH45duRBZJu0t/1Ns0
M9xEgy1BzL3a/W4t8xqKuqe5jGKcLluRHAF1b0NX/gOwTjGhhNBq67YTocvqTlMi
kmjAzjje+xynmWrRcz4z5MGyHM49DPK784kqc2jDNGu+Vh/UgAZ90vWjYKoIWiHe
dWWjFlQXMt9xSGKbyeKDrcesE4CqMk1U9BfKxl7rNbqnGXydGNSJRLWGMsKHNw4f
dD8/LQ7Q16JHDwli86GwO2/uvdX7Me2c4y8+29bcLs24Xgkc5CFxdfX9Jv4zq1dS
ccI3HSmnMWwAW2o8AzY/VsMi/knH2XedYClE5l4Wh9YeT4/qSzJdBIBf61I4nRYY
GzFb58UiZB8eAEfuIhqSJ0Z7jrXUlfClhTX9d0zpogYwQHwZZhQ=
=Wnp7
-----END PGP SIGNATURE-----

--ywrppvxlaige3bnn--

--===============1648442588==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1648442588==--
