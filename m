Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2887BAA7B3
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 21:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7D5310E22D;
	Mon, 29 Sep 2025 19:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="L36OlFcD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011034.outbound.protection.outlook.com [52.101.52.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79BB10E22D;
 Mon, 29 Sep 2025 19:36:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fYYq0TFkEVvN3479rjyjKRuoWnCEz1fy5zVlxR9LxBNl7NWGu+D3lXRnxWK+onXQakModLFOwtPqMy3zPvUOjvdsXV+Yr4npzWv1jMQkkyfKMjqfs/1GsJhwdkVUjKBtH35tiUrwG4VxY+fmExp3CDfS0LBIaMoW/UP8jRfZ2SUV9gprF3ETrTUBLxezXcWehNkcXuxvD3hVTHqJHenbz3Ga3sHXKqvxmkXbuIddrfG57+Pcqq2Nd2c/PXM+IcGhri22CKBzaVYdR8JwCiUriQHjMSyERoYT8escgmDw/kpTAGVTO71RNuSjgCwujNlQoOm5hdvesA1dgZV7yqMjMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iNsIpVk65EyhhUPWRPY/2VyAYgQTkGzswOD+son+xa8=;
 b=CgjqN30LlKN4yiS+tfdZcabF8sSl0GJVaXXlRZ3pd+V8KaxgFfEn5rAKofOzp9dViJWLOWNxVKshGcc1+IynaclLN2fNNKFT4O3xQCwb7BjwCvcXE76FvKosPvZKCxoqKJFLW2w+1vS4rEgpfYIdttC93ceE+Gf0JJe0M7LB1eDQ7smTF44NpXTnLH0COIABtj1Smxj1D63/aak2eZ4T/fAIu7GINGJPyBZayduQi3gy/TJHNJ36cvQxuGvK+QdPUFSI6CDvhLMWn/7eDV8Mi5ILusAnjAk74Ix+EVtjGPUPKQSx+XtBOUmdp7SuaBiI6mD1k/Mcx8cOfTZMs7RS4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iNsIpVk65EyhhUPWRPY/2VyAYgQTkGzswOD+son+xa8=;
 b=L36OlFcDOoSGgoqYB7DVAN7x4zx3lMC3rrsi0zcfFwQQiUOIzRsEXixzF1GyxsM6SMb2CawZwZMpSCtE38fBwacRVt+bbaFrD38luVFiql86tiuJYVHSM9j9COgzOf1Gtx2OA6Xuv9HqLL7n+EfbQT6Vt9uTohZWblCrChTLJScNEGCBi2yUzmPFxqGWI5vxwiieugdl0g3YZphfsu8f0pau4GKyd64T8xJI/ZqgcqZaey2xaOTKFty+aHp3P7lLRCsc+HJdiweC/Eo8vYRZ8zwzNCYvnrMVIX9WYFxfo6WMCck1u9nKgnU6avG4mHbQcARXZWtImpKr40v8jUUJQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 19:36:12 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 19:36:12 +0000
