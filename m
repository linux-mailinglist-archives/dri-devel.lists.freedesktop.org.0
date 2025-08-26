Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87F39B3528F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 06:08:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF1B510E5BB;
	Tue, 26 Aug 2025 04:08:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="YX7vFX98";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA93C10E5BB;
 Tue, 26 Aug 2025 04:08:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uMxJYsi6Gse9By7Ar/JN9Ef9qwQW527QyCpOC8u36J6/sFasIYeFtIX4J6TWJzQPdFztFnwo/Tjf0Ztex+sVvhV5/BNwSyhS9NQdLBytaH4ZsIlqAvdXimOSEET1GRpLdwXC6InyMahdGbdDGRLl08Hr5ZYpKZ2he2BXevZRFAIqHcTVPp3hxKScw2HlTQInGbeQLvjzR1r2+Gms8OL8/zgObR+h7QC3vn0hQKrcOQcxoJMYH8zhJmW3CQJZ9GT6B5p9Pb4Enu36GpkyMla5iKE/+7XrdRynNr6Q/JsvBbHe482KkVB/04cH65wAu+n0phAboheqfpA9nzYhYeIyEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH3jWi6SNeR2W16UARcZk3gZ9QCYmYg5/tAq2boF3+c=;
 b=B/Ts3nnjoP7/OCUa8upApRLICt0l/+vvTpJiWmCGKwYk0hDpgHQ9GPaOp0KW85+kr4oR3mznwxXCjbiHOUEbdDMhjB4zk1eaFSBK/OgbOM2P/mbO05Kh4OGMD06d/VMKUdG6U1n9e92oBK4HaQHuKnqeTTJNgHVV3Rzk6ESc0JcGO2IGQCa33a0tc+oSRZd38lmHP4N6boF1hHzZZqC+vBxgP0R+2nFhtmc89E62qYgnJnC2mPUng99gChXDyVCikNb1CD2jPw7nyDlGxc2/0bALBOivBGsx4Mjzyw1RBBQWXfPegXDIwTjF+zXCsUxB8BvqUMcaWad3tLFZEvVLjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BH3jWi6SNeR2W16UARcZk3gZ9QCYmYg5/tAq2boF3+c=;
 b=YX7vFX98xiUnhYLTVmVcB3S6XVZh8U0/j640TlXI7mbC5Mgdm3mtPRijnrHMFd3JACAr9zBidjrvqAMFgyrTRHhHyj1kEAQIb2i9yn8Hagpvx7cK3xFO7x4MyPqyoZckMDfPyf4U/vBCeTlthgrjNPR8ec9YRirVHyirsD31Yo/JAwolawQJTPrWBYFDzaGpjeQQhOTdCPekSVu7qcyaIo7WJAxqxGhEko7+Xi5bAKPisQSDqiIOPCT7qgWmvatKanmB0D/BLSDVXRU5bdUjCpr0r93KUm7T3hwc9pk3kSAty/K0imQEQJXH+tBlQAD/O3aQhye1ZfH27xcKTeolsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 26 Aug
 2025 04:08:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Tue, 26 Aug 2025
 04:08:17 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 26 Aug 2025 13:07:44 +0900
