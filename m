Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D093F6D3B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 03:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C39A489B38;
	Wed, 25 Aug 2021 01:55:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08DAA89B38
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 01:55:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GC+znkDSkAdOOmAI3uNM0443TMMgsLgfnGrbbkVySHRaoM22Qc8kRsK5DJ/1AVJ+z8P8Mdv9ZAo4lhOwCWPNvQahUdFCxWLKQ0UZ8OeWuIYFyU90I4TEocQ9E+OO2qzs5ZieIWbFpnJ1PEC+Peg7JVqqFROfThfRj+CsL4NGGRZXsb4zsmP4uc72h21JpnrU28fCaavH9Qa1gs11FCoQbN61MM32p7Zhe37QuCWVxclwY/j71GxjqJcT3ou2ShRwLXNrg1yBSZICEhWw2byuLZ8Cj2AQgmPMlmRMhQtnn4iOpFMvzOzXtQiscYDrmF8h5k6LeVsreYzKPb6S++cNSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYMwD7KTCYNmXMCH/RklDAxAPvG62GuKBataNEG6tbg=;
 b=EBKcKfUnf7Er61qWlpufPoyEvaKTuNJ99UvR2Q9FSwtNObUOaJ/m4y+Mpy52o2rGusFB8md1hNCMw+O8c5v+ItH2GR4A67jF77nfQDiYkra6jwxHfmZ12O771Q2qOSfrbLtmPN5xpacIdC98WBGtKKBIH/DsKXVS7mN65DmEZFdnSlFSrsnu0bEFdHpkgmy9ccGSulaeYf7M1wT3Sfe7dzw4O8MkX7IA63JVZQAGNg1zZCq7ymJt035dAr/Q9vlsd8QftmppYzbb3jE+dinkF10LO8y2F5fnyUB3bcIEH9XEZaDP48BD443NPwci71aV5oEh/MRs3THoEWCAtoa2gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vYMwD7KTCYNmXMCH/RklDAxAPvG62GuKBataNEG6tbg=;
 b=hQB64dOBQGalEMgACJt0auLpEUm1rs4wJ4Yb98Kzp//gcE7/ediKbEuuznlZcQJLlcBAh1SUVXud6aixXsjcKLAp2Dh3lW4VPADCgPzRPZJ7f6K4bA9u/cjYRoFJg3Dwx63YAKnRJXBHfpq2CXLvfvYPCeaOsaMVu7KyTN1byMo=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM6PR12MB4959.namprd12.prod.outlook.com (2603:10b6:5:208::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.22; Wed, 25 Aug 2021 01:41:01 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::e9f8:55de:32f0:a7e6]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::e9f8:55de:32f0:a7e6%7]) with mapi id 15.20.4415.024; Wed, 25 Aug 2021
 01:41:01 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
CC: "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>,
 "Grodzovsky, Andrey" <Andrey.Grodzovsky@amd.com>
Subject: RE: [PATCH 1/4] drm/amdgpu: Move flush VCE idle_work during HW fini
Thread-Topic: [PATCH 1/4] drm/amdgpu: Move flush VCE idle_work during HW fini
Thread-Index: AQHXmStDsgLtkcU2N060TXN+bAqqMquDcU6A
Date: Wed, 25 Aug 2021 01:41:00 +0000
Message-ID: <DM6PR12MB26194A97EA61197582FF4742E4C69@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
 <20210824210120.49812-2-andrey.grodzovsky@amd.com>
