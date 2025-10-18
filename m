Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 426A1BED0A3
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 15:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94F010E103;
	Sat, 18 Oct 2025 13:41:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NWKPcuND";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012070.outbound.protection.outlook.com [52.101.48.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37BFA10E0C2;
 Sat, 18 Oct 2025 13:41:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xk+PQ12JcNFQkxYUiT/EBzuHF7k+5PZy20pL8VK/3IgnPxiwPndOGDrNdJEIfLqKbE/Qy2recqjz8KPKWXbn208348C1OwVXDB6XvHNnE8mwOS42JQXv0TP9GJRLfDzmnqmosuO5SAj1tkbyx5bMpZzsGAZgEuSEDSEY3kaPl8OdXMNuSYRQsg0LlvV/f7mgRpfjANnXjI3uJS0TW+AsPsigg0vkuxYT5r952I2x7go3I4dEwE3isnhew3v6faApc2jKe7rBcaTHmTiDih/2NpNJv1BmjZTy0y5oh0sPLxwi3Ncc+Fzgnsskmdlc4Zo/i4675R/RWm+htRrsVXeTtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veTXDxv00cN8gDSTKP/vYlbQU9oRWf9c5Bj21yLAnq8=;
 b=Lh1NG9nI0Pmj9u6TTpWpuQSvct3EqWrQlSYckRRK4wKGZH3mT1UVTSgX+lMf3+V0WeeGzmW2wyY3lEF4kbJ56F/eLy8LS2BmqbiKG3GLr2ds3HbaWtuts0ljERfTzAaSBgbso0UgQYIKx3a8AfIllKirZ8tgl9488m7woFJavnFbF/LEhDVzdEBAqrEZ08mq1PzflQ9LRQ6HsDclWg4Pzp2PAk2+cY/1Wjqioa1NfWTyx4lNkCswwTeGC2iAOj7H6yLbzib4UkliAaXyHVKIUSB0rbTCSEsZOBvBl21v6uk1em3urpAXRRO4N64Fd50T0GoOIMsKoR0jlSlgKJO7Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veTXDxv00cN8gDSTKP/vYlbQU9oRWf9c5Bj21yLAnq8=;
 b=NWKPcuND4bCe9cJi2GmelRKSUlcAKuvAkOYWEJLGRQR9ffqj8czlAy6Uu0mxH/R0QWNeBuLJ4FYTQmj5mLWCFNYH8lUGNqGksX0pjPwt97759Y8NkGGZmdIk/oH+SWWOn5hJNGiSprAwUyESyvoWQZSYTxyLPKQAkO2e6m/aTI2XJw+d6+lBvgDgFGz002pq/jqyZ+QO0o3WsgUKbVTEml+lnFNXTE2RTjzNCAW6TxsRH17vETs5ZaY71m5HSUkic3KjHeey+EA8YhpV2f5b6Ryqavg5RXNETM9fQg0Y+BoVRAg2XKthAV081ZmVbs+T+J6X3PtmMCsJeg8h1X3G0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6474.namprd12.prod.outlook.com (2603:10b6:208:3ba::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Sat, 18 Oct
 2025 13:41:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.011; Sat, 18 Oct 2025
 13:41:33 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Oct 2025 22:41:29 +0900
Message-Id: <DDLHP1ABV9BA.3V0NXW3RWHGL6@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Yury
 Norov" <yury.norov@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v7.1 0/4] bitfield initial refactor within nova-core
 (RESEND)
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
In-Reply-To: <20251016151323.1201196-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0362.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6474:EE_
X-MS-Office365-Filtering-Correlation-Id: 806a1fcf-94e3-468d-1a49-08de0e4c0c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|1800799024|376014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L2lQOHVNWDNUVUUrVmNnSldxTHNaSEhyNHVLS2sxSXY2VzkreEpYaFVoM2g1?=
 =?utf-8?B?eFRaTXhWMEkvRFZWcWdBOXpVbWJhbXArNGorcUVYODZwbWJNQjhsM2xQcjhI?=
 =?utf-8?B?clJXczBtc1psTjUyQ2U2L1V4bnFkY1JGT3JBRlBLdDc3RHJQeEl1aEFlSVJ2?=
 =?utf-8?B?SlRCaERDcm11UmdDdG1SV2J5cEM2M25nYURVVGdGVzBlMmFSTVVEbWFpMkh2?=
 =?utf-8?B?ZStZSkVLUVhFMzRYK0NRaE8xN2pBOG5QMlNDUU5oVkkrbXdZVzFiYmtGZG1u?=
 =?utf-8?B?dWRhdHczNTdpOXZhNno3ZTNrTEp0d3pPemVjNVY2RVVpRDlURWFPaGcxd2pZ?=
 =?utf-8?B?RUFHM2Q3N1BodlFCckZPSUtRVHRicjF3Nm1YWWJmQng0MUYwNXJVUXNGbGFV?=
 =?utf-8?B?T1d3Szg0RnVqZERMbnp2akdyQTc2UUlwMko3Y2pCYXMwNTA2cHBZTldvMkRt?=
 =?utf-8?B?cjZRVG9iUEtVOFkwaFJ1Uk9ocEE1WlQ3V3F5TWN3QXBlTThwcXhSWFdTZ1pm?=
 =?utf-8?B?RjNYWWp6Q2lFbEFIVVcwM2VlNmV1dDJhYUNmT1J6ZFEybk5BSy80QVJPRUZh?=
 =?utf-8?B?YWpQdTNYWWdMZE1PRWMyRlFFOCt3K3hpck9rbXpxeFJlVXdCMlVIZGQ1bEJD?=
 =?utf-8?B?Q1YrSXhxcHJTc0xsNGNPeTAzSk9XVUsyNzIvUEVBRUdLdmJNT0MvRHNhaEFG?=
 =?utf-8?B?YjdhMVMzcGpNaTlKdmZRTGoxSWpKV0ZwVGk4YTVUV1pCaEQ3OVpBSE9JbEN2?=
 =?utf-8?B?OUc4QXhTeVpsV2MreElReXl4R1NzZVd1UzdTb1Qrd2s0L2ZZTk1yUzgrcDdN?=
 =?utf-8?B?REtNWnE3T1hwWXFON1NNaERQa0tEYXk3TXVlamtUS2g2YnQ5NFVjRlJNTlpk?=
 =?utf-8?B?ZGlDTDJ0VWNablN2ZGZmWWxmZThKNnBNNUlrZVgweUlEUUdrdmZoK1oyUXpC?=
 =?utf-8?B?YXpBSlNnVlFRZVlzNEtnUU10YkQ4Vk1sS3ZaN1M3ZE1xUmJjS3BEZldib21n?=
 =?utf-8?B?UHlJZitvVE1rQnl3SVdxL0xDUnQxRCtWbHFTVUFrbC91bkhqSWg0c0xsR0NC?=
 =?utf-8?B?RUR5NXQ3R2xGalArMnlPMVljSVBZc3pXMkVHYXFYTEduZ1Z5SWJMVktMZUxL?=
 =?utf-8?B?SkkzaWpKUkZqZ2dpdU1kbWxqMHRFaXVwVmgzU0NwYmc2OU03enllV1hYZWkw?=
 =?utf-8?B?K1hqcDJ2NVN5YTFMZG53SkR3MW0vSWxwZXJtRjB6ZDVnU0VaLzFRMGRUSnR4?=
 =?utf-8?B?azhGY1g3MVptd0VydkhJWDJCSmRCSjI0ZkliRkdnek44K0NxaGxUZE9XNTAv?=
 =?utf-8?B?WUVyVmJiUzNYcXd0RHRjb3JzbDFoU2VRWFVRZEdPRnBWYW90T09ZS0FRUG9P?=
 =?utf-8?B?a1crc0NrM3REQ2J5endyVmdlZFZFc2oxNXpKN09jRHh3cDRsNkFLNGhTM2t1?=
 =?utf-8?B?SWxVaXAweG9EREdsTTVwTE00cDEvNldnSEFKcFhkSThyN3BlUWNwSWZaQitl?=
 =?utf-8?B?V3d6V2dscjAzS3dwVjJZZHZ4amVxN3g4dzBkL1JQUTV4Y1YyRzgzbGVqSnV4?=
 =?utf-8?B?WmlIeXBtYkhhUFUxRkRZaGdrSVAzdXBRcC9lTW9GVElTTUhMQmhUQkc2SU1m?=
 =?utf-8?B?WGlWVldOcCtyYmo2enpia3NsQmFkaDFjcWZwcnB3V0dMTWVIU2ljWlVscjN3?=
 =?utf-8?B?N3NKTis3T0ZUSFpQV3JJVEZJQU5OdWtLZDBYRU1NOUZqb0huRzBkSldwZVhL?=
 =?utf-8?B?b1ltTytPNXZmcWVXZnFjSUJkaDhMVHlERStVNzBrQS9FZHZLcUx6UURUdFRj?=
 =?utf-8?B?VHlpR0w2THpzalBtcGFHVFFqMUdGdG9STWhocTNacC9Za09LRWQzRElGNjlY?=
 =?utf-8?B?Qmp6VmhjRzkwY2pSTFZlVm5jY0Y5aXcvZlgxR0FqYnNBNXpFd2hMeVA0ZjBH?=
 =?utf-8?Q?Si808C4uzrQY3l9u8obKoZPKNydtispZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(1800799024)(376014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGpUY1UwQUUvT1A2ZUtUN0dYTzBCSVRSWitBV2o4SDRBc3dGTUl1bGRzS0xa?=
 =?utf-8?B?Y1NuMnlRMjRzT1pVbktjejc0Y1Fsc21WR0o1MFR5ZnA1Z1gvcWVpY2IxaFBL?=
 =?utf-8?B?bEMzMGxySGNac0dKRHduSFlTNmJ4MXovKzhiZERycDU3UTMrRnhzeTVVWkhX?=
 =?utf-8?B?M2I1UjNOd0ZBbUJZRCsvZUpualhQWXRnQzFHOTNjUEMwOC9VV0tONXlEbnJ6?=
 =?utf-8?B?MGd4djJHZjI0WTlpRFBqaVYvWjV1K0l1eHN2dE52bjdVb0dlN1FDNTNBVWlC?=
 =?utf-8?B?T1dxTS9MaDRmU29GMzdRdlhJdUZCWUVLL0M3WUVselRIcU9ubUVTK2JhMVFR?=
 =?utf-8?B?cmI0NXVBY2xTbFJybjJaNmxpN2Z4NXUxOFo0UmRRcHd5R0NYSzYwbWVMVkVp?=
 =?utf-8?B?V2ROR1QxOFhvU0RmRWE3WkZYRDRURTVENTZIcGZreGE3T2RrVG9uRGE5VEpt?=
 =?utf-8?B?WjVoWjRFMGVTdThOUWdja1lZb2RIdWFuVkpLMVhHbWJKb01ueE9HUHErZnpr?=
 =?utf-8?B?bi9kZUR5U1A5RWVsZVF5aExzSjFyYjBjQnROUmhvMmRHVmRnRTRXWHVqTTFq?=
 =?utf-8?B?bHFhbytSd3B6blVSajgrM0tnZ05SQTlKRzUxeUYwQ1NXOXJoaWx1NnZFbFIv?=
 =?utf-8?B?RmlDbG56N2wwUTRvVFNqUTJjTEd5N2tsak1TaTVUaW1XbkZySWZNa2Qzd0hJ?=
 =?utf-8?B?TU52aEdFYWw0Q3VBMmF0WjdQWExLRUhWN2dIeURWRGpyYVZQMnRPRWwxOXJa?=
 =?utf-8?B?TC93ZzhUQ2g5VUtLSk9OZnA3bzhtM25sUXF3UzVNZ2l0V0wvM250cWVYQWJM?=
 =?utf-8?B?bHEra3dpR3JpY3plYm1mSW5SM214RTk4VGRCTU1PNTY5RFlyU2hMcVRTTC9T?=
 =?utf-8?B?QlhMZXBvNiszSkxyd0pKVjB3NUxYOWh4SjhjM0QrVVY3ZWRBODhSUEswMHhj?=
 =?utf-8?B?U2ZJTVVRYm1vNVVTU3B2Qi9hRjhlL0Y1RFJ5WjJ5UVVxeWNOWmhuUGJRQW8w?=
 =?utf-8?B?SzFrVEJOcU5PTjN4Si9FSkwwNWtaVXJzb2pQNy9VdGZVbE8rTFkzMVlocHdK?=
 =?utf-8?B?TFAzY0RhVUt4OU1hQTVnT0dKVWlLaHJPOUIzTDlzS1BpZHpvYWxDZmhHWWZP?=
 =?utf-8?B?UzEvTDQ3dkswN0Y3OVZBSnN4RkRmZlUxZ1lqOW9qZ3MzWmpjOWt3a3RUQUVS?=
 =?utf-8?B?Nzd3RVIrUmRKMDhCZHJlemJ1OWQ3clcyZkZjRkhGUm55OENyL1M4c2NWbXY5?=
 =?utf-8?B?T3pGUU9KbmVrR29TVjNhVFpqeHhYTzA5ODlPRm1PcVQ2TVQ5dS9oZ2MxUkpN?=
 =?utf-8?B?VHZ3ODhoeU4vZHRabERHeFZyMG5GWlRWUno0cWd4NzYycjFzZG9EaVJORWtS?=
 =?utf-8?B?blFPS2J0MHZLbzBvOFIwYlFheFRZNGNsVXd0K3NTWHBId3hsR0NWWm1obzJK?=
 =?utf-8?B?SWxOQ1pEU0lHaEhWZmxoVlY1cS91M3FiOFRaUkJqRTVBUGl5ZzA1SGJvVUVJ?=
 =?utf-8?B?WUx3dlp1WXZuVG1EV1pCUXoza2dkcE90dWlGK2huT3NWVjlMNXNkU0g2cGFp?=
 =?utf-8?B?bTJFVkM0V1lIVDhYYWdTWlpXSU1CQkp6cEhmWVFrdDZEOG00MVhxSWNjQVY4?=
 =?utf-8?B?VVFmakhMZFNyeDZGK1B1c0Z2N201aWdPTjVTRCtQV1BzVFI0SklpQ2s3Z0E5?=
 =?utf-8?B?NGFKMEpBaUlVcldSdHFwb3J2RTlmTjM4VzdJS0lxTUJsSklURUdCSSs5aHpy?=
 =?utf-8?B?RUlIWHFSQmR5WVBzVHlReG5ZN3pYNDVHNWtISXIyTHVic1NuaTZ6Y1RTVmRw?=
 =?utf-8?B?Z1F3Q0lFWjhWSDdJaVNqK1NVRVJNSC9qbzlJaXpNdHlXeUZLdy9BQ1BmK0w3?=
 =?utf-8?B?NUlyMmFyMFFhcjFXaWZpSm8ycUYveTRkWnhFeGZZcTF2SEFXVDRSb1Z5T0FN?=
 =?utf-8?B?NU1zdWxHWnY5eHVCY3gyTkxDMzlDZ3lMeWRtV2I4VlVLREtZSVFZVGdGR2dG?=
 =?utf-8?B?SXE5YjF3MDIzczUrNy9DdDM2M0tlbXFhNWVqN0lYc05nZWJ1ckk0d2I0VVVq?=
 =?utf-8?B?RmJmOUlDTncvUmVLYUg3SzdSK1ROOURpZXg4aXhJTVFQWUtjOEVYalM4aGN0?=
 =?utf-8?B?NFNQTWpjb3lrMEVGV00ybkhHTVY0NUZzNS9FQU1pUTNjb0NPY2lJd205YTdH?=
 =?utf-8?Q?6AE3HdNbOXsyINdF2/XlQBxAU9ddXVkXlaLtdfWfWECl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 806a1fcf-94e3-468d-1a49-08de0e4c0c9c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2025 13:41:33.1057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NDY6avKYbXIc+1SIpW8CZQnULVij4qSx86umXZG7LPk5VMQnD0RX2iciSwlX9wUvmNLcBPVHJNOEPJ16s8UXHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6474
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

On Fri Oct 17, 2025 at 12:13 AM JST, Joel Fernandes wrote:
> (Resending due to some commit message mistakes (missing SOB etc). Thanks!=
).
>
> These patches implement the initial refactoring and few improvements to t=
he
> register and bitfield macros. Rebased on drm-rust-next.
>
> Main difference from the previous series [1] is dropped the moving out of
> nova-core pending BoundedInt changes:
> https://lore.kernel.org/all/20251003154748.1687160-1-joelagnelf@nvidia.co=
m/
> Other than that, added tags, resolved conflict with kernel::fmt changes a=
nd
> rebased on drm-rust-next.

Thanks, this version is looking pretty good, and works as intended.

I plan on pushing these 4 patches soonish after fixing the line length
issues and the other few problems reported by checkpatch.

Danilo, please let me know if you think this is premature, but imho it
is good to set this part in stone to avoid merge conflicts with future
patches that will want to modify the register macro.
