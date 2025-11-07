Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F241C4203A
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 00:44:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F7D10EBAB;
	Fri,  7 Nov 2025 23:44:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fTjhxF7M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011070.outbound.protection.outlook.com [40.107.208.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C76B10EBA7;
 Fri,  7 Nov 2025 23:44:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bEkNih/2NDBgp4MNsHCCunVB+eucC3bhZkqz2m6xxccfcPIqR+rNsF8j78rhbzBLljS563AR4E3GGukkm+4yn6JK8vbpLOqbgQ+KM9TeGcayoE/ta9/+s9G0NtTNXzUsxbHMivuvMhdbFhm+cXoxVGh8pJK0ICQd1htqMz3x0j0BLYNrOArk+NkvlNXU4KypEUIgYcIio8+MfF1BHcUJEodJCuSgHDuXx9CpUp/s61wRMwU8qKCQqEe1tyuLrNN5BvTKHlLPjssLQt8nazTh/otcnGOJs/NiBxa3zu903kOShdtmQ1lD1Nnq51LaoGMHN9CztGMVJITlU9reJzaG7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hcb2pcejf3ECvAvXBv6PPT/tvU92q9IouTIFBitVC4M=;
 b=dvepMQCUuZZAEYAq8kqsau3iUpp2jrUNz0kfx2yeaFLl6PeauUxrDrkrC6WPNyJpD8j8Bt5JGL/dQ4ZE+oaNakMHqgg/szYXDkb+dlv5L3ATDmUtWzryAzSWAIdVsEjoe0tVoU6U8vcjGxmu6C4m6/zwdkya7AJLIqXQ2YrZ+wTnEHmPTSvZ8GOY1UJzjaBjD8V9JIS9AYH0sGjg9q9V2kVG+wl81py65kYTtIe3G2mNH7Gv97U3Et78+j6DVnljm+xvnH92gNhN5xxe4IfN88WYluMHJWCSxqgMySFWku5/hdfLjo3RIra+eTpz3zzwvqujZecBqNe76d3sGWlotQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hcb2pcejf3ECvAvXBv6PPT/tvU92q9IouTIFBitVC4M=;
 b=fTjhxF7MqBt5YDjMYTJyPwZN+In5jF7goiiHsVR2Ndzh3A020iR1wlre9OwKvXWYrFG/igJupiJdiCvkHULGfbilGdqgkAVCQy1U4HOsxKsxQrfWn1sp7XOLm2dyYAWh7pexTAigcJBheZx529w24XbT+Phaoai2ffvRSIus86OSobQNoDMNv+gS1krpxDIrbSSL/CJMkNBL+TQxMVA0P7zrNZKnHCx3Wu/ayXODg33uUy1g2m6j3OifdsPwOoRcWdzeYA/m1JHuw75kE6QPw8Ni4mHp4GOqehXmcq+UjKfA3pMlYVRvFMdu/enyRP09sMeXwhc7Qs5QVx4FfnxJWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6642.namprd12.prod.outlook.com (2603:10b6:208:38e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 23:44:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 23:44:00 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 08 Nov 2025 08:43:13 +0900
Subject: [PATCH v8 12/16] gpu: nova-core: gsp: Add SetRegistry command
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251108-gsp_boot-v8-12-70b762eedd50@nvidia.com>
References: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
In-Reply-To: <20251108-gsp_boot-v8-0-70b762eedd50@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0148.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c3e1eea-c465-4d8f-8d08-08de1e5786e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V21mdVhodjQ1WnVhVml0WmlFN2J2cHVvTms4ZXBBNDIrSlFHN0ZPOU5jTWFh?=
 =?utf-8?B?R1kzdFgrWFpNUUJCc0NLMDc2dmdKenRxVE1qWjh6M1ErN28xSExqMlFabVVh?=
 =?utf-8?B?cU9VVTVxZzNDS3hKbHViYTFmL1FNcnArQm4vMW5IZW5EN0FzMjZxMlVNNGtB?=
 =?utf-8?B?ZDJEOExNT3JyR2ZPNW83OGxmSEV6UFpqdWp6cFc0WXRXWnFPaVl0azdyMks4?=
 =?utf-8?B?T09tT1NXMDJsNkNVd1Zad1d1MjhWTmRaTDR6RGo2bVU2dXpTMXZVK3NvNGJo?=
 =?utf-8?B?d1FrNG5wcWZIeTZMa1NXdkd6Qmgra0hjN2NqNHNPajF3azhJdHhDZkd0L3l0?=
 =?utf-8?B?VHdmV2ZKM2NyUjl4NGpSTE5vbGluSldEamlvOXlNR3VCdkl6THhGd0tvS0ZY?=
 =?utf-8?B?YWRCbFA3anNTbkV5cVZWWXQyb2lxbnIzNlF2ajFCU1NMdjFCTnhtK0thdG5y?=
 =?utf-8?B?Z2JGNlRpTnZRdjMwbEtGQURZMjhqdnlIY1h3SUZma2dLNHYySzFIT1prN2Zi?=
 =?utf-8?B?VkhGRFBoMGdaS3lxVGVyUzk5S3ZaWVUyTnNvKzdvN1ZMbXY3NDcrbFFoQ3JD?=
 =?utf-8?B?Q0lLQUtKb3YrS3ZXY0QvTmczVHFHWnZmRlFjRUtxeVRmd0hBUTJ1Z1JRU0w1?=
 =?utf-8?B?NEFtT0wvaEJNbGp3a1FNUUd3ODMvazVhWW5ZTVVxUjFMUWF6MmdFb0ViUGpa?=
 =?utf-8?B?eUQrdFBIRHJDd29tNkhIMXYzdXJIYWFoWVpHNU5RZU9wdk9jMnhiZXFhMTl4?=
 =?utf-8?B?ME8vNlgxVStmZ1ZPTnRSMU40SDNGYXA3TVVMTEtMaDBZQzFpNjZ4ZDJwSUxQ?=
 =?utf-8?B?b2NqOXBva2dwYktMbnlLRnY3OVBrUnJMTTVXVVI0R012cGErT0NNWUsrdE9x?=
 =?utf-8?B?Yy9DNWxsU2xUQ28xNEllWVpNSStMNzd0eVk0WmNodVNXMlRFVjhZZGhMZE5n?=
 =?utf-8?B?UTdmblBBVjU4VG1qbnFOQ0srUmpFaC9UZTFjZE45TGgxVjQ2aUhNYXpVOXhJ?=
 =?utf-8?B?Mit6dk1ubnNKRlNpOHREcll6dlRvRmtYR0VNWkhTTXRtdEptbzVsSEVsOGhz?=
 =?utf-8?B?dHVPN3dxU2xpVU95RzNuUUJaVm16ZENBV2NXTkd6cFhrZDZLNnFsQ0tYUGph?=
 =?utf-8?B?TFJHbm9RZXFRTU9Ld1BLaGxWam9TSlNPWDZoNDZSWGpGN1VPVlJSalRkZGZj?=
 =?utf-8?B?azJKajZ4L3lGOGNha0daYkNsc1hzYUlXT3dYaklyeEdMbTVTcWJSb0YzaDd4?=
 =?utf-8?B?djRkbC83anh0RDk2c0NHUzBUYVZQRmYrU3FXRXo4MzJ5V2Q0anQ5WVJvM2lU?=
 =?utf-8?B?dk4vQWFDUHRDcWtaZXNudFhWMUtvaUp0d1NsZHdMTlhSeGZyejVuaGhDWC84?=
 =?utf-8?B?aCtNa25PeExuUkUyd0J2L1ltaE5UVERYdzJEbUVvcktvMzVBdFgya2JWeGdN?=
 =?utf-8?B?UW90NUdPVGlaOEZ4R2hCSUoySnFCZktRRnAzWmhncnNVQkV2OWdlUnk5NDY4?=
 =?utf-8?B?MDZQcjZjb2IwSlFwVEtDa2FwNmlHeGtaTm1wM2N6ZG5DU1lPc0YrQzE1cGlE?=
 =?utf-8?B?SHl4cEFMNzJHVEdNRUpMSTZ4cHpoWHFEZFNWUi9ObzJRbUhsUTJ1dEREdmxO?=
 =?utf-8?B?Sjd1UFE0OCtSVmhPaVVFNHBBY2YwdUJza01FZ2N6cUlyM1QrQ2tacjFUVHZU?=
 =?utf-8?B?TWxnQkRSYVo1bEJhSDVyMnpES0gwbnBIcVNmUW1vaE9rNS9LZGJNMjhjS3hi?=
 =?utf-8?B?VUxpOHR0NkZNcERjUXI3OHA2RWtKYXRJa0tXRFdUMFRRTVZYcHh3b2V0K0V1?=
 =?utf-8?B?TDFFT0FlWkJDcXk4VXhUOStNbnNHMk9ROU5sM005NGIyQnkyOWZZYVFmOGli?=
 =?utf-8?B?U09vUmU5U0FWQkc5K0pJSS9CNFZHd25TTFJGMjcvV1o5aXJUbWRiaTlnUjdv?=
 =?utf-8?B?elhpckg4QXdrbENFZi9ub3FtL05ET3graWxsd1ByMWJ2WkF2bDJ0K1FuWi9C?=
 =?utf-8?Q?n/p2/eLMuysBR8/yO++xQ26KPEyro4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cEpPb1V5VFJOWnNqNnB5Y2JXd1lnQ3pOaE9QSncxRmh1VE9oTERLYjRhZVYv?=
 =?utf-8?B?RjJmUFMrR1MwKzErMFhaNHBkckRmemRyR2hiRGZJOVpva0JNQXFiWk9pdnkx?=
 =?utf-8?B?N0QxUVVrbmFNRTIvTFZBaHZKTW02WmJGcCs0cGNFZC9pc3VNb1dUcnEra1Bm?=
 =?utf-8?B?TnRxeStNTFVHOXBadzNPVDI1dDJLQ2FmUWRzcU9TSG1hK3pwNHVCK1AwTWJt?=
 =?utf-8?B?MHcrem1PdHRycHUrdFYxTkJBTjVGU0g5M0Nkc2liQ2p1cGNhdlA5Uk93MEh5?=
 =?utf-8?B?WEI5SE12dFppUnR5dTZ4SVU0a04ySVBPRzgzckhvOXF2Znl0ait6WGsydHo2?=
 =?utf-8?B?QVA3NHY4bHFsemxJa1R2dGlTS0paOTJRd3QvTGZhSjhFNkhiWjdLY3JZbXh4?=
 =?utf-8?B?RUVHSEkvaDZ1K2ZIN1RUR3FRdkhJOWNsd0NFWEN6UWlZb2ppQVYrSHZWelVP?=
 =?utf-8?B?U0VLQ1R0TE5KWVFVL3FJb2tHaU9Fbi9LWXRKNU5SNlMzMnF4UHpOajRtbWY3?=
 =?utf-8?B?ZEhpNmJ2T1Nmc3NQTlpVY1lUMWlkbXBaSTg1Yy9yQng2ZU9Jc3RNVDdydWFC?=
 =?utf-8?B?bldrTzQrcmVqTUJQYmVEQTRJblZoNXpaakRSQ3pJTWlmZDBQQitMR0txNCs1?=
 =?utf-8?B?a3crYW0xUGs5RmFsNnJMMHN5a282TmpTVDZFMm9YbnZtT043NGNEbHgxT2I1?=
 =?utf-8?B?RmNjYldLK1lwQUlIdUJKOGtMeTh1b3htOTFUYTFPS01MU3RqcjBObHRyemFp?=
 =?utf-8?B?QnFwaEZXUmtoTk1xWmo4anN2SFdvQ0l5MVFiRlNrazZKMHlhU09JNEdFeFM0?=
 =?utf-8?B?SENsYm1zZmY1TkRFRWxLRWNCN0tlanNYUEhqZmFnTmI0WHJud082OEJqSm1Z?=
 =?utf-8?B?elJWekM3VCs5SUtjMmFxbTkwU24xOWkrR0hkSlVMdCtzVEtxN3QrRHNpOVhh?=
 =?utf-8?B?QTJmLzNQcTFQVDQ3UEN1d3lrMEVCMHhZK2JXdUVnbFkyV09EL3NPY1NzZkpX?=
 =?utf-8?B?VFZKdTg4UHJwNFJyVjJBV29BZWszdTdjYUVkdlBXUStKOFI0bDQ1Kzh2MTRR?=
 =?utf-8?B?N2hBUkw0dGhSN1ZkcFA3a1NhMEVjc21ic3ZjYzd2WTNxZ1dkbS9PN1FCUDF1?=
 =?utf-8?B?NzAxNjRVam5DekFBZ1hLeUo3aVBzY044QkNkTWY0Si9JTkdoNmRVZGFNZWxQ?=
 =?utf-8?B?bzBVWXJrSG9yY3dKYmxxc2VNWnJobXJscEQzRE9ZZE5wZUdQNVRiOGxjWlpG?=
 =?utf-8?B?QXRPVGo1VGJIZ0h3T0wxMWFZbThnYjFsd0xpako2dVM2MkQzVWdod3JYQjE5?=
 =?utf-8?B?eG02ZzEwM2ZyUE84Z2toMGNYa08yTjlyQ0UyNWVhZWgvQlNrdVptUlBjUVhR?=
 =?utf-8?B?WkQ2VS9TbmxUalpndEFBSWVnZE9SQzdYdThPdzE1UG1YL283YzJEbCt1aGt2?=
 =?utf-8?B?aTBSaWN4WXdya1Fybk56dVZDc2RwTmR2L1Uyek4wNDltNklaR3ExQ2d0bGlF?=
 =?utf-8?B?MlNCVUNiSG04Rm95d1U4YUNZMTY5ZUtmWkhhRjk4RVArQ2NUY0ErNWJCYTNz?=
 =?utf-8?B?cGFGbjRnR2tDMHRacDRrdWRZMFNCQnVmeHVhbFdEcmZIOWdKNlBGL2RneFpL?=
 =?utf-8?B?SGNRZmdIMndBdHVjL2duYkpYamtvUzZNeGlTSnBTRUVMSHpkck9sWWNWZStG?=
 =?utf-8?B?WDVQQWV5MWgvR3FGcDNad1RXVkdvVE4zbVRDZTl5UXFWRTU0di9xbm1vcGpN?=
 =?utf-8?B?QnpYcXVscDhGeUx1SldsYnhHN24wK0tuWmZ4MjBoYXV6VTdOUndXVmdBZGd4?=
 =?utf-8?B?WVBpaFBKSURVeHdSNndNdVNKeWE4NWtPN1RyaWxWRTR3UGwxVHhPOG8zT2Ro?=
 =?utf-8?B?SnB2dGNuZGJVc3JCMlRNeXh3aVBXVlJZQzgxTVRIcWZxRTdzZnNiNUZxVWpG?=
 =?utf-8?B?QWFuMUtGN0hJVXRFWkh5RmswcXFsOEgzajNsUVJGd3VMTFJMdk0yQzRlaGtG?=
 =?utf-8?B?ck9WU3VmOEhPK0s5WEY1eUZjbXFPdlE4VmhLSDZJUUZVakNPZnJJNUVPL3Nx?=
 =?utf-8?B?NUFTY2F0bkJ4MTRweXFHL0hWUGVXQjBUTnQrQmlXejRQVGdrSi9MdVEzZDU1?=
 =?utf-8?B?WlJxY2VXbWk3R0p3aG1lN0lpaHREczR0VGs1N1V6REMvMVZKWkJCUTBlb0Jo?=
 =?utf-8?Q?KAun2+RAYC/JaqLWTs+I3wHOWE08G/O1OjM+Sqhm8yI0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c3e1eea-c465-4d8f-8d08-08de1e5786e9
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 23:44:00.8916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LnuKL9BjwyPqf+PdSeD3v1HorD3Rd4klJqb1F1LuBmKQQN0X7pk7udzbALjUxDAwtsyqVagHocXgna5d5X/7FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

Add support for sending the SetRegistry command, which is critical to
GSP initialization.

The RM registry is serialized into a packed format and sent via the
command queue. For now only three parameters which are required to boot
GSP are hardcoded. In the future a kernel module parameter will be added
to enable other parameters to be added.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
[acourbot@nvidia.com: split into its own patch.]
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs                 |  2 +
 drivers/gpu/nova-core/gsp/commands.rs             | 91 +++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw/commands.rs          | 50 +++++++++++++
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs | 16 ++++
 drivers/gpu/nova-core/sbuffer.rs                  |  1 -
 5 files changed, 159 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index b1c1fe77cbf2..dcb5b50e176f 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -158,6 +158,8 @@ pub(crate) fn boot(
 
         self.cmdq
             .send_gsp_command(bar, commands::SetSystemInfo::new(pdev))?;
+        self.cmdq
+            .send_gsp_command(bar, commands::SetRegistry::new())?;
 
         Ok(())
     }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 091dbe59f655..cc32d4379283 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -1,12 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use core::convert::Infallible;
+
 use kernel::device;
 use kernel::pci;
 use kernel::prelude::*;
+use kernel::transmute::AsBytes;
 
 use super::fw::commands::GspSetSystemInfo;
+use super::fw::commands::*;
 use super::fw::MsgFunction;
 use crate::gsp::cmdq::CommandToGsp;
+use crate::sbuffer::SBufferIter;
 
 /// The `GspSetSystemInfo` command.
 pub(crate) struct SetSystemInfo<'a> {
@@ -29,3 +34,89 @@ fn init(&self) -> impl Init<Self::Command, Self::InitError> {
         GspSetSystemInfo::init(self.pdev)
     }
 }
+
+struct RegistryEntry {
+    key: &'static str,
+    value: u32,
+}
+
+/// The `SetRegistry` command.
+pub(crate) struct SetRegistry {
+    entries: [RegistryEntry; Self::NUM_ENTRIES],
+}
+
+impl SetRegistry {
+    // For now we hard-code the registry entries. Future work will allow others to
+    // be added as module parameters.
+    const NUM_ENTRIES: usize = 3;
+
+    /// Creates a new `SetRegistry` command, using a set of hardcoded entries.
+    pub(crate) fn new() -> Self {
+        Self {
+            entries: [
+                // RMSecBusResetEnable - enables PCI secondary bus reset
+                RegistryEntry {
+                    key: "RMSecBusResetEnable",
+                    value: 1,
+                },
+                // RMForcePcieConfigSave - forces GSP-RM to preserve PCI configuration registers on
+                // any PCI reset.
+                RegistryEntry {
+                    key: "RMForcePcieConfigSave",
+                    value: 1,
+                },
+                // RMDevidCheckIgnore - allows GSP-RM to boot even if the PCI dev ID is not found
+                // in the internal product name database.
+                RegistryEntry {
+                    key: "RMDevidCheckIgnore",
+                    value: 1,
+                },
+            ],
+        }
+    }
+}
+
+impl CommandToGsp for SetRegistry {
+    const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
+    type Command = PackedRegistryTable;
+    type InitError = Infallible;
+
+    fn init(&self) -> impl Init<Self::Command, Self::InitError> {
+        PackedRegistryTable::init(Self::NUM_ENTRIES as u32, self.variable_payload_len() as u32)
+    }
+
+    fn variable_payload_len(&self) -> usize {
+        let mut key_size = 0;
+        for i in 0..Self::NUM_ENTRIES {
+            key_size += self.entries[i].key.len() + 1; // +1 for NULL terminator
+        }
+        Self::NUM_ENTRIES * size_of::<PackedRegistryEntry>() + key_size
+    }
+
+    fn init_variable_payload(
+        &self,
+        dst: &mut SBufferIter<core::array::IntoIter<&mut [u8], 2>>,
+    ) -> Result {
+        let string_data_start_offset =
+            size_of::<PackedRegistryTable>() + Self::NUM_ENTRIES * size_of::<PackedRegistryEntry>();
+
+        // Array for string data.
+        let mut string_data = KVec::new();
+
+        for entry in self.entries.iter().take(Self::NUM_ENTRIES) {
+            dst.write_all(
+                PackedRegistryEntry::new(
+                    (string_data_start_offset + string_data.len()) as u32,
+                    entry.value,
+                )
+                .as_bytes(),
+            )?;
+
+            let key_bytes = entry.key.as_bytes();
+            string_data.extend_from_slice(key_bytes, GFP_KERNEL)?;
+            string_data.push(0, GFP_KERNEL)?;
+        }
+
+        dst.write_all(string_data.as_slice())
+    }
+}
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
index 0d3c46f793dd..e5aab4032175 100644
--- a/drivers/gpu/nova-core/gsp/fw/commands.rs
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -54,3 +54,53 @@ unsafe impl AsBytes for GspSetSystemInfo {}
 // SAFETY: These structs don't meet the no-padding requirements of FromBytes but
 //         that is not a problem because they are not used outside the kernel.
 unsafe impl FromBytes for GspSetSystemInfo {}
+
+#[repr(transparent)]
+pub(crate) struct PackedRegistryEntry(bindings::PACKED_REGISTRY_ENTRY);
+
+impl PackedRegistryEntry {
+    pub(crate) fn new(offset: u32, value: u32) -> Self {
+        Self({
+            bindings::PACKED_REGISTRY_ENTRY {
+                nameOffset: offset,
+
+                // We only support DWORD types for now. Support for other types
+                // will come later if required.
+                type_: bindings::REGISTRY_TABLE_ENTRY_TYPE_DWORD as u8,
+                __bindgen_padding_0: Default::default(),
+                data: value,
+                length: 0,
+            }
+        })
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for PackedRegistryEntry {}
+
+/// Payload of the `SetRegistry` command.
+#[repr(transparent)]
+pub(crate) struct PackedRegistryTable {
+    inner: bindings::PACKED_REGISTRY_TABLE,
+}
+
+impl PackedRegistryTable {
+    #[allow(non_snake_case)]
+    pub(crate) fn init(num_entries: u32, size: u32) -> impl Init<Self> {
+        type InnerPackedRegistryTable = bindings::PACKED_REGISTRY_TABLE;
+        let init_inner = init!(InnerPackedRegistryTable {
+            numEntries: num_entries,
+            size,
+            entries: Default::default()
+        });
+
+        init!(PackedRegistryTable { inner <- init_inner })
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for PackedRegistryTable {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for PackedRegistryTable {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 1251b0c313ce..32933874ff97 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -649,6 +649,22 @@ pub struct LibosMemoryRegionInitArgument {
     pub __bindgen_padding_0: [u8; 6usize],
 }
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct PACKED_REGISTRY_ENTRY {
+    pub nameOffset: u32_,
+    pub type_: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub data: u32_,
+    pub length: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default)]
+pub struct PACKED_REGISTRY_TABLE {
+    pub size: u32_,
+    pub numEntries: u32_,
+    pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
+}
+#[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct msgqTxHeader {
     pub version: u32_,
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index 57153c1c3515..deb9c1469a95 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -198,7 +198,6 @@ fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
 
     /// Ideally we would implement [`Write`], but it is not available in `core`.
     /// So mimic `std::io::Write::write_all`.
-    #[expect(unused)]
     pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
         while !src.is_empty() {
             match self.get_slice_mut(src.len()) {

-- 
2.51.2

