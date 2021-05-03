Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B582371684
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 16:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 330966E0D8;
	Mon,  3 May 2021 14:20:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770043.outbound.protection.outlook.com [40.107.77.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1CD6E0D8
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 14:20:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dOZUAua1NNeXy8zLJ27+DCig/pjD0+rqr5rM0wRw9bqDRhd2rTUxmfkCAfXIWEyLhoqNXO6L3cxyRcLi+KiUo3dtJ0l3Ba/A9lXQ44EuOhQcWVrcI8UyDwAfTLuRgfsufkgnAT81r32me1QbIGlspFTDfuoyfzG3ehK7TulxD8nE8a0d3Z5/0CIwYoZRPUPgh4VUPWSHqdpA8p/w2OORTc9+GhbrSUCp4oA/vO6iyO4aQlgEGK6TA7eb7nx0rIXqjYvgWWwq8kDX/4hVGJsTTdG3OC5Gf6K7L6Bkl4vebYnK0+qF514cZu5nnwb8t1XOPNupNEcjArDxhai8kvJ6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIRZQuWRAgTIvq5TXzGajxqXA9758gzXUvFpxrzwKBU=;
 b=mTOeMvImyhEGoawCCL0k4uOKTBdXq5QWDLNJKVSoKsBetej/dvnb/THXc8xn24X0Yl2PeHqRpmrHniMRC3Ng+4Q5MnFG1vurd6yVLOruJ6Bc79SITJV9VGneJfgfFa3xjNjZf6nzEudw3+uFNQZzqKkxmuiAYtuTXRKXYEz1CmcOq/Cs3a3nNqNTavCBd1QVOUShpzMSQo0TYqKI58gE1OvIrfmuYobnnNIqE+lG+u1insrl170Uv0yeeJL9ouIf0b7EyuhsxYIuKOA8Wdffr1IbGtrlnFE4roATSdymxj1YYu7t5tUBHM8O+RO+51Py2L12/H67hE6cZZ6VS0HsYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gIRZQuWRAgTIvq5TXzGajxqXA9758gzXUvFpxrzwKBU=;
 b=phZ3ijgyO8WInxEnNOYyOt6Ug2//7Mz02rL70MyTKWilXE2DPXPDGzAlcrOe1J12noef78WsvMRzEaZUCsAVq3ss0t0pPDUehGEFHARUEWzgUv5K+s2iQr8TCg2dXQssrHTe2AaFU2dl8Ow0I6gIAkwAPSAQNuT2e3meUwuD1hw=
Authentication-Results: emersion.fr; dkim=none (message not signed)
 header.d=none;emersion.fr; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2601.namprd12.prod.outlook.com (2603:10b6:5:45::27) by
 DM6PR12MB3740.namprd12.prod.outlook.com (2603:10b6:5:1c3::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4087.41; Mon, 3 May 2021 14:20:41 +0000
Received: from DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101]) by DM6PR12MB2601.namprd12.prod.outlook.com
 ([fe80::3d2c:5edf:5d51:4101%7]) with mapi id 15.20.4065.036; Mon, 3 May 2021
 14:20:41 +0000
Date: Mon, 3 May 2021 10:20:38 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH v2] drm: log errors in drm_gem_fb_init_with_funcs
Message-ID: <20210503142038.bs2qfzzpqefqmn57@outlook.office365.com>
References: <ZS4eX0PtTuNvHezILcTWeWINOkRyMS4krXND3cIE@cp4-web-032.plabs.ch>
In-Reply-To: <ZS4eX0PtTuNvHezILcTWeWINOkRyMS4krXND3cIE@cp4-web-032.plabs.ch>
X-Originating-IP: [2607:fea8:56e0:6d60:ff03:f79f:a6e5:9fd2]
X-ClientProxiedBy: YTOPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::42) To DM6PR12MB2601.namprd12.prod.outlook.com
 (2603:10b6:5:45::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from outlook.office365.com (2607:fea8:56e0:6d60:ff03:f79f:a6e5:9fd2)
 by YTOPR0101CA0065.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:14::42) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4087.40 via Frontend
 Transport; Mon, 3 May 2021 14:20:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7dc9d832-8307-4603-fc62-08d90e3ea1b4
