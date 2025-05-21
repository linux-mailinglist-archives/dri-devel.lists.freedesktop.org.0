Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FCFABEC24
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 08:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FCE10E64F;
	Wed, 21 May 2025 06:45:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WUOXgRmZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E5E010E5EC;
 Wed, 21 May 2025 06:45:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q5XEcanpUCH3sEudZsFYYllQrjUTEFRTFJ/CyzVIoUtGPvzp+EuZ6nVRKkbQy91sa8cSf7J7d12D6jK5ktfRb+oA4LNogxx7qvcP6mN8vncQIshU5c7cLqUMZUH+cUcpeT/6cDWCDRPy0aeJvAqJUsXpUjnxDVxDbfx6M8LzZWo8SNAY9QpREmpoELaxO/6CZ3dM4bDWJ4Kxk7jDEJN0gpZxw9ox1ltY6Nj1ZYiooolELn3GI5FrGdxyeeIkKOSu0/R59HFDVYa2lLmGx5WTpQL2t/9MkI4Dc81fRLNB4uwrfPLykRfuTD+bzJsrV3Rx/bYheX5Pdt9AwPcws+0Tdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2fZBnXD7wOb+26zDYaA5Qy3BmHfiBreLjUBhPHDrFxA=;
 b=HXyfA+9ux9rjTpWvsCqLQTtqNr2toQVxAuwDGbFA5p5NUacefhafhf1abEBWFfGRJCkhZ4CfN4d0q9jbrngUVYIiy+3iu4VRmwYN/Bh4Oc/YMwLycsxE+iYF4+J1adm0gGwQ329yJrZMaXFDNWt5xOizHb6DrqNj88gNXOTO+uTG9D2E/Aeu6h8JiV6oeTcauuaiU48OQn/rofneXVGzY4kxjDHqxlrmruOi9TCh/QgAAFjjxYxm34hmii+phwcVxDvevz+plpr3dVVoj2gB+apyYxrGhZSvEqPM2ACgZO43egpGL5RQ4cm+9fv3X/4rT1E30I6ZBksyVByOKFH3lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2fZBnXD7wOb+26zDYaA5Qy3BmHfiBreLjUBhPHDrFxA=;
 b=WUOXgRmZJPr/FasRUiS7tkYW/h1k5mdQ9OO5pGNEDvuqvCjKJPbpwmNdMc5jqSOGo8G9BOf3dmGwhN+mEKJ3NWHrafypULg6je84dmw/Gx1kEJxsPHyNW9lVarL0H1W+Iw8L/KXp1UDFzazh4MxVNJDI2PuXMsxPKq1+6WYhRG04r2tN6TzfJDGpLSuDY/iKJiMTZCC7Mx1UxdZkHECwaZy3urBERWFqjgdLnDwJthj9SprisJT9tfADWlMPExobc8RUvRWOt0QJ8PyofRSFERDYTmtg0jaD4nWKRY+3GuXdvJQCtaPJtk68sulz5s5hymL7yAf8tkIBDdR2oiHwmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL3PR12MB6618.namprd12.prod.outlook.com (2603:10b6:208:38d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Wed, 21 May
 2025 06:45:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%5]) with mapi id 15.20.8769.019; Wed, 21 May 2025
 06:45:25 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 21 May 2025 15:45:01 +0900
