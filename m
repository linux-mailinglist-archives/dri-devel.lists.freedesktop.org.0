Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2493D7176BF
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 08:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAA9610E481;
	Wed, 31 May 2023 06:20:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::601])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9570B10E480;
 Wed, 31 May 2023 06:20:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CB8unUazO/eCz/S4oscmiZV+2UAz0Y0jXi6lB3XRIEImksnzkS9d/hcBPI8hLDYGvdBgsxNb9MoKXeBx9D46Xm4KVxrcePmaC7JI8ZIRgA1A4wLy3KToBZtHNsm5EsEg03IcvvcEa35uVwvAAB/478S472/OjL421ZTDuvqu91vo7BV0Gujq8zWw3GX7QAZ5LMEDHhN6BXMhwEKHrMID3do9GNgZy3vgvW/d3KsdBYKGUzB5Diq+QvMOOqyO2qbJuAioGvjCrsJiYxlr36vdTVwvjwxM9/zq0MEPvlVUinBNLAN/Qs67iy9l8F1PHXPcXnQVkLlgIWEflVx72pg12w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EtH9iS+6pLTH6RmiGAMlJbye8gPj4AN+4i7X6IHnghI=;
 b=cFHel4OPz3CwZhuoXiAw8Lp5c5eEtjPq3uRp24s1XO0xHgleyGH/mccA7MZuK9v9JsvG8TEMeCDAk23vw9ca9EjtmNNomkhtfp+SUF/qbAduU0CqtsA/9OaI06Ug54HSA4O2ftaCNVaLfYCJLd4PEG5ye3LPVROmSCy7vbPG3261dvzl5lXu24AwWxvgX0i12fND9yHZp3oZM3tcykN2jk4G6p9mtW+p3VRggqh69f4QjdBegRf+xQrCrAvWvYL9OzRH1aRp0+2ByyA1uUeEIYLKXnwFc2l7Y+Rohqq2p/MIxO7d9nNdBi/FE4tZzbR3GFtiBgZ4nk7q7FJXkGGOHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EtH9iS+6pLTH6RmiGAMlJbye8gPj4AN+4i7X6IHnghI=;
 b=VViX665jVCAHXCspMp6mTyvFew2v+gc4nbqWZ87oYInnplETHcRBofD9S+4ECRVLE4PXoftWUKO095tkO52OUQfjR2YOap1tL3nXb/WQQrXO9WYsvME22eFli3ClaBi9/G7mLtG+qrUa/62bqjtXm6kOBaNH+6RC3SMX5njVScU=
Received: from DM5PR12MB2469.namprd12.prod.outlook.com (2603:10b6:4:af::38) by
 DM8PR12MB5464.namprd12.prod.outlook.com (2603:10b6:8:3d::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.24; Wed, 31 May 2023 06:20:28 +0000
Received: from DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::33d9:b6ae:36f1:e374]) by DM5PR12MB2469.namprd12.prod.outlook.com
 ([fe80::33d9:b6ae:36f1:e374%3]) with mapi id 15.20.6433.022; Wed, 31 May 2023
 06:20:28 +0000
From: "Chen, Guchun" <Guchun.Chen@amd.com>
To: "Ma, Jun" <Jun.Ma2@amd.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "Koenig, Christian"
 <Christian.Koenig@amd.com>
Subject: RE: [PATCH v2] drm/ttm: Remove redundant code in ttm_tt_init_fields
Thread-Topic: [PATCH v2] drm/ttm: Remove redundant code in ttm_tt_init_fields
Thread-Index: AQHZk4EqqUSazlFR00CVvRSYWcqiTq9z6D6g
Date: Wed, 31 May 2023 06:20:28 +0000
Message-ID: <DM5PR12MB246916A813942FA00CBF5978F1489@DM5PR12MB2469.namprd12.prod.outlook.com>
References: <20230531053051.3453509-1-Jun.Ma2@amd.com>
In-Reply-To: <20230531053051.3453509-1-Jun.Ma2@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ActionId=a84e9eac-616b-4a48-95fe-2d752c943d85;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_ContentBits=0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Enabled=true;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Method=Privileged;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_Name=Public-AIP
 2.0;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SetDate=2023-05-31T06:20:06Z;
 MSIP_Label_d4243a53-6221-4f75-8154-e4b33a5707a1_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR12MB2469:EE_|DM8PR12MB5464:EE_
