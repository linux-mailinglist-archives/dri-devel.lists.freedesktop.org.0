Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB2CA73E1D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 19:47:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5312410E938;
	Thu, 27 Mar 2025 18:47:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eQReFKG7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A2A10E938;
 Thu, 27 Mar 2025 18:47:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pr+fbmss5QKoo7Q6YVCaVGdyVftPfDgBGkF7zXT7k5BWlDLwS09fxDTWtpiyEm2XifR5U5oqe1I4jD5c5GXNYDSP+GDJSels3kHcP0khn/p0wMQ3L6OaqaH96JlKlpSaT7CRXSDeDLeYfHY5usGBM9LxjoOW1zxxWTmNggIPulTI1yD5q2awlhWxaqVY9COHKcG9Bdf+F4unWjkgAx7j2DVdR+M+7bx8YOpcqzem/T3HFgK9D/vxobWpX9cHcgEitoNjrL+GVa+R2AgC2T98XFYdV71qIpVWDdBqij58quQIGqFsqhB/4Nxp4OJ6LJ/Lxh+HcIxUYQAOK8uHMzQ+ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tcZKIETVBCLAg0jFrPPJyIm7Ja7b3QqMSisJi73DQM4=;
 b=j7QqMEfgp20DsIPge18l5RvrCJ4z8abZFLBG8B+NXmePxd40VFi49KE4IyERzjJqpW1Xs5lz/HMb+z+K/QfAJFyhjd2+UgBGWVx9ciFY2K54LxSGxKO3+TTwPHvpOB7Krtimne160qpkxbjz8+3zMxwHoRiLeYHAYT46wCU1UYZbyWanYOFXXqPHPXG/BLJtkLVVRlpphkM//PTREczMfJ1t973FwM8UsodinNXxUtLuVHxP+mhCCh4qX5/6Ol/XP6fmZ/LlBtGtfh0pU+ZgvT+GVmOVYapkKgP7AbngBC6+BifF5lkYNUW25X+8e7PHfy6izttKHJoaESv5UH0yVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tcZKIETVBCLAg0jFrPPJyIm7Ja7b3QqMSisJi73DQM4=;
 b=eQReFKG738QlNjAjSBu/WGA4mZvApxGDNKQGeOEHz4c6fo86QfmUhtZTGo6zrVFKYf59vlqGGAtpLZqG/yhW1TMjLw6PtpNyeK9YnYXcQFwlQk2sUdOZl7xwhrqQiqBQEX2h4U5pLJZF1aIc0Rk24ceA3+yXfTEkPh613TPst24=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CYYPR12MB8730.namprd12.prod.outlook.com (2603:10b6:930:c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 18:47:16 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%3]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 18:47:16 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: Charles Han <hanchunchao@inspur.com>, "Feng, Kenneth"
 <Kenneth.Feng@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "sid@itb.spb.ru" <sid@itb.spb.ru>, "Huang, Tim" <Tim.Huang@amd.com>, "Zhang,
 Jesse(Jie)" <Jesse.Zhang@amd.com>, "linux@treblig.org" <linux@treblig.org>,
 "Huang, Ray" <Ray.Huang@amd.com>, "Rex.Zhu@amd.com" <Rex.Zhu@amd.com>,
 "evan.quan@amd.com" <evan.quan@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] drm/amd/pp: Fix potential NULL pointer dereference in
 atomctrl_initialize_mc_reg_table
Thread-Topic: [PATCH] drm/amd/pp: Fix potential NULL pointer dereference in
 atomctrl_initialize_mc_reg_table
