Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KLLrApCwcWlmLQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 06:07:28 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 694F961E73
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 06:07:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F366C10E8EC;
	Thu, 22 Jan 2026 05:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lx3oHGfa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013060.outbound.protection.outlook.com
 [40.93.196.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DEB10E07C;
 Thu, 22 Jan 2026 05:07:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=se3EPnC120/S0yVAvPJMYMp0nXpqvnCi/WKoAQDQ+G3KA+mPtlYhzJnVvLlOntmqlKtTaRaWPkC9BelNnO177Bj4hfnG3FckonvLKH1uqs/9877wjV/vRLmmrGFLjjyZ0H84sO1JYFta9F+uUy/Y7ZcpO6snQVAaKp6FpNs3NTkVR5L7FcyGnwgZMaN7Rk8CxHoH4n6aDKLmovNcz5arh2KdEaoA9ihOx1KO62QmvtX6A6w6FbMkewxISXuTEXn5Mw1yf4LTxWLHOnVFqeAS6TvRK1w1fqw2sLc+3t1nhy6kcPBqzxb6rwD4NRv/5l9ykpm2agXE62D6J6rrz2envg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VW88qXUZECqHOmV+ac3niWzIB7SEZsH4h5gWRHiYTkE=;
 b=E/z4kQ5hJlEtH3GIdKHCvlrU69LN393FuaU19rRIyCaqrSS+9XGJQ5xcHK/VgwtWAlLiehY6nd50UQKznsv44pzffl1R30hvRzCQzi2q7Mip3+XFe2eUA7OJTceehuP70/dW2r79/hIgjEf5GM9FHCYiN1cVNNzePbgGQmgIxsnZqLOaloX4Xn+0nreveyYo4SLW4jO7NBwF1wJSp9upk6fD44p6XkIMjjFAJqmTnTizm0nqpkh3WahaDwiw7kLPoZEc6rVTBB3+hzpRZsgIm3wIoVHfMPMai1P/mKiW5307vLvKewtpHeLqyBfcInyb9oiB23HzW1gFd2C7YZFWBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VW88qXUZECqHOmV+ac3niWzIB7SEZsH4h5gWRHiYTkE=;
 b=lx3oHGfagJceLIupw5HzulPp7vpn1rkp2CXir9srrVRLMBniW06pNzQgXWzrmdn/bbs3EgwOujtAVbN9beqA5okVeR14O+lqOMM2araWLkXmrm+Fz8LAHlBzi3CdU7AnpSi3YDFra4GcrWh9qO+hL50FGYoHl828pacJ5vwG5YjchHUDh9nHbg5WOgYvQbKY+Jui8oB+vozMUdcNJUl7kupeY8O1p/F7HjfPrstjuRKtJa+b3Rg/5wSNAKdkjNVjwIOBj9zYn+XifVTH7VyrEwBxNUocHRD2sYgjhZbahGW7fYHX/hKdNsRY6emo9qIw4Fo4d8fjAT5zWligcpGuKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA5PPFF3CB57EDE.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8eb) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 05:07:20 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%6]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 05:07:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 22 Jan 2026 14:07:16 +0900
Message-Id: <DFUUVM5M0MYA.36CL66OCAICDA@nvidia.com>
Cc: <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] gpu: nova-core: gsp: fix improper handling of empty
 slot in cmdq
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>, "Alexandre
 Courbot" <acourbot@nvidia.com>, "Alice Ryhl" <aliceryhl@google.com>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Alistair
 Popple" <apopple@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260122-nova-core-cmdq1-v1-0-7f8fe4683f11@nvidia.com>
 <20260122-nova-core-cmdq1-v1-3-7f8fe4683f11@nvidia.com>
 <ee459198-04f2-4bae-8e1f-4ec413d92f89@nvidia.com>
