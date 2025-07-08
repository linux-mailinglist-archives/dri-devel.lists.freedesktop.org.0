Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F332AFCE9D
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 17:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF20C10E67A;
	Tue,  8 Jul 2025 15:10:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e7vuG9vQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D7910E141;
 Tue,  8 Jul 2025 15:10:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UcDx2ItKRdoGVXMGzALoOZZDtCXaFR/FWZCobxsUvimAkGF7kpuEihh1HLrT5OrUrTQlGHe8w+wHb/iZoj3332IkoXzKziZ22u1HiDAxU3TLUOj1ZXH9XLcct7FN0oTsCrqC+DY7CG8BBJAEZ1H4S1Xbye4XquVNPBjUyl36fNAXgw9YeUwu+HKPiRanpFa+Yos0zVcipI/12igOVNu1thCLvpsV0P+O7kWKvmYn84KxQeKLmBkP5dvXHUrSWApvykiiWpEw+UjvLhetwoXFde3ETaZ+PFP/uEYYlca6DmOjKX2RnVe+RfB0vtjwtTVPdOZaBHtclLwXe/ZIFYK/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HFPOA+VDHGLK04+mYfY25+ER0Nhr8zJa2eVtjglpKhI=;
 b=byrJXgov27NixP6bFn+zIF+XcUeGgOC4jjG+D+wg7ibohnyArKyFTFoFwG5PzxN/aGh1PCPk3kO+4j/vifjVqYoz6mSpoWykDYP9pLj1e22GL8gLFX2wGvInUEnykZ/TU6WYWw9hdn75podxArHQJMuiVkjINP7fxSDxfuOKp3ewQa6e1T1czMYARlnl1Crp3wNl7AJKUU38P8Nh0/gVQInz/J1oQVQ9uwj68VI20KRDyEBceoQYSzCu7e3bnwnYJ5s6VAiUS4jb5oqXleZN2T/xsTq/uGDLi7L7UugD8yxu3TY8yy3aYBTLsCrHXzEtUh5f9BobUQ8+X0ZMXL8fYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HFPOA+VDHGLK04+mYfY25+ER0Nhr8zJa2eVtjglpKhI=;
 b=e7vuG9vQXB6dnYqy/uJ+0nB/E3+KcUx0p4sEdiwci/lMP+Mfq1CxvC+pFaqfmVD3p7Qa4JEghQtlmtwjNF/Jbl6S7D+DDpsQqy3syHZ7z5PpYRjfUVyjRJ1jAv3Q2+oKx6jaob8lwD7WPJl0fBnds0cleOFFhkDlGWqbrVgFwI8=
Received: from BL1PR12MB5144.namprd12.prod.outlook.com (2603:10b6:208:316::6)
 by CH3PR12MB9122.namprd12.prod.outlook.com (2603:10b6:610:196::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 15:10:17 +0000
Received: from BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42]) by BL1PR12MB5144.namprd12.prod.outlook.com
 ([fe80::491a:cce3:e531:3c42%4]) with mapi id 15.20.8901.024; Tue, 8 Jul 2025
 15:10:17 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "McRae, Geoffrey" <Geoffrey.McRae@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>, "Kuehling, Felix" <Felix.Kuehling@amd.com>
CC: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCTLs
Thread-Topic: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCTLs
Thread-Index: AQHb77/tr0JuVvZNCUyuhhAzX4RdRbQnzKYAgAAkzYCAAGOm0A==
Date: Tue, 8 Jul 2025 15:10:17 +0000
Message-ID: <BL1PR12MB5144018C868ED8C6566B8B84F74EA@BL1PR12MB5144.namprd12.prod.outlook.com>
References: <20250708042219.180109-1-geoffrey.mcrae@amd.com>
 <470a613e-d85d-4943-aa48-7590d84f7fd2@amd.com>
 <PH7PR12MB55958988869861DF44D3D007884EA@PH7PR12MB5595.namprd12.prod.outlook.com>
