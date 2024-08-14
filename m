Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A2FF95229B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 21:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2AA610E52B;
	Wed, 14 Aug 2024 19:24:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="disn+zT3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13AB10E067;
 Wed, 14 Aug 2024 19:24:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n93ZtfNyJievytvVYTxPHloPBn/jdpheLVJpTpJH2wvr77Ix40g9vNtdmyHlrw0BwfT6vkHGwEmYyoDZQSUM4NKH5npZVrTNcQ7ha2dOa0KOe+if5QiImnOX9emHTXixJyKqgHgwEtVFX672yQ4NAyiiTFlb6Mqt+3DCegIs6SC14Oolk5ckrrvwWAGfW9MpD3XhM+LR4jJXuOVgx19QlAjLeEYZRnih63dq1LG06zw2TEtb0hgPJu4QGGfqbOBZKq4K8+l1LbJ6Ba6YWB43Fgg7nMJ+TX/EUe2MYL1z3mxf+4yO/xtG0VrnOL3QOetE/R+ssbF4cXkrBfFjnwYV3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4dW13uBtGdAsM5y9ZFQtjRaupQZWi3SRkdk6M9wvZX0=;
 b=cJA/YM/gRbrPJ9Y2EVgO3K4fVvhvpzJ3SsGMTOvNcY6yfkDDtZuoTVZYVUS5uIRn50wmiNqz2VDtp6PfXbJzuZRTRgtwT4qMiOkqBXltsLvpD3nwav/uNRgH6vJ30C4sPBkXjA32TMMNzRqQa6oXp5oBvcxMidPX3AFRDJvN3YVCJsKM1eVDfNylR+SGgjUkmPHYjo8bqHjHASljdc7DFttGpZ6r3Zrqv0yhrZqk7vdYNCBqOmVpVBruHI0kCzSQI81/DM/TVneV/cSC2AvPhmHaIBnhxU6eph4VyarI8PJlHfOkn8WrkpQp4QIeDLrh6te5Yc67MkEjaVaXrzpQrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4dW13uBtGdAsM5y9ZFQtjRaupQZWi3SRkdk6M9wvZX0=;
 b=disn+zT3H7ySup21a557E/Hf9kQt5GdP492D5wE3W2yZb7IEa4CBWlzgxRA+SlyNxn8hUO8jc7Q9efEKmRXaeWt9l3KORtg4F/zq4SJw9vELsA5IeWHV+VquTUIYDL/avGhsjlayLPEBd5CI5KtJjNR7z2H2ZYWqZyUgejWQKPI=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by DS7PR12MB6334.namprd12.prod.outlook.com (2603:10b6:8:95::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22; Wed, 14 Aug
 2024 19:24:14 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%3]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 19:24:14 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
CC: Jerome Glisse <jglisse@redhat.com>, Dave Airlie <airlied@redhat.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lvc-project@linuxtesting.org" <lvc-project@linuxtesting.org>
Subject: RE: [PATCH v2] drm/radeon/evergreen_cs: fix int overflow errors in cs
 track offsets
Thread-Topic: [PATCH v2] drm/radeon/evergreen_cs: fix int overflow errors in
 cs track offsets
