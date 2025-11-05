Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1445C34621
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:03:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0722310E6C9;
	Wed,  5 Nov 2025 08:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WNzh3bce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010055.outbound.protection.outlook.com [52.101.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0064110E6C9;
 Wed,  5 Nov 2025 08:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIjfvf7HzbTSd/rEOZxItOLDEiP/Jf0JdyvEv25tXU2/+M9vw2FauMMLqZ9Hho513mucARyOs+nGZSHEqDK3MAYR+8L7caQhONaq1xhrGt2qOrlxLdRsSvr8YDWSu2lnsqsrcEVT0/Xd9BBaAwPG+BRc6iQ+JvSNOdQGeAc24hema9S2bRnWJMTUFwWOd6k5Z/xXYO/qvPvEyjwLW51+GObKzoRDxUhaFIfqDeuUaeJwJRytgDKxUIAoRyz0nYzX1vbstD7krOHAf5cGONTVfzNobhFhW5q+JUUIg31E0PUHvj083duBCAiSvvdLevumkJSgBNq1dWCc+TG7qpcORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XgpTM4UUJG9Mo1/w7ZqOqGqIm+b+j/aIs5b7qof7XUc=;
 b=ZMRy+jTwxI6C2SF88dqfwTdKoUNwQIdvlCuvYq00Ib95ibc+dEryswtCr+hEcgmtwcIAaAIu63JIkyvEebYjfBXnxW88OSgtA32UMnMYX9s4k2CcHXmMsfe6HW463KgVL8GaY8Jpj5rYnOfsMZexMto7PAzIqiN1a9g8/laku04lywAOQCilHNMP5dcgmlmp0mva0sbzbYHXS5U/xJ9gbitR3/wrXonIevmTlEkC59/LC0DEYLPA3tmdwKbGmWZhCZmHZu9oOtFwS8/hGAL9i8Rg8YWjf0PD5VsL/KS1JPO9BhLpKcOjLtgeV3vjRgav/yY21Ol5rzgidpR4OrwKQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XgpTM4UUJG9Mo1/w7ZqOqGqIm+b+j/aIs5b7qof7XUc=;
 b=WNzh3bcehSU5yLDPkrU3/tm8oDewcPGEXaZfP7/XPxrkTlJrIg9Pj4E/JOir8l+FogzWaE0seWz8Urbb3EyuZRZ/C/pcOHRFBkPzF43p969Rk34TDJheI4cBuzM22SYqn+ZcvMrLtdlOZV5JRvYtzspScX77w+dfKPMH2Q+hsa+62kTQfJe6RJRdRLl9F7nKwf2fGXfycZHcT29ixtuaa6lg8P9uLHWyeGtcpQ7aybxpnoiLQPaBsLhx1S573CnODbCKTUvkKYtpY47obb0tzpGQ3q2iFyXHAXdKktEB7/0WmlZcnIQHBiRNh25+2h56COy3D4SAMhSMu4mVoY1txQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4450.namprd12.prod.outlook.com (2603:10b6:5:28e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Wed, 5 Nov
 2025 08:03:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 08:03:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 05 Nov 2025 17:03:17 +0900
Subject: [PATCH v2 3/3] net: phy: select RUST_FW_LOADER_ABSTRACTIONS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-b4-select-rust-fw-v2-3-156d9014ed3b@nvidia.com>
References: <20251105-b4-select-rust-fw-v2-0-156d9014ed3b@nvidia.com>
In-Reply-To: <20251105-b4-select-rust-fw-v2-0-156d9014ed3b@nvidia.com>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0193.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4450:EE_
X-MS-Office365-Filtering-Correlation-Id: 233c8331-a7e7-4048-adf9-08de1c41d11e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WXlsUlRnWmRPQjhGbnRvbEhYcFc2UXh4VUdyT1dlOUJxb0lWTEtlMmRzcFlL?=
 =?utf-8?B?dlFkUWp5VEpZYkhRb0FJeWVQRk1FeGk5NFZEYjJNVzVYRGhJbGwyWVBVL0RG?=
 =?utf-8?B?eFdQb2JCN3pFOEthQlpMNkNhTHBiY3Q1SGlXR1VWVWxxNXNFdWtnU2thUDlC?=
 =?utf-8?B?aW5OQXM0bGxwNSttdS9sK0ZzWGxqWEtpUjczQzcyaEkyV3dyYklvTjkxYWNi?=
 =?utf-8?B?OXlNOXRsdVFHZEVDNGYydTM2LzYwQVdrd2hjTFAxKzJUbW5HQW5sWUw3dHhP?=
 =?utf-8?B?dS8waFJLdk9SM1lLcXpvSWR2c2p3NGVaRWRVMFI4dWRlWXluVmg1V0dCUStk?=
 =?utf-8?B?d1VSbnQrN2xKRUoyeTZicFh6eGZ4OTluUlhGY3lFZ3JWSXFQRDd1YnZWREN6?=
 =?utf-8?B?S0J1QWo4TGVsTWpNM0pQc2tZNUNqS2ZuMTdPK2ZzelA2clZUcWpBeUNFK1ZF?=
 =?utf-8?B?Y1dGSjBZcXhmSHZHaDFMeVZxd29QaFYzdnJMdHFWRmFjT0xXNFVLMnZ6TGJ5?=
 =?utf-8?B?Y3V4dHF2Tm1kTHdFL3RXVGdhRE1nM2xpRnZROWMrQWkrNloxTmE1V1ZRUXdF?=
 =?utf-8?B?R203dmNoWUplZlBZRCtuUWI5b21sZ3luU0N5UkFyS3l4eTdqOTdMbTllSU9h?=
 =?utf-8?B?MEo1MTdQSHg3TlQwZXpXaWo2cmNHbHl4NDJMby9DdGV5MWhyRzF1bEpkV1NN?=
 =?utf-8?B?SUFFcEY4TDdMUDY5dU16NStkSWlCeFJXODFBOHFsdHJ0ZU9tMGxMdWFoSWRl?=
 =?utf-8?B?U1lqTXdRQjBrR3lkck1PaGhyL2tMT0lvdXVaRDczTy9QZXVkVU1kZGFENXg3?=
 =?utf-8?B?cTEzcXFJc1psMTBBVllMcGw0VVRsUUZOU0xQK3J4QTZScEtiYXlBZ2Q1WG02?=
 =?utf-8?B?MVZxMFFHWFF2NDBzUHgzOEE4M21MTGExYStPV1ZuK1Ftd2xmTmE5UnE5TmNk?=
 =?utf-8?B?WFFGQ2MzV1o3aWY1eVNLUDBuN3U0RHRtaitTTUtTTE1kUlA0ZUg0RGpVWUxF?=
 =?utf-8?B?WEZndFRUSGErcFNEdzAxdEZObmlEMExNUkxtQ2lzWXRKTXdyclRpSTA2VTNp?=
 =?utf-8?B?ZWJUVGt3ZDh4OVZUMXpxdGVCSlRXNHhhSGtLQ1M5SVNUMk9VbGRJN1hMK1JJ?=
 =?utf-8?B?RlNhRDZTQTZKNFY0ZlovVm9mM05jcEhnRnN1SmZOa2FzRi9DeTJGLy80WWc4?=
 =?utf-8?B?V0pDd3BpbDVuLzVFMkpqVUtxUVRJdVlyN3A2KzFpb1NvVitTNzNlQ1REWlNt?=
 =?utf-8?B?SUh4R0ZzWlkwUlMxTjJBdVVnalp3RDNCNHY5dlMzaUZkYnd1RFMzZkVGd0Fr?=
 =?utf-8?B?ZEJuNDJMRmZzU2Z1WEU0L0tKREJRc2lRMWdJOWRnQ3ZldnQzcU5DWGpzcFJ4?=
 =?utf-8?B?UVgxZEhvNWh3ang3T1JNL2xLeVBCcE0wWk9DSWIyTkl4dnNkQzNmRTIvbUlw?=
 =?utf-8?B?R0labTNXTkllblZzMktuUmlBWmtRTkJHYkNNWnoydUcwVEhtRGEwTE1RWEkr?=
 =?utf-8?B?bnR1TlExbGl5NDkvcHU0bWpjUThVb1RXZ2lzWHpYL2ZxNlBJRlNUdU1jS205?=
 =?utf-8?B?TmowcFRYbkovUHBqcVFHMEhHdHNWenNoeXBFMlZXS0ZPUkZqTXJhWjBtVUs3?=
 =?utf-8?B?TVZWdnFGay9tQ3JKeWFGTGxHdmxMOTlMTm5qRmJ4T0pnN2VsVUpXMnQwUU1r?=
 =?utf-8?B?eHQ2MWt4UHQyRjJ5Wk1Jc2pyeFNmYjhXMVB1a3NaWFhhc09sRVhqVStzcFJK?=
 =?utf-8?B?TzdPNVJsYzZNTVNCU3NNeGtqZlZERy9PdEpPZ2Fua1BWUmpIdEZwczV2Z1JH?=
 =?utf-8?B?ckFGY0UvdGZ3RkRkajFlMmJwY2xsKzllR1d0MUlGb0Q4bkJxRG5DTE1PWVhL?=
 =?utf-8?B?ajcrS0dHMGZ5WWM4UXpQYkNKcUo4YkttcStxSmwzaUorbGVia3pIVHUxQVVn?=
 =?utf-8?B?MFV3UG0vazRmK2FUb2lPZlVnSWxPektkK1lmZ1QrMzJtU3NZYzdtQVJYM0R0?=
 =?utf-8?Q?sYnavrAsqswLq7T9s8OsMlJyFzJmH4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M0RiRlFvQmFRNzRBT3kzQ1JhVW4vbnBkck9lY3EwWDdhUFpKUUUyQTRGalA4?=
 =?utf-8?B?NkJLZGFQbTVXOUxvbkZOY3RWT1pnMDFtdXlWc2tlcC9NaTRXaGJYNUdjTW1n?=
 =?utf-8?B?eExTaFUzRXZOclZUQkt3VEd0b1NLRUZuRC9wbDZDQ0xRMjBwa2todlloNEhY?=
 =?utf-8?B?RHB5eWRXWldnOXJLd3UySm9UV2pxMzhzb2gzVnJoUDhTNGdDb1MrYUcvdGt3?=
 =?utf-8?B?M2dZenJGWVpDZVR2UTM3TlJnam9GNTRBNHNORDl2SnlkdGtTaFE1YjJ0VEVS?=
 =?utf-8?B?WnZvM0NjbVB6cW5VU0dqQlBhT2ZhRWoxUDNYRDJ0TWFTbW94ZExBa3NUNjdr?=
 =?utf-8?B?T3FoeFEyZEhPOXBpQ3FXU3FMT2pMNlU1UmdsNnI3eWl5VFBQTldIeURNY0hw?=
 =?utf-8?B?U3BXelhPWjBqL2JQOTU4RitFL1VJUzhNWXJDazJBdzBUd29ZanpsTXF4ZmM2?=
 =?utf-8?B?b1R3d1pyeEIwY3l0YWNoY0E1STZMZU56YmdtNHFJSEZaUnd0dnhCTFpES2FK?=
 =?utf-8?B?ZWJJRE05bmh4c2RVK21JQkdOTnhpd3MvbWtqOEc4cGFzYkI5NTN4TklXZlgv?=
 =?utf-8?B?UmhqSUlHWDNPWXY1UElRbWlHMmZmYlhNSUkrQ0N6K3p0L3dTaS9pU0hlekFK?=
 =?utf-8?B?SS8ySzFGZjJFU0orTkh3MjFqNnlReW5GK2JDMmFnVmxpaUZUbnFSTitQQTJC?=
 =?utf-8?B?aGl4Vkc4S2lacG5jTHhObDA2aUJCWVpRT2l0TmxKUHcwRlJhSUZRMi9IR0xW?=
 =?utf-8?B?enZXUVFlLzEvakVvL0EwZmF2TU5yQmhESjgyWU1kREVGL0lLcG5YOFl4T0d0?=
 =?utf-8?B?VkFWVURGVTFEVGgrNEJpNWRDL3o2Qk5aYUNLR1JqNTl4ZTRVbHhhSVZyVkJy?=
 =?utf-8?B?a3kySExCTDllMnVoOGswVVcrbUxDS0hJNEZhdGM0Qmo1ZVE0N2h1RGxKZFdV?=
 =?utf-8?B?Ykp0d1ZxWUhGMnZUQ09IUGJEOTRrZFh6Mmk0WUpCdWhhK01aZE9ZK0p0aHpy?=
 =?utf-8?B?RHJNbUZvaTRHRk93eWc5Q21mVklJblBxSlRJeVEzV292bDdmcFc4TENQOUxD?=
 =?utf-8?B?STRqbG9EV2huMmtYdjlYYSt1ZDhBWGh2NFcyZUZaM09DRytxM1QrQVFDT1Rh?=
 =?utf-8?B?bDlzcHg1QXBZUFN0SzNoWG1LVmlOUWhyaVovYnBCZTJDWTZ0a0hNYjBXMUpB?=
 =?utf-8?B?a3F4S2N2Si9nSENNbEdlc1JaRWcwdWNNTnhCbHF0QTkvL2xLMDVYMzZPUnZt?=
 =?utf-8?B?TFhVQ0dOdENlRXJvdnI4dWNCVjZ3cmU3bTFkb1dKMHhDemU1RE4zclZsbWdm?=
 =?utf-8?B?N0djYWJzOEV4VDRtSVRXZ05uVVIxTGhMaFZpRTkvMVlCbnlKbFZoaUlpcjM3?=
 =?utf-8?B?NjltdTBvc1lsQTJlYUdKckEyaWpiY2NrL0xzMi9oR21kTGZUZkdYazQzSEVH?=
 =?utf-8?B?cHpnUWZQK2pnQ2VTQmhxL1ExTFY5Rk4yYzlhVkJQNUtIYjRPdTdTbW41Ymhk?=
 =?utf-8?B?OFRYRmdKZ2dpbHlDbXIyMlpwWDYzVUdNZVExaUZKdlQvbjRKczZ2OUlqOFpl?=
 =?utf-8?B?VFgzcHVJMldPQUI2MlFsRFJYU2pRRlZHTUJ4OUkxc2lHOFFlOVEvYi9PYnUw?=
 =?utf-8?B?RTFocDN4MW9UWVJqemJvUjFYYXRPU09Bc0psb1ZEeDVwVHV2NDY5U3d5V1dD?=
 =?utf-8?B?NW1sZ2dkenlJeHR1cEdJWmN1UXpHSDRmZS90aFBndzl6eFV1TUZ6cGMyV2gz?=
 =?utf-8?B?MXpNaXJFQmtJVkZob2JXQjdlNWZka21YSU9mSHhkMEJuSEJNSVFiZUJQNk55?=
 =?utf-8?B?MVhZbHVSRzc4angrOFpraCs1bTg2a3hFWFZYRjM4NUEwOUU5Vk9LM0l4Q0xr?=
 =?utf-8?B?Vk5qSllacGIzYUdoNWRqZHBBMllSNW85YU1udTlQbTVTdnB2S1MxOU5VeDlr?=
 =?utf-8?B?bjYxdDh6bVQ2enoySUVhZFp6dHIvU0h4eU5xbWIxMUwycHBhcHFjQ00xWStu?=
 =?utf-8?B?bGxTL21odGQ1VFlYcXBGRlJPTWlnMjRsUFZtbmlDTTNyN1NsNmNEWUpTMHor?=
 =?utf-8?B?S0U1LzhWR2NOMitSZy9jZGR1dlE1cHV1b2NEZVlsaTEya2ZjaXFwUzJrTjkw?=
 =?utf-8?B?RmV4SHJITGs5QlhsTlkxeEVrRzBUNnpudVFNclRmK0xCejZ0c1ZOU2dGTHZB?=
 =?utf-8?Q?38DvkPa1Gjaf0lBvdA4szVvdvXoDYiRtbvcK1vHrL4I2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 233c8331-a7e7-4048-adf9-08de1c41d11e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 08:03:34.1343 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvzA8FbuT7CQ2OdH+FxbLxU5Eitd+EYpslmKqJk7Vq2DjlAzNtA+5Ayje/aMWaxRRPJVbMjHarAapYD68Vm48A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4450
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

The use of firmware_loader is an implementations detail of the driver,
so it should be enabled along with it. The non-Rust option FW_LOADER is
typically selected rather than depended on, let's make the Rust
abstraction behave the same.

Fixes: fd3eaad826da ("net: phy: add Applied Micro QT2025 PHY driver")
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/net/phy/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/phy/Kconfig b/drivers/net/phy/Kconfig
index 98700d069191..d4987fc6b26c 100644
--- a/drivers/net/phy/Kconfig
+++ b/drivers/net/phy/Kconfig
@@ -132,7 +132,7 @@ config ADIN1100_PHY
 config AMCC_QT2025_PHY
 	tristate "AMCC QT2025 PHY"
 	depends on RUST_PHYLIB_ABSTRACTIONS
-	depends on RUST_FW_LOADER_ABSTRACTIONS
+	select RUST_FW_LOADER_ABSTRACTIONS
 	help
 	  Adds support for the Applied Micro Circuits Corporation QT2025 PHY.
 

-- 
2.51.2

