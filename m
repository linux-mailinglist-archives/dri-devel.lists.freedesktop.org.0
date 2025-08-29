Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFDDB3B0A0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 03:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0741910EB27;
	Fri, 29 Aug 2025 01:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tx0mYneb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0842F10E0AB;
 Fri, 29 Aug 2025 01:51:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzbuGhzSYty5q99A0CgvNoQY0UEI1gPqjkJxSaksafPKxKn+ha2sYOL//GLQ5CgR7bpSznfenAQzbVHrYfDDFMWzUEKWBWgAWIMLnmgjWuL/o/FFLHoKBIQQXWaguM2m92l71yrr6Q6cY7I11qNcwy7YlJs8nhFZEDwiO74y0sRDWauT095+emsfl0GGyrcPYY/pnO7tkZBrR8zuDYAbvLaZVO+T0JvIvfyWp6gGqNcoFekIlZlTyvzS78PAbCKwEn4YZXBMtwIacEBTZqyUg79EnAvdBLVrWOV8VI0SqT5dds5b4UMunbgd9bAdLJXXNxm/+XSdrmLPEaFpU34Atg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qk52YHXxG8ra/J9BK8CZBHl9M6rp3NHesXWUib2CZQU=;
 b=YURpUkz9IpvRnQc63/tbsf887HyV6H9eAkJYhJF3JTRtqMo4nN8FHckWm2k4Kb4QYucurQyj2ioPmg3RXeWYVgKJimrW23OUaaN1G2mAuszsks+7MY/vuzcekkKmGAck1CdzPqHycyiur6mvS0/FRYWZMAXQfbdpDPR+KKGlWUc0PX5JJxyeCwQAzqnaLiUyXywuAb9zhWq55B5DCakcFZ1UHqM1/1bntxggl8FI/WtJB9j2cDEUsJdf72Vcr+dDIXb20pKT+fixaJEVh7Z+WDOdF5nshoQRM6uLC0lKO580mWMd7iRxBKqnZ0dSm7C22Vc8vr+D3zM0gOfyyJ7YNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qk52YHXxG8ra/J9BK8CZBHl9M6rp3NHesXWUib2CZQU=;
 b=Tx0mYnebeQv9ETHYFs5KXwrlNNjckm/qzOfDV7iILsu8mI+PkFSvo4k7rucfSTdXAlBe6NeYlvdiwK8muf33/5DrPSKrUAk259aITlNInMa7EcMORxr3g8CvYwzeou586/Qi0eRzZ8oMAQU5tWyouDpI0oZeMAAzjTnbafvevyzLywUeHDYIB9Uo1hBluabpoUblfjqvcC4Oxm8KNoEEgDu+xYju54oEcNxJ7q5uIsM7kormKgUMM028K/OZTuhwryXxjzX+zIZwOaXp+4qO6usivcqvkO4otDigLq9tbn34SyOGvDSD0kFdNVFsX2zZzFJQLa8Ro25Y5tSsjNR2kQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6104.namprd12.prod.outlook.com (2603:10b6:208:3c8::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Fri, 29 Aug
 2025 01:51:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 01:51:40 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Aug 2025 10:51:37 +0900
Message-Id: <DCEJAA3GN0WK.3GBZVQ9FZGUQ3@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/8] rust: transmute: add `from_bytes_copy` method to
 `FromBytes` trait
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-1-93566252fe3a@nvidia.com>
 <DCE0VZXSP39I.FKGHKONUTB5L@nvidia.com>
 <CANiq72=Z26jzVMbGfqL-_Wq8boX5qApmPCVGA1D6cwzOxgWWLg@mail.gmail.com>