In-Reply-To: <PH7PR12MB55958988869861DF44D3D007884EA@PH7PR12MB5595.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-07-08T15:09:42.0000000Z;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source; MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;
 MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5144:EE_|CH3PR12MB9122:EE_
x-ms-office365-filtering-correlation-id: 267b2d03-2f53-4722-d75f-08ddbe318c50
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?+eACFZNUQNlggxwS4mH6/TvsxtbQHDGhqDGXLKZKvSppGNKEzR3i3Ee07zn0?=
 =?us-ascii?Q?F5FKFl4/skudiyrLiTHf5yvISrH3XhjR61XFY1qemMuvp5ixQXeXQWHCMuaL?=
 =?us-ascii?Q?7U80wLfN41Hr7M+G/kt6zSCwYbqJxDVMFdzE8jHc/5ciV8Dmf39C6G+olFpC?=
 =?us-ascii?Q?LJUQ7XZFxAQaCnu1Uy+FxCpO/qoL5+3IX3cwtoqzQQS2wr/lLymJiNqcHgfJ?=
 =?us-ascii?Q?+oRo9onFY98mBq5T9M62JvvPe6D/x6yyxk2ASyLiSmoDlty6qX2tnpmpZ+Jk?=
 =?us-ascii?Q?OVHGowQ9E16C2PwCjzh0dhdeQ37lEO4Oup0VnQepwnQ0ln7TDlgiUvUjxLcF?=
 =?us-ascii?Q?mfnr9nUm4hAPw1rWpHRokoo9HZMd/lYkhanPr0jV/SX7Q3PYsgVFZtxCAXHG?=
 =?us-ascii?Q?7AciFJx5ngSzQ+zQ/2E8B2WU1facUb87PkXezf893bbHxVXk2GqQq6Ndwjc+?=
 =?us-ascii?Q?lZnIc2Hn2z0vKz874iMNnpMbvEznc0FjoHCwGUIqnQ++7TpvCBs3mNlbE598?=
 =?us-ascii?Q?Ssn0KwDnlZuZ2TPF4QW7vGBPr4nxPYRoiG6A/GifRve8aqa6YjTvxGukcdjd?=
 =?us-ascii?Q?CZ7089nOuTjQ/ZHL9rStSO2IQTx9WChtPLFPNOxIh8r8emYyke1ppEb/BExz?=
 =?us-ascii?Q?3vFqiIeCgWdJQ2t5QuLNvElmf0PY0IM70jLYaBlP3VqH4AQV8OGtby2Aexqe?=
 =?us-ascii?Q?uJ51v05gVgNU34XzabIEQijTvbPnvWdXpTmJsHmsb04OkrciH2U/yQz7tdij?=
 =?us-ascii?Q?/SkS++hLPXwZEJNTQtFd+QpVsXEM5iYmnw6s8VXeVBPqIAu/vYsVquWwHs14?=
 =?us-ascii?Q?HUS1iskN+n2ZehLZakHlFHK0ZazGVNE9eRFPvMh748gNlIIT3Qk0p55ovUep?=
 =?us-ascii?Q?L52somJQcdEIxH8CcuOZ7mqpibwwK2jvGP2vDYED5ySKpU4uWU9cHtHc3yas?=
 =?us-ascii?Q?Ogrjveg3tu+k6LSMAz5ORIor15KqFkw28NhRWC5s4KySpY142wahahR6Pkv2?=
 =?us-ascii?Q?mE/5KuwfDbvSIt+r8qf1fwGiSKVkatLn6hIfm2/728KzhYI4N5gAuwNhMO+n?=
 =?us-ascii?Q?PZrsP2HULQRSGqERIvJNTT20Ib0UtimoGlRyYsX/wtEPt5J50itkAL60jQFH?=
 =?us-ascii?Q?h0Gy5qG2AksepVNlpBvFjtpPHqDaMGLAHx1kPYvE4hWKV/i5OuCE102v14rO?=
 =?us-ascii?Q?VGMpGJOm48tjSNsPy5jHSWW2vTwyBVFk/+BARF6X5lN523aMvJzG0RaYZ1aU?=
 =?us-ascii?Q?Uy86DBtZ1EXmE18DoH5ivmIMpjYNKlO5OneC6h4IUC44OExaM6+PaMG/ZT3K?=
 =?us-ascii?Q?j3AoKTMv/ohCsP18CNnP0gv5LIj0hqGaJdgfm1uIX6j+LI2fO1/e1Yhh3bU/?=
 =?us-ascii?Q?+2zxG0Z+dyo91MAVi8GoJv7gxGsQ7XitNTVh6/PKCU5ANW17nmzm+fwojJXw?=
 =?us-ascii?Q?e+swdeTdWTGq3nUbTV3EYW36PdF3BIwn0AHmrx3tYxq2m3n19LULmQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5144.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0E3l1PyGWLGlQuOYl9jc6wZ1MQiTuOXDZ7vQ2wAIUKSxCKM+adGLsrPFuK1C?=
 =?us-ascii?Q?OvcGkvkme+PXzGWLsohb33+fsP2E8xPyJ6aNUcF28Ms+JslSLVIxzMd5ejz5?=
 =?us-ascii?Q?qhoczKcwY9d2aJd2dS/zpGhdbDavJYpKZHp5zz34OgTVD9Sm98wmkOgqQ+QV?=
 =?us-ascii?Q?huvom3HjloOlBQf26+ANOkSZkDx6O/bgm3wWxgRuY+h9eKAVp3KtI++IJV6v?=
 =?us-ascii?Q?/aQYK7beK144i+QzSFJB1FQFSoPAyFswHyyL6tUWvxmPsgVNIfyGOtJi+8T3?=
 =?us-ascii?Q?a6onmSoRQNZ8WltqjPReUrgkImlytzfYMlDrYx1KCDbVmOTRQdpctrKTOyjA?=
 =?us-ascii?Q?JRnXOq+tHyKZ/7kLVrCEAWosiAmr3kzEUNFH+n1NAiMaR6fzA1s8H84OX49g?=
 =?us-ascii?Q?xxIRuiEoxGH/4R1oZEsFbLwGfjKlrGfJ5LmbAo8ScxxM2pvUCLvzc2X/QFFO?=
 =?us-ascii?Q?t3bbwzX2vdHW2IhdBBVcKeWK3Q+tItEqM8FW2xM0nW8/ly+AvBamO59knRjK?=
 =?us-ascii?Q?ryJ7NrPhHWkZIEZTEmda4tPEbnxcuTOnvKrzPHAm69rYz8YvlxzC7WYdOBwT?=
 =?us-ascii?Q?wKY7Iite3vhKevKb1aCl29vovtwTl7ntw0oDCtAZ3I7qxDHuQaUKyRWLd24c?=
 =?us-ascii?Q?vlKlB+L7sQo3vl3u1oour2jLDnAAIeu5+ezqBHaRqeuG7aIVXoE16xtBLpsR?=
 =?us-ascii?Q?DS4NYk0staVAfTKqCFUx5YjTvD9vbBrqJHQYZf+dpiuRHlsYPVlnuS+J3goD?=
 =?us-ascii?Q?ibosFSt1pUOKeFkv6jrLvxxW704+/8fLg9+cM9xrUbXtw0mp4GdIF6G9ka8k?=
 =?us-ascii?Q?Ouvf1Y0EQaSxQCDMt56MYkSquibv+kpE3SuVLeujkxEfHA+nD9HQvgj33Uq+?=
 =?us-ascii?Q?02euf7iVb7lds2VY6wEAO1t7y1aS70SMiXHEDdp7SYzlRSEUHG9Qg+zP9qLG?=
 =?us-ascii?Q?FmNHhmAeVHcWEQffPVF/0ccoB4HRvTW7BUZS7UAygpNfCsANUrBht0b/09+H?=
 =?us-ascii?Q?Jonol2lqyMMJq5gJumdx1h3OD6ch0m2rFDnR6ykF0N3Zy2glRza+eKV062NE?=
 =?us-ascii?Q?GIzlyUjCqhtQrGFXSdEESK9q0n2IiHlfbYBL74oDgUQ38HFRsVhObPgRWEdu?=
 =?us-ascii?Q?JAPSarE7Rg460pJLby99ZccZ87Udb7IMJ0smzi2GH3oM4qq9oU8gz3dyO/ir?=
 =?us-ascii?Q?uzkMRVWlRJxF56c9QdzsTc512qH7Uv1tnnEknWJWlNYwTM1DEBIn3xXLubi1?=
 =?us-ascii?Q?97BHqLeUEFDx+8F7giSp6fQ1uAIPcCJjIbD/SKl3Fu7YbSgmCiI1kCg5bBlg?=
 =?us-ascii?Q?IRlHYpwLLqX11ZTW/p05qYTFfkw9zQ2KU3YbUIvDvSN8V0V5YNtzuaDiuBhj?=
 =?us-ascii?Q?Q6YUeUqtGITqAqBcUykxgRoUyKkBW8PHt13H5/2cP5pwLnW8wAeOEhOTD9Kp?=
 =?us-ascii?Q?bshmnsJHHieheeJFiE4DvT/r+SsozRoCZK+I1bJGaP847TSvEjz2axptdZEq?=
 =?us-ascii?Q?nAmuWhdWhUr/siezdLl16NiBRmVC60pQ1zLQqtgTCtboVa/cX+HTuMURN0CO?=
 =?us-ascii?Q?UxIwAP+L3t2qOnq7x6o=3D?=
