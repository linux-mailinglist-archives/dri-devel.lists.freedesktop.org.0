Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEB63FB022
	for <lists+dri-devel@lfdr.de>; Mon, 30 Aug 2021 06:14:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FA389D79;
	Mon, 30 Aug 2021 04:13:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06C9589D79
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Aug 2021 04:13:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ofitq8EjOrIsGLtRDvFHXhyBo1XIZNIuSEZESn9ie2oJCdysPcOqeVysv4hNSIAKG0BX7kKmoqTZ64LNnb63r8lrMZNHMoVi4316HjurBhCDg4wjcCL9fzY5GjeYGDBccHqOlgmHXKcZGJXXpSa3ZomxnF54S3uO7s3naEP9oCXiNHvXvK+JIjJD/z15Vq9Irtvk/xOLlXAtcanOAoDj9Yeg+/BXH1hJN1svESPdWfZz0mIr80YX+COjGzAklulCoAZ8ZBMt7oBMdqfzN5pVcXxgnX5Vwv5BJh3B/MT/bcWCy5nlsSebiIa5vHIGqnygXvswQVUEOBIRpoAnAYUtqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypDj9RWyPrua+RPZJCRoWhYFqE5ktW3yqI/zkBrLltw=;
 b=Ran5h+AYkkA+BjWiN7xLly97lK6BGY7SPdlXH53Q6DM0TF1shko8hbyDrAq7ahokP25EFNCcOyaXTInr1AKRCo4H5m+Py3GWHcYJEQygNdvHUL1yj+AvD5tkvKEEoglh0LcyCm4LhhnHW5laTwSlT3fPscMXRP7XM7wxYV6P1setIKg4OT68mUIKARNEbJW+6My4HMcZxOdaD7aZTMj5wCUG5OWkHPnJtVjIw+bb7PRSo6q3MKsF4sB7UQx5SmYODW4KoMQZ41LMERWvQ8B+e9vE3Yj1ki2h6FN8quv1Zs1QAyRcmqSsyhw/w8/fL2AD0NIgkYH4As9gEcbmjR+NEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypDj9RWyPrua+RPZJCRoWhYFqE5ktW3yqI/zkBrLltw=;
 b=avG0Q4Nv/nx2/kIba6O/lQLhY4s+EEymdCktxEM3XRkYFlGKHUi5i8eLuIj0SAr7tUJ5y+2cEVFwzQn3fSw6LFhCAir+WgtqOD84Cvf2LdA+w8k6D0OPsVMpUbaN6EgJ+qVcUW4FLEqm9tEKYZRFNByweUuxcQX6ClW0ly2L03c=
Received: from DM6PR12MB2619.namprd12.prod.outlook.com (2603:10b6:5:45::18) by
 DM5PR1201MB2472.namprd12.prod.outlook.com (2603:10b6:3:e1::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.23; Mon, 30 Aug 2021 02:40:41 +0000
Received: from DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::e9f8:55de:32f0:a7e6]) by DM6PR12MB2619.namprd12.prod.outlook.com
 ([fe80::e9f8:55de:32f0:a7e6%7]) with mapi id 15.20.4415.024; Mon, 30 Aug 2021
 02:40:40 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Cai Huoqing <caihuoqing@baidu.com>, "Deucher, Alexander"
 <Alexander.Deucher@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "airlied@linux.ie" <airlied@linux.ie>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amdgpu: Make use of the helper macro
 SET_RUNTIME_PM_OPS()
Thread-Topic: [PATCH] drm/amdgpu: Make use of the helper macro
 SET_RUNTIME_PM_OPS()
Thread-Index: AQHXm/QyOrT4MEqYgk2cnnKAg5tYA6uLWNQA
Date: Mon, 30 Aug 2021 02:40:40 +0000
Message-ID: <DM6PR12MB2619455BD5A7C55EFC0233E2E4CB9@DM6PR12MB2619.namprd12.prod.outlook.com>
References: <20210828084116.1642-1-caihuoqing@baidu.com>
In-Reply-To: <20210828084116.1642-1-caihuoqing@baidu.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Enabled=true;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SetDate=2021-08-30T02:40:36Z; 
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Method=Standard;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_Name=AMD Official Use
 Only-AIP 2.0;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ActionId=28552108-302c-486b-8134-d865b22772fd;
 MSIP_Label_88914ebd-7e6c-4e12-a031-a9906be2db14_ContentBits=1