In-Reply-To: <20210824210120.49812-2-andrey.grodzovsky@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-25T01:40:58Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=060b234b-597b-43ca-ba7e-e89524a81359;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf72b9dd-77e7-46c4-4fdd-08d9676964d2
x-ms-traffictypediagnostic: DM6PR12MB4959:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB49594438B8D7F496F79144C8E4C69@DM6PR12MB4959.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:182;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: j/JSjEwJvBYfHLwpKwczvafa2/BFig4sE8UoMQyn7fxCchU03RGhkwxQ0U0hXSIN7V3VC3FVedhGbQ2728JwkX3q0stcgA7FGw6KwUjpvnGiCfcYD6rpt1YK0BV4xfb/hY6y9jBZx2pSsYVYEFtVqoFafow07d6dONbw0rR+iogSq9E7QowJHoghqjl6KAgWbSf88D7a0Mcs1DaBGHvXdpTkGHESpj9waDWAjO4XcukjjFRh8lQyVvRWxVDZ/+ZxGE3FMt0B8HzA6D5IycTywko5RNYuwpGFEr6V2U1Lh3j7JV8ObHn3n7+Pxu4H8G3TsdB+9VZC0uNxSAiNVA68rPOam4htEvlW6hlDarPlxtrTjiDuQtyBbhBvJB1ftDXWyLRe7UujYtDPgDjHcjqFxj2HgXeSznqg9mZVUcIDvzJQe40kJaQmSQND9EtFoiWCAUKaDXuwDAASlus/S/mLonlSg1+GmrQbp00say7L+9pAqocmHVEL6Cc0cwrDDqh7/dpeyqtuJMs5poseV6P+lt2P7UG+W8romKT5jwZBe9El1Y4iAWu/OhUa1w99QTd2zeB/IzW1uMdaONppt32eMkVhzWh70HWbZjELx/3GV0pNm5ST9/RMouE89kwV06CxhnSZ0UtQTc8h5b3zIyQ/KdsJ5tV1LuBoHjzOwjMGyRW5oB2cvkaiLOqLvTkDpS//s0buohSKUIRIbFxh4xFbbQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(396003)(39850400004)(366004)(478600001)(316002)(86362001)(2906002)(71200400001)(38070700005)(54906003)(110136005)(966005)(186003)(38100700002)(5660300002)(9686003)(122000001)(83380400001)(26005)(8936002)(4326008)(52536014)(66556008)(76116006)(55016002)(66446008)(66476007)(66946007)(64756008)(7696005)(8676002)(6506007)(33656002)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YeiGamwteJxpBvr1TjnIzqAoVwl3mmywDeQPCMixmWzQUYKLwVSE+LHd/cS2?=
 =?us-ascii?Q?QZ70MO7wOPt86CqlKuTaB4oeiMg1LXIip2AfcerEMHickS4lPXQ6XquMTA7r?=
 =?us-ascii?Q?ksN6gph5C/5HF+vFQOEA/G/RqBKxZnZt2L1aKZNjtxr5/R5rlwhY+KxMfhif?=
 =?us-ascii?Q?LSUsJTqExeDjvLwqOnrOYwRRBMXpBLpYlXGRogXZHSm7E9H4DEuf0BYRfaWJ?=
 =?us-ascii?Q?oEZsS3ieonG7XmNG8UGB92nRg2QKruhv9jmi3oVKkrxM665dBEi6Cu3Ba1Kn?=
 =?us-ascii?Q?eqdQjgnUWBPHrrMGPzAq7IYEoRjn7dvcyLyW/PjiQ6s6ArfVS7GqrNXjPEiS?=
 =?us-ascii?Q?7pRTfxhDFqUOEZFRpVeDyJKJlPAaUJ6/e9DDyFvcaL1V1Q0dzJnSv6iLSgUp?=
 =?us-ascii?Q?Ay9jGcRQwe6MvfgRDaG1JZLCsWyMiDfwQyvmW91fg3OUItqkcYXbK5J6sU4Z?=
 =?us-ascii?Q?+ZMMO6F48dC4lkAKz19HDIJe4Qh8QDEfyIfPw1gEr0xP0MSj2DudlAKXGZAy?=
 =?us-ascii?Q?YyJuYITSdcASUZVAeQ07ollMj27upjDsh0W7BAnyIliXUUy9s3nTlIdZG6xC?=
 =?us-ascii?Q?f76fKdKpCU9NX3LacV1zrZ/vF2r7TuIcRKgvS3hXBZilt3sIhLc+v0GzdWjU?=
 =?us-ascii?Q?qDVjpB0WwnRHu+qpNMDJVFXe+KwwxZo+l2/40RVwFOdLOzuQyTlRukO3YZN0?=
 =?us-ascii?Q?+VZSmXH7rJn40KyS6kOogaUWSNVDAGJl2LV69+hA8XvBRCfQVCg2mWOGB7Nk?=
 =?us-ascii?Q?wiGLevCpawk8qc5WZrOjtu340vUvsokHzC0vS61GDHZDOMrAzH60sBw3S794?=
 =?us-ascii?Q?5V9PVzQgnx2ae9wYnELoa5F42n3JB0k5HI77ZGjcRhdO+4Us6CepKSu3UAyY?=
 =?us-ascii?Q?a4wZwtsnZYbvwTAhE9CPCesgR+5oO+FybbPOGtj0lt7aE7tLZyvAiPPyeNtQ?=
 =?us-ascii?Q?kronUMsvyIsG5DTABqGG07g8HV+BMYOeijQm20Mju9M9VoQTURs3Uw4lfhs4?=
 =?us-ascii?Q?jk/AOOufCtwVxXOejc00dj2nHKNJeWYXcqX6Qjklov8r82fjf2TImy3BGZlX?=
 =?us-ascii?Q?Xn2FBvqjnZzay/DyOb0qqA+kLRbSWyzCq77xeHLC6zxAVTP6KsVy6FHHNVVn?=
 =?us-ascii?Q?VyZ2uiJMIH8aRDeUe3CVpWV/W44+f63zELg+CCwdPA3XXJ3nR62+Bq8SXObP?=
 =?us-ascii?Q?HSA7Pjp5FM9Iq3dRd+t4AMokKFf4EVc+aPg/gAhz+qGT74WGDYWdPDhnxclf?=
 =?us-ascii?Q?mfdYjJTAnzMxosrh9FRzD+6EQGr1npi+XgRlW5iO5l6umiHNr6dBm/6jAIWM?=
 =?us-ascii?Q?/LIYHEErgJ2wlnnaYzdF3SM/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf72b9dd-77e7-46c4-4fdd-08d9676964d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Aug 2021 01:41:00.8588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: j7MawKszmh6oEC90nEweR7HSVfDtZe7DBWABtuQuEG+TZbYDmotB8FU0Nn/lCxxP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4959
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[AMD Official Use Only]

