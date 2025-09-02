Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F26B406E6
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D4C10E766;
	Tue,  2 Sep 2025 14:32:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="scCzfmmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2057.outbound.protection.outlook.com [40.107.93.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8573510E76B;
 Tue,  2 Sep 2025 14:32:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U+quE0z5yLPTE+cSZWat2ZZ8DO0xbQyxVEok1nOd2gwaQaaZ1BdGRlYOCOWIlu7ZcJ6t5yTIR4wjJ/htY+Kslif5qMOxDna6wzbGgOBOohUYAu865jWEbs1ujYV/3XFy/gRRk5g80NqhWwNOOltGEpO4QNpN5KPNLB6MBKb10U6JceRLuTKnxMBdfoE+EDQMF5+mpszKBnqzt2stn62soceyUPrqDUequ6dd7k2QYOcgRVY54I3i1W1j9y/YDwdxa3IkPp4N/5vknuzaw5U7eqZiBC9YgcZkZ0tYHV1cxNkjOsBohtMFRd14deTrs0pso4Caiqfsi98dntE5orqYRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lASg07l09fDMnINEnSgEePKgQSXpwmH4Nfj0nIZ1EDI=;
 b=oLWzYDBAO69yoC38GiPqtu0GOE3vpZvY2jPWpBykhODjAly6qzcwUF8uymYMJoZsvYvU7B1vLwrOte3GddgAJvySGvlodz2MavY5Hr5+7XfeUM6GDUBkAZIG6zizGTM7DKIG5yp0FgLjGw6lTKPOc2mi3Pk6l/9IvdnpjAf5K+jm33o8x2FF3aSFJscrlQJt9py1RRRaF388gkHTJvWgGfRV0MWesAUvgJYXm9DhDuXhBezPEkynoOtH6/KemfsCGtz/CLzVXZzHF9qWm/Ed6XiaR1NcKTXfhCdggsGxPTJJim6xiBF+W4CMeMjCgflcTRbyTgyaj1JbJAR91K5o/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lASg07l09fDMnINEnSgEePKgQSXpwmH4Nfj0nIZ1EDI=;
 b=scCzfmmI8mpT8yChIm8YS+C4B9OSu2yc3XXnQlO1CoBexjNHoct1UJ4xrPAqUf28sBKigsj90VmzrdNA0qkrTtUTKkt+G8XNORgLmIojJtI4XUqr/6xq5xWy3kmWTHscL6xs5PxpgJWTf4OvhGWnk06hbe+EWPoETZNqht395wUfgzHUqJQKtaP2IVj/SYy3/uGATR2eqCSZdZ93H9TMGMU59NRs/xuOsPaxmDJbiKx14/ZOZMIyHMuhKz2duIRoOhTOPrrM5FxHbEI8pJQGc/JuRIKgSK7spfheEfB2P0ONFoWkXL07W67WNbm69w+L1UlPc0BArKGLPDgrOta1tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 14:32:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 14:32:28 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 02 Sep 2025 23:32:01 +0900
Subject: [PATCH v3 07/11] gpu: nova-core: firmware: process and prepare the
 GSP firmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-nova_firmware-v3-7-56854d9c5398@nvidia.com>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