In-Reply-To: <ee459198-04f2-4bae-8e1f-4ec413d92f89@nvidia.com>
X-ClientProxiedBy: TYCP286CA0212.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::16) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA5PPFF3CB57EDE:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ceacd60-51a6-459c-8fac-08de59741e60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|10070799003|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1VQMUNmd01FQjJuQTZOUHo2MnVCa3A3K0ZUejFBTjg0QU4zaWVPa1piWmh5?=
 =?utf-8?B?WHlHRUYrczBrVmZRMmhXMHE3L0E1YVBaa1hwYVh2eFEwUXhwcVZtL21lUWQ3?=
 =?utf-8?B?TFNvRGJ3V0ppL0JyWUdFMWN4WXFzZVVkT1VxNlVDc01CSEJ6SDhkQnJzcWZF?=
 =?utf-8?B?V3o4aVFpVUlzaEc3K2tWdXlMa0VGUnlyNDI5cTYxaG9xdHpjcXpyZUk2UWtW?=
 =?utf-8?B?endKWjZVWkt6SXVpRUJCUHNOc0RmeWRaMVdObHJSMkc5Z0pjNEkvOG90RFdw?=
 =?utf-8?B?YVZFeXBtY1RJTUplVXZOYzM1azA2TXZvTGwwSTRtWjgzclZ5a0NvZFNiS0s1?=
 =?utf-8?B?eEg4WjhabzZPWjVNMllzZXMrOFJ0MXMyQzVyMi92NjduRzFwdzhqUG1qMlYv?=
 =?utf-8?B?MnVMMW8zREh5dGhPdWpDVS9XNHB3YkErRzlqUGY3WmFsZnpWaHpyalA0UVhL?=
 =?utf-8?B?VXZzT3FFQ1Btd0lZZjFvTUJHa09zbjdiNlJqWE9YTk43N0dzaWhlL2poUVVr?=
 =?utf-8?B?U3VOMUxzQW11Y0ZNTE5yaDNYcEd4MjlWQmNnNGV6bzBJaGZZanZEcmV4RktE?=
 =?utf-8?B?UWtaeSt6T01LVnQxM1dlVjQyOWpLVkhMYVlBYzBtaEFENUNHemkxc1BuQy95?=
 =?utf-8?B?SnkyRHFvWVBjelcrN0MrQ1FGSENpbWtudWtNRVVWcXhDQUE1ZkhkOXpRUURi?=
 =?utf-8?B?Z0ZTUW1ldEtaUVJmYzgvQlVxc09EV2pxS01CVjR5ZjlNMkN0TFhjakU5aXpR?=
 =?utf-8?B?a1FQdkMraWp4OTZyNThmb3hyMmIxWTd4K3BPdWU3REs3VFViemFuZ1pQc3Fz?=
 =?utf-8?B?bnpDbGNtc3EzY3pJa3JXZlk2Wm0raTZQZ2ZxS2s5NVdYMm5YaFBxbEV4NFBH?=
 =?utf-8?B?ZlM1alRFbHcyUzBwZFpkcDYrT2o3THM4dHp2Sm5jazA4QmYvVWo2MFllVHRE?=
 =?utf-8?B?K1JtQlBSK3FqZzcxL1hEVk02US9TZDF3OG5Gdy9qV243anNCdXVVZ0RMeHNu?=
 =?utf-8?B?L3B2SU4xMXBQVjFHUTdYY1lPTDVYdDN4VzYyS1M2QVlGU3FKVnUzR1ZjS3pw?=
 =?utf-8?B?ckFQaEEwaEsyNmo0UGtpcGFpYk9qRCtpdUIyanN0UEg4VnRMZTZIL0JFT04w?=
 =?utf-8?B?dkhMaWVDVllmUFpXZ09UVDdPaUs0M1lDUjRsS2JENG54U1poMjFSWENITU5k?=
 =?utf-8?B?U2lVU2Zic0J4ek13QlpJTGFyYW9zQ2FRK0NIUHJjYjFQVFIxQWtLcDkrbjlI?=
 =?utf-8?B?dW9XbFJQQ0pMSVVzR2V2bURLNEZraW5RWVFUNFJKUmNzQTB0Q1VheU5mSTVI?=
 =?utf-8?B?cTdSQTZJRHBNeWIrcWUrU3NhVmErVUhiejMxcCtML2pUbm5Ba1FBZE13L25D?=
 =?utf-8?B?dkNwOTVscGJSYnVrYlk4OStIODZNd3BIK3h6WUU4N2JEaE5HczRoc2IzY2E0?=
 =?utf-8?B?NGxJc0VOenNqWUJnK2EvdVNpRDNScTVVY1hwYnpTMndlK0xHSE9rRk5HcXl3?=
 =?utf-8?B?bk44RkwxQmpmYkdIdHRQT0FNaGlrT3BIQkRmckR6ek9pSzNHbmV2d0J5ZDhB?=
 =?utf-8?B?eHRVdGhub0JqZjU0WFR5cmx0LzdFc1VqUXM2LzlHTjdldHlVQ1RsRmxVNnRW?=
 =?utf-8?B?ZmVDanQ3d00vMUNKR29RakNDZ3pIU0ozM0ZWZkxBL0tNTEs2RjduVjQ4YWhJ?=
 =?utf-8?B?bU82RjNxTGIraHpLNitVblloN1dyTzVMbTRGQzFzcFZ6amJnMGtVSDJhS2du?=
 =?utf-8?B?c1Q0eTd3UEVaWW5SVk1iZmlMNlBOWjJoWC9KQUVjbk1VdXY0c2d4S0FFMHRw?=
 =?utf-8?B?dzNlRk5SYlN1T3pTSmg1NGxKK2MwanlheEtWMjZBRmtITENxRzZ0STZISlpN?=
 =?utf-8?B?blJwRnJsbFprVktvR0pCVTAzM0JJMTh4c0ZlR29ETlh6bHdkSElvT1BOb0FP?=
 =?utf-8?B?Y1R4Rm9JMG5OUkg3dkF1Y2hLcTlrRmtYNjNMREpTeVdQUXgwQU9yN2VyREMw?=
 =?utf-8?B?elFDdjArZ21ZSUV5SHpyMGJkU3pkc3hNd2lWSmJrRjNEU2FiMm91dVV3ZEcr?=
 =?utf-8?B?QXBjMVAzYm0yZzllOWRxZVg0M1JpcDg5QkRFZVBiaSsxbzlzb0pGWXlIa2Rs?=
 =?utf-8?Q?nEwY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nlp6eFJXYlpzNkQ1U3Fac3RlNkdxMHF5UVc4K2V3WkdRUVhWc2oxN1ptN2V0?=
 =?utf-8?B?OGVub0ZhQ3h5MEVzcXJOZmdoL1RwVHlOa1hST2FxZHhaZjBxSldpNE5tZlpT?=
 =?utf-8?B?QUNiSDBEenpVTFpBbnV4ODhHVllMdHNIeHMveHdOYWRXbGdldHFmZGZtZlps?=
 =?utf-8?B?SjdRYXBzK2kybW1QbEc0bkFSWThWcWdsUGJ6R3dHZ1Z3cU5sbmRrWnprTVJx?=
 =?utf-8?B?MDF5aml6OHIzcFVLY0E4U1BZTXVjaDlyRUU4K2dsL3BHR3JVNmt6VG1LZkk4?=
 =?utf-8?B?WXlGK3ZMNzg3Z01yc0hiaDFrOUhwY0RhQk5YT0J3bVYwZ2tDR2NTa2YyQmRw?=
 =?utf-8?B?TjI5aitHbDVPdVphUkxEd205SThCRFNhVkI2MFVUbWRrZURkRW5WY29XWEJy?=
 =?utf-8?B?SnFLT0xETlIvT0owWnBqd2tNTXZMaUIxTlVuNWNCVHdBMzBrVFZ1TlRCYXlu?=
 =?utf-8?B?Z3I0T2hIcG5UMHBCVlJ3aDF2MWladXk1ODN2aGxqdHlKeWYrR3JSNkVqdDVD?=
 =?utf-8?B?WG1XQXFQaUo4Y3hpb0Vzd0kzc1hPRlJYdTltYVBScUwrSzRhRVprcVk5dklN?=
 =?utf-8?B?Smk4eEVWZVU4MWJnK0pObjdCU0l2Q2NIazVFMUE5MWVuU3RvMFZGZ0dadHZT?=
 =?utf-8?B?MzhTZTY0c0Z3VUo3dzMycURwRlNOWjRtY29uSGsrTXljMDhhTkdQOGJhNndi?=
 =?utf-8?B?VS9iTWRiOW5LNC9IdlQ0b29KYkJpdm9PR3F6TE4yeVF5N3N2RlNNRDczOTVY?=
 =?utf-8?B?ZFNkaGNWMVRFMEw4RzlZQlpmR0N6SUlMR2FFSDlwcEJpQU9iN0tHMGNRVk1R?=
 =?utf-8?B?MU5QR3FrNlVvQkYrR295SWEycmlHUE5tUXh4M2tqbUlNNnprL0dyd1BoYlNq?=
 =?utf-8?B?RW02WksxUVp1YzQ0emJuUStCaWZWMWN0ZHdsN0hXdmlrTHRjMXpJWDkxT2Zt?=
 =?utf-8?B?UGtuSTBTRDF1ZHpLa3h5WlNGSlhkNjNSZUZEd09LSk1uTktCU1ppTi81MlJ6?=
 =?utf-8?B?bS80NEZOWjlhSW9BVEJkZEtUamZyTWtzQzBIR3dadUJQaDhPcnJtQjR5WVJx?=
 =?utf-8?B?OE9YemtBSTFhVXZjSXVmNUJ3ZUMxTHJ4dUt2TUljU0pmdEJxdVBRaGYvTDlj?=
 =?utf-8?B?SnlnUWZqbUxJRzZQbVcreEpNK09vYnR4ZmdKQVNBTnp1T0wzNyt5WmY0STI5?=
 =?utf-8?B?cmg2bXZzUEhhRVl0akdZdDg1RDFoMmNPUVJBRDVnOTFyY1JBNHZDVjdhZXFa?=
 =?utf-8?B?c1JidVBCQ1I2NzZtOVlKUHNRb0VDMDFMU1FRNzFMeVpyazhBNERNYlRrdWRJ?=
 =?utf-8?B?Sy96SktraDlCZ1lVZXczVjNIUEZiWWl1YllROUZuc3J2bCs5UllhSzJZMjBv?=
 =?utf-8?B?emF1MnljbDJ2WkhIV0trRWtycUNuWW5QSXBLeVJVbjdHeUZCaHJkY25HT2Jk?=
 =?utf-8?B?NGJNd3FncGVtQ3VRMUx6UG40SFYrN3lXUmNPdjV3TXZJQU52MXE1UHJDWGhO?=
 =?utf-8?B?WFR4ZEZDV0pDRHRmeFB1b1EyakNtaFdxcTU5V1RVZTdvbWRoNGVWdjNxTWh4?=
 =?utf-8?B?ZVUvdTAvVzd1WE96OHFwM0s2bm9weXEvbFJpVmtGbVdtcmJrU2xqZUhVbDNX?=
 =?utf-8?B?REY0dHh1RDBxRVpYbGN3UmxnL250N25JWnlwM205Zks1KzF4Z0p6WWpHeUVx?=
 =?utf-8?B?UDVLWUowSGJTM05lYzRudmxhK1BoYnFHc1IrczMzb090MnBtK0JVc1p1TFNo?=
 =?utf-8?B?MGhLcHRzSVZMN1VJSWF6OGpYbE1TUkRzNFRJbXl5MzNVUjdGYmJlTTNxalZI?=
 =?utf-8?B?eTBxV0dsTUJha3YxVzl2R042TmtLdngvRW9kb0xTc2RqWTFkSTdPNEtibDZt?=
 =?utf-8?B?c21TMk5IeUFXb3VIdVkxWkl3bVpxNlJIVGlxRCt3M0RlaVA0dnJ4cDcvUTZO?=
 =?utf-8?B?UFdSVWdIVWJlYjI4ekEwRXVMTGoxeW9jTUxyTWZtdXVEK1dQSzEvWDFnd1Q0?=
 =?utf-8?B?a0JBdFlWZHhyaDRlNEtIVHc3dHdaSllwMEE1anhXblpVaXRFZUNjQnphZUdF?=
 =?utf-8?B?MlNCWnk3Q3JJTzlCd3NHMy9ZTkNGT0tCVEQ0aVZCUjFoaFhnTGR6TERGYktR?=
 =?utf-8?B?bml0TEEraGluWFprRS9OQTJXTDNPZ1hSWjN2L3o1NDd6Z3lvdUJkbXR1RWJl?=
 =?utf-8?B?d1ppbXBnS2owaUNNRkZZWUtXL3pxUnNVMUpsRjhKQW5YbXBKZ0pSeG9ETjRs?=
 =?utf-8?B?RmM1elpoMVY1Y2RZSEVWZ3FnaXE4bGR6SlRVNk4rV2xPSm80OVFYdmd3VStp?=
 =?utf-8?B?SXRjTlFWQXV2WXhsdkxYRU5CR0FjT3hTRiswTklUR1paNmhIL00rMk5nZCty?=
 =?utf-8?Q?uu0rqMUKCv7ZFq2tYBX5JND9hTxvwUZELtqJY62QFATAc?=