Thread-Index: AQHbns1oujfb/8QWmE+tJMv8pI2MXLOHU4Xg
Date: Thu, 27 Mar 2025 18:47:16 +0000
Message-ID: <BL1PR12MB5144545A7D76DDA751934107F7A12@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250327040435.2470-1-hanchunchao@inspur.com>
In-Reply-To: <20250327040435.2470-1-hanchunchao@inspur.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ActionId=71ffb90d-d85a-44a1-9c5c-7f45a9095485;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=0;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=true;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open Source;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-03-27T18:46:41Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Tag=10, 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|CYYPR12MB8730:EE_
x-ms-office365-filtering-correlation-id: 6bb72865-689b-4019-129f-08dd6d5fcbe4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?10qzb7Fk6bU1N+HpUyXEzYno5z/6jpftseKdi8p7SA5Ir9/4Wv9DjjQzd8Ad?=
 =?us-ascii?Q?Q2mySZXWJca5c+6/Z9Qop2Dpuagi6kI5Qdb5Nbr3utsm3LXR5w2WGta5Ysc5?=
 =?us-ascii?Q?4VkVFStLIUip+x6uAZD/qofOIXYjxn8EmscGWsFzgjqUOcN16FcENAAi00DA?=
 =?us-ascii?Q?4QTmKI2RalRZuXAyWSGfESXbHBTHDSobHGRrAbUiYimwySUUXd31cemEI0bi?=
 =?us-ascii?Q?GTamzGf1DnG/0KSFA9/0QWWwKqzn0vF1ddwsFMWoFUfYwX1/l3bjbigQtstK?=
 =?us-ascii?Q?/jyaEC9Ek3i7nG5G1fU/asVGf+U2h8smqWTbaYmrp8EkHYUJKAcjeKiXw9BF?=
 =?us-ascii?Q?FFHjWNqKOJyNF4d52ymLqx9NLvGc9Nj/OxTEbLFCwH0YRe0jyXiUzf30PeaJ?=
 =?us-ascii?Q?oime3NoTrKLgT6w7yf01xa9rXe/h+aF72bs+v8CW8jTW8X+QgSaZ78AyLOnr?=
 =?us-ascii?Q?xZDFuwp3U3J9D50oGt1+VkOlM3eQmBGXsXv1gVUs8dfmXOcjnC0WK/GJ/rz6?=
 =?us-ascii?Q?N/ygt2w/myNx+E5lABqjvP8G6kX/oyC1MomSFw6HLP/8f3wvjlzUOOoYC7U+?=
 =?us-ascii?Q?oUo3DnrwxnTkwi6NDC6VxR0Vy8xkw1L2MCZcnx8DdObXhPDJXJ6ZkvFm/7Xq?=
 =?us-ascii?Q?aZVfSMpyfw5hkME62ACtSFbVw1cY1M8fK+bmw+vfK0IGR7q7LUAHCuUoZPuy?=
 =?us-ascii?Q?juNPd0vdNXh96OP6HY2Oj2h0m3ZqScaEnlq3xFcNYvKyuTXiw8QazIM1xGo3?=
 =?us-ascii?Q?T+Rq/x8pGgNFo8oM7OOfEfOCfknD2e0TpFiHEIr2hgYndOmf3u6wIkYSKeep?=
 =?us-ascii?Q?CfSqbZC5XUZNjUqas3EZxYbAwf1vlxvX+ExU3PnrgEC1Lis6oJbq2r32kcWy?=
 =?us-ascii?Q?e7wWRjTziXmDJDFCt2XWAd0H296UtVwEKihnHGuonBvHtSK+7JQIuWMRgOhn?=
 =?us-ascii?Q?FRfiDGeoxJUYOqNOPqngMtve6/mX0bs/HINbiIuV8czLxSk5bekvuBKIFhym?=
 =?us-ascii?Q?MI+YjEw8Ac1Ig0ZWgARM5xL7tK2S0/csahGCMXwPwGIwZ1dqgXNBpmuFdlvk?=
 =?us-ascii?Q?G6PL722ZWJnVHJBwMdItlzj7CsiytMGpPToVKk2yV1s4HGmIWH7F8lIJPzru?=
 =?us-ascii?Q?7GBSYuvPa7wr3EARFaH8cvDnp6g8+2qDJ5hIB2hZgwLnhEiUirZVuoXwzypN?=
 =?us-ascii?Q?XUumr06pDI9qcYlW0ZHe28+P+yWPVmfqjCYm6Bx9AxbnrRS1a6oKrOAUFW9Y?=
 =?us-ascii?Q?Vx7mcpYa5g66EAW1o/6LNywVI5aGgpnlknrUYpz5WOWvfcTSyKOdIsl6/4x+?=
 =?us-ascii?Q?MB8naJu74Da/+1ldmkJySZDxS5VPc35rYEg4473qHcp5fr1x2DVFge+d5YQ1?=
 =?us-ascii?Q?IF63jkWFGEpv/9+eCRqmL97gMKr5hBO76C+MFUirBlZeNc2K1OzWFK9zY/Gu?=
 =?us-ascii?Q?FOSK1Fzq58d2d2aKKyY8F61WKkr8f7gBuihoTDauVZmTm5S5oV8mEA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(921020); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?57LOYafWSttukRZc7f1qsMveD00jIQZ/J8RM2jFrHQPz6D0X4Yv/R08Z7U/u?=
 =?us-ascii?Q?GysJMqlo4AsfovZtU0TEtbIyCUwjAU9OIlLll+AAYwwSJRvo8BmTEqeyu8Te?=
 =?us-ascii?Q?zdjb9yddEFAtVzWqWzUKvEvScAaDGuPI5Er4L3kxmjyJz114WU2WgYg9YkI1?=
 =?us-ascii?Q?v/sPBMBRlL8SUKkp4JJ98dmbxyfQWNILqJaxKnrG20IsKxVVHjIut9yJV4TZ?=
 =?us-ascii?Q?SLE0k56dcA1+E08B2y41NOrhgX6ta3hQxAY99MJPxS5qavsBbnvXT1TFrXSn?=
 =?us-ascii?Q?MZnhqjAA4lW+AydTR6sz28yw4lfprqkHT//ePxo026TQRAwQLfh8UZAVfcrz?=
 =?us-ascii?Q?tmKQJumjo0AUaGp+0h2YYQNyhTkC2FpeMzrwjrAm8LP01Mc1ayzaVUva+qWY?=
 =?us-ascii?Q?ZMWSkz6Vdc7KZk/+xO2KZ5z4RB22NwXuAXAiCx1Zl0Ys3Up9grEkPu/rEOQc?=
 =?us-ascii?Q?7yB0E2UsHSLSOva0Jaxqd3oe7MO8ylpY0xlAKhb4EMnCLgvEbUyqT7xgovq7?=
 =?us-ascii?Q?PfI6erVOs4Kyjx/v+2uemea/REzZ3fGIkGPzeTC0gF6DwhsxYkziZID0G46U?=
 =?us-ascii?Q?qYi3cKhg8qRyACJ7VaxnblJbT+1i/QfciMqNf8vDmfdia9Pas2ye29cZ8mts?=
 =?us-ascii?Q?bSqh+vOPJh/1+0SLqmVZzI6r7YPhZw7wU24+jexwJAoA9K4jmUCH76SD9/dg?=
 =?us-ascii?Q?TFBwUBBLwXe6Zw66O5/GaI8ZzBQQoaPQl5M0camBphWXNPu4JdDQWvWj4kvh?=
 =?us-ascii?Q?Ja7LRowraTAR2VFQLhq5QlUJsV8Q9c+QuCMokM+aIKwYkaZRsUErD5ALUcaR?=
 =?us-ascii?Q?QqX+tp0x7uTFxYOPxrE+MXCrjyqt1m+g4ZYsvaiSyAPOmTEPWEekeFn+pgvP?=
 =?us-ascii?Q?pNKK1oFvwWX19PXhcFrxfETepsghGKRgLrvWs6mUP247/ExaGjozpTEPX+k7?=
 =?us-ascii?Q?OFVhi10Xhi1T5/DsZm2rEUgugFvmOhNgBKxYCN3sBWUcRIH/GEagvNT49R2d?=
 =?us-ascii?Q?ITFqYDfwYRIHq6m6rkNSBnq39kmW3uUY5xA3xBdAikVy+p3tvAQMoW/SdcZt?=
 =?us-ascii?Q?QDG9lGuI+6r4iRdMjAytji+Y14E/PmBmWr79ZfxPR8FSNEEd8MFW3Rck4k/Q?=
 =?us-ascii?Q?Ran0dlFQwFtGqoWxYEARmBEP2czyfBjwTmSUDkV2YQMuVzdUPuJoIL0XH9IO?=
 =?us-ascii?Q?81DP46d63zkkX6oU6qcUgpCtSy+Udr1RELb7sjjAZ+wpInaNnLrOdAEng4X9?=
 =?us-ascii?Q?DG4hLEfZIzI9nalwW2Jbu95YKp7Q4cPnr/HGG381Kt8/42uK3TMvTY96urqX?=
 =?us-ascii?Q?8nLOdaI+vuHNMkjSIRMUvHezyjYEbIH6hwFL3h7Q+Gr7EPFiZsV6oXilamMc?=
 =?us-ascii?Q?Qoqh+zB9Icslxs5jrzn/e1f9SwiIuDqBPbclLrdGWwOrLw2PdkuFzrnzQXG9?=
 =?us-ascii?Q?0lh2kWx/nmul7oghcphes7Xu1LCDxyO2Pt2bdJiRArxVlvP5PCFgrAdF36Xz?=
 =?us-ascii?Q?I2O0y3wRygPPIVk0BCQe7QGf/fmUASsI0FETshg8/jJEuK6wGpjoNZWSG1JK?=
 =?us-ascii?Q?uVudQtbqk7Wq9NaLhDE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bb72865-689b-4019-129f-08dd6d5fcbe4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2025 18:47:16.6083 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6MGWhSM2WdhP4kkcuDLFy6GlnNLzVtJsp1Nnuox0f9AML2tJha70N4n7DtZ2kvPRzrDNjI2rZUzuN9UsdJjRdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8730
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
> From: Charles Han <hanchunchao@inspur.com>
> Sent: Thursday, March 27, 2025 12:05 AM
> To: Feng, Kenneth <Kenneth.Feng@amd.com>; Deucher, Alexander
> <Alexander.Deucher@amd.com>; Koenig, Christian
> <Christian.Koenig@amd.com>; airlied@gmail.com; simona@ffwll.ch;
> sid@itb.spb.ru; Huang, Tim <Tim.Huang@amd.com>; Zhang, Jesse(Jie)
> <Jesse.Zhang@amd.com>; linux@treblig.org; Huang, Ray
> <Ray.Huang@amd.com>; Rex.Zhu@amd.com; evan.quan@amd.com
> Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; Charl=
es Han
> <hanchunchao@inspur.com>
> Subject: [PATCH] drm/amd/pp: Fix potential NULL pointer dereference in
> atomctrl_initialize_mc_reg_table
>
> The function atomctrl_initialize_mc_reg_table() and
> atomctrl_initialize_mc_reg_table_v2_2() does not check the return value o=
f
> smu_atom_get_data_table(). If smu_atom_get_data_table() fails to retrieve
> vram_info, it returns NULL which is later dereferenced.
>
> Fixes: b3892e2bb519 ("drm/amd/pp: Use atombios api directly in powerplay =
(v2)")
> Fixes: 5f92b48cf62c ("drm/amd/pm: add mc register table initialization")
> Signed-off-by: Charles Han <hanchunchao@inspur.com>

Applied.  Thanks!

Alex


> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> index 4bd92fd782be..8d40ed0f0e83 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/ppatomctrl.c
> @@ -143,6 +143,10 @@ int atomctrl_initialize_mc_reg_table(
>       vram_info =3D (ATOM_VRAM_INFO_HEADER_V2_1 *)
>               smu_atom_get_data_table(hwmgr->adev,
>                               GetIndexIntoMasterTable(DATA, VRAM_Info), &=
size,
> &frev, &crev);
> +     if (!vram_info) {
> +             pr_err("Could not retrieve the VramInfo table!");
> +             return -EINVAL;
> +     }
>
>       if (module_index >=3D vram_info->ucNumOfVRAMModule) {
>               pr_err("Invalid VramInfo table.");
> @@ -180,6 +184,10 @@ int atomctrl_initialize_mc_reg_table_v2_2(
>       vram_info =3D (ATOM_VRAM_INFO_HEADER_V2_2 *)
>               smu_atom_get_data_table(hwmgr->adev,
>                               GetIndexIntoMasterTable(DATA, VRAM_Info), &=
size,
> &frev, &crev);
> +     if (!vram_info) {
> +             pr_err("Could not retrieve the VramInfo table!");
> +             return -EINVAL;
> +     }
>
>       if (module_index >=3D vram_info->ucNumOfVRAMModule) {
>               pr_err("Invalid VramInfo table.");
> --
> 2.43.0

