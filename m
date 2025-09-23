Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0A7B9630A
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 16:20:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A18F510E1CF;
	Tue, 23 Sep 2025 14:20:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RKm4GZpo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013029.outbound.protection.outlook.com
 [40.93.196.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960ED10E1CF;
 Tue, 23 Sep 2025 14:20:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emSaLy4qJytwq/01dK6SkrGGlhtHORZmtFEbfFW4tVVbNEayvUEBnsK7onABOi60vXCDiyOOc6yKEAYOlqdYzz4pNaJYhAPGIrmm9LRgqB1yV4K083BG/PTiyhwLg9dRCOeUdChtA9C1q4rC21+qFSgPzTnssJTK5CbtDmUXeoEBHcWPo2df5MXw0lSWc/77M1yP5xgCMrKqLYOoB0hpBj5sRpkbf6/BXJRoiTXZ4hhsM+ltzv2OlNDASfqSoiRNWWIxPkMO9TnVRWPyanznmtadB4MWJspENLgIDkOK/fvcnKpvuwu0ZS4p5K2bPK7G/z1K6eqxQn0SQddyZnUFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tL2eLZrvjk7C6KwuBE33OUu0LyZDibXLdemZQezc+J8=;
 b=kfj9gqui8LRA2+E8cI2FwReKkh5lhKWjD0U6Y788iPxfLj4tiVaUK2j5nRFCZ8c6CgzQMUZFcBaiXJN2bACJzpANCblxBUbRptZ+0qh0y9iKaVAFJ80SHaDOvQkpvXqzMjM92YpqzurAGFMKTDo4gKUgWUaqya+tIZQSFvTQrzAitarhZXWel2kzNicD25pqWExKryEpY1Xu3P2b0DJOE8oCv1BRVzT2bDZBEOvHZtVfrWjHD5H5m9OdBx80Kg/ovpIRwuqtmAU2SeBfl26T5z9azdi7sSJ7RmIan+fqhg7u6X54nZ69uX4VFEAUwbBEESEpDSlkgdkiaXeC0x50eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tL2eLZrvjk7C6KwuBE33OUu0LyZDibXLdemZQezc+J8=;
 b=RKm4GZpod1DxFfUovxBon4IwxPAtgk5f83BD2LU70qDtlv/8eLCx3nvgSjsa4KnG3spbH/otcVp+/PF6qPOyioV3cLi5UM6dJ+3veFaPxmjuCy2I0qznp7yELAWf1A7MABpyDRzVqdBpGXhYMRMZOkmhBCc61jXAeG5+orylq9O0L9D6xzf1hVDozP7kHu9gawN0AOKfT3W34G/8Y2OVSLA0S3lzVgEsYPz6xnt46XQFcHECZMHeCJgT3HnCYYy7mjDc6T45GSdyKFtVQgU3/IYa02uePUGsZC/Xp9w40op9jEzrReZu+YzRoxH2Mw0lQg1mRexCWf7dIBRSdEtAgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9230.namprd12.prod.outlook.com (2603:10b6:408:186::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Tue, 23 Sep
 2025 14:20:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9137.018; Tue, 23 Sep 2025
 14:20:42 +0000
Content-Type: text/plain; charset=UTF-8
Date: Tue, 23 Sep 2025 23:20:37 +0900
Message-Id: <DD08VDPA45X8.2VXMD1RJBAJER@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 02/10] gpu: nova-core: Create initial Gsp
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-3-apopple@nvidia.com>
In-Reply-To: <20250922113026.3083103-3-apopple@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9230:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6256f4-a56d-4d3f-f31b-08ddfaac5fe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|366016|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TVNSWTlqM3hkT2pSWmFCMXJTckl5Z2JQSURKL3ZNeXV4T2czOWhZeW9lL2pZ?=
 =?utf-8?B?TmVYdkVzV3kzYSs4ZkFreEdoNkZVU0tuYTE1emg5a2d2Zy9IUjZsenpqU0NS?=
 =?utf-8?B?NDZPVmMzY2ZqSHFkSGxLTXhvbDA3OElNS1E3QnNTUDRNaWllVzllVFNUeVRs?=
 =?utf-8?B?bUUveHBMVlBrdzU1bGRlK09VVHZVSlZtU3hWY0xYRWdUYmI0NWVPSWdCU2U5?=
 =?utf-8?B?R3Rkb0R5SURXdTRHZ3d5T05VZzVEcHhsR2Zzck83K1dkSURyNEY1bDhnTXZL?=
 =?utf-8?B?OEFJY0QxRFI1SmI5MzdLMGlOa2FvYnowWmVIQ214bmNsR3A1YVR5MWhtaWNP?=
 =?utf-8?B?YTZLUysyQVhNdDQ1dkV1OXpRTXpxOHJqTlo0RHdONGtsVEVwajRSYUlLS2Nm?=
 =?utf-8?B?MmZmMCt5Z254VVlaRktlMlVKWCsxY0NQbk1qMkVNRi9McHY5VW9KeHhOUThF?=
 =?utf-8?B?L3NJRnkwVnFmemxETVZMY3MrUDMydTdzQ0NDaFhqcTNiYS9FOFlQWDJ1K05p?=
 =?utf-8?B?TitQbmJUa2NrbnRvSEFMTkNIcm0xUW12SUoxdFIxNXVHNDI5T1IrT2pxNytz?=
 =?utf-8?B?d0tkM0NPNU5vM0c1TmhaczdmV3JiNVdZdUhBcHdKY1VQbWJsTTZEU0dTQ1Er?=
 =?utf-8?B?T0JuakpqT0hpSEdaQWc4eE5EZCtSdzhvSlV3NVdZZW1pNWFVWjhtVXkwYksv?=
 =?utf-8?B?MzU1TVJUbHF6ZmZtMHlFUEU1SG5LUWxXN2NHVncwQ2RBTVlYMlMzOHRyaEJJ?=
 =?utf-8?B?aEhXcmJWa1FaZXNHWXJ5TzZqMlljb1FzNzg1aktVNlA5MzViL2h0ZkxKQ3BU?=
 =?utf-8?B?QWkva0J3SVRsQytDREkza1ZDT3FTQ2x4d25Da2l4bWROLzRiZG9mSGxEK08r?=
 =?utf-8?B?a212RWVZV3lmejJzTUFrNEpaMlAzc1BlQXhiNitUMTJLYXZyRUsxNkVrRHZv?=
 =?utf-8?B?ZnRqV2cyRDNEdm4rU0ZiMDhQZ0RsUXFJOERQd3BUWnFudHBITWR3WEsrczdP?=
 =?utf-8?B?dHpIOVJaWnFsNDUxWjdJNThtS2hPZitlU2dMbDkzZkoyMU1XK2I1WnVrcTd6?=
 =?utf-8?B?WWloK2syMDFJVkd2SGFQaTdTMXI2SThxMm9SMlJUNXFoVE1NcDBCUHIrbGpz?=
 =?utf-8?B?UUl1UXQvTlIvMHlyd1BOd0dzZytjZUd2V1NRQmJ1RjhIQjliUDJ5VWhJc3dS?=
 =?utf-8?B?VHErcmFPRkRnczBPVkd5bjRkckZKWDdmZlhncXpFRkRKK3dndGY4b3FzNEZk?=
 =?utf-8?B?U3hTTDZnQ0ppYUwrYkFrdFViaE8vMUJDd3p1TWVlWStZajlubVpIcVBqNitO?=
 =?utf-8?B?aWxoRW93TjRHKzVET0w1RnRWT2RvNUYyM01naTQ3Z20yRjRiN0dpY0pDUWdW?=
 =?utf-8?B?S2x0N3ZrQTlpTzV4cWRHeTZYd2ZHZUxQVUdpVXhEdmptNUlaUmROMVJ6WVg1?=
 =?utf-8?B?TFJJRXkwbzN5TWdDM0NqK1cxUDhEVzdKS1ZMS05WdXhzdS9FQ0hndm9nclln?=
 =?utf-8?B?SDBSLzRjVEczaWVVZFlPcm9HYnEzU2lXdVNCdE9aalEzWENNbU5xRWtkTTFT?=
 =?utf-8?B?VGxsQmZCMWFWZkdjY0tYWm5xaHlNSEhKc1VpeUorWDFVenM3OXNIRHZaYVpQ?=
 =?utf-8?B?bUxqdnhqYy92b0N4MEcyakZleHR2ZkFZQkVwVksyY3dxU0hoUmU0ZGxKY3Y2?=
 =?utf-8?B?ckxDcVdlM3RJQzBmdnIyS1Zxd0FkSDJZc20zS3ZYcFJuYjIxbHErTnVrUzNv?=
 =?utf-8?B?dlZWY202Zm8zajUwVXVkUjdhYVFTOVo2VUxnK3BNZ2ZaMWcvK3VFSk1ERTla?=
 =?utf-8?B?WlpUY3o2SVhtSlBJVEgxVnFTamt2VDE4VEw4U1RGWWZYR2NDM2s0ZHJXZDJL?=
 =?utf-8?B?YWJZZ1llSjRJWFB0WDlsdktHMVU3TThGbStSYU4zS0U4bUluZ09zNGR4MVF6?=
 =?utf-8?Q?6LpValaxHkQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(366016)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1lkYmRmcXk5YTcvZERpRVdoWnkyZXhIY210Skt3Tm1WOW8vbjhqbFgwN0Zv?=
 =?utf-8?B?eXI4d3dPbkRCbndCTW9OcnJVZ1FpVmlxZWN2bDNjOVF2cUhCVmNsaENvcERN?=
 =?utf-8?B?TjRYOStEalV1UjZrWXBXWmx4UWpUY3FjOEloaVIvbFVaWlBqMm1VeURQWDFp?=
 =?utf-8?B?ZVl5aWk0cEE0ekVwTEM1Y0t3ZFpnaXFydHdZZklEMWhCWnNhcEpjMXN4UjJN?=
 =?utf-8?B?aFMxOUVzYUkxQUVIZlROQmdWck9YWnZWelVMaFlZSk1PWWkyNzNMQVdpeGZN?=
 =?utf-8?B?R1VzWi94Ri9CRjRGMkdkNjlGRXh0OGVKZkUyQ2hwMjkxZ1prbzJITWFqSUpV?=
 =?utf-8?B?QTkxbUhiMWU1cUtObE1KN3VCa0hNSTV2Vk9BR01vMmkyeitYWkh1Smdwd0ha?=
 =?utf-8?B?NVVFWWFhWjZmbi91YWZEUm9OOXdzbkNjQjlQK1dkM3JsUTRXQXVLZHRxUit5?=
 =?utf-8?B?NVUyTVlPbDBOdmtzK0FPUFNNQktNWXVkT2ZPL2pBR2ZKRWJQeWFOU2RXMWYy?=
 =?utf-8?B?TDc3c1M2U2JHRFZhOXI4cHBmRE5JazdGb1lZN1VFUm9zU1c2RExpbjVmaG5q?=
 =?utf-8?B?MFpoYkJHQ2oraDFCSTJHb2NxVlNjbmk2dmVneGI1ZGU3MDJsVWI4cllpK2Vi?=
 =?utf-8?B?c05USURsMVdiWW1pNWszOGpIRXI5QnZNQmtXVS9RZGVvQnQ4aVlYV0QzcVpS?=
 =?utf-8?B?NnhHSm14WWVqZktSTHhTMTVIMmMrbXNGT25QM2I4WXFkSk0veExXK2ZpUDlV?=
 =?utf-8?B?UEc4UlRMS3R0YUcrOEdHS05QWVlwaFdIQnpwbVVqRnBIY29UVVNwVDZwRzJw?=
 =?utf-8?B?Zlc3TXRBYzhmdTh4aHFHRTU0Z0xmYjNkMmNVaDRMejB4TDloRDJvYnYxRW96?=
 =?utf-8?B?OGRqT2U2VEhDQVJzOWJQc2VnOU1PbFpNNnZBcjhtZVlWOWxEclRFMTVCMHN4?=
 =?utf-8?B?QndBeU1vNkRTODVUeENoWENOZ2loNUdDUUJQOFhCamxSUEc0ODRKUGF0Wjcr?=
 =?utf-8?B?Tm11RWl1SEVUeCtMb3JuK0wra1lRak9rQ2hXSTMwaVJrUURmU3g4dUg2TmVP?=
 =?utf-8?B?ZVBLRjhoblpGYUwxTUxwbThSc3lORlR0T1U2c05lQUFDTDFYMEJTc2Jhb3p1?=
 =?utf-8?B?YklaYjdjMlBJZzFXWGJXeWN5TmdJL25EQ0VtcG4zeVFTdEhSazRPczNSM1kw?=
 =?utf-8?B?YmF0V2dmUFBNcTljRzArMFVSVlhUUURSeVUxdWJtS2pXU2l3YjVYOEMwLzNk?=
 =?utf-8?B?azlBRUNnQ3B0a3RIakR6NmFoT1RTQ2FuYWlyWFZIYzc2cnBkOTRqamx6YXBj?=
 =?utf-8?B?RlVsdkdyeHd6MGNKT0JHdUJzTHJDQ0J4MFEyVkd5d0wvYms4U01QVnNRbG9p?=
 =?utf-8?B?cmpHak1MbU1OUWt0WFgyczFFV0ZSbGxIVTN1TCtOOUltdEc1WW9RUUd6L0F1?=
 =?utf-8?B?clBGYUFtUkhiYWY5MmxadWFFWnNaTE4xM2FSaXJZZmx5SlhDM01ONklzSTlE?=
 =?utf-8?B?Q0htRzlhcXIrT0tVNk5ZT25sNTh0eDRQaG5hRU9Wd3h4Y0xXNnM3dnBadFZx?=
 =?utf-8?B?M1ByNkt6VSt3VTdLNWRKR3dDblJhRllZOUtaTVlaa1ZSZ3BsaXpIQmZiSnBz?=
 =?utf-8?B?djBhYTQyYmUyWVMwT29GYkxzQ29wZnhWUmI5NDM3dStTRUhqbVk5d3JhcmJq?=
 =?utf-8?B?VUt2VVVqQWErc1NIU3dVWGJYNjQwVTJMTFNGMThEWE9OdCtXa25rb2liWWo4?=
 =?utf-8?B?M0d0WDUwZTduY3NEK01DVVhIVUhxVUFjd0Zuazc3cStOWDlJcTlvVmVlUVJm?=
 =?utf-8?B?ZDJZY3lDUnVhNUdxRWUxRVNVdUV2c1o5SldhN1k5NFhaMFpSeEZoTXpDcnBO?=
 =?utf-8?B?SWk5N1lTUFM0cUwzN29uQ05RVWJpZGZBTDNSdXRHZ1FtbHpFL3lZN0Zha2ZI?=
 =?utf-8?B?QzVTeklvcUVObDFiZTJxakxJeEtQL2NudlpRU1hWVTJwNCsxS3ZpbTdsQWFz?=
 =?utf-8?B?eE9UWTJVV1FUYWl0b2pIQzQyWUc0bndrNGV0L3lOMjM3bEp2RHJrL01TU3du?=
 =?utf-8?B?Wmxta3BaMXJxT1JWVHJDYkQ2V29WQVJ1aXpzUlVPYzZjWTJiL2RxT1RId2R5?=
 =?utf-8?B?QklYNm1Gd0FmYzdpU2lzZTBPUEUvQ0hPbmhjNnRzRkxXbitlV05SenZNKzFm?=
 =?utf-8?Q?pHi0fDUZfuGbAR56iG336zuWS1ui99d1+kjWO+dZWU5H?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6256f4-a56d-4d3f-f31b-08ddfaac5fe2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2025 14:20:41.9369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pwCV3yk1qGvcMAOozRoPiuDIRSDYwmGK68JKr6rdFP5eP2tMgmDm2zPfds6RsVG0ir+IMkoHt6RoVtDEkA2hFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9230
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

Hi Alistair,

On Mon Sep 22, 2025 at 8:30 PM JST, Alistair Popple wrote:
> The GSP requires several areas of memory to operate. Each of these have
> their own simple embedded page tables. Set these up and map them for DMA
> to/from GSP using CoherentAllocation's. Return the DMA handle describing
> where each of these regions are for future use when booting GSP.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
>
> Changes for v2:
>
>  - Renamed GspMemOjbects to Gsp as that is what they are
>  - Rebased on Alex's latest series
> ---
>  drivers/gpu/nova-core/gpu.rs                  |  2 +-
>  drivers/gpu/nova-core/gsp.rs                  | 80 +++++++++++++++++--
>  drivers/gpu/nova-core/gsp/fw.rs               | 39 +++++++++
>  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 19 +++++
>  4 files changed, 131 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index 5da9ad726483..c939b3868271 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -221,7 +221,7 @@ pub(crate) fn new<'a>(
> =20
>              sec2_falcon: Falcon::new(pdev.as_ref(), spec.chipset, bar, t=
rue)?,
> =20
> -            gsp <- Gsp::new(),
> +            gsp <- Gsp::new(pdev)?,
> =20
>              _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falc=
on)? },
> =20
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 503ce8ee0420..0185f66971ff 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -1,27 +1,91 @@
>  // SPDX-License-Identifier: GPL-2.0
> =20
>  mod boot;
> -
> -use kernel::prelude::*;
> -