In-Reply-To: <CANiq72=Z26jzVMbGfqL-_Wq8boX5qApmPCVGA1D6cwzOxgWWLg@mail.gmail.com>
X-ClientProxiedBy: TY4PR01CA0078.jpnprd01.prod.outlook.com
 (2603:1096:405:36c::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6104:EE_
X-MS-Office365-Filtering-Correlation-Id: 116660ab-449b-4fc8-40a8-08dde69e9920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|366016|7416014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WERPdGpSMFI3MThsZit2Z3FYdVpPMk9xTDZkbEtZb2ZxMVprMkVuWFZIU2pT?=
 =?utf-8?B?bnZ6R2xuVEtjcW9OV0sxOGtxSVpKWEYvMXBxQmpyQjFLSjV3L0xSSHNsTmJN?=
 =?utf-8?B?VmhDcEJyZkxxbHFnVkNxY2RCdVM0L3NIWkNWRVljUE9YU0xhelJQcG04bWpz?=
 =?utf-8?B?b0svdmxBTnV0aWxLMDF5UjBTa2ZiazhQZ1FJTStoSnlBNDQ5bE5ra0R1SVVZ?=
 =?utf-8?B?ZXRFTEgwZVJlUDEwclFKRWpFemlGQll1dGVOQzB0MkdTN3QzalYxZXlYb3FY?=
 =?utf-8?B?UHdUTDY5TXhBb25ON29RRkZ4Z295MkU2R2wwWnJuU3M4MHBHSWlBcS9uTEhU?=
 =?utf-8?B?SzA4bVFkb1A3OGx5M0wwZWVicmtpNEd0Ym5TYkE5N1ZVZTgrT0NybHFjYmFE?=
 =?utf-8?B?bkI1UUg2WW4yM20rdVNuMEZBSzlHSE9nKzF4R3dnVExGVkJSbDdlZFA2QXQ1?=
 =?utf-8?B?c1NzSHMySVpqRDZQbkhlYlFOZ1ZaQmdTT1VwSHVETTFFbXNaTWpyYjJlWVN2?=
 =?utf-8?B?TGpORDl3SXRHcXZKQ0ZZbk5sRldaa0w3VVQvd1dMbEsySVUzS1c5ZExkWDh4?=
 =?utf-8?B?MnNxaFlvWkt6blRyWnNhNE45aGYreGNyU21Dc0tPa0hGOSs0bzVibDlwS3hO?=
 =?utf-8?B?N0QxdkkrUnB4Q1UwVnFaWXB4bGVhNjNJMFJhczFySGFicFZuWVZJdlg0bTNI?=
 =?utf-8?B?dFJ2Wm8wQWlvMHRjZzBobzkzdWZXeUd6OVRkbkpRL21KSkthVGFVTUVucy9r?=
 =?utf-8?B?UnlnN2tzcEFXOC9lN0F3M2hpcHprcnFLWXgraWc4L2FRblM3aUpQZnpZNzdn?=
 =?utf-8?B?ZE81RlFZbTVuWTVkQTZOWDZPZXRxTzU4dkJSSUF3T3RjemorRUx1cE1NYklz?=
 =?utf-8?B?RFNWbm9xQnROcjJQbFh2RERIZU5RVGFOd2hJTG8waDFCVURXbFlKcXFaLzN2?=
 =?utf-8?B?YTE5MlJXTGdvU0UwbzhjK3JIcUhJQldXdHp4QVcyL0lxZ3lMN2VzTFpiQVFs?=
 =?utf-8?B?Q1laVENwbXFJeng0Q2E0L29oQTdFNHhvUk9Hb2FmM0JCWnFTZHpiSEFzVE01?=
 =?utf-8?B?YzVHaitENldTdkJ2c1lFdHBZSGFzSEdrM2o0NjF3MFQ3U1BXdzc4cTIrR1lZ?=
 =?utf-8?B?RGpBMjRyVjBmeFJXL3BzM21QaFZHSnBZcnI1WXJJOWs2SVNMMDQ2eEFBY2s3?=
 =?utf-8?B?QW5EckxORGZRcnhnb2pyanM3MHpIbGE5eFZhekoyeFE3K2NiWForV0RkSGdC?=
 =?utf-8?B?TlF4emswMlRTWWdzbWJ6WkRLNE9OQ2ljODlvR0JRYS9sWFFtV1lqdFRlU0hZ?=
 =?utf-8?B?U0Ztbkl3Vnc4VUdMc3NzaDVWa0xvdzVtT0dZTExxWXNudEVIOUJWSS9hQUZo?=
 =?utf-8?B?VWlGK2JuTmZSQTFwWTlZOTdsVU80YVdJd2k1VXF6ZEtRUzd3ckFsTllxT1Jt?=
 =?utf-8?B?cXp0RXhBRmJKZVF5VDJ1VkRRcjNxb20rUTNzeC9HY0hBZndtK09OTEhZZXFJ?=
 =?utf-8?B?bjg5ejhoSlo5UVZLTU01dEtET0NYTzhKMjMzQzdkcU1QejBmWDJWeTlwSUlp?=
 =?utf-8?B?WUdqcmNUVFdSd21TOWtpZ0Q0LzhVZC9rUEhNUUdoYVNmeU1rQW9mMlBnTHUy?=
 =?utf-8?B?YmtnMTMwUWgwSmozUzFaSVNRRW1hTkprZDdJOG44bDhGTGk2cUR6QnRVL1dK?=
 =?utf-8?B?MmtEeWNCN2lCa3lZbCtEaHlSVjB1SHJLeW1IZFV4cjU4RlFxQlFRb0kyaStS?=
 =?utf-8?B?RjVlcHVTYUhic0gza0s0ZStpNk9ZV1UvNHFsRUhTbWp6OG03NnZiNFpLUTUr?=
 =?utf-8?B?Y2llZDNMNmtDcVJJM1ZuOXVJVGRBeE9EalFuM1MxVnJ2UHJCQUhqM2xjc0s3?=
 =?utf-8?B?aUtoTXNQQm00V0p1RlRvT2ZYSHpEQ3dKYkNVZWQ1ZDZPZ0xxWmRpNWxxODdh?=
 =?utf-8?Q?ihSKrfr9F/Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(366016)(7416014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L0w3d0VON045cjIrU2FRaFpQS1NjOW9ucmNzUXNoSkpTMUpTQTNMUDJSTTJD?=
 =?utf-8?B?MUI1SzQzWExYUU8reEtBcHpNTGdsd3orTnlxdjRNNXZBd2dMMmQ3N0lVQzVj?=
 =?utf-8?B?STc4VzFJcFJ4M08wbCs0alVhYVFldXE1RDgxNjA2N1M1NkpFNjJTbVVDdnE5?=
 =?utf-8?B?ajAxOU9naUpXRUFVV3VwSEQwWHZjbUZYQVk4WUJ1MkJ5TmVpcG5saDN3TmU1?=
 =?utf-8?B?T2hKUnpZR25MZzZHZGlkRFlBK3ZhdmR1Z0xyMnJIK0sxcDdGcVd6eDVGVkR0?=
 =?utf-8?B?THg2RlR4eUM1WHEzN0RzdFJ0cGwxYVdBMUVKVFEzSUgrUktwbmMvbVp3ckNy?=
 =?utf-8?B?S0ZIaTcyditpVkh6bGQwWStoQVJXQzEvMkRlQzdvY2l4WklhV1N4YTYrekJ4?=
 =?utf-8?B?ZjYrS2hIYkJGODVDamlCTXRiZDNpNXhhcmFvTnhrTGpOaDdTTGc0VW9EVnEz?=
 =?utf-8?B?YmdvUHFNRFJnN0pRVjVEVHZISlFPL2pkVkFUazNTaW5Ndk1relJrY3ZIOC9P?=
 =?utf-8?B?Rm9nRGlkSitwUm5qUmdGb0N5MXEzcWZkbDVacHVBd2NXdndKRS9ma3EwcUI5?=
 =?utf-8?B?ZDRMN1MwalJNb0lWK2NsR2hDbnlPTDZBTEFnM0poQmhONE8randjVDlqNElU?=
 =?utf-8?B?akVlMnoreHA4b05MTGNzU04zV0p5R0NUVS9Ga3BKZWFNVFAzcTFpTEovczdl?=
 =?utf-8?B?TWhNQTJmVE5tUDR3WVBoMURkS3c1S0RRTlN6azZXWGdCUGMzUDM0TmZXTC9y?=
 =?utf-8?B?ZGNaSFdmQ1ZNQnlNdml3akpXQzk1aUVHMXY3OHpoM1hqQWs2d3d4dWI2NHlr?=
 =?utf-8?B?RGlFRkhUV2pNaWlkOTAvUXF5UEJZWnhFVUwrUUV1ayszMkRmTWRmOTJac3cy?=
 =?utf-8?B?RE1YYmxEMHo2SHZGTFRFSmRTd1ptUzRNdS9yRVowL0ZiSkorakVHb3hodGZt?=
 =?utf-8?B?MFFaVWo4aDdEcXAyclY2Y25mTDNtUTV5Nk9ZV1ljM2RPVHAycjhlRmVRdExM?=
 =?utf-8?B?bzgrN25DSmpCZmRBdXJoMEVGRmlzRTlUUzF4Nzd2YkJYZzNSR1B5ODVCYmFW?=
 =?utf-8?B?MzVSdzZEUDR2dU5UTDUra3BjZERHRUpoNmlib3lwTEhwUmNMeVhkWGxpSm8w?=
 =?utf-8?B?V3hKRXp4V1p4RFNna3BlMVFqdkdKSlIyQnVRaGVERWNCMllPeko5Qm9zVlJv?=
 =?utf-8?B?TjRDOTZLc1NwS2dTSVJ3Q01HYzZta3NxSU1qNWI3WkxjQUZOZXRVT3phU0do?=
 =?utf-8?B?ZUJjNHlxamFVdXR5OUNvL0JzdzFRbDBNajRGQjhic09nOXd2STdVTytyb1Ry?=
 =?utf-8?B?U0JERm1wa3QwZElldEdrN0krNkhxNEN2ckJ2dzc3ODRrVUlQNU5ieXZZeDht?=
 =?utf-8?B?cnA4ZGErblo4NnJlTFlWWVJYc2h5Y3YwSGpOeXQyQmVGb25xZlcwdnlBQkpn?=
 =?utf-8?B?QzhKVzZ6LzNCZUp4NERnVUdVc21mdURNSDFiQVJEYkJDQXZKYVFrdnlmTEVL?=
 =?utf-8?B?LzREZzNGcUZiL01HUnk5Skg3NHJEZ3NodGc4UUwvdVVhbG9JdzhrSzhkYS81?=
 =?utf-8?B?MUxlWDdVVE9ENDNCZE1jYVRuUFJ1L0pFTkZiUzR3c2U0alUwTDl5RmxRY0po?=
 =?utf-8?B?anAwWmJ5TFp1RTlYT0ljTlBka3Jwd2FiRnhpOG5FTmhLVXZPcCtvVHVDSmlt?=
 =?utf-8?B?Z0cyVzlFVkZSYlNTdHIvMmhaUG8zODNnRVVLMlNkVG1zSjY0MWYyWTAweExM?=
 =?utf-8?B?QlNVeTJIWldpWlFkT0did1V5Yi9nM1VLbU82Sy9pRWExZlJHS2I5eWNYam1t?=
 =?utf-8?B?Mmx4Zk1xQjErWTRTcFZLa2VkT2ErU3hTdW9yKzVyZSt6TzVHc0RLcVVzVmZV?=
 =?utf-8?B?aEhYdTJWbTQ3UzZnODlmdVdKMnNLeWtyaG4yaWFMaGZkeS9yUm11Ujk2SEQv?=
 =?utf-8?B?ZitnUmNkWkpFOEVmd0ZESDB4VFRCQmtRb25qeHFlRjEvV0RVU2VLMWJkRzB6?=
 =?utf-8?B?cWd0QUpneDN2VzFydldvNUJ3eUJEbWlGM0NPY2ZJZ1VOa25IeVRVTlYzbFFE?=
 =?utf-8?B?ZEVWeGdLRll4ZzdpdlBEVHhiMUlxZFFDQkFTREs2R3plc2UreU5tVlVqRk44?=
 =?utf-8?B?WTdFcTVOWHZYVStjNHBHbDdoNWphMEorbllKdFNnZGxScXVwVVRSWFhGdXFp?=
 =?utf-8?Q?Kir2vQE5jMA0bOWonBufo86tPhaX0IVJhQOyufq5RpH1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116660ab-449b-4fc8-40a8-08dde69e9920
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 01:51:40.6780 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTqdGr6er+dthykVxXz4fMMu8MtljjbKz+651ExHhfOZzajYHTZDFkVDnLT5JbQq4oaqm02yfugH1EQPHiLI+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6104
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

On Thu Aug 28, 2025 at 8:45 PM JST, Miguel Ojeda wrote:
> On Thu, Aug 28, 2025 at 1:26=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> We got 3 Reviewed-by on this patch - Miguel, are you ok if I merge it
>> together with Christian's `from_bytes` patch, since they are closely
>> related?
>
> If you are taking this series this cycle, then sure!
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks Miguel! Pushed this into nova-next, right after Christian's
patch.