Content-Type: multipart/alternative;
 boundary="_000_BL1PR12MB5144018C868ED8C6566B8B84F74EABL1PR12MB5144namp_"
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5144.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 267b2d03-2f53-4722-d75f-08ddbe318c50
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jul 2025 15:10:17.2971 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p0XV55ITkeWOxkZOw5dcNDZgE/COzpuyZzdF1W3puvJPQM2+SMRKp0yzYyZSijHhneAAstbg7j3cRw5cNrGWng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9122
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

--_000_BL1PR12MB5144018C868ED8C6566B8B84F74EABL1PR12MB5144namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[Public]

I seem to recall -ENOTSUPP being frowned upon for IOCTLs.

Alex

From: McRae, Geoffrey <Geoffrey.McRae@amd.com>
Sent: Tuesday, July 8, 2025 5:13 AM
To: Koenig, Christian <Christian.Koenig@amd.com>; Kuehling, Felix <Felix.Ku=
ehling@amd.com>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; amd-gfx@lists.freedeskt=
op.org; dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCT=
Ls


[AMD Official Use Only - AMD Internal Distribution Only]

I am happy to use EOPNOTSUPP but I must point out that this is not the patt=
ern used across the kernel, the standard is to use ENOTTY, which is also th=
e default that fs/ioctl.c returns when no handler is present. Userspace too=
ling such as strace and glibc specifically expectect ENOTTY to indicate inv=
alid or unsupported IOCTL.
________________________________
From: Koenig, Christian <Christian.Koenig@amd.com<mailto:Christian.Koenig@a=
md.com>>
Sent: Tuesday, 8 July 2025 5:01 PM
To: McRae, Geoffrey <Geoffrey.McRae@amd.com<mailto:Geoffrey.McRae@amd.com>>=
; Kuehling, Felix <Felix.Kuehling@amd.com<mailto:Felix.Kuehling@amd.com>>
Cc: Deucher, Alexander <Alexander.Deucher@amd.com<mailto:Alexander.Deucher@=
amd.com>>; amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.o=
rg> <amd-gfx@lists.freedesktop.org<mailto:amd-gfx@lists.freedesktop.org>>; =
dri-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org> <dr=
i-devel@lists.freedesktop.org<mailto:dri-devel@lists.freedesktop.org>>
Subject: Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupported IOCT=
Ls