Subject: [PATCH v2 8/8] gpu: nova-core: compute layout of more framebuffer
 regions required for GSP
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-nova_firmware-v2-8-93566252fe3a@nvidia.com>
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
In-Reply-To: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0088.jpnprd01.prod.outlook.com
 (2603:1096:405:3::28) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 7647b879-5776-48dc-0781-08dde4562f48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dngyRk1lOVpCS3hjVm9OMzIrbnpSWllra1VoUGtFUDVlZTVTZ3JaMDlvbEhn?=
 =?utf-8?B?cmlVdHVpdU83bHl3Y2EwSkc2a3UxMmxDSS9lUmN4TnBBWkszWXNEcEtqMStm?=
 =?utf-8?B?ckZzVmpwdldyakhNQTZJWkQzUnVjcGhEUE1WblVXNGNQa04ya0VYb2N1bEZF?=
 =?utf-8?B?b1N4MThEb1RVY282UkpmUWQxbHphQjg5RzBzR0wwSHoyUkZTQmZXdHhVVlhN?=
 =?utf-8?B?SzNQUGc2ODVlSmRQTVMycmNZdVp5aHVtYU1JcDAwTEhqUnRkRDhFODNoNkRr?=
 =?utf-8?B?MVJ6Q0MyL2VKeHVIM0d1M0k3VEk4OWZxZ29CNnZhRHJFbnkrMVErbUNyTG56?=
 =?utf-8?B?SkFoYlpZVW9vejBITDlhVFNtTlNydmxiK0d2R00wb0ZtZ3had2M4VjN3Nk9F?=
 =?utf-8?B?ZjZRSlQxTXg4VGZ6b3R5UzVtWVdhT3hYclFzMW1pS1A3WHRaVklLL3FQMWlw?=
 =?utf-8?B?eEh6MXZPdzVzS2xKZGRHVlpoVmZuakhqc2V3eWowWTRvZ2Y2M3JPcmFlZHlL?=
 =?utf-8?B?ZTVZRnNCWHpPK3oyYXA5eTdDMUhRWWZVcEJqNUFqTnZ3c0dmRU9zeHltNERD?=
 =?utf-8?B?TSt4VTFGRGVkN2N4T1ZQNHh4YXl6L25uRkVlaDEvZHJaNENhTVFCem12d0NU?=
 =?utf-8?B?YlFFY0ZmK3VLVThaUUo3ejJ3a2VEeUI5eHpXdGxwcFRveGdTSTN1V1VkQ245?=
 =?utf-8?B?YURhWnU0bFB0MEZhbzl6TEdSZmlWb2t5QzQ3ek9vNUpHZitXL1Y3R2dUay9v?=
 =?utf-8?B?ZWpOQmFjeldMK05udlc2VEh0NzVMOGZzRWt5cTVYMXJyc1RFRXNsdHd3bXdR?=
 =?utf-8?B?OVZxa2Y5ZUJ2TEJ6LzhyUXk1ME9JOHdpT2svbUdlQktlWmYzNGVvb2VWZkZt?=
 =?utf-8?B?NTM4TExaeUpLZFJMbmFnV3IzSFpzY2ZyamZqWFQveEtaOHUrSkFCZnkwOEx2?=
 =?utf-8?B?Y25uNENIMUhtVHB5Z0REMmpWVmc1Vy9vRzdTRTlyVUZiQTM1MnFKZDRhNG5T?=
 =?utf-8?B?REJweVJvd3FETzAzakM3d3NQOVl3MUtkNDJBVnJzbGRIK0FKa2t2OWNIQnJ4?=
 =?utf-8?B?clhEY0NRU0RETjBxZzNVcXptd1R4YW9EUURLMFYwTHhoaGxtTGNwZ1g0Q0lz?=
 =?utf-8?B?bXhLWmJYem1QT1FIVERhQytVTS9Cckladnl2bU5zZFlmTFFLNjVQdzNnN3Vk?=
 =?utf-8?B?dlpuR0luQlBOR0JodjV5VlhteEdoZkhDNTZ5UHJ4S3lVWGhoNll5b083WkZ4?=
 =?utf-8?B?M3JuNmRIaVNuZjFvc0VYRzhpRmJWckljTlB6Yjk2NGJnNG1BUmNsZFJYK3lO?=
 =?utf-8?B?cXYyWmtTU3Q3NEQrODZxNW5ubEFSaHBQTzExUk9IWmIxblVwaE5BNWk3aDBs?=
 =?utf-8?B?ZTNadWxpZjA0LzZRM05nL1BaNkd0Q2l0V1lhL2duU2d1WGhVS0NZeEgrK2Vw?=
 =?utf-8?B?K2dtbE5abVBWc2M2OEw2N2E5em95cTJDOS9kSkhjKzQ4OWlkUlpPLzdTRFlV?=
 =?utf-8?B?VFJHOEEzQXNZbTR2UVJtV3Nab2JNeXM2aFRRNG80UzllSDB4UmVRYS9JRmJ4?=
 =?utf-8?B?dHdiVUc4ZUN0TXE0Q21uRUo5QXRyL2ViRGQ1Q2JoRnlIbG9OYTN1cWt6ak9G?=
 =?utf-8?B?Ny9nQ09wR0Q2dGZtcU5RbENydHEydWpmZS92RE41aWNkUUEraFNKaGtVdEJP?=
 =?utf-8?B?YVVMdTNpdlBBNkJ1cTJicHFZVkM2NVJ3djZzUVhCdGl0cnArN0ZKQUdGRjhQ?=
 =?utf-8?B?TFJlME1DaWRnTEpWMlRMNERHN3lBUXQ4eUsyNE9BUmMxdnR0S1VVNFJIeTVy?=
 =?utf-8?B?V0lONkN4K3VzcFNoV21hMkp5YStWN3orMElBV3JGT1JtQklSN2tjNFAyckRZ?=
 =?utf-8?B?b01iUWNNQkZyK2ZHd3M5dkR3SCtpb2ltWjlEQktqU0JQL1Arcko4dlI3YW4x?=
 =?utf-8?B?RWt3MThRWU1GaXE1REZURkhibWtsemRvajV3TFNuSUdnbXg1WGJhdVZTSVFV?=
 =?utf-8?B?eUNhWFZmVVhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnZjMENwb09tSEdXNThBU3F3ZkdScTQ2K1IxUFI0d2J4b3BPRG4yN010emFW?=
 =?utf-8?B?MzkrZXd4RTJtcHRtWllLcmMyQmVDZk9Ba2NxQ0tSV0xKYitodlBZVkgxNWVp?=
 =?utf-8?B?U1ZrNmVRVjJBN1JySTRJaXhyS1h3M1ZYRFQ5czk2elVTdEhJWlBlSUxsQUo2?=
 =?utf-8?B?SHpnc25PUGFzTlpWcW8zZnkveDBsM1U3ZGczajhRUlJ1bndRRWh2M3Y5VjVx?=
 =?utf-8?B?aCtOTWZ6Z3drQ0ZWblVQQkRTMEJSbmVKQ1lPbnRDQlR0aUlOZTAraTE0NTdS?=
 =?utf-8?B?KzFtbGw1eXdrT0wyK1h4NVdpQWswOVQ3N1hYRUJvYWp3ZDhJQ2VOK1dlejk1?=
 =?utf-8?B?UXVDWWRNdjh1MExkVmVXV3Nzc0JrbFNBek13N0dvL3dKb090b0krRlM3TUs5?=
 =?utf-8?B?TlRydHNIRndTVVBuRFhsNXdNRkZxdHVqV3pKMXZ5YjZMampTbS9XKzFNbFp2?=
 =?utf-8?B?R281cU16NTc2bWlmMWJZS3Q2RWRxUlJqdDNiOEZSTlREZVpDRlY2REs2QlNF?=
 =?utf-8?B?K1dmdzdXMkdPV1BOa2c2RFdCVXE5b3E4bkxpZFBJbldPbGl2eUZYaEZZd0xS?=
 =?utf-8?B?WlVUOHRFbFNzYm9xTnk0cDZYMmU3MEdjQUtlL0xUSnFQVFIyaUYyZHh2d0V5?=
 =?utf-8?B?SFkzemZjTmFVRWZqVmpEcWVGWmVnVElmZFE1cnJqTmgyanRJcU9DK1cxMVNz?=
 =?utf-8?B?R3B0WGJXVDFxNG1BQjRwTEZLMVNqM0N5bTJ4c1hiSHRNRVFMNE5lU1J1YVc3?=
 =?utf-8?B?Nml3YUJJb1B1K2p5d251QmN2TmMvMXdDNDhpU2dRREswZithYnpjZXk0OTlX?=
 =?utf-8?B?Y3VXckV0M1BFVTBTTVZmLzJzTGZYWW4wbTJ3cTFLL2JhTDVNTksrL2RDTFQx?=
 =?utf-8?B?S05rVmZwOU5paThJYXRGV2NGZWEvRVFra3dzaUkyU3pUbktRc3lWd0E3VkRM?=
 =?utf-8?B?eWxFSkUyNEF1Q0h0YjQ1ZVhjYVRtREhFNVIyU2tyRjRuZXZFcmhEUkxyZXNP?=
 =?utf-8?B?M21rdmVGWGtNYW9NWkVVSmM4V0VyYUQrUGN4QmErVzVHbmczSmVZYUlGaWZD?=
 =?utf-8?B?bytIQ2haT2UvTWZvTDNqcW5nUmlJWUJveEF6QkpzMUd6NjAvZVp4UkNnSWVT?=
 =?utf-8?B?ZWFFb1JBaklhTm5mR2NPcitPcDBoNnlhZ20wOUZoZE5PYjd1RW1XZFEydXc4?=
 =?utf-8?B?RXRQNzNpK1YwRnMxNXB1ZCtKNVllK1plQ1VGOS9vV0tkWHM4OHRVNlJGRThl?=
 =?utf-8?B?TG54cG1GWjNncytoM3RJU2NQbitFakxUdmZkM0FVQ0tpZlRCejZPQmxUMFAr?=
 =?utf-8?B?N1YvSXBTVmNZQk1yKzlUOWhxeWhZeXZ6NlQ5ZkNTVzBKcDQzOXh1UDEwVloy?=
 =?utf-8?B?bWkxNEtLMzRlWC9GVDZPRXlZU1gwbm9XcXQrdVY2Z0ZESlMyUm00SHJFQ0Vt?=
 =?utf-8?B?UE5zMm16dVhSamJ4N1lFNWhkdEFSUktxVks4ZFR5M1lLUVB2VE9ZNzFuQisx?=
 =?utf-8?B?U21LcEd2bG5ERzh5d0xWbkdpWEgrbktZRkUvQWNQYnY3WFc5enFPZWpoWVdG?=
 =?utf-8?B?YlU4VFd4L3BrOTFqQmljOU9hdnV1SUVreUt0THY5V1pNRzZ0QUxWZmhOeUNM?=
 =?utf-8?B?OXdJQXQrUE9TZDdTSG9DZFNObVhnUUpOa3lHbUY3Z2ZkcE85c2JybUJ2THNZ?=
 =?utf-8?B?L2k5OHNXZWdoZExESEdFTnRrSEwxZ2hpanlXTkdtSktDcmlRaWpSRVJpZkVr?=
 =?utf-8?B?cHNOdS8xdXJobVhIOC9ndk9FYlRIdFNuZm51bXoxVXlGYXQ0NmF3dVRVSFJo?=
 =?utf-8?B?UlFISDUyZTgxUEF6b0xybld5SmRmR2grbEFBQi9aVUI0dDIwcU45eWNWVGhC?=
 =?utf-8?B?Y0RDRmxiTHNLQUJrT0lYL2w5emxleStVd1JyMHFCVzV3ODlEZjZzZ1pxc2VI?=
 =?utf-8?B?c29OT2VsVXczaDN0VVhkWUpIQ0FGdzFKcHZsZDRGaU8zUlJBOWhpSkF1ZG1q?=
 =?utf-8?B?aXdzQXZFMXhJUHVjdEM2bVRXU0dOYUVxUjRSeml3ZGs3c1dQK3luQktQb0dE?=
 =?utf-8?B?cFhrcnUvQ0xseTZvM2JBTWg2VEZZd3dDNWVaaHBYM3BOYVllU0pDclVvajZD?=
 =?utf-8?B?UlRTakZuTWVDZHBxaThoSXE4cC9iL1YydjhCRXlIZFR4OXF3YVlZVTBoMnFH?=
 =?utf-8?Q?q9uRuJ2ac05GNuCbKqwHuHJUw6ILES2YRI0+B99WnPER?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7647b879-5776-48dc-0781-08dde4562f48
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 04:08:17.0466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPtVPFC31nMZQ/6Xtza2n4Io1Y5nseP6Nip2Aa4RvF2fxC9Y3sdIY7GZYBHA2e71ZiGnspHGItmMt0Sj90a1pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925
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