x-ms-office365-filtering-correlation-id: bd3484c0-6603-46b6-f74d-08db619f20e5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TlrzY/5O2XjYkutxT2e8ixDcbYV1WAG6GATS/mOTcc/fnuQ/67SWYSC1xfSkTjBw+/z0OKdlrP6QIOZo569esTdY76FYmgRzyZAlEBKDI7MwUzq0WnNxrLaAbq6jl8ZYyQrf3xEmw6wIC8Cv2FpgIf6CICwgHg4JwwqL9Wm4bjxj3kHxNd1Vrun//CYucGNyH5v+bTmR0imasQjHuZz6MGax0COlpKLGkDcDZrOVu9ax0YZErWqPheCakyejIRRec9sZ3yMO9rsHfNqpO92v0ZxPs/ud+NBcPhpv8Vni6G04znUA+az2GjB78+fStVrXB5ktfqhtz1wkb1ZLh70umI9tppgd7o+N5xGsrDtt51kqTu2I9b5SCf7hoaJZBt67HnOVwKqLwI1cuqbW4wnudwogS3ii0JM1xrDqOMqBY1MFEF8Zy9FU3jQhbx2s85gvO/laoeVIBqviBqVmZWOM4lKM9c9yhdcLPkeOnNKL2MzIodKsO87LqWVyM1co9dTuihc09dSp+r9zTqr6NE2vW3/94LXEEWyZ3/wGdHNzlRse7dbCORcc2pDieBtvLPvOObizqKEHb63camq2/NlmC39WkYdxi+DG6hlKEdgN6I5i9+ov5lK3/gxoRqLjVUOK
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB2469.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(346002)(366004)(376002)(39860400002)(451199021)(83380400001)(86362001)(76116006)(66556008)(66476007)(66446008)(64756008)(66946007)(186003)(4326008)(6636002)(450100002)(38070700005)(2906002)(26005)(9686003)(53546011)(6506007)(8676002)(8936002)(33656002)(38100700002)(52536014)(5660300002)(7696005)(55016003)(478600001)(41300700001)(71200400001)(122000001)(316002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Emoo96xvXI0SSdh5O3IXSzwo+EBPRP0Kh905qJzTBoPrwGZy0fpxq7h13+Bo?=
 =?us-ascii?Q?Bs8MLBxGNf0cf4q5ug8s6b2fAmKVXt742dOU4sYaSVPhwXA4ZKQwnmx6W5bX?=
 =?us-ascii?Q?vAyBT2mcy7nN94ScmOATt4uXbQFkKnDI+sZnBFCjSRRk6E6ij6HGcTgQ4Rgs?=
 =?us-ascii?Q?oXCAdfTnYTyZT8MHnc1Ci6xaZU/AZcndugpYlkSqZ8Oxy+8LIWHCAehQfSGp?=
 =?us-ascii?Q?3vSA0K/wI7Ie9b4eJ22V1/NrHKytX1DFOFAtBqT8my1eOYzvs+WvrIwDqF38?=
 =?us-ascii?Q?mynCtRlpJIixlrHHzbt+9kzvxNKdN0oukv9pFstu0HKMsgLCg/KvXWmqVSYn?=
 =?us-ascii?Q?zn75M2q/ktZiIohJtonA/d9mmrUv4Mj0u3NKx7iTbQUSaHMD1K4rgH8csnJt?=
 =?us-ascii?Q?WyubEql7liHd/AgLxWoaADlwC5Gmr83Ixhn3/ub5IMaKYH4aAl5UtiCZLnHb?=
 =?us-ascii?Q?NrB1xbI8k+bZO8GpDVc6TucuMBTMderO97e243r2hNc7a6e3mlmyaGticBp8?=
 =?us-ascii?Q?1D1YysXOR9czqzo80sGGOEJ/bcaTi75CNJY0xaSHmvzy48Pkc/mVdb0jUo8n?=
 =?us-ascii?Q?224FH8x7Llvyyru9LDRBBjnOHMIfInP0l5igbIhr5a2LyFkUhKRWf/PAcYiC?=
 =?us-ascii?Q?D0f7QE82N6GKgMTDwK9Vy4OFxLetUvlIUaBRURs/vDWroxAXqvFDypIa00oY?=
 =?us-ascii?Q?cepPnfhBfy/Lw87cI+1kU1jTNwGepD6SwMT7Ie2GzYXKyQQfY8ogSsyfKlE1?=
 =?us-ascii?Q?g5qrvALKbuQh6yvisfSxNyF8PWzDDcpCL2Xf363ZxrIW9GHvhIhLelVZHkLE?=
 =?us-ascii?Q?syaYrBvBUTwx2XnINzowYc7nF67zZK7ZHnI6GukI3lkKmopCwAPHuffjrXIM?=
 =?us-ascii?Q?MX815izeTJ9YGCfOHg70g21PxqifjBYqC9gdt/3k53HAdQbHLJpjJUUKcLDW?=
 =?us-ascii?Q?8o0bbIm7FR5ZhwErFjLVW0J8PJ3mgWJvS3dfZc1glwoTWmBvRF6SwKFcMHUl?=
 =?us-ascii?Q?LEscWyy5btfG42dcumaDawDXjJKD8uMFdG/tK9XJD/BSB3kYFqKo2CWGnprX?=
 =?us-ascii?Q?xiwY89e3Kzk3OaZogRsTPen6gWcghsFN0QfNrFckj+7iIK+JqxcYp6wmKcL7?=
 =?us-ascii?Q?6TK7jLaaVYdsV7Nt4INYVcEwCv+wLAVrEMv8BuNNiKiyvjQzwzDcQP9ajR/C?=
 =?us-ascii?Q?FPWwP9YWiruzCXF/xIWnsgvrWipUJq0QClFB/xeGBhF9OXUm1XnRh97EOOh7?=
 =?us-ascii?Q?SGOdi4ajqjQD3F/3Aym42Zi5HGu+Eef9V4hF8LU78e7gIfhymtwr7elR3Jtc?=
 =?us-ascii?Q?dKA+VMcJKg56ud/2owS8reykqL42y2wVKl4dY+/uXyH+SwGUsGBJhHt3EXIj?=
 =?us-ascii?Q?71hyXEVccnVRolrcoxDj9jLUADsupMxGnth0G2kEqA+4ID8tcCpjGJMNt91H?=
 =?us-ascii?Q?ntom0J6MpQHIkwf/0b75eoBC0cjCOgAdJJ2uy9+7VTtpz8M0Z4K+BTlImivw?=
 =?us-ascii?Q?ymon87EPYw6r7D9zIUdAAbLlxGn0KlNS4yQTIgdpS04bEonxV6RzZPygXBfL?=
 =?us-ascii?Q?xdlVT+mNKjRw21Fil24=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB2469.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd3484c0-6603-46b6-f74d-08db619f20e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2023 06:20:28.2240 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oyMGRSvnquvKjpKshxlYMh1dAOq5DYJ22kscxGH65Wm1u0AHksiaYvAyzphFjyNmYiNXVx7Xex1C01jc4qL3mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5464
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
Cc: "Ma, Jun" <Jun.Ma2@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Public]

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Ma
> Jun
> Sent: Wednesday, May 31, 2023 1:31 PM
> To: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Koeni=
g,
> Christian <Christian.Koenig@amd.com>
> Cc: Ma, Jun <Jun.Ma2@amd.com>
> Subject: [PATCH v2] drm/ttm: Remove redundant code in ttm_tt_init_fields
>
> Remove redundant assignment code for ttm->caching as it's overwritten
>
> just a few lines later.

Please drop the blank line in above message. With it fixed, the patch is: R=
eviewed-by: Guchun Chen <guchun.chen@amd.com>

Regards,
Guchun

> v2:
>  - Update the commit message.
>
> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_tt.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 02b812dacc5d..45a44544b656 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -143,7 +143,6 @@ static void ttm_tt_init_fields(struct ttm_tt *ttm,
>                              unsigned long extra_pages)
>  {
>       ttm->num_pages =3D (PAGE_ALIGN(bo->base.size) >> PAGE_SHIFT) +
> extra_pages;
> -     ttm->caching =3D ttm_cached;
>       ttm->page_flags =3D page_flags;
>       ttm->dma_address =3D NULL;
>       ttm->swap_storage =3D NULL;
> --
> 2.34.1