authentication-results: baidu.com; dkim=none (message not signed)
 header.d=none;baidu.com; dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 82f5cff0-0548-431a-a5ee-08d96b5f8e86
x-ms-traffictypediagnostic: DM5PR1201MB2472:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1201MB2472398AE1A4314296D8A2D4E4CB9@DM5PR1201MB2472.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sU3gVsGWegt2bcnN+SVoifTndfdHiTM616fURT9N0w4b5jGc72qYo/0XcI8ctaHCrmghvVN2b7f37LtaWm8579JXbx7hgTHozRZ5eIRPzu7EC7MBqeVLS4MCLl7V+nVA5SgtCyqEKi7KT9tATXtyjAUwHqq7zscnXhjk4484J0jTIKvcG4y7+iZ+Fcpa5aCoKQVSY0oUyqeupBujwGPUMG0ZqR4m+cK4SuptDEsqcRXMg5p/qc64t28cW+E8Wv8i8amVOmGZ8tPq+1N80Z7KG2mQdkhhqmLZsJYNh5YxXIesFN6hRa6aAF5i5BmBeCFNutJJxLeByiK+iHsTWepl7Tq9A6s+k74AyTvxriTDwxpeCAAzcPocwOg2+RF+ZuCDEWQOVvoK/3ukmVpCbtxq8syB3BgGK7XEtqOrw7T6Ck1vu57QjQkTVvA3+7CovXKEPNaZyUG3GE+We22sI/zKrOVli2emodYAtrWRzt21vM+ZTeaguvWJvAl/ESt3/7Fb74C3Tg7AMuwBtsULuF5WeaZJ29qIJ0gVJ+r1sb8LXsVjCMDUjYdfAYCV4FhrcLWVEghS6UT5CU1w8ZtImKZEORSIc4PKNXdgMvAYPZeP9KTcF4wta9XGw3+RHx4/57he68moUxxL2rG5ah22jGkn2PoX1EYo9qRaWgdswKRLQSe3JxO4x01H1t7rycIgQQJGBDZMyEnCYuXP2oGWJJVEfQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2619.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(346002)(39860400002)(136003)(396003)(376002)(122000001)(66476007)(26005)(55016002)(110136005)(5660300002)(33656002)(9686003)(38070700005)(7696005)(316002)(66946007)(186003)(86362001)(66446008)(8676002)(76116006)(83380400001)(64756008)(66556008)(478600001)(4326008)(52536014)(2906002)(71200400001)(38100700002)(54906003)(8936002)(6506007)(53546011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?7BDN80v8nO1FyL/FVJnJbtLVOk+zvd6aOUIPfJJrqQaB5MyMw4TYIpdoV6ex?=
 =?us-ascii?Q?2/niVWq3aOZRpgf0AoW1qTW2o+MnZTLLzHVps+rsC4Orc/VMxwUdGq9qxazA?=
 =?us-ascii?Q?6tnXIQFAaHmJ0HHWNJrhFpnqMEm+YONKKfOQUIaDvNeRnnWz2gI8jbWFAYfw?=
 =?us-ascii?Q?PvgKXzBx2SUGubyT4Q8MEhgoLkh5YPFTb9U2jWVHq0yahPTMHBUPLJ2obibl?=
 =?us-ascii?Q?1UOkjCcjlCBZky+gV2y9+5KFjBkh66MAuzz5BfpK50UsHFGk0DGnFmGjGDv3?=
 =?us-ascii?Q?VtHOFB8qr2AOTF+OEylYanWyLsY1S/fVMqhsTjNwU4fagu6PPyQ+V/dXQD6W?=
 =?us-ascii?Q?bBfvuTD6WOpxgU1hsv6f6/Cu3A5cYjCwZ0LvgASW5olHK49zdrJAmyJ6cYdM?=
 =?us-ascii?Q?H4h1x2JjXNAxxEW1VYI3g5dOlxMhdWi0nS8YvFs9/y/1qBah/aEPsdvxbpH/?=
 =?us-ascii?Q?bF3ypjaTy1WdrEAad4kBGC3i524NPjCELhK47z7vC51eYdBsNwTA53OLAnIH?=
 =?us-ascii?Q?LSrn6FIjgt7D4URkzVEvDZ1i/P90tFcCtko6m4Ybu6+hq1kvJ5M4nLYcz9R5?=
 =?us-ascii?Q?zUY3PihLwGN+PBHBISpNt7Ys1yjIzok8xdHPpnYukjR30qlehKZiH7EqVLi8?=
 =?us-ascii?Q?suryIXyzAmJdpg3B+MmLYVcOI+B/Z3nUXPG30AeuutLNNDcB6vmmun6Y/W1v?=
 =?us-ascii?Q?IjDRNVewHt5ey8H4L+jE+80jiP6rOd0z/Y3+v00/H8jusiqLvEDdRgjS9gd9?=
 =?us-ascii?Q?B1UwxHu6tLr8izIGKqHWGERsW33nMF0tcvDLLU03ehjBqebfty+WQMP7PVTK?=
 =?us-ascii?Q?aYYrSIF2UAlj0VHVkRjN2+kqbepoA603UXYyJIw7aKMY5zhipF5EdFXjycPL?=
 =?us-ascii?Q?2pwbrBndvZq8FKKZYV2pBtmDkmh2fUEy1fpJmRYjdraONGArxhxrqtDFADK3?=
 =?us-ascii?Q?0OgN/maN9g9dra1HdXZ5o9OGv4IyGsO3yvKmlg+7bnLxCJyeYhrTXbQGQyXV?=
 =?us-ascii?Q?1x6tFHpCAkmAJSvCnGJma+Yhbn6Lw/wOHg5i3NpJ6fqFaql3D+jRQIJCanyn?=
 =?us-ascii?Q?BfnYoahihFpZ0MVFNNtUqO2+GpRGZBb8KnAWLy1440AeCq7MMTGwy52Tfj+2?=
 =?us-ascii?Q?qywHrXmM2Vele+valAIGItez2wmZySGPgyd+BR42kGlC5JyRITX9B7Bqc5o2?=
 =?us-ascii?Q?NbMK9v4LMixLBYVTpKKDBxkRA6rpFUuOJFRo4wxKraZ8j2M4p9HmSXe4z99k?=
 =?us-ascii?Q?aDGCr1zVZTdfHoQD91IxqEqNZvA7MaktBlaDa85wqRKQ0AmnhlbNhwm0r839?=
 =?us-ascii?Q?AWW00EgMGnIs2KEE5kZd5Jwd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2619.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82f5cff0-0548-431a-a5ee-08d96b5f8e86
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2021 02:40:40.5140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C08OayawXWpjQ9plxY4jshSlQ9LC4jBvcPRgng7rUWXCZjRsBrBQJMBW/S/Wn5jY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2472
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

Reviewed-by: Evan Quan <evan.quan@amd.com>

> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Cai
> Huoqing
> Sent: Saturday, August 28, 2021 4:41 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> airlied@linux.ie; daniel@ffwll.ch
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Cai
> Huoqing <caihuoqing@baidu.com>
> Subject: [PATCH] drm/amdgpu: Make use of the helper macro
> SET_RUNTIME_PM_OPS()
>=20
> Use the helper macro SET_RUNTIME_PM_OPS() instead of the verbose
> operators ".runtime_suspend/.runtime_resume/.runtime_idle", because
> the SET_RUNTIME_PM_OPS() is a nice helper macro that could be brought
> in to make code a little clearer, a little more concise.
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index b6640291f980..9e5fb8d2e0e0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -1699,6 +1699,8 @@ long amdgpu_drm_ioctl(struct file *filp,
>  }
>=20
>  static const struct dev_pm_ops amdgpu_pm_ops =3D {
> +	SET_RUNTIME_PM_OPS(amdgpu_pmops_runtime_suspend,
> +			   amdgpu_pmops_runtime_resume,
> amdgpu_pmops_runtime_idle)
>  	.prepare =3D amdgpu_pmops_prepare,
>  	.complete =3D amdgpu_pmops_complete,
>  	.suspend =3D amdgpu_pmops_suspend,
> @@ -1707,9 +1709,6 @@ static const struct dev_pm_ops amdgpu_pm_ops =3D
> {
>  	.thaw =3D amdgpu_pmops_thaw,
>  	.poweroff =3D amdgpu_pmops_poweroff,
>  	.restore =3D amdgpu_pmops_restore,
> -	.runtime_suspend =3D amdgpu_pmops_runtime_suspend,
> -	.runtime_resume =3D amdgpu_pmops_runtime_resume,
> -	.runtime_idle =3D amdgpu_pmops_runtime_idle,
>  };
>=20
>  static int amdgpu_flush(struct file *f, fl_owner_t id)
> --
> 2.25.1