Compute more of the required FB layout information to boot the GSP
firmware.

This information is dependent on the firmware itself, so first we need
to import and abstract the required firmware bindings in the `nvfw`
module.

Then, a new FB HAL method is introduced in `fb::hal` that uses these
bindings and hardware information to compute the correct layout
information.

This information is then used in `fb` and the result made visible in
`FbLayout`.

These 3 things are grouped into the same patch to avoid lots of unused
warnings that would be tedious to work around. As they happen in
different files, they should not be too difficult to track separately.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                     | 112 ++++++++++++++++++++-
 drivers/gpu/nova-core/fb/hal.rs                 |   4 +
 drivers/gpu/nova-core/fb/hal/ga100.rs           |   6 +-
 drivers/gpu/nova-core/fb/hal/ga102.rs           |  14 ++-
 drivers/gpu/nova-core/fb/hal/tu102.rs           |  14 +++
 drivers/gpu/nova-core/firmware.rs               |   4 +-
 drivers/gpu/nova-core/firmware/riscv.rs         |   2 +-
 drivers/gpu/nova-core/gpu.rs                    |   2 +-
 drivers/gpu/nova-core/gsp.rs                    |   3 +
 drivers/gpu/nova-core/nvfw.rs                   |  39 ++++++++
 drivers/gpu/nova-core/nvfw/r570_144.rs          |   1 -
 drivers/gpu/nova-core/nvfw/r570_144_bindings.rs | 125 ++++++++++++++++++++++++
 12 files changed, 317 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index b0e860498b883815b3861b8717f8ee1832d25440..a3eb063f86b3a06a7ad01e684919115abf5e28da 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -10,7 +10,11 @@
 
 use crate::dma::DmaObject;
 use crate::driver::Bar0;