X-MS-TrafficTypeDiagnostic: DM6PR12MB3740:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3740990CF6E4B50B6BB3B2E7985B9@DM6PR12MB3740.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LVtOHf4taH+/MpguLwMN46SWLotAN+UcyXUY2IojvQS6oUoxJpf+l7N2CJpWRDjq1G1XXN2C8ZPaLZDBMPHHWXSYacNfS0uyZUrQF1o8maL3DNaU65C93XF4eoSc6Nq+MMEAgKr8+Mqqoue9yrtCYekS+/G9aHu6a2B0LpGRJpLiB6F1SVYt7Lb3gV8CRrjH0BVEyHpyho0flwNFi9jy+FYgqj5gv0RITAqBWT/FD2xLfJFNBChfivmK43hNwNOS3h/5i8k6WR0gVckFnjW4F0yta/Kjrx+jI4Xpf4O9OhRrY/lA37nVY/hbfQfnKUxlBqzISIm6bODkl0U52It1i0/H9n7efNUndsyMKpV5ybTBo9jFGulP9Qawd9FCsyfsBW8FzPuLKH6KN4n4r+8jfh9UWQzcOMBuFC9xoWCILONgeDu+HELOxnOyZuN/4EP6ExAh/E/q7CWM7851s1gxeovSSrevdPCCISSZBsAHT0URR0PZXtc84AVXvGZ8+5trWRulfrbFIcTcAryasuQwL0WGlYGf9wqgmDiXoee3tn8jPe8OD+rhpR7ZZ6DyUXb6+fJrm3n2xYJ+DU9mHR9M74VDheKcFH9uML6Voz6vo2gc2BtAKeLOzSDEEpPVoPZ86i+FLRr9h1yNOUjVAb9t8vZ3wGWdUSBgZGe5WUm1rzxH9JFqTFGRXc0Ec/jP3M0rRczPby+TrbSvSpK/PUtxn0LhGIHb8r2rb+oNIFI5f30=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2601.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39830400003)(366004)(376002)(396003)(346002)(966005)(45080400002)(478600001)(21480400003)(16526019)(316002)(186003)(2906002)(9686003)(4326008)(66574015)(83380400001)(1076003)(5660300002)(6506007)(44144004)(52116002)(7696005)(66476007)(86362001)(55016002)(8676002)(66556008)(54906003)(8936002)(66946007)(38100700002)(6916009)(2700100001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?iso-8859-1?Q?Bm5hLM+R92HHYm2vIW6qFK4i0EqIulKwaRBgWs3iUlVBKaaSnVI4qvobKF?=
 =?iso-8859-1?Q?S13gBQ19Ii1qWGWiZS1hLCBJP6S9/MdFi1FnnNh5z3EgWyo+cXRO2DL48O?=
 =?iso-8859-1?Q?fOkbV6Lvx7QZiMgUydnWbp/LmsLllKxjWLaj1IZBtovBDRT0axm2k93BWi?=
 =?iso-8859-1?Q?dsc7hfN22gQXttJVmkDc2QMCZHeevZyK/wBJ4fEBOPn2SutGI019v62POv?=
 =?iso-8859-1?Q?kDTy/Nx1bG4454X65eE09lAmfCfQYtWWAo9r2ejqGOZf2oGMxS5Ti0Ktkv?=
 =?iso-8859-1?Q?D+ckX5FqENkneMFjX4TBR2yaGxZTdlrCAkanoAFivHKjxlqTjnH8F70tqc?=
 =?iso-8859-1?Q?K9kIuqX+DoMeRfVMbd1PGxR9CvH6iRFCnEU9t9UncIHmy138pZs59qKVyh?=
 =?iso-8859-1?Q?E45AcGRgPka1+9+uWeljHFQE3np9BH45ICYlMj2rv/RG3Pc1HBtsdcb+xw?=
 =?iso-8859-1?Q?yK5bl1NvP+lKsD0qLFjoXe1sAQchTwF4/kSKgQcdtP4EQ4iGVEIuzqaaFt?=
 =?iso-8859-1?Q?5So7GUKVXFfZUQ323tJOqz8OKhHV876b7PxpbFNrx+BXwj4JcmXbJetSE4?=
 =?iso-8859-1?Q?k/ppQRcYVprno4vflBCNRKLFA+6uauiPEKBAdXzZvWT+ySzy6Ci5z9nQDn?=
 =?iso-8859-1?Q?ymnEoRt+7PDS7d4+Q2UYALbTP4sJF2EDFsmAy4AOc8qhBiKVSZvyoWVqFH?=
 =?iso-8859-1?Q?AMhAOzV34Z5S52eIJ0l6ggaz1shWQolD92BuTTye7DxZaUKEMUIxlHAtC4?=
 =?iso-8859-1?Q?/qEJaxcXQ3bUHvYR4MckF53fSHAaXmbLyF6Hc8XhlhCUFqnQ2XP+oc2N3B?=
 =?iso-8859-1?Q?hIqwtOlnzDSFth6jGMv/6uqgNvE3lSwpyMfh1G34pW9mzZEekxXkiPs4Aa?=
 =?iso-8859-1?Q?JQHPHf0vzIxKchLPZTtQVKq7amZwpB1sGZwXX0HZw+sHX4UAeeqYFpPyIQ?=
 =?iso-8859-1?Q?RdC5KrN7niiU+n7Lea2dBUGRtLGUseYD/UqEmazbU8hnrMzVb/LqhRlSoi?=
 =?iso-8859-1?Q?pvO8sFN8cNzZbeRxHFp4YiuX6+fVhJCqSwr4ZAi/4R6aHrUUGcLhDTC3aG?=
 =?iso-8859-1?Q?+4vFIDjpZQcM3sz4D6UwRaPzOI739NGy9U6XWx4ifeidtfVniWgkx0xFc8?=
 =?iso-8859-1?Q?bx6s/WSoypPlQyfdXYBipy0Q4hWVF8q3R+UO1mT+4xfTCEYwRLS1BExFAl?=
 =?iso-8859-1?Q?GzfwBmbispuNXkm6OpdOpwA7/Arxhh2ZW3yWZLwVUJJLO11y/yzZaN3qN+?=
 =?iso-8859-1?Q?IE3JRQmjwDy6HaMB2hNejA3RnBFtWnvQVGpByq3sIqx6NY/vIgnXQ1uxTD?=
 =?iso-8859-1?Q?WaQ00pV4/c6cclpGkq8d4SKWrSJhoO41quI4pWljHlHwGvilmmnlqk3mlM?=
 =?iso-8859-1?Q?skNPBlXEuQl9LEQIXzCwaFDvPjG4A6Nd6QD4YQq8anPqavcpcs0u1j1bx4?=
 =?iso-8859-1?Q?JERrme0dWJMXv4sj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc9d832-8307-4603-fc62-08d90e3ea1b4
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2601.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2021 14:20:41.4789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qtKrdrMBN8Zsao1/jmOo9MFQZePTm9iLNx3vaia2/ksxScutemzRFts9MTrrNum8Mz/OeMSOqbc4PRa9dyecvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3740
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
 Michel =?utf-8?Q?D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0133630582=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0133630582==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a2mmovd62cddkzh3"
Content-Disposition: inline

--a2mmovd62cddkzh3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/03, Simon Ser wrote:
> Let the user know what went wrong in drm_gem_fb_init_with_funcs
> failure paths.
>=20
> v2: use proper format specifier for size_t (kernel test robot)
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Reviewed-by: Michel D=E4nzer <mdaenzer@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Noralf Tr=F8nnes <noralf@tronnes.org>
> Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_framebuffer_helper.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/drm_gem_framebuffer_helper.c b/drivers/gpu/d=
rm/drm_gem_framebuffer_helper.c
> index 109d11fb4cd4..aeb808a0ba54 100644
> --- a/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> +++ b/drivers/gpu/drm/drm_gem_framebuffer_helper.c
> @@ -155,8 +155,10 @@ int drm_gem_fb_init_with_funcs(struct drm_device *de=
v,
>  	int ret, i;
> =20
>  	info =3D drm_get_format_info(dev, mode_cmd);
> -	if (!info)
> +	if (!info) {
> +		drm_dbg_kms(dev, "Failed to get FB format info\n");

Just for curiosity,
Why not say something like "FB format is not supported" by the driver?
I'm asking because the kernel-doc for drm_get_format_info says "NULL if
the format is unsupported".

Thanks
Siqueira

>  		return -EINVAL;
> +	}
> =20
>  	for (i =3D 0; i < info->num_planes; i++) {
>  		unsigned int width =3D mode_cmd->width / (i ? info->hsub : 1);
> @@ -175,6 +177,9 @@ int drm_gem_fb_init_with_funcs(struct drm_device *dev,
>  			 + mode_cmd->offsets[i];
> =20
>  		if (objs[i]->size < min_size) {
> +			drm_dbg_kms(dev,
> +				    "GEM object size (%zu) smaller than minimum size (%u) for plane =
%d\n",
> +				    objs[i]->size, min_size, i);
>  			drm_gem_object_put(objs[i]);
>  			ret =3D -EINVAL;
>  			goto err_gem_object_put;
> --=20
> 2.31.1
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
=2Efreedesktop.org%2Fmailman%2Flistinfo%2Fdri-devel&amp;data=3D04%7C01%7CRo=
drigo.Siqueira%40amd.com%7Cd602106c4a3d4f0d9ba208d90e28289f%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637556387922456015%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3Db%2B7HCBCtToQVE5nJ9gqTr9vV1Amj4PS%2BXJSJB5743%2Fc%3D&amp;reserved=
=3D0

--=20
Rodrigo Siqueira
https://siqueira.tech

--a2mmovd62cddkzh3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmCQBrIACgkQWJzP/com
vP8Aew//WnCLZKsVeQGj/ncu6HSaUYwQBELkDMLS6QCd28TeXQpTwpKu1iE7ioGu
5YzNg9gDEPBUwvJ0VI7dRtaQWjkCScM5vlg83fDdkfhGgGnWAY1gqDWiLKiODqZS
CaRsKzm2evJaW6ynWh++VKQ81PxXjuMsagaeA9tAWQYqV5FTfZfhSPqQlr2Lhj31
O3Tl/k6DLOrtIqfwv+F6guV1z3puLHDlhZlED0nmg/uj9llvHnY7gMihW3KRot8F
fET3PV2+EROYWH7+KnT6Gx5pFiRRDoMjpGM2ZtE3VgRunTAhD9FSFGsjNpSdAthT
vpqRXic6bAqVs3O/c7nSGs9UoJn3XcDEN3QlScEOpAqij0Bo5UiBtMJZ6RutMoXO
hOnemfwItGAle1fFcVMlUmOTS0FNcX94rYLbNs2TcoUx1XCJxXZVcSgp0qEiVQt7
oY5CLj6DZ0TS4PqFn5KzFAlNVmI5cZiGnt3fnPF6uhdePveH82qdtERog+Y0ooEa
ddL0tu+bUv0X460Y+STMdq4ugCNKZwtcfLcSz2R7grPa+Mgl0P6pHgDhii3WHM3+
GX0ZIa+sp4CRSJDtSlpC9s5f6Hb/cjUPrVwXjJs49N04YNHh9zeU3rXgbdWwIJO9
+AiJIoPjH8NGmaOwhIluV40MN36uFJTXiVrWe+4ZFgbWfv9QeMQ=
=ezUu
-----END PGP SIGNATURE-----

--a2mmovd62cddkzh3--

--===============0133630582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0133630582==--