Oops, not sure why I put that here but thanks for fixing this.

>  mod fw;
> =20
>  pub(crate) use fw::{GspFwWprMeta, LibosParams};
> =20
> +use kernel::device;
> +use kernel::dma::CoherentAllocation;
> +use kernel::dma_write;
> +use kernel::pci;
> +use kernel::prelude::*;
>  use kernel::ptr::Alignment;
> +use kernel::transmute::{AsBytes, FromBytes};
> +
> +use fw::LibosMemoryRegionInitArgument;
> =20
>  pub(crate) const GSP_PAGE_SHIFT: usize =3D 12;
>  pub(crate) const GSP_PAGE_SIZE: usize =3D 1 << GSP_PAGE_SHIFT;
>  pub(crate) const GSP_HEAP_ALIGNMENT: Alignment =3D Alignment::new::<{ 1 =
<< 20 }>();
> =20
>  /// GSP runtime data.
> -///
> -/// This is an empty pinned placeholder for now.
>  #[pin_data]
> -pub(crate) struct Gsp {}
> +pub(crate) struct Gsp {
> +    libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
> +    pub loginit: CoherentAllocation<u8>,
> +    pub logintr: CoherentAllocation<u8>,
> +    pub logrm: CoherentAllocation<u8>,

These don't need to be public for now.

> +}
> +
> +/// Creates a self-mapping page table for `obj` at its beginning.
> +fn create_pte_array(obj: &mut CoherentAllocation<u8>) {
> +    let num_pages =3D obj.size().div_ceil(GSP_PAGE_SIZE);
> +    let handle =3D obj.dma_handle();
> +
> +    // SAFETY:
> +    //  - By the invariants of the CoherentAllocation ptr is non-NULL.
> +    //  - CoherentAllocation CPU addresses are always aligned to a
> +    //    page-boundary, satisfying the alignment requirements for
> +    //    from_raw_parts_mut()
> +    //  - The allocation size is at least as long as 8 * num_pages as
> +    //    GSP_PAGE_SIZE is larger than 8 bytes.
> +    let ptes =3D unsafe {
> +        let ptr =3D obj.start_ptr_mut().cast::<u64>().add(1);
> +        core::slice::from_raw_parts_mut(ptr, num_pages)
> +    };

I think we also need to provide the same guarantees as
`CoherentAllocation::as_slice_mut`:=20

* Callers must ensure that the device does not read/write to/from memory
  while the returned slice is live.
* Callers must ensure that this call does not race with a read or write
  to the same region while the returned slice is live.

Unfortunately I don't think these are covered by this function alone -
it could perfectly be called on an allocation that is currently in use
by the hardware. So technically `create_pte_arrays` in its present form
should be unsafe, but that also would be overkill here since it is a
local function and we control the conditions into which it is called.

This PTE business, where we are taking any coherent allocation and
reinterpreting its bytes to create a page table, does not look very
clean to me anyway, so maybe we can solve this with a redesign. I'd
rather have that part of the object explicitly laid out, as it is for
`GspMem` later in this series (albeit with `u8` instead of `u64`):

    struct GspMem {
        ptes: [u8; GSP_PAGE_SIZE],
        ...

What would work best here IMHO would be to have a dedicated type for the
array of PTEs, which is placed at the beginning of each object
requesting one. Then we could have an init generic method for it that
takes a reference to any object and `dma_write!`s its entries, avoiding
the slice and having a guarantee that we have exclusive access to the
object since we just created it one line above. I need to think a bit
more about this but this should be a solid basis.

As it happens, loginit, logintr and logrm all have the same size, so we
should be able to declare a new type for these 3.

> +
> +    for (i, pte) in ptes.iter_mut().enumerate() {
> +        *pte =3D handle + ((i as u64) << GSP_PAGE_SHIFT);
> +    }
> +}
> +
> +/// Creates a new `CoherentAllocation<A>` with `name` of `size` elements=
, and
> +/// register it into the `libos` object at argument position `libos_arg_=
nr`.
> +fn create_coherent_dma_object<A: AsBytes + FromBytes>(
> +    dev: &device::Device<device::Bound>,
> +    name: &'static str,
> +    size: usize,
> +    libos: &mut CoherentAllocation<LibosMemoryRegionInitArgument>,
> +    libos_arg_nr: usize,
> +) -> Result<CoherentAllocation<A>> {
> +    let obj =3D CoherentAllocation::<A>::alloc_coherent(dev, size, GFP_K=
ERNEL | __GFP_ZERO)?;
> +
> +    dma_write!(libos[libos_arg_nr] =3D LibosMemoryRegionInitArgument::ne=
w(name, &obj))?;

Once we have a dedicated type for DMA objects with PTEs, I suggest to
move this `dma_write` outside of this function. It doesn't bring any
value to have it here, and that way we can remove
`create_coherent_dma_object` altogether. Let me clarify below.

> +
> +    Ok(obj)
> +}
> =20
>  impl Gsp {
> -    pub(crate) fn new() -> impl PinInit<Self> {
> -        pin_init!(Self {})
> +    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl =
PinInit<Self, Error>> {
> +        let dev =3D pdev.as_ref();
> +        let mut libos =3D CoherentAllocation::<LibosMemoryRegionInitArgu=
ment>::alloc_coherent(
> +            dev,
> +            GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgument>(),
> +            GFP_KERNEL | __GFP_ZERO,
> +        )?;
> +        let mut loginit =3D create_coherent_dma_object::<u8>(dev, "LOGIN=
IT", 0x10000, &mut libos, 0)?;
> +        create_pte_array(&mut loginit);
> +        let mut logintr =3D create_coherent_dma_object::<u8>(dev, "LOGIN=
TR", 0x10000, &mut libos, 1)?;
> +        create_pte_array(&mut logintr);
> +        let mut logrm =3D create_coherent_dma_object::<u8>(dev, "LOGRM",=
 0x10000, &mut libos, 2)?;
> +        create_pte_array(&mut logrm);

So with the proper PTE-prefixed type, this code would become:

    let loginit =3D PteDmaObject::new(dev)?;
    let logintr =3D PteDmaObject::new(dev)?;
    let logrm =3D PteDmaObject::new(dev)?;

    dma_write!(libos[0] =3D LibosMemoryRegionInitArgument::new("LOGINIT", &=
loginit))?;
    dma_write!(libos[1] =3D LibosMemoryRegionInitArgument::new("LOGINTR", &=
logintr))?;
    dma_write!(libos[2] =3D LibosMemoryRegionInitArgument::new("LOGRM", &lo=
grm))?;

Note how loginit and friends now don't need to be mutable anymore.

It's getting late here so let me continue the review tomorrow. :)