Subject: [PATCH v4 06/20] gpu: nova-core: add delimiter for helper rules in
 register!() macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-nova-frts-v4-6-05dfd4f39479@nvidia.com>
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
In-Reply-To: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY2PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:404:a6::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL3PR12MB6618:EE_
X-MS-Office365-Filtering-Correlation-Id: d84cee34-78fe-4baf-719d-08dd983310f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVo5WGVScjZhdy9JaGhmV0x3SDNpalJxY0lvbnZOUkppckhLWi9zR2hjRjhU?=
 =?utf-8?B?aTVSV1pJN1dpL3Qwb2xDWFN1RHdSWnY3N0NZblpxUnNLMll3TytpNlc4QTIx?=
 =?utf-8?B?bXh4eW9WcnRrSTE3Um9oc3lnNkZSVTc3T21taEhYcmdiL2ZVQ2NqeFJJSDlG?=
 =?utf-8?B?SU1rbG1sWkR1ZFEwUExpcUp2alBrNURJeXc2UC9RNk0vUkhyLzg0WnVIUW5a?=
 =?utf-8?B?Ti83L0VnRjNRamgxOXhRRHRCMVJnaGJkQWcreUxvQVlkUnNWdjd6Z2Rpc21N?=
 =?utf-8?B?SGNVUmV6ekpET0RCSGovR2NRd1lsMDI3clRXd2JDcGJLOVpMNE5Nd1VpaDgz?=
 =?utf-8?B?cjJJcUJBcEdXNk5wWGhnZDllM0N3Q2lIU0grTzVxLzB6UDN2U3RRUHA5WVRu?=
 =?utf-8?B?MDErcG1va1NOSDkwK1hVa2VLc3ZJRDRtQ0NaVEVIR20wbGo5cUxvaEthOGFY?=
 =?utf-8?B?MjZFZEdmb0d2L0hFRG9iWGQ5VmgwYmV2cVUzQ09IVnd0YStUQkl5VENaMWJX?=
 =?utf-8?B?RGpmSGRheEQ1VCtNY01NNmR2V3BoeVZ0ajc4RlNlc2pSbDFCZXAyVEs0SkNU?=
 =?utf-8?B?YUpvQ1E4enpGNnlWak1IQW1DSWFiRHNkY041QmQyVlNxVXkwY0lNRjRjN0FX?=
 =?utf-8?B?QzFYaXVEakQwVzNOSzR6a1g2Mjc5SEEwTmhBdXlCWXgvNURrdzRGZGFWUEhV?=
 =?utf-8?B?Z01wTjFhMmErOHBHTFNaTGZGVEtZQlNpVzNJQU5uVHJYQXI5QnF3KzhmMlhM?=
 =?utf-8?B?bitaZjlJRUU0ckdzVEJCbHN2TEptMUNFTUpSRFdqRGFXZ3YvbVhTNUs1NzBy?=
 =?utf-8?B?UmF5T0hrWnRUSm9vYkdiV3pkMjh5bFBKU2Y4YkJVT0hrNTdiaGlLazIvanZI?=
 =?utf-8?B?TTI1emIzWDBmVjdrMUpGYlcwTWNMVzRrRi9aMGQrZTlNSkVkcUdMM1dTRXNC?=
 =?utf-8?B?TXpYQmJWaWlFS0UvU05qd1hKY0JBOHJ1VmRTVDREMXFMaktZQ2ZPWUwyLzdq?=
 =?utf-8?B?UFh2b3FYL3BROEViVkpZWEJjZllKU1drUWdwTXU3cnd0WFRLUCszODg5Mito?=
 =?utf-8?B?MVBuQnY1UWxwWmZwcEVzVHBxK2dZbkdRQ0taWnR4UE1YVUl6bGd4THZQeG13?=
 =?utf-8?B?S2JnajYwN0M1Uy9XY2d2L2hCK3RyZVVJV0J1dHJXb1lGcmxxRzVRc3k2UEp3?=
 =?utf-8?B?cjIzOFdyU0s2OUYvSzhmZzVrWWVsOFA5aTRFeU5EckhCb3did0Y1dkMrNUJP?=
 =?utf-8?B?MkorYS9YRE9YRkdqZW9KY0dBbU0xNlFra1huVVRSblVBNXhrRlRxSjl5YkRP?=
 =?utf-8?B?UklnUE5ZMXJ2M1pzWCtuZDcwMlROSHJEU1dQS2lvWnlzK2h6QXpZaVIwazNE?=
 =?utf-8?B?NVpvU1ArR01UdTY3cFpyeEZ1em5sOExEUjNaK2JENWFkcmQ2dFpFME16VWxR?=
 =?utf-8?B?VXFIK2trQ1dtMlppN1NqMXMvejE3Z0RlbG5SeXZtNTVkQ05wamZQb1JDMmlk?=
 =?utf-8?B?bEw3dWQrczZCMm1QVTNUMURRK0pzVFJOdkREOFJSeUhndnpGWEwxVHZNWVlO?=
 =?utf-8?B?dG9uRWtCN3J0UTJnVjV0V2EyM3VsTXdOMVdEWHUyV0NrUUJXN3Nac2VuZnYr?=
 =?utf-8?B?Qng4ZFNaUVA4bXJYNkNCcUxIVExkWEdGc1h6L3h0UzIrR0JFc2VvUFFjRDRD?=
 =?utf-8?B?L0lLOWU1MzE2M1Zyc1hrYkZRUmx5TDlVdkRKa2diQlcrVXNoSitCaUJzM2lh?=
 =?utf-8?B?bFYvdWdvR2RZR2dsalFCSkxLTGxrTk5mVVVOVmplRTBnRUFrQ3VXUmUybUVj?=
 =?utf-8?B?bnVkcEh3emRtVVZ5cmhkekJKV3FMalVyYkdEZDJTd3hUNVVPeFJQd0MzSmkr?=
 =?utf-8?B?Q2w4QmxHOWh6Zm15MFdwc3grTnVoVjRIWUorVGlHblVvcjRHY0gwd0Q1dEJD?=
 =?utf-8?B?bnk0aUZ3L01WbUMwMTJVeTdQa3M0N0JuSDdibFlHU0NQZWVPVnZYU3UzbFZo?=
 =?utf-8?B?dXZNQjJEalZRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEFSZGNiT2NNaWUxQ1NKbFdlQTN5TjN1SFh0R2pyNm5Eakg4bXR2WC95U2xp?=
 =?utf-8?B?anphelNINGdybmlacFd0em9FNk9aTGgzTTk2bXhYN3dmdnhsTWM3Y2d3Uldq?=
 =?utf-8?B?MzhHTVhITVlsQjhkcU91ZUtDbWVIU3lDRklJelQ5ajhNVGhvS203UXEwUFhJ?=
 =?utf-8?B?MjRzWEZWeWtWT1V2RkVOSGZub2kzTzhRY2VmMWYwUStvZ3lnTkZ0bTZTVjVl?=
 =?utf-8?B?eEY5VFBMcVRmckxCYzBGbUFQOW8zV3plMyttMzBOYmUrWHkwcGorTURET2lY?=
 =?utf-8?B?ZUxNSVl2VnVWTGR5Y2xsdTE1MmRxUmxaQU5NWlpMa3J5ODA1ZzBkZTZ3dFFs?=
 =?utf-8?B?WVNpRGh5ZElFTUdXRjZTd1dNekVTTDY4UEtkTVluMkVvcTUwMWpsbmx2NHRQ?=
 =?utf-8?B?OG5Ja21XK0ZncU8xalh4N0hqQVY0MTc0dVRwN21TZEYrQ0N3eitDOURSRTYx?=
 =?utf-8?B?NWljdWtqU3VvZ0V0SXdKODF3anJBbnpzMzEyY1dHYUtsdmV0TnArRzNiWUJX?=
 =?utf-8?B?TUVMd0JTQTZGVm1lcTVJaTVSNDhMWHNhTDVleGRnSVY1OUZpMU1QYWt5T0c1?=
 =?utf-8?B?Mmp1aDI0TW0waE1FRXovWGlIMUt0dHhXWWhhVWZqekNwcldjUVZheUJKZWcr?=
 =?utf-8?B?M251ZHlhcVh1a21sU2hQbUttQmVHQ2pMZ1VCZXhFOXJ6WDhVbFJXUHd6M0pZ?=
 =?utf-8?B?MlhkcVhLcFNRVk1XNDNoZUJsMUROdVQvL3hGSFQwSWZIa3FTTkFXQ0l6STdP?=
 =?utf-8?B?YnI1L3ZkcWdham1aZnJ1SG05YXRDd3FVME9sb1YxWjZIQTFCQmRsQmgvNXZM?=
 =?utf-8?B?VDdQbDZRL3MrcTdrZVpRM3FURUNpMFNnZUIyMFAxUXFsOTgzRzJCM1lFdmVp?=
 =?utf-8?B?Z29HQlNBTG1QcUNUUWFHbGNCY2tRSDRYVGFnckhMbkZYSUxIL0RVYXdlZUd2?=
 =?utf-8?B?VklzR0RHcFJkalExLzhnaWQyeHNFRTBHSEVEWmpBUnM4am5Ya2hzTlo5WnB3?=
 =?utf-8?B?dnJsYUhTeTRKNGsxUG5haXBxWmhLenpPK0E0VXhrSHlueUFmZkxGK0ZSOTVU?=
 =?utf-8?B?SnQ5bnZjYTBmd2pleGNDSXVONjBzWFhZQ1JmLzdLVTR2MG1FWU9BYmxSTnBL?=
 =?utf-8?B?WEk2UzRSTU5yNGs5OUovWENjZkdnY3U3d25NTjJFb0NHY2lOcER1ekppMTNY?=
 =?utf-8?B?SDhxNERrbjhnTmErMGN0Ylc5NkpVOEFKRW9uQXhoczdySlN4dGZIa3hCUkNY?=
 =?utf-8?B?UDh0NzUxU1oveW0xamUzeFVhY3dEamNFRE96V2ZZTU15bWp6VG1nMVBGc1Bx?=
 =?utf-8?B?bWQ4YmxvaGozaFk0Z1lVUnhod0pWc3pWQWFzWFhvMGQzM1RpdmVEMTdPcVM2?=
 =?utf-8?B?QzhCbHVMcjdXK1c5QjRWUTh1ZlhBMHZJRXZrTFZkdm9xZ1VaSUNtL1RjdDFW?=
 =?utf-8?B?T3lOWFpycFU0OTJ5VjlpZ2xjb0VUNEhXM3lhK1B3YkQyM1gvV0l3d1RjU2Rs?=
 =?utf-8?B?d2toM0hvV3JUOVEvNmZYN2ROQi9Qd2NIbW5lZUo3Nk5iY1VuTlM1d25vcXhY?=
 =?utf-8?B?a3VURnJMaXhiMTV4UWJOcUlVRzFpRGJ3MytXa2o5d2crZWZHOWQrTGcvRi82?=
 =?utf-8?B?ZHV2WFVjakQvSXZGdWRreHlLTGgxWjA3TXFlWWM5ZXdzNmRmRlNMRDJkRXpp?=
 =?utf-8?B?ZjFWYXJFU2dmSEs5V2hQVkRhTVpxbnZwRktkek9LQitTa3NKVFZqRElqRWNB?=
 =?utf-8?B?SHBFWitsdWVrM01YMTFEMlBjRHcrNzFYQkRJdXVqOEdSM3lnTlRvN0tyYThv?=
 =?utf-8?B?OEdvTTlqSXVBQUdhU1FNRklJdVJhTytKclZRTHRGSVAyRFZlNHNuWTRrS05O?=
 =?utf-8?B?YUpIZ2JDR3pQNzh3UGd4cnY4M1dmQWJXV3p2ZzNlR2pzVXNBOG9CUWUrNE90?=
 =?utf-8?B?dnlqdEhUTGI5V3JKUTVUeC9jL3F2Um0rSWQ3RGZvOWtwNGRrOHRQeENSNVFX?=
 =?utf-8?B?SW5kUjBDeXZKMVQ1bk1zWVVGeit2bTV0V1lkNnlTcXR1dzdjdWx0NUdtcGZs?=
 =?utf-8?B?N0dRTWtobklEVytDR0FMdWgvN0FGUDQrVzNMV3pOcjBFbHRVdUtUd21qNGlT?=
 =?utf-8?B?ekF0VUhHeUZJbnR0akx5RHh0cUFNeWVCZzB2QnBQSGE2R0pIWkhqQk85OUhr?=
 =?utf-8?Q?jh0oc+lx6L+80DoAId/BrSDl1nxlpqkZlZxb9qdwh6vv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d84cee34-78fe-4baf-719d-08dd983310f4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2025 06:45:25.3003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gBz9eaEKBP8aUHiEryy/olnYgnzGnojFaa5J/w7AdteVpJ7dK65MfFpl3tD1/lLC1mzjMHURNnm2Ra0GXnUAWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6618
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

This macro is pretty complex, and most rules are just helper, so add a
delimiter to indicate when users only interested in using it can stop
reading.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs/macros.rs | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 40bf9346cd0699ede05cfddff5d39822c696c164..d7f09026390b4ccb1c969f2b29caf07fa9204a77 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -94,6 +94,8 @@ macro_rules! register {
         register!(@io$name @ + $offset);
     };
 
+    // All rules below are helpers.
+
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`, `BitOr`,
     // and conversion to regular `u32`).
     (@common $name:ident $(, $comment:literal)?) => {

-- 
2.49.0

