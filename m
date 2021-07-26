Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C383D6387
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 18:39:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF6372E9D;
	Mon, 26 Jul 2021 16:39:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEDFE72E92;
 Mon, 26 Jul 2021 16:39:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NVQ3GDz+EZqvl/nyd1+qxIi6tKyjx/K4OuG76zcYFqhWXkwt39ughKRwuGm601dMboceYtNfj3cEMzL7jidfcn9pMybrR2qbOMbBxuXSTTr/mxnoY9OSZXjJ9hy4n9wgMirPkBlDRzNKklnx2XvuA11ES1+z5XoddvU/hmOfMgJYjhaojG1sWZIsQtno2lImaeoHFAemT4Ql5ZPo5mEBEAu1NEMQVwSogbRKipzRRgdqFboOkk5fTEtd9mO/zMi278CxNHP/x1aeyo/pLYIz2Z+1TbFx32y2MQS/4FZ49srUD567Hi/IPZwgg5dsiTj5ose+EhdWxHFaK+tBMvJyaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8j2I+F211HCsgBC2Pff946lgrAqspesh4ez+6hR2apY=;
 b=fnAMwQGu0UUbznFJ5MlvEWV6xMVejhq1MuWfqsFN1cttRuzHian1ovcFA2AVwnm0TGKIHYh1E/aGYcq8fCtOog2UElyfEmoNlv38c0snp4FXe4spxBuhGxilrtp3YLTLJ8wuZIuDVldUkcP2BzASAyzsrf+hcVdP/lkN9jC+U5tOIaWUbXoa0wJwpov4qtyJ3Pr7q84+yhJEkzm85ktd/8VcGvkec0iARuTux8cQd42ZEq6kcUzIzqeB6qreXYrvK2aI9EXAyZG3PrnK39sC7Icy9dd+eMqTu3G0tmnTAJjyE18NRFk7xrmubLNy/zzieQXdc75lqMM8SS0a5AZLQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8j2I+F211HCsgBC2Pff946lgrAqspesh4ez+6hR2apY=;
 b=ivVFrFnC79NL5U/Cv2KImcjhtfUq2ocsqrMq26+MvldX2n14jE4z8+IztDdZVP1K/jAwWGBeTaxdHPn2HXNx3AM+1BG+9mFfWuvKdZk8jKmAvzmwXetRDgxdImPpnbrpZP1j5ndUXL+rA+CNxPJgCjslCR9pQZEVvY/bBhiBiiY=
Received: from MN2PR12MB3232.namprd12.prod.outlook.com (2603:10b6:208:ab::29)
 by MN2PR12MB2990.namprd12.prod.outlook.com (2603:10b6:208:cc::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Mon, 26 Jul
 2021 16:39:35 +0000
Received: from MN2PR12MB3232.namprd12.prod.outlook.com
 ([fe80::6069:6779:c25:af69]) by MN2PR12MB3232.namprd12.prod.outlook.com
 ([fe80::6069:6779:c25:af69%6]) with mapi id 15.20.4331.034; Mon, 26 Jul 2021
 16:39:35 +0000
From: "Taylor, Ryan" <Ryan.Taylor@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "Chen, Guchun" <Guchun.Chen@amd.com>
Subject: Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)
Thread-Topic: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)
Thread-Index: AQHXflLkCy71la2rCUa2W87adSo8CKtQokmAgADCeoCABBMNAIAABAwV
Date: Mon, 26 Jul 2021 16:39:35 +0000
Message-ID: <MN2PR12MB32321AC70CD4369076E74E4FEAE89@MN2PR12MB3232.namprd12.prod.outlook.com>
References: <20210721170705.4201-1-Ryan.Taylor@amd.com>
 <20210721170705.4201-2-Ryan.Taylor@amd.com>
 <CADnq5_NYP4Gp7DntrnSaSGHuZYzSs_1DfMAjUQv+ksE1jJ9ohw@mail.gmail.com>
 <DM5PR12MB2469E019BB91B58EA547B628F1E69@DM5PR12MB2469.namprd12.prod.outlook.com>,
 <CADnq5_OnYuMrZ_s6XtYQeJR1dgqdoC4rnv5DKc3h4hEo0k+RVQ@mail.gmail.com>
In-Reply-To: <CADnq5_OnYuMrZ_s6XtYQeJR1dgqdoC4rnv5DKc3h4hEo0k+RVQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=True;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-07-26T16:39:34.964Z;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD
 Official Use
 Only; MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard; 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d5aa6013-ef12-409f-34f4-08d95053f3fa
x-ms-traffictypediagnostic: MN2PR12MB2990:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB29907A1282C4A4F19B69E6B1EAE89@MN2PR12MB2990.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KBNv6EpCcl56wuTtHhC3gkObsH8xSHADgUgC3WhZ26apG2AvNllIGLxmH2wsrvP6/6pgXMWp7AR4EkwZKm6jqtDlH51XorrEX0XBQuidZSrj43XcfV7bbpvONJe2FXru7KQ6Z2NfxknhB6Iko/ITY5ivmU3KuiguufGg83rYQ8G4L0U32IIwuoRq/Bff72OUsS6ef2kvcPYcRkirROqOraTG7kjIcRcmNcjLBrMdxRWN7jnKAsoezwVUC6CcY/f8QLWxwGuCdfpIUGco2+HaZAId0DNH1jI5k1QfWcLKndz3u0K6+5q+Yxwr+e4LTJDkYgUmfYUtkWTuXsNizwmpUQY/qbyC3MumvlbfuHA/F6kgM1NpZZdg5cUJA2VloauyY2Lndev7JhsOKg2/qlAcdUyroglVi8rXa8kZbBTtlMt7Fm3oqWOgJ7Y/Dh7U9NzeEwOAOEk+PAVxVV7Vfx29VophTsXT++nOrr5qHg4dh4UWgdma7cCjv0GfHXuJe08JgZ1l+VIc6083lwtiXQLbniiQNLqBNEwP7C52adz8i9IDHsZLQEy8nLavMlBaFqYkao/o1WkJqgjGIYkEZOkbt6gGsdmo5EWhT7SjlVUKr8xvDqPnjceyOlHwLVsa1QY81anX++ug6pVnURx7BuoyT0jcCtomM09B4zT481xXEuKeZcq9a7Mikm3Qbnb445MIvHSzJlecjP8a79GJdgq6DnK7P0p5dMjY/0f+WV5wq+MC98ML/OWXMzUb+H4PGVqSZFZraN4W9T+4Hu0mAXweU9ZPpkjocsvT/NtznM5P/jk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3232.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(366004)(30864003)(9686003)(316002)(166002)(122000001)(83380400001)(8936002)(2906002)(6506007)(110136005)(76116006)(53546011)(71200400001)(54906003)(64756008)(66476007)(45080400002)(7696005)(38100700002)(5660300002)(8676002)(52536014)(33656002)(6636002)(186003)(86362001)(66946007)(66446008)(66556008)(19627405001)(966005)(55016002)(4326008)(478600001)(38070700004)(579004)(559001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Ag1YRzTBFkyD6PN2ugaliClQ+YyF+62ulBxCFrG+x/fBRjYnjU085kS2ftFA?=
 =?us-ascii?Q?0jjSb1m1Ka4lG9mv/EzTTP/WOTRRIxljw1kCSaN3Nb74ku8MLM/eehJWiF2w?=
 =?us-ascii?Q?LR3PNgY8f6DUyE72Slcw3hv5ss1lZNl7SN7cpijTabP3ivIty49qCxK5H7Xf?=
 =?us-ascii?Q?GoU8vj79jVSMJ5vcL53zRY2mO538sSQnuH+kFRS/b4PLqBQM8TbJb3jN+qom?=
 =?us-ascii?Q?NJ/X61XVY7fM3ziQynY+yuFDjgeU6thouJDcmU8k4hh5U/VfBi/GBBMDoweh?=
 =?us-ascii?Q?0CmzWGM0CreaXgScOPTRTpGLyWfnzqJgZQO1EGGupma2KbFV9Mz67wxyadgE?=
 =?us-ascii?Q?kLTFC0gDhhFkOXWhSbFM40VUE09MsDyQObPvdbdg57yLwqLqbM1v8FRf+gts?=
 =?us-ascii?Q?5ONSSwBrVmlIMyetBBfOrHAcAK2Sy+Dih1JAuAVil3GBSvTbOppP3vuuyoJ2?=
 =?us-ascii?Q?LjkBEYYaffxfexUcxr1Nu3Tn6zkKilTuTgDMg3whDUX0qLmvY7mTXf7Yh76k?=
 =?us-ascii?Q?7EQtNztBWWsz7mLlfM5e/yAQeYELGHtXpWetmR3f7uQK6xGTns0hOyERwA8C?=
 =?us-ascii?Q?uB667AVpqWXJOzYQsc5KgyFBszMb4Gt7vxkj8/wzgJ9rc5H0VNH9jjV1eTfe?=
 =?us-ascii?Q?mW8L1qEYJwl1Bgrc+cTUsIiN4ffVn65MWkCg7g+FqIVXABZBae95NECXmLGB?=
 =?us-ascii?Q?I7o439MSbZhATc7OEFecmZnk7Dd/ntimsazAbznXHTdiYdzCwv4+KoQnnE2+?=
 =?us-ascii?Q?yMI1JfP8YChICtAjgGHZqqEvMtDLLaaoYtH30YhWE/MiuoNPaFysP96NbYY4?=
 =?us-ascii?Q?TmY9MiRQ790a8PfpEMh66qxH2fJBeVU6mEo8mELfxBePbXy/56DtJfFyi7uC?=
 =?us-ascii?Q?pcb8Dgf36hFixmh+Gs+SrPUOCM92sZca3Enl6+QsfuiF82L8lPf7tIAu+UbM?=
 =?us-ascii?Q?mGhsxQSI9XJpaIi4HDRA/XppV6GrB+Z0h58xTg+HvzPkdeUoMT8g3/kdHN/2?=
 =?us-ascii?Q?A9OLC8ukw7HmltZKh771lUuIkr+05/18hnm94HvUKVRmFYd9ukiSuVt6+ZNZ?=
 =?us-ascii?Q?b6FuODRah8qLlpY71eEXvk2FaZPL2KsTX+ULzhQ9lSe47IBlg2JEcGCiNzY/?=
 =?us-ascii?Q?pXWmZoSuvkiwn6wfmCSgfDTF+mvUk7+2MmAA/3aY08gOIpFtJ3wPZp0rVJGF?=
 =?us-ascii?Q?YtJYE9yaIIZ21AEvyb4XLBANFqqfOyEe2MTE+RBuJaKG4DCegEKg/e8kVVQw?=
 =?us-ascii?Q?A2QJH/KI5L+4/xKKM5weJzn0TO5Yh7ZlMa81rE31OL1nTHjyiyn/1ti6RcUJ?=
 =?us-ascii?Q?bYMXRfQg5dxPeFZT/ONaH9Bw/nTGMDEZ3sq+BIP0COfVuuLn6P8AqL3HXylE?=
 =?us-ascii?Q?Ot9Hykg=3D?=
Content-Type: multipart/alternative;
 boundary="_000_MN2PR12MB32321AC70CD4369076E74E4FEAE89MN2PR12MB3232namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3232.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5aa6013-ef12-409f-34f4-08d95053f3fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 16:39:35.4165 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rglTh8n1UsGTaMrYQPlUWT13Gy+xKhh5nTA+efiocSR3p6uOt2+NprELjcYtI6+Eh2wj7rVng5Jripnj+u6YcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB2990
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
Cc: kernel test robot <lkp@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--_000_MN2PR12MB32321AC70CD4369076E74E4FEAE89MN2PR12MB3232namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only]

