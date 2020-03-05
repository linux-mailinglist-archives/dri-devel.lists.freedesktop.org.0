Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5F217AF06
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 20:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D7446EC00;
	Thu,  5 Mar 2020 19:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20602.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::602])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF2D6E39C;
 Thu,  5 Mar 2020 19:37:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLrzSJhWpFY39cJeaGfxUKO8R55jfHufkB44LWXUyJjjVI9it+iYmX/xVpfejdles+5ty7Ot2HdkCCLTLAw90UI0lOPdrB7L92Lm1E8Loi+6zkp7fSZnABwLIAJX3He/63nfI39aGbHnew76jd5u7vdE5zr+sPSJUT+YlVpuIY2isC71luzBdqDEBuLy8g8MNhsXYfgm844SmrXHPJHytgDhjcFtQpwdTtAX6qqihJF0BPt3XaJEGMpLO5pxQ6m2uXHnjzeDwSXGOlRvA85u5mitLyKV6d0gpLahwbtHwG2DJNaXNeHCCEPmz4DQFIPq8MUvMgzKY6fOhISiznuDtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3AaJ41RozUhVAACEoapHaOK68Fqk7QCeAmCkk4NF3w=;
 b=DPBaxmDAJclD57T5FsTiF4UZJQdyKaUnQuzRgYG2Jv0IZ/Ki7P88IQR5q6gDCQioMMeT3m3QHZVG848z0FNAHivSH1JuQ7KtbLDM0FymOcmOJz5uslXSJxtP0Kpo3F4Cl4Rr6Xk+8NCyEPzfuwts9yjydOEImDcChkxaWnFCnAw1+xmS4T7GSrYr9pVTnT8ktQDRMxLpESAy9NIHcACIYdymxFapBrj3Wz/Og0R763lq5/it9sXEDf60RWvXmEIvpLcFP+Rynxz8gWFz2qMSS7lbxnoUdtA19lucHOT6nzBcRBv8GzdCeaHZFdAQHsZ6RPisq0v8DfRmorFZ1qIQBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B3AaJ41RozUhVAACEoapHaOK68Fqk7QCeAmCkk4NF3w=;
 b=gmaUb1j+UHTkZB0hc9VNrl35zvFDDLS327LN2x8UdyUbZGtZ2vuUUQUN6C6bc/ey+jyWZv5YlShG/SHHwg8ftxl6Aj6xN4mfV73FR4wycQ1ZyQRpspRYHRfN1KVqqc87+otmk2lFtA6wHvarw93PEJuoRv4uIv7bAEGaC2Ctz1E=
Received: from CH2PR12MB4024.namprd12.prod.outlook.com (2603:10b6:610:2a::26)
 by CH2PR12MB4277.namprd12.prod.outlook.com (2603:10b6:610:ae::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2793.14; Thu, 5 Mar
 2020 19:37:52 +0000
Received: from CH2PR12MB4024.namprd12.prod.outlook.com
 ([fe80::18df:3bde:fc74:f7aa]) by CH2PR12MB4024.namprd12.prod.outlook.com
 ([fe80::18df:3bde:fc74:f7aa%4]) with mapi id 15.20.2772.019; Thu, 5 Mar 2020
 19:37:52 +0000
From: "Ho, Kenny" <Kenny.Ho@amd.com>
To: "Tuikov, Luben" <Luben.Tuikov@amd.com>, Nirmoy Das
 <nirmoy.aiemd@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 2/8] drm/radeon: don't use ttm bo->offset
Thread-Topic: [PATCH 2/8] drm/radeon: don't use ttm bo->offset
Thread-Index: AQHV8vGaAMnMRH7dVE+IeRoCQPm18ag6YCuAgAADJxw=
Date: Thu, 5 Mar 2020 19:37:52 +0000
Message-ID: <CH2PR12MB40249EA145F848ABB70B73E483E20@CH2PR12MB4024.namprd12.prod.outlook.com>
References: <20200305132910.17515-1-nirmoy.das@amd.com>
 <20200305132910.17515-3-nirmoy.das@amd.com>,
 <375abd03-85c3-e19a-753b-859ba7e19b6a@amd.com>