Message-ID: <ae415df8-612b-4850-9749-660ae8629b1c@nvidia.com>
Date: Mon, 29 Sep 2025 15:36:09 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/6] nova-core: bitfield: Move bitfield-specific code
 from register! into new macro
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>, nouveau@lists.freedesktop.org
References: <20250920182232.2095101-1-joelagnelf@nvidia.com>
 <20250920182232.2095101-2-joelagnelf@nvidia.com>
 <DD52CATR8C30.1SXPZH285XBPN@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DD52CATR8C30.1SXPZH285XBPN@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR06CA0022.namprd06.prod.outlook.com
 (2603:10b6:208:23d::27) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: f3bfd71d-af52-4c2a-97fc-08ddff8f727b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlA3djhlNUxhNktwZCtsVVNHRjVQNFN5d0pHb0c1akRFaDRnWmlGemRpTVBB?=
 =?utf-8?B?b2hmMWdQMEdxZ0Ftc29SdEJLZGg4VzVtdkhwTVQ3ckZBbGNrUWxqa2RWbklk?=
 =?utf-8?B?ZHc3VmQvdDFpSHZHdmFrOE1YZW9wRW1oVkdBOVc3RDVNZnNKT2wzL2JDOGVt?=
 =?utf-8?B?L3NpMTM2bStneE5ERFIvQTNUUTJkck9FUUhtNzBDUU55U3BpTEdKSkt1YW5C?=
 =?utf-8?B?b3VtMENZOEF5NStWT0lxNHBKWUFJUzEyMnp3aFhzemUyb3gwV2xQcGxtbCtL?=
 =?utf-8?B?dk4zQUtpcktWTTRZMEdHb1Y4cnhEY205WXZnRlIySStCaTVVVGtiR25KWXJU?=
 =?utf-8?B?b0lnTVh2UTQ4Qmp1d01rbUl3OVY5aHNMaWZNQU8vQ1RsSk9lejFRclhFWERR?=
 =?utf-8?B?L3EyeE1HYkU5ZUlUZVBSRVNQNUZ0cHlFVENSUDhpakp2ZlJ4RkZET3VTWm91?=
 =?utf-8?B?QWt3RklzSi9EenFkTVMwWjB5U25xd2dubTlwbGsxZEJKNG41NVRsZnNYZFJn?=
 =?utf-8?B?ZEE3am1jbDV4dCtCemtSL2dESmkwcC9IZmtmZHU2akY2ZGNjaWJ3dzFBYzZS?=
 =?utf-8?B?VjVzcmNXZEd0a2d4QVlOTmZBWDRFSW1OR3lRRW54enhKUXp5bjZ5RnJzWVFY?=
 =?utf-8?B?dWEvMnBnNCsxb0htOFFWVEw4TFNSc2x5VE84aHE0WlpqN2gyMC8vcSthWFR2?=
 =?utf-8?B?YThsSU1ScG9aVkVZK2lvdVVURCt2VGt5ME5Gb3NyUWtEUjZMM0dxbUZiK0V2?=
 =?utf-8?B?emhYd1JNbEtKSEJWeUExd1RLTEh3TStHR3cyR21BeG9PaklrZ0YyYWdJUmJP?=
 =?utf-8?B?Mm9HWEZzeHp0eEhwQ2lwZy9mNnA4QjRDMDR4ZW55a3F3T2dvVnh6MVd5SzB2?=
 =?utf-8?B?b0RPK1N2TXNvZXJ2SitIU3lSbSswdDRHNEUyVHBlekNicVg2UUNVQ0wxVnpL?=
 =?utf-8?B?R01pRFl4d0lIS09aTXZVZEl6TTdlNVhkTDBMUTg4L0RFQk1vcU5pSS9reFZL?=
 =?utf-8?B?TVZHWWhmdzVrcnE3MFI4dXpPRytLVkVMN0RidytqdHRkUFE1dU5oQlFqVGFi?=
 =?utf-8?B?V1R1MXEwRG0yKy9HalZ6azBuNjlsTCtzNUVjeXBKU1dzdk5PR0tBSk1wcjJo?=
 =?utf-8?B?U0s2TUpHbEhyb05WZTRLZzI4UGJzbnA4Tk5PVkU4VzdEMjllUE9lbnpCZThN?=
 =?utf-8?B?cHZPYm5JcVhtZEtXUm1pcFFQL1VSWWVCaEhJc0VaSWJ0YWg1aS9najUwTWhR?=
 =?utf-8?B?dkdZZFVmd1BMdHBDcm04aFdCMWNtWE45M0l2aGVGV0ptT3JEZHNpblJWRVYx?=
 =?utf-8?B?NWc3QVQ5cmlYQ3l3OUVrUGVSOCs4aFlRRzRQdWlMNTJ5ZlZKaHFyQVpNaXR1?=
 =?utf-8?B?TWQ5b2ZadXNXUWVoOUVyQmFFckZXVTczWEthbkVWNVlqcW1JK2I4cXBmYUcz?=
 =?utf-8?B?RHR3aCtLemVpT0gzemxSY0NuL2JFZVBZS1ZGVXZGWGhOQ3o0VmVpa0JWUXRl?=
 =?utf-8?B?RXBnVEVHejN2MVNxbnY2MmdlVG9EY0dqd1Z6UktabVpSdE54a3dOT0lpcStG?=
 =?utf-8?B?ZFJZamFzcmExeTFVZTJqaW5lSjg3UXhFSmxoempqZTVpZWVOTVh4aVY1REsx?=
 =?utf-8?B?Tm12THBxalBmdkVrdEhSdk10K1d1VTBqdHorMzFtQTdDOGZJZnd4YzY5bllv?=
 =?utf-8?B?Zi9qK2U1a21FWG1ySFR6akNQKzdnalNzbzRJY1BTRWRBUXlBVElRRmJhQXpF?=
 =?utf-8?B?bE83MWpYUWJyRkdRNHhWODgycElHYXFKK3lYSHR4M3dXSEFiT0VhY1Z0cjZ4?=
 =?utf-8?B?NmZYZjZzS0FaMkM2RlZaL2Y2MEtWSXpWQzV6a1pic3h4OGxqcnFVUDlyY2g2?=
 =?utf-8?B?TVgya3pqMU5tVXIyd1lVM1NFd3FMd3NZNkVDOE9PaUs5M3VNTm8xVFRFNnVO?=
 =?utf-8?B?RU0xdHZuaGIzME1TU1JaWDN2Ti9JY0V4TGNyVDViRWU2Qk1jSVlTdXM1WjdE?=
 =?utf-8?B?U0l3eGV1Tm53PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWpxdXZKcDA0b05HWmpSWXN0U1dGeTBVd1FicmJpOGszVnBjUEpJcjBnRHor?=
 =?utf-8?B?QVlPbjVrWG1sYU8yYjVHQ2o3ampUZjE3OWRxeHo3NUdaSkppSlFiV0hFaGJJ?=
 =?utf-8?B?bFdyWHBOREZyQmRPeVk3Uy9CWVNEMThUNEZnd2k5ZHd6Y0ZwREFHK1lGUWpv?=
 =?utf-8?B?NkxJTFVneWdzVURZdEVENWx5L3ZsbEFua3ZVTllKUEVyVXY4UmZpZUVjSVNN?=
 =?utf-8?B?VFhuSDRnNVlIRUhNWDRuTGVOWGdGNHpVYzhOR2t1ZXRlSkIzWVpTcmZWWUF2?=
 =?utf-8?B?cjR3dGk4WmlTRlNBRDAycXljNTV0amNYWVc1alNqZGN1RGVLOHpNaHlGcTNT?=
 =?utf-8?B?dDRJbkdYb0ZMQkRHWXF2UjhiV29EYlFVZmlRNnE5WWV1T2tyNDJtMjB2dERX?=
 =?utf-8?B?VVZNdHE5SlNweTFYWUIwUDNjL3R0bklsOUR2RWNxblUyNkUwQTc4TFB0Mkxy?=
 =?utf-8?B?SStCTTdsK0NhMFFaczJINDUxT2hTZWJCRW5EajVNeSsyMlpKcTVHMHpkMG4y?=
 =?utf-8?B?MG5RYmtENGdabXV0SHNib1VDN1NwVVBNYW8rOTN2eGFxVndsSTVoOUhzQnhS?=
 =?utf-8?B?QXo1YzQ2UUVXS1Z4dTZwS0FUbWhuVlVJdUd1TEhEWFZ2RTdEemE2YkpoZjRW?=
 =?utf-8?B?amcyRVBDdDJaVzVqMW5kRHdneGFxSlI2c1doanFSV1R1WWM2N2JHTDY0K2Q3?=
 =?utf-8?B?bkVGUEdvT1VBS1FUa0ttditwQ0FoU1IxZG1xNnJ3dHBtOXRnOS9xNUtXanVV?=
 =?utf-8?B?K1MxU0poYlliKzN2NGkyeDZsMzVkZ1F1Yys4S25oR0FuYytsa0ZKUEpSQS9o?=
 =?utf-8?B?SmJaOE5FMWRqYlYwVjhYZmx2Zy9JSjVYY2xUZ3VZditXWXlCMVU1NjJyZmpY?=
 =?utf-8?B?UmFzV2dxcWVYZWhsWjJTU2RybXo3Lyt1TGJHUWhrTEtWRTFGbTk5NjRvckRZ?=
 =?utf-8?B?Si9lUDJJRlZLbTQ4WmpZSG5qTjlsTG9SRXUxYVkyNm9qQjlCc0sycTdTcm5n?=
 =?utf-8?B?aGtXVVZqSUNoQjdTK1dnRWpBLzc1Z0NNSmFTQkZGS3hwWjdkZEVvdnB6NXJU?=
 =?utf-8?B?N3dyZzFERkg4NUhCbzQyQmhXUHMzL3FyRXIxRHQ5YWtpdVlEY0F0Z0prZ0pH?=
 =?utf-8?B?MGdUZDZLZkdrYndsRU9lTGZaRHduWE56R3RWemFoOWEyTUdPR1VBQU9WQ05n?=
 =?utf-8?B?NHg1VUREaEdpaHpDaWRPUk9BbDFSNFR4emNSZnVoV3MzU3NrRHZURHBoU3lY?=
 =?utf-8?B?RWl0UW5kRU1BUmFtaXBkY1RiZHpGSTI1aU9RMnVZcE9YUW9tbXJCT3JnNU9E?=
 =?utf-8?B?aUhxbG9aR3ZDWnhiSVFDMXMzVmNyQVpsN1NJelpCWW5VVVpqUUVlYkhmY2pk?=
 =?utf-8?B?Z3JRaWkyZXpZOU9zUUUvVWRQUEtPalcyRHA1Y3FDclpIckk5UEVFL2xDZGo2?=
 =?utf-8?B?UnhLVGlmaFMzb3RHcEJTQUxkenBYQnByd0JDK2N4dHkvK3h1aDJCcDJXL21S?=
 =?utf-8?B?eDJGb2UzSDF6ellmWFJPaFlVckpWMEhBSVl3SHJmYTNuREREYUxDS2xpd3ZN?=
 =?utf-8?B?R0h2VllaR2FJWEV6dUsxMGk5RUt3VHh4eUJSdTFvbDFvNFNoU01lMWJQVThm?=
 =?utf-8?B?V0wvOHhGaWE4R1pRc01Ga0R5cUI3UE5kQVd5VE9SdWxibmFGYTFBZXNtSHMz?=
 =?utf-8?B?WHZxeVFQVjJOdnI4dFZ2a3dodFdWV3FjdWx1M3VHaytVTzFaRmkxNkJ1c2Mx?=
 =?utf-8?B?SHYwOUtoQ3RDaVlzUEtMd08zSFBQaGZtdnhTTVBycm8xdVBoMDJJdmNiMmhz?=
 =?utf-8?B?VUpQWWlYSmZBbVBCN0g1dlJWd1FOeXBleU1SWEpFVitWRXJJWDJvWDFlNVBu?=
 =?utf-8?B?WEJLZXJhWCt0UU5uSE9SK2FlUTdOV2plNlhpNnl1K28vNHJlTTB1UDIwdnZ2?=
 =?utf-8?B?MThuYW5CaHNXd3ZwMWJuTkNGWCsvcVJSY21KSXh1aTJtWkpiQUQ1eEI5RzRB?=
 =?utf-8?B?anNrdFVkYkZxYXJ6OWZjdDZOUGlmL05hSzI3RWZYU1ZQZDZuTDU1YldKOTJj?=
 =?utf-8?B?bjcvSml2SGdCTnUrcVBaQUlBc3lnNnNqcEJJT2ZWVXdOc25POTJyZkdrNDdv?=
 =?utf-8?Q?PE11AssNjZhUaqoe7xjItTD+n?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3bfd71d-af52-4c2a-97fc-08ddff8f727b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 19:36:12.4138 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KiQCB7kZq93/q5FjSfYxXSkaDiA3flKNKtBTVFdTJWtbJTY8VRkbKS8jD2opeBehd1mWpe3bWpv9WSB4sJuYlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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



