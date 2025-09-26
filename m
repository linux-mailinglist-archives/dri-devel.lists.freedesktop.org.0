Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6812BA2BDA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 09:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E0310E9F9;
	Fri, 26 Sep 2025 07:28:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bjkECtuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011023.outbound.protection.outlook.com [52.101.52.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 279B410E9E3;
 Fri, 26 Sep 2025 07:27:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Myv8Q/jV6TWD+UVyFmW3v3h39UvHNp7AJLqDgDaO75tq2iIkztAnPYARxE1R9tY1i39pD0oWpJEtFip+hb0pE581Bmpuw1mKpiTCfEMCETqnHv+PyLu8xs+yMNYF/hOlYptmiz5rjgy7Q1EUlZGA+2log/nxXTE8KcZ5W0dvtPMicqAQ782IjGA7DkJNBgdlXJzuaZiA0vhgxQJEXO7neKmXOLIuQL6YuZeB3S9HBMqZapTfErZ1pHDN2T6HEKYcaAvq1pXBMYF8pY8Agi8IJiFYd00l5draXKoDzOm4eJ4pij3nZBMbkbmIHh4J693BveHruGUyk2Z9cuf9K0AVFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hdmmqo8oIyf9zXoifUCZtJMVlRm9Vvnekmaurv6kF8I=;
 b=tyaGrZZ08ugGFYoVLXtfL4Y41sSkYv7LwPiHJXAm90CkbKU7gmEFYHWOJxftkMULBAOK/7Jm8+VLi6keCTiuVfOGEafni0w4zDqAO2h6zHCa91ZZz+DWqQ6FOreTaB7pE9Yt5UN5VU4ZhbSWCLPh5xC5tPLzcF4xK1gt4z2Js3abEyhZc4mvNKqzPBhwB7uX+STfzyx5sRnyrhlphnojO2UwiL5+rdJ0iSFA5qjxPqOG3wTq3qNknQYoBxbam4I5THJCKv6K/BZMCbqL22yjSMOy3+PPIKRfKsHJuaVmgcI5bigueKo6MVXtfhFpO/B419Yc29mNiY+1RTXFaSicoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hdmmqo8oIyf9zXoifUCZtJMVlRm9Vvnekmaurv6kF8I=;
 b=bjkECtuHUuPv4Oslt3FjFHUVIam7s0OrUNxaWC94wa/z+WNqb2en0NbEUkQVOFfo384Rtyzj8a2MFByCsTM+7HuoKk475wdNUD/3LirmbwX9yMWMplYTnLiK8m5xOn5leshoPqGdv0kIUwAeNqVF6KmrKGEKa4/ZW59QxfxR+bW5Wbs4cqL4UMzFhaZpxoJCYqZOGtJGzI3djzIpaki7IoYs6KaKWCYcVPuYfEP45T1je/C6m3juI9CMKKYPYI/iZ3TsYjNVELyt/3Sjc50+OPetjvMuHtpmYf940og0oOd4+d+6TY0cbziJJQEIx2nVk3Pqxh/CIf1vtL2+iBEq/Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7604.namprd12.prod.outlook.com (2603:10b6:208:438::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Fri, 26 Sep
 2025 07:27:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9137.018; Fri, 26 Sep 2025
 07:27:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Sep 2025 16:27:04 +0900
Message-Id: <DD2JYDPBOKA8.2QCK0P7CR1T3V@nvidia.com>
Subject: Re: [PATCH v2 06/10] gpu: nova-core: gsp: Create rmargs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
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
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250922113026.3083103-1-apopple@nvidia.com>
 <20250922113026.3083103-7-apopple@nvidia.com>
In-Reply-To: <20250922113026.3083103-7-apopple@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: dfdc7d99-0b6d-4297-5edd-08ddfcce1985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHdDUkxPZ1ZXblErcHVCbWhnRm9ocXdxc3dUdjdmWktVWnI3RmMxM2huVGdE?=
 =?utf-8?B?Uzg5ZkdXRjBjeXh2a2xDNnRWTURUV1M4b2RWdjVsUFQyOWRXVytWQVZ0Mml0?=
 =?utf-8?B?ZkdwaXZSRUF0RVdlbGFqWUJBTHlrTzNWS0RyR3JYVXZMQlQ0dWRpb250THRV?=
 =?utf-8?B?by9MV0wrUE1ENzZMLytDcTZaZTljZFhFaUE1MEZxK01iWGhqa1ZaZDRPSXNy?=
 =?utf-8?B?cFBnVjZsLzQ3ejJuUThkNE12M2hLTzg3QU5YbW9jaFpzTnRMN2hUWE5IZmdw?=
 =?utf-8?B?SmtrbHFHWHEwV1VIQmp2ODNwME5zeGRtdjIzZTFsZTlKRDVxd0Y1MUhhOWlv?=
 =?utf-8?B?SzR2WjFyMFR1bGdOV3BFWDBRTXp2NWsvMURja2ZKN0FVTmNINnJhRmhBT1Zy?=
 =?utf-8?B?UWJ5Y25sUkxmYVV3R2pmNTJTbGRYTTFOd0hUa0hneFJSeFE0SnJGRDl3Tkhs?=
 =?utf-8?B?MS9QeU9iRVRVVW9Ea3lldDhYQUFLT01NaW5CRVlobDF6QmRtNG5ZaFhLZHBH?=
 =?utf-8?B?YytBcTNaUnRVNFJVbzN3YUc1VDI3anRpa21VWlExeXhqMTJvbFpMRWVySVRx?=
 =?utf-8?B?eWhvTHdZZHNVTWdEdkpMYVBPODFOVHp6RkxUNHV6RmppUzZLNXJQU0p6bGdm?=
 =?utf-8?B?TTk0UHZwYjRpQkRwcWM1REJ2dWtqQVZFL0Nkc1FMcVJVM0NQZDIveWF4RlU2?=
 =?utf-8?B?NGU4TGsvTXVpSmVmaUtFWCt4YzY2NkEyeDg5NXk4eVhHSkZ1Qjdxa25ZNytr?=
 =?utf-8?B?cmRXWmgzU2F4Q0FJSFFoOXdZZjhSL2lLSk80blNrUW9vRFhnRVI2R2MwdXAw?=
 =?utf-8?B?UlREeGhBMHZvM2JFU0UzS1E0N0xnWjRGOGdMMTZndlFaM2ZFak9RZ1FHcDBI?=
 =?utf-8?B?b3AwUUlnbWdqZzVQVEJpRHU1V05iQ0tqL1BGbFlvaWVuT1cyL1pBNUU1OHpU?=
 =?utf-8?B?M1FjVjJLc1p0c2xkeTVjaXZQMkdtUldDNUtjSE93SDNnY0Q5R1ZubWFCeWc2?=
 =?utf-8?B?aVNid1IzRWU1M2F0S2dTLzBmUDdGaG5yQ2NZbzNQVGdZbS9HYStlNmxjWUw4?=
 =?utf-8?B?d05LaHpYSUpJaWJnbHl1a3VDZTRiNTcvUFZuYWx2QUxldWhRekM5S1d1bDNk?=
 =?utf-8?B?RHM5V1NtZlZScnRmZHUrS21mTHp0eFI1MXA3czJnUDFENTFIZHRCV25CZGov?=
 =?utf-8?B?alFCdUVuVVpNNW5PVHlXN3NTZ0RqcFUxNy9CWUdCZ2FXSGpWRi8ra1kvR09X?=
 =?utf-8?B?K1MvL09lSDhjV0EyZ1N4elZkdUxVVUxFVFRjdENMMnFmbjQvUXdCMUY0S2Vj?=
 =?utf-8?B?QWRJb1VJTU40azNTR3JRL3NLQ09VcTFEamFYZlhZRWhNM3FtY3Z5NFRLNVdR?=
 =?utf-8?B?L3BNalZhVmdNZ2lMVkUwUzMwM2ZRSjN6RFFkUFcvUnZNWkZuc2VkcS9obHZT?=
 =?utf-8?B?Ym11bGpoSTJISGxEWFVwRkdFVGRhQzBYNE4wcFpuTk5TTDVhSkF0cUZMOCs2?=
 =?utf-8?B?Q3B5Tmw4MVRhMjJQbFhlalhqeC9xeEVudVVqZFN6YUVNMEw0KzFpS2NpVzgx?=
 =?utf-8?B?Z3g4WGNBNDRlRGllWGVneEY4T2lURTJLMktLT3l1bW53aTJFaGEyMXd6dmg0?=
 =?utf-8?B?TDhSNXplRkRkL2NvZnRreE15TG85RHkvNkc3NDZNcnkyOEU0VkRvQ2FsU3JJ?=
 =?utf-8?B?aXYzMUNpTHdKN2pRd1hUWFBQVnFFV0tQUVp3ZWkvRTlLeVhuRVVJWEo1NGk2?=
 =?utf-8?B?bmwwS1JmNENVV0E5SG91NzRzYTJLZ29MN3RnQlI5NFdUS0s1Vk1kd0g4TFV6?=
 =?utf-8?B?WnpkQnF0dTRmRUc0L2ZueUxEV1h6ejljdzd5d21ybXhUTXZCSE1SdDcwMjdm?=
 =?utf-8?B?bjQ0OGwyNXI1SlA0dTIvbWc4azMwV2pUUktUdFRjcGxnUWk2MEFzOHdBOGxk?=
 =?utf-8?Q?DiJbSot58cc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MllDM0c3bU5KYktHVW90dmRrWGxOTzdNMmJtY3dOZnNCaUNRdGpuMi83aTBC?=
 =?utf-8?B?R3RJVVBRSDRDUTdETHlXUkpUQWZ4aHhIenp1Skl0aUtOeUlwZmJ6bG5Pei9i?=
 =?utf-8?B?Zk1zMkhQOHBLQjVxNC9MU2dtNzBUcEpwVUpRd2xGY3Ftei80cmNHNWJSMTl1?=
 =?utf-8?B?bHpSU3JVandNZXFKT3V5cnBQeEFoUXhWblE2WUwrL0E1T05wWU5zUkFWTVNX?=
 =?utf-8?B?YWpaV054dDNETUpseEU0VVNYbzVlS2s3eWVOTWpJM2t3Q3RJSWVrODl0Y1Nj?=
 =?utf-8?B?U3JTakZTNFdBdkNPZ05uS2ZsTUJHWU1odVZnd0tNaVpxU0RrM0pRYnBTR0xW?=
 =?utf-8?B?NGlOTlhyaEJLRjdXa2NVKzZXZDk5cDR6UlVCVFhGY2pxQ2FGeENyV3BaOHJh?=
 =?utf-8?B?M3VibnM4K1RTVlNHd0M3NDFtOWxITGNEN2cxOTBlRE50Mnc1ekZCY2RZSkJR?=
 =?utf-8?B?alI1bVRLMWY3L09kVWlQSTErYUtsUG1DNGZjbUk2ZHZMTklDZlpSQjQzS2pD?=
 =?utf-8?B?cTRJYks2NW1RazhGQ1hpK05wUUltWFRMbkF0aUpPYkV1RFJxT2VJTTJiOTdI?=
 =?utf-8?B?SkluWXFzbWduRGRkMFc3SW5nZERkSlRqeXNMMExBVmExL1c5NTEvS0RRZGtX?=
 =?utf-8?B?aXJzdFlIZ3NkSXBFR013bW1veEoySGpiZHZZS28xdmEzQnhmZVVVdHAwWi9L?=
 =?utf-8?B?bkd5dXVnbkpiSmFnUzdic0Z0WGtrL1hHWU42cTd0S1BjRmJQYlMvdk9GUVZY?=
 =?utf-8?B?b2ZaeDUzcFdIRG9JS3VoV0FoY2NieU1LTGtNeFdPS2hJV0kxMFYvRS9lVGs3?=
 =?utf-8?B?ZnhMbVhXanhCMVRpYU9KVURiZmFQVU52LzZDUC9iV3FNZlZXYjRnTEdub2pq?=
 =?utf-8?B?aFdtWHpOSk92UU8rSHgxRkJSaHNnZGU0MCtkbmtVWWdmZXlWT2xOUUlmbDVU?=
 =?utf-8?B?WGdSeGZZY1FBTmEvN1dSa2hwdEpTdE16NUlmdmtna0VJYWNkSitRM1lIVHpu?=
 =?utf-8?B?ZTBvSXhZWjRWVkQ5VkhQbjg2RFA5OHpUbzZ5RGtVQ3lHN1d0V1BoSWJxcTJw?=
 =?utf-8?B?OHRZK2Y0Zjl6b3F2eFNpT2VrR1N1Vk1QakFydHpJcUZUaXhzRkhuMjRZNjQ0?=
 =?utf-8?B?U2x3cHpVSWxMNXpqb29xS2lwdzFCeElQdWhqUUFHZkswb01zeWdFRWV4TWc5?=
 =?utf-8?B?dnUzL2lwV2orNFMxL1c2bCtYYzMxWHZTdlFxUVlRWmdMaDNhOEVNSm0weERN?=
 =?utf-8?B?YldTbENNOWo3VlVSYU40cUVQeTNOR2Nia1MrTjRydm5tdStMTENKQ3Uva1NP?=
 =?utf-8?B?ZG52eHowVzVXaVcwMFRvVFh1YldyMERaeGxzNTBTZ2Z4dVlhUVJBSWhGSnRY?=
 =?utf-8?B?dTlrQkNvanppMlQvem9VdEoySytqbnNVYUVlZ2lxVnQ5SmVwVFBQSHFiaC9B?=
 =?utf-8?B?RlVpSjFjTnJ6OSt6dkZYKzQzblphdHE4ajFMQlJGWlJiUXpKQkZIZG16V2lP?=
 =?utf-8?B?elRTV3J5OWlhOGRKbFB1N2VwelRtMGw0RWVIMmk4UElpZUR0MzB3T0VaOXQ5?=
 =?utf-8?B?TjcwR2ozNGU3ZEM4U0FGcVI4UVVhSVFmMUNHQTRYNC9vN3pDZ1lzbDV4Mm0r?=
 =?utf-8?B?NS9LR2hmcENUQmY4bDEyUytWditzK2dYOW45US9VRFMzalJocU9GOXluZ3RT?=
 =?utf-8?B?MGQ1TVdYTGlMK3gvY2dWNDk4cjRsNGVUeGFDT1ViMmRQMDRoRmpBMGFkNDdQ?=
 =?utf-8?B?M0FtdVpmamNrRFVWazZCUlFDRXAyd1lUYjJGY3BWbjFITFRxVG9TZHA1VUdh?=
 =?utf-8?B?RVlYakg1aisxUWtCS3lWV2M2Z0h2OGpqUVpKV1dKU29xaFNLc000aVlHV3FI?=
 =?utf-8?B?Q1A4YWMwbUQ0TmZTY3dDTGtmOHFLd1A2K3REYWFRa1N1aHdmaHdnNE5UT0NY?=
 =?utf-8?B?RHFuNlVxSStMY0VpbXZvQUFGbDA4SlBBdlI1ZHdiekNnT2VpZDV6K0hrUkM5?=
 =?utf-8?B?Vk9HNmtuUWNpdlp0UkNQRlpCL2pNMWZxMVVoeUFHT1NCa3RJV012MmR2akov?=
 =?utf-8?B?SjVuOE5KWjhuYldnZTQ0dFNiT0szR0FuMWVpOVp2MlVEaUJNY3lTcTBwTHJx?=
 =?utf-8?B?UFN3WVdlZGVQVE1pZ0psNlhmRGU0bHNaeTVrUVZRRVY4ejEwb2dnQi91dG1J?=
 =?utf-8?Q?L35D8QwTc2obOxMxcdGFSw0rnk0GWGWoP9QUOer9f6pe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfdc7d99-0b6d-4297-5edd-08ddfcce1985
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 07:27:08.3739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2jRyyZfxeFjD/XvBaOW9TvVV2IfhSwT0vXpDs4Qjkz4XyM7PAqyWi70O1ZUJIaNfVvh9SeHi4mIXIuBwU+zQGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7604
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

On Mon Sep 22, 2025 at 8:30 PM JST, Alistair Popple wrote:
> Initialise the GSP resource manager arguments (rmargs) which provide
> initialisation parameters to the GSP firmware during boot. The rmargs
> structure contains arguments to configure the GSP message/command queue
> location.
>
> These are mapped for coherent DMA and added to the libos data structure
> for access when booting GSP.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
>
> ---
>
> Changes for v2:
>  - Rebased on Alex's latest series
> ---
>  drivers/gpu/nova-core/gsp.rs                  | 29 +++++++++++++++-
>  drivers/gpu/nova-core/gsp/cmdq.rs             | 14 ++++++--
>  drivers/gpu/nova-core/gsp/fw.rs               | 19 +++++++++++
>  .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 33 +++++++++++++++++++
>  4 files changed, 91 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 3d4028d67d2e..bb08bd537ec4 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -17,7 +17,10 @@
>  use crate::fb::FbLayout;
>  use crate::gsp::cmdq::GspCmdq;
> =20
> -use fw::LibosMemoryRegionInitArgument;
> +use fw::{
> +    LibosMemoryRegionInitArgument, GSP_ARGUMENTS_CACHED, GSP_SR_INIT_ARG=
UMENTS,
> +    MESSAGE_QUEUE_INIT_ARGUMENTS,
> +};
> =20
>  pub(crate) mod cmdq;
> =20
> @@ -33,6 +36,7 @@ pub(crate) struct Gsp {
>      pub logintr: CoherentAllocation<u8>,
>      pub logrm: CoherentAllocation<u8>,
>      pub cmdq: GspCmdq,
> +    rmargs: CoherentAllocation<GSP_ARGUMENTS_CACHED>,
>  }
> =20
>  /// Creates a self-mapping page table for `obj` at its beginning.
> @@ -90,12 +94,35 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) =
-> Result<impl PinInit<Self
> =20
>          // Creates its own PTE array
>          let cmdq =3D GspCmdq::new(dev)?;
> +        let rmargs =3D
> +            create_coherent_dma_object::<GSP_ARGUMENTS_CACHED>(dev, "RMA=
RGS", 1, &mut libos, 3)?;
> +        let (shared_mem_phys_addr, cmd_queue_offset, stat_queue_offset) =
=3D cmdq.get_cmdq_offsets();
> +
> +        dma_write!(
> +            rmargs[0].messageQueueInitArguments =3D MESSAGE_QUEUE_INIT_A=
RGUMENTS {
> +                sharedMemPhysAddr: shared_mem_phys_addr,
> +                pageTableEntryCount: cmdq.nr_ptes,
> +                cmdQueueOffset: cmd_queue_offset,
> +                statQueueOffset: stat_queue_offset,
> +                ..Default::default()
> +            }
> +        )?;
> +        dma_write!(
> +            rmargs[0].srInitArguments =3D GSP_SR_INIT_ARGUMENTS {
> +                oldLevel: 0,
> +                flags: 0,
> +                bInPMTransition: 0,
> +                ..Default::default()
> +            }
> +        )?;
> +        dma_write!(rmargs[0].bDmemStack =3D 1)?;

Wrapping our bindings is going to help clean up this code as well.

First, types named in CAPITALS_SNAKE_CASE are not idiomatic Rust and
look like constants. And it's not even like the bindings types are
consistently named that way, since we also have e.g. `GspFwWprMeta` - so
let's give them a proper public name and bring some consistency at the
same time.

This will make all the fields from `GSP_ARGUMENTS_CACHED` invisible to
this module as they should be, so the wrapping `GspArgumentsCached` type
should then have a constructor that receives a referene to the command
queue and takes the information is needs from it, similarly to
`GspFwWprMeta`. This will reduce the 3 `dma_write!` into a single one.

Then we should remove `get_cmdq_offsets`, which is super confusing. I am
also not fond of `cmdq.nr_ptes`. More on them below.

> =20
>          Ok(try_pin_init!(Self {
>              libos,
>              loginit,
>              logintr,
>              logrm,
> +            rmargs,
>              cmdq,
>          }))
>      }
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index a9ba1a4c73d8..9170ccf4a064 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -99,7 +99,6 @@ fn new(dev: &device::Device<device::Bound>) -> Result<S=
elf> {
>          Ok(Self(gsp_mem))
>      }
> =20
> -    #[expect(unused)]
>      fn dma_handle(&self) -> DmaAddress {
>          self.0.dma_handle()
>      }
> @@ -218,7 +217,7 @@ pub(crate) struct GspCmdq {
>      dev: ARef<device::Device>,
>      seq: u32,
>      gsp_mem: DmaGspMem,
> -    pub _nr_ptes: u32,
> +    pub nr_ptes: u32,
>  }
> =20
>  impl GspCmdq {
> @@ -231,7 +230,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound>=
) -> Result<GspCmdq> {
>              dev: dev.into(),
>              seq: 0,
>              gsp_mem,
> -            _nr_ptes: nr_ptes as u32,
> +            nr_ptes: nr_ptes as u32,
>          })
>      }
> =20
> @@ -382,6 +381,15 @@ pub(crate) fn receive_msg_from_gsp<M: GspMessageFrom=
Gsp, R>(
>              .advance_cpu_read_ptr(msg_header.rpc.length.div_ceil(GSP_PAG=
E_SIZE as u32));
>          result
>      }
> +
> +    pub(crate) fn get_cmdq_offsets(&self) -> (u64, u64, u64) {
> +        (
> +            self.gsp_mem.dma_handle(),
> +            core::mem::offset_of!(Msgq, msgq) as u64,
> +            (core::mem::offset_of!(GspMem, gspq) - core::mem::offset_of!=
(GspMem, cpuq)
> +                + core::mem::offset_of!(Msgq, msgq)) as u64,
> +        )
> +    }