On 08.07.25 06:22, Geoffrey McRae wrote:
> Some kfd ioctls may not be available depending on the kernel version the
> user is running, as such we need to report -ENOTTY so userland can
> determine the cause of the ioctl failure.

In general sounds like a good idea, but ENOTTY is potentially a bit mislead=
ing.

We usually use EOPNOTSUPP for that even if its not the original meaning of =
that error code.

Regards,
Christian.

>
> Signed-off-by: Geoffrey McRae <geoffrey.mcrae@amd.com<mailto:geoffrey.mcr=
ae@amd.com>>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_chardev.c
> index a2149afa5803..36396b7318e7 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -3253,8 +3253,10 @@ static long kfd_ioctl(struct file *filep, unsigned=
 int cmd, unsigned long arg)
>        int retcode =3D -EINVAL;
>        bool ptrace_attached =3D false;
>
> -     if (nr >=3D AMDKFD_CORE_IOCTL_COUNT)
> +     if (nr >=3D AMDKFD_CORE_IOCTL_COUNT) {
> +             retcode =3D -ENOTTY;
>                goto err_i1;
> +     }
>
>        if ((nr >=3D AMDKFD_COMMAND_START) && (nr < AMDKFD_COMMAND_END)) {
>                u32 amdkfd_size;
> @@ -3267,8 +3269,10 @@ static long kfd_ioctl(struct file *filep, unsigned=
 int cmd, unsigned long arg)
>                        asize =3D amdkfd_size;
>
>                cmd =3D ioctl->cmd;
> -     } else
> +     } else {
> +             retcode =3D -ENOTTY;
>                goto err_i1;
> +     }
>
>        dev_dbg(kfd_device, "ioctl cmd 0x%x (#0x%x), arg 0x%lx\n", cmd, nr=
, arg);
>