On 9/29/2025 8:16 AM, Alexandre Courbot wrote:
> On Sun Sep 21, 2025 at 3:22 AM JST, Joel Fernandes wrote:
>> The bitfield-specific into new macro. This will be used to define
>> structs with bitfields, similar to C language.
>>
>> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> 
> Very clean. One nit remains below, in any case:
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Thanks.

> 
>> ---
>>  drivers/gpu/nova-core/bitfield.rs    | 314 +++++++++++++++++++++++++++
>>  drivers/gpu/nova-core/nova_core.rs   |   3 +
>>  drivers/gpu/nova-core/regs/macros.rs | 259 +---------------------
>>  3 files changed, 327 insertions(+), 249 deletions(-)
>>  create mode 100644 drivers/gpu/nova-core/bitfield.rs
>>
>> diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
>> new file mode 100644
>> index 000000000000..ba6b7caa05d9
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/bitfield.rs
>> @@ -0,0 +1,314 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Bitfield library for Rust structures
>> +//!
>> +//! Support for defining bitfields in Rust structures. Also used by the [`register!`] macro.
>> +//!
>> +//! # Syntax
>> +//!
>> +//! ```rust
>> +//! #[derive(Debug, Clone, Copy)]
>> +//! enum Mode {
>> +//!     Low = 0,
>> +//!     High = 1,
>> +//!     Auto = 2,
>> +//! }
>> +//!
>> +//! impl TryFrom<u8> for Mode {
>> +//!     type Error = u8;
>> +//!     fn try_from(value: u8) -> Result<Self, Self::Error> {
>> +//!         match value {
>> +//!             0 => Ok(Mode::Low),
>> +//!             1 => Ok(Mode::High),
>> +//!             2 => Ok(Mode::Auto),
>> +//!             _ => Err(value),
>> +//!         }
>> +//!     }
>> +//! }
>> +//!
>> +//! impl From<Mode> for u32 {
>> +//!     fn from(mode: Mode) -> u32 {
>> +//!         mode as u32
>> +//!     }
>> +//! }
> 
> Jesung's `TryFrom` and `Into` derive macros [1] would be greatly useful
> here, I hope we can merge them soon.
> 
> [1] https://lore.kernel.org/all/cover.1755235180.git.y.j3ms.n@gmail.com/