Given that amdgpu_vkms contains code from both dce_virtual and vkms should =
the identifier be changed to GPL-2.0+ OR MIT like in amdgpu_res_cursor.h?

Best,
Ryan
________________________________
From: Alex Deucher <alexdeucher@gmail.com>
Sent: Monday, July 26, 2021 9:21 AM
To: Chen, Guchun <Guchun.Chen@amd.com>
Cc: Taylor, Ryan <Ryan.Taylor@amd.com>; kernel test robot <lkp@intel.com>; =
Daniel Vetter <daniel.vetter@ffwll.ch>; Siqueira, Rodrigo <Rodrigo.Siqueira=
@amd.com>; amd-gfx list <amd-gfx@lists.freedesktop.org>; Melissa Wen <melis=
sa.srw@gmail.com>; Maling list - DRI developers <dri-devel@lists.freedeskto=
p.org>
Subject: Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)

On Fri, Jul 23, 2021 at 10:07 PM Chen, Guchun <Guchun.Chen@amd.com> wrote:
>
> [Public]
>
> Look copy right statement is missed in both amdgpu_vkms.c and amdgpu_vkms=
.h.

It's there, it just uses the newer SPDX license identifier.

Alex


>
> Regards,
> Guchun
>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Alex D=
eucher
> Sent: Friday, July 23, 2021 10:32 PM
> To: Taylor, Ryan <Ryan.Taylor@amd.com>
> Cc: kernel test robot <lkp@intel.com>; Daniel Vetter <daniel.vetter@ffwll=
.ch>; Siqueira, Rodrigo <Rodrigo.Siqueira@amd.com>; amd-gfx list <amd-gfx@l=
ists.freedesktop.org>; Melissa Wen <melissa.srw@gmail.com>; Maling list - D=
RI developers <dri-devel@lists.freedesktop.org>
> Subject: Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)
>
> On Wed, Jul 21, 2021 at 1:07 PM Ryan Taylor <Ryan.Taylor@amd.com> wrote:
> >
> > Modify the VKMS driver into an api that dce_virtual can use to create
> > virtual displays that obey drm's atomic modesetting api.
> >
> > v2: Made local functions static.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Signed-off-by: Ryan Taylor <Ryan.Taylor@amd.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/Makefile      |   1 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu.h      |   1 +
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  |   2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c   |   2 +-
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 411
> > +++++++++++++++++++++++  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h |
> > 29 ++  drivers/gpu/drm/amd/amdgpu/dce_virtual.c |  23 +-
> >  7 files changed, 458 insertions(+), 11 deletions(-)  create mode
> > 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> >  create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile
> > b/drivers/gpu/drm/amd/amdgpu/Makefile
> > index f089794bbdd5..30cbcd5ce1cc 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/Makefile
> > +++ b/drivers/gpu/drm/amd/amdgpu/Makefile
> > @@ -120,6 +120,7 @@ amdgpu-y +=3D \
> >  amdgpu-y +=3D \
> >         dce_v10_0.o \
> >         dce_v11_0.o \
> > +       amdgpu_vkms.o \
> >         dce_virtual.o
> >
> >  # add GFX block
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > index 54cf647bd018..d0a2f2ed433d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
> > @@ -919,6 +919,7 @@ struct amdgpu_device {
> >
> >         /* display */
> >         bool                            enable_virtual_display;
> > +       struct amdgpu_vkms_output       *amdgpu_vkms_output;
> >         struct amdgpu_mode_info         mode_info;
> >         /* For pre-DCE11. DCE11 and later are in "struct amdgpu_device-=
>dm" */
> >         struct work_struct              hotplug_work;
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > index d0c935cf4f0f..1b016e5bc75f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> > @@ -1230,7 +1230,7 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
> >         int ret, retry =3D 0;
> >         bool supports_atomic =3D false;
> >
> > -       if (!amdgpu_virtual_display &&
> > +       if (amdgpu_virtual_display ||
> >             amdgpu_device_asic_has_dc_support(flags & AMD_ASIC_MASK))
> >                 supports_atomic =3D true;
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> > index 09b048647523..5a143ca02cf9 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c
> > @@ -344,7 +344,7 @@ int amdgpu_fbdev_init(struct amdgpu_device *adev)
> >         }
> >
> >         /* disable all the possible outputs/crtcs before entering KMS m=
ode */
> > -       if (!amdgpu_device_has_dc_support(adev))
> > +       if (!amdgpu_device_has_dc_support(adev) &&
> > + !amdgpu_virtual_display)
> >
> > drm_helper_disable_unused_functions(adev_to_drm(adev));
> >
> >         drm_fb_helper_initial_config(&rfbdev->helper, bpp_sel); diff
> > --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > new file mode 100644
> > index 000000000000..d5c1f1c58f5f
> > --- /dev/null
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> > @@ -0,0 +1,411 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +
> > +#include <drm/drm_atomic_helper.h>
> > +#include <drm/drm_simple_kms_helper.h> #include <drm/drm_vblank.h>
> > +
> > +#include "amdgpu.h"
> > +#include "amdgpu_vkms.h"
> > +#include "amdgpu_display.h"
> > +
> > +/**
> > + * DOC: amdgpu_vkms
> > + *
> > + * The amdgpu vkms interface provides a virtual KMS interface for
> > +several use
> > + * cases: devices without display hardware, platforms where the
> > +actual display
> > + * hardware is not useful (e.g., servers), SR-IOV virtual functions,
> > +device
> > + * emulation/simulation, and device bring up prior to display
> > +hardware being
> > + * usable. We previously emulated a legacy KMS interface, but there
> > +was a desire
> > + * to move to the atomic KMS interface. The vkms driver did
> > +everything we
> > + * needed, but we wanted KMS support natively in the driver without
> > +buffer
> > + * sharing and the ability to support an instance of VKMS per device.
> > +We first
> > + * looked at splitting vkms into a stub driver and a helper module
> > +that other
> > + * drivers could use to implement a virtual display, but this
> > +strategy ended up
> > + * being messy due to driver specific callbacks needed for buffer mana=
gement.
> > + * Ultimately, it proved easier to import the vkms code as it mostly
> > +used core
> > + * drm helpers anyway.
> > + */
> > +
> > +static const u32 amdgpu_vkms_formats[] =3D {
> > +       DRM_FORMAT_XRGB8888,
> > +};
> > +
> > +static enum hrtimer_restart amdgpu_vkms_vblank_simulate(struct
> > +hrtimer *timer) {
> > +       struct amdgpu_vkms_output *output =3D container_of(timer,
> > +                                                        struct amdgpu_=
vkms_output,
> > +                                                        vblank_hrtimer=
);
> > +       struct drm_crtc *crtc =3D &output->crtc;
> > +       u64 ret_overrun;
> > +       bool ret;
> > +
> > +       ret_overrun =3D hrtimer_forward_now(&output->vblank_hrtimer,
> > +                                         output->period_ns);
> > +       WARN_ON(ret_overrun !=3D 1);
> > +
> > +       ret =3D drm_crtc_handle_vblank(crtc);
> > +       if (!ret)
> > +               DRM_ERROR("amdgpu_vkms failure on handling vblank");
> > +
> > +       return HRTIMER_RESTART;
> > +}
> > +
> > +static int amdgpu_vkms_enable_vblank(struct drm_crtc *crtc) {
> > +       struct drm_device *dev =3D crtc->dev;
> > +       unsigned int pipe =3D drm_crtc_index(crtc);
> > +       struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> > +       struct amdgpu_vkms_output *out =3D
> > +drm_crtc_to_amdgpu_vkms_output(crtc);
> > +
> > +       drm_calc_timestamping_constants(crtc, &crtc->mode);
> > +
> > +       hrtimer_init(&out->vblank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MOD=
E_REL);
> > +       out->vblank_hrtimer.function =3D &amdgpu_vkms_vblank_simulate;
> > +       out->period_ns =3D ktime_set(0, vblank->framedur_ns);
> > +       hrtimer_start(&out->vblank_hrtimer, out->period_ns,
> > + HRTIMER_MODE_REL);
> > +
> > +       return 0;
> > +}
> > +
> > +static void amdgpu_vkms_disable_vblank(struct drm_crtc *crtc) {
> > +       struct amdgpu_vkms_output *out =3D
> > +drm_crtc_to_amdgpu_vkms_output(crtc);
> > +
> > +       hrtimer_cancel(&out->vblank_hrtimer);
> > +}
> > +
> > +static bool amdgpu_vkms_get_vblank_timestamp(struct drm_crtc *crtc,
> > +                                            int *max_error,
> > +                                            ktime_t *vblank_time,
> > +                                            bool in_vblank_irq) {
> > +       struct drm_device *dev =3D crtc->dev;
> > +       unsigned int pipe =3D crtc->index;
> > +       struct amdgpu_vkms_output *output =3D drm_crtc_to_amdgpu_vkms_o=
utput(crtc);
> > +       struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
> > +
> > +       if (!READ_ONCE(vblank->enabled)) {
> > +               *vblank_time =3D ktime_get();
> > +               return true;
> > +       }
> > +
> > +       *vblank_time =3D READ_ONCE(output->vblank_hrtimer.node.expires)=
;
> > +
> > +       if (WARN_ON(*vblank_time =3D=3D vblank->time))
> > +               return true;
> > +
> > +       /*
> > +        * To prevent races we roll the hrtimer forward before we do an=
y
> > +        * interrupt processing - this is how real hw works (the interr=
upt is
> > +        * only generated after all the vblank registers are updated) a=
nd what
> > +        * the vblank core expects. Therefore we need to always correct=
 the
> > +        * timestampe by one frame.
> > +        */
> > +       *vblank_time -=3D output->period_ns;
> > +
> > +       return true;
> > +}
> > +
> > +static const struct drm_crtc_funcs amdgpu_vkms_crtc_funcs =3D {
> > +       .set_config             =3D drm_atomic_helper_set_config,
> > +       .destroy                =3D drm_crtc_cleanup,
> > +       .page_flip              =3D drm_atomic_helper_page_flip,
> > +       .reset                  =3D drm_atomic_helper_crtc_reset,
> > +       .atomic_duplicate_state =3D drm_atomic_helper_crtc_duplicate_st=
ate,
> > +       .atomic_destroy_state   =3D drm_atomic_helper_crtc_destroy_stat=
e,
> > +       .enable_vblank          =3D amdgpu_vkms_enable_vblank,
> > +       .disable_vblank         =3D amdgpu_vkms_disable_vblank,
> > +       .get_vblank_timestamp   =3D amdgpu_vkms_get_vblank_timestamp,
> > +};
> > +
> > +static void amdgpu_vkms_crtc_atomic_enable(struct drm_crtc *crtc,
> > +                                          struct drm_atomic_state
> > +*state) {
> > +       drm_crtc_vblank_on(crtc);
> > +}
> > +
> > +static void amdgpu_vkms_crtc_atomic_disable(struct drm_crtc *crtc,
> > +                                           struct drm_atomic_state
> > +*state) {
> > +       drm_crtc_vblank_off(crtc);
> > +}
> > +
> > +static void amdgpu_vkms_crtc_atomic_flush(struct drm_crtc *crtc,
> > +                                         struct drm_atomic_state
> > +*state) {
> > +       if (crtc->state->event) {
> > +               spin_lock(&crtc->dev->event_lock);
> > +
> > +               if (drm_crtc_vblank_get(crtc) !=3D 0)
> > +                       drm_crtc_send_vblank_event(crtc, crtc->state->e=
vent);
> > +               else
> > +                       drm_crtc_arm_vblank_event(crtc,
> > + crtc->state->event);
> > +
> > +               spin_unlock(&crtc->dev->event_lock);
> > +
> > +               crtc->state->event =3D NULL;
> > +       }
> > +}
> > +
> > +static const struct drm_crtc_helper_funcs amdgpu_vkms_crtc_helper_func=
s =3D {
> > +       .atomic_flush   =3D amdgpu_vkms_crtc_atomic_flush,
> > +       .atomic_enable  =3D amdgpu_vkms_crtc_atomic_enable,
> > +       .atomic_disable =3D amdgpu_vkms_crtc_atomic_disable, };
> > +
> > +static int amdgpu_vkms_crtc_init(struct drm_device *dev, struct drm_cr=
tc *crtc,
> > +                         struct drm_plane *primary, struct drm_plane
> > +*cursor) {
> > +       int ret;
> > +
> > +       ret =3D drm_crtc_init_with_planes(dev, crtc, primary, cursor,
> > +                                       &amdgpu_vkms_crtc_funcs, NULL);
> > +       if (ret) {
> > +               DRM_ERROR("Failed to init CRTC\n");
> > +               return ret;
> > +       }
> > +
> > +       drm_crtc_helper_add(crtc, &amdgpu_vkms_crtc_helper_funcs);
> > +
> > +       return ret;
> > +}
> > +
> > +static const struct drm_connector_funcs amdgpu_vkms_connector_funcs =
=3D {
> > +       .fill_modes =3D drm_helper_probe_single_connector_modes,
> > +       .destroy =3D drm_connector_cleanup,
> > +       .reset =3D drm_atomic_helper_connector_reset,
> > +       .atomic_duplicate_state =3D drm_atomic_helper_connector_duplica=
te_state,
> > +       .atomic_destroy_state =3D
> > +drm_atomic_helper_connector_destroy_state,
> > +};
> > +
> > +static int amdgpu_vkms_conn_get_modes(struct drm_connector
> > +*connector) {
> > +       int count;
> > +
> > +       count =3D drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
> > +       drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
> > +
> > +       return count;
> > +}
> > +
> > +static const struct drm_connector_helper_funcs amdgpu_vkms_conn_helper=
_funcs =3D {
> > +       .get_modes    =3D amdgpu_vkms_conn_get_modes,
> > +};
> > +
> > +static const struct drm_plane_funcs amdgpu_vkms_plane_funcs =3D {
> > +       .update_plane           =3D drm_atomic_helper_update_plane,
> > +       .disable_plane          =3D drm_atomic_helper_disable_plane,
> > +       .destroy                =3D drm_plane_cleanup,
> > +       .reset                  =3D drm_atomic_helper_plane_reset,
> > +       .atomic_duplicate_state =3D drm_atomic_helper_plane_duplicate_s=
tate,
> > +       .atomic_destroy_state   =3D drm_atomic_helper_plane_destroy_sta=
te,
> > +};
> > +
> > +static void amdgpu_vkms_plane_atomic_update(struct drm_plane *plane,
> > +                                           struct drm_plane_state
> > +*old_state) {
> > +       return;
> > +}
> > +
> > +static int amdgpu_vkms_plane_atomic_check(struct drm_plane *plane,
> > +                                         struct drm_plane_state
> > +*state) {
> > +       struct drm_crtc_state *crtc_state;
> > +       bool can_position =3D false;
> > +       int ret;
> > +
> > +       if (!state->fb || WARN_ON(!state->crtc))
> > +               return 0;
> > +
> > +       crtc_state =3D drm_atomic_get_crtc_state(state->state, state->c=
rtc);
> > +       if (IS_ERR(crtc_state))
> > +               return PTR_ERR(crtc_state);
> > +
> > +       ret =3D drm_atomic_helper_check_plane_state(state, crtc_state,
> > +                                                 DRM_PLANE_HELPER_NO_S=
CALING,
> > +                                                 DRM_PLANE_HELPER_NO_S=
CALING,
> > +                                                 can_position, true);
> > +       if (ret !=3D 0)
> > +               return ret;
> > +
> > +       /* for now primary plane must be visible and full screen */
> > +       if (!state->visible && !can_position)
> > +               return -EINVAL;
> > +
> > +       return 0;
> > +}
> > +
> > +static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
> > +                                 struct drm_plane_state *new_state) {
> > +       struct amdgpu_framebuffer *afb;
> > +       struct drm_gem_object *obj;
> > +       struct amdgpu_device *adev;
> > +       struct amdgpu_bo *rbo;
> > +       struct list_head list;
> > +       struct ttm_validate_buffer tv;
> > +       struct ww_acquire_ctx ticket;
> > +       uint32_t domain;
> > +       int r;
> > +
> > +       if (!new_state->fb) {
> > +               DRM_DEBUG_KMS("No FB bound\n");
> > +               return 0;
> > +       }
> > +       afb =3D to_amdgpu_framebuffer(new_state->fb);
> > +       obj =3D new_state->fb->obj[0];
> > +       rbo =3D gem_to_amdgpu_bo(obj);
> > +       adev =3D amdgpu_ttm_adev(rbo->tbo.bdev);
> > +       INIT_LIST_HEAD(&list);
> > +
> > +       tv.bo =3D &rbo->tbo;
> > +       tv.num_shared =3D 1;
> > +       list_add(&tv.head, &list);
> > +
> > +       r =3D ttm_eu_reserve_buffers(&ticket, &list, false, NULL);
> > +       if (r) {
> > +               dev_err(adev->dev, "fail to reserve bo (%d)\n", r);
> > +               return r;
> > +       }
> > +
> > +       if (plane->type !=3D DRM_PLANE_TYPE_CURSOR)
> > +               domain =3D amdgpu_display_supported_domains(adev, rbo->=
flags);
> > +       else
> > +               domain =3D AMDGPU_GEM_DOMAIN_VRAM;
> > +
> > +       r =3D amdgpu_bo_pin(rbo, domain);
> > +       if (unlikely(r !=3D 0)) {
> > +               if (r !=3D -ERESTARTSYS)
> > +                       DRM_ERROR("Failed to pin framebuffer with error=
 %d\n", r);
> > +               ttm_eu_backoff_reservation(&ticket, &list);
> > +               return r;
> > +       }
> > +
> > +       r =3D amdgpu_ttm_alloc_gart(&rbo->tbo);
> > +       if (unlikely(r !=3D 0)) {
> > +               amdgpu_bo_unpin(rbo);
> > +               ttm_eu_backoff_reservation(&ticket, &list);
> > +               DRM_ERROR("%p bind failed\n", rbo);
> > +               return r;
> > +       }
> > +
> > +       ttm_eu_backoff_reservation(&ticket, &list);
> > +
> > +       afb->address =3D amdgpu_bo_gpu_offset(rbo);
> > +
> > +       amdgpu_bo_ref(rbo);
> > +
> > +       return 0;
> > +}
> > +
> > +static void amdgpu_vkms_cleanup_fb(struct drm_plane *plane,
> > +                                  struct drm_plane_state *old_state)
> > +{
> > +       struct amdgpu_bo *rbo;
> > +       int r;
> > +
> > +       if (!old_state->fb)
> > +               return;
> > +
> > +       rbo =3D gem_to_amdgpu_bo(old_state->fb->obj[0]);
> > +       r =3D amdgpu_bo_reserve(rbo, false);
> > +       if (unlikely(r)) {
> > +               DRM_ERROR("failed to reserve rbo before unpin\n");
> > +               return;
> > +       }
> > +
> > +       amdgpu_bo_unpin(rbo);
> > +       amdgpu_bo_unreserve(rbo);
> > +       amdgpu_bo_unref(&rbo);
> > +}
> > +
> > +static const struct drm_plane_helper_funcs amdgpu_vkms_primary_helper_=
funcs =3D {
> > +       .atomic_update          =3D amdgpu_vkms_plane_atomic_update,
> > +       .atomic_check           =3D amdgpu_vkms_plane_atomic_check,
> > +       .prepare_fb             =3D amdgpu_vkms_prepare_fb,
> > +       .cleanup_fb             =3D amdgpu_vkms_cleanup_fb,
> > +};
> > +
> > +static struct drm_plane *amdgpu_vkms_plane_init(struct drm_device *dev=
,
> > +                                               enum drm_plane_type typ=
e,
> > +                                               int index) {
> > +       struct drm_plane *plane;
> > +       int ret;
> > +
> > +       plane =3D kzalloc(sizeof(*plane), GFP_KERNEL);
> > +       if (!plane)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       ret =3D drm_universal_plane_init(dev, plane, 1 << index,
> > +                                      &amdgpu_vkms_plane_funcs,
> > +                                      amdgpu_vkms_formats,
> > +                                      ARRAY_SIZE(amdgpu_vkms_formats),
> > +                                      NULL, type, NULL);
> > +       if (ret) {
> > +               kfree(plane);
> > +               return ERR_PTR(ret);
> > +       }
> > +
> > +       drm_plane_helper_add(plane,
> > + &amdgpu_vkms_primary_helper_funcs);
> > +
> > +       return plane;
> > +}
> > +
> > +int amdgpu_vkms_output_init(struct drm_device *dev,
> > +                           struct amdgpu_vkms_output *output, int
> > +index) {
> > +       struct drm_connector *connector =3D &output->connector;
> > +       struct drm_encoder *encoder =3D &output->encoder;
> > +       struct drm_crtc *crtc =3D &output->crtc;
> > +       struct drm_plane *primary, *cursor =3D NULL;
> > +       int ret;
> > +
> > +       primary =3D amdgpu_vkms_plane_init(dev, DRM_PLANE_TYPE_PRIMARY,=
 index);
> > +       if (IS_ERR(primary))
> > +               return PTR_ERR(primary);
> > +
> > +       ret =3D amdgpu_vkms_crtc_init(dev, crtc, primary, cursor);
> > +       if (ret)
> > +               goto err_crtc;
> > +
> > +       ret =3D drm_connector_init(dev, connector, &amdgpu_vkms_connect=
or_funcs,
> > +                                DRM_MODE_CONNECTOR_VIRTUAL);
> > +       if (ret) {
> > +               DRM_ERROR("Failed to init connector\n");
> > +               goto err_connector;
> > +       }
> > +
> > +       drm_connector_helper_add(connector,
> > + &amdgpu_vkms_conn_helper_funcs);
> > +
> > +       ret =3D drm_simple_encoder_init(dev, encoder, DRM_MODE_ENCODER_=
VIRTUAL);
> > +       if (ret) {
> > +               DRM_ERROR("Failed to init encoder\n");
> > +               goto err_encoder;
> > +       }
> > +       encoder->possible_crtcs =3D 1 << index;
> > +
> > +       ret =3D drm_connector_attach_encoder(connector, encoder);
> > +       if (ret) {
> > +               DRM_ERROR("Failed to attach connector to encoder\n");
> > +               goto err_attach;
> > +       }
> > +
> > +       drm_mode_config_reset(dev);
> > +
> > +       return 0;
> > +
> > +err_attach:
> > +       drm_encoder_cleanup(encoder);
> > +
> > +err_encoder:
> > +       drm_connector_cleanup(connector);
> > +
> > +err_connector:
> > +       drm_crtc_cleanup(crtc);
> > +
> > +err_crtc:
> > +       drm_plane_cleanup(primary);
> > +
> > +       return ret;
> > +}
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> > new file mode 100644
> > index 000000000000..5dab51fbecf3
> > --- /dev/null
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h
> > @@ -0,0 +1,29 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ */
> > +
> > +#ifndef _AMDGPU_VKMS_H_
> > +#define _AMDGPU_VKMS_H_
> > +
> > +#define XRES_DEF  1024
> > +#define YRES_DEF   764
>
> Squash in the 768 fix here.
>
> > +
> > +#define XRES_MAX  16384
> > +#define YRES_MAX  16384
> > +
> > +#define drm_crtc_to_amdgpu_vkms_output(target) \
> > +       container_of(target, struct amdgpu_vkms_output, crtc)
> > +
> > +extern const struct amdgpu_ip_block_version amdgpu_vkms_ip_block;
> > +
> > +struct amdgpu_vkms_output {
> > +       struct drm_crtc crtc;
> > +       struct drm_encoder encoder;
> > +       struct drm_connector connector;
> > +       struct hrtimer vblank_hrtimer;
> > +       ktime_t period_ns;
> > +       struct drm_pending_vblank_event *event; };
> > +
> > +int amdgpu_vkms_output_init(struct drm_device *dev,
> > +                           struct amdgpu_vkms_output *output, int
> > +index);
> > +
> > +#endif /* _AMDGPU_VKMS_H_ */
> > diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> > b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> > index 7e0d8c092c7e..642c77533157 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c
> > @@ -22,6 +22,7 @@
> >   */
> >
> >  #include <drm/drm_vblank.h>
> > +#include <drm/drm_atomic_helper.h>
> >
> >  #include "amdgpu.h"
> >  #include "amdgpu_pm.h"
> > @@ -40,6 +41,7 @@
> >  #include "dce_virtual.h"
> >  #include "ivsrcid/ivsrcid_vislands30.h"
> >  #include "amdgpu_display.h"
> > +#include "amdgpu_vkms.h"
> >
> >  #define DCE_VIRTUAL_VBLANK_PERIOD 16666666
> >
> > @@ -374,6 +376,12 @@ static const struct drm_connector_funcs dce_virtua=
l_connector_funcs =3D {
> >         .force =3D dce_virtual_force,
> >  };
> >
> > +const struct drm_mode_config_funcs dce_virtual_mode_funcs =3D {
> > +       .fb_create =3D amdgpu_display_user_framebuffer_create,
> > +       .atomic_check =3D drm_atomic_helper_check,
> > +       .atomic_commit =3D drm_atomic_helper_commit, };
> > +
> >  static int dce_virtual_sw_init(void *handle)  {
> >         int r, i;
> > @@ -385,10 +393,10 @@ static int dce_virtual_sw_init(void *handle)
> >
> >         adev_to_drm(adev)->max_vblank_count =3D 0;
> >
> > -       adev_to_drm(adev)->mode_config.funcs =3D &amdgpu_mode_funcs;
> > +       adev_to_drm(adev)->mode_config.funcs =3D
> > + &dce_virtual_mode_funcs;
> >
> > -       adev_to_drm(adev)->mode_config.max_width =3D 16384;
> > -       adev_to_drm(adev)->mode_config.max_height =3D 16384;
> > +       adev_to_drm(adev)->mode_config.max_width =3D XRES_MAX;
> > +       adev_to_drm(adev)->mode_config.max_height =3D YRES_MAX;
> >
> >         adev_to_drm(adev)->mode_config.preferred_depth =3D 24;
> >         adev_to_drm(adev)->mode_config.prefer_shadow =3D 1; @@ -399,15
> > +407,11 @@ static int dce_virtual_sw_init(void *handle)
> >         if (r)
> >                 return r;
> >
> > -       adev_to_drm(adev)->mode_config.max_width =3D 16384;
> > -       adev_to_drm(adev)->mode_config.max_height =3D 16384;
> > +       adev->amdgpu_vkms_output =3D kzalloc(sizeof(struct
> > + amdgpu_vkms_output) * adev->mode_info.num_crtc, GFP_KERNEL);
>
> You can use kcalloc here.
>
> >
> >         /* allocate crtcs, encoders, connectors */
> >         for (i =3D 0; i < adev->mode_info.num_crtc; i++) {
> > -               r =3D dce_virtual_crtc_init(adev, i);
> > -               if (r)
> > -                       return r;
> > -               r =3D dce_virtual_connector_encoder_init(adev, i);
> > +               r =3D amdgpu_vkms_output_init(adev_to_drm(adev),
> > + &adev->amdgpu_vkms_output[i], i);
> >                 if (r)
> >                         return r;
> >         }
> > @@ -428,6 +432,7 @@ static int dce_virtual_sw_fini(void *handle)
> >
> > hrtimer_cancel(&adev->mode_info.crtcs[i]->vblank_timer);
> >
> >         kfree(adev->mode_info.bios_hardcoded_edid);
> > +       kfree(adev->amdgpu_vkms_output);
> >
> >         drm_kms_helper_poll_fini(adev_to_drm(adev));
> >
> > --
> > 2.32.0
> >
> > _______________________________________________
> > amd-gfx mailing list
> > amd-gfx@lists.freedesktop.org
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flis=
t
> > s.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7Cg=
u
> > chun.chen%40amd.com%7Ce4b064b3485c4865df8608d94de6a58e%7C3dd8961fe4884
> > e608e11a82d994e183d%7C0%7C0%7C637626475284480052%7CUnknown%7CTWFpbGZsb
> > 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> > 7C1000&amp;sdata=3D0bbTKflaP2RPk%2BpboaNNiwffbEw1pW0zkqcxzPWjzmI%3D&amp=
;
> > reserved=3D0
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D04%7C01%7CRyan.T=
aylor%40amd.com%7Ce0a16eb27da04a035cb608d950516493%7C3dd8961fe4884e608e11a8=
2d994e183d%7C0%7C0%7C637629133975706919%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4=
wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3D=
KCe92Ic79b8lkS6h4GoZhRdhwehzleQrSH8OKlinX8I%3D&amp;reserved=3D0

--_000_MN2PR12MB32321AC70CD4369076E74E4FEAE89MN2PR12MB3232namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0000FF;margin:5pt;" ali=
gn=3D"Left">
[AMD Official Use Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Given that amdgpu_vkms contains code from both dce_virtual and vkms should =
the identifier be changed to GPL-2.0+ OR MIT like in amdgpu_res_cursor.h?</=
div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Best,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Ryan<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Alex Deucher &lt;alex=
deucher@gmail.com&gt;<br>
<b>Sent:</b> Monday, July 26, 2021 9:21 AM<br>
<b>To:</b> Chen, Guchun &lt;Guchun.Chen@amd.com&gt;<br>
<b>Cc:</b> Taylor, Ryan &lt;Ryan.Taylor@amd.com&gt;; kernel test robot &lt;=
lkp@intel.com&gt;; Daniel Vetter &lt;daniel.vetter@ffwll.ch&gt;; Siqueira, =
Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; amd-gfx list &lt;amd-gfx@lists.fr=
eedesktop.org&gt;; Melissa Wen &lt;melissa.srw@gmail.com&gt;; Maling
 list - DRI developers &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Subject:</b> Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Fri, Jul 23, 2021 at 10:07 PM Chen, Guchun &lt;=
Guchun.Chen@amd.com&gt; wrote:<br>
&gt;<br>
&gt; [Public]<br>
&gt;<br>
&gt; Look copy right statement is missed in both amdgpu_vkms.c and amdgpu_v=
kms.h.<br>
<br>
It's there, it just uses the newer SPDX license identifier.<br>
<br>
Alex<br>
<br>
<br>
&gt;<br>
&gt; Regards,<br>
&gt; Guchun<br>
&gt;<br>
&gt; -----Original Message-----<br>
&gt; From: amd-gfx &lt;amd-gfx-bounces@lists.freedesktop.org&gt; On Behalf =
Of Alex Deucher<br>
&gt; Sent: Friday, July 23, 2021 10:32 PM<br>
&gt; To: Taylor, Ryan &lt;Ryan.Taylor@amd.com&gt;<br>
&gt; Cc: kernel test robot &lt;lkp@intel.com&gt;; Daniel Vetter &lt;daniel.=
vetter@ffwll.ch&gt;; Siqueira, Rodrigo &lt;Rodrigo.Siqueira@amd.com&gt;; am=
d-gfx list &lt;amd-gfx@lists.freedesktop.org&gt;; Melissa Wen &lt;melissa.s=
rw@gmail.com&gt;; Maling list - DRI developers &lt;dri-devel@lists.freedesk=
top.org&gt;<br>
&gt; Subject: Re: [PATCH 1/3] drm/amdgpu: create amdgpu_vkms (v2)<br>
&gt;<br>
&gt; On Wed, Jul 21, 2021 at 1:07 PM Ryan Taylor &lt;Ryan.Taylor@amd.com&gt=
; wrote:<br>
&gt; &gt;<br>
&gt; &gt; Modify the VKMS driver into an api that dce_virtual can use to cr=
eate<br>
&gt; &gt; virtual displays that obey drm's atomic modesetting api.<br>
&gt; &gt;<br>
&gt; &gt; v2: Made local functions static.<br>
&gt; &gt;<br>
&gt; &gt; Reported-by: kernel test robot &lt;lkp@intel.com&gt;<br>
&gt; &gt; Signed-off-by: Ryan Taylor &lt;Ryan.Taylor@amd.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; drivers/gpu/drm/amd/amdgpu/Makefile&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt; &gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu.h&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; |&nbsp;&nbsp; 1 +<br>
&gt; &gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c&nbsp; |&nbsp;&nbsp;=
 2 +-<br>
&gt; &gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c&nbsp;&nbsp; |&nbsp;&=
nbsp; 2 +-<br>
&gt; &gt;&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 411<br>
&gt; &gt; +++++++++++++++++++++++&nbsp; drivers/gpu/drm/amd/amdgpu/amdgpu_v=
kms.h |<br>
&gt; &gt; 29 ++&nbsp; drivers/gpu/drm/amd/amdgpu/dce_virtual.c |&nbsp; 23 +=
-<br>
&gt; &gt;&nbsp; 7 files changed, 458 insertions(+), 11 deletions(-)&nbsp; c=
reate mode<br>
&gt; &gt; 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c<br>
&gt; &gt;&nbsp; create mode 100644 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h=
<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; &gt; b/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; &gt; index f089794bbdd5..30cbcd5ce1cc 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/Makefile<br>
&gt; &gt; @@ -120,6 +120,7 @@ amdgpu-y +=3D \<br>
&gt; &gt;&nbsp; amdgpu-y +=3D \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dce_v10_0.o \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dce_v11_0.o \<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_vkms.o \<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dce_virtual.o<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; # add GFX block<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; &gt; index 54cf647bd018..d0a2f2ed433d 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h<br>
&gt; &gt; @@ -919,6 +919,7 @@ struct amdgpu_device {<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* display */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
enable_virtual_display;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vkms_output&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *amdgpu_vkms_output;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_mod=
e_info&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mode_info;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* For pre-DCE11.=
 DCE11 and later are in &quot;struct amdgpu_device-&gt;dm&quot; */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct work_struc=
t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp; hotplug_work;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; &gt; index d0c935cf4f0f..1b016e5bc75f 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c<br>
&gt; &gt; @@ -1230,7 +1230,7 @@ static int amdgpu_pci_probe(struct pci_dev =
*pdev,<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret, retry =
=3D 0;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool supports_ato=
mic =3D false;<br>
&gt; &gt;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_virtual_display=
 &amp;&amp;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (amdgpu_virtual_display =
||<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; amdgpu_device_asic_has_dc_support(flags &amp; AMD_ASIC_MASK))<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; supports_atomic =3D true;<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c<br>
&gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c<br>
&gt; &gt; index 09b048647523..5a143ca02cf9 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fb.c<br>
&gt; &gt; @@ -344,7 +344,7 @@ int amdgpu_fbdev_init(struct amdgpu_device *a=
dev)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* disable all th=
e possible outputs/crtcs before entering KMS mode */<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_device_has_dc_s=
upport(adev))<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!amdgpu_device_has_dc_s=
upport(adev) &amp;&amp;<br>
&gt; &gt; + !amdgpu_virtual_display)<br>
&gt; &gt;<br>
&gt; &gt; drm_helper_disable_unused_functions(adev_to_drm(adev));<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_fb_helper_ini=
tial_config(&amp;rfbdev-&gt;helper, bpp_sel); diff<br>
&gt; &gt; --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c<br>
&gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000000..d5c1f1c58f5f<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c<br>
&gt; &gt; @@ -0,0 +1,411 @@<br>
&gt; &gt; +// SPDX-License-Identifier: GPL-2.0+<br>
&gt; &gt; +<br>
&gt; &gt; +#include &lt;drm/drm_atomic_helper.h&gt;<br>
&gt; &gt; +#include &lt;drm/drm_simple_kms_helper.h&gt; #include &lt;drm/dr=
m_vblank.h&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +#include &quot;amdgpu.h&quot;<br>
&gt; &gt; +#include &quot;amdgpu_vkms.h&quot;<br>
&gt; &gt; +#include &quot;amdgpu_display.h&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +/**<br>
&gt; &gt; + * DOC: amdgpu_vkms<br>
&gt; &gt; + *<br>
&gt; &gt; + * The amdgpu vkms interface provides a virtual KMS interface fo=
r<br>
&gt; &gt; +several use<br>
&gt; &gt; + * cases: devices without display hardware, platforms where the<=
br>
&gt; &gt; +actual display<br>
&gt; &gt; + * hardware is not useful (e.g., servers), SR-IOV virtual functi=
ons,<br>
&gt; &gt; +device<br>
&gt; &gt; + * emulation/simulation, and device bring up prior to display<br=
>
&gt; &gt; +hardware being<br>
&gt; &gt; + * usable. We previously emulated a legacy KMS interface, but th=
ere<br>
&gt; &gt; +was a desire<br>
&gt; &gt; + * to move to the atomic KMS interface. The vkms driver did<br>
&gt; &gt; +everything we<br>
&gt; &gt; + * needed, but we wanted KMS support natively in the driver with=
out<br>
&gt; &gt; +buffer<br>
&gt; &gt; + * sharing and the ability to support an instance of VKMS per de=
vice.<br>
&gt; &gt; +We first<br>
&gt; &gt; + * looked at splitting vkms into a stub driver and a helper modu=
le<br>
&gt; &gt; +that other<br>
&gt; &gt; + * drivers could use to implement a virtual display, but this<br=
>
&gt; &gt; +strategy ended up<br>
&gt; &gt; + * being messy due to driver specific callbacks needed for buffe=
r management.<br>
&gt; &gt; + * Ultimately, it proved easier to import the vkms code as it mo=
stly<br>
&gt; &gt; +used core<br>
&gt; &gt; + * drm helpers anyway.<br>
&gt; &gt; + */<br>
&gt; &gt; +<br>
&gt; &gt; +static const u32 amdgpu_vkms_formats[] =3D {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_FORMAT_XRGB8888,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt; +static enum hrtimer_restart amdgpu_vkms_vblank_simulate(struct<b=
r>
&gt; &gt; +hrtimer *timer) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vkms_output *=
output =3D container_of(timer,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vkms_output,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vblank_hrtimer);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_crtc *crtc =3D &=
amp;output-&gt;crtc;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 ret_overrun;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ret;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret_overrun =3D hrtimer_for=
ward_now(&amp;output-&gt;vblank_hrtimer,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; output-&gt;period_ns);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; WARN_ON(ret_overrun !=3D 1)=
;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_crtc_handle_vbl=
ank(crtc);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!ret)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;amdgpu_vkms failure on handling vblank=
&quot;);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return HRTIMER_RESTART;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static int amdgpu_vkms_enable_vblank(struct drm_crtc *crtc) {<br=
>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D =
crtc-&gt;dev;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int pipe =3D drm_c=
rtc_index(crtc);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_vblank_crtc *vbl=
ank =3D &amp;dev-&gt;vblank[pipe];<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vkms_output *=
out =3D<br>
&gt; &gt; +drm_crtc_to_amdgpu_vkms_output(crtc);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_calc_timestamping_const=
ants(crtc, &amp;crtc-&gt;mode);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hrtimer_init(&amp;out-&gt;v=
blank_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; out-&gt;vblank_hrtimer.func=
tion =3D &amp;amdgpu_vkms_vblank_simulate;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; out-&gt;period_ns =3D ktime=
_set(0, vblank-&gt;framedur_ns);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hrtimer_start(&amp;out-&gt;=
vblank_hrtimer, out-&gt;period_ns,<br>
&gt; &gt; + HRTIMER_MODE_REL);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static void amdgpu_vkms_disable_vblank(struct drm_crtc *crtc) {<=
br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vkms_output *=
out =3D<br>
&gt; &gt; +drm_crtc_to_amdgpu_vkms_output(crtc);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hrtimer_cancel(&amp;out-&gt=
;vblank_hrtimer);<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static bool amdgpu_vkms_get_vblank_timestamp(struct drm_crtc *cr=
tc,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *max_error,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ktime_t *vblank_time,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool in_vblank_irq) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_device *dev =3D =
crtc-&gt;dev;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; unsigned int pipe =3D crtc-=
&gt;index;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_vkms_output *=
output =3D drm_crtc_to_amdgpu_vkms_output(crtc);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_vblank_crtc *vbl=
ank =3D &amp;dev-&gt;vblank[pipe];<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!READ_ONCE(vblank-&gt;e=
nabled)) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; *vblank_time =3D ktime_get();<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return true;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *vblank_time =3D READ_ONCE(=
output-&gt;vblank_hrtimer.node.expires);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (WARN_ON(*vblank_time =
=3D=3D vblank-&gt;time))<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return true;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * To prevent races we=
 roll the hrtimer forward before we do any<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * interrupt processin=
g - this is how real hw works (the interrupt is<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * only generated afte=
r all the vblank registers are updated) and what<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * the vblank core exp=
ects. Therefore we need to always correct the<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * timestampe by one f=
rame.<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *vblank_time -=3D output-&g=
t;period_ns;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return true;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static const struct drm_crtc_funcs amdgpu_vkms_crtc_funcs =3D {<=
br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .set_config&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D drm_atomic_hel=
per_set_config,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .destroy&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=
 drm_crtc_cleanup,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .page_flip&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D drm_atomi=
c_helper_page_flip,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .reset&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; =3D drm_atomic_helper_crtc_reset,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_duplicate_state =3D=
 drm_atomic_helper_crtc_duplicate_state,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_destroy_state&nbsp;=
&nbsp; =3D drm_atomic_helper_crtc_destroy_state,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .enable_vblank&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D amdgpu_vkms_enable_vblank,<br=
>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .disable_vblank&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D amdgpu_vkms_disable_vblank,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_vblank_timestamp&nbsp;=
&nbsp; =3D amdgpu_vkms_get_vblank_timestamp,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt; +static void amdgpu_vkms_crtc_atomic_enable(struct drm_crtc *crtc=
,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_atomic_state<br>
&gt; &gt; +*state) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_crtc_vblank_on(crtc);<b=
r>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static void amdgpu_vkms_crtc_atomic_disable(struct drm_crtc *crt=
c,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_atomic_state<br>
&gt; &gt; +*state) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_crtc_vblank_off(crtc);<=
br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static void amdgpu_vkms_crtc_atomic_flush(struct drm_crtc *crtc,=
<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_atomic_state<br>
&gt; &gt; +*state) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (crtc-&gt;state-&gt;even=
t) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; spin_lock(&amp;crtc-&gt;dev-&gt;event_lock);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; if (drm_crtc_vblank_get(crtc) !=3D 0)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_cr=
tc_send_vblank_event(crtc, crtc-&gt;state-&gt;event);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; else<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_cr=
tc_arm_vblank_event(crtc,<br>
&gt; &gt; + crtc-&gt;state-&gt;event);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; spin_unlock(&amp;crtc-&gt;dev-&gt;event_lock);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; crtc-&gt;state-&gt;event =3D NULL;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static const struct drm_crtc_helper_funcs amdgpu_vkms_crtc_helpe=
r_funcs =3D {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_flush&nbsp;&nbsp; =
=3D amdgpu_vkms_crtc_atomic_flush,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_enable&nbsp; =3D am=
dgpu_vkms_crtc_atomic_enable,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_disable =3D amdgpu_=
vkms_crtc_atomic_disable, };<br>
&gt; &gt; +<br>
&gt; &gt; +static int amdgpu_vkms_crtc_init(struct drm_device *dev, struct =
drm_crtc *crtc,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; struct drm_plane *primary, struct drm_plane<br>
&gt; &gt; +*cursor) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_crtc_init_with_=
planes(dev, crtc, primary, cursor,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp; &amp;amdgpu_vkms_crtc_funcs, NULL);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Failed to init CRTC\n&quot;);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_crtc_helper_add(crtc, &=
amp;amdgpu_vkms_crtc_helper_funcs);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static const struct drm_connector_funcs amdgpu_vkms_connector_fu=
ncs =3D {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fill_modes =3D drm_helper_=
probe_single_connector_modes,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .destroy =3D drm_connector_=
cleanup,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .reset =3D drm_atomic_helpe=
r_connector_reset,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_duplicate_state =3D=
 drm_atomic_helper_connector_duplicate_state,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_destroy_state =3D<b=
r>
&gt; &gt; +drm_atomic_helper_connector_destroy_state,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt; +static int amdgpu_vkms_conn_get_modes(struct drm_connector<br>
&gt; &gt; +*connector) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int count;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; count =3D drm_add_modes_noe=
did(connector, XRES_MAX, YRES_MAX);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_set_preferred_mode(conn=
ector, XRES_DEF, YRES_DEF);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return count;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static const struct drm_connector_helper_funcs amdgpu_vkms_conn_=
helper_funcs =3D {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .get_modes&nbsp;&nbsp;&nbsp=
; =3D amdgpu_vkms_conn_get_modes,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt; +static const struct drm_plane_funcs amdgpu_vkms_plane_funcs =3D =
{<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .update_plane&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D drm_atomic_helper_update=
_plane,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .disable_plane&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D drm_atomic_helper_disable_pla=
ne,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .destroy&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D=
 drm_plane_cleanup,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .reset&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; =3D drm_atomic_helper_plane_reset,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_duplicate_state =3D=
 drm_atomic_helper_plane_duplicate_state,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_destroy_state&nbsp;=
&nbsp; =3D drm_atomic_helper_plane_destroy_state,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt; +static void amdgpu_vkms_plane_atomic_update(struct drm_plane *pl=
ane,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_plane_state<br>
&gt; &gt; +*old_state) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static int amdgpu_vkms_plane_atomic_check(struct drm_plane *plan=
e,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_plane_state<br>
&gt; &gt; +*state) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_crtc_state *crtc=
_state;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool can_position =3D false=
;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!state-&gt;fb || WARN_O=
N(!state-&gt;crtc))<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; crtc_state =3D drm_atomic_g=
et_crtc_state(state-&gt;state, state-&gt;crtc);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ERR(crtc_state))<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return PTR_ERR(crtc_state);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_atomic_helper_c=
heck_plane_state(state, crtc_state,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
DRM_PLANE_HELPER_NO_SCALING,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
DRM_PLANE_HELPER_NO_SCALING,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
can_position, true);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret !=3D 0)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* for now primary plane mu=
st be visible and full screen */<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!state-&gt;visible &amp=
;&amp; !can_position)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return -EINVAL;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_plane_stat=
e *new_state) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_framebuffer *=
afb;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_gem_object *obj;=
<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_device *adev;=
<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo *rbo;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct list_head list;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ttm_validate_buffer =
tv;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct ww_acquire_ctx ticke=
t;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t domain;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!new_state-&gt;fb) {<br=
>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; DRM_DEBUG_KMS(&quot;No FB bound\n&quot;);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; afb =3D to_amdgpu_framebuff=
er(new_state-&gt;fb);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; obj =3D new_state-&gt;fb-&g=
t;obj[0];<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rbo =3D gem_to_amdgpu_bo(ob=
j);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev =3D amdgpu_ttm_adev(rb=
o-&gt;tbo.bdev);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; INIT_LIST_HEAD(&amp;list);<=
br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tv.bo =3D &amp;rbo-&gt;tbo;=
<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tv.num_shared =3D 1;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; list_add(&amp;tv.head, &amp=
;list);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D ttm_eu_reserve_buffer=
s(&amp;ticket, &amp;list, false, NULL);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; dev_err(adev-&gt;dev, &quot;fail to reserve bo (%d)\n&=
quot;, r);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (plane-&gt;type !=3D DRM=
_PLANE_TYPE_CURSOR)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; domain =3D amdgpu_display_supported_domains(adev, rbo-=
&gt;flags);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; domain =3D AMDGPU_GEM_DOMAIN_VRAM;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_pin(rbo, do=
main);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(r !=3D 0)) {<b=
r>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; if (r !=3D -ERESTARTSYS)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_ER=
ROR(&quot;Failed to pin framebuffer with error %d\n&quot;, r);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ttm_eu_backoff_reservation(&amp;ticket, &amp;list);<br=
>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_ttm_alloc_gart=
(&amp;rbo-&gt;tbo);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(r !=3D 0)) {<b=
r>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; amdgpu_bo_unpin(rbo);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; ttm_eu_backoff_reservation(&amp;ticket, &amp;list);<br=
>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;%p bind failed\n&quot;, rbo);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ttm_eu_backoff_reservation(=
&amp;ticket, &amp;list);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; afb-&gt;address =3D amdgpu_=
bo_gpu_offset(rbo);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_ref(rbo);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static void amdgpu_vkms_cleanup_fb(struct drm_plane *plane,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_plan=
e_state *old_state)<br>
&gt; &gt; +{<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct amdgpu_bo *rbo;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!old_state-&gt;fb)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rbo =3D gem_to_amdgpu_bo(ol=
d_state-&gt;fb-&gt;obj[0]);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r =3D amdgpu_bo_reserve(rbo=
, false);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(r)) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;failed to reserve rbo before unpin\n&q=
uot;);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_unpin(rbo);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_unreserve(rbo);<b=
r>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; amdgpu_bo_unref(&amp;rbo);<=
br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +static const struct drm_plane_helper_funcs amdgpu_vkms_primary_h=
elper_funcs =3D {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_update&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D amdgpu_vkms_plane_atomic_upda=
te,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_check&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D amdgpu_vkms_plane_atomic=
_check,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .prepare_fb&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D amdgpu_vkms_pr=
epare_fb,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .cleanup_fb&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =3D amdgpu_vkms_cl=
eanup_fb,<br>
&gt; &gt; +};<br>
&gt; &gt; +<br>
&gt; &gt; +static struct drm_plane *amdgpu_vkms_plane_init(struct drm_devic=
e *dev,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; enum drm_pla=
ne_type type,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int index) {=
<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_plane *plane;<br=
>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plane =3D kzalloc(sizeof(*p=
lane), GFP_KERNEL);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!plane)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return ERR_PTR(-ENOMEM);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_universal_plane=
_init(dev, plane, 1 &lt;&lt; index,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &amp;amdgpu_vkms_plane_funcs,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; amdgpu_vkms_formats,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; ARRAY_SIZE(amdgpu_vkms_formats),<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; NULL, type, NULL);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; kfree(plane);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return ERR_PTR(ret);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_plane_helper_add(plane,=
<br>
&gt; &gt; + &amp;amdgpu_vkms_primary_helper_funcs);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return plane;<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt; +int amdgpu_vkms_output_init(struct drm_device *dev,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; struct amdgpu_vkms_output *output, int<br>
&gt; &gt; +index) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_connector *conne=
ctor =3D &amp;output-&gt;connector;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_encoder *encoder=
 =3D &amp;output-&gt;encoder;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_crtc *crtc =3D &=
