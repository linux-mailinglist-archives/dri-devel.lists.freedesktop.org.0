Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08D6BE60C4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 03:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DB3810EADD;
	Fri, 17 Oct 2025 01:38:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n+eWYI1l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011064.outbound.protection.outlook.com [52.101.52.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3677E10EADB;
 Fri, 17 Oct 2025 01:38:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j34hktE4Pxm+kAVeRp6ryr1EmMvjoZz989pgE5w1B3D59b5ihiVnck61rjrwoq/ngoGf2tui10r8NlmY5SS7ORDdEfgd3hnQXeRwQbQLkSHQAmu2hXJhebdBrXjONEirk7vBbfm2PNZBAf+251PDDWCcd+1X1I6eb5sjIEwS/TFM9C4ggQK+ea/X03nHM3o39IVcRxWY+V4y2GGrfeBqr2OdpfSsmwir9t4qDhWGWJUlgV+PfdKzaDDKs/X/yTFdwXCRNd5YF47HDqMvXVcAJ8Qbg7liQlwl14usz39IhBGxZYemtbEAsIGl2t8TLUoxznwHIDiKx5NDkk50/auuXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25RuGY8CacuDq7iuiJWQzlf3GZoX6AQ423GpR5NWYWo=;
 b=rebrlp2249ntDoa1oesRWzyqQIW9k6sqjmgrHYZdI5SUnaInzB20BfKdPR/lYQLslxIE6nYEfdzMlGWcWr97dcK1+HMT+dRA/vCY+Himo3cpxD0/IVqtnx/srU+zvZjSINUyFT9XJqjfOognpvwSNS3vgP/IruxHhc3qe9iSbXr2XARfsAfOlC/JpEgkr2WGP1Vc+7Lc2IO6r3di3jCaVYTrFC9Hhat3xNsrtI6hj/jua/1Wro3UcEHHUc31w+wAYvQKQSHc++wCGKQlOXAXAWrIQs5Xi+rLbBSisIdGbsHpIPKCtT/e/TNNVrSqiUgAYzFod00Mg5T1eyDqyXdtEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25RuGY8CacuDq7iuiJWQzlf3GZoX6AQ423GpR5NWYWo=;
 b=n+eWYI1lXRx3K64ynGdIs/svV2v3qsFUDjrkX2pRywZFR6ODSTg5Jf1sMhoYrNgmgNBVY50ZHvze7LxViKO9X4p8NGOOVtRYL3TYVzokhkdnyz0Uzl72Y/R2cgwNWluIUyKfaFL6dIsYAnt/JO0bMSyRah7E7u/BDvmB4oVR30pN5KwPRcE1vtvdhGAWm4wc8lJSz8tJfnFzbaagUdELI7Db2uc3aS8zZ0LFk3IrtE4h6oC2vMpc3T62v1kNnvQfJIT67fLfFEA3JQDVFgcT97yKPLc1MGsR2lc6N7uTmNvUs7BnEpVff0nHF4TiuV6z43KWKpAvR7lyelqw7pnPpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB7213.namprd12.prod.outlook.com (2603:10b6:303:22a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 01:38:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Fri, 17 Oct 2025
 01:38:15 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Oct 2025 10:38:12 +0900
Message-Id: <DDK7OP7VPVD0.1G6XJ4WCFFF02@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex
 Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 03/14] gpu: nova-core: gsp: Create wpr metadata
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-4-apopple@nvidia.com>
 <DDJJ4ECCSE2I.1EUAJRU9JBGNI@nvidia.com>
 <zwaefk62to77b5nyakeiboyj53fge3lysc3z7arp54tyyherdo@nsqhuig7bmbc>
 <DDK4KADWJHMG.1FUPL3SDR26XF@kernel.org>
 <DDK6IHKS13RS.3UVIM301BBFUP@nvidia.com>
 <ckwuxk7ohtkbpqk345kzypkafu6bkshwbgshie2bq2vzwhj4pv@5wu4u6htkcuq>
In-Reply-To: <ckwuxk7ohtkbpqk345kzypkafu6bkshwbgshie2bq2vzwhj4pv@5wu4u6htkcuq>
X-ClientProxiedBy: TYCPR01CA0191.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB7213:EE_
X-MS-Office365-Filtering-Correlation-Id: fb6eb855-9645-4dd7-1831-08de0d1dd737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2RVNkE3R2JhcmZOaGVmdHc3ZDk1bTQ5S25JdDhUdVRmbzAwbWJlK0Npa0Vq?=
 =?utf-8?B?andDOWlXTkk2Z0s0cjdKSHNYZWhhMEhWVmh3Q2R1N1lxc2pWQWtFSmYvV215?=
 =?utf-8?B?T2tvdnZ3WGFPQXZRUkhmKzg5VmorQm5EQ3VhRWd6VW9mQ2tjZStuYlVwMVY3?=
 =?utf-8?B?NSszakNsK0VsdWtZLys5cW9ob0lKV3NhUzd5d3pFSkY2UHlmNVZXUFFkZWFp?=
 =?utf-8?B?TW1IVFE2RnlUOEYvTnUxM3prRVJxS2dUeHhPeWlaeldQSWRpTEtab0tya0Vs?=
 =?utf-8?B?VEtOQjZjbGJBb1AwWWY0bXBHS2ZGT1NPemRrR2xwVkFCSXRyK0poVXhqTVhu?=
 =?utf-8?B?Zko4QTh5cjZlOHVCQkNDa0NVR0pnVkVGRlh1RmNjV0pnOUo2UjR2V1BEelRh?=
 =?utf-8?B?NHUyQVNHd3Q1cnphc0tGcDNZc1RGbTBLMk1ldHdUcjlaK0ZSdkVjcGY0UkRJ?=
 =?utf-8?B?S1R0OHdpZ0hGZVBzYlBHTnczT2ZKeTd2Sm5PSjlkRXdQYXZIdkVmU3RNcVQz?=
 =?utf-8?B?UHVTamVhTW8yM212dmVpNm8xdEZoamZZYUlwck1ySTBhSmZ0UnZpdHdxMnlu?=
 =?utf-8?B?RkhvbVpoR0g4RXM2YTRmbC9mVkQ0Y1R1OCtzYmQ0cXFpb3VGaStFeDlYRUtP?=
 =?utf-8?B?VHpnbkZ2Sk9MSFhtK25vQ3hBMm9XVURXbFN3bGpQRXhRS1hKL0l0QzNRZWla?=
 =?utf-8?B?Qk5zT0JTcEIwV0cvVjhUVHNJZyt3eDMyWGQrMlpaWUk4Syt2NDNNOXdyQ0JI?=
 =?utf-8?B?d05pMHVrWVp6aXNnUzc5TmdiUjFtZCtMSkZSZVBkcERkSXJKRk14RlpBeFpj?=
 =?utf-8?B?YUc0THY4ODlRSDFCeFczUyszSEp2Z1lZaWs1eXZaeFJxcmN5MzY0U25JSlg2?=
 =?utf-8?B?YWRoc3grNmNPL2UzaDUrVDVNdEhvY0lnSkxLNUZ6M3JvR0VSYk1IMGlkLzJj?=
 =?utf-8?B?LzJtL1Z6QmkyK1l0ejR1UDZPOTJnaC9MMk1HS1NqQnc4VFlCN3pYZ1czT1ZH?=
 =?utf-8?B?aUhuNzJ2MXRiM21mZ3QyQVM2MTFKZFM3UWNGc1o1MURLMHIrNFdMaFZ1dkpm?=
 =?utf-8?B?NFZWK2NiRHl1NGgwdmp4d1B1enczMXpqSDZxUXo4YXVKMUpKQkt3N0lZZThI?=
 =?utf-8?B?YTA2cXhSTjZjYlBVbkcydDlzQmhpckJaN1NxWUVrbXBSZDhzTGhTY25TV090?=
 =?utf-8?B?MUFSU0lYcmVqQnZ1WVh2QmxKTGZINUJWUHdobk8wTFNxYVJqMmVtVCtWM2w0?=
 =?utf-8?B?Vmg0SWhiSGNtQytEUEkycWdZVys5M3FjMEtXVVQ0Q3E1L0dCWW0zekxwVjY2?=
 =?utf-8?B?SDJOUiszNkNBQTZGY0dsVVRFQ1hzN1kyWU9VUkgvblJRbE1pSkR0U3NkMFox?=
 =?utf-8?B?MFBqTGRvbURWZzhyU05pU3U3UnFwZHJvVkhJMngvLzRZOFV0bUtoVTJ6aVZR?=
 =?utf-8?B?amNqR05xck51a2pmREdFYkF1NlNUZmtocFVyYkxEYjhqQXVLdzlXYlNRME82?=
 =?utf-8?B?Q2VNdmtkMFo4YmZydVo0c2RXM0p3dzBQZ0pENzdwamdrNytmRjhzc3ZqSG5w?=
 =?utf-8?B?VWNYeXgvVFpnenVGNlgwcDVvbVYwYmJXV1F2S0FmVDRvb0ZzOVNJSzI5czBU?=
 =?utf-8?B?V25KQ09BTUlDdWlnVllnQk5FZ25uMXJTQ3VDNzRJdDN1UzFtMkZ1cWNQdVpr?=
 =?utf-8?B?N1hsUmxSUExocWNuWkZzZE5DWElMSlNYTjJmVXQvRWJxMHBwTFhqczJ3Wnc4?=
 =?utf-8?B?UHpwaTBiNUQvRUprYXd1NTFRQWY2RzR1UE1PSHVlaGFkOEZSUXZtbXpvTmo0?=
 =?utf-8?B?ZWt4TzlGc1ByQUNnNVhQQkFOMlhKQWNlYmpSQTExdUFIUmNqcTJwL3RIU1ox?=
 =?utf-8?B?VysvdlR4RVpySnBHTXRyTllaSmZPRDhpcGxaa0IzWGpCVEJGdEVvbGpIRnBQ?=
 =?utf-8?Q?+rc1mQJ4p0SM0nurFW35Ymidkb7V+0D3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?alRBU2FvdFhKbG1RbXgwY1BkN0VLVmoxUDNhRER2dm9kWXZFdmRCZ2dXY0ta?=
 =?utf-8?B?dUp5NklkcHNqK1NkQkZRQldINVNXazd4SkxXMWZoWEdYc040Nk1pUUZqL1d3?=
 =?utf-8?B?dlJmN3RLQ21Qako4U2E0Lys2YWxTYUZwTEx6TEprR3RUeWNkRTlnSmJzVUZj?=
 =?utf-8?B?NmluQ1EzSXlqM3FCdG1nblRtOEh6TEN6V042Tis2L3RTbVlJRTFtZnhaREF2?=
 =?utf-8?B?M29yK2pIZVhqeWY1R0FQL1FSK2grR2dIVlNJT0lIZEM5OFROUkxWTUNFaFVx?=
 =?utf-8?B?aWVxYmJ5YXYrKy9wdWplRE8rYkp4VWJxcmloRWR3dG0rTVAyTEo4ZlVIY3Nr?=
 =?utf-8?B?VnZpTmwyOVBuZlhnb2Zzcng0NFhTZFBlcFgzeG1BUXUwRHVGNGpwMmQySDQ3?=
 =?utf-8?B?RE9YUUI2eVNWb3ZEcWptZ2U3VGExZ1EwY2swZVBucXRRMDI4UVBZQ2tueExE?=
 =?utf-8?B?ajM4V2hqL0xlVWJLNTQrc1hBODNWSU1jSUlDUTNDSmpUQ3FTQ3hXaVUwREpY?=
 =?utf-8?B?a0Z6UTJVaTcrQWJ0bVdQeW1HL3diYjdNaUJQMWRKQm5vRXBGc3NoSHVzWHhn?=
 =?utf-8?B?NDNPZ2ZTam9JQVMzTEdlNWJsUllIME1oTEVtSzJOT29LVTZ6R1U3REVVNW9O?=
 =?utf-8?B?L2RJUkFmdWYrUm80SlkwMzdpR2xEYktDc0o3bENOdzFoWFZpQUlPM1pyZXkv?=
 =?utf-8?B?aCtteFdrQi9FeEtlZ2orTUp5TUlyZ0hteW0zZlZwUDAzSythZkVOV29WZVFC?=
 =?utf-8?B?MW1kZEgrWFJnSWwwSDRWcW9pSWxYWnByUTZUckZmVGQ5WWZNbHEreVhSOXRa?=
 =?utf-8?B?NHJralJCSHIydXZ4TlBNR00vVDdtQmRUaktPWnRmYm5rTUJraGZJdDRZa0xx?=
 =?utf-8?B?VEFGZXJ5c1p6dUxBdUhlK0ZhaWFQaW5keGZ6YitBUVE2TkZjQjJIVDVBL2tV?=
 =?utf-8?B?VSsvUEt3TS9pQjlUbURhRHZsN0dOMFhWcWk5SENpVk5PWEJMOHpaT2JlamJX?=
 =?utf-8?B?R25CMm5aOUxRTnRzcDMvTmRmSEo2enpKWFVaakxnajYvaXFBL3Z4VDRjU21U?=
 =?utf-8?B?ZEh6UHdLUXY2cms4cllvalRDd25lRnVEdXpjaUFUWndQY2NQWVQvL3ZXNW15?=
 =?utf-8?B?UU1nVmxBRUpKbWI4WFZEUEhQeWZqK2NQeU91UUViRTgvNGRsM2lZbGdEWGND?=
 =?utf-8?B?aU1zZzNodmpWRngxSnZNUzlIK1I2eElOQ1lPd01EYmk1L1ZJTGNURzlZQU8v?=
 =?utf-8?B?R2JRRVBaeFhmMzNaQzI2N1Iwb0t4cTAxTDN0VGVBRGtuYkx5elpWclJQcGRr?=
 =?utf-8?B?TkpGWmxRU3UrL2loZFJWQ0lUdmsxK0xMa2NIWlNBL2VhNXJ0djlMQnRCQjBn?=
 =?utf-8?B?UHNNMzVFKzZ6bDhLOFhRdldTb3g2SzRhcHp2ckdOYkhxUTQ0MUhSR2k2V0NK?=
 =?utf-8?B?cmw0aVhueW1RenZFZlc5b0k4aytGa0d6SldzYVdoSHhGM2ordGh4TXZEdXNx?=
 =?utf-8?B?Ukc5eE5vRDIycmFNa3JFcDQvY2tXbVN1UkZ5eEFKTVJzUUtQUXpjUkZZdCtv?=
 =?utf-8?B?YVdNeTJGaHhkcDl3cnJqZTRmTWRIZ0N0Z1p1Q01taUN6N0RoaXM0Slg0dXA0?=
 =?utf-8?B?SFhlL3pMVndXUzdMSnZBMzd1c3N1a002REJNOWRsODdkTzQxczBLd3FkZmJS?=
 =?utf-8?B?MWdMREFPby9qMTM4TTYweE5BUithUStxZVAwQUtFT093QzFmd3RMSHRzWUdS?=
 =?utf-8?B?U2hjeW5wTWhXRnNCa0VjbkMvblFPYWNqZ2ErRXN2T0VVSXRRTUZWNGtWOFVV?=
 =?utf-8?B?ZllkMTJ4QzlGTjVzNjZpbXAzWklMeFBzaGE0VzZxYTBaZG1wcGpPUTkvVkVG?=
 =?utf-8?B?OERkNDNjNlNIOERGWGF2d2xRL3BlNTdXM3piRHcraWUyaXowaGhRTytOQzJD?=
 =?utf-8?B?bkFNMnpIR0lvc2I2SnppanNCZk9sOVU0eTFsYTFEbnVJZnNQUGtNaFF1citr?=
 =?utf-8?B?REM3Vm5aazRVS2FQWEZncGU5UXY4L2FiVHZXdnBDcnRpRzFnTm5vMXNoTW9J?=
 =?utf-8?B?WDhoaElybzdKL1RGREVKSEM0VE9ZK0d0eEJnMEIvUGNHU1FLZ1FXWnVOLzFr?=
 =?utf-8?B?enhJZ0dKSnpkeHZVNnE2VXVuekZJbTV4MkZFVGNqbzB2NXFsVSszZ3R4SkhF?=
 =?utf-8?Q?CX9sKBfVKF+K3YB6HzLCD9gY0/tmoaYj4e9jmZRcqfI0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb6eb855-9645-4dd7-1831-08de0d1dd737
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 01:38:15.0911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +0erpK+rUupMFFrqcLKDas7BoOFpfRDOAHTKrJltZYit0Vfew/Afpav/0eoN43ozrDzV6riwfkG42jnODq/uSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7213
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

On Fri Oct 17, 2025 at 10:15 AM JST, Alistair Popple wrote:
> On 2025-10-17 at 11:43 +1100, Alexandre Courbot <acourbot@nvidia.com> wro=
te...
>> On Fri Oct 17, 2025 at 8:11 AM JST, Danilo Krummrich wrote:
>> > On Fri Oct 17, 2025 at 1:03 AM CEST, Alistair Popple wrote:
>> >> On 2025-10-16 at 17:23 +1100, Alexandre Courbot <acourbot@nvidia.com>=
 wrote...
>> >>> On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
>> >>> > +impl GspFwWprMeta {
>> >>> > +    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbL=
ayout) -> Self {
>> >>> > +        Self(bindings::GspFwWprMeta {
>> >>> > +            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
>> >>> > +            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISIO=
N),
>> >>> > +            sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle=
(),
>> >>> > +            sizeOfRadix3Elf: gsp_firmware.size as u64,
>> >>>=20
>> >>> Very unfortunately I'm afraid we will need to replace the `as` in th=
is
>> >>> method with `u64::try_from` and make it return a `Result` for now.
>> >>
>> >> And presumably most of the other `as` keywords in this function deali=
ng with
>> >> usize as well? Have made the change but would you mind quickly explai=
ning
>> >> why this is needed? Is the concern that usize might be more than 64 b=
its or
>> >> something?
>>=20
>> Indeed, the concern is that `as` performs a lossy conversion without
>> warning, which could catch us off-guard if e.g. some type changes in the
>> bindings.
>>=20
>> >
>> > Since nova-core depends on CONFIG_64BIT, I think we want a helper func=
tion that
>> > converts usize to u64 infallibly.
>> >
>> > This helper function can simply generate a compile time error, when
>> > !CONFIG_64BIT, etc.
>> >
>> > We can do this locally in nova-core, but it could also find it's place=
 in the
>> > generic infrastructure. nova-core clearly won't be the last driver run=
ning into
>> > this inconvinience.
>>=20
>> That would definitely be the correct way to address this.
>
> Sure. Although I don't really have a problem with the binding constructor=
s being
> fallible as plenty of the others are anyway.

I think we can address the non-fallible conversions as a separate task
(as there are many sites that could be similarly optimized in the
nova-core code), so fallible constructors are acceptable imho.
