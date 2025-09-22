Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34162B8F220
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 08:25:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FA5D10E3B4;
	Mon, 22 Sep 2025 06:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b8GXEjfP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011041.outbound.protection.outlook.com [52.101.62.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0947910E3B4
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 06:25:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRDwYMvVq+uSOsphY9NRFVCO8WZnGyJxxfWUXOA42FNpR+E5L8BjKNSWyJ+xcnwDg7tirm/NxqfHhekFCg2hdlOxOGuwfruNPAiLgBnNKkpe8bPKJg7XnDyK0mzEhYBvRAI+UkIh4iitDeTEMa5mSD99oGAe7d0MM0tBaOyGLa3EZCPMvHj41xctv6TCa4JhO6oEkWmueQB1yGvnmdVrttcKtVdceWDU3BR4ZZl/EOD7FlCsrzeKAXUItIKneP2PMgBg2JJFrEsqaqpx7D/N8B9Fto4PaMQ1I2OINGo+XFE6PlK86Khj6H9YOpreRK92JKnnQlg9D8OkBN/oBqPdbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aadm65t2BsPvJUcPHIyMVDiIVbF0iIbdDmqj8wSmElA=;
 b=avI/f3qmJ6cNk90V128ACWWStNj4t/1+TO3b/WpTznWnvCx4BBr1hLnFJ0ccuZ8/LihSrv//FnWRcw+hqmIw3Q4K8bKHrYxAraUwdG2ygNySZ5jgdQhe2XJseVNk7FXi0/NINeXR0+WCLY0RJORVcDckwXmK8yO7EBo73zOu1zATxdO7AYaHpc2R1jGWWj3IObCSs026W8x3FhcmRKdnkLvZIK7PAWUav9yiRZi8pYKa6ByXxSe/0vhkY68MFb2zcT+TLbsQSEt4Nl8na3l0lzbQ1C3qF6MVBQWFSD9pi9OskFegUSAZrtcFvGwCi8bc9tqHeM8JJM9d0CVI0+Zm/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Aadm65t2BsPvJUcPHIyMVDiIVbF0iIbdDmqj8wSmElA=;
 b=b8GXEjfPnX5STVtHNurQGvZ3IT2WJxva83fl2lP8q05O4WgUGF+a4TQ2J7/u2Wc+D4nKbfVMJZjIBrk4oYLfcQ3RnvP/NH/xl683TpeHuVnPFLUlhRXFT3axbG+CDbMzotlo7g1dm5RmefbSGz3T2ScFXaf0HMvja3vEyVdomyXNXMho7PT1ZYJpMh4cxh5tGBA5v4xHilPKc+UvCcALqHcAfuAJBz56j4knUDWY/YgWc9B1dV23+F94R33OacbFNKeu+CLnWdDN5yOKP83wcaHxP6OYHTIfJU/PbDMdt+q3LoPURc0AuI3j36swOONXBKwaHw+9fFqmCdKnqn01Zw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB9191.namprd12.prod.outlook.com (2603:10b6:a03:55a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 06:25:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 06:25:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Sep 2025 15:25:00 +0900
Message-Id: <DCZ44OA67SLZ.HKORUXU2L9K2@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
Subject: Re: [PATCH] rust: io: use const generics for read/write offsets
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Benno Lossin"
 <lossin@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250918-write-offset-const-v1-1-eb51120d4117@google.com>
 <20250918181357.GA1825487@joelbox2> <DCWBCL9U0IY4.NFNUMLRULAWM@kernel.org>
 <752F0825-6F2E-4AC0-BEBD-2E285A521A22@nvidia.com>
 <DCWO3V7WQP0G.127BYBORGE85H@kernel.org> <20250919205314.GA1884303@joelbox2>
In-Reply-To: <20250919205314.GA1884303@joelbox2>
X-ClientProxiedBy: TYCP286CA0209.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB9191:EE_
X-MS-Office365-Filtering-Correlation-Id: ca1c99aa-f3f2-405e-8cb2-08ddf9a0c414
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXBkRHozNlRKNDZMNmljK3NkazhtbDZXNWdGd0FIMXI3aFhjNEZhb1BPYVdV?=
 =?utf-8?B?UWR3VnVyZXFhZlVPZ0srWjRwOFBJYkV3bjJ0V2pTSFdMS1Y1bE9mZDRabDds?=
 =?utf-8?B?ZysxOHZvS1Jhb1A0TkJWVzZxSUNzbG9WTnd3ZjBxejJ4YktibS9mMHlHZnVr?=
 =?utf-8?B?cXlFQzZKN3NnaEFJc2o0ZXl6VkpFYXRlby9oeTYza1JldzZXQnQ0cDJhS3Fr?=
 =?utf-8?B?YW1wZGM0U0R6SnFwWFNxR0VGbEsvaVdpSmdCZzNNM0tGNVAwWVpBWjFvTU9F?=
 =?utf-8?B?Q2hKbitYNzU3bERnZi9kVkdQeUJRZng2MmM2aVNvaHE3OXlaS1hNaTd0V0gx?=
 =?utf-8?B?b1BxWW5nVVNROVNnT2VJZzk1bUN0NTYyM2Vra2hQVmQrVm9kcHNhYmVhMkFn?=
 =?utf-8?B?VWllSmVKR3prKzZhbWRYZWhzVlpZWnluaDlYNGo5RllmeXVoMXFyZVdwTDZY?=
 =?utf-8?B?d093NldBZFFRbkp4R2s1bDg3TlZlcjZUUk84Ymd5RjA0ZGU1TDVJYUQreDVp?=
 =?utf-8?B?aWhGVW1PUmdocU1YT3JscUF1YjlOazV0VExTaHlaM21JK1hwVExnelVWd08x?=
 =?utf-8?B?TkhCLzhRVlhUUGYvZ0tZMEpnbXpvTHdZT2pOdWxBY3pQSUgxL0s2d21BK1pP?=
 =?utf-8?B?clRiczU0MHVXQm5iVC9iMEZTck9ueHhhQVIxcEQ1Ymw1UmZCdkNwNGJyNllI?=
 =?utf-8?B?a3lQVUFHeElVNnFTYVlJL3V1ZFgrL1dHcHFqcGRQcU9KRDJONUg2V2Nzc3dr?=
 =?utf-8?B?ZXpLcWRsQUNDQ2UxcEllNGlFWTExOTRHWTIzakJ1bHB4b2U3OVd3OWJZNERp?=
 =?utf-8?B?ZDRuTUZ6SkU0a3NXbHpmY0REYmhVWWNMVUFDUUJYS3c2ZXRZNmZYUDB0cHNm?=
 =?utf-8?B?VFE0UDhJUXI4VVJCdkVUNUVCYXR1R1FxSkxMSTI4Zk9hallHamZRV1lBemF1?=
 =?utf-8?B?My92d2g4R0VmaTNZcXlFK1ZJM0hDZDhWTHhadGpMOFhybmd2ckxpbllJeU02?=
 =?utf-8?B?OUorY1JGNTJMZ3ZvVjRuQ2tsNDlhZHpRVGxSbnZrOENrcTJ3UFU4ekV2MXFW?=
 =?utf-8?B?eGpHVk1SdlVndWFFRUU3SFpXZFAxaml2bE16U3hXVHBFeU5VRXpqR0VNVmU5?=
 =?utf-8?B?SUdwUEx3dEp0d01uT0VvbHI4MGRxWDE0WXQrQVhWT0FIM2NvZ1YrcG55SEJU?=
 =?utf-8?B?WnZoWkUwSlVEZWZ0WmVsUERTNUFBNU1GOG05ckMxM3puQ3ZuRGNVSU9WZUY2?=
 =?utf-8?B?bkVVcDc2dm1BSkxVYXdpRmU4YWhybkhzS2VycXhsc0lxSFRDem0zcEFIYnh2?=
 =?utf-8?B?KzlHZ2VmNC96VXRNTkk2OTZmbXBpek9ZYlJyNHpKMEdCM1VZWXJSR1BHZkJM?=
 =?utf-8?B?OTAxMEpkMzN6ODkwNWlCcFRlK0lFc3VOMTFxU2wwbWRFd0s4STRIK3RWcHN5?=
 =?utf-8?B?WnlCQXRwMHBVWmZvRnBnSzRwRmYrMzJSUERXcGJrN3d4K2RnMG5PWmdoZDFE?=
 =?utf-8?B?Z3J1U0JXeDZiM05hWnVyVEQyODdTdlZFTTZ1R1Eyc1FzSE5YT1Fsc3plZkwx?=
 =?utf-8?B?dzhzNWVNY3dXM3ZOV2w0SXpaNnZWVGZCMG5QMGlIdkhvSlZlZFdSWHVnL3R2?=
 =?utf-8?B?Z0QzQ2ZsZE00dnNXWjNQUGY3cEhDRmgvUkRvRDRhVWh3bDFqUDh2bE01YzJQ?=
 =?utf-8?B?c0gyQjF4VDVuMG41L2Rqb0JqekhVczQyYVdLT0ZLM2ZDNnluL1ZMSFJXSDFE?=
 =?utf-8?B?V0d4aDQ1OWJ5RHNSNXFTYWozYmJLbVZqV2RFMFpMMDk4ZnFJTmIzRGRiaERZ?=
 =?utf-8?B?dDYzZVhwT0RVdDhpbU1acWxQblJPZE8zdmh0SUFEWDB3eUUyc0lDenlnUVFH?=
 =?utf-8?B?bWNwMHhZUEZxZDlxQ0M1N0NiZURiUHVzam10MU5keE1XSHFxd1dFM3BkZ1RD?=
 =?utf-8?Q?zK6QTOF+H1Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VktxNEs2c3p2Tk5BemNBcDk2WWN6cUQwaUcyMUxweXJsTExPWTcvRjFSeklX?=
 =?utf-8?B?bHFweG4wWld1b3MzQkpnNVlUamZVRkxnNmMvemp5amhWRGt3eHhLYnBTS2lL?=
 =?utf-8?B?Z0lyaGFlT1V0YWJuOUwvK2laYkRLVFdCcS95RTlnd09WZ2h0a1ZUZm1MQ1dZ?=
 =?utf-8?B?c0dqM2RCUGtYandWa0JYeVoxZGZUVzJrSWZ3VkdhQjFYdmo0NkRxZEFNdkV6?=
 =?utf-8?B?N0MwUnJ5M0o3UE5sQ2MyckNHaFVLU2lFNUd2Zjh0dHpySE1sNmcxZ0c3Uzc0?=
 =?utf-8?B?eUpwK3NJMXdUUW0vMjkrZ1E1cFdnUVdKczVSdXY5blh2eWc4N0FwZ2tKUG9h?=
 =?utf-8?B?QUFPWFBvcHBGQ2Y4SDdENXMwS1dDTzl6Y0h4bUZaaEgwZktiRUE3QWw3dmN0?=
 =?utf-8?B?cm5Ld0tjUXl1NEdYWVlMQzJaanJSKytSaDVOREZsTy90dllUbFNETWU1aDh0?=
 =?utf-8?B?Si83SGZhRWhBUnlBb1pxMnVqMTZuQ0xUdHJEL3pJbm9uYTRlMmRRZ3VFZDB1?=
 =?utf-8?B?TDIzSzg3bndFSVFEd09waDRxN1BoNnltd2p6WGtiTTIyR1dGMFJGSkZUdUxO?=
 =?utf-8?B?aXBpbnFoRmxIMFNNREhOTkFhUXBOYlNlektyVzhkY0pwSFo1WkhZM3c2aDJh?=
 =?utf-8?B?UEphNWlnUjVxNUtCbSs3dm1YdWZhTDRJWkJna1B2bDFKRWRBYlEzMWtFMDMy?=
 =?utf-8?B?Y1pDRkRBQUJqRTVOTksvbHdUay9UVXh6U3NETHJXTGU3YUE1ZHBJRW9vb2lh?=
 =?utf-8?B?d1hpL1BIOUJXTVAyN3hzdXJTb0t0aDVCS0ZkYTBlVVR5QjczREduNFU2V0tQ?=
 =?utf-8?B?RzNPRmU3NEFNUnE3Z3dmTktFUlhzTHhFVFZ3c1NGOUJ5ZDBER2l3NStyanpa?=
 =?utf-8?B?UUtHWlpRQkVBWUhNWW1sOUY5VldzNXpiTEluWUJYbitaREQ2VWpXM1lVSmVs?=
 =?utf-8?B?VGVmdGdvcXJUNnZ4bGRLa2FkQ1BSclhDdFphMzNZZE1XazFUT0x6SEh5eDJq?=
 =?utf-8?B?N28vY2RrdTV1WFI4czRJSUxrOWZhNEtrdU0yVm9STlJPSFNvTWVyR3dOdFlt?=
 =?utf-8?B?NXo2Slk3V3cxOG1Rdi9TRVE5VlBxTjdnR2JwRFREUzdnZFFYTVJKMlJjNTZt?=
 =?utf-8?B?U0hZUzFkdW53M1NiMHExWEJQaDRkYlVUVFRScERPU09BSlp4QlhUcFZtejBo?=
 =?utf-8?B?NHlMWVlhWmR1V0FWN05obGIwR2l4NXR3LzJzSVVCOEJqdDZlWDEyQWRhTW1R?=
 =?utf-8?B?UHVpV3A0VTlsTDl3MEhmRGZBa01kT2xuT3pxRDBIQnFRMlZBeXBTSHNOVUhF?=
 =?utf-8?B?aUVwS2tmNVlFS1ZMbUV5K09PMU9PTVhOVjFFNzBuRkw4cm9yWXRzcHdsenRV?=
 =?utf-8?B?SVVYWjdMcDg2Q3RDbm5LeG1ueS9LSFI4YkVNZXY1OUE5WlIrMU5scnBFaEFt?=
 =?utf-8?B?TDg2WklTVnZQeHRNcHl0ZG1FNllJRXJ4YTdCS1NneW1EM2R4SytLOS8vMEF3?=
 =?utf-8?B?WkltUzF4UDJ5ck43RllCWEdiSkNWWit5VzEzbThjZ3pTZmZrczJ0YklUMURn?=
 =?utf-8?B?RVcxMTJwQnZJZ2xwZkZmdytBeUZsZnlRTE5jT3FkSzFScW9xVEJCaVdlRFZX?=
 =?utf-8?B?bXd2MzQwSVdmNXk0S294L3dOcVJqZy8vMkFRVGY5SHZCTkJRWmd2LzE0RDUv?=
 =?utf-8?B?SkZDNWVnRFZ1QWZGN08xRTBYYm43dHpvSTk3SHFLQUtqdWUzZUFSQjdsNjds?=
 =?utf-8?B?cjdGcjgxQnFhWUV5VkNUYWJJRTdtRHFFUGk5bUFQWW1uZlVCN3p2cHVJUW1i?=
 =?utf-8?B?RkNpM2QrT1hvdERtVWcrbVA0ZTdGdTJCd0t4RVBaME01OGw3NUFaeEc2OSsr?=
 =?utf-8?B?dS9adVhtSW82MTNkcHByNDJhcU5sK2lEak11SmlGSEVZVXZxRHBiUmxtaU8x?=
 =?utf-8?B?VEtoSGhTc0hSRm1RS3R3Ukdta1VQZC9FMzBqYjllbzdzdjhma0UwYUdMaHkw?=
 =?utf-8?B?dlRYRWdDbnVxeVNldFdZRnBaWXpWVVkwVEJFdllTWjk4Vnl1dHJRdy94TWJk?=
 =?utf-8?B?KzFONTl5aTNsZTBIMmR1bWdoNjJHRUZIN0NETlFvUnBSeFM2ZGJrQVhvWW1K?=
 =?utf-8?B?L080TzIvZ0ZCOG5HVEoxd0RXY2dPVmNNVnd5OVd2cmh1YmVxRUZiQVVuejNB?=
 =?utf-8?Q?tFaPRdunpn8IAGb+fHXm2ssPlzLAJLIdDT8Z7fqHvZC7?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca1c99aa-f3f2-405e-8cb2-08ddf9a0c414
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 06:25:04.2712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tRJamJ19cycGsOF3wm534UUEm/2mRrvshgihHb6t7EB512vN/viHJtZ/jW7W+hveQKKKePu2+fKkfxxOlsgTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9191
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

On Sat Sep 20, 2025 at 5:53 AM JST, Joel Fernandes wrote:
> On Fri, Sep 19, 2025 at 11:26:19AM +0200, Benno Lossin wrote:
>> On Fri Sep 19, 2025 at 9:59 AM CEST, Joel Fernandes wrote:
>> > Hello, Danilo,
>> >
>> >> On Sep 19, 2025, at 1:26=E2=80=AFAM, Danilo Krummrich <dakr@kernel.or=
g> wrote:
>> >>=20
>> >> On Thu Sep 18, 2025 at 8:13 PM CEST, Joel Fernandes wrote:
>> >>>> On Thu, Sep 18, 2025 at 03:02:11PM +0000, Alice Ryhl wrote:
>> >>>> Using build_assert! to assert that offsets are in bounds is really
>> >>>> fragile and likely to result in spurious and hard-to-debug build
>> >>>> failures. Therefore, build_assert! should be avoided for this case.
>> >>>> Thus, update the code to perform the check in const evaluation
>> >>>> instead.
>> >>>=20
>> >>> I really don't think this patch is a good idea (and nobody I spoke t=
o
>> >>> thinks so). Not only does it mess up the user's caller syntax
>> >>> completely, it is also
>> >>=20
>> >> I appreacite you raising the concern,
>> >> but I rather have other people speak up
>> >> themselves.
>> >
>> > I did not mean to speak for others, sorry it came across like that
>> > (and that is certainly not what I normally do). But I discussed the
>> > patch in person since we are at a conference and discussing it in
>> > person, and I did not get a lot of consensus on this. That is what I
>> > was trying to say. If it was a brilliant or great idea, I would have
>> > hoped for at least one person to tell me that this is exactly how we
>> > should do it.
>>=20
>> I'm also not really thrilled to see lots more turbofish syntax. However,
>> if we can avoid the nasty build_assert errors then in my opinion it's
>> better. (yes we do have Gary's cool klint tool to handle them correctly,
>
> Yes, thanks. Also I tried to apply this patch and it doesn't always work
> because of array indexing usecase in nova, where we compute the offset ba=
sed
> on a runtime register index  (**/nova-core/**/macros.rs). Here idx is not=
 a
> constant:
>
>             /// Read the array register at index `idx` from its address i=
n `io`.
>             #[inline(always)]
>             pub(crate) fn read<const SIZE: usize, T>(
>                 io: &T,
>                 idx: usize,
>             ) -> Self where
>                 T: ::core::ops::Deref<Target =3D ::kernel::io::Io<SIZE>>,
>
> In **/ga102.rs, we have the following usage where ucode_idx cannot be con=
st:
>
> regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::read(bar, ucode_idx).data()
>
> So I am afraid this wont work. Also even if it did work, it means now we =
have
> to also put idx as a const generic (turbofish syntax).

We could always use the `try_read*` variant for these, but that would
introduce runtime checking for errors that can't happen. We have been
pretty successful in avoiding using `try_read*` in Nova so far, and I
think that's something we should try to preserve as it brings confidence
that our register accesses are correct.