amp;output-&gt;crtc;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_plane *primary, =
*cursor =3D NULL;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int ret;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; primary =3D amdgpu_vkms_pla=
ne_init(dev, DRM_PLANE_TYPE_PRIMARY, index);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_ERR(primary))<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; return PTR_ERR(primary);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D amdgpu_vkms_crtc_in=
it(dev, crtc, primary, cursor);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret)<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; goto err_crtc;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_connector_init(=
dev, connector, &amp;amdgpu_vkms_connector_funcs,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_MODE_CONNECTOR_VIRTUAL)=
;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Failed to init connector\n&quot;);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; goto err_connector;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_connector_helper_add(co=
nnector,<br>
&gt; &gt; + &amp;amdgpu_vkms_conn_helper_funcs);<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_simple_encoder_=
init(dev, encoder, DRM_MODE_ENCODER_VIRTUAL);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Failed to init encoder\n&quot;);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; goto err_encoder;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; encoder-&gt;possible_crtcs =
=3D 1 &lt;&lt; index;<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret =3D drm_connector_attac=
h_encoder(connector, encoder);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; DRM_ERROR(&quot;Failed to attach connector to encoder\=
n&quot;);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; goto err_attach;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_mode_config_reset(dev);=
<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; &gt; +<br>
&gt; &gt; +err_attach:<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_encoder_cleanup(encoder=
);<br>
&gt; &gt; +<br>
&gt; &gt; +err_encoder:<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_connector_cleanup(conne=
ctor);<br>
&gt; &gt; +<br>
&gt; &gt; +err_connector:<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_crtc_cleanup(crtc);<br>
&gt; &gt; +<br>
&gt; &gt; +err_crtc:<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_plane_cleanup(primary);=
<br>
&gt; &gt; +<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return ret;<br>
&gt; &gt; +}<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h<br>
&gt; &gt; b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 000000000000..5dab51fbecf3<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.h<br>
&gt; &gt; @@ -0,0 +1,29 @@<br>
&gt; &gt; +/* SPDX-License-Identifier: GPL-2.0+ */<br>
&gt; &gt; +<br>
&gt; &gt; +#ifndef _AMDGPU_VKMS_H_<br>
&gt; &gt; +#define _AMDGPU_VKMS_H_<br>
&gt; &gt; +<br>
&gt; &gt; +#define XRES_DEF&nbsp; 1024<br>
&gt; &gt; +#define YRES_DEF&nbsp;&nbsp; 764<br>
&gt;<br>
&gt; Squash in the 768 fix here.<br>
&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +#define XRES_MAX&nbsp; 16384<br>
&gt; &gt; +#define YRES_MAX&nbsp; 16384<br>
&gt; &gt; +<br>
&gt; &gt; +#define drm_crtc_to_amdgpu_vkms_output(target) \<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; container_of(target, struct=
 amdgpu_vkms_output, crtc)<br>