Ah nice, looking forward to it!!

> 
>> +//!
>> +//! #[derive(Debug, Clone, Copy)]
>> +//! enum State {
>> +//!     Inactive = 0,
>> +//!     Active = 1,
>> +//! }
>> +//!
>> +//! impl From<bool> for State {
>> +//!     fn from(value: bool) -> Self {
>> +//!         if value { State::Active } else { State::Inactive }
>> +//!     }
>> +//! }
>> +//!
>> +//! impl From<State> for u32 {
>> +//!     fn from(state: State) -> u32 {
>> +//!         state as u32
>> +//!     }
>> +//! }
>> +//!
>> +//! bitfield! {
>> +//!     struct ControlReg {
>> +//!         3:0       mode        as u8 ?=> Mode;
>> +//!         7         state       as bool => State;
>> +//!     }
>> +//! }
>> +//! ```
>> +//!
>> +//! This generates a struct with:
>> +//! - Field accessors: `mode()`, `state()`, etc.
>> +//! - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
>> +//! - Debug and Default implementations
>> +//!
>> +//! The field setters can be used with the builder pattern, example:
>> +//! ControlReg::default().set_mode(mode).set_state(state);
> 
> Missing code block for the example?
> 

Ah, sure, I will add the setter into an example as well.

 - Joel

