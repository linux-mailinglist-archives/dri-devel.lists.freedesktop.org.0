Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDGDHMGCmGlMJQMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 16:50:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B4E1690BB
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 16:50:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7BD10E1B9;
	Fri, 20 Feb 2026 15:50:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VuGqMxB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010016.outbound.protection.outlook.com
 [52.101.193.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E1D410E1B9;
 Fri, 20 Feb 2026 15:50:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iWOi3nVU1Q9CBazdjx57IU/3wnKXc5xY7TqPZcff8i54E5GbovNGcOYyVbCDd+dE1o78pST0aCqrvDAJkguawRSMyokzKjoJJxYAJ1TOS1/ors1miUPG0lergMxKoB0Bw1DVJrqOc4u851AtaGyZzs8FPMXZMMw6srM9PD4+u3RT2fonfmuYTMdGC8QGMsFXBtUtgfz8pMD3frpVO33BkhKXnUzLsvrgLYCAo+/htQ1UkPDYb+0yC2ORSyy7PMqpFqxt+L3AJnrxEOxhGfdIOUb2oLT53mls3uwRkG/rx0Id3eJKZHbtgMld3tvm29v643RbvveOm/biKvougqsxBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIbKAf/GpL7mjVGvh3MNyuYOrRFCIWt8qHjat5ltyj0=;
 b=qLTy/q/j3JUvwHE3+z6QFbHnxAQZXQa4LqSz330GwOUIlfrLZ38Pdo5M0ocvIDx5Ve/o2+oLWrPBWDtK/ld4mUtxcexRS0tCpOL+QRIw7oY9gVKwPxeFtYDfndnCNehvIosGSMPCpQ109pqnkLzWs2CYO5p6uaPd2V3s+jhphevz90F+ehZA+0Z7Q7LNyXylf2tzwkHLPajv1qKT7p8Grc+WRyjSBktZHb91CjJnztlZ2GodW9enKorGChoFYqnYbU4QotuoPjeqsb1P6hT2TAAjNLAC/2js6jsam6KHimIiSB3C1ZNHHUFHaQj8LQN7yYS0BVvofEOWJx1bJoV6UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIbKAf/GpL7mjVGvh3MNyuYOrRFCIWt8qHjat5ltyj0=;
 b=VuGqMxB1SaQ3Oz/9ZaP7/DnK2dWNl8SiyeaCgY8gEsY6bSw0qU5wuD0bjusvS1qyOdJZgeTQh1QlJ9MmnBbQLhTJaswAGPLPmTSYGG9xn6kNssv+7kaO2gVlBI9/cX/oZlNHvZd8ZkxrA7r9PQ7mE+2OACl8IyRp99uKId+4PRwUDbB83Gd/fy7Q0khCNEaNNDc0ovdDQC1HgKzItYWk9cjLp5K8cbylFc2UnRn1nycO90MY1t3UK7VkGk8XDNs4kokvKHqne29yp5YK0vzUQ1ksTMZcsMi/uGIh5QKzA6IQ6vQmsr/kpQSHRuAK5mT/IxalStDjGMlcrhM+qCPtog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS0PR12MB7655.namprd12.prod.outlook.com (2603:10b6:8:11e::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.16; Fri, 20 Feb 2026 15:50:10 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 15:50:10 +0000
Message-ID: <fa058758-715d-4493-ba38-0970ff483f9d@nvidia.com>
Date: Fri, 20 Feb 2026 10:50:08 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-7-joelagnelf@nvidia.com>
 <DGJN74VW6HS2.29CXZ59K9M220@nvidia.com>
 <ece7e6c1-f91c-4e7f-801f-28b228bddf3a@nvidia.com>
Content-Language: en-US
In-Reply-To: <ece7e6c1-f91c-4e7f-801f-28b228bddf3a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:208:32d::22) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS0PR12MB7655:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d6901af-7534-490d-b101-08de7097ba59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bzFlLzNadEt6MjIrckJKYldWZHI4YTZBSEE3TnY5V2dsSHBsaWM4U2t2Ri8x?=
 =?utf-8?B?MlhKRHhuSEFLYWhCRS9jeEM2c0dwYU1JL0Qra1ZPTWlTcjdBMVR0QTV4VkJJ?=
 =?utf-8?B?dDRGdytodzRRMW5WbFRGL0hPbTRycWt6NkFqZG1vS0orN0pIR0U0WVg3SThU?=
 =?utf-8?B?UUhBMFI1ZDcwVlRoOTMwV2lVVEc1OGRHbjZOTVppNHdxWTZLckFsS2pTZHc1?=
 =?utf-8?B?ZkN5TFE4MDVpRVI5ditmNlNoV2tHc0hkZFJIbTlEa1pFTTJ2WGFlNWJpTmtm?=
 =?utf-8?B?SGU0OW03OEw5U0t2RkVpNlJ0bkRrRGdDM05SL1JUd1d4K0haTW9EcG0xU242?=
 =?utf-8?B?MnlZejZLUGNPNW0yN3RxaHEvbzZ1QllBanFycU1zQkZSd2RTQzVZT2twOXlJ?=
 =?utf-8?B?WWVpOGtsKzYxcHcrbzYyRFlqcmkybjRIdThDUFljSHJNRy9PelNZZTZFekoz?=
 =?utf-8?B?bTZidG12dXRydWFJYTFQYnFIeUc5NDlQcjJJcTdzTDVUYWJGYTh2SURORFps?=
 =?utf-8?B?bDQ2bDloT3Y2YVpVKzNTMGtCU1RKa0dmc2RTcURHK1dldGhUV3JaYk5JUEdu?=
 =?utf-8?B?ZlFWVWdGY0xYcStGOEpNVWdINkVNZ3N1Vm1uRFVhWUhNQk0wRlIvMGx2bDdF?=
 =?utf-8?B?djFQaTJlYWdBeklQYWJGV2tlcGFtV0NvakZaS2pnSVU3UzhEQTBEb1cxSVlq?=
 =?utf-8?B?aG5BZzl1Z0lCS0xKQlNJQWJsQ3Q4NnNscm1yZ3RBNU9laTlZQmE2K1JjdzRy?=
 =?utf-8?B?MHdTd1lCb0lkMnNxQ1hwV0lBOU41QitzTGRHbHBYK0RFU01RTFhDblVEb0Ew?=
 =?utf-8?B?dUcvQnhSeTNsYmdFOU0xajNGWFR3eUo5dVdpNDdVd0s2UmpJZ1ZrYWhDTFA3?=
 =?utf-8?B?eDFweVFMZ0RGQi9mNE1sdnJneDliMDRxbDdaYjhycmZuMEJCRThYVTIzdlMz?=
 =?utf-8?B?NDRvSmp1b1ovRTZYempCdjUxblREZUFMYStpVzZCKzVuMFVIRnc5K0tBSURh?=
 =?utf-8?B?N0c0MlB4bE5KbzgwTUhrSlVuT2ZiTEZTb0JlM1ZYaHI4VmdGQW0zaW9kOHh6?=
 =?utf-8?B?L3hPUzdPSVM0SEZpMXRlS1BqU1RKWjd1SDVuYzdMUXpHQ1oxSnpjM2krKzQ5?=
 =?utf-8?B?RUo5QXJ6dUJzRkFSRVZGL0kwVm9lZVVsMkdtWmxrcHAybitvakQ5cmZCV3Vq?=
 =?utf-8?B?NEs1eDZId1dzWXNyL3lDQUk0Vnd0S1lWaTAwcktlSHdXN3VRODR6SEg3WVM0?=
 =?utf-8?B?VlVYeXZ6Y2pDK3U4V1dpOWw0RzR3VWlINmtOa01Kak9ucUgvb0l2eEhsaU5v?=
 =?utf-8?B?VWFUYStLQUxUL0N2S1lIdG5wVEZ1OGtlVnN5c3NpcUU5VnZFditQNFcwUGls?=
 =?utf-8?B?dU5lcWdNZTVoNXZqSERWdkJXWTFFUVFJOWMrRWJjRVN5QTRGRjBtVFJYQ1dW?=
 =?utf-8?B?RmtvTzViMzRSOHFiSGNOWVFxampma1ZJeUQ0WUNnNVBWUGJHZUp5SlFFMGtp?=
 =?utf-8?B?NnFWajRkTHBsamMvcjR3bDVjTnNlUXJmVWtGaHlhSkladnBSL2puQzVyclJH?=
 =?utf-8?B?R0t6eHBZSHpERmxwYnV2aHZqQURmWU9YbWV0TWJJVXh5S3hiby9CM1ErajZp?=
 =?utf-8?B?YXVRc1ZaNDJTYkNaSUsxaU4wRzN0cENFQ0R1eHdOM3FoandLU0FlM1lDNVAw?=
 =?utf-8?B?cUwwT3VQSldMRUx5OEo3ek1kVHdQdVBXUTF2d2RTdEtmSnEzUGF5dGdYSTBy?=
 =?utf-8?B?Q0VRNllyK3RDVko1WkhDQnFPeEdjUnlGK3Z5dS9KQVl6UlJRbmJMSSswRG0r?=
 =?utf-8?B?SUFndVdITEVNUllSejNYR2hMVVBHVFVZczRkdGJ0SUVtWWg3T25GeTRKLzdt?=
 =?utf-8?B?a0lEWE5yOTM3bXpYbXBkVytGSnRtRVkzbytwY0l5NGhMM1ltbjNuSFMxVVBh?=
 =?utf-8?B?Ump3MXM5U0hQa1c1YzBpbm5jUms3RUs0Wm9WOVhycmRYaXMzelo5Qlo3cGVj?=
 =?utf-8?B?M1Y0Y1RBbUs3YjYzRUhIYjlDQ29BUkdOMlYrcjZzbWJtU1ZDWSt5R1R2bU9V?=
 =?utf-8?B?NjZib29JQ1JiSmlUdWtiRkhwdzhUSjBsYVhpY1ExTzdkc3htam9xdUF6c0Vs?=
 =?utf-8?B?emJ1SmhRQW53YXRCalAxdW93NWdNaHZzWWJmQkttSkk4U25hK1ZNdEpFWXdp?=
 =?utf-8?B?Z3c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S2lod2wrR09ET2NqQ0ZUUlhOdW5FZnlwYkwwUms1Y2NCOGhlbGRVQXN3VmE1?=
 =?utf-8?B?d0dXZzBIUFZpVExWSlZaZVBleEw1bVRZUERtK0J5d1FhczFYdWg5cmIwVGJT?=
 =?utf-8?B?RmRpeU92Qkc2ZEdxYlQweXphT2NyejZmVWlHSEZCUjVVSnNSWk9jQk1uVkdn?=
 =?utf-8?B?TTFFTUZ4YVE1YlBObjRha3M2NU53YS9VdGhubnpHbFJJQVBCNUd1emxFeXFj?=
 =?utf-8?B?VENpeUxkS29HNy9BaTlGMjVrbWYxdGNjM1dVN08rR01yL0dMblRUbWNmNnlB?=
 =?utf-8?B?WmoyUlQwYnExZWFuaFFzdkJCcWZJUldKaUdvbnA3dWYxQ00rN2xmTjY2V3dq?=
 =?utf-8?B?QmJxNkw5OEJGMExLRjVSZTk0Um9DRmtab2ltYWtad09HdGMzL2dNMW9qT0Y2?=
 =?utf-8?B?RVFXVm5pOVFVRGRBVlZqbjBDeENNZWRXV0c3alVUb2dTeERXemJ2NDI3azlH?=
 =?utf-8?B?RHp1aUt2UWx4TXlEZzlSQ1RDdVVyNTQxU2RueXJGNE1WaWJtbFh5Z0ZGMm52?=
 =?utf-8?B?cHhnbDZ2cGU5S2RPa3V1YnZqc0hHcFJ5R3MwNTloMTJnSlJTdUx6VFF6NEh0?=
 =?utf-8?B?YytYKzhWaUhjQXBENVFOVnhYb2dTSnpyMnZValBZTW5ISktiVDBtTytGenk0?=
 =?utf-8?B?U2VabnIxc04ycGd5WFNVZy9NdVRkVnk2UmFndGh0Q1I0Y2I3UGZ3UVc0S0RN?=
 =?utf-8?B?YWpDQjNuNXhqVzNDSDh0YUVtM1lZQ3cvdzBST09wQ01ackRmOVVrL2R3dDdJ?=
 =?utf-8?B?SXJITmNxeTFBWW0xZ0wwclAxOS9kek9yL2xSMU5xUGl3WkZDTklIY2UzOGVa?=
 =?utf-8?B?dUtpdDh6WkhUd0s4dFlPMlM5MEpJZzgrdVN2dW40YlZ1MUdKYkx5U1VZOGYr?=
 =?utf-8?B?aUhhVStySTVZbGdWTlpuUEcwdmFaWk50djRzZmpRc0pIRFF1c3VKcmZSWVRX?=
 =?utf-8?B?N25ONStSbzIxQW94am1RMnFCbWFVQzdlZW40VlVNY2ROZWZVUngyWVBwb1lV?=
 =?utf-8?B?MmtoOU1Yd1hrSmh0UGUzU3ZSZGZZZTFpdEJnWlZVWWtISjhlcFRxbHVROWZJ?=
 =?utf-8?B?VW51OHphYk9NakxiSUpoNkJtaDI2Q0dxQmMrNUFBT2JrT25kU01HQTFMZFZH?=
 =?utf-8?B?MGw4OE1UUFJSTE9yYVRFWWVJaHl4bi95WW1tRUp1M1JlOGEwS3hCVkhNcGxj?=
 =?utf-8?B?ai8zZW9VWE9uNnBqWGU4YTNnRWUxQWV2dnhZcWZ1TnhvbFd4UTlWUGxxaEZG?=
 =?utf-8?B?TUZ5ZXZVVStCNzJYcEVHYklWNUR1SmJwSWVhTEpINWpyTUlJa0FETkdCWVhj?=
 =?utf-8?B?ejZ2MWFISDZVQk54MHhxcDc0bklQUHR1dVo4Vk0zZjRrKzFUckFnOFdHOCtG?=
 =?utf-8?B?dXhuSTQ2K3N5N25IWnVJR1dVZE4vRllMQU0xM1R6Q3NZcGQxSUxReDJqSDBK?=
 =?utf-8?B?K3BrLzhaUHRqYitCL2lSanRoRVR1YmlQdUdUNHY2c1VIWjNxSUxRUGRiTlNN?=
 =?utf-8?B?QkI2S1ZVc0ZZU2hpT09ubXdhVVNJWUtDNzVlSEJmL0J2bWpxTHNOcklDOWJJ?=
 =?utf-8?B?Wk1GeS8xdERWVTBYNnNGdzM1NkIvU0g4NHBOWGtyOENHV054QjhGd1M1eVlV?=
 =?utf-8?B?TkxyN2ZuMnFKcFV4RmFyaTRIOXJJdGlDNmFURFVPdGoyYjFnR01CUHFaKzlo?=
 =?utf-8?B?ZDUyYnpack5RQzJEQk9ydnV2a1R2VlgzL1NJcjZMTG0rbkhyd0xiU0V2ekZD?=
 =?utf-8?B?UUJrRVorTTZFdXM5cnhNRkZ3OGhDTGx0M0J2MForc1p4bmt4VjRkdUl3VW1N?=
 =?utf-8?B?aVBGVEhjRk5zb1dQODRoMXRZYWZ3NHN5Nk40M2I5TzR4UmVFdXc2YkU4clFj?=
 =?utf-8?B?amRDenFDOGZ0ZnVlR2psQSttL1U5UzgyQkFBMWlJV01sV1ViTjFTSDlCWTFI?=
 =?utf-8?B?bnV2VXNxN0JCVnVFOG50M3EzVUxDY3FYUW1uZ04vL2JwMmR4UVB2MUczSlZF?=
 =?utf-8?B?NnJjNjNoaDVHalZtek1La1hEUys4cE5zNCtvQXNsT0xaZ2JpdnJLdlFoZGhj?=
 =?utf-8?B?bjZVWFB2WmxCZFVOQXprN0lUN2wwSm5PbFN6cUlGV241b29qWUFCZFd5dzdE?=
 =?utf-8?B?cEZrdGVSbDZJSjRpVVBBNG9oL0xPQ3lKM054WkNNVmd3cnM1bDlRQnlZa3l4?=
 =?utf-8?B?OEdyZnJFR05lb1NjdHNMSFVJLzdyTE1LSlNRVlduZkVmV3Z4Rm9YaCs4S1dx?=
 =?utf-8?B?aTVvcTZuNkhwZlg0U3Y2RWhNUVNSWW9sTlB6ZUhTTVlkMDkzTFFIU0k5Vjkr?=
 =?utf-8?B?bGVPWkhBYWIyZ00zcWlaYmZqSmR4MjFrTU9MVWlNR3E4UGFiQ0lHQT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6901af-7534-490d-b101-08de7097ba59
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 15:50:10.6178 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ean2zSB5nK68UGZYmgfYCBwtFZyQZzTxLaR1LMVuiqd3myIK4GurEJSsBZJVSJrVyvaYTABIC430DYBF7S92MA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7655
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
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[buddy.rs:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: D2B4E1690BB
X-Rspamd-Action: no action



On 2/20/2026 9:54 AM, Joel Fernandes wrote:
> 
> 
> On 2/20/2026 3:22 AM, Eliot Courtney wrote:
>> On Thu Feb 19, 2026 at 5:55 AM JST, Joel Fernandes wrote:
>>> +__rust_helper u64 rust_helper_gpu_buddy_block_size(struct gpu_buddy *mm,
>>> +						   struct gpu_buddy_block *block)
>>> +{
>>> +	return gpu_buddy_block_size(mm, block);
>>> +}
>>> +
>>
>> Will `rust_helper_gpu_buddy_block_size` be used in the future? It
>> doesn't appear to be used in buddy.rs.
> 
> I think it is worth keeping because it is a pretty basic API the underlying
> infrastructure. Finding the size of a block can be important in the future
> IMO. It is only few lines, no?

By the way, this can become important for non-contiguous physical memory
allocations where an allocation is split across different blocks. In that
case, we would the information size of each individual block, not just the
whole allocation. I could probably add a test case for that.

--
Joel Fernandes