--_000_BL1PR12MB5144018C868ED8C6566B8B84F74EABL1PR12MB5144namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#467886;
	text-decoration:underline;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Arial",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<p style=3D"font-family:Calibri;font-size:10pt;color:#008000;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
[Public]<br>
</p>
<br>
<div>
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">I seem to recall -ENOTSUPP being frowned upon for IOC=
TLs.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif">Alex<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif"><o:p>&nbsp;</o:p></span></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif">From:</span></b><span style=3D"font-size:11.0pt;=
font-family:&quot;Calibri&quot;,sans-serif"> McRae, Geoffrey &lt;Geoffrey.M=
cRae@amd.com&gt;
<br>
<b>Sent:</b> Tuesday, July 8, 2025 5:13 AM<br>
<b>To:</b> Koenig, Christian &lt;Christian.Koenig@amd.com&gt;; Kuehling, Fe=
lix &lt;Felix.Kuehling@amd.com&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;Alexander.Deucher@amd.com&gt;; amd-gfx@li=
sts.freedesktop.org; dri-devel@lists.freedesktop.org<br>
<b>Subject:</b> Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupport=
ed IOCTLs<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p style=3D"margin:5.0pt"><span style=3D"font-size:10.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:blue">[AMD Official Use Only - AMD Internal=
 Distribution Only]<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<div>
<p class=3D"MsoNormal"><span style=3D"color:black">I am happy to use EOPNOT=
SUPP but I must point out that this is not the pattern used across the kern=
el, the standard is to use ENOTTY, which is also the default that fs/ioctl.=
c returns when no handler is present.
 Userspace tooling such as strace and glibc specifically expectect ENOTTY t=