Hi Andrey,

I sent out a similar patch set to address S3 issue. And I believe it should=
 be able to address the issue here too.
https://lists.freedesktop.org/archives/amd-gfx/2021-August/067972.html
https://lists.freedesktop.org/archives/amd-gfx/2021-August/067967.html

BR
Evan
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
> Andrey Grodzovsky
> Sent: Wednesday, August 25, 2021 5:01 AM
> To: dri-devel@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: ckoenig.leichtzumerken@gmail.com; Grodzovsky, Andrey
> <Andrey.Grodzovsky@amd.com>
> Subject: [PATCH 1/4] drm/amdgpu: Move flush VCE idle_work during HW fini
>=20
> Attepmts to powergate after device is removed lead to crash.
>=20
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c | 1 -
>  drivers/gpu/drm/amd/amdgpu/vce_v2_0.c   | 4 ++++
>  drivers/gpu/drm/amd/amdgpu/vce_v3_0.c   | 5 ++++-
>  drivers/gpu/drm/amd/amdgpu/vce_v4_0.c   | 2 ++
>  4 files changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> index 1ae7f824adc7..8e8dee9fac9f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vce.c
> @@ -218,7 +218,6 @@ int amdgpu_vce_sw_fini(struct amdgpu_device
> *adev)
>  	if (adev->vce.vcpu_bo =3D=3D NULL)
>  		return 0;
>=20
> -	cancel_delayed_work_sync(&adev->vce.idle_work);
>  	drm_sched_entity_destroy(&adev->vce.entity);
>=20
>  	amdgpu_bo_free_kernel(&adev->vce.vcpu_bo, &adev-
> >vce.gpu_addr,
> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
> b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
> index c7d28c169be5..716dfdd020b4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v2_0.c
> @@ -477,6 +477,10 @@ static int vce_v2_0_hw_init(void *handle)
>=20
>  static int vce_v2_0_hw_fini(void *handle)
>  {
> +	struct amdgpu_device *adev =3D (struct amdgpu_device *)handle;
> +
> +	cancel_delayed_work_sync(&adev->vce.idle_work);
> +
>  	return 0;
>  }
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
> b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
> index 3b82fb289ef6..49581c6e0cea 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v3_0.c
> @@ -495,7 +495,10 @@ static int vce_v3_0_hw_fini(void *handle)
>  		return r;
>=20
>  	vce_v3_0_stop(adev);
> -	return vce_v3_0_set_clockgating_state(adev,
> AMD_CG_STATE_GATE);
> +	r =3D  vce_v3_0_set_clockgating_state(adev, AMD_CG_STATE_GATE);
> +	cancel_delayed_work_sync(&adev->vce.idle_work);
> +
> +	return r;
>  }
>=20
>  static int vce_v3_0_suspend(void *handle)
> diff --git a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
> b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
> index 90910d19db12..3297405fd32d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/vce_v4_0.c
> @@ -550,6 +550,8 @@ static int vce_v4_0_hw_fini(void *handle)
>  		DRM_DEBUG("For SRIOV client, shouldn't do anything.\n");
>  	}
>=20
> +	cancel_delayed_work_sync(&adev->vce.idle_work);
> +
>  	return 0;
>  }
>=20
> --
> 2.25.1
