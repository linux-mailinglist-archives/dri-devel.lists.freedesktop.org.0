Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D956BB482E9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 05:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DB7C10E3BD;
	Mon,  8 Sep 2025 03:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LsIXWnNa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B319310E335;
 Mon,  8 Sep 2025 03:40:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QeOSlQbuq4s4/DApJaCr1G+IWqJp6V42wKs1IaNGxSjjoCJHTPZTWAxRyIJhnC4aoc1Vh7zOOIMfx/fDXV97qbrPmUozP7gz9fUpPuP528Yj41i8VLRfPJRguM+jmbGiWl7/1jjVy9G+TrjY56gcEK5FRc+Y07qCpX/xatUtdpGcM4dP68AM2gcPHrt7WIe+5QkhjF2BeKZhFHy702aWAvgrolB6ABmNBFs11DPsFjvGbmyL+v22sqaGXIaCAJQcKBdhK/pOybeAE8q+4KvH6lTq81uiRLTVKwMBNDmlCGOFtA5kRplHyyYw7k/exNoNIkG64VzxiHV6y89ls73gAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D9dEkFelRWIzZkji8dYB+E4xEcySUZcwewqWmQKhSwU=;
 b=BFDfYa4q1kGEJs2zdTSx2k9Lfwe/dR0YyuqWqR/XjMU0IUybpf/bbc8sq5qE5KznaV6yTWUScQ26+usj5LFp4KMuYohLLjuKpti/olAVd7xMXX6lOMgzldmSfoEs3UFPXjTHCoU+hUtZWMusHX12kAChBTQIkl2FWuPkVUJHcu65WJnTCTjc0+kW75n35h8haEVshesnwAzuiiIWSOGB25cSUFy7jKwMfkkvJtkfk2/98q8ZZym6Zuzmu69Bvqg0JPf7fJtlARtoFRHoC2DqWhC+XMKwI/KuAeWFOynByg0qbUjI4Iz/J6s4ef8rNXr0252MOaHs+S/1+P6pzXnfJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D9dEkFelRWIzZkji8dYB+E4xEcySUZcwewqWmQKhSwU=;
 b=LsIXWnNa1pGbpOCxgAYfH5u/Tc8VV2uaOUnPwBU2iLKavoIiuVnc0HVUuel63rF6GH7ndgoOmoshbsPEZUSxUslP0x5bK6o39BXsMIhtLhvxWFmZKly63/qEzVl3+DQYgiHKCS8qp3xvlZfSXkXCRYz6PugFAQBnZKoRI/q4kpAl84UgYvhelGnVgCI6xT82dtNd0ma2Rtllph7DF8tTZgvwL1ikal6GCHaCvUegoA7M27L1RxBTt0F/3HC26Cfr6Ao9O1lrJcrWzUv6rmi+J/X2nCMWvw9r3Pa65hyuJrvZDLEM96ea4se+P4GHWd1Sqe2n8Pn/xHof+9b2cLc/hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9394.namprd12.prod.outlook.com (2603:10b6:610:1cf::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 03:40:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 03:40:21 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Sep 2025 12:40:17 +0900
Message-Id: <DCN3UXK0EQ1Q.KWGM7NKTCS13@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 3/4] nova-core: bitstruct: Add support for custom
 visiblity
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-4-joelagnelf@nvidia.com>
In-Reply-To: <20250903215428.1296517-4-joelagnelf@nvidia.com>
X-ClientProxiedBy: TYCP286CA0085.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9394:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba72191-c61f-44ac-c1c7-08ddee896f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WGdIdUlma3RsY21jbHA1NkZ0RDFjSGJWakVyeERSYzY0aGtGT2t5dnRua0c5?=
 =?utf-8?B?UHp1U1dhbUNOK3lXNXNQMmlHSzJZbEVucVp0UVJCdnhNODN3UlhCaithNUpF?=
 =?utf-8?B?cUhlaDlMUGRhMFA1K2RCZ0R5NkVLQjliRmN4YVpHT3FDaXQ0TVpXeHp1UFN2?=
 =?utf-8?B?Y0txMncrcVhvM0pTbCtKcjl4RXp5SEtJVGI0dUsrblVqOVZ5eXVmYWZ5M1FU?=
 =?utf-8?B?YWpWMGd6SURTRmxXRi9GNHF0cUc2Z0lBaWpyR3ZHdE5kVzc0aHdseXhPemkz?=
 =?utf-8?B?SW1zWDJOcW00enlmeVhKTEtqZjB4UWNISjdLb1I1NWRvQlJFUHduOHkrZlM4?=
 =?utf-8?B?bjk0THliMzlpaTRxVzJuUVFDZlhSVm8vTC95Ti9KcFV5SVFhWGJzMDhMRTg2?=
 =?utf-8?B?c05lRkpwUUVEeE1BQmpLZ3JUOHJpVjdJRXowckZBQnM3em5FSnprbHB2ek5Z?=
 =?utf-8?B?MHhsRmIrOWxQK2R4bUxTUlNuc2ZLZDMvb21ZcUZPQ1krR2VuQWVZNWZKaC90?=
 =?utf-8?B?R1drR25DRVF1NjY2eTc5cDh4T2pSaUpTNVh5MSt6dkI0ODlIdXcxaXZmT3pk?=
 =?utf-8?B?a2tEaGUwQWlKNjNDc20vUTErZU5hQW85S2Z2SlJYSWVLSGlKM3p3eUsvSi9W?=
 =?utf-8?B?YmhoTDdEUnBtdU40TW5pZlROc09RbEZMOGxCL0U4STVyY3FNQWhVZUpYd0Ix?=
 =?utf-8?B?RDQzbWhqK0lwWUUzN0xKcmU2TGdIM285aCt3cTlZWUs1WWp1UjdicTRMbG9P?=
 =?utf-8?B?ZDVYSENuZmNHY2NwVkFzSWNNU1dnbU4yUmtrUUVkcUR2Yy9yaDFwN01tdVJT?=
 =?utf-8?B?NG9kdFVwVzZsNUR0cTFLcmxaZDNvbUc5UWltbHZxajVyVTVEV0Vna3dKdFZv?=
 =?utf-8?B?Vnd1enh2USs3MlptcnBuRXhscklVSHg3UzFCa3pveXdJaXdRL2VESWxHanhL?=
 =?utf-8?B?M05uTEpYcDliaEZMM1Q3TDcrdmpFb2VzeXdISXBKS1l1L1JJR0xlRExqNU5k?=
 =?utf-8?B?VnA4czFwcFhjUk9MS2hoNlY2YTYrVnZjZGdRTHNxbUp3cUtNelhWeEpzS3Jm?=
 =?utf-8?B?MDZzdm5CMjVpYXhhNVlpZDRRK0I0R1hhc2JmOGYzYWpIMlRod1MvNDVpcGZ4?=
 =?utf-8?B?eXNzY1AvdzBzRTlEWDZzTFB3cFo4akNvbkt5cGNKL0xxODVvNUZScnlnWTBv?=
 =?utf-8?B?L0ZCbGRZVjltT3pkRGNoQlluV1RMd05jeStha01DLzJXWnpDd3RMRUpmSnhM?=
 =?utf-8?B?ZmJuQ3ptUEsvQThCUkl5dWNNMDZMQnd3NUJKcXA4cW5ENkJTdHA3cTVuMFRl?=
 =?utf-8?B?aUN5blBGbVIrRHpiQklGSkZQK2dxUU9aaEhoaS9XaEhJcmR3TnJ1SVoyUlEx?=
 =?utf-8?B?M1NOTVI1bnpuVGh0TEhDTjdFMFNhYkYvempIWlhJMTQ5U3ZscVBiMlBhS0lF?=
 =?utf-8?B?U0gydlF1R2k1UXVZOXhSaSt0eHZaN05mdVJQcllnUENsNnhyRlFLeW9WZ0t6?=
 =?utf-8?B?MVpnWkY1TUdkRFpCZEIwdUhEcnJQLzdxL2JXTmlkMmtMQ0krM1JldXFVTEVD?=
 =?utf-8?B?VkZ3UGJZYXU1VGg2RjJweDk0Qk01VXBxZVRBSlEvMlFuR0VaYURuMkt6SGI0?=
 =?utf-8?B?VzBUQVV3b25XTEI3WlJVbzliQzlsbEdVcGRsR0d5emVMbHFvM2gvclJaS25K?=
 =?utf-8?B?b0g1VDRQVDVNdys2U2MxL0xUWWVRMmZ6bVFHTWRmOWpjbGJENXU5TjBGZEp0?=
 =?utf-8?B?Z1Z2Z3JxRE5sL2U0cVVmZkNqemlkRmxEdGN5cFNBTGVQVmRLd3JFM3ErMktN?=
 =?utf-8?B?Ti9oOE9nS2pKZXJuUmM2ajhUbkhoOXdLK2NoYjZqMzY5Nys3ZVFKcU9FdG02?=
 =?utf-8?B?OEdsTlVxZUF0eU9PZnBxc0hQblpLU1lxaDhjMmVZcHE5RmUvV0Y5bEU1NEVN?=
 =?utf-8?Q?p8Qew45Md8Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TENUaVVEdkxwVFpHSEVMZ0V3UzFEdi9Zc0JGSjlnWkVKR2ZLYzFjVFBiZWJ0?=
 =?utf-8?B?TnEzTHFVL2dncHNnN1ZIMDZydHJqWXcxc21lV2xEdGhlWWhyQThlRVlhYVFy?=
 =?utf-8?B?bWxpK0RGMVhuTnA5dk1yc1BDZjFPdFgvSVNWdEl6SS9SbENkdTFKWldWM1BT?=
 =?utf-8?B?VU5NZ1F3TGN6ZCtXZUxjZkptT0tRSjdoSTJIVTVjYWh1OTI5VDJCTDQrbHBD?=
 =?utf-8?B?ZEVsQjZMVjRRNzVzRkVkanQrU1dNeWxoblNJTEl4aVRsc3BjaFRzcGsvdU5P?=
 =?utf-8?B?cFg3ZlI0S0tJdFBnbWpXNXhoR1dIb3hZd1cyQTRiTFNjYyt5UzVxVDRVUzFP?=
 =?utf-8?B?WitqRytHMFRKMjhWWG14ckxKRXJLMUpoRWZ5TldGcDVrYkdGY3NETHdzdTlw?=
 =?utf-8?B?UDlqSVFyU2hqU3BTd2l5c05jVUFCZXlneXVMQW94Y09JSGtFU2VpNjY0aDBO?=
 =?utf-8?B?TDZNN1hvRDRZczQ2U2dNZFQvV1NWc3JBMGFHdld5L0N5bGovNkROMUxKL1Zx?=
 =?utf-8?B?V2prN1lmRWlhQXdmOGNsRHc5dEgxMXUxUSt2ektRMGxHVmhYaVhCaVpOZzA0?=
 =?utf-8?B?VHNkQUdwUUxvQ3FMdU9LaXUwNXN4bnVhQ1lVaUxESDhmK05GQUhhd3dJZ21N?=
 =?utf-8?B?TUZLb2ZKSTYzdWJNQStNWlFPTCttNmliVmZzTGhMZUpjSjlBZTZSNkhaVkk5?=
 =?utf-8?B?WjFvWmtZRmlZUHB2bWI0RDlFTWQ3WkNIRW8veFRMM2hKWThDWGpxWVVwTWxS?=
 =?utf-8?B?S3NPcThEdy9sR1ZRdUdTRmxMTWtwcFdPcFdrQWVUVHRmakdKWU81TkJrZUVN?=
 =?utf-8?B?YmgwMzh5aG1uYVZuaVZRZmF6SnFrUzRnU2t5VjZqQVZrMmxnYXlOU08zWThG?=
 =?utf-8?B?ZC9WV2wwbGZYTno2alpOb2lHczFKa0J1VDhScWR2eExnSGJiRzdZdGF2TFV2?=
 =?utf-8?B?WlViMUhjKzV1ZGVkZ0VyenEwc1JzdjQ5NTNzaGxDdEFGZ2ptS1JVR0I3TDdp?=
 =?utf-8?B?eXFOMlI3NG1wTnV6VVprYjlDeTUzd3VyN2ZkTTZxV05LT09GckcxUzduVkVL?=
 =?utf-8?B?MnJSSTlORDUxLzRLMmh4eUV2ZEhVQk1TWmgybkRENXZzUEpsN2FuMXJYck1U?=
 =?utf-8?B?b0QzY1U4MGhWajVzUnNka3c3WW5QVVJocWt5WjJTcnFibFA2N2p0RTlJMndY?=
 =?utf-8?B?VHh1djNZbWlqcm94bWxCdjZObmVUSFlwT0NmUGI5OG13K0Q5OFozTklpRzdk?=
 =?utf-8?B?SUZKSWZ5M2E4MFdZeHNjSm1rMDdxSVc4MkJhV2pDU0JXcVBEN1E3SmYycWg4?=
 =?utf-8?B?TVI2cFA2RGZKNHNLUkJ1elh3U1NFVWhJL2tZS0J3aTNwV3lLZlpsYnZaU0Nv?=
 =?utf-8?B?UFRBY3F2M2FoU2ZDaVZucjhXeWNvRlR1MW5OZXJGRXFrRmtOekl2Mm0vTlI4?=
 =?utf-8?B?WGZ3bklheGhkODhid0wrVk5zTzYzNGZpaVkzbnBsalBmNmhTY0lwSkxNc0Vr?=
 =?utf-8?B?WTBEMll5VzFjRmJpc2xSTFlqWVZSV29NUVZPbTFPbWFNbHhlaEhvcmNLMlVu?=
 =?utf-8?B?TVJCNlV2UDFCTk56ZkNmRENRUjVwVjAyM1k1bmgzNjBGSE9pdXJBZW12dEFH?=
 =?utf-8?B?USt4ZjFQOTZIemgwMFFSQWZIVUNCeUJSM3dWYUFWelNML1NjTDVCQlhCQWFa?=
 =?utf-8?B?Vk5UZlZMdy9nNkhZRUtuUHlOd0RFYm9RelVQU0NqUzN0UDBUSWNOK2tmc1BI?=
 =?utf-8?B?MXRkME9EeWFIMUVZMVhaMHQ3ZGRjR1JVTzExMzdEcTlTQ0p1empIZyticTlx?=
 =?utf-8?B?ZGVaazFxdjV3by9tR0xJZ3A2SW02T0haaVVkL1dacklRNUNwVHc0K0l6a2J0?=
 =?utf-8?B?Mk1MWWE3NG51L3VuTVlBMEY1UGtHN3B6Nk54eGpCVFJDdWNFaS9EVmkxREU3?=
 =?utf-8?B?Z3VCdTJseFNrY3FObVNVQ3c0V0tseUE2ZldqRlkrVnYvOGdWc3UyVkl4TWFp?=
 =?utf-8?B?TUgwTG8reEQrN2ZpeTJGc1NFYVVZYWV2NFg3Sk9McmZmQXJ0a1hmSzRjRTRR?=
 =?utf-8?B?aDlTU1N5VWNYRW9wbVEzck02bFZjTCt0M1lZUXE0T3BrNzk2MmxhN3VkV2xY?=
 =?utf-8?B?SU1MTEdVc2piTDZhVEZwb3V4QXVudGE1bTdVYWt5ZEFVbVl6cHJ3TjNNRmFz?=
 =?utf-8?Q?5GbDEISYlGnB6OzhJm6tWfoNsX/yut7nvP3OeyV7pMCx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba72191-c61f-44ac-c1c7-08ddee896f9f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 03:40:20.9219 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/BQokXA81EpspBeXaJq3chsH0PPyAwPmw6y5Ct1oOXYWqZbut+pciiLbXqifW0UqANvMzcqL5Yr+Eo78/S6ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9394
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