In-Reply-To: <375abd03-85c3-e19a-753b-859ba7e19b6a@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Enabled=True;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_SetDate=2020-03-05T19:37:51.733Z;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Name=Internal
 Distribution
 Only; MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_ContentBits=0;
 MSIP_Label_76546daa-41b6-470c-bb85-f6f40f044d7f_Method=Standard; 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Kenny.Ho@amd.com; 
x-originating-ip: [45.72.145.148]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2b4b642d-624d-43eb-fce7-08d7c13cb21a
x-ms-traffictypediagnostic: CH2PR12MB4277:|CH2PR12MB4277:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4277442419C5DB8F3041D97283E20@CH2PR12MB4277.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1751;
x-forefront-prvs: 03333C607F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(396003)(136003)(376002)(39860400002)(199004)(189003)(478600001)(2906002)(86362001)(19627405001)(7416002)(8676002)(5660300002)(7696005)(81166006)(76116006)(966005)(4326008)(81156014)(66946007)(71200400001)(66556008)(316002)(45080400002)(26005)(66476007)(8936002)(6506007)(33656002)(54906003)(53546011)(110136005)(64756008)(66446008)(55016002)(9686003)(186003)(52536014);
 DIR:OUT; SFP:1101; SCL:1; SRVR:CH2PR12MB4277;
 H:CH2PR12MB4024.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 06P7oVgcn1pnIIWVpEIcxfKk95FunxM6qKtEKZqiP8w3VVJlkNo6zoRVdR45OY7O6M11jzjIVjGYDmC4cwD89INg1BU1Ce5CKYVLJSjfAFYGxEdZY7ZbetkchINOKjm+UOz7FiWSJdXEqMpObV3cAkQd45GPPbLh7Px+Tf51iR7Ui9AXCbpM2CsmURVgsHmWgIH0Xj9XCI0nhX/Tf/ZogKLz/dpuGkv+eyG1I0JetSDZnhOJwlgQe0pjFXoJt2HPgospnC9n9CFgYpAnQSQl9DcX2fIo3S2WRIOFLBHIZUz5lJoqPFj3DYueqPhMKsTz8GzI8PWvf/UvIYpca8b6aYkCtE/3k6+Mhxf/vnWU3GVb03jm8HE3YR8807VAEHmqMWixD/pCdyy0ei8S425S35/YdfQwvoWFn9GRRmHS3GiXPh8KSuoU6DPPXkmFuzviBJnYZPfWDLOXozbxcX3NglrCLWlzWVb+5N5oJx59rvU=
x-ms-exchange-antispam-messagedata: K2Ifre5X2/wHSeiJIIUtc7pGGjVEdhrQEb3lqLO9QAy7yXH3aIBR1ol2/80j6X64kBSXw7FGXlnS5QsMjdR0if6AXJfYX3A3q+etx80UHh6S4y+0yVMiM5/OVl0R5WwuE3yB/aQFu+v/Q7mNvMnVLA==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4b642d-624d-43eb-fce7-08d7c13cb21a
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2020 19:37:52.1918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RD+FJRy0hDttFHELxPbBrPZUjnhr1rqQ/gF1ldrzjnkxjV9sNX6MzbStdLoNNS5I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4277
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
Cc: "thellstrom@vmware.com" <thellstrom@vmware.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "brian.welty@intel.com" <brian.welty@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Das, 
 Nirmoy" <Nirmoy.Das@amd.com>,
 "linux-graphics-maintainer@vmware.com" <linux-graphics-maintainer@vmware.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>, "Deucher, 
 Alexander" <Alexander.Deucher@amd.com>, "sean@poorly.run" <sean@poorly.run>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>
Content-Type: multipart/mixed; boundary="===============1257519354=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1257519354==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_CH2PR12MB40249EA145F848ABB70B73E483E20CH2PR12MB4024namp_"

--_000_CH2PR12MB40249EA145F848ABB70B73E483E20CH2PR12MB4024namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[AMD Official Use Only - Internal Distribution Only]

