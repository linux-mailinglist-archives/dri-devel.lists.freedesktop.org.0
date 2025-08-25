Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 666E9B334F2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 06:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937A010E24C;
	Mon, 25 Aug 2025 04:16:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VBQ1Az7R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE6F10E24C;
 Mon, 25 Aug 2025 04:16:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a2mSIjKa1mZpsjy/eesF6lfY9+PcobMo0dH53yPFt1NygrEh3FcwweqGo+sD0YVhrv5XiL1CidnV4U7rjUw91szamj5NJliXlwH67PnKrG7fdDe4WiCaG5l5pNZLtIQDVOCpeappHWSCmTdnGAFvo4c2cnIAftPD+U/VipgGoYVwE+dmU3d6q1S7YykwZqu1vr13NgWFTFENpaEG7ePbglTQEoXur2+1RpcepPsgbjMPTA8sdlVno5+OVeg/5ktzi0UcwENgoDE9XeUWDx3xC5rKTz9gxyYU4CR6X4H+1nz1blduvfBLqs9Z8nQoHgS/D0/HegOjtR1ub7Bw7oFfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEHIDhGsRnycMdWvkJavtPx17aP/xbTMBiAtjRvxm/U=;
 b=vuTQI91VY8smEoKOiMwyXAwytzx0koduM7645QIwiGgsWRvzJC/7mC+SkPYNf3yv9iXzeVK84xW0gtiYfxzUs0Iv44eJzdvk5w8QlAxbJinUz/yaE2J8FVu2RfV8Uu0gg5odzNW4p+i8sXos0QxToI3QH7fCIPl5BcbT4ZZ+qrHokZZWO3eNpnMk/S0Nmd/fiavddzZzfbqksRg6VxFuhWrSD+EcYcyGIMFAJW60XcfN5hc9vTLa6rM2UrczMExAuaknr0JTgAIx2N1WXrLYvYfxg/WiZUUXhqpQKreXq3r6m9BvlTxb99nHDhvS7YvEHHFrdUyEypFbjArZUVyQ/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEHIDhGsRnycMdWvkJavtPx17aP/xbTMBiAtjRvxm/U=;
 b=VBQ1Az7R3SE6g1VJQ/Cjo940KsIDhIrgXyp3dy0+9KN7n1qEuPvpk3ovYSAEK9xaRYc1H6uAVa2YoNgJgVMCnLRBNH8uFY2Px6+E9ZcAN2zBuW60EV7YrZlQbGTNW+ohhduL4aN3bRtFUoBTXNdbFC5DLvClgPN4Ei2IS4Dd4QyjzcKyBKHIQFs2ldx/vdCV+Sa3c/5108XG0qjLcuU4AZDvkbbESO7dayAHQV9moiDtuRZZNIFTlaVMOPciLMvXanqUE/wLkBxfkiDwvpoCr2A6eiK6lxFv5WBkZF0OprWbLtJUmp+Y7x9RhBB5MSi0ZAmyMnXHYe82sJ7d8Sq1vA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MN0PR12MB6368.namprd12.prod.outlook.com (2603:10b6:208:3d2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Mon, 25 Aug
 2025 04:16:11 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Mon, 25 Aug 2025
 04:16:11 +0000
Message-ID: <fe23756b-9e0e-4070-8ec2-06492dc3f1bb@nvidia.com>
Date: Mon, 25 Aug 2025 09:46:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] nova-core: Add a library for bitfields in Rust structs
To: Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
References: <20250824135954.2243774-1-joelagnelf@nvidia.com>
 <aKvjIM39f1oGyn23@tardis-2.local>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aKvjIM39f1oGyn23@tardis-2.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0146.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::16) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MN0PR12MB6368:EE_