&gt; &gt; +<br>
&gt; &gt; +extern const struct amdgpu_ip_block_version amdgpu_vkms_ip_block=
;<br>
&gt; &gt; +<br>
&gt; &gt; +struct amdgpu_vkms_output {<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_crtc crtc;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_encoder encoder;=
<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_connector connec=
tor;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct hrtimer vblank_hrtim=
er;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ktime_t period_ns;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_pending_vblank_e=
vent *event; };<br>
&gt; &gt; +<br>
&gt; &gt; +int amdgpu_vkms_output_init(struct drm_device *dev,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; struct amdgpu_vkms_output *output, int<br>
&gt; &gt; +index);<br>
&gt; &gt; +<br>
&gt; &gt; +#endif /* _AMDGPU_VKMS_H_ */<br>
&gt; &gt; diff --git a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c<br>
&gt; &gt; b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c<br>
&gt; &gt; index 7e0d8c092c7e..642c77533157 100644<br>
&gt; &gt; --- a/drivers/gpu/drm/amd/amdgpu/dce_virtual.c<br>
&gt; &gt; +++ b/drivers/gpu/drm/amd/amdgpu/dce_virtual.c<br>
&gt; &gt; @@ -22,6 +22,7 @@<br>
&gt; &gt;&nbsp;&nbsp; */<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; #include &lt;drm/drm_vblank.h&gt;<br>
&gt; &gt; +#include &lt;drm/drm_atomic_helper.h&gt;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; #include &quot;amdgpu.h&quot;<br>
&gt; &gt;&nbsp; #include &quot;amdgpu_pm.h&quot;<br>
&gt; &gt; @@ -40,6 +41,7 @@<br>
&gt; &gt;&nbsp; #include &quot;dce_virtual.h&quot;<br>
&gt; &gt;&nbsp; #include &quot;ivsrcid/ivsrcid_vislands30.h&quot;<br>
&gt; &gt;&nbsp; #include &quot;amdgpu_display.h&quot;<br>
&gt; &gt; +#include &quot;amdgpu_vkms.h&quot;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp; #define DCE_VIRTUAL_VBLANK_PERIOD 16666666<br>
&gt; &gt;<br>
&gt; &gt; @@ -374,6 +376,12 @@ static const struct drm_connector_funcs dce_=
virtual_connector_funcs =3D {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .force =3D dce_vi=
rtual_force,<br>
&gt; &gt;&nbsp; };<br>
&gt; &gt;<br>
&gt; &gt; +const struct drm_mode_config_funcs dce_virtual_mode_funcs =3D {<=
br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .fb_create =3D amdgpu_displ=
ay_user_framebuffer_create,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_check =3D drm_atomi=
c_helper_check,<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .atomic_commit =3D drm_atom=
ic_helper_commit, };<br>
&gt; &gt; +<br>
&gt; &gt;&nbsp; static int dce_virtual_sw_init(void *handle)&nbsp; {<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int r, i;<br>
&gt; &gt; @@ -385,10 +393,10 @@ static int dce_virtual_sw_init(void *handle=
)<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)=
-&gt;max_vblank_count =3D 0;<br>
&gt; &gt;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_=
config.funcs =3D &amp;amdgpu_mode_funcs;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_=
config.funcs =3D<br>
&gt; &gt; + &amp;dce_virtual_mode_funcs;<br>
&gt; &gt;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_=
config.max_width =3D 16384;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_=
config.max_height =3D 16384;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_=
config.max_width =3D XRES_MAX;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_=
config.max_height =3D YRES_MAX;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)=
-&gt;mode_config.preferred_depth =3D 24;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)=
-&gt;mode_config.prefer_shadow =3D 1; @@ -399,15<br>
&gt; &gt; +407,11 @@ static int dce_virtual_sw_init(void *handle)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return r;<br>
&gt; &gt;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_=
config.max_width =3D 16384;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev_to_drm(adev)-&gt;mode_=
config.max_height =3D 16384;<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; adev-&gt;amdgpu_vkms_output=
 =3D kzalloc(sizeof(struct<br>
&gt; &gt; + amdgpu_vkms_output) * adev-&gt;mode_info.num_crtc, GFP_KERNEL);=
<br>
&gt;<br>
&gt; You can use kcalloc here.<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* allocate crtcs=
, encoders, connectors */<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for (i =3D 0; i &=
lt; adev-&gt;mode_info.num_crtc; i++) {<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; r =3D dce_virtual_crtc_init(adev, i);<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return=
 r;<br>
&gt; &gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; r =3D dce_virtual_connector_encoder_init(adev, i);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; r =3D amdgpu_vkms_output_init(adev_to_drm(adev),<br>
&gt; &gt; + &amp;adev-&gt;amdgpu_vkms_output[i], i);<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (r)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return r;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &gt; @@ -428,6 +432,7 @@ static int dce_virtual_sw_fini(void *handle)<=
br>
&gt; &gt;<br>
&gt; &gt; hrtimer_cancel(&amp;adev-&gt;mode_info.crtcs[i]-&gt;vblank_timer)=
;<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(adev-&gt;mo=
de_info.bios_hardcoded_edid);<br>
&gt; &gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(adev-&gt;amdgpu_vkms_=
output);<br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_kms_helper_po=
ll_fini(adev_to_drm(adev));<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.32.0<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; amd-gfx mailing list<br>
&gt; &gt; amd-gfx@lists.freedesktop.org<br>
&gt; &gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3D=
https%3A%2F%2Flist">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flist</a=
><br>
&gt; &gt; s.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D0=
4%7C01%7Cgu<br>
&gt; &gt; chun.chen%40amd.com%7Ce4b064b3485c4865df8608d94de6a58e%7C3dd8961f=
e4884<br>
&gt; &gt; e608e11a82d994e183d%7C0%7C0%7C637626475284480052%7CUnknown%7CTWFp=
bGZsb<br>
&gt; &gt; 3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn=
0%3D%<br>
&gt; &gt; 7C1000&amp;amp;sdata=3D0bbTKflaP2RPk%2BpboaNNiwffbEw1pW0zkqcxzPWj=
zmI%3D&amp;amp;<br>
&gt; &gt; reserved=3D0<br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=
=3D04%7C01%7CRyan.Taylor%40amd.com%7Ce0a16eb27da04a035cb608d950516493%7C3dd=
8961fe4884e608e11a82d994e183d%7C0%7C0%7C637629133975706919%7CUnknown%7CTWFp=
bGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%=
7C3000&amp;amp;sdata=3DKCe92Ic79b8lkS6h4GoZhRdhwehzleQrSH8OKlinX8I%3D&amp;a=
mp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D04%7C01%7CRyan=
.Taylor%40amd.com%7Ce0a16eb27da04a035cb608d950516493%7C3dd8961fe4884e608e11=
a82d994e183d%7C0%7C0%7C637629133975706919%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiM=
C4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;amp;sd=
ata=3DKCe92Ic79b8lkS6h4GoZhRdhwehzleQrSH8OKlinX8I%3D&amp;amp;reserved=3D0</=
a><br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_MN2PR12MB32321AC70CD4369076E74E4FEAE89MN2PR12MB3232namp_--