o indicate invalid or unsupported IOCTL.<o:p></o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"font-size:11.0pt;font-family:&quot=
;Calibri&quot;,sans-serif;color:black">From:</span></b><span style=3D"font-=
size:11.0pt;font-family:&quot;Calibri&quot;,sans-serif;color:black"> Koenig=
, Christian &lt;<a href=3D"mailto:Christian.Koenig@amd.com">Christian.Koeni=
g@amd.com</a>&gt;<br>
<b>Sent:</b> Tuesday, 8 July 2025 5:01 PM<br>
<b>To:</b> McRae, Geoffrey &lt;<a href=3D"mailto:Geoffrey.McRae@amd.com">Ge=
offrey.McRae@amd.com</a>&gt;; Kuehling, Felix &lt;<a href=3D"mailto:Felix.K=
uehling@amd.com">Felix.Kuehling@amd.com</a>&gt;<br>
<b>Cc:</b> Deucher, Alexander &lt;<a href=3D"mailto:Alexander.Deucher@amd.c=
om">Alexander.Deucher@amd.com</a>&gt;;
<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.freedesktop.=
org</a> &lt;<a href=3D"mailto:amd-gfx@lists.freedesktop.org">amd-gfx@lists.=
freedesktop.org</a>&gt;;
<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-devel@lists.freedesk=
top.org</a> &lt;<a href=3D"mailto:dri-devel@lists.freedesktop.org">dri-deve=
l@lists.freedesktop.org</a>&gt;<br>
<b>Subject:</b> Re: [PATCH v2 1/1] drm/amdkfd: return -ENOTTY for unsupport=
ed IOCTLs</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt"><span style=3D"font-s=
ize:11.0pt">On 08.07.25 06:22, Geoffrey McRae wrote:<br>
&gt; Some kfd ioctls may not be available depending on the kernel version t=
he<br>
&gt; user is running, as such we need to report -ENOTTY so userland can<br>
&gt; determine the cause of the ioctl failure.<br>
<br>
In general sounds like a good idea, but ENOTTY is potentially a bit mislead=
ing.<br>
<br>
We usually use EOPNOTSUPP for that even if its not the original meaning of =
that error code.<br>
<br>
Regards,<br>
Christian.<br>
<br>
&gt; <br>
&gt; Signed-off-by: Geoffrey McRae &lt;<a href=3D"mailto:geoffrey.mcrae@amd=
.com">geoffrey.mcrae@amd.com</a>&gt;<br>
&gt; ---<br>
&gt;&nbsp; drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 8 ++++++--<br>
&gt;&nbsp; 1 file changed, 6 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/dr=
m/amd/amdkfd/kfd_chardev.c<br>
&gt; index a2149afa5803..36396b7318e7 100644<br>
&gt; --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
&gt; +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c<br>
&gt; @@ -3253,8 +3253,10 @@ static long kfd_ioctl(struct file *filep, unsig=
ned int cmd, unsigned long arg)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int retcode =3D -EINVAL;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool ptrace_attached =3D fal=
se;<br>
&gt;&nbsp; <br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (nr &gt;=3D AMDKFD_CORE_IOCTL_COUNT)<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; if (nr &gt;=3D AMDKFD_CORE_IOCTL_COUNT) {<br=
>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; retcode =3D -ENOTTY;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; goto err_i1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((nr &gt;=3D AMDKFD_COMMA=
ND_START) &amp;&amp; (nr &lt; AMDKFD_COMMAND_END)) {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; u32 amdkfd_size;<br>
&gt; @@ -3267,8 +3269,10 @@ static long kfd_ioctl(struct file *filep, unsig=
ned int cmd, unsigned long arg)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; asize =
=3D amdkfd_size;<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; cmd =3D ioctl-&gt;cmd;<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; } else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; } else {<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; retcode =3D -ENOTTY;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; goto err_i1;<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt;&nbsp; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dev_dbg(kfd_device, &quot;io=
ctl cmd 0x%x (#0x%x), arg 0x%lx\n&quot;, cmd, nr, arg);<br>
&gt;&nbsp; <o:p></o:p></span></p>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>

--_000_BL1PR12MB5144018C868ED8C6566B8B84F74EABL1PR12MB5144namp_--