X-MS-Exchange-AntiSpam-MessageData-1: s43kE0iZMUC+iQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ceacd60-51a6-459c-8fac-08de59741e60
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 05:07:19.8727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unahBnUmevcOFqRQC2OGI1pNxuDzX7mEdpz58HI2Z2VDhYsQ3UFflVohWGq0Z6cd0zXHioE9HVlKAEqmJtPUuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF3CB57EDE
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+]
X-Rspamd-Queue-Id: 694F961E73
X-Rspamd-Action: no action

On Thu Jan 22, 2026 at 12:26 PM JST, John Hubbard wrote:
> On 1/21/26 6:59 PM, Eliot Courtney wrote:
>> +            // The area is contiguous and we leave an empty slot before=
 `rx`.
>> +            // PANIC: since `rx > tx` we have `rx - tx - 1 >=3D 0`
>> +            // PANIC: since `tx < rx < MSGQ_NUM_PAGES && after_tx.len()=
 =3D=3D MSGQ_NUM_PAGES - tx`:
>> +            //   `rx - 1 <=3D MSGQ_NUM_PAGES` -> `rx - tx - 1 <=3D MSGQ=
_NUM_PAGES - tx`
>> +            //   -> `rx - tx - 1 <=3D after_tx.len()`
>
> Hi Eliot,
>
> Documentation nit: the proofs are great, but the above just does
> not go into my head easily, because it's a proof, rather than a
> sentence.
I had a look now and I agree that it looks like plain English is the
defacto standard for the PANIC comments, so I will update them.

But, I wonder what people think about this. IMO it makes sense to have
SAFETY and PANIC comments as rigorous proofs (where practical and
possible) to match the level of work the compiler does for us in the
infalliable areas of the code - if an issue occurs, unsafe or panicking
code is often the root cause IMO. Writing these in plain English is
easier to read but also harder to verify that the proof is correct and
harder to verify if there are any implicit assumptions.

I see there are some guidelines about SAFETY: comments but not about
PANIC: comments in Documentation/rust/coding-guidelines.rst.
