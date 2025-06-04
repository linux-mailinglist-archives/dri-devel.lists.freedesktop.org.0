Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2BCACD6BF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jun 2025 05:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB82510E1C1;
	Wed,  4 Jun 2025 03:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b7WSwkEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01E7710E111;
 Wed,  4 Jun 2025 03:58:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Uy3fam3PUFVAxzRpGOylxTpPu+V7K6NTuo41Kvcg1vxouP5EZYIZ5oO+AuuaItyIgrNNHdlHp9jsBC6sM8lrHsy+zvwtl3jjPXZA7OqnQyQcgEJBalJjsZKUcl7RRGia1Jncs/W44CmhFyU1C1t3TpQy/mOneqhlEHS9vhbJAXdqM8GVPwRjT67tJXZcO4Iw/s0c02nCTNqnLX9jkm1QC8IUFAujWKLZiNS4y70OUUr/StJQs1TrQDDMGOgECMvitH3x/zBdbUmaRw1lYSJgBcZF82L+vxksTGrG4wglp4Rt5CyUzvZypqREveT+ggTa6PVB4LC3Fpwcd7VIcF8tmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KvcX4WffaF1WnEexaONW4pEAAS/RCJ9kz6B/qitR/fk=;
 b=jTKsgWwHsoctfh29uBKvamib040z/CA0leFSjlvH6RnSA09iddXEV7HYqOlxBL8X23PSA4R6uO9NvHy4OqbZdm08Hyv8c7q6mY1XfP3GlhuE0YOMMHOcoV9aq2/sM9A+C3En/nJh02MMg5FBpFxxmfRa1uySHnQdajxDXACoUU8otg6vxQbR0ElJS2JrvXE5Id2YPQh7Ci42C7waYpjOs+Lhe/E4vrIc6k6FoM/INRTY58XMbdHgqI1VWYaONoHTvsaw57FsKpMR6yMLvY8MYsqfCOxIeocOPBu7rMGXcK9P6VweE2ulmIT2z4mQiIeoQR1GcWtvtsJaoruaBzUp/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KvcX4WffaF1WnEexaONW4pEAAS/RCJ9kz6B/qitR/fk=;
 b=b7WSwkENqNET/xaoVRGDtMw1W94ubJG/S8woz4MxaZNYZ/dCrrNMABxkUpUFTwn430mc2Av5HlmwdrPVzflOy3gnf1yuxtgDuYlLGmOit4G+yhXvl9UmsaR+NpsBgvbFQU5fghk3bAb8X+uefd3waHWawf8CgX0ydHkN4lRfBveDKg/SCHaTNvdmdFh7Ks0xQhps6JPP2yEZjnUy5bHzN2RuSPH7hsBJ+0xZKe3G2bUFQcQ0ztzkm9JCti8i7PwJS71wUCXDTUvwh1XNnFeC3sQfgTUE4Hui8y1M8NNeIHnARGav4RW0jo+8ssevtUtRcTLFP5Y/gIuoAbonoAJs7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS4PR12MB9659.namprd12.prod.outlook.com (2603:10b6:8:27f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Wed, 4 Jun
 2025 03:58:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 03:58:34 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Jun 2025 12:58:29 +0900
Message-Id: <DADG4KHEFED5.1YMMF99ZG9YQQ@nvidia.com>
Subject: Re: [PATCH v4 15/20] gpu: nova-core: firmware: add ucode descriptor
 used by FWSEC-FRTS
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250521-nova-frts-v4-0-05dfd4f39479@nvidia.com>
 <20250521-nova-frts-v4-15-05dfd4f39479@nvidia.com>
 <aD2YY_zpo01rYkgN@pollux>
In-Reply-To: <aD2YY_zpo01rYkgN@pollux>
X-ClientProxiedBy: TY4PR01CA0009.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::12) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS4PR12MB9659:EE_
X-MS-Office365-Filtering-Correlation-Id: 61055ca2-11ef-415b-4b54-08dda31c1382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|10070799003|7416014|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SUEvOTh3K3hsazFwUytpWHByQ3dJTEMrdFZvV3ZJaFZuM1k5NmJ1NWlja2Zr?=
 =?utf-8?B?VU1aVzFoaTRLaTg0NmpueW81ZlRkeFNWRHJFS2thVlNrQUhrRHBYdWNrKzVu?=
 =?utf-8?B?NWU0akhWOG9DWW1JY3N1YTJETCtsTXBueFh0TkVma08rZG1KQzM4UFpuMkxV?=
 =?utf-8?B?MGExL2UvMElKcDk1M1htWTVZYkZGMFd4cU5uZnlmeG5qTGo4UloxaXpUYVZt?=
 =?utf-8?B?dU4ramxuV1NwS1FOU05SMUp3am8rN2VlZGN1LzlLTVcvcUJ0aGpjbENab3RK?=
 =?utf-8?B?ZFFKclZZaU1XNHo1dVV2ZkFxdTNjWDk0enpjcTNkVlZwNjV4VkMvTVdKbzgr?=
 =?utf-8?B?Nm1HOTFxTXVjQUEvSGFra29tY3ZZNFhTWEFZS3F5WHVhYXV5YmJGTng3RXFJ?=
 =?utf-8?B?bUxnMzBWejI4cVB3eFZ3d0k5ZDlCcEFmNDlYYy9QWFRWa2xEaklyRWhBNUJl?=
 =?utf-8?B?S0FtS1Q2aU5ieFlmNmRZTWFwU1ZpMjl6L1QvKzVLblM5QW5YRlVyQ3JPUmxp?=
 =?utf-8?B?Y0ErU2R5QStSZTk4czJTdVNCQXF3SG9HOVo2aDk2SnMrZjdxdCtnNUdlRHhG?=
 =?utf-8?B?UkoyQ2g4dE9RUGtNNWVHUFlBeFZKa1J6cnI2NEFIZm5VWlFkQS9JRWVSaUZz?=
 =?utf-8?B?V3dGSThkVGxwVWd4anNnc2RtY29KT1dXL21pOEwwQUdraHE1K0I5clRkRUFK?=
 =?utf-8?B?dGpjODBOOHhUNzNuNEVLY293SmRJYVlVZk9VRUVTaWEvSWh3dlNYcmo0TFEr?=
 =?utf-8?B?aVJHQ0FOd3BNWFJiYXZaZG8wNjBrdjZBaCtIQlhSSFRtSmV2MFRQODkyS3R1?=
 =?utf-8?B?NFJjNkRMV0o1OUFEbm02OTBEYyswNUpWdVF6WGFMT0dreW9zTm41b3R5eUdN?=
 =?utf-8?B?L0ZYNTVldis4SE00T1FaRTJUY1paaUFVVTNOKzJob0F5aDJLZ2ZKYklmMlZo?=
 =?utf-8?B?V0twWGxNbFI3NkFRVjNoVkJiYmRCclRDYU5RN3FGOThVWnJHWnFMMHdDSWo1?=
 =?utf-8?B?OW9BN0p0bzBWMVV3OVRnMnRPVnpFSmRoSmN0RlpaL2czTkZHSHBsRmVXd1FP?=
 =?utf-8?B?dERpb3dIdkM2ZkErUnhaMEFWdy9MNFhhYVlmTS9YUEhCSWx6Rk5CbHNBdFV4?=
 =?utf-8?B?TkQ4WXViOE9JUWxZbHRzMGpKeVBKcThOUzNERnRiUjcySzIyZXd5cHBHMHN4?=
 =?utf-8?B?MFhwWTB4MnhvZ29KU29POC9wclZVUVo1T3VJamNJc0swWVdybjd3WHkzOHRh?=
 =?utf-8?B?ZEYzRGlUOXZkU21ZMWwxVGlYSEhFYVJRN0JwSVNoUEs4aGlMa2g0bE1vSEln?=
 =?utf-8?B?TFgyaW1vWEcyMkZmVXhKR3JGRmdmRVd6RUtCZTNBMlhDbUZMekZLbHdzRFRa?=
 =?utf-8?B?YWNrODZjZ0JqUUE3ZjVwWU5uYndlN01WenV0Z2hRNnArZlYxYkp5TDFnbUhr?=
 =?utf-8?B?UytaejZLQk5yd0FCcEtOUHdyaktrREI0RE1HTWU0N1kyVUJwQjRtbnFkSi9s?=
 =?utf-8?B?U2NNYVh1ZUNRVWtGbzNwUERIeG5nTHYwc2JKTWhUT1V2cDVSaC9obkRtajJr?=
 =?utf-8?B?QjJNcC8yMGxnbENneXlGeXA5Y3BvdmJTQys4NEwxaXNnR3BRcm0yUVlFRXNS?=
 =?utf-8?B?bWV4RXlZY09CekZmeitqMWkrMzhlZ3FzTUs0ekF1Zys5TEpYWjg3cS9DZzQ2?=
 =?utf-8?B?dFowQkVPN1k5a1doSHdXOEdOaDVVQStDL0ZvcmZBazNsY2VnOWdvKzRGMFAz?=
 =?utf-8?B?bzExZUJndStWMDA3YklHN0gwQ2NvbzN0dFRZWW1ERExWWXkzMWtOK0xTODR5?=
 =?utf-8?B?NTRSZy93UG1mcy9VV2xzOGhhK1YvWm5aRktvWlhKWWhGNytkOEJFTll1OXJz?=
 =?utf-8?B?MEVaZGNSK1Z4Z3lNQmorSC9qeEhIcllTRmJBYW1BMkNlZjErWG9BMTZkNENz?=
 =?utf-8?Q?LVfK198unAQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(7416014)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ME90bjF0T3hQY3JQRFZTcWFxUDlmVUlya3V3RWVNa2Nta05ScEhaV3h2WW1m?=
 =?utf-8?B?bWNVRVNyUnZzWEkvQ0FVdEJGNXpIaUZHVjRUYitsRWJ6YWswdFgxWFQ1Mjk3?=
 =?utf-8?B?dm5neHpzWnNtMndYcVhIRmhxWGR6NXpGcVQwKy9ObXdNNmxDSFF6MndwRmht?=
 =?utf-8?B?QXA0MGp4d01DVGZYMjZXRmFieWlqdzlLR25mbm04ZFU3R0xyNEdWSjE4VUgw?=
 =?utf-8?B?QmZYSFZTUzI5M29JbUNYa3dCL2E3MHlRbnM2eGZNc2IrL1FvMzI2MHhBMTlE?=
 =?utf-8?B?Z1c1MXZOZUtYRVJQK21UQjRqOHNBaXk0bHBaN3Q4emU1aUFlaFFEeE91QTl2?=
 =?utf-8?B?QVh0Q0twMzd0OUozZTFLaGdHTHl2Q3RwRlVKa0YrMU0yU3AxSHBxWmlhRVhE?=
 =?utf-8?B?dTU3NVZad29rVVNiQUtCUE5QYlppUTVod29TOHI4ZjFjdmlWVnJGT0VnQ3NJ?=
 =?utf-8?B?TlB1T1IxNXE2WVdIamE3TjdkcktWT3RJMFhrOU9jVjhYRDh3NXVLZFBMQUlh?=
 =?utf-8?B?ZTVTenZxL2l4cnMxLzMxVU40TmxRTmo1RHoralVweE1JaEJwdFEweGtSeExw?=
 =?utf-8?B?QmpFbW1KNThaMGxleHNVd0RtU2pYc1NmRUxyMnJTOUgyaDQwQWhmVVBPYnEx?=
 =?utf-8?B?NVJyNGsyRW00Um5memRSY01VYVdsSzVjVnk3cGtETUs5KzM3L3NYb0ZMYUpD?=
 =?utf-8?B?Uk5OcnBUSHEwK2ZHNkVLOWNvYmZZMWpSZkJCRFNXNG1XMEdIMWY2R2pTMDNE?=
 =?utf-8?B?Q3J4MnI5NTN2czRWekJQQ3d6cHIranhWejFWem5jYVJzZGE4YnpKOVh0dWU5?=
 =?utf-8?B?UERtVEcwcitKU1FvQzFudXh2Rk5RaDFBSmhQdC9DSmdzMTlxSTNKcDhxU3ZY?=
 =?utf-8?B?eHRvb1AwdEJOWlJzN2kzOTZaQndTMG45SEY1QXprTHRLVTAwN09ZN1pQMmht?=
 =?utf-8?B?YTIxeGtmbnVTbC9oRFpJTGUrRldnMWkxdFc2Y2tCQkRraHZaMXBpb3hWM09N?=
 =?utf-8?B?K3ROa3FRZy9kbVlHSzc2Z0NBb0E4VUFNUHVoejhOWWUyZldnQkg4OEZaYnZI?=
 =?utf-8?B?VTIyQkc4bTZ6cUY5blNCZmREUmtyRzR5MWxGa0hjcXVZaWJqVDVYc0JmdEo2?=
 =?utf-8?B?OEFNQmpYYnBsM1dYMHhPWDRZTUVpNSs3TG5uMlpjczV6bHBZT25BUGFzUktV?=
 =?utf-8?B?NTE0NStWeGVvSEVkcEkvMjY1SmhIZDlZTkpOSkx3c1YxR2JzUDJhcC9IZVR6?=
 =?utf-8?B?dStnR29IWDJyV1ZmbmEwM2t4M0VrOWErM1d4aU0vMExLZy9MdFJOYWNWcUJt?=
 =?utf-8?B?aHBPeURyQjlHbDlLZWEycGl4YUppa3hkWXRUcVdKOWJhQzJOejlYM3JBaEkx?=
 =?utf-8?B?clk2L3BsU2N4QWg5SnBRS2hVM2ovcVRjSXdCN1V5bERoRWllN2pmbXlyYU41?=
 =?utf-8?B?Y0ZjMDh3b2pKMUNzWDMvOGw4ck9GU3NRd1FhWHV1QmUrTmhpWnlYdUdDamtN?=
 =?utf-8?B?bUVxdDlEQy92VWNQM0VaS1dDOC81Vmw5RklUL3dBVEUwM24vNFNuUC9mc3Qw?=
 =?utf-8?B?eGx1QkVPVk1URENld1lRUUV0N2ErL3Z5Slo2VlNtS3BJNnJhSVpZcmVhZGJZ?=
 =?utf-8?B?dXBRczFQaEZyaU9mZnJMR2hSczliT2tkTHcwM2p0cUhoTFFhU0I1SnJLRHdm?=
 =?utf-8?B?bHo3WFpRay9QRmYyRXppbGZORzVUTGxQdnVweWJ5eGdYZFAvKzVNSFNtakMy?=
 =?utf-8?B?SmEvTzlWNHB6NHh2UzZxY0NYQWtXTk94cXVwVnFiaHJmT1Fjd2dXK0VZV3RI?=
 =?utf-8?B?OVRsb2lQcTFEVzduTTVSZUczRFFzRWNkYjhjR0FFQ2ZKclE3czRwczFnUzBK?=
 =?utf-8?B?TDQ0ZXdkUUc4UWJCMzZ0NElMM3NzSk5WMHBHaG1kVXNhQUhOOW1GenYxSURt?=
 =?utf-8?B?R2FGaTgrVEFINjRqVmZpalh6UUhaMDk1eVJMbUJDN2J1Ym02akd6b1dCQzNR?=
 =?utf-8?B?bEpGYjdUd0tJNDVjWEpaTThoc250OVY2QThnN2hzdFZFanAxeS9sTGd4SDhm?=
 =?utf-8?B?c3h4bkRVZzZrTkdKZzlYNkNRVGUvcWhPUndZdjVJL3JIeVIxemVhek55Z1B2?=
 =?utf-8?B?RmlOckFHK0J3eXAzT0NGV0tWV2Zkc29TY29ZeE5nd1RpOG82Y3pWNUprQW0y?=
 =?utf-8?Q?LRp+EeQhD6Qmh7O5tHuFlLXiyx7ye2/8D4uFunvfH7LM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61055ca2-11ef-415b-4b54-08dda31c1382
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 03:58:34.5945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTVKGOTWNuRlwf4vyB1Om5i65mHI4NpdnsxVoKzi/CKWcUNGs9rUbAlp+Tbb/u6J7mS9KxhQQ20lvDLnBlF7Yw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9659
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