Thread-Index: AQHa6CTK2ayM9h6A80yIysZbmmeU7LInLrIw
Date: Wed, 14 Aug 2024 19:24:14 +0000
Message-ID: <BL1PR12MB514417C3C51DE5E059C403CCF7872@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20240806171904.49032-1-n.zhandarovich@fintech.ru>
In-Reply-To: <20240806171904.49032-1-n.zhandarovich@fintech.ru>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=a255eeeb-1b2d-4707-9bda-458d8d71a6ad;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2024-08-14T19:23:57Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|DS7PR12MB6334:EE_
x-ms-office365-filtering-correlation-id: e37f67b1-d703-4350-d3a0-08dcbc96aeb3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?/4tET6IoUXOTeh7yo9rurUEIKkkmOjPWx2HCYSg0bGZhRR3sbr7BtdM+pbtP?=
 =?us-ascii?Q?O89EKLwS371TnqzH3l2M1LFj926C4bpYX/vDC5doukD0slNHyRlyKOYFEGXF?=
 =?us-ascii?Q?76HIxn3l6VmYhxFgDPbCa7ZP9xJ2W9EMQTMomUs1AEL1AMx4yE24dYDMJcrr?=
 =?us-ascii?Q?vA6BL+dKGkm/Al23K/DedilqVFWTfCIJgSKpYIE403kms+urL11ulf4oqABu?=
 =?us-ascii?Q?VgAUfNMDKc11d+BTwUs16BUVhg0bqsO2JoOOCptGmP/+rOKPfLib5o5wFRl2?=
 =?us-ascii?Q?HvWaiOcJGSTFPh7wsY0UBMsOM85X5y84l2GBNXGIUlRgmtZvMbMQhTQORpsc?=
 =?us-ascii?Q?lrwD3C2gkgDLtF0e7uluQ+ZuEt59YsFglLVHfsQn9kQtxrIhGkZsRatirOop?=
 =?us-ascii?Q?2JEEQLHBKUIrg9jKLcdWnmrl0LOobIGXMIo1tLlwqIKNLci5DNTAdMyPHO1j?=
 =?us-ascii?Q?c5zcyNXgSwxWEKWJ2sgqEMMOTIh4iU5vN1Ci14IZJijgPD+TuaZ/qGi91aO6?=
 =?us-ascii?Q?dW0GXGK8LqW8R4EnGLsg/xZ/4Wqmo5WSbO3gkuVWOj6zjt5qjWOSeZp3Fdh1?=
 =?us-ascii?Q?FsEI7A4DyVXCb6xnz6mSRahqSP3GjV5bmF8+ZcX9niAIb9DZPqBan6kspLSs?=
 =?us-ascii?Q?TMnliFhTBLtqNAD2hZMbO6r0L9/jZeNhQBqQlPmLwGwWziC7ve3cSPgZdefj?=
 =?us-ascii?Q?qhJGjWJEAs0wt862+zvemMCVi+g0gv5xKhHX9paokmwlTAzAXzT/KMxL7T+R?=
 =?us-ascii?Q?O13O5vXq68b8kD+/AOg0AKFF2wBevQAcjZ29uo8TT5EeMXH2AN6DZkRecp5C?=
 =?us-ascii?Q?1awGgYDJRUStV4WVEXvHsd6hxZ3UnEtFhNw+NeVkfXi+Hj9hDNFlI3MXIKbu?=
 =?us-ascii?Q?MLRvhLrMFCwhdPFymfhFxgg92nyyEF7DQnsi1kKSgf1XxC2y/ZRBtGUUUiMR?=
 =?us-ascii?Q?InpU8DAO/DfoHYi8CS/d99arnGFIitEvyl2n5QMIV81BXw1qmbHQMoS3un2N?=
 =?us-ascii?Q?Q7z4S/IEnRT6kk8wPkTRCHdPtb8ZGjO4JNQ1+RKPzds5UAEscY5MaVEZ4XHZ?=
 =?us-ascii?Q?AOH6MUm3jGPj7XKf8Vr2w6Gq1dYUTzh7mARgLaC/UkonIocrxpabv0eVileT?=
 =?us-ascii?Q?AE5Sx7Wvr+HYrqPzs8Gui9FezQB0gfSNXR9YvbLqJkgVjBpycGvNIoeiJOYF?=
 =?us-ascii?Q?HH2Ud9mprnDeBzZn/mHWTC1RxoJ4LAYZrIgYDslGqL0v3b8lbXQ7IGWMD2sa?=
 =?us-ascii?Q?gi/2M7PG5bV9fH6DUdgC9Sb4wtIXxpGdLJnX+6Tp/PlpUSdbOenxArQCWb+F?=
 =?us-ascii?Q?Lpx3nTMMBXQZNTeXUp1sGkfPRqY9EKQ4nJ5IxvO4vw3U61ydsES7PFk4Xhg8?=
 =?us-ascii?Q?bq2tOho=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YauTaUAdJQoKMJHlEmcEQCJvOv70pgDoRVGwA5PoKFQsrhyNBn3icAGBIhSB?=
 =?us-ascii?Q?natbW79aM1MC3t2AnB+YLO8UfG3t3fk9dEvinM/Gbvgd8AtY8AbBxWVPE3Gy?=
 =?us-ascii?Q?Nndr/j1s+zuwin7uXK3uRWRoe30lkOhMMwVkjboX/klk2mL9i1Ur3bLACVH6?=
 =?us-ascii?Q?67O7HPL23esM8HlRhMZ5llhzDxVZTQhQDKjmYyoychW0cAmKk5KSapr1OsUG?=
 =?us-ascii?Q?0hhKDTwvBrjhxvlbxcstJqiPkGMM7jU3st6/c42Lq30PaAnfW3gspMmOWD9I?=
 =?us-ascii?Q?OtbPbVMF2mE4ZILFYZRaHLbh4+y6BsRxcWI0Uaaz/nQlf78dQGszU+Zw/J+G?=
 =?us-ascii?Q?t2mKExEUX5IY1WZrlqeARGSjvf+d7CUklqntkUhsw9LrvkSvRwsmaQgZWX2E?=
 =?us-ascii?Q?di+8r3F4GL9ALdl8y+rYcnwsmiulJqN9dGYY4vaVhBmdqnIoRxshZK7RsMRS?=
 =?us-ascii?Q?cKxk1n5Y4d2cGFq/FvL16pGhRI2Cb9zNnU/b14qDv8BSNynaQYAN6708RKCq?=
 =?us-ascii?Q?gvj6yRf3r8NDD/B/m9ptMSPhT7KSamu/d4iKyKmnKAPTyV7UGchTEinjEfNw?=
 =?us-ascii?Q?wfxw5ZeZybIF/F/jJe2HCwTwRfsDZ+Z7gBLiEA2bXSmV1VMXJDRK9LUR8R96?=
 =?us-ascii?Q?2OJ0MaMwBBWYr+ZZmPb8Zouw2yehAuMdrV4PVMW26JTOYByvvf632orkXAo3?=
 =?us-ascii?Q?IMcw3VZHbdVh/kMdR3DB5zozkTnQLpn17gTIj/m7YGjENacrR8Mdrhab8akr?=
 =?us-ascii?Q?LSGBSkzp421051LXvN7XR18svQGek8HEOhZEMm8ncrfZP5uVFn4MiqULWtSJ?=
 =?us-ascii?Q?M9pbIBT+cwkI1ePfKOPVnzlDF/faXcosHdkV7rleDjHZKs3CXsjlwe/NGy6L?=
 =?us-ascii?Q?6dsRpMKzzC53Pjwd4MZY51P3P2ZPk6h8TN1HNf6MfNtadiQc57IzoI8l/f5l?=
 =?us-ascii?Q?tGKeb02Z03nMAqPDc13oUzUk2tEOCRPz6SHCTwpiWYGis9J6HmDAUf+CBsEQ?=
 =?us-ascii?Q?uKjm2n/d5szRXnkVwzjwqf3r+U0s7VifDCJ8pFCbRZyXVd0XtYYECOvACFCk?=
 =?us-ascii?Q?eszARQgQYsmUTXQiIBtdpAYlD4Jos/9LNCM3K9LB4eDhy9PPYWCLKUZglrJI?=
 =?us-ascii?Q?tVSnPdQCPfQmcw1tQwqekA7+KTY8yYVj6weVUdshQmPUrVmkpvj3ejPyc89I?=
 =?us-ascii?Q?S0BdEP1vRsM4gQfd9IivnOTNkFfezpeJGeIAU95nHtE2CFlggfzdJzVaVoZl?=
 =?us-ascii?Q?X4Pz3osKsWun39QPJGY+TMYjeIGyGAXJQaFqcC2MSe4KQOyZ3CNNKJN4vw2w?=
 =?us-ascii?Q?iyrwj4OOmV4r4TYLMsVdZjD8uJ9LbJlkJmkROCLCLEwl6yUYy59RVoeQWbv7?=
 =?us-ascii?Q?PvYTQ90SMnwDfswEifojHEHWMpOeqaS5XY5NVmOI87thlbpO8ZDMc/Wv9MBT?=
 =?us-ascii?Q?PI8v199+zB9Jj3NFAH/L7tXlbzY8+DhUiFlSAmMDceycy61OlTeRezxmt551?=
 =?us-ascii?Q?mVdXa2FGQBEeNCLKNKP2AHoYoqtXcjPSd9kb6ieAxlHH3iqJ2QA10pqUy+F8?=
 =?us-ascii?Q?PUplEgWs4+pG6W0qvKk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e37f67b1-d703-4350-d3a0-08dcbc96aeb3
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Aug 2024 19:24:14.1877 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HVFcjNrhHU4ftE6jw96jM1QURnKZqAAn/qyUGm10EJdwbazTk1hSnlL6PlmsH91uvaDmIfTWakk4k0wJ3ahSzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6334
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