In-Reply-To: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0225.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: adbb5d51-1739-4957-3e37-08ddea2d8b1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXJ2azl0L2k5b0RnbkFIWmJVWjVnQS9rUTNnd1duMnRyS0xvUVAwR211RmJH?=
 =?utf-8?B?QjNPV05waGNnMk9JWFJHZW5kRUZRRm00Ui9EUWFaSWFwelBSL0VBSVgxZHdU?=
 =?utf-8?B?dFRHNm5zMDkvMTZPMjJWNTVwMk94U2RabGRiUW10eGpEUVQxRHNxd0FVT2JN?=
 =?utf-8?B?R1B2dHJDREhjOFBSMzdheHlFR2d6NkhzR01XTzJleEtUOG9QM2k5Njc5cmJY?=
 =?utf-8?B?UzE2anFtcjgzTTNTS2wzYWhYVCtLcDI2R0QvNll5R3dsazhCVHRIMkhwbXVw?=
 =?utf-8?B?bFFOVHpnR0J2ZzY4MGVlRDIvQ3VlQjdEZkFNK3NNclVidVZNWHd2eDh5OWgx?=
 =?utf-8?B?RWlrN3ZtbC9JUnlINmNkNlBPTE5JQ2NpZmM5Z0tMczVSZ0hSREp1ZVFOUzkw?=
 =?utf-8?B?djlGa0FSNXpsTldtbW9nbjAvaWMrMFF4UTFpMHhIelFuV0pCWGZUcXF2bTUz?=
 =?utf-8?B?UThHdXh1M3dxZnN0OHNlWnRyNkt5UTNZOGR5M0U4Q3ExWEpJbFRlV2R1Lzdm?=
 =?utf-8?B?alJlNzVRcy80dC9uOE1oMUFRd2tVQ2ZITFRHL2xCNnFlbDl5aVkxajFlWGsz?=
 =?utf-8?B?YllQTHVEZTQ4K21udFhhNEdjRUxrSEo2ei9nMzRML29zVUo0TlVuK3RyQms3?=
 =?utf-8?B?ZzZmalU0TUlLejR4S2JNWHh4dnY2bEw0YWN3VWF4VGV4S3Jyc3Z6QlU3Wlh6?=
 =?utf-8?B?d0ExZ0U3U0hLblRmeHdDYThJT21Wd3JBcG0reWRURmdtZ0QvYkFYeWpaTVBH?=
 =?utf-8?B?TXp0Tzd4Wnc4UTVoS21FcHpsL1QvbGEvWFlMQ3NkeFY0dFo2dTBvUk84L0JT?=
 =?utf-8?B?MUY5ZmQzdFBKZ3JIVHVXalE1ZWU3dzVsTzhNZWRQWUZ2eWZlRFFKZ3JzRjJO?=
 =?utf-8?B?eG84eFF1UittZHNOR0M3N044b2p0WEtqdEpPdnBBS2FXZk1VV2paSG0wRm50?=
 =?utf-8?B?cWx6bzVYOE1rSUhieTFqc2U5bG5vYWJJMkdlMU55aC9ZWDNGMDVlK053ZjBE?=
 =?utf-8?B?cnhVNGs1N0RZaURaenJaV0Vxd1IwZ2d6QUVSaHZnMkNVcm5YNGRnWFZheS9q?=
 =?utf-8?B?RjMyOUpFekljWWFncHlrM3MzKy94RFl6YU8yVSswMi9EdWxyVEExR2l2WlUv?=
 =?utf-8?B?b1VFNmpXSXpqK3EwSFBxb01GSi9UZTBrRExHaXlPdm5jR0ordkpmMVp4UWE4?=
 =?utf-8?B?WVA2bS9CTlBhZjVvc1hZWjNzeldHRHRHaXppdWZOdFlBL1d6ZTB3eTU1RGJs?=
 =?utf-8?B?cXgvZ0dhem1EanhiVmJCVVEzNVpvLytBN1E3cmVOTURzZGNycUJ0MnZwbmRY?=
 =?utf-8?B?UktDOXNicm8vc3ZTUCtHWXFUS3dHd3VxT2xjbEtwMXN0M0NnSUpyRUtodjda?=
 =?utf-8?B?bzBjeHF2ZlF4clVpNDVqY0dsNy9iL1BDSFNVV1FIVkN2UllpajBpT2lEYXhU?=
 =?utf-8?B?eWdSZmVqSVU5bEpDakc3aHY3K3BtMCtxeWhMQ0lDL1ZkK0JORjlBWDhTTjV1?=
 =?utf-8?B?eUhrU1JSNG95ODNMVkZmN3ZtTDk3SGdkTGhyWmoxVUFXcHN4SjA5amlCbGNo?=
 =?utf-8?B?c2JET01IMUJyNnhiWW9xd3NXaVdWRVdLZmNUSlpMczRxQm1uUHJXVEd0SEJ1?=
 =?utf-8?B?b0pMek1iNTlkSW8zYkt4VVBhaVY5ekRyZEFlTnd1aDRJbGE0STROUVNlQytM?=
 =?utf-8?B?R0JIT1VGbG5KMDAySkxCaHYzeG5EZ3lwSHgvZ1NML3M4MUtJOWlZZlQ3L3NJ?=
 =?utf-8?B?RzBsMFA2ekc4TzBBbTMzL0dWVWtnNVVpZkVwcVNmbnpyZzdVcFJUeE9Ma0dS?=
 =?utf-8?B?MmFYM1ZENHduclZiWHFQNk9ZQjlINkNkRUgyTWQ4Ulg1WGFFWW84aVlLSWZp?=
 =?utf-8?B?SWRQcHVSWUxRQTMwQ2pYVTFVTitJUzg4clNnU3B4bVhHZkhtdExiUmtiVklr?=
 =?utf-8?B?T0xwUk83aldtKzFRZ3dZKzZ2dGJCRDYzZWFtQ1J6U1lPMUEvSDdZYUJNVlBn?=
 =?utf-8?B?b2twdU1wZFNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG5iSmhMc1RaRVkxQW4yamU1TWVpdmpremhpaG9DMGNyNVdRd2RGRnhXaUVD?=
 =?utf-8?B?RHpxVFl2dXdLcVhPZW9xL0FsSUtxU0FRM3huZnRNb3ZxK1V5SElQZWg2ZE94?=
 =?utf-8?B?SE1tODVSYkhqUmZSMHdKdDN6bkU3UllTUWF1WFRFdGxnVVR0MlNxY0hHaVIv?=
 =?utf-8?B?enNSZU9xSXltdGVWVDlLK21Cc2dDWXVTR3ZyUVR0Z2FnSGRWcDRxbGdYd2Zh?=
 =?utf-8?B?ZExVZUJsNVJoWFdTVjViaXFkbk9VMFdNOWdxekhROWpLemlKdkJXYUw2YkxL?=
 =?utf-8?B?ODM3YVYwcWhISjRINis0OGlSREM4OFVVMWdOT1djUjMraWhPVmpFeXF0Z2VO?=
 =?utf-8?B?Nzk5MWx4dk5RanJRa0JuS3dQUmVSbFdWY05NRzAvRUhTOE42OS9jWUZPNlRq?=
 =?utf-8?B?K0lYdHZzZnowRjNuazJ3UFZ6MllqUHRZOXk0cXdwUGFDUXBFTEpRQUVCVG5F?=
 =?utf-8?B?WW01YUJjbWN6NzI5cWFGTmRUSk80OXE0M2ZQNkRicmpFREhscHBYaUdMczZh?=
 =?utf-8?B?SHpmeldSOU5DMlMyM1FOSk9IdDBlSm5YS0V1RDIxUWV3dkJCKzFMTTd1bGt1?=
 =?utf-8?B?ZXNiYmt2cXAvRkFaNWJCNkFQVkR0eW1MejJsRlFwa0p3R0NIVFRpODFxTDVt?=
 =?utf-8?B?ZjFuVG0yZEpHcXA0SXZ2UmE4UnVpZmdZY0ZSQXFIL0orYjlRTFZsajVXNjRq?=
 =?utf-8?B?UnY2M2FKc2NzVDB0MlZmOERnckFlWTJoalY4S09JcUI0dGFGZmUwMGhOYnBM?=
 =?utf-8?B?VHFUc1R0dzV4YUtyR3RxQTFsQ3haZE5vQjhiQ0hVd2FML2JrS1RGdHdLNGlj?=
 =?utf-8?B?aExLL3VtWWJsR0l4bGlHdlh0UDRTSStlaGpzVHdaVDFjbWo4S0x0dWpOUk9E?=
 =?utf-8?B?UnJmRmtDL2ZWdWcxVVc0Y1lDbXFDcTBVTmRJNnBqeHVMaVVGYWtNMldZcFRp?=
 =?utf-8?B?WU9waGl1eDNmMnNlUk0ydVdISys5WXk1S1JDYUxSajdkSThUU0Rud3kxc29s?=
 =?utf-8?B?WmlwS3J6S2E5bFYzVStrTmZOYXhhMG80dVd3emlKZnpnbnlWLzJBdGlmd1dG?=
 =?utf-8?B?eU5rRHFRUmR3WjdtM0IrRURmN1Y2aVVCcTJRc1ZSRTZKUk9raC8xQmRmcWNC?=
 =?utf-8?B?QzJEc0doTkppamxsLzh4WG9zeGI3WmRPQjRFRnNMQXRmZ0M4aGFTc25HNU1W?=
 =?utf-8?B?VXo0MGc2Y2RQU3YxMkM1ZEtBNVg5ZERERDJFRTU2QUZmdDB2UFo1TERyb2Qr?=
 =?utf-8?B?amVMMk1oaGU4Z2hFRVZpemJ3ZFV5NS9GY0NrMmFVd3BNT0lueTRHNzlzNFA5?=
 =?utf-8?B?aVYzQjh1clY3VjZIN2VyeUVVanEzVDgvc0M0ZnRvNE1UTERXai9HaTlxTnh4?=
 =?utf-8?B?ZDE4U1orRzRjV3I4YVh4RmcvMEdpUVZaWm4vcmd0dnRUUkRrSElvNHhSMUtX?=
 =?utf-8?B?UE5JeWhRMk9iQkdHZnRCZEZxVzdUY2R0bkVld3RWUFBrbDNUd0FYNExOTTRx?=
 =?utf-8?B?WGFpem1JbG9SMGVmYmF1aXhIVDhBcXZiRlBkdnUwc1VxM1ZzNk00UTVpT29P?=
 =?utf-8?B?OTRsRlRqMThWdStnV2phVVV4QnZSWkxYUy9nT0g5Nk1JUUw0Rk11K01rQjBI?=
 =?utf-8?B?eW1Db2pLZHNrb2tTRFdIVjZhMFJlR0o5RjVoc1lFNGY4L2YrVW5rUEZwclVl?=
 =?utf-8?B?RUYwTUVXa29icHpwY1F3RnV2eUozOFNaWDRyVlBaUVRaRXk4dGtka2lzZWQz?=
 =?utf-8?B?dDUxYTlHMXlRckpJN0hWejdCWjF3Mlp1NEV5R24xWkxsWUVGN3hwdnlYRTNP?=
 =?utf-8?B?cVU0ZlhJWmtsWkxwT1lyQ2wzUFVNZVZxVElzQitnektVdyt0S1IyQXRWdllp?=
 =?utf-8?B?ZW1zUnJNVG1TOGJJZ0R4bDBxVWRVaDNYK2N5NnRzM2FZZDlINkJJOUdsNE9a?=
 =?utf-8?B?SStNVHFnNWwwdkZBdk02NVlCRXVQcXo0cG0ya2hseUZJa1JZNTQzRGpsZCtN?=
 =?utf-8?B?aUVlR3dHQmNxTjhWZEtXK01QS1VFeU9jNE84T245cnRKTFY0WEdCcGlCK2RN?=
 =?utf-8?B?SFcxSmg0WkRTUUZGdm5KbTI0bUh2aXYzbHZNek1qTjNFZTBCaUNCVGNQUWhE?=
 =?utf-8?B?RlFRcmw4ajVLTmI0U1pKMmprQXpadHZyNzBVM2oxVldrcEErbmVBSXVjejZK?=
 =?utf-8?Q?pvzQ7dhlovlTABLKuB0oz4D/ZmuQJiv/sqUixqrQK1Rh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adbb5d51-1739-4957-3e37-08ddea2d8b1e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:32:28.6420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t70W+5YZrlBrzKSQHlTN9FQXyCAg22nPvl6kK4OyzISwDV9DA8fzYmdRFW5whO7nt7H5LcGTONIHEeL8y08IiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
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