On Mon Jun 2, 2025 at 9:26 PM JST, Danilo Krummrich wrote:
> On Wed, May 21, 2025 at 03:45:10PM +0900, Alexandre Courbot wrote:
>> FWSEC-FRTS is the first firmware we need to run on the GSP falcon in
>> order to initiate the GSP boot process. Introduce the structure that
>> describes it.
>>=20
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware.rs | 43 ++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 43 insertions(+)
>>=20
>> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/f=
irmware.rs
>> index 4b8a38358a4f6da2a4d57f8db50ea9e788c3e4b5..f675fb225607c3efd9433930=
86123b7aeafd7d4f 100644
>> --- a/drivers/gpu/nova-core/firmware.rs
>> +++ b/drivers/gpu/nova-core/firmware.rs
>> @@ -41,6 +41,49 @@ pub(crate) fn new(dev: &device::Device, chipset: Chip=
set, ver: &str) -> Result<F
>>      }
>>  }
>> =20
>> +/// Structure used to describe some firmwares, notably FWSEC-FRTS.
>> +#[repr(C)]
>> +#[derive(Debug, Clone)]
>> +pub(crate) struct FalconUCodeDescV3 {
>> +    /// Header defined by `NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*` in O=
penRM.
>> +    ///
>> +    /// Bits `31:16` contain the size of the header, after which the ac=
tual ucode data starts.
>
> The field is private; this information is much more needed in Self::size(=
).

Indeed.

>
>> +    hdr: u32,
>> +    /// Stored size of the ucode after the header.
>> +    stored_size: u32,
>> +    /// Offset in `DMEM` at which the signature is expected to be found=
.
>> +    pub(crate) pkc_data_offset: u32,
>> +    /// Offset after the code segment at which the app headers are loca=
ted.
>> +    pub(crate) interface_offset: u32,
>> +    /// Base address at which to load the code segment into `IMEM`.
>> +    pub(crate) imem_phys_base: u32,
>> +    /// Size in bytes of the code to copy into `IMEM`.
>> +    pub(crate) imem_load_size: u32,
>> +    /// Virtual `IMEM` address (i.e. `tag`) at which the code should st=
art.
>> +    pub(crate) imem_virt_base: u32,
>> +    /// Base address at which to load the data segment into `DMEM`.
>> +    pub(crate) dmem_phys_base: u32,
>> +    /// Size in bytes of the data to copy into `DMEM`.
>> +    pub(crate) dmem_load_size: u32,
>> +    /// Mask of the falcon engines on which this firmware can run.
>> +    pub(crate) engine_id_mask: u16,
>> +    /// ID of the ucode used to infer a fuse register to validate the s=
ignature.
>> +    pub(crate) ucode_id: u8,
>> +    /// Number of signatures in this firmware.
>> +    pub(crate) signature_count: u8,
>> +    /// Versions of the signatures, used to infer a valid signature to =
use.
>> +    pub(crate) signature_versions: u16,
>> +    _reserved: u16,
>> +}
>> +
>> +// To be removed once that code is used.
>> +#[expect(dead_code)]
>> +impl FalconUCodeDescV3 {
>
>     const HDR_SIZE_SHIFT: u32 =3D 16;
>     const HDR_SIZE_MASK: u32 =3D 0xffff0000;
>
>> +    pub(crate) fn size(&self) -> usize {
>> +        ((self.hdr & 0xffff0000) >> 16) as usize
>
> 	((self.hdr & HDR_SIZE_MASK) >> Self::HDR_SIZE_SHIFT)
>
> In this case it may look a bit pointless, but I think it would make sense=
 to
> establish to store consts for shifts and masks in general, such that one =
can get
> an easy overview of the layout of the structure.

Not pointless at all, this is actually a good habit to take.

The (updated) register macro will also give us the ability to define
register-like field types without any I/O ops, which could be used in
such cases as well for more clarity. But that's for after this series.
:)