On Thu Sep 4, 2025 at 6:54 AM JST, Joel Fernandes wrote:
> Add support for custom visiblity to allow for users to control visibility
> of the structure and helpers.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  drivers/gpu/nova-core/bitstruct.rs   | 46 ++++++++++++++--------------
>  drivers/gpu/nova-core/regs/macros.rs | 16 +++++-----
>  2 files changed, 31 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/b=
itstruct.rs
> index 068334c86981..1047c5c17e2d 100644
> --- a/drivers/gpu/nova-core/bitstruct.rs
> +++ b/drivers/gpu/nova-core/bitstruct.rs
> @@ -9,7 +9,7 @@
>  ///
>  /// ```rust
>  /// bitstruct! {
> -///     struct ControlReg: u32 {
> +///     pub struct ControlReg: u32 {
>  ///         3:0       mode        as u8 ?=3D> Mode;
>  ///         7:4       state       as u8 =3D> State;
>  ///     }

Maybe mention in the documentation that the field accessors are given
the same visibility as the type - otherwise one might be led into
thinking that they can specify visibility for individual fields as well
(I'm wondering whether we might ever want that in the future?).

> @@ -34,21 +34,21 @@
>  ///   and returns the result. This is useful with fields for which not a=
ll values are valid.
>  macro_rules! bitstruct {
>      // Main entry point - defines the bitfield struct with fields
> -    (struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields=
:tt)* }) =3D> {
> -        bitstruct!(@core $name $storage $(, $comment)? { $($fields)* });
> +    ($vis:vis struct $name:ident : $storage:ty $(, $comment:literal)? { =
$($fields:tt)* }) =3D> {
> +        bitstruct!(@core $name $vis $storage $(, $comment)? { $($fields)=
* });
>      };
> =20
>      // All rules below are helpers.
> =20
>      // Defines the wrapper `$name` type, as well as its relevant impleme=
ntations (`Debug`,
>      // `Default`, `BitOr`, and conversion to the value type) and field a=
ccessor methods.
> -    (@core $name:ident $storage:ty $(, $comment:literal)? { $($fields:tt=
)* }) =3D> {
> +    (@core $name:ident $vis:vis $storage:ty $(, $comment:literal)? { $($=
fields:tt)* }) =3D> {

Being very nitpicky here, but for consistency why not put `$vis` before
`$name` since it is the order they are given by the caller?

>          $(
>          #[doc=3D$comment]
>          )?
>          #[repr(transparent)]
>          #[derive(Clone, Copy)]
> -        pub(crate) struct $name($storage);
> +        $vis struct $name($vis $storage);

`$storage` should probably be kept private - we already have accessors
for it, and the visibility parameter is for the outer type, not its
internals.