I believe bo->tbo.mem.mem_type is of uint32_t type and not an enum, is the =
index lookup method safe? (i.e., how do you deal with the possibility of ha=
ving value TTM_PL_PRIV or above or are you suggesting those are not possibl=
e for this function.)

Kenny
________________________________
From: Tuikov, Luben <Luben.Tuikov@amd.com>
Sent: Thursday, March 5, 2020 2:19 PM
To: Nirmoy Das <nirmoy.aiemd@gmail.com>; dri-devel@lists.freedesktop.org <d=
ri-devel@lists.freedesktop.org>
Cc: Zhou, David(ChunMing) <David1.Zhou@amd.com>; thellstrom@vmware.com <the=
llstrom@vmware.com>; airlied@linux.ie <airlied@linux.ie>; Ho, Kenny <Kenny.=
Ho@amd.com>; brian.welty@intel.com <brian.welty@intel.com>; maarten.lankhor=
st@linux.intel.com <maarten.lankhorst@linux.intel.com>; amd-gfx@lists.freed=
esktop.org <amd-gfx@lists.freedesktop.org>; Das, Nirmoy <Nirmoy.Das@amd.com=
>; linux-graphics-maintainer@vmware.com <linux-graphics-maintainer@vmware.c=
om>; bskeggs@redhat.com <bskeggs@redhat.com>; daniel@ffwll.ch <daniel@ffwll=
.ch>; Deucher, Alexander <Alexander.Deucher@amd.com>; sean@poorly.run <sean=
@poorly.run>; Koenig, Christian <Christian.Koenig@amd.com>; kraxel@redhat.c=
om <kraxel@redhat.com>
Subject: Re: [PATCH 2/8] drm/radeon: don't use ttm bo->offset

On 2020-03-05 08:29, Nirmoy Das wrote:
> Calculate GPU offset in radeon_bo_gpu_offset without depending on
> bo->offset.
>
> Signed-off-by: Nirmoy Das <nirmoy.das@amd.com>
> Reviewed-and-tested-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/radeon/radeon.h        |  1 +
>  drivers/gpu/drm/radeon/radeon_object.h | 16 +++++++++++++++-
>  drivers/gpu/drm/radeon/radeon_ttm.c    |  4 +---
>  3 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/rad=
eon.h
> index 30e32adc1fc6..b7c3fb2bfb54 100644
> --- a/drivers/gpu/drm/radeon/radeon.h
> +++ b/drivers/gpu/drm/radeon/radeon.h
> @@ -2828,6 +2828,7 @@ extern void radeon_ttm_set_active_vram_size(struct =
radeon_device *rdev, u64 size
>  extern void radeon_program_register_sequence(struct radeon_device *rdev,
>                                             const u32 *registers,
>                                             const u32 array_size);
> +struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev);
>
>  /*
>   * vm
> diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/rad=
eon/radeon_object.h
> index d23f2ed4126e..60275b822f79 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.h
> +++ b/drivers/gpu/drm/radeon/radeon_object.h
> @@ -90,7 +90,21 @@ static inline void radeon_bo_unreserve(struct radeon_b=
o *bo)
>   */
>  static inline u64 radeon_bo_gpu_offset(struct radeon_bo *bo)
>  {
> -     return bo->tbo.offset;
> +     struct radeon_device *rdev;
> +     u64 start =3D 0;
> +
> +     rdev =3D radeon_get_rdev(bo->tbo.bdev);
> +
> +     switch (bo->tbo.mem.mem_type) {
> +     case TTM_PL_TT:
> +             start =3D rdev->mc.gtt_start;
> +             break;
> +     case TTM_PL_VRAM:
> +             start =3D rdev->mc.vram_start;
> +             break;
> +     }
> +
> +     return (bo->tbo.mem.start << PAGE_SHIFT) + start;
>  }

You're removing a "return bo->tbo.offset" and adding a
switch-case statement. So, then, now instead of an instant
lookup, you're adding branching. You're adding comparison
and branching. Do you think that's better? Faster? Smaller?

I've written before about this for this patch: Why not create a map,
whose index is "mem_type" which references the desired
address? No comparison, no branching. Just an index-dereference
and a value:

return rdev->mc.mem_start_map[bo->tbo.mem.mem_type];