The GSP firmware is a binary blob that is verified, loaded, and run by
the GSP bootloader. Its presentation is a bit peculiar as the GSP
bootloader expects to be given a DMA address to a 3-levels page table
mapping the GSP firmware at address 0 of its own address space.

Prepare such a structure containing the DMA-mapped firmware as well as
the DMA-mapped page tables, and a way to obtain the DMA handle of the
level 0 page table.

Then, move the GSP firmware instance from the `Firmware` struct to the
`start_gsp` method since it doesn't need to be kept after the GSP is
booted.

As we are performing the required ELF section parsing and radix3 page
table building, remove these items from the TODO file.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst  |  17 ---
 drivers/gpu/nova-core/firmware.rs     |   3 +-
 drivers/gpu/nova-core/firmware/gsp.rs | 237 ++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs          |   6 +
 drivers/gpu/nova-core/gsp.rs          |   4 +
 drivers/gpu/nova-core/nova_core.rs    |   1 +
 6 files changed, 249 insertions(+), 19 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 89431fec9041b1f35cc55799c91f48dc6bc918eb..0972cb905f7ae64dfbaef4808276757319009e9c 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -229,23 +229,6 @@ Rust abstraction for debugfs APIs.
 GPU (general)
 =============
 
-Parse firmware headers
-----------------------
-
-Parse ELF headers from the firmware files loaded from the filesystem.
-
-| Reference: ELF utils
-| Complexity: Beginner
-| Contact: Abdiel Janulgue
-
-Build radix3 page table
------------------------
-
-Build the radix3 page table to map the firmware.
-
-| Complexity: Intermediate
-| Contact: Abdiel Janulgue
-
 Initial Devinit support
 -----------------------
 
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index d954b1e98fda82c44f87d2103e31fa717c392d79..cef910a7c2dc360139fafc2a01a050a9df40e45f 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -19,6 +19,7 @@
 
 pub(crate) mod booter;
 pub(crate) mod fwsec;
