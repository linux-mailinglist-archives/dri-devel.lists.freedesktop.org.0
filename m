Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEFCB09F7B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 11:25:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B57F110E92F;
	Fri, 18 Jul 2025 09:25:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HXh12AYv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2085.outbound.protection.outlook.com [40.107.212.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8640C10E92F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 09:25:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FwiuVlPTpWNeIji7XvagyTjyhS4LTBwlWG0hsc0mfkLi7PJsfrDvuqm1ykphhJkKo13b1t7t2CiiisHp3Bu5eK8EpUgotfqdJKwnjr/sXWeWwuMfe33/3I6DcRuGWpc5gu/l40IgrAIzkowHMSRXssknoVB8fImaeGRcuh7oMEUo/SJEz6Lr9fwbNTtVi+JRArE58KoqFm3U/1nPtgdjmPWvTLyCrFYEZkosdo/Pmw/rhbHfcSVYLthp3u+n/1hNUZDhDeiHaz8maPyenPVKzNP+rKhO1EsX8BoooN0oT77z4QGuLySvqxqzeixe1oMD/OAjVo5KqTqua64cV04q0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ooyw41r7pHJvmbmC71uN0WxCGQv6NhSkKcZ9ugQzM0c=;
 b=sRDSTmfZpmuOxqkpcwQOX3RjWpcmqlUUjrDy+E1MZzo1NBOCZIVqefP0u+37PHhr/kZ8Ua01PW88fF4hX52tz/H+Bd90+LTebrPdYkcAisG8L8IDytHcWHXxiG7l4yKgVV/ceiw5mYpC1en7PsXGy7opphyMmVNSE5uEzEAf4CKvY+FZ3IHkb7nVgFpbaXdCz2UpH8ase+bDTz4zj+reDtx/YWzp3bKv83jzvZpBWd7fuO6IEWf5u3UNTfe6VbLhT6jKPYYG7DulosA2VkMFaabNJ2C6uzaPUEt5iTcFjEOannw1ZVfaA2CB8ClwhqZJ4wKa9sIN2yRPWWDQ2CFX6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ooyw41r7pHJvmbmC71uN0WxCGQv6NhSkKcZ9ugQzM0c=;
 b=HXh12AYvlXk3DNjRnH4wfZoLIxXUuICIhKPMaLgOe9t+YUsf3Ul6RW8WC2jk6pj4niFpqfU5G9C6/o8CV8NIDFpqPa1bsFgzfFy4wAw4KH5o0evstfq2I3xBH18VsEa6VS2cpPz32Rw7FLvUFCXxJNrNcfgiaVwfcf9U518a2swMHowdjiz10VCt+JJ/zziYknUgXxRgncqsMFNxzZKp8E/s2xjAubpk/E61mPrKssJnIBLqzglS8qjQJxm0gwEI7S4Tk7z2ufldR2s32xhpDF4kTsTj1SG9t93dicXj4/pdCN1ph5fAsYJLAvF5j5IyQNgOAtO8aKxFy4cVSufeGA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CY5PR12MB6478.namprd12.prod.outlook.com (2603:10b6:930:35::19)
 by DS0PR12MB8071.namprd12.prod.outlook.com (2603:10b6:8:df::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8922.39; Fri, 18 Jul 2025 09:25:48 +0000
Received: from CY5PR12MB6478.namprd12.prod.outlook.com
 ([fe80::35dd:2a5e:d28d:55e7]) by CY5PR12MB6478.namprd12.prod.outlook.com
 ([fe80::35dd:2a5e:d28d:55e7%4]) with mapi id 15.20.8922.028; Fri, 18 Jul 2025
 09:25:48 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Dmitry Osipenko <digetx@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v1 4/5] gpu/drm: tegra: dsi: add support for
 Tegra20/Tegra30
Date: Fri, 18 Jul 2025 18:25:43 +0900
Message-ID: <6623644.ejJDZkT8p0@senjougahara>
In-Reply-To: <CAPVz0n1u3=UcYvbZEfC59kMLD647pJKKiOQ308oQ9qde4vQcyQ@mail.gmail.com>
References: <20250717142139.57621-1-clamor95@gmail.com>
 <10778402.NyiUUSuA9g@senjougahara>
 <CAPVz0n1u3=UcYvbZEfC59kMLD647pJKKiOQ308oQ9qde4vQcyQ@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: SGBP274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::34)
 To CY5PR12MB6478.namprd12.prod.outlook.com
 (2603:10b6:930:35::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR12MB6478:EE_|DS0PR12MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 799a2450-ca39-4c5e-7679-08ddc5dd14bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|7416014|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUZPZ2I3NEZQNFRxMnRXUFRDcHdKckNMdzhNRk54M1hiS0o0K3dLZ2E4ekZX?=
 =?utf-8?B?WGJrQjBkTEt3MTc0bFd0S3E1bmlPRDF1WUVadlc5RFhiaW5KRXhpaURjdy82?=
 =?utf-8?B?NTI1Qzh4UUFzNUJiOHVqQ0x4ZU5peUh4bjZKcEhMWk1rNUxKNWQwMmY4cXhT?=
 =?utf-8?B?QlBNZmlha1BKaUdzYTI3bnRkTUZtL1p5c2Y4bkF3ZklZdXVSckFVQTh4M2Iv?=
 =?utf-8?B?TXhxMnRNSWdtL0xnd2pid1dadk5WMjh1bW1uakFSMWxhdG95eVB1SnVuYmht?=
 =?utf-8?B?TmxLVVFjcEhkMFdvUGVySFErbUNGQ0NXR05pVFhEcTBFQjB5MDBkN0NkNWdQ?=
 =?utf-8?B?TkpnZndPeWREeVczYU9mWTFvNzNWT0JjR1ZvZUFXcmorVUVXZWUyK0FDZkRT?=
 =?utf-8?B?ZU4zQTZXaHZXTndjc1ZaOCt0MzJlWlZ0VjNBRW9pc005akNQTVl3OVdIQXBt?=
 =?utf-8?B?WFl4NVVUdW1DYWlvbjE4Smd0NjFoNmNHSFJ3REkvaTNZT2pBbm92dWlLQ3hs?=
 =?utf-8?B?S2gxT2dJQWl3T2EwUTZicTIyVy9SN0dTWis5NzFlRkxydGRUaXlTUGlsalQw?=
 =?utf-8?B?Q2dtYXdjb1BoMXRMbHM5cTZFQm9mMmpPdlVuVlJpRndiaUtEdStoSm14U281?=
 =?utf-8?B?Sm5RcUFDeHJvalh6SXVhRkxaQXRLamYvS0N4dStRd2ZKeit0b3Zpd0ZqRXk3?=
 =?utf-8?B?YjZnLzYxaUxxV3ZkSmhDU1ZPTnlBOUJxNG1Kd2dUNXN6YThrWUZka0k4WGxH?=
 =?utf-8?B?T1pyemVrVFViYkwvVG1GU2hTajhiWG9YZTVaRGFvaGQ4NHRHb25lTldGeGhh?=
 =?utf-8?B?V3pHQW0zL2YwOUJHYVNURCt5eStlTkpmS0h0VVhMUVhldHdtdWJUYllRZFgr?=
 =?utf-8?B?TzN6MmpEbENRSTY4V3ZyNWNvZVVzeTJJeENnekNXUVdtTzVZakNOSHBkL2tK?=
 =?utf-8?B?WmlVT29xblloMEtxZk92QmUwVTZLNDdpU2d3SVRucTU4RnZ3eWk2RWhUc2tB?=
 =?utf-8?B?OGUrNFN4Q2ozb09ycUxFa2VWQTh4cHBTSzl6djFLSXNFZmhTR3kwT3J0cFVt?=
 =?utf-8?B?bEFUbk5nNTQ1NzdCMDIxTEhxMjJUeWFUNHdTZkcxMHFZSnZIU1BlYStwaUJI?=
 =?utf-8?B?WXZiNXFjeG1MQjdWdXpNeHlyOXV4YmFDU0RhZDdxMW8yZ3FuTklBZ0Y3NFcx?=
 =?utf-8?B?OVhXc1NIKzliMFlNWFU2UEJEYllDSkVlYS9mSkJxNitweXg5N21RZ1pEcW02?=
 =?utf-8?B?bVVEWE1TV1d4TDN1MzlpZC9zdW5QUnlzblZXcjBNWXhkcGxOVk1SN0pCblY4?=
 =?utf-8?B?dXNuYzZqTGNSeDZHbUR6WnZmU3FmMG1FbnM1VVNyZHA4REh1VWxKL2N4N1Fz?=
 =?utf-8?B?ZjVSbFAzbVRTUjBkcDBzOHEwRS8yaUxmV2lmWVQ1RXBKV3N4THFwUW9Gcnlj?=
 =?utf-8?B?U0l0Y1lWazRhT1hOVGZKM2hiYW1LdTFzaDFTd1JnNkN6N2FRYmhwZHU0RmJC?=
 =?utf-8?B?RGV5YmU1QXAzalYybTdtR3RIZVdrbExlMjN5akh3M1JiTk1OMWpPZ0RTd2xw?=
 =?utf-8?B?M2d2RGFpRElUTVRrMzBmdU9aUmxjMGZ6UllEZElpRXd1amJyTVoxdTFPUWdv?=
 =?utf-8?B?U1g2U1ZvUzY4SFhVV1ExRFFvV29qU1FIUk5GL1RIMkVkOGJCdVAzeTBJd1dD?=
 =?utf-8?B?Z0gvYzRtOTgwTGZTOXdoK1ZiU1NIZTBuVmI2L3Y2Rm5rWGpqSzAwYTNrYUN4?=
 =?utf-8?B?RkJyejN0TDNoRDVCaUo0c21KbnVVSi96YjVURUFlYXVOM2llbHRzM2JYajZN?=
 =?utf-8?B?MDZYblVyMk5TR2Q4TFdLcGJCMlR2U0ovWHBKZ2xSQ1NQbnM0NC93Sm5tZ0lC?=
 =?utf-8?B?VWJVVklQMmdWZ2NScHN0ZUlyd3Y4YU94SHFML3IvRTVxVEo0bkI2SDJVYmRS?=
 =?utf-8?Q?9cl3dwfqqFg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6478.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(7416014)(10070799003)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWZOb3dwSmJ5Y25POE5qSm1EVlBHdzBxTUxmYUF1R1dYeDhBWDRVNXFULzVw?=
 =?utf-8?B?TmRLY1JpTHMvV3FwRVBBdzJ4YjFqVFUybTNQc0t5cUIrNHJZQ1ZCL1pIVnha?=
 =?utf-8?B?RWxPUWVXQkFiK2VTSUVnb01RUGJqUkw2Zm1jTXBkZkVHU2FUR25RMFZWMG0w?=
 =?utf-8?B?UTRVQVBiZkNlUmEyY2xpRE95aG5zQjUyUHVydC9YR0xSalFBMDNZcWtkUVdt?=
 =?utf-8?B?SzhvV0QzY0xJVytFNmdERWhyYmdnUTdHR0hhcHVFdWdxcXRIRjBWWStOZG1Z?=
 =?utf-8?B?RUJ1Y3U3ZDk5Yi91K0JrVW84bWVvc3IxNmNYMmRCRWdmcDNHcXZLbHZHZURL?=
 =?utf-8?B?dENvVGdMRk5IbWNIMzgzZEVHYXVlMDhBOVFJQ3ozUGx5dno4VXBGajBGQjRL?=
 =?utf-8?B?cFNxaHNXTkYreTF4QVQwZ0I0RWlBNGtGL2plazJPTEdaNjhybWJ5L0pHWXQv?=
 =?utf-8?B?anduSkJUdmpoV3ovNUJQYVR5V2FlZjRmdjhXbDE0d3djeC82bWF4MEllTTQ4?=
 =?utf-8?B?eFcrdUhVMUNUNkk1V2tkMkpSQkxrWEtHck9mWEFBUGtVdkZFUVQrWVE5ZEVi?=
 =?utf-8?B?VHhKUm9ydTVhcFg1RTVGd2grMmNpY2xIUE1MVnMzTXBXZS9yUEIyU0dOdVhE?=
 =?utf-8?B?SXJ5TGRLZTRZK3VQVWhhTWFNeXVJVmFPZ2IyaDdkNnp2cVR5VGprQU0ya1l4?=
 =?utf-8?B?OS9mYmI0L0xRcTAzOHRYSjAya3NQQUdZMnFDYklHYU1XRWQrVG1UWlJnMGp3?=
 =?utf-8?B?dGZmSmh6YW5SL1pvd1o1RFVVcjZ5K2ZGNGxOSUNQSWFjVnpXcjEwd3Q2dWlm?=
 =?utf-8?B?aEdVTzVtaitYdGd0bTZWWFZ5UHREcEc4bHEvUTdDVWs2MmN1Tno3cll0TlFM?=
 =?utf-8?B?TGtXckg2dEpmYnV3QU02U28zNldMT3NYR3BOSTBaTnVPR2xYVTkwL0NGbXdj?=
 =?utf-8?B?QWxuYzR3aUI2MnJhdktlOTh1TmllMXdvbWNPTndiSkR4SmwxVHp4dm1Wem9W?=
 =?utf-8?B?bFNpK0t4bm5UZVhzTHFSaWFza2FBQ09lNUp0SHEyWERnQlBzVmV4dk9aMExP?=
 =?utf-8?B?RUcwMFpaM2ppbjczNDNSeE1hUmlvcHJMYXNGVzdCcFlqaGhoZmZaek9mbVFh?=
 =?utf-8?B?UzRPOVdNMDJzVnRTdzRJWnM3VCthSFhsLzh1VWRJQnA0blpPZTNkOGdLRVZp?=
 =?utf-8?B?THNDTlVzWWVOQ01ITG9zczZBL0lPbU9SQnBleXZMSWc4REdBYVZuZUtnM2hx?=
 =?utf-8?B?UlUwMVFRR0dnY3RMSkZPZ1htalY3cDV3V3ZPbEhKSnBUdUZhTFpmMkRDbjNt?=
 =?utf-8?B?VE9tQXh4R1FiNTc4WER0bHVwbUNXTVFSa2ZPTDJBaDJqbTVnYjFkTThicFg2?=
 =?utf-8?B?T2xlRWdsd0hjcE8rZVhXUnVoN0k2aFRUcU1lVmNPWTdMcittcDZTckhCUXNV?=
 =?utf-8?B?TnZBRnhrcUp5azRZYVk5ZEJDYTlnMkxHODV3UXpMN2R3Uk40ZGowRTRXNUx0?=
 =?utf-8?B?Ym1XQjIyWGFySm5ZRGZiTzZEejJOVEVoRjkxdDUvcVZHblVSQk1jcW1FZHRB?=
 =?utf-8?B?UUZGcmpnWVZVLy9wN2tFL2lzVDhDUHBhcktLQmdDc09xcm5EWXRCKzFGT0l2?=
 =?utf-8?B?V3gxWTVCS256U2I5UGwyMkY4Q01RUFlTdGpkSmVSZVZ3K3JUd01IMEhHelc5?=
 =?utf-8?B?bzY3MlpmTTJkL3VGK3pyak01bjhTTnJSVFM1cE9hSUQxdVpMeS9JM0dzQUdy?=
 =?utf-8?B?V0VjaVBVaEdvMW04Y2pnTGt0NlIzeVZSSzZWbUdrTUJzaStRM0EvNUxJOVJS?=
 =?utf-8?B?TjE0K3NCUWdWL0xETUhCNlJULzVtNndFRWZLeFJkMmlva3RNa3hHczR1Z3lR?=
 =?utf-8?B?cmxYT0c2WElHNFZPNGUrVklpL2luaGJiSnd6UXhzV2N5S09UcVFaaXNIRXlx?=
 =?utf-8?B?aXpaNVVCNTVidDYrVVA2K1llSlp4Wmp1SmI2L0N2NU80NUplOWc0dkRCUHJ6?=
 =?utf-8?B?Njg1S2tudVYrbDNQcVJHc0ZwR1V1M01WU1IzK0gxTGx1NlZHUWo0ZkdwRy9Y?=
 =?utf-8?B?YllLdTZQanh0VXErR2NucW9JMWY1eHNjVUFadzlaeVV0K2RlVkVZdWx6dXpI?=
 =?utf-8?B?Zi9rY25SV3BwMVFhREFxa3FJRW1SblVpWVlsajZKaTlGQmowdkhCbFpyZk1S?=
 =?utf-8?B?V0hFbm5oK0VFSE04alBBbVZiVVluMDk0NERkWHZuSitYSXhUSUtlSngxbWpI?=
 =?utf-8?B?dFFKZitrRng1a3k3QVQwRUVIM2NRPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 799a2450-ca39-4c5e-7679-08ddc5dd14bc
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6478.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 09:25:48.5814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z06YFRd3NugreKl0o0lNwWql9JIEPLDjtvsNqfklLD/sQH6ZzPMWZs9XmiexzntFScBZAETBCax82mgHvWm9MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8071
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

On Friday, July 18, 2025 6:19=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D0=BF=D1=82, 18 =D0=BB=D0=B8=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 12:15 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > On Thursday, July 17, 2025 11:21=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > Tegra20/Tegra30 are fully compatible with existing tegra DSI driver
> > > apart
> >=20
> > 'apart from'
> >=20
> > > clock configuration and MIPI calibration which are addressed by this
> > > patch.
> > >=20
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >=20
> > >  drivers/gpu/drm/tegra/drm.c |  2 ++
> > >  drivers/gpu/drm/tegra/dsi.c | 69 ++++++++++++++++++++++-------------=
--
> > >  drivers/gpu/drm/tegra/dsi.h | 10 ++++++
> > >  3 files changed, 54 insertions(+), 27 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.=
c
> > > index 4596073fe28f..5d64cd57e764 100644
> > > --- a/drivers/gpu/drm/tegra/drm.c
> > > +++ b/drivers/gpu/drm/tegra/drm.c
> > > @@ -1359,10 +1359,12 @@ static SIMPLE_DEV_PM_OPS(host1x_drm_pm_ops,
> > > host1x_drm_suspend,
> > >=20
> > >  static const struct of_device_id host1x_drm_subdevs[] =3D {
> > > =20
> > >       { .compatible =3D "nvidia,tegra20-dc", },
> > >=20
> > > +     { .compatible =3D "nvidia,tegra20-dsi", },
> > >=20
> > >       { .compatible =3D "nvidia,tegra20-hdmi", },
> > >       { .compatible =3D "nvidia,tegra20-gr2d", },
> > >       { .compatible =3D "nvidia,tegra20-gr3d", },
> > >       { .compatible =3D "nvidia,tegra30-dc", },
> > >=20
> > > +     { .compatible =3D "nvidia,tegra30-dsi", },
> > >=20
> > >       { .compatible =3D "nvidia,tegra30-hdmi", },
> > >       { .compatible =3D "nvidia,tegra30-gr2d", },
> > >       { .compatible =3D "nvidia,tegra30-gr3d", },
> > >=20
> > > diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.=
c
> > > index 3f91a24ebef2..85bcb8bee1ae 100644
> > > --- a/drivers/gpu/drm/tegra/dsi.c
> > > +++ b/drivers/gpu/drm/tegra/dsi.c
> > > @@ -662,39 +662,48 @@ static int tegra_dsi_pad_enable(struct tegra_ds=
i
> > > *dsi) {
> > >=20
> > >       u32 value;
> > >=20
> > > -     value =3D DSI_PAD_CONTROL_VS1_PULLDN(0) |
> > > DSI_PAD_CONTROL_VS1_PDIO(0);
> > > -     tegra_dsi_writel(dsi, value, DSI_PAD_CONTROL_0);
> > > +     /* Tegra20/30 uses DSIv0 while Tegra114+ uses DSIv1 */
> > > +     if (of_device_is_compatible(dsi->dev->of_node,
> > > "nvidia,tegra20-dsi")
> > >=20
> > > +         of_device_is_compatible(dsi->dev->of_node,
> > > "nvidia,tegra30-dsi"))
> >=20
> > You need to add "soc data" structures to the of_match table instead of
> > checking for compatible string in the code itself.
>=20
> I assumed that introducing "soc data" for 2 occurrences would be excessiv=
e.

Even one occurrence is enough :) No device tree properties should be access=
ed=20
after probe.

Cheers,
Mikko

>=20
> > Thanks,
> > Mikko




