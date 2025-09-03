Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB90B415E0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 09:10:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C5B10E1F7;
	Wed,  3 Sep 2025 07:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DoIdLn6u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2051.outbound.protection.outlook.com [40.107.212.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA8810E1F6;
 Wed,  3 Sep 2025 07:10:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APpwaQ3bIdQM8YVvpJ2oWdX78Cg66Kzr4mC4C13atnRT1Sg7u6WcakBIGyvn5vtSZimuR+znVGlmvUQCYuimTLTo40w7QYS81IrFJPK2R9TuZYsSs1wRuu7+dKsQb1hrLk8iXzROYzibCFJM3lQZ3LJMXLmXNeFx9HzWeiP80kePrVYKilbEil8PxCKCjXEvIWgCGPk5aGDZiAeCrBpZdpFRaIGreEgD/yes5AuaE4b9Azy4G4jtqsq5Dbx8kIXP39gefhjjogjVErTCENbSUjMIlqRMaimuMvgKh2l709FwU0Xu28FRafvMVU3NA7l1OgEwFA+onqsBv6zz6Z3+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=St4CBxegb5jcEIpnwics6dUYobXarIReFA5SAAyvHjA=;
 b=ApfQEMO0voxFWMLocOey70FT3/RF3OCKMZiIS+HO9b/2SM8WWYCjsy7twKVhYY9P+079qswB9LJD/UhhfK8bFI0B8jMwgvemPI3/cfk6P+EXf83XbinhKpsH4cr80AZDC8QbE4WC7iQnjD1Rzour3A6t+llbnX2cKl1BHccHwKaicsTGugJK8dEKAlAV6V4nrh9D1cqZtSIOoyVcwHXU2WY8ixdSGGO1geyklKCX1xFA4u1LIQjz2D9kIzDliVN/Mr0WoBP/dL1ql0v/Sl/kshkx75+mw6h3eFOCfoAJPajjesTUiBDjZhhs757hm3LRlJ8vkgJ2kj2CqFhBXepdmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=St4CBxegb5jcEIpnwics6dUYobXarIReFA5SAAyvHjA=;
 b=DoIdLn6uVtX1WkGwbiYoo0VRVC7GxBAaTECyz3qK94EfTmWVjVpRxpeGzjnRTvYxOH0hf2GWqbM7rS1R8VYYi+6pHmDWp7OYvECZxpwAkpP1M1sTTXv+5RGVSNkGavXfAQBFU0MlqL11lYMtAqAEX9ILK4S2wm5lW/ub4QrAsgjADQhYzhI4EF1dtu7qNS8rKoWWIoQTVxafldGs7a6c+B8nP22zVDhX2R1y+70MtYSGS8idH3pbIb3UFOZ04RVqXyp9vqWBmqeLcb72eiYU9bS7dseSoerocKQFkzBd2qG5qiPP9bAhxjd4i49T5LJhjXE5atFaUjPEeiT/PIHUPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8720.namprd12.prod.outlook.com (2603:10b6:a03:539::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 07:10:41 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Wed, 3 Sep 2025
 07:10:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 03 Sep 2025 16:10:38 +0900
Message-Id: <DCIZ79KKSSF1.25NJT5ZWR3OOS@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 02/11] gpu: nova-core: move GSP boot code out of
 `Gpu` constructor
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
 <20250902-nova_firmware-v3-2-56854d9c5398@nvidia.com>
 <843554b1-f4c5-43f5-a23b-583339708bea@kernel.org>
In-Reply-To: <843554b1-f4c5-43f5-a23b-583339708bea@kernel.org>
X-ClientProxiedBy: TYCP286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8720:EE_
X-MS-Office365-Filtering-Correlation-Id: fa32546b-292e-40cd-6ddc-08ddeab8fe1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NERpNnZvZUNtVDVQZVNlMGRBSGhLMG5ya0htUzZKYU5iQ2tDaFZNRjk0S2ZB?=
 =?utf-8?B?eFdRNFlaLzNzYVJ1MzFBZEUrbEkzUXlGbklvOElscndZR216VXN1SW81N3Jj?=
 =?utf-8?B?VkUwb0ZpLzJMSkNFZFBlZHJOUmo0bEw0Ti9YenNJaXJWQmVZcUJhRzRZTzNS?=
 =?utf-8?B?cldMZ1d5UFg3N0IycVNIRFFsTCtTUjBiOXQ2NmQ4OGVlYkp1VUpiU0hjOEFO?=
 =?utf-8?B?S1BwdTBmcUd0L0hjVlRPYUxEWWd5bklTM0toeWd1MUdTNW5zNk94WllkYWFE?=
 =?utf-8?B?SGpmSGdPcUs2MjMrR1lSbXJ1WldNZytqTUhwbWpLNkpoSGQvMXFXV3dUcEVV?=
 =?utf-8?B?Y1hsTk1zTmxmVk9wUWRMaFBndm9mT3A4TEJOQTNjM0I1MFlLOTdCQmhFYjVr?=
 =?utf-8?B?V2ZDUThkdWJyc3lTNXpIcWI4ejh2YVVOQjR2U1VZV3h1VDg2RjlsUnZyUFJU?=
 =?utf-8?B?VFNGcWpYV2NyRW5EOEVXdlkzOUIrUEs2d0tKeC9xMDRDd3ArK0Vua04wNmxM?=
 =?utf-8?B?OEprdHlHaUsxN2ZTVmU5RXpGQ2VsRzBzQ01NRnN1WjJwOGswZWk4WnVaaHd5?=
 =?utf-8?B?d2hrckxJanN1dWdNVmFtVUVQSGdmOFV3NmlEWnBYM1FvU2N4ZnhkRkhpNnRY?=
 =?utf-8?B?RWRFR3ZzOEI2ODNRZ2NmeGxzdDJwYzUrbTY4YUZXNFEyVDZFMEpnSFpDczdT?=
 =?utf-8?B?N2F4TFlNR05DenB2ZFZpV25ES1NndVBYT2J1T2p5N0J4YkE2Y0VRajh0UFlR?=
 =?utf-8?B?TzdmTTdGaEc4ek9UejVOUlU3azVGRGdLRnFHRTUra0Vvam1lNEN5dHg1bWZ2?=
 =?utf-8?B?SFhmeWViNmQ4MElleHdCWkZBSnp0Zkp3WXVtSy9MU2laTG1IQVFQOWhSTm5a?=
 =?utf-8?B?VGFhL1cvZllSdUQ3MEV1aUJQM0lObVowSys0eXRxZFdSQWVlRm9XSVJwMDAz?=
 =?utf-8?B?SHlxM08yNkExbEwxb2JiVHlNY0pndEFIUUEySFJNNVExTUZEK252N0pTZ0Vw?=
 =?utf-8?B?WlRvMUIzQlpsNWw0TDdaTnMrZ1FYckRJU3UyK0UzRWg4WkkraTFYNDVpVUtT?=
 =?utf-8?B?S0FmY1dNYU5iSnc3amZRUmZnU0JDY1VZOEJHTTJUelZNblRHRXZDTFhqTFpK?=
 =?utf-8?B?MHNndXN0WndISVBKTHNjcDQ3cFVrZk9FdnNmenpVeFhXdldNSGVSUzJESmU4?=
 =?utf-8?B?S3ZjVU9vTTBaYUxnWDJUS0hLYVNTTWFNTGJDb1RrelArWUp1Vm5XT3FBd0pZ?=
 =?utf-8?B?RFp5d2I5YzdUcGhLamRTVGFaVEl5VTN5SlBwMlZQRlcyT1VTQlRaWFNFT242?=
 =?utf-8?B?eWJCK2Rva2tNSlZtYjduOVh5bWp6OTdNcnI0SnJqQkEwMnJ5OFFiNm90NG95?=
 =?utf-8?B?bUVBQllLWEIxTVM1YU8rZXBnbW1ta2kyeWE4bG42bE9rMTJqVEk4N21iQS8w?=
 =?utf-8?B?c3QrLzNOUmlWdkZvY1JNUS8vbVlEQkpzQ0hQQ2NVT1BNdWZlS2wxenVJc2Vk?=
 =?utf-8?B?N09sNmVtbzdmdkhIQTB1YzhFbmRMS0RHMzlJVkYydHhFNUgvVEtDYzRUNUdw?=
 =?utf-8?B?b0RoWWtXL0dBNUpYNjhMd01wbG1vVlgzWU5HTGRBU2E5M2FKeXA3TFM0dWFT?=
 =?utf-8?B?eUFLODV6MXhHaWVIcUo5TGlGRjN0QUdEbXlYOXg1NFMvc1dJZUpwVkwvSFBQ?=
 =?utf-8?B?eGVmMG9tWjlkQ0JHWHBleUNTQXdPVFpsWHhZRGZoWWx4TkU5Ykh0MGpqZkRM?=
 =?utf-8?B?cjl2UjM1clRtMGFDRkZnWkN4VkhmSGVocGhlang0ZHlCNzhvZ1ZhZWMzVkky?=
 =?utf-8?B?SzhoSmg4U0w4aDBQaDY5NXkxYnZXZU1qNHpxaGorbHpzdW1oZG1QNnpIOE1G?=
 =?utf-8?B?cDlHMWJGK0xhZmNYakJqeXh2U1h1VnhWSm1lTGlPVEdUMEtyRHE3ZFVBWEE1?=
 =?utf-8?Q?OOpp43C75bQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmJyWG8rN3JKRW9QQzFMaGFZQzJZYzRvTjlMUk5ibWJUR0ZwTzVtM0lBci9O?=
 =?utf-8?B?U0M3aS84RXVYZFBqK01FQWptMkdQRXZralVGeWpxa0ZXcWtJblFzSHNQUitX?=
 =?utf-8?B?dW5sM3gwTkdDRThtTmFMdEF0Y0NoL0oyQU0vd0p0MXBwRitFL3JOSjZXcXFT?=
 =?utf-8?B?a2U0WjQ2WDRPR2tiOUlKOVF4TWJ5SGxHUUtaNkZYWVl5NGF3cllkc0tzelNo?=
 =?utf-8?B?SzVTQWF2TWZPaUYzWXNsVGhPL0RnWExlK1J2azIwTXZhaU9LNzNYTzE2b21i?=
 =?utf-8?B?ZDBRYWdVUlUyL2J6NTZ4SG84bEJ5cEorY0x0M2VzR0E1eDg0b2E0Zlk4RWJw?=
 =?utf-8?B?b1l4YzlrcnA0NzBIclV3Y3J6aHpyMFF4WkNQdDJLNk5zc2s3SE1KTy8xNzZO?=
 =?utf-8?B?bnZwT2pyVnRMUSt1bGxvWTJWRFpuUzR5YUxMZkFqdnBCZzlOYXUwS1RTdTNN?=
 =?utf-8?B?S0VraGplOGFwME1WUVRQclVELzA4QjA3RUFpd0pXbTA2eWZYZCtaVGVzREFH?=
 =?utf-8?B?aG9lRmVmcGFnRlQycEdQTjJvdWx2RmRWSTBDTUJmUnFrd1IrejdWeGcyTFU4?=
 =?utf-8?B?MG1RTEdBWW9XSWZlVE0zOElQVmpLKzdsZjBsSVpOQldDaXdyV2picUVBb1hj?=
 =?utf-8?B?MWVndjRvcHEzSDFUQ3hpb2JBc01nMXpaZGZZaGtmQXphTVhXenhsSnBiWEJL?=
 =?utf-8?B?UEZGSUpSbjRZY1AzVkpWbGlZVFM0T3ZUVU1ReTBaYzZPWTR4VVdiajVzRzhs?=
 =?utf-8?B?aVh3VElzV1pPam94alE5UytyZGVKUHNBTlVKNVJGK2VoZ1VydFRsZS9wZ3lo?=
 =?utf-8?B?L29iTks4RG40Vk1lSDdzUEFIT0RJa3p1SksvTEhoZ2N3ZG9yMTRwUmQ2Vmx0?=
 =?utf-8?B?aThZY002ZkxRU2RGRkxyMDV2d2lPOFo1SFJqNWFoTzJkSnNXVjhOQllIS1hG?=
 =?utf-8?B?WS82TFJXNkR6RlI3T1NKRWZzSFNQMzJxQjdZUjlXdWJMcGVTZCtzMEZwRCs5?=
 =?utf-8?B?ZVZUQXY5U2dxZmRkOHlLMjloUzBkeUk1TThrSmI5S25KK2d6TUhWUldTTFQ0?=
 =?utf-8?B?a2laVVZnbzQ1YXRjV0NMcFdCcmFLc0JVeG1JV0s3TVVXek1iamFtT2pMS0sr?=
 =?utf-8?B?VW5mcHpXR3lLbXZ2UWl1akpWSm1SeTl4YzFqSHVKcVY4akdKRW4wTDYvNjh3?=
 =?utf-8?B?cUNLYkk1c0l2UTFmaTNyWFREVkZlTmtLZlZmbUlQdERBUFFKdDNLU3BLSEVJ?=
 =?utf-8?B?U0w3K281eGpaNWFLZktKbzdDeER3WXBLdGJQWFF6Uk5QZTVheFp5OTRqbTZu?=
 =?utf-8?B?LzFidW1FaTVTbGhSZ0lMdUU0ak14SUpkRGNsTHdReXdpOFU3c3RXUlowN0JQ?=
 =?utf-8?B?RnRLczJZTVlrN3d5WjNFdmJOQnptTFhQUHBvaHM0em9TT0hnWHNFS2ZUL0ds?=
 =?utf-8?B?RDdDc0Frb0x3TERFc0t6NHBXQUNtMmpuNmpqbkxjYUJNemVpWmQxRUZSakQr?=
 =?utf-8?B?Yy9yYTN4eTZxN2hBOW81SXFnZEl5N2VaV29UckJTYm5DaTN2bHJ5VCttS2tI?=
 =?utf-8?B?czAzaTVYUzk0SG9hM2N0a0VFM3pEUEhLUkxoQUpiWUltUVZrUk0zQXZVT0V5?=
 =?utf-8?B?c3o2SkR6eHVvRWIvS2xkdDU2c0c0WXRDUnh5RU5nOEEvcUhtL3l0U3VuQXJU?=
 =?utf-8?B?Z1ZsN3dNL3RPTnJNaEdSSGdLVXRUeGJMRjBPY2RveUx6WkRET1FPcWRudkZ2?=
 =?utf-8?B?VzlyeEhndzRhc1NsTkhkTjlEUWg2aGFNOTZUNlNjMy9wdTVWbm9KS2tOeDdz?=
 =?utf-8?B?WER4c2J2c2lybnBXSUI1VjMyU0tvZHZnR0VrVE9ST0RhLzlIeTFyeE54aWcy?=
 =?utf-8?B?YTlnMk5ESXQrTCtDN0IxL2V3RWYvYk0yL3NIdWZVOG1yNVRuYXY3MnYyTEpt?=
 =?utf-8?B?bnh0S1ZsbUN0YUpxMmFoVWkxRVJzNWxlMElTQkFZTjRNbVpOdW1HRkwramJ6?=
 =?utf-8?B?eFFQMmNXNlZMZnBXekd0dnJvTTVscWFrOTN4dzJiUCtsam9YMUxtT3ZzV216?=
 =?utf-8?B?aGoyeERET2ZncnhYZUl3RFhJaWlDQnlPUmN1TnVIdmZqNUhJUWV1dkpnaHdq?=
 =?utf-8?B?Ykl3OGNpY0xKNU5INWE2L25EQy8yQklWY2hBT0IwanVzbmU3ZTVSVWQ3eHNw?=
 =?utf-8?Q?/oCFwpmtv8hApqOmRVzBwfteuD4Thyj+R+QJbnKeUAGe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa32546b-292e-40cd-6ddc-08ddeab8fe1e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 07:10:41.6449 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujMChAC1neXdzE8SsQPrHK3fUhzsuFpDciX7dL1PE7HRfe2mbfvNxh4Ev73m+Q1WrtAkWi4d2PXG5pbHkEM2jA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8720
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

On Wed Sep 3, 2025 at 8:12 AM JST, Danilo Krummrich wrote:
> On 9/2/25 4:31 PM, Alexandre Courbot wrote:
>>       pub(crate) fn new(
>>           pdev: &pci::Device<device::Bound>,
>>           devres_bar: Arc<Devres<Bar0>>,
>
> The diff is hiding it, but with this patch we should also make sure that =
this=20
> returns impl PinInit<Self, Error> rather than Result<impl PinInit<Self>.
>
> I think this should be possible now.

There is still code that can return errors (falcon creation, etc) - do
you mean that we should move it into the pin initializer and turn it
into a `try_pin_init`?