+use crate::firmware::gsp::GspFirmware;
+use crate::firmware::riscv::RiscvFirmware;
 use crate::gpu::Chipset;
+use crate::gsp::GSP_HEAP_ALIGNMENT;
+use crate::nvfw::{self, LibosParams};
 use crate::regs;
 
 mod hal;
@@ -81,20 +85,80 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
     }
 }
 
+/// Heap memory requirements for the GSP firmware.
+pub(crate) struct GspFwHeapParams {
+    /// Libos parameters in effect.
+    pub libos: &'static LibosParams,
+    /// The amount of heap memory used by GSP-RM boot and initialization, up and including the
+    /// first client subdevice allocation, in bytes.
+    pub base_rm_size: u64,
+}
+
+impl GspFwHeapParams {
+    /// Returns the amount of memory (in bytes) to allocate for the WPR heap for a framebuffer size
+    /// of `fb_size` (in bytes).
+    ///
+    /// Returns `EOVERFLOW` if the computation overflows.
+    pub(crate) fn wpr_heap_size(&self, fb_size: u64) -> Result<u64> {
+        let fb_size_gb = fb_size.div_ceil(SZ_1G as u64);
+
+        // The WPR heap will contain the following:
+        let size =
+            // LIBOS carveout,
+            self.libos.carveout_size
+            // RM boot working memory,
+            + self.base_rm_size
+            // One RM client,
+            + u64::from(nvfw::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE)
+                .align_up(GSP_HEAP_ALIGNMENT)
+                .ok_or(EOVERFLOW)?
+            // Overhead for memory management.
+            + u64::from(nvfw::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB)
+                .checked_mul(fb_size_gb)
+                .and_then(|heap_size| heap_size.align_up(GSP_HEAP_ALIGNMENT))
+                .ok_or(EOVERFLOW)?;
+
+        // Clamp to the supported heap sizes.
+        Ok(size.clamp(
+            self.libos.allowed_heap_size.start,
+            self.libos.allowed_heap_size.end - 1,
+        ))
+    }
+}
+
 /// Layout of the GPU framebuffer memory.
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
 #[derive(Debug)]
 #[expect(dead_code)]
 pub(crate) struct FbLayout {
+    /// Range of the framebuffer. Starts at `0`.
     pub(crate) fb: Range<u64>,
+    /// VGA workspace, small area of reserved memory at the end of the framebuffer.
     pub(crate) vga_workspace: Range<u64>,
+    /// FRTS range.
     pub(crate) frts: Range<u64>,
+    /// Memory area containing the GSP bootloader image.
+    pub(crate) boot: Range<u64>,
+    /// Memory area containing the GSP firmware image.
+    pub(crate) elf: Range<u64>,
+    /// WPR2 heap.
+    pub(crate) wpr2_heap: Range<u64>,
+    // WPR2 region range, starting with an instance of `GspFwWprMeta`.
+    pub(crate) wpr2: Range<u64>,
+    pub(crate) heap: Range<u64>,
+    pub(crate) vf_partition_count: u8,
 }
 
 impl FbLayout {
-    /// Computes the FB layout.
-    pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
+    /// Computes the FB layout for `chipset`, for running the `bl` GSP bootloader and `gsp` GSP
+    /// firmware.
+    pub(crate) fn new(
+        chipset: Chipset,
+        bar: &Bar0,
+        bl: &RiscvFirmware,
+        gsp: &GspFirmware,
+    ) -> Result<Self> {
         let hal = hal::fb_hal(chipset);
 
         let fb = {
@@ -138,10 +202,54 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0) -> Result<Self> {
             frts_base..frts_base + FRTS_SIZE
         };
 
+        let boot = {
+            const BOOTLOADER_DOWN_ALIGN: Alignment = Alignment::new(SZ_4K);
+            let bootloader_size = bl.ucode.size() as u64;
+            let bootloader_base = (frts.start - bootloader_size).align_down(BOOTLOADER_DOWN_ALIGN);
+
+            bootloader_base..bootloader_base + bootloader_size
+        };
+
+        let elf = {
+            const ELF_DOWN_ALIGN: Alignment = Alignment::new(SZ_64K);
+            let elf_size = gsp.size as u64;
+            let elf_addr = (boot.start - elf_size).align_down(ELF_DOWN_ALIGN);
+
+            elf_addr..elf_addr + elf_size
+        };
+
+        let wpr2_heap = {
+            const WPR2_HEAP_DOWN_ALIGN: Alignment = Alignment::new(SZ_1M);
+            let wpr2_heap_size = hal.heap_params().wpr_heap_size(fb.end)?;
+            let wpr2_heap_addr = (elf.start - wpr2_heap_size).align_down(WPR2_HEAP_DOWN_ALIGN);
+
+            wpr2_heap_addr..(elf.start).align_down(WPR2_HEAP_DOWN_ALIGN)
+        };
+
+        let wpr2 = {
+            const WPR2_DOWN_ALIGN: Alignment = Alignment::new(SZ_1M);
+            let wpr2_addr = (wpr2_heap.start - size_of::<nvfw::GspFwWprMeta>() as u64)
+                .align_down(WPR2_DOWN_ALIGN);
+
+            wpr2_addr..frts.end
+        };
+
+        let heap = {
+            const HEAP_SIZE: u64 = SZ_1M as u64;
+
+            wpr2.start - HEAP_SIZE..wpr2.start
+        };
+
         Ok(Self {
             fb,
             vga_workspace,
             frts,
+            boot,
+            elf,
+            wpr2_heap,
+            wpr2,
+            heap,
+            vf_partition_count: 0,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 2f914948bb9a9842fd00a4c6381420b74de81c3f..2bfde29dd3602dd150fb6bdb11072d000a32fec8 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -3,6 +3,7 @@
 use kernel::prelude::*;
 
 use crate::driver::Bar0;
+use crate::fb::GspFwHeapParams;
 use crate::gpu::Chipset;
 
 mod ga100;
@@ -23,6 +24,9 @@ pub(crate) trait FbHal {
 
     /// Returns the VRAM size, in bytes.
     fn vidmem_size(&self, bar: &Bar0) -> u64;
+
+    /// Returns the heap memory requirements to start the GSP firmware.
+    fn heap_params(&self) -> GspFwHeapParams;
 }
 
 /// Returns the HAL corresponding to `chipset`.
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 871c42bf033acd0b9c5735c43d408503075099af..19fc4862f3d88c91d741aa951faa24703aa1d1e9 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -5,7 +5,7 @@
 use kernel::prelude::*;
 
 use crate::driver::Bar0;
-use crate::fb::hal::FbHal;
+use crate::fb::hal::{FbHal, GspFwHeapParams};
 use crate::regs;
 
 use super::tu102::FLUSH_SYSMEM_ADDR_SHIFT;
@@ -51,6 +51,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
     fn vidmem_size(&self, bar: &Bar0) -> u64 {
         super::tu102::vidmem_size_gp102(bar)
     }
+
+    fn heap_params(&self) -> GspFwHeapParams {
+        super::tu102::heap_params_tu102()
+    }
 }
 
 const GA100: Ga100 = Ga100;
diff --git a/drivers/gpu/nova-core/fb/hal/ga102.rs b/drivers/gpu/nova-core/fb/hal/ga102.rs
index a73b77e3971513d088211a97ad8e50b00a9131f7..4b93fde8357d81c636eb63528750ec600fa77443 100644
--- a/drivers/gpu/nova-core/fb/hal/ga102.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga102.rs
@@ -3,13 +3,21 @@
 use kernel::prelude::*;
 
 use crate::driver::Bar0;
-use crate::fb::hal::FbHal;
+use crate::fb::hal::{FbHal, GspFwHeapParams};
+use crate::nvfw;
 use crate::regs;
 
 fn vidmem_size_ga102(bar: &Bar0) -> u64 {
     regs::NV_USABLE_FB_SIZE_IN_MB::read(bar).usable_fb_size()
 }
 
+fn heap_params_ga102() -> GspFwHeapParams {
+    GspFwHeapParams {
+        libos: &nvfw::LIBOS3_PARAMS,
+        ..super::tu102::heap_params_tu102()
+    }
+}
+
 struct Ga102;
 
 impl FbHal for Ga102 {
@@ -30,6 +38,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
     fn vidmem_size(&self, bar: &Bar0) -> u64 {
         vidmem_size_ga102(bar)
     }
+
+    fn heap_params(&self) -> GspFwHeapParams {
+        heap_params_ga102()
+    }
 }
 
 const GA102: Ga102 = Ga102;
diff --git a/drivers/gpu/nova-core/fb/hal/tu102.rs b/drivers/gpu/nova-core/fb/hal/tu102.rs
index b022c781caf4514b4060fa2083cdc0ca12573c5b..441f1dc0e5163ea7612b7b950924918cdb6cb5c0 100644
--- a/drivers/gpu/nova-core/fb/hal/tu102.rs
+++ b/drivers/gpu/nova-core/fb/hal/tu102.rs
@@ -2,7 +2,10 @@
 
 use crate::driver::Bar0;
 use crate::fb::hal::FbHal;
+use crate::fb::hal::GspFwHeapParams;
+use crate::nvfw;
 use crate::regs;
+
 use kernel::prelude::*;
 
 /// Shift applied to the sysmem address before it is written into `NV_PFB_NISO_FLUSH_SYSMEM_ADDR`,
@@ -34,6 +37,13 @@ pub(super) fn vidmem_size_gp102(bar: &Bar0) -> u64 {
     regs::NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE::read(bar).usable_fb_size()
 }
 
+pub(super) fn heap_params_tu102() -> GspFwHeapParams {
+    GspFwHeapParams {
+        libos: &nvfw::LIBOS2_PARAMS,
+        base_rm_size: u64::from(nvfw::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X),
+    }
+}
+
 struct Tu102;
 
 impl FbHal for Tu102 {
@@ -52,6 +62,10 @@ fn supports_display(&self, bar: &Bar0) -> bool {
     fn vidmem_size(&self, bar: &Bar0) -> u64 {
         vidmem_size_gp102(bar)
     }
+
+    fn heap_params(&self) -> GspFwHeapParams {
+        heap_params_tu102()
+    }
 }
 
 const TU102: Tu102 = Tu102;
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index f296dee224e48b2a4e20d06f8b36d8d1e5f08c53..05e57730a3c6fa3d3415c6073de55d1ff1b3b40a 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -122,9 +122,9 @@ pub(crate) struct Firmware {
     /// Runs on the sec2 falcon engine to stop and unload a running GSP firmware.
     booter_unloader: BooterFirmware,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
-    gsp_bootloader: RiscvFirmware,
+    pub gsp_bootloader: RiscvFirmware,
     /// GSP firmware.
-    gsp: Pin<KBox<GspFirmware>>,
+    pub gsp: Pin<KBox<GspFirmware>>,
     /// GSP signatures, to be passed as parameter to the bootloader for validation.
     gsp_sigs: DmaObject,
 }
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 926883230f2fe4e3327713e28b7fae31ebee60bb..b2f646c1f02c6d1c5a28e688c6d2d0684b3f31be 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -61,7 +61,7 @@ pub(crate) struct RiscvFirmware {
     /// Application version.
     app_version: u32,
     /// Device-mapped firmware image.
-    ucode: DmaObject,
+    pub ucode: DmaObject,
 }
 
 impl RiscvFirmware {
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 54f0e9fd587ae5c4c045096930c0548fb1ef1b86..5c1c88086cb0dae3ae3547aeb0e15332f1d854df 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -302,7 +302,7 @@ pub(crate) fn new(
             FIRMWARE_VERSION,
         )?;
 
-        let fb_layout = FbLayout::new(spec.chipset, bar)?;
+        let fb_layout = FbLayout::new(spec.chipset, bar, &fw.gsp_bootloader, &fw.gsp)?;
         dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
 
         let bios = Vbios::new(pdev, bar)?;
diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index a0e7ec5f6c9c959d57540b3ebf4b782f2e002b08..ead471746ccad02f1e0d6ec114ab2aa67b1ed733 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -1,4 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use kernel::ptr::Alignment;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
+pub(crate) const GSP_HEAP_ALIGNMENT: Alignment = Alignment::new(1 << 20);
diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
index 7c5baccc34a2387c30e51f93d3ae039b14b6b83a..11a63c3710b1aa1eec78359c15c101bdf2ad99c8 100644
--- a/drivers/gpu/nova-core/nvfw.rs
+++ b/drivers/gpu/nova-core/nvfw.rs
@@ -1,3 +1,42 @@
 // SPDX-License-Identifier: GPL-2.0
 
 mod r570_144;
+
+use core::ops::Range;
+
+use kernel::sizes::SZ_1M;
+
+/// Heap memory requirements and constraints for a given version of the GSP LIBOS.
+pub(crate) struct LibosParams {
+    /// The base amount of heap required by the GSP operating system, in bytes.
+    pub(crate) carveout_size: u64,
+    /// The minimum and maximum sizes allowed for the GSP FW heap, in bytes.
+    pub(crate) allowed_heap_size: Range<u64>,
+}
+
+/// Version 2 of the GSP LIBOS (Turing and GA100)
+pub(crate) const LIBOS2_PARAMS: LibosParams = LibosParams {
+    carveout_size: r570_144::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2 as u64,
+    allowed_heap_size: r570_144::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB as u64 * SZ_1M as u64
+        ..r570_144::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB as u64 * SZ_1M as u64,
+};
+
+/// Version 3 of the GSP LIBOS (GA102+)
+pub(crate) const LIBOS3_PARAMS: LibosParams = LibosParams {
+    carveout_size: r570_144::GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL as u64,
+    allowed_heap_size: r570_144::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB as u64
+        * SZ_1M as u64
+        ..r570_144::GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB as u64 * SZ_1M as u64,
+};
+
+/// Amount of GSP-RM heap memory used during GSP-RM boot and initialization (up to and including
+/// the first client subdevice allocation) on Turing/Ampere/Ada.
+pub(crate) use r570_144::GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X;
+/// WPR heap usage of a single client channel allocation.
+pub(crate) use r570_144::GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE;
+/// Amount of extra WPR heap to reserve per GB of framebuffer memory, in bytes.
+pub(crate) use r570_144::GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB;
+
+/// Structure passed to the GSP bootloader, containing the framebuffer layout as well as the DMA
+/// addresses of the GSP bootloader and firmware.
+pub(crate) use r570_144::GspFwWprMeta;
diff --git a/drivers/gpu/nova-core/nvfw/r570_144.rs b/drivers/gpu/nova-core/nvfw/r570_144.rs
index 2e7bba80fa8b9c5fcb4e26887825d2cca3f7b6b7..bb8074797b550c7976a7432b41841c6bf61bf5f8 100644
--- a/drivers/gpu/nova-core/nvfw/r570_144.rs
+++ b/drivers/gpu/nova-core/nvfw/r570_144.rs
@@ -12,7 +12,6 @@
 #![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     dead_code,
-    unused_imports,
     clippy::all,
     clippy::undocumented_unsafe_blocks,
     clippy::ptr_as_ptr,
diff --git a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
index cec5940325151e407aa90128a35cb683afd436d7..0407000cca2296e713cc4701b635718fe51488cb 100644
--- a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
+++ b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
@@ -1 +1,126 @@
 // SPDX-License-Identifier: GPL-2.0
+
+pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS2: u32 = 0;
+pub const GSP_FW_HEAP_PARAM_OS_SIZE_LIBOS3_BAREMETAL: u32 = 23068672;
+pub const GSP_FW_HEAP_PARAM_BASE_RM_SIZE_TU10X: u32 = 8388608;
+pub const GSP_FW_HEAP_PARAM_SIZE_PER_GB_FB: u32 = 98304;
+pub const GSP_FW_HEAP_PARAM_CLIENT_ALLOC_SIZE: u32 = 100663296;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MIN_MB: u32 = 64;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
+pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
+pub type __u8 = ffi::c_uchar;
+pub type __u16 = ffi::c_ushort;
+pub type __u32 = ffi::c_uint;
+pub type __u64 = ffi::c_ulonglong;
+pub type u8_ = __u8;
+pub type u16_ = __u16;
+pub type u32_ = __u32;
+pub type u64_ = __u64;
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub struct GspFwWprMeta {
+    pub magic: u64_,
+    pub revision: u64_,
+    pub sysmemAddrOfRadix3Elf: u64_,
+    pub sizeOfRadix3Elf: u64_,
+    pub sysmemAddrOfBootloader: u64_,
+    pub sizeOfBootloader: u64_,
+    pub bootloaderCodeOffset: u64_,
+    pub bootloaderDataOffset: u64_,
+    pub bootloaderManifestOffset: u64_,
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1,
+    pub gspFwRsvdStart: u64_,
+    pub nonWprHeapOffset: u64_,
+    pub nonWprHeapSize: u64_,
+    pub gspFwWprStart: u64_,
+    pub gspFwHeapOffset: u64_,
+    pub gspFwHeapSize: u64_,
+    pub gspFwOffset: u64_,
+    pub bootBinOffset: u64_,
+    pub frtsOffset: u64_,
+    pub frtsSize: u64_,
+    pub gspFwWprEnd: u64_,
+    pub fbSize: u64_,
+    pub vgaWorkspaceOffset: u64_,
+    pub vgaWorkspaceSize: u64_,
+    pub bootCount: u64_,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2,
+    pub gspFwHeapVfPartitionCount: u8_,
+    pub flags: u8_,
+    pub padding: [u8_; 2usize],
+    pub pmuReservedSize: u32_,
+    pub verified: u64_,
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union GspFwWprMeta__bindgen_ty_1 {
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_1__bindgen_ty_1,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_1__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_1 {
+    pub sysmemAddrOfSignature: u64_,
+    pub sizeOfSignature: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_1__bindgen_ty_2 {
+    pub gspFwHeapFreeListWprOffset: u32_,
+    pub unused0: u32_,
+    pub unused1: u64_,
+}
+impl Default for GspFwWprMeta__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union GspFwWprMeta__bindgen_ty_2 {
+    pub __bindgen_anon_1: GspFwWprMeta__bindgen_ty_2__bindgen_ty_1,
+    pub __bindgen_anon_2: GspFwWprMeta__bindgen_ty_2__bindgen_ty_2,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_1 {
+    pub partitionRpcAddr: u64_,
+    pub partitionRpcRequestOffset: u16_,
+    pub partitionRpcReplyOffset: u16_,
+    pub elfCodeOffset: u32_,
+    pub elfDataOffset: u32_,
+    pub elfCodeSize: u32_,
+    pub elfDataSize: u32_,
+    pub lsUcodeVersion: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GspFwWprMeta__bindgen_ty_2__bindgen_ty_2 {
+    pub partitionRpcPadding: [u32_; 4usize],
+    pub sysmemAddrOfCrashReportQueue: u64_,
+    pub sizeOfCrashReportQueue: u32_,
+    pub lsUcodeVersionPadding: [u32_; 1usize],
+}
+impl Default for GspFwWprMeta__bindgen_ty_2 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for GspFwWprMeta {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}

-- 
2.50.1