So this thing returns 3 u64s, one of which is actually a DMA handle,
while the two others are technically constants. The only thing that
needs to be inferred at runtime is the DMA handle - all the rest is
static.

So we can make the two last returned values associated constants of
`GspCmdq`:

  impl GspCmdq {
      /// Offset of the data after the PTEs.
      const POST_PTE_OFFSET: usize =3D core::mem::offset_of!(GspMem, cpuq);

      /// Offset of command queue ring buffer.
      pub(crate) const CMDQ_OFFSET: usize =3D core::mem::offset_of!(GspMem,=
 cpuq)
          + core::mem::offset_of!(Msgq, msgq)
          - Self::POST_PTE_OFFSET;

      /// Offset of message queue ring buffer.
      pub(crate) const STATQ_OFFSET: usize =3D core::mem::offset_of!(GspMem=
, gspq)
          + core::mem::offset_of!(Msgq, msgq)
          - Self::POST_PTE_OFFSET;

`GspArgumentsCached::new` can then import `GspCmdq` and use these to
initialize its corresponding members.

Remains `nr_ptes`. It was introduced in the previous patch as follows:

    let nr_ptes =3D size_of::<GspMem>() >> GSP_PAGE_SHIFT;

Which turns out to also be a constant! So let's add it next to the others:

impl GspCmdq {
    ...
    /// Number of page table entries for the GSP shared region.
    pub(crate) const NUM_PTES: usize =3D size_of::<GspMem>() >> GSP_PAGE_SH=
IFT;

And you can remove `GspCmdq::nr_ptes` altogether.

With this, `GspArgumentsCached::new` can take a reference to the
`GspCmdq` to initialize from, grab its DMA handle, and initialize
everything else using the constants we defined above. We remove a bunch
of inconsistently-named imports from `gsp.rs`, and replace
firmware-dependent incantations to initialize our GSP arguments with a
single constructor call that tells exactly what it does in a single
line.