+pub(crate) mod gsp;
 
 pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
 
@@ -39,7 +40,6 @@ fn request_nv_firmware(
 #[expect(dead_code)]
 pub(crate) struct Firmware {
     bootloader: firmware::Firmware,
-    gsp: firmware::Firmware,
 }
 
 impl Firmware {
@@ -48,7 +48,6 @@ pub(crate) fn new(dev: &device::Device, chipset: Chipset, ver: &str) -> Result<F
 
         Ok(Firmware {
             bootloader: request("bootloader")?,
-            gsp: request("gsp")?,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..ddbf3f27dd795b9b2480f0392160a3bfb68c6ab7
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -0,0 +1,237 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::device;
+use kernel::dma::DataDirection;
+use kernel::dma::DmaAddress;
+use kernel::prelude::*;
+use kernel::scatterlist::Owned;
+use kernel::scatterlist::SGTable;
+
+use crate::dma::DmaObject;
+use crate::gpu::Architecture;
+use crate::gpu::Chipset;
+use crate::gsp::GSP_PAGE_SIZE;
+
+/// Ad-hoc and temporary module to extract sections from ELF images.
+///
+/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
+/// to specific and related bits of data. Future firmware versions are scheduled to move away from
+/// that scheme before nova-core becomes stable, which means this module will eventually be
+/// removed.
+mod elf {
+    use kernel::bindings;
+    use kernel::str::CStr;
+    use kernel::transmute::FromBytes;
+
+    /// Newtype to provide a [`FromBytes`] implementation.
+    #[repr(transparent)]
+    struct Elf64Hdr(bindings::elf64_hdr);
+
+    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+    unsafe impl FromBytes for Elf64Hdr {}
+
+    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
+    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
+        let hdr = &elf
+            .get(0..size_of::<bindings::elf64_hdr>())
+            .and_then(Elf64Hdr::from_bytes)?
+            .0;
+
+        // Get all the section headers.
+        let shdr = {
+            let shdr_num = usize::from(hdr.e_shnum);
+            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
+            let shdr_end = shdr_num
+                .checked_mul(size_of::<bindings::elf64_shdr>())
+                .and_then(|v| v.checked_add(shdr_start))?;
+
+            elf.get(shdr_start..shdr_end)
+                .map(|slice| slice.as_ptr())
+                .filter(|ptr| ptr.align_offset(align_of::<bindings::elf64_shdr>()) == 0)
+                // `FromBytes::from_bytes` does not support slices yet, so build it manually.
+                //
+                // SAFETY:
+                // * `get` guarantees that the slice is within the bounds of `elf` and of size
+                //   `elf64_shdr * shdr_num`.
+                // * We checked that `ptr` had the correct alignment for `elf64_shdr`.
+                .map(|ptr| unsafe {
+                    core::slice::from_raw_parts(ptr.cast::<bindings::elf64_shdr>(), shdr_num)
+                })?
+        };
+
+        // Get the strings table.
+        let strhdr = shdr.get(usize::from(hdr.e_shstrndx))?;
+
+        // Find the section which name matches `name` and return it.
+        shdr.iter()
+            .find(|sh| {
+                let Some(name_idx) = strhdr
+                    .sh_offset
+                    .checked_add(u64::from(sh.sh_name))
+                    .and_then(|idx| usize::try_from(idx).ok())
+                else {
+                    return false;
+                };
+
+                // Get the start of the name.
+                elf.get(name_idx..)
+                    // Stop at the first `0`.
+                    .and_then(|nstr| nstr.get(0..=nstr.iter().position(|b| *b == 0)?))
+                    // Convert into CStr. This should never fail because of the line above.
+                    .and_then(|nstr| CStr::from_bytes_with_nul(nstr).ok())
+                    // Convert into str.
+                    .and_then(|c_str| c_str.to_str().ok())
+                    // Check that the name matches.
+                    .map(|str| str == name)
+                    .unwrap_or(false)
+            })
+            // Return the slice containing the section.
+            .and_then(|sh| {
+                let start = usize::try_from(sh.sh_offset).ok()?;
+                let end = usize::try_from(sh.sh_size)
+                    .ok()
+                    .and_then(|sh_size| start.checked_add(sh_size))?;
+
+                elf.get(start..end)
+            })
+    }
+}
+
+/// GSP firmware with 3-level radix page tables for the GSP bootloader.
+///
+/// The bootloader expects firmware to be mapped starting at address 0 in GSP's virtual address
+/// space:
+///
+/// ```text
+/// Level 0:  1 page, 1 entry         -> points to first level 1 page
+/// Level 1:  Multiple pages/entries  -> each entry points to a level 2 page
+/// Level 2:  Multiple pages/entries  -> each entry points to a firmware page
+/// ```
+///
+/// Each page is 4KB, each entry is 8 bytes (64-bit DMA address).
+/// Also known as "Radix3" firmware.
+#[pin_data]
+pub(crate) struct GspFirmware {
+    /// The GSP firmware inside a [`VVec`], device-mapped via a SG table.
+    #[pin]
+    fw: SGTable<Owned<VVec<u8>>>,
+    /// Level 2 page table whose entries contain DMA addresses of firmware pages.
+    #[pin]
+    level2: SGTable<Owned<VVec<u8>>>,
+    /// Level 1 page table whose entries contain DMA addresses of level 2 pages.
+    #[pin]
+    level1: SGTable<Owned<VVec<u8>>>,
+    /// Level 0 page table (single 4KB page) with one entry: DMA address of first level 1 page.
+    level0: DmaObject,
+    /// Size in bytes of the firmware contained in [`Self::fw`].
+    pub size: usize,
+    /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
+    signatures: DmaObject,
+}
+
+impl GspFirmware {
+    /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
+    /// tables expected by the GSP bootloader to load it.
+    pub(crate) fn new<'a, 'b>(
+        dev: &'a device::Device<device::Bound>,
+        chipset: Chipset,
+        ver: &'b str,
+    ) -> Result<impl PinInit<Self, Error> + 'a> {
+        let fw = super::request_nv_firmware(dev, chipset, "gsp", ver)?;
+
+        let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
+
+        let sigs_section = match chipset.arch() {
+            Architecture::Ampere => ".fwsignature_ga10x",
+            _ => return Err(ENOTSUPP),
+        };
+        let signatures = elf::elf64_section(fw.data(), sigs_section)
+            .ok_or(EINVAL)
+            .and_then(|data| DmaObject::from_data(dev, data))?;
+
+        let size = fw_section.len();
+
+        // Move the firmware into a vmalloc'd vector and map it into the device address
+        // space.
+        let fw_vvec = VVec::with_capacity(fw_section.len(), GFP_KERNEL)
+            .and_then(|mut v| {
+                v.extend_from_slice(fw_section, GFP_KERNEL)?;
+                Ok(v)
+            })
+            .map_err(|_| ENOMEM)?;
+
+        Ok(try_pin_init!(&this in Self {
+            fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
+            level2 <- {
+                // Allocate the level 2 page table, map the firmware onto it, and map it into the
+                // device address space.
+                // SAFETY: `this` is a valid pointer, and `fw` has been initialized.
+                let fw_sg_table = unsafe { &(*this.as_ptr()).fw };
+                VVec::<u8>::with_capacity(
+                    fw_sg_table.iter().count() * core::mem::size_of::<u64>(),
+                    GFP_KERNEL,
+                )
+                .map_err(|_| ENOMEM)
+                .and_then(|level2| map_into_lvl(fw_sg_table, level2))
+                .map(|level2| SGTable::new(dev, level2, DataDirection::ToDevice, GFP_KERNEL))?
+            },
+            level1 <- {
+                // Allocate the level 1 page table, map the level 2 page table onto it, and map it
+                // into the device address space.
+                // SAFETY: `this` is a valid pointer, and `level2` has been initialized.
+                let level2_sg_table = unsafe { &(*this.as_ptr()).level2 };
+                VVec::<u8>::with_capacity(
+                    level2_sg_table.iter().count() * core::mem::size_of::<u64>(),
+                    GFP_KERNEL,
+                )
+                .map_err(|_| ENOMEM)
+                .and_then(|level1| map_into_lvl(level2_sg_table, level1))
+                .map(|level1| SGTable::new(dev, level1, DataDirection::ToDevice, GFP_KERNEL))?
+            },
+            level0: {
+                // Allocate the level 0 page table as a device-visible DMA object, and map the
+                // level 1 page table onto it.
+                // SAFETY: `this` is a valid pointer, and `level1` has been initialized.
+                let level1_sg_table = unsafe { &(*this.as_ptr()).level1 };
+                let mut level0 = DmaObject::new(dev, GSP_PAGE_SIZE)?;
+                // SAFETY: we are the only owner of this newly-created object, making races
+                // impossible.
+                let level0_slice = unsafe { level0.as_slice_mut(0, GSP_PAGE_SIZE) }?;
+                level0_slice[0..core::mem::size_of::<u64>()].copy_from_slice(
+                    #[allow(clippy::useless_conversion)]
+                    &(u64::from(level1_sg_table.iter().next().unwrap().dma_address()))
+                        .to_le_bytes(),
+                );
+
+                level0
+            },
+            size,
+            signatures,
+        }))
+    }
+
+    #[expect(unused)]
+    /// Returns the DMA handle of the radix3 level 0 page table.
+    pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
+        self.level0.dma_handle()
+    }
+}
+
+/// Build a page table from a scatter-gather list.
+///
+/// Takes each DMA-mapped region from `sg_table` and writes page table entries
+/// for all 4KB pages within that region. For example, a 16KB SG entry becomes
+/// 4 consecutive page table entries.
+fn map_into_lvl(sg_table: &SGTable<Owned<VVec<u8>>>, mut dst: VVec<u8>) -> Result<VVec<u8>> {
+    for sg_entry in sg_table.iter() {
+        // Number of pages we need to map.
+        let num_pages = (sg_entry.dma_len() as usize).div_ceil(GSP_PAGE_SIZE);
+
+        for i in 0..num_pages {
+            let entry = sg_entry.dma_address() + (i as u64 * GSP_PAGE_SIZE as u64);
+            dst.extend_from_slice(&entry.to_le_bytes(), GFP_KERNEL)?;
+        }
+    }
+
+    Ok(dst)
+}
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 2f5ae89ab80b237eba5d55351229be78cd471a72..547e5dd31aeb9650b226c267de5f0412173b3fe0 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -8,6 +8,7 @@
 use crate::fb::SysmemFlush;
 use crate::firmware::booter::{BooterFirmware, BooterKind};
 use crate::firmware::fwsec::{FwsecCommand, FwsecFirmware};
+use crate::firmware::gsp::GspFirmware;
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::regs;
@@ -289,6 +290,11 @@ pub(crate) fn start_gsp(&self, pdev: &pci::Device<device::Bound>) -> Result<()>
 
         let bios = Vbios::new(dev, bar)?;
 
+        let _gsp_fw = KBox::pin_init(
+            GspFirmware::new(dev, self.spec.chipset, FIRMWARE_VERSION)?,
+            GFP_KERNEL,
+        )?;
+
         let fb_layout = FbLayout::new(self.spec.chipset, bar)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
new file mode 100644
index 0000000000000000000000000000000000000000..a0e7ec5f6c9c959d57540b3ebf4b782f2e002b08
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -0,0 +1,4 @@
+// SPDX-License-Identifier: GPL-2.0
+
+pub(crate) const GSP_PAGE_SHIFT: usize = 12;
+pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index cb2bbb30cba142265b354c9acf70349a6e40759e..fffcaee2249fe6cd7f55a7291c1e44be42e791d9 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -9,6 +9,7 @@
 mod firmware;
 mod gfw;
 mod gpu;
+mod gsp;
 mod regs;
 mod util;
 mod vbios;

-- 
2.51.0

