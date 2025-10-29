Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B464C18F41
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 09:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD9610E738;
	Wed, 29 Oct 2025 08:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZIElssLn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011007.outbound.protection.outlook.com [52.101.62.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EE110E734;
 Wed, 29 Oct 2025 08:18:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kvxQqdWIpqslQwWENgOnX/QGffn1FMh6HzK9urRxa07o7fE/1vDS349FkCaooeDE0FxPiA2KsceGukvdSRvAvOipld1pWILUZqDpgAN75AK/SNyTWPeS/jjBgBIhnbiyryrNbj/CQGjxdNm7sSJ3CPB7AN9lxGTNFS7MELjqABAMyumpf3lvsvbvXUqr1vUw3BsRnruyQ/NE9MxWzM62VM2yVDYDmJ4yE08Cplxzhyts0a6eSHaUVmP3c6bCJtoqsa7WLL78g7zdln5r0+xvVOtX4CftaMvf++v8hahjAwGlVpQrPIIrdKdfz6s6hijQQPZ8Vs3nGOp6T6lQZWjMKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHo9ZUDAyrz4G0DX8xbQ+uFiMyB2BzVt3accbCyh06o=;
 b=AnOZ3Dyl+Mwn5eKarHuXPLO2qz8LuoVaO52NPrQUar+9qhW7s25npWBbiBxalMhOAPknZ9PDenixV+Ix9I7efDKUBX9HP8nKrg7bP0AYuaUKzY7MS97AtAg4XNaN1XTd6NZ4SuyRDZHBxyQF2hwoxIqLHptgCJMDP5B9FFnuKmdDMnK1jCTUOT7Q9yHVx8WeybYbNSiGkGHQg+Dg82ECUchdVTb4DrftENonthAs2Zm8V+8U0I1IgqtSanjZvEklyKLL6YuXNzzWNGJQizIhRg6niiInO13A8AV5aKcUjmIwQSQ26A8EcyPPpVAG08TzUtsRPYDL57nQoMbLHYf3aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHo9ZUDAyrz4G0DX8xbQ+uFiMyB2BzVt3accbCyh06o=;
 b=ZIElssLnuMiZhI2RtnjBo8gOg8GBVqdzPvGt9lgYg9TiDzEqLb9eampThY8AsAHuOo5C6eB5IvR7hzzWAm5GZGev8gS++6XIH8z8tSIZp3W+E3rH8e7X/p7zNIDZkPi1gGzf9G2H31MkOXerSSJxjsYObhQXBwhLCxz+QCUYiRUMRF6N0Ta7hUWx4wd2yc1xVy/UlwrJILeI5c4QvLdXi5sapbNXrgsvBkvp5dtakLAUwq4mwEMTBu4A3o980pT9S7xvNycHjIritf0GUuIf6mk+sNg1jAiyHr1wfywNcx/NdSRzUJD05JjMkbvy0qpkh8tKo1qAwJWaDlGeJlQaIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by SA3PR12MB8438.namprd12.prod.outlook.com (2603:10b6:806:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 08:18:29 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::d161:329:fdd3:e316%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 08:18:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 29 Oct 2025 17:16:39 +0900
Subject: [PATCH v7 12/14] nova-core: falcon: Add support to check if RISC-V
 is active
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-gsp_boot-v7-12-34227afad347@nvidia.com>
References: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
In-Reply-To: <20251029-gsp_boot-v7-0-34227afad347@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0113.jpnprd01.prod.outlook.com
 (2603:1096:405:378::7) To BY5PR12MB3986.namprd12.prod.outlook.com
 (2603:10b6:a03:195::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|SA3PR12MB8438:EE_
X-MS-Office365-Filtering-Correlation-Id: 71639f9c-2b55-4cde-703b-08de16c3bd8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bUpDL05ZWGIxUmZYT1ZEQ1c2dUxTY0s2RXdDM2JwaE5UU1JuSFpsTzFiSnBq?=
 =?utf-8?B?VnAzTnJMeTJtenJaYmpTKy8rdmFmdzJLOW4yR29Fc3pITVNzTUUrMGx2ZUth?=
 =?utf-8?B?cDhTd0RsQzF1UzY4bGdoNEpaaUlCek1FMDBoT2lVSHF5VER6WkpDa3BMNThl?=
 =?utf-8?B?U25adXVYK0ZoUDFOVVpRMFNycnFSeGVVRU5QVnp2alJ4YnBJYnZjT0dPUG9R?=
 =?utf-8?B?ZFdObDBueGFLdkc0NEdKV0FKV1FqcDRGaTh5bWJHZ1hBRzk3Uk0vRkUzdHcx?=
 =?utf-8?B?aWpjWHZWQVRSVDRkYXdtL1FDU0cwZ2drU0E5Y0RxOXY3OENrNUhFaFRDWHlM?=
 =?utf-8?B?K0Y4OUh4Mms1SUU4UzdhMk9HOEVUOWRsRzlVZjBqam8wVXRrZHpMcmpvWllF?=
 =?utf-8?B?QjVua2lTdGxoVUVXYWJERWpkei90NDgwbVIyc3pZYkpYQ01TeXlkZnZpQ1Rh?=
 =?utf-8?B?TDZyMTNNZjNhUzhHQVovTjN4dVpyNGs4TWcrM2N5QzNzV0gyVFRmVm1wVDZi?=
 =?utf-8?B?NU5LR0lTTlJmZkViZHRyVTVKR2pVcGhxM243UVBuWVQ3NktQNzhndi8wckEx?=
 =?utf-8?B?ZEplNHFjUHZMeHdid1FCSnlqMnRmVW16QmcwakJYSTRKQ1FlYXQwT3FxZm14?=
 =?utf-8?B?QlF1T3NPQjIyWTVMY2dDcFFRN2ZjTmlmU3RtWFU2SW5mTEc1Zk9zSHdkRTQ1?=
 =?utf-8?B?RkJ1aXNVekE4eFlsNTByR2huY1ZpTkdvVkVFR1NoNEZXaVcxMUM3VjRBVmtp?=
 =?utf-8?B?VnhnWTlwYUpHT1ZnN1BkQVZUOGhONnk4WWxrMjVhUDdrTEJ5aGdSNzE4cTlx?=
 =?utf-8?B?NUMzWXV0N0xhN1p4RHJ5eUpSNDNpSlVBajBZN2NBamRRZkg5NG15MU9hUG5s?=
 =?utf-8?B?RTFSaGt2T0V1VitYRGhDZmxNUHc5MmFxelh5Y0Q1SWpGS3llU2l4SklpMmtl?=
 =?utf-8?B?QTAwL3JmN0Y3bjNuaDlCVmdVM1JBYkRqcmJ2dUp5dUF6M2JVQzd6OWxzYzBB?=
 =?utf-8?B?S2lrTnhjZVMzMjNUZHdrQkhVaWlZUnZXOG1FaXJndkdWbjJqM041SVlhZ2xI?=
 =?utf-8?B?eVJWTDNzYXVzdXVXL2RwVERoS3F0MkxoMExzbXNpbCtpT2lqSGtKVm8yM0Ex?=
 =?utf-8?B?V1l2eUpKM2ZWTUJzdHBvc1dNREZ5Ni9zaGltQ2cvTmo2TnJkbmY4YTgvSFhJ?=
 =?utf-8?B?N3RCUTBZcVlLdVNrZ3J4YnZCcStoakp2M29YWnk5cTFKNnI1RGFpcWdHRnVp?=
 =?utf-8?B?aFhTaDRxZFNVWlhwV0IyZW91RWZycWRJTkMydFZzNjNldnA3MXRvT3BkbFNu?=
 =?utf-8?B?TmpZUjRRQXlqdFRTbTVEVGN1NW52UUNQcDhqVkRCUzRhWkpiN2piV09KaXVL?=
 =?utf-8?B?RXhoQ0w5V1FDMTI5QUZYeSttWXBXdlhXRndGVTNLZHVyaWt4cHpmQW8xazNm?=
 =?utf-8?B?cGRNeTRldjh2TzRKNGtPWHRrdHR2S1Q4UzY2VXJVQ1RrSmFBUUNlRk1SMTgx?=
 =?utf-8?B?d2hicWRkQlpUbnNIaElMcE9wSUtGbU5UZEJ0M3l3MkNPbU5FOUtmWXpSYWFB?=
 =?utf-8?B?QUlvT3lhaFBCam83KzB5cjlreFRNMmtXYnhJaDFBS0pTNjdGcndqOWo2cjV6?=
 =?utf-8?B?Q1MzUnBvT2pVWlBtU3ljQ2hZVEZYb3BLNUFaVHdSWkdGazNZTGM2V1c3MDFq?=
 =?utf-8?B?QUt6cUdoTG4yZVlkOGZmclNDT2hpL3pQSFZlZ05WS0tGVUkvRDZGc2NTR2Fi?=
 =?utf-8?B?UHpvaHFJTmFZd1IyLzhzQ3ZqaC9yaDhtWldvay9pZ2VWRHg1Yk9VWXVIeDJE?=
 =?utf-8?B?R2c4V3FZdHIweHFsQ0hWY0haTlNIeC94L0V4aDNlSGcvdlBaL3F3NVI5U0xV?=
 =?utf-8?B?dWpJRHFoMlFKYXUxSzNmSTE3dUJmR3BWTmJPaDduYnh5U2pFMWc4Y3hoa2wv?=
 =?utf-8?B?T3E1ZkcwTGVHNC9VSStoTmtQZEIzRitLakRBTVJMSTYybm9iS04xY2hmQS9V?=
 =?utf-8?Q?WGvJoPhBnWuUaOcjpXA52wedU2Z73g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3997.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(7416014)(376014)(366016)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjYxOGlmc29qbG9hZ0tMMnlHTGVQYjJpT1Nrcm4rMUIvWTVhUTVCQ1FiWjA5?=
 =?utf-8?B?WHdJR2xWUEw0OGtzajIrSHYxYXBoZmM2aXk5K3dISjh3YThSb0xzZm1pTENW?=
 =?utf-8?B?WDhoTjI0eE1uOWFNY05jVGg2b3BoVGQwL3dwY1FRazVjUXVobUFpUWxwa0tR?=
 =?utf-8?B?WXZ2dTM0dGdZdXRLVlB0TU05NkhkbXlLTHZCMnFoOHpjdkFkYW1TK1dJcGVh?=
 =?utf-8?B?eFduejErZzdCdVE4N01mWnBhMStnUVAzQmJNcysvUDV1aWpWaG1McHNwN200?=
 =?utf-8?B?RXZiZ0gvZVhKeHAvT3ZQNFI5WWpRVENYWjdheGdOUmpXY0ZkeEljOXExQ2ly?=
 =?utf-8?B?a1BHSUtmQnNrR3hMa2xnWTErZ1cyUi9nTTdsWDZ2cG5TYXlJbmVvUWgvVXZa?=
 =?utf-8?B?d1N4RUVWaitqNVpmNmUzZFZVckFaNW9RamxjVkN3TUFWNlRhMGVXTUg3WVpw?=
 =?utf-8?B?WVdPdmF1aVZJNGlEM2lWTXhSVnNWTDlrVzNVVThhWHZNcmQwV0o0ZVBrTnFI?=
 =?utf-8?B?ZWxMRlRGd1pKYlgwdFQvZHowYW1aMWsyalkySWVhK2ROZ3BQL1FjWE05YkVj?=
 =?utf-8?B?TnhRTTZTZXBkNEl5bW45Q2JJQTdZbE1jRXBRNExsVGJVNWpqaVhUcmhSVjNh?=
 =?utf-8?B?ckJPV1h4VDM0cXNEYzV1RE0xSmdvQmxaeU95YzlhclN4TmF6YzBGYWdHclNV?=
 =?utf-8?B?b2pqY2FsWVIyWmlqenBGT0JpRWU0VDQveGNHVEZUMDFNbDl3S0l4UDFrWXlR?=
 =?utf-8?B?WEJ1L1RUU3p1OEhWN2pPdURLbTA4ZUlGTUgwa3luZE9GSFFyUGVzWjVKR0U3?=
 =?utf-8?B?RFREeDlVRERqVzk0WEc5ZDVENWRSY2FtWnlHZXRibjBEZGppaXdaMlNDMTRV?=
 =?utf-8?B?d00wVHVydGJKWEV3N0NrQnFyeTVhSmIrUTNNWDJ1UHlNNTNpSG1OK2V0dU9E?=
 =?utf-8?B?TzBON3dhMldQcG1iOVozWDdrWWdmamVqZ3VQUzFCVDVkRVRiMHdxWjhtZTBy?=
 =?utf-8?B?bjAvYlBjRzBSazhTeU82WkU3dU95TVZqbWRpZHh0eTE2dWg5RjhqQU5BZWFi?=
 =?utf-8?B?VklvbGx5bm95M1RyRWNBTkliQ3dVQ0t0TTZKRUF1UW1zVExsMVBWMk1KZFZE?=
 =?utf-8?B?WFNjQjduVTN0VitTZHNHM2JsRGtYajJMaTN2TkJnOFRUSitXK0VWYWdDV3k2?=
 =?utf-8?B?a0dTSFJocEZySUhMZDhja1lsL0VFYlNlbzZrbUVuT1RHZHhGb3hCMG9rT1VG?=
 =?utf-8?B?dnBDNUVTdVIyenVVWmZBRFpQMUtKOTBsV1ErY2xRQjJ2L1pabkFzRHVXVXN5?=
 =?utf-8?B?a0p6ZUZWRndGdjJORlN3MTc2dGFQR2xYQ1JTZGdHeU5MS3hvY25zdkJpRDRM?=
 =?utf-8?B?TUxtbTY5L29lN3E0RjlmNU1GQTZzTTZkdE1iMzhRR1E0SzQxMHJMbENPWElT?=
 =?utf-8?B?RkExbnFtZHc4TFFBS1Z5eTF6VDZ5SVNpZDFaM2wvOUt6TmRvUi9NaHpIOEpJ?=
 =?utf-8?B?Y1ZsUmpwV1lYb1pTNnE2bHNiOVpQQTgrUFA0ZDRMZnpISEtSTDljZXYxQ254?=
 =?utf-8?B?cFluMmU0L0hmTlpWOE1OY0Y5WG92bnVrWTdld1NNK1BNZ0VrLzcxUzRuS2dj?=
 =?utf-8?B?cTQwd29yRlVPR0hSemphb1JVZ2hZUmJTODJDR25oVE5uY041WUZxVE84bnRi?=
 =?utf-8?B?MVlYaE1WbC9kYkR6OGNMOXJsaEtMb1F2TW80Q0xJK0lYbG5relovYVVNeFVV?=
 =?utf-8?B?S3M2YzZ3c0ZCYkU3S01ZaVhmNWxDdExVckdnRjhtT1NGT3krS0IydXE0M3ox?=
 =?utf-8?B?U2N6OGgzYWNldWo5S1UvV04xdW82WlpQaDV1Uk10SmFuUk8zTjAxWHhXZzVY?=
 =?utf-8?B?Rm1MeUFzTXRTT2w3TUdSZkw5bUNlbmdHd2JBbmlWRUl1eHV3c0JaOUNrMkh1?=
 =?utf-8?B?dmtNL252MXFXZGRER1V0MEFQbm5NNEZjN3hYUGZxb3hjNXBKeHNrakdCSzc1?=
 =?utf-8?B?RXJKSmh1VDdaRmZXamZaVHFJYk9Oc2NiclY2ZmZyY0JUR3lyQlhnTEVNVno0?=
 =?utf-8?B?b0xpc1g4R2I0dkJzWkpUdXpQZC9BSDFwcElCUzluSnlqdmN2UlhiYmVqOHdS?=
 =?utf-8?B?ZW1IREFMYU8rKzVjY1VIY2xHR0s2eUk5NFFCZ2ZnMEFWVGlocFhSMWNaM1Bq?=
 =?utf-8?Q?iN6fagjtiFe8JJjhd/MZcwh9e3jl4DXHcm09cnHJt0JK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71639f9c-2b55-4cde-703b-08de16c3bd8b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB3986.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 08:18:29.8146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lr0958NGg0yrbRCYCAGhG+kQDdPbKLfzd1mBo84ZQKM1PMHJ63vGKkEu9dPpH2hDEivQwVOd4C/sU/Qlu9Tnog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8438
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add definition for RISCV_CPUCTL register and use it in a new falcon API
to check if the RISC-V core of a Falcon is active. It is required by
the sequencer to know if the GSP's RISCV processor is active.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++++
 drivers/gpu/nova-core/regs.rs   | 7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 9b5269843af5..45650b66fdf4 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -601,4 +601,13 @@ pub(crate) fn signature_reg_fuse_version(
         self.hal
             .signature_reg_fuse_version(self, bar, engine_id_mask, ucode_id)
     }
+
+    /// Check if the RISC-V core is active.
+    ///
+    /// Returns `true` if the RISC-V core is active, `false` otherwise.
+    #[expect(unused)]
+    pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 42179c2a6d99..fd207920f721 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -325,7 +325,12 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 
 // PRISCV
 
-register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase[0x00001668] {
+register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
+    0:0     halted as bool;
+    7:7     active_stat as bool;
+});
+
+register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalcon2Base[0x00000668] {
     0:0     valid as bool;
     4:4     core_select as bool => PeregrineCoreSelect;
     8:8     br_fetch as bool;

-- 
2.51.0