[Public]

> -----Original Message-----
> From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
> Sent: Tuesday, August 6, 2024 1:19 PM
> To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>; David
> Airlie <airlied@gmail.com>; Daniel Vetter <daniel@ffwll.ch>
> Cc: Nikita Zhandarovich <n.zhandarovich@fintech.ru>; Jerome Glisse
> <jglisse@redhat.com>; Dave Airlie <airlied@redhat.com>; amd-
> gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> kernel@vger.kernel.org; lvc-project@linuxtesting.org
> Subject: [PATCH v2] drm/radeon/evergreen_cs: fix int overflow errors in c=
s
> track offsets
>
> Several cs track offsets (such as 'track->db_s_read_offset') either are i=
nitialized
> with or plainly take big enough values that, once shifted 8 bits left, ma=
y be hit
> with integer overflow if the resulting values end up going over u32 limit=
.
>
> Same goes for a few instances of 'surf.layer_size * mslice'
> multiplications that are added to 'offset' variable - they may potentiall=
y
> overflow as well and need to be validated properly.
>
> While some debug prints in this code section take possible overflow issue=
s into
> account, simply casting to (unsigned long) may be erroneous in its own wa=
y,
> as depending on CPU architecture one is liable to get different results.
>
> Fix said problems by:
>  - casting 'offset' to fixed u64 data type instead of  ambiguous unsigned=
 long.