Obviously, you'll have to create "mem_start_map".

That's a NAK from me on this patch using comparison
and branching to return static data lookup value.

Regards,
Luben

>
>  static inline unsigned long radeon_bo_size(struct radeon_bo *bo)
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon=
/radeon_ttm.c
> index badf1b6d1549..1c8303468e8f 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -56,7 +56,7 @@
>  static int radeon_ttm_debugfs_init(struct radeon_device *rdev);
>  static void radeon_ttm_debugfs_fini(struct radeon_device *rdev);
>
> -static struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)
> +struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)
>  {
>        struct radeon_mman *mman;
>        struct radeon_device *rdev;
> @@ -82,7 +82,6 @@ static int radeon_init_mem_type(struct ttm_bo_device *b=
dev, uint32_t type,
>                break;
>        case TTM_PL_TT:
>                man->func =3D &ttm_bo_manager_func;
> -             man->gpu_offset =3D rdev->mc.gtt_start;
>                man->available_caching =3D TTM_PL_MASK_CACHING;
>                man->default_caching =3D TTM_PL_FLAG_CACHED;
>                man->flags =3D TTM_MEMTYPE_FLAG_MAPPABLE | TTM_MEMTYPE_FLA=
G_CMA;
> @@ -104,7 +103,6 @@ static int radeon_init_mem_type(struct ttm_bo_device =
*bdev, uint32_t type,
>        case TTM_PL_VRAM:
>                /* "On-card" video ram */
>                man->func =3D &ttm_bo_manager_func;
> -             man->gpu_offset =3D rdev->mc.vram_start;
>                man->flags =3D TTM_MEMTYPE_FLAG_FIXED |
>                             TTM_MEMTYPE_FLAG_MAPPABLE;
>                man->available_caching =3D TTM_PL_FLAG_UNCACHED | TTM_PL_F=
LAG_WC;
> --
> 2.25.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists=
.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;data=3D02%7C01%7Cluben.=
tuikov%40amd.com%7Cca6004a5ac7a400a030708d7c108bcde%7C3dd8961fe4884e608e11a=
82d994e183d%7C0%7C0%7C637190115619487827&amp;sdata=3DEkSy4vpUIbTE%2B75CSO37=
JWiULKbRTYbcZUSEtRpcrTk%3D&amp;reserved=3D0
>


--_000_CH2PR12MB40249EA145F848ABB70B73E483E20CH2PR12MB4024namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<p style=3D"font-family:Arial;font-size:10pt;color:#0078D7;margin:15pt;" al=
ign=3D"Left">
[AMD Official Use Only - Internal Distribution Only]<br>
</p>
<br>
<div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
I believe bo-&gt;tbo.mem.mem_type is of uint32_t type and not an enum, is t=
he index lookup method safe? (i.e., how do you deal with the possibility of=
 having value&nbsp;<span style=3D"font-family: Arial, Helvetica, sans-serif=
; font-size: 12pt;">TTM_PL_PRIV or above or
 are you suggesting those are not possible for this function.)</span></div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
<span style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt;"=
><br>
</span></div>
<div style=3D"font-family: Arial, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0); background-color: rgb(255, 255, 255);">
Kenny</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Tuikov, Luben &lt;Lub=
en.Tuikov@amd.com&gt;<br>
<b>Sent:</b> Thursday, March 5, 2020 2:19 PM<br>
<b>To:</b> Nirmoy Das &lt;nirmoy.aiemd@gmail.com&gt;; dri-devel@lists.freed=
esktop.org &lt;dri-devel@lists.freedesktop.org&gt;<br>
<b>Cc:</b> Zhou, David(ChunMing) &lt;David1.Zhou@amd.com&gt;; thellstrom@vm=
ware.com &lt;thellstrom@vmware.com&gt;; airlied@linux.ie &lt;airlied@linux.=
ie&gt;; Ho, Kenny &lt;Kenny.Ho@amd.com&gt;; brian.welty@intel.com &lt;brian=
.welty@intel.com&gt;; maarten.lankhorst@linux.intel.com &lt;maarten.lankhor=
st@linux.intel.com&gt;;
 amd-gfx@lists.freedesktop.org &lt;amd-gfx@lists.freedesktop.org&gt;; Das, =
Nirmoy &lt;Nirmoy.Das@amd.com&gt;; linux-graphics-maintainer@vmware.com &lt=
;linux-graphics-maintainer@vmware.com&gt;; bskeggs@redhat.com &lt;bskeggs@r=
edhat.com&gt;; daniel@ffwll.ch &lt;daniel@ffwll.ch&gt;; Deucher,
 Alexander &lt;Alexander.Deucher@amd.com&gt;; sean@poorly.run &lt;sean@poor=
ly.run&gt;; Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; kraxel@redh=
at.com &lt;kraxel@redhat.com&gt;<br>
<b>Subject:</b> Re: [PATCH 2/8] drm/radeon: don't use ttm bo-&gt;offset</fo=
nt>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On 2020-03-05 08:29, Nirmoy Das wrote:<br>
&gt; Calculate GPU offset in radeon_bo_gpu_offset without depending on<br>
&gt; bo-&gt;offset.<br>
&gt; <br>
&gt; Signed-off-by: Nirmoy Das &lt;nirmoy.das@amd.com&gt;<br>
&gt; Reviewed-and-tested-by: Christian K=F6nig &lt;christian.koenig@amd.com=
&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/radeon/radeon.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; |&nbsp; 1 &#43;<br>
&gt;&nbsp; drivers/gpu/drm/radeon/radeon_object.h | 16 &#43;&#43;&#43;&#43;=
&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;-<br>
&gt;&nbsp; drivers/gpu/drm/radeon/radeon_ttm.c&nbsp;&nbsp;&nbsp; |&nbsp; 4 =
&#43;---<br>
&gt;&nbsp; 3 files changed, 17 insertions(&#43;), 4 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/=
radeon.h<br>
&gt; index 30e32adc1fc6..b7c3fb2bfb54 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/radeon/radeon.h<br>
&gt; @@ -2828,6 &#43;2828,7 @@ extern void radeon_ttm_set_active_vram_size(=
struct radeon_device *rdev, u64 size<br>
&gt;&nbsp; extern void radeon_program_register_sequence(struct radeon_devic=
e *rdev,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const u32 *registers,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const u32 array_size);<br>
&gt; &#43;struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)=
;<br>
&gt; <br>
&gt;&nbsp; /*<br>
&gt;&nbsp;&nbsp; * vm<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/=
radeon/radeon_object.h<br>
&gt; index d23f2ed4126e..60275b822f79 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_object.h<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/radeon/radeon_object.h<br>
&gt; @@ -90,7 &#43;90,21 @@ static inline void radeon_bo_unreserve(struct r=
adeon_bo *bo)<br>
&gt;&nbsp;&nbsp; */<br>
&gt;&nbsp; static inline u64 radeon_bo_gpu_offset(struct radeon_bo *bo)<br>
&gt;&nbsp; {<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; return bo-&gt;tbo.offset;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; struct radeon_device *rdev;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; u64 start =3D 0;<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; rdev =3D radeon_get_rdev(bo-&gt;tbo.bdev=
);<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; switch (bo-&gt;tbo.mem.mem_type) {<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case TTM_PL_TT:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; start =3D rdev-&gt;mc.gtt_start;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; case TTM_PL_VRAM:<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; start =3D rdev-&gt;mc.vram_start;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; break;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; &#43;<br>
&gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; return (bo-&gt;tbo.mem.start &lt;&lt; PA=
GE_SHIFT) &#43; start;<br>
&gt;&nbsp; }<br>
<br>
You're removing a &quot;return bo-&gt;tbo.offset&quot; and adding a<br>
switch-case statement. So, then, now instead of an instant<br>
lookup, you're adding branching. You're adding comparison<br>
and branching. Do you think that's better? Faster? Smaller?<br>
<br>
I've written before about this for this patch: Why not create a map,<br>
whose index is &quot;mem_type&quot; which references the desired<br>
address? No comparison, no branching. Just an index-dereference<br>
and a value:<br>
<br>
return rdev-&gt;mc.mem_start_map[bo-&gt;tbo.mem.mem_type];<br>
<br>
Obviously, you'll have to create &quot;mem_start_map&quot;.<br>
<br>
That's a NAK from me on this patch using comparison<br>
and branching to return static data lookup value.<br>
<br>
Regards,<br>
Luben<br>
<br>
&gt; <br>
&gt;&nbsp; static inline unsigned long radeon_bo_size(struct radeon_bo *bo)=
<br>
&gt; diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/rad=
eon/radeon_ttm.c<br>
&gt; index badf1b6d1549..1c8303468e8f 100644<br>
&gt; --- a/drivers/gpu/drm/radeon/radeon_ttm.c<br>
&gt; &#43;&#43;&#43; b/drivers/gpu/drm/radeon/radeon_ttm.c<br>
&gt; @@ -56,7 &#43;56,7 @@<br>
&gt;&nbsp; static int radeon_ttm_debugfs_init(struct radeon_device *rdev);<=
br>
&gt;&nbsp; static void radeon_ttm_debugfs_fini(struct radeon_device *rdev);=
<br>
&gt; <br>
&gt; -static struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bd=
ev)<br>
&gt; &#43;struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)=
<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct radeon_mman *mman;<br=
>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct radeon_device *rdev;<=
br>
&gt; @@ -82,7 &#43;82,6 @@ static int radeon_init_mem_type(struct ttm_bo_de=
vice *bdev, uint32_t type,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; break;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case TTM_PL_TT:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; man-&gt;func =3D &amp;ttm_bo_manager_func;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; man-&gt;gpu_offset =3D rdev-&gt;mc.gtt_start;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; man-&gt;available_caching =3D TTM_PL_MASK_CACHING;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; man-&gt;default_caching =3D TTM_PL_FLAG_CACHED;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; man-&gt;flags =3D TTM_MEMTYPE_FLAG_MAPPABLE | TTM_MEMTY=
PE_FLAG_CMA;<br>
&gt; @@ -104,7 &#43;103,6 @@ static int radeon_init_mem_type(struct ttm_bo_=
device *bdev, uint32_t type,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case TTM_PL_VRAM:<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; /* &quot;On-card&quot; video ram */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; man-&gt;func =3D &amp;ttm_bo_manager_func;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; man-&gt;gpu_offset =3D rdev-&gt;mc.vram_start;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; man-&gt;flags =3D TTM_MEMTYPE_FLAG_FIXED |<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; TTM_MEMTYPE_FLAG_MAPPABLE;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; man-&gt;available_caching =3D TTM_PL_FLAG_UNCACHED | TT=
M_PL_FLAG_WC;<br>
&gt; --<br>
&gt; 2.25.0<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; amd-gfx mailing list<br>
&gt; amd-gfx@lists.freedesktop.org<br>
&gt; <a href=3D"https://nam11.safelinks.protection.outlook.com/?url=3Dhttps=
%3A%2F%2Flists.freedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=
=3D02%7C01%7Cluben.tuikov%40amd.com%7Cca6004a5ac7a400a030708d7c108bcde%7C3d=
d8961fe4884e608e11a82d994e183d%7C0%7C0%7C637190115619487827&amp;amp;sdata=
=3DEkSy4vpUIbTE%2B75CSO37JWiULKbRTYbcZUSEtRpcrTk%3D&amp;amp;reserved=3D0">
https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flists.f=
reedesktop.org%2Fmailman%2Flistinfo%2Famd-gfx&amp;amp;data=3D02%7C01%7Clube=
n.tuikov%40amd.com%7Cca6004a5ac7a400a030708d7c108bcde%7C3dd8961fe4884e608e1=
1a82d994e183d%7C0%7C0%7C637190115619487827&amp;amp;sdata=3DEkSy4vpUIbTE%2B7=
5CSO37JWiULKbRTYbcZUSEtRpcrTk%3D&amp;amp;reserved=3D0</a><br>
&gt; <br>
<br>
</div>
</span></font></div>
</div>
</body>
</html>

--_000_CH2PR12MB40249EA145F848ABB70B73E483E20CH2PR12MB4024namp_--

--===============1257519354==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1257519354==--