X-MS-Office365-Filtering-Correlation-Id: f33cc0ca-8f0d-4668-4050-08dde38e1f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eUtqenVoQmluSFhLUm1VQ0VpZ0lTTEdpTUhiUHd4T0NDeEYwL1JINmJxOVBN?=
 =?utf-8?B?TlgvWmZLb0xLVHJYZHRvWlpRUlBWdDJNYW5ZT3B6V2hEVzRvYmJiYUV4MEpE?=
 =?utf-8?B?QS9aQUdaQ1pSRlM2c1lPaDJpZXJnRlEydmJwZ2NmUTh1SFNOZzgyQjh2d3hz?=
 =?utf-8?B?VHdpRnNlZzdmYnQ4K1J1NGVvcFFCZHBoUDRqSFZEU0VGZUFwa3ZLQjl2T1Iy?=
 =?utf-8?B?VE9adjUrdG9OcW9jL29XMEcybVlPNHRHNi9nQ1JaUnN2MkRCWlljZmxkak5N?=
 =?utf-8?B?UXFKeGtXMURBL0d5U1VQMmE0dEdybFMvZmlFeHVLVWtoNHBseEJtSXU1Mjla?=
 =?utf-8?B?VGJING1IWlcvRTZLbFNKamVFUmN5ZXhpTGdtQVFvZ1hkS3k0eFh6b2ZqaDZH?=
 =?utf-8?B?SjFOd3Zxc1FLS25XaXBORTZhVGN3QTFmdE1wNmRwYXNhWlVSN3R1dmhrSC9C?=
 =?utf-8?B?V0x6aFRGUTh5bmU5bFdkL2hCcWpGUVh2ZitnS0RqRTduVmJRdFgwRFd1cGI3?=
 =?utf-8?B?dDFTREJxVlhma3Z4MDIxNHI5ZFA5UmtpajhpU2YwN2JLbGJwd25NbmRqcWdl?=
 =?utf-8?B?QkdEc3FwdFNnVXZyaEQ4UFJVU1VtMGdrNVlJUThPL1kyZXN5VFZhZGI1K0d4?=
 =?utf-8?B?OGdtaDRXeXgxZFBEcXdhYXl3WmkyM0ErdmoyVUNNVG95cVN3em11blZBVTQr?=
 =?utf-8?B?LzZqQ3kwYVBOUWh3ZmhiSFQ5WmZXczduOWw0MnJtS3cySVNjZGQxZUdhd0NS?=
 =?utf-8?B?SGZwMXVvUHNoTlNOTExOV3pGY2U5S0ZlUHk3MHhuaXc4YVdZcG1oQ3FQUjdl?=
 =?utf-8?B?RTNaTHdSWUxoeVVNbU9MWUg1VENhOCtHeEs5MTMzQndsR014blcwQ2xnN2hP?=
 =?utf-8?B?YWV1azB4L2pRTWppS28rbFNNZyttSldTbnB3TEpOMTMvTnNHZEhhdGlSRXFi?=
 =?utf-8?B?aHpxY3k5ZnJKOFZZSkJMQ3JQWjhEWnRoSHduaEtZUm8zd3hHSGUzMFpZdVVQ?=
 =?utf-8?B?ZWZZT0xOL1BDQyszc3V6Z2lOaWl1Zkd3U05nVkQ3RnJVK0lzMnNaYm8wRWZJ?=
 =?utf-8?B?Y1hvNEoxTFJTcjdqN0dxRjZ5YUtuczR4Z09jTi9JSEZjSEE5NjZ2cjU2Y1Nh?=
 =?utf-8?B?WC9uYUloUVU2QUpQbmlCRWJSeCtaZmVmVmYrY04wMmliNEZQNzk2VjdFbjhv?=
 =?utf-8?B?UldITnh0bUJzbnpwd0oxdGFUdVFqWWJPNlJDa2xQVmVJUVg0QjE5djZyWmwr?=
 =?utf-8?B?dzNXTzZsZ1FkS2FJVER2S2xyMExOUjdiTTY1RzE4WkJxVzk4c3pNWUNpaUZC?=
 =?utf-8?B?UFFMWU9JOWI5d1g3T1RuK0p5Mi9UQnBWUERwWjBQOEQ2SHltMnpQdkwxbWJy?=
 =?utf-8?B?SUd2MzdqQlJmaUI4bG5Mbzd1OVpucHhwVCtncVdPdVpkQWt0RU9rYVo2ak5Y?=
 =?utf-8?B?ci9aWWtwUHRUNUEzbHpvRWxHUmVpZ3RRREI3QXZhMTlUdjA1a20veVhyNm1k?=
 =?utf-8?B?TDJaYTY0RTlXem5GeXV3N1JISDB2MkpwUU5vRDE5WVJHcmIyaEJycnViNXQ0?=
 =?utf-8?B?WDkxZXJJeHpIaUxlT0RqRnVTQTEwTE9ObjcrVHdrSmtlblB5L3V0MjlxTjdq?=
 =?utf-8?B?SlQwb2pjWHlNbFZITTBIS0x5ZnhLbTh6UHF4TVNkKzVOS2xCVkRBaGgyMXNI?=
 =?utf-8?B?a3hxbStWSktjY1FKaFZQTER2MEdVcU1tMHJKc0dqeVJJUkdsWXhXV1dsSVlK?=
 =?utf-8?B?NnlWZWZQUXZ4eGdCaXp6elJSTTMwdWxETTh2SUVESWdLOFV5c1VScGJScUJa?=
 =?utf-8?B?L3VJSXo5TzgzUTQ0Z0p4dUtyUlhGK3k5YTIrNSt5cUFlU2FkK0JVTzZsaGU5?=
 =?utf-8?B?UVRCTnZraW1jNjBTeTV2N2ZJd3lLZzMrdUt4RDhjcGliWmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1I3ZGQ2ZmJtNEpmVTRlVUd5Z3BKdE16RlBMb1hmOUV5Y1o5cm9ERkNnMk5v?=
 =?utf-8?B?WVVPZk1teEFwYVE1U2R3UCtKNmtPbVRuaWY3dVIxOWhPcVM5SFd0d1lIeWxX?=
 =?utf-8?B?L0EzVHRGSG5CUTdhc1h4eDlCR2M0K2pMNEM4bFUxcnZ2WjhKMDRnUEQzMzVP?=
 =?utf-8?B?Rmw5V1h2bkcyTEJ2aVZ1OUFOZ2prMjZWZjRTU0tXVG9tdHRKRUNrR0hhMk1j?=
 =?utf-8?B?TGFVd2srTHNJSmIwa2hNMkFVUmNQUE4rSm14cy8zK1QyUVNORUNWTHhzNFpB?=
 =?utf-8?B?OEFUNktsMnl3NXZpZytsVWhTZlJhTXZUcElpODBhMWNNaWx6M2sxNjdGQ09Q?=
 =?utf-8?B?TU5FbmlwT1RIRVZyV1FXTlF1L1pEcWlwZHN1Uit6anlTNXNCZ2FLWkFMV1hm?=
 =?utf-8?B?R0lkM2JIQzhPdC9LSXVNTEFDQzdzdHo4NENKbUtpOVBUQUpGSklYSkp6MUx1?=
 =?utf-8?B?bE42YktEK1lYdlQ3YlhCV1NSVS83ZXk5NzhQYjJhb3NDMTdEUHFWMDYrbzNX?=
 =?utf-8?B?ZXI3Y21tcUZYczZ1MVZ6azJwSHNBWGQ4dkYybWFWeEl0dHZMVkhGa1M0Umhv?=
 =?utf-8?B?dndrcFN5VWxwbWdqd0ttSk9lZGlNa0pYNXA0a0t0ZENJd3dWMUgxZEt0NXg1?=
 =?utf-8?B?bTNHNytzUnFOaTU1dEx3MW4wcEtXN3RUbFdqQW1BeTlHWjJlRlo4SGZ5bFlY?=
 =?utf-8?B?dzl6YUtaVmQ3enJSaElJME1ZVVA3VERRVWhVOElFQW5Bd1c5M3VBdWJDa2l4?=
 =?utf-8?B?cWZldkRvam91cUxubXVhM2tkVE1HZ0g0aVB2Qk9uSVJWVVY2YjM4cys3aVRE?=
 =?utf-8?B?UHNQaFBPUjFlaitscXpCMzJDVWFxWng0ZnRRSGVMYzlVSWxuaVJJbmNTazZH?=
 =?utf-8?B?TE53Z016ZlNHVzZMKzFKZEYrdW1pTlBJTWxPQW14U2QzVzB0R2R0bzhsK2hI?=
 =?utf-8?B?aHpTL3VibFAwOHRJb3FNZUZXK2hVTXVZZmE0OHNUZDd0dEQzMG5ROHJ3SWZE?=
 =?utf-8?B?RGVQNHErVmhoUzVmeVZFeFJTc0VsT3dUZWhtcHVwZXN6ekNRNk5DR1l4Tjdi?=
 =?utf-8?B?b3ZNSWZ3Si96K0hmcEphanhuVGNBQjBWSFMzemhLd0hFdjJNaTdPVHoyQnQ4?=
 =?utf-8?B?VG1FbDczYS9yTmJ2Y0o4ZHhlMmJydjcrRFo2eDNzd2xYaEVCaEd1OFJOYytJ?=
 =?utf-8?B?OW9jZXRpSElBYzZyM2JTc0ljWWhhSy9Ec3IwODR6UVI3R1B1YlVnOGtzMFk4?=
 =?utf-8?B?cXpsaGp5dGdYYVdNS0p1RktiTTFBNTNITG1pbS81YlJ0THZNZXc3L0xFNy9q?=
 =?utf-8?B?M3lZT0RWbDUzc0ovR1VQRWQ4WUt2RTNvS252Uk5uTGhZd2NmdVdhZnorUlNQ?=
 =?utf-8?B?blNzU3pmRzVYekZLWW5DZEgzVG5HbzNmRHFxQUZKZ2xjRVZHWWhwRXdrYU9B?=
 =?utf-8?B?K0dGc3Y0M0IwNHArMmpISWZQSTFhbHI3SnA4M2ZOZS9qeWprdFVlYXREMllx?=
 =?utf-8?B?YWhDN0tjZU5YcTRkdjk1K0orSVpNdy9vc0pQTUJBNlQwWnRWYVBTWWc0eEF4?=
 =?utf-8?B?Z2Rjck5JUC9WUWtoUS9FTXNwOVNxVG1ZbnQ5YUozVDRXbklBOWdsbi9Ya2RV?=
 =?utf-8?B?cTlLa2NkVW1EOG40RGw1S0VQenhvT3VPTHUwQ3VYb3ZrY2plc2hhWE9jRFI1?=
 =?utf-8?B?OXVlSmlUUk45WUI3VkhqZlZOYk82cmtvZnlNdEpBbHR4eDZBbTdjS3JBamdF?=
 =?utf-8?B?aCttQTg5MVRvRUZKVDI2UkxlNzdGeW9ZWVZBQzJIRmowbERkZmJCQUNqcjhD?=
 =?utf-8?B?SWorMENnK295Wkdtek81ckpYa1lpWWI0cFJOWXR0V2VFVEZsMVRIaktudm9o?=
 =?utf-8?B?TThsakVSU1pxN0h1ZVh1ODhPamRGSFlzdUJBMlNaN1o5MzVGSzBDcW01Zm0w?=
 =?utf-8?B?TnNKZkMyY3AyYVhaUE4zTS9qWkkzNSt6dkJMeGZMQ3ZFWGVoR2QzWTg2Z3BZ?=
 =?utf-8?B?NytiYi9pZW10am95NmlQdWowNCtlOTk1UmJXL0RScGtYT3RZdG4zMUlPeWox?=
 =?utf-8?B?V0NKWjZUd2poaWRYWGF2Wkc2TjhvSGZiSTZBcHF5TFRIS3RKNm1BazVzTmxJ?=
 =?utf-8?B?K00zMmo3MFV4SVVobFpBM25wRUFKV2hsL0JZNDc2bmNLVUhFditMZHJFeHdQ?=
 =?utf-8?B?aEE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f33cc0ca-8f0d-4668-4050-08dde38e1f45
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 04:16:10.9260 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLSvbgF1w02diiGpio8lyB9BpCwxDPFRSd8IbuSYCdhipLbagEuLYeWutB6ztQNUaIh9giuh0txiTP8chdtm7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6368
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



On 8/25/2025 9:44 AM, Boqun Feng wrote:
> On Sun, Aug 24, 2025 at 09:59:52AM -0400, Joel Fernandes wrote:
>> Add a minimal bitfield library for defining in Rust structures (called
>> bitstruct), similar in concept to bit fields in C structs. This will be used
>> for defining page table entries and other structures in nova-core.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> 
> FWIW, Joel, I only received patch 1/2.

Oh. Good catch, will CC you on 2/2 for the next time.

thanks,

 - Joel


> 
> Regards,
> Boqun
> 
> [..]