>  - casting one of the operands in vulnerable to integer  overflow cases t=
o u64.
>  - adjust format specifiers in debug prints to properly  represent 'offse=
t' values.
>
> Found by Linux Verification Center (linuxtesting.org) with static analysi=
s tool
> SVACE.
>
> Fixes: 285484e2d55e ("drm/radeon: add support for evergreen/ni tiling
> informations v11")
> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>

Applied.  Thanks!

Alex

> ---
> v2:
> - change data type to cast from unsigned long to u64 per Alex's and Chris=
tian's
> suggestion:
> https://lore.kernel.org/all/CADnq5_NaMr+vpqwqhsMoSeGrto2Lw5v0KXWEp
> 2HRK=3D++orScMg@mail.gmail.com/
> - include validation of surf.layer_size * mslice per Christian's
> approval:
> https://lore.kernel.org/all/1914cfcb-9700-4274-8120-
> 9746e241cb54@amd.com/
> - change format specifiers when printing 'offset' value.
> - fix commit description to reflect patch changes.
>
> v1:
> https://lore.kernel.org/all/20240725180950.15820-1-
> n.zhandarovich@fintech.ru/
>
>  drivers/gpu/drm/radeon/evergreen_cs.c | 62 +++++++++++++++++-----------
> -------
>  1 file changed, 31 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c
> b/drivers/gpu/drm/radeon/evergreen_cs.c
> index e5577d2a19ef..a46613283393 100644
> --- a/drivers/gpu/drm/radeon/evergreen_cs.c
> +++ b/drivers/gpu/drm/radeon/evergreen_cs.c
> @@ -397,7 +397,7 @@ static int evergreen_cs_track_validate_cb(struct
> radeon_cs_parser *p, unsigned i
>       struct evergreen_cs_track *track =3D p->track;
>       struct eg_surface surf;
>       unsigned pitch, slice, mslice;
> -     unsigned long offset;
> +     u64 offset;
>       int r;
>
>       mslice =3D G_028C6C_SLICE_MAX(track->cb_color_view[id]) + 1; @@ -
> 435,14 +435,14 @@ static int evergreen_cs_track_validate_cb(struct
> radeon_cs_parser *p, unsigned i
>               return r;
>       }
>
> -     offset =3D track->cb_color_bo_offset[id] << 8;
> +     offset =3D (u64)track->cb_color_bo_offset[id] << 8;
>       if (offset & (surf.base_align - 1)) {
> -             dev_warn(p->dev, "%s:%d cb[%d] bo base %ld not aligned
> with %ld\n",
> +             dev_warn(p->dev, "%s:%d cb[%d] bo base %llu not aligned
> with %ld\n",
>                        __func__, __LINE__, id, offset, surf.base_align);
>               return -EINVAL;
>       }
>
> -     offset +=3D surf.layer_size * mslice;
> +     offset +=3D (u64)surf.layer_size * mslice;
>       if (offset > radeon_bo_size(track->cb_color_bo[id])) {
>               /* old ddx are broken they allocate bo with w*h*bpp but
>                * program slice with ALIGN(h, 8), catch this and patch @@ =
-
> 450,14 +450,14 @@ static int evergreen_cs_track_validate_cb(struct
> radeon_cs_parser *p, unsigned i
>                */
>               if (!surf.mode) {
>                       uint32_t *ib =3D p->ib.ptr;
> -                     unsigned long tmp, nby, bsize, size, min =3D 0;
> +                     u64 tmp, nby, bsize, size, min =3D 0;
>
>                       /* find the height the ddx wants */
>                       if (surf.nby > 8) {
>                               min =3D surf.nby - 8;
>                       }
>                       bsize =3D radeon_bo_size(track->cb_color_bo[id]);
> -                     tmp =3D track->cb_color_bo_offset[id] << 8;
> +                     tmp =3D (u64)track->cb_color_bo_offset[id] << 8;
>                       for (nby =3D surf.nby; nby > min; nby--) {
>                               size =3D nby * surf.nbx * surf.bpe *
> surf.nsamples;
>                               if ((tmp + size * mslice) <=3D bsize) { @@ =
-469,7
> +469,7 @@ static int evergreen_cs_track_validate_cb(struct radeon_cs_pars=
er
> *p, unsigned i
>                               slice =3D ((nby * surf.nbx) / 64) - 1;
>                               if (!evergreen_surface_check(p, &surf, "cb"=
)) {
>                                       /* check if this one works */
> -                                     tmp +=3D surf.layer_size * mslice;
> +                                     tmp +=3D (u64)surf.layer_size * msl=
ice;
>                                       if (tmp <=3D bsize) {
>                                               ib[track-
> >cb_color_slice_idx[id]] =3D slice;
>                                               goto old_ddx_ok;
> @@ -478,9 +478,9 @@ static int evergreen_cs_track_validate_cb(struct
> radeon_cs_parser *p, unsigned i
>                       }
>               }
>               dev_warn(p->dev, "%s:%d cb[%d] bo too small (layer size %d,
> "
> -                      "offset %d, max layer %d, bo size %ld, slice %d)\n=
",
> +                      "offset %llu, max layer %d, bo size %ld, slice %d)=
\n",
>                        __func__, __LINE__, id, surf.layer_size,
> -                     track->cb_color_bo_offset[id] << 8, mslice,
> +                     (u64)track->cb_color_bo_offset[id] << 8, mslice,
>                       radeon_bo_size(track->cb_color_bo[id]), slice);
>               dev_warn(p->dev, "%s:%d problematic surf: (%d %d) (%d %d
> %d %d %d %d %d)\n",
>                        __func__, __LINE__, surf.nbx, surf.nby, @@ -564,7
> +564,7 @@ static int evergreen_cs_track_validate_stencil(struct
> radeon_cs_parser *p)
>       struct evergreen_cs_track *track =3D p->track;
>       struct eg_surface surf;
>       unsigned pitch, slice, mslice;
> -     unsigned long offset;
> +     u64 offset;
>       int r;
>
>       mslice =3D G_028008_SLICE_MAX(track->db_depth_view) + 1; @@ -
> 610,18 +610,18 @@ static int evergreen_cs_track_validate_stencil(struct
> radeon_cs_parser *p)
>               return r;
>       }
>
> -     offset =3D track->db_s_read_offset << 8;
> +     offset =3D (u64)track->db_s_read_offset << 8;
>       if (offset & (surf.base_align - 1)) {
> -             dev_warn(p->dev, "%s:%d stencil read bo base %ld not
> aligned with %ld\n",
> +             dev_warn(p->dev, "%s:%d stencil read bo base %llu not
> aligned with
> +%ld\n",
>                        __func__, __LINE__, offset, surf.base_align);
>               return -EINVAL;
>       }
> -     offset +=3D surf.layer_size * mslice;
> +     offset +=3D (u64)surf.layer_size * mslice;
>       if (offset > radeon_bo_size(track->db_s_read_bo)) {
>               dev_warn(p->dev, "%s:%d stencil read bo too small (layer si=
ze
> %d, "
> -                      "offset %ld, max layer %d, bo size %ld)\n",
> +                      "offset %llu, max layer %d, bo size %ld)\n",
>                        __func__, __LINE__, surf.layer_size,
> -                     (unsigned long)track->db_s_read_offset << 8, mslice=
,
> +                     (u64)track->db_s_read_offset << 8, mslice,
>                       radeon_bo_size(track->db_s_read_bo));
>               dev_warn(p->dev, "%s:%d stencil invalid (0x%08x 0x%08x
> 0x%08x 0x%08x)\n",
>                        __func__, __LINE__, track->db_depth_size, @@ -
> 629,18 +629,18 @@ static int evergreen_cs_track_validate_stencil(struct
> radeon_cs_parser *p)
>               return -EINVAL;
>       }
>
> -     offset =3D track->db_s_write_offset << 8;
> +     offset =3D (u64)track->db_s_write_offset << 8;
>       if (offset & (surf.base_align - 1)) {
> -             dev_warn(p->dev, "%s:%d stencil write bo base %ld not
> aligned with %ld\n",
> +             dev_warn(p->dev, "%s:%d stencil write bo base %llu not
> aligned with
> +%ld\n",
>                        __func__, __LINE__, offset, surf.base_align);
>               return -EINVAL;
>       }
> -     offset +=3D surf.layer_size * mslice;
> +     offset +=3D (u64)surf.layer_size * mslice;
>       if (offset > radeon_bo_size(track->db_s_write_bo)) {
>               dev_warn(p->dev, "%s:%d stencil write bo too small (layer s=
ize
> %d, "
> -                      "offset %ld, max layer %d, bo size %ld)\n",
> +                      "offset %llu, max layer %d, bo size %ld)\n",
>                        __func__, __LINE__, surf.layer_size,
> -                     (unsigned long)track->db_s_write_offset << 8, mslic=
e,
> +                     (u64)track->db_s_write_offset << 8, mslice,
>                       radeon_bo_size(track->db_s_write_bo));
>               return -EINVAL;
>       }
> @@ -661,7 +661,7 @@ static int evergreen_cs_track_validate_depth(struct
> radeon_cs_parser *p)
>       struct evergreen_cs_track *track =3D p->track;
>       struct eg_surface surf;
>       unsigned pitch, slice, mslice;
> -     unsigned long offset;
> +     u64 offset;
>       int r;
>
>       mslice =3D G_028008_SLICE_MAX(track->db_depth_view) + 1; @@ -
> 708,34 +708,34 @@ static int evergreen_cs_track_validate_depth(struct
> radeon_cs_parser *p)
>               return r;
>       }
>
> -     offset =3D track->db_z_read_offset << 8;
> +     offset =3D (u64)track->db_z_read_offset << 8;
>       if (offset & (surf.base_align - 1)) {
> -             dev_warn(p->dev, "%s:%d stencil read bo base %ld not
> aligned with %ld\n",
> +             dev_warn(p->dev, "%s:%d stencil read bo base %llu not
> aligned with
> +%ld\n",
>                        __func__, __LINE__, offset, surf.base_align);
>               return -EINVAL;
>       }
> -     offset +=3D surf.layer_size * mslice;
> +     offset +=3D (u64)surf.layer_size * mslice;
>       if (offset > radeon_bo_size(track->db_z_read_bo)) {
>               dev_warn(p->dev, "%s:%d depth read bo too small (layer size
> %d, "
> -                      "offset %ld, max layer %d, bo size %ld)\n",
> +                      "offset %llu, max layer %d, bo size %ld)\n",
>                        __func__, __LINE__, surf.layer_size,
> -                     (unsigned long)track->db_z_read_offset << 8, mslice=
,
> +                     (u64)track->db_z_read_offset << 8, mslice,
>                       radeon_bo_size(track->db_z_read_bo));
>               return -EINVAL;
>       }
>
> -     offset =3D track->db_z_write_offset << 8;
> +     offset =3D (u64)track->db_z_write_offset << 8;
>       if (offset & (surf.base_align - 1)) {
> -             dev_warn(p->dev, "%s:%d stencil write bo base %ld not
> aligned with %ld\n",
> +             dev_warn(p->dev, "%s:%d stencil write bo base %llu not
> aligned with
> +%ld\n",
>                        __func__, __LINE__, offset, surf.base_align);
>               return -EINVAL;
>       }
> -     offset +=3D surf.layer_size * mslice;
> +     offset +=3D (u64)surf.layer_size * mslice;
>       if (offset > radeon_bo_size(track->db_z_write_bo)) {
>               dev_warn(p->dev, "%s:%d depth write bo too small (layer siz=
e
> %d, "
> -                      "offset %ld, max layer %d, bo size %ld)\n",
> +                      "offset %llu, max layer %d, bo size %ld)\n",
>                        __func__, __LINE__, surf.layer_size,
> -                     (unsigned long)track->db_z_write_offset << 8, mslic=
e,
> +                     (u64)track->db_z_write_offset << 8, mslice,
>                       radeon_bo_size(track->db_z_write_bo));
>               return -EINVAL;
>       }
