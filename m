Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3575B37E18
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34A3B10E781;
	Wed, 27 Aug 2025 08:47:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ACxza5iV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2063.outbound.protection.outlook.com [40.107.101.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDE710E780;
 Wed, 27 Aug 2025 08:47:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ClTEL01pVKS0Y0iXq74ev5PmObWQ/NXQLRRSZcr+U74tzNj7AZuRhoIIwRHmYP9dACf+wg4AaAObLJv4/YpskVJSe27TVmxbvZEnpmiIeqWZGTauKmVFmWRMlJzkTmt0C2IanTWkFUS8RNZVWdpeZ6Zpi/m0nxthxlLfackPSFitNUj3neEuDmTFVj8X2mIS+xexYRiD/mkT+8P+rOvevPQZb8S9K9UWi4yzZCLrxsebwv784NSrevUMak+4a7helr86fCmYMA0zK1gdDx84TXhkQCLmW29gs+SIBXPVhjNsMpejfK/GbT84Pdngd4GVjZ9b8xW52Ddju2QwPOECEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Zj6xqaHyCiJP8A3qbvFZTk8gwWJSrUKC6JHU2trspc=;
 b=L+P3pIPVhpNz2sIRcCVLwrqH5ksXhaBnGmE5rK0zA3Meko175/wq43YuDR1J92lhkprj+0QBcvnLPRiwY5w6FxPOxbRVrSKHuP689yFsSdANFnPwPwgmNa6TCtdzVP8OZOtxhyxQdQzVAaM6FHQd0pf0jl6I1jamEctVkaYuDj8B+7Q5RS7wrohmPwqAezw3tJ86baoVYyxwKNLVIqbMErGVkQVBDF4l5FhwyeIMhor5Qj3NN6svTsEIVzrf8pLjJnUfbwhXBRCBzKFsJLtgcCeZLpyboD3oJZkBHFWdw2lCxrp524ZGBbJH3ObDNzkhK7nwwF4rEDyNv8jAQAo8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Zj6xqaHyCiJP8A3qbvFZTk8gwWJSrUKC6JHU2trspc=;
 b=ACxza5iVKWrRx1ALBf5SvksRE/GcVz0JRAdyIlmW6v/dHj/HgkmXj/EWe2Wz8RbB2GWgp6bYeQoGKI2z0ka3gWJK2+12jhI+31YtFPzTjtOv0OvO+/qIET0oiAndAiRKVUYd0LrvBZ90KqF7uKUjg18cjU0ed9wMHmvIToXtTAYQfjTCryyuYXZHMFcXJ+i+91JkYZqi9WgVtDwsBDq1yEKTjiLc6BHZe9/bW+rvDBK7fj+qL+r4zDUlEzAqUB9DYGt86KJF06PHeeMxERC0NfbVZvJjK9M9anW9t02utPOrJw9r+mLUnfscBVPCjYYVSvGmTxEzYb0nmnEtrzEmEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB7373.namprd12.prod.outlook.com (2603:10b6:510:217::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Wed, 27 Aug
 2025 08:47:26 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 08:47:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Aug 2025 17:47:23 +0900
Message-Id: <DCD2VJ1WJW2O.VM7E4PD3DFYO@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/8] gpu: nova-core: firmware: add support for common
 firmware header
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-2-93566252fe3a@nvidia.com>
 <9adb92d4-6063-4032-bf76-f98dcfe2c824@nvidia.com>
In-Reply-To: <9adb92d4-6063-4032-bf76-f98dcfe2c824@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0185.jpnprd01.prod.outlook.com
 (2603:1096:400:2b0::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB7373:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e66179a-c313-470f-ee22-08dde5465931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M2RIcjZvVy94cldZOExYbkZ5clMzTVdnZ2ZLbGd0aTd4eGh3WnlBSjQyekRK?=
 =?utf-8?B?RlQ4RFgrWFk0bmVnNVNwQlQzc2JzOVFYSFc0a1lKamhqNmlER3RTTVExUkdT?=
 =?utf-8?B?MW5aTk5qVzQ2TTZFckREZFg5VFd3T3R4RHhDT3Njc3BIazNiZktzWUFBY1l4?=
 =?utf-8?B?THZJWVR6ZjFJdS9tcTB6L0kzUUVPMml3VWRuUThIZ3Z2U1NhdDVKRE9hVC9Z?=
 =?utf-8?B?NVpjR3ZTdkZFYktveWNWQW9pdTNEMkpkZWs3TmQ3Z0FzWHFWbDhvcFdDVXFm?=
 =?utf-8?B?dCs5VXhRVUIwV1ZhRjF1SFhnTTdyVDUxNTdhK3NkZzAzeU9vY1MwN1dPSlVX?=
 =?utf-8?B?WUVaSkRNS0N3QzAxS0xpb0YzUnMxQXprMm9XTWtuSGw4dHBRMjlOZHJFaHNq?=
 =?utf-8?B?NVVkaWZ0cExLNWxrR2tGcno0blFaTFN6V0JLZ05JZ2tTc1VDbE1tbVQ3dmNX?=
 =?utf-8?B?M2R2WjFwZGlXR1pBbDFJNTRNUXZzVC80SzFWZG5vbnJFalhnUHlwRDREd3ZX?=
 =?utf-8?B?U1dFcHJmcDVxQWx0SWdrUzNnYmo2TjNlOHJFaHIwcEVjUzR1Y3IxcTlkVW5N?=
 =?utf-8?B?cDVjdkhjZFQ1QVI1SW1BNGRBZkN2L2ltdElwNDVKNWN5SXZtdEtneGxvNElO?=
 =?utf-8?B?MlAzdWFCTjNsQ005UUg1ZmlyK2IvcWQ0QmhoU3lCRUtzTVFKZlFaNmwrMnhF?=
 =?utf-8?B?NTkrTjVUTENQNTVDdUhid0dEUHFBRE10b3cwZ3lYSWhCWVphK0p0emIraDZB?=
 =?utf-8?B?UTBMSEZJaUROeVlVVG9LaWZSbzdrWk1rcGQrdnl6bUpSOUZoQmxRWTlIZ0o1?=
 =?utf-8?B?OHhtWU1TS3BnWFFya01sVEo1N3orbjJZMWlhTVpYTGhQWm94U3p0ZG1JY0lz?=
 =?utf-8?B?WEhjMmZ4dnN0c25BVjBCUWlWVTQ5SEhqNHV5ZjhOWWk5VjFnZDlEWS9DdVhB?=
 =?utf-8?B?R0lpbWE5NjJ1aFp1UFlQYnJCcjgvSURrT2hqcGJoQ2VFQUtLeWtqd1BZbHp1?=
 =?utf-8?B?QjV3SFg3eGJiRkNhcmRPWW9tMzYyeUVtVjhmRmx1ejdpWitmYzR4Rkdrb2dm?=
 =?utf-8?B?SklBVStmanBwYWk2emp3S1FLdmV1MUpQTTlDeFVpUlVyUldIQ2Q4WThRTTgx?=
 =?utf-8?B?ZkFQTTVVVFAyTm1SKzFWQ0RJYXBWRDlxeW9DVTBBYnBkdldETUFrZzYvTmhD?=
 =?utf-8?B?aTJrM0V1NXBkMkRybGY0Z1VnK1cwY096R1ZGZUg5SFBPMHQ4VWlpRkRRSUx2?=
 =?utf-8?B?UFRmSUp1WmVhSGJURk9XN25xcXlvZUJJeTJiUnV5VWlFK29yWDNJbWd4MWhn?=
 =?utf-8?B?S3hrL1U1V0kveWRGSElsUHVja2FjdjRIM0xpRmg4alQyeDJrdko0SEdQcUVM?=
 =?utf-8?B?UklyL0JPbUdTOGphbEc0S0NTeVpjVU8wS1Vhc1hUeEhSU2hrcGFCeFN5OVRo?=
 =?utf-8?B?enhPV1U0SzBpMUo5aUR1dkJnNVlWb1dDcnFJdGNGbkREUlVrblFUc25JdEtU?=
 =?utf-8?B?VTIvc3ZDU3pCU2VieGpubXVGVVh1cVJQT2tZK21IekRISzJuVXZablBFek80?=
 =?utf-8?B?V1p1dmZVazRPZzUxSmZ0TTNHejQ4bTFiV3M5VGpaQkt2WFcwbm55eGlmcGlI?=
 =?utf-8?B?NjQ1NFhNV3JBb3dKWVdBSFpUbUo4c3NWRkNsRFVqeW1QZFJ2NjM1dUlKcGFj?=
 =?utf-8?B?K1M1bzQyelZsVHllbDB6UG5ITG5SVDZ1eGppbDl6cFlzb3lHQS94dXlSdkdx?=
 =?utf-8?B?YVdmb3hFd3gvdHlleDdTZm91cG1VTFQzdzVrRHlGeDBuVGxrS05hQ1lGYUhn?=
 =?utf-8?B?N0lBN0RxZlJ0ZTZORHhFZ2srV3RyNXBld0VqbVdjcjdHYWsxZnB1azJXNElw?=
 =?utf-8?B?ZjNUQXVoK2drQUhLN0wrMG1KT1R5MDB6YmQ3S1phREpzOFhnWHVmVmQ4Y1po?=
 =?utf-8?B?T2tERHhkNGRZSFBhaEhrbUNtM3R3UXZzZkRyZmQrbmhhekFBQ1M4Q1dFRWhx?=
 =?utf-8?B?Yysrd0tuSWpRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3RRbnJVaVpKY3c4NDZmQ205MHdOTm5DUmxpMGlKT0dnQnFoSUlNTGxvbnRo?=
 =?utf-8?B?SjdGNGdFVk4rVjZJV0NwS1d2TE1jZE1PcHl6eklzNXNkZFVPcXMrUFdDNG9s?=
 =?utf-8?B?S0I1WEZkNWI0YklXaUVlRk8zMkdYb3U1MWNXa1J0RUZYdVRnZGNycHFLRDFT?=
 =?utf-8?B?dTFKZmxEYXpwQ2pOUW9NSEpyaVAvL0NaM2tocFdaZzNqYTdvU3QrcnpmeXJh?=
 =?utf-8?B?ZW9pdGZ5NTVESis0Q3NGYzNUMVgvSkhpSGNDSDcwZnlDaGNHbU43MnJHWTlV?=
 =?utf-8?B?c29HbHdTZ2lHZTUvVm04ZzVvVTQ1dSs0Y0o1Z0xPVXhLQ2UvWTh4Y09nVXdL?=
 =?utf-8?B?aU1xYXYrcm5tTFFtZ29VRm82TzRUam1Hd0YxTjkvSGhMYkJqblNvcVh3K1Z4?=
 =?utf-8?B?dFREeXcyMzZzTnA3ZE54bkk5aXhFaERodVIwckFFakttVTdFM2dOc21CWFhZ?=
 =?utf-8?B?c3M4c2pMMlkwcGpxR0hNSzN6K1hWMC9hdDhETmkrRGFHNnIvanVFWGYrT0Ix?=
 =?utf-8?B?U3ZIM0IyVGRIYTNYYUtwdGxQeGV6S1ZaMzZOOGE0MkorWjRDSlR6eUhMRmlF?=
 =?utf-8?B?M2hlZEtpdjV2ZW40TTUvN2lMTUttMXEvaUxaVm5Cd1UrZ0swT2g5cndLcnZj?=
 =?utf-8?B?enV1dkFQZlpKcWlwWnJkQWQwVjMvWTJWZ0hVaEx6ZGpnTWxjb1M5a3ZRcVFk?=
 =?utf-8?B?QmQwYVFCSTFndS8xZUlpem94ckdzaVJiQnZrNVNYQXNoUUVraVRySFg3bXpL?=
 =?utf-8?B?WWw3a3NSb2lUUS9mM3dBVTMwQlJBNmlMS1phYWNFZWw4SWRVVmh2YUdWenhZ?=
 =?utf-8?B?RmhlZmorNk01eFQ2Mk5hbk9iNGtoMVBGTkd0aWw2Z2cwckEwWHhXM2ZnVXZO?=
 =?utf-8?B?RklHcEpOU2hTc0JRckJUMURobGVFVDR4YWcvZFUvVGZxdndFWm5XVDhvTTZB?=
 =?utf-8?B?UU5FV0pBdERxNFBmazUveHNxckpGQ1djaDZVNktZdGZ4ZGxZTUtQS0JzVUZa?=
 =?utf-8?B?QUFTN2ppUXVjaTdtWlRXZVpPSitENTlOT212cWhSZG5meFJVRlo3QVgwVEFw?=
 =?utf-8?B?Q1gzRkdWNGkzejJXQ2xhUXBNRlp2SWhXN0RGd3I3WWxCTWo5ZXJaVVk4RlYx?=
 =?utf-8?B?NElFcjZyNjVKN0wyRjFrc1VXMi9FS1NKckZwQVhoZEU2Y09vZ1VLY1BtQS94?=
 =?utf-8?B?QVEyYU9XT3lqUjBMNndSdkl3OXZWaE44clIxRE1nYmh3VTg5V0doQVhoTVJP?=
 =?utf-8?B?S1JURGR2cVlyd2Fwd2hIRkVnTlNRU05XSkxabzc0d3hSQzc4UkNEbXJjUlhm?=
 =?utf-8?B?NWt5WndHMnBpWHNNRlc1NmgzMDBQU2FpbUN6N0IxNFR4aFMrZXBQSGJXbjRx?=
 =?utf-8?B?MWphb005dHpXaWVkNGI1TUl1ZENPL21ONjE5REdjMDNpejdWaXAxOHhFMlNw?=
 =?utf-8?B?eTVOZHp3RGt1Sk5TeSs2YlZlaW1TaWlhaExKVDh4aXk4OXkxWW5JT1hkVEty?=
 =?utf-8?B?Q2Q1VjFBY1NBVi85UlN2V0NxWjMzNEhoMlY2REV1S1JjdlJLZGVSM3lRemdU?=
 =?utf-8?B?UzJOOGw0T2o0d25CdFlLUW5MMkNkN05mRk8yN2p0aVZiRW85S2laVTBOL0da?=
 =?utf-8?B?VmZrdm9hQWt4RW54RmFnWmRpS1k1ejhVU1krUll2RXNjK1J2bnhHOXZQaUsx?=
 =?utf-8?B?cTZzb1JucjJ3bjQrcUpZbm9CanIyUjdJZE9qM0lXL1UyNFVncE1BcWt2OVFX?=
 =?utf-8?B?VVpXNkJvbGlwdkVYdUdKOUI1UDlOMGtXZ0k5ajBoMElhN3AzRGJmZXVZZ2pz?=
 =?utf-8?B?MS8yQ21kSW04UEJHdzB0cC9ablYyRU5XWU8xR2xnL2tGNktLbXYvd0xPWjFX?=
 =?utf-8?B?ZFZ0eTRsQW9iQzdyYVpxQndvUmRtOWdMUHp6L3dmOUVEUUJzL3Z2WlpES3VY?=
 =?utf-8?B?bHpUYzRrM3Q4YU9qeVZJV0NraFMyRnJ6MnJYNkU3TzNqOXRVUTh5OVl5Zk5N?=
 =?utf-8?B?UHJuZEpFeTBzbGlHVWwzL0NxRE5VOXdhcWNYME9lT0hiRE82RDdBYW83c2Ny?=
 =?utf-8?B?VlBGcW91R0dGeFZlcWE0RGdwdUxnTHBsVG05R2xNL2pmeVQ0ZVpjRytUc2tl?=
 =?utf-8?B?L1c1aHRyZFdqZXNCbTFkcWk1M3VLekU4bURWU1JXTWovMFN4THVnNTY3N1dM?=
 =?utf-8?Q?seY+mdDCcbMIdMPTYLoY0TJ54ZmlJtKUdm2ay9m0JEh1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e66179a-c313-470f-ee22-08dde5465931
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:47:26.5461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8gTYFpiDTrtcQ1FcI9JNkNN7a1JDcbRTBNV36wCIwpsF43Vr/HUDfhff7i93d0LjtY/FlctcvKBHZKB4IAIKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7373
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

On Wed Aug 27, 2025 at 10:34 AM JST, John Hubbard wrote:
<snip>
>> +    /// Returns the data payload of the firmware, or `None` if the data=
 range is out of bounds of
>> +    /// the firmware image.
>> +    fn data(&self) -> Option<&[u8]> {
>> +        let fw_start =3D self.hdr.data_offset as usize;
>> +        let fw_size =3D self.hdr.data_size as usize;
>> +
>> +        self.fw.get(fw_start..fw_start + fw_size)
>
> This worries me a bit, because we never checked that these bounds
> are reasonable: within the range of the firmware, and not overflowing
> (.checked_add() for example), that sort of thing.
>
> Thoughts?

`get` returns `None` if the requested slice is out of bounds, so there
should be no risk of panicking here.

However, `fw_start + fw_size` can panic in debug configuration if it
overflows. In a release build I believe it will just happily wrap, and
`get` should consequently return `None` at the invalid range... Although
we can also get unlucky and produce a valid, yet incorrect, one.

This is actually something I've been thinking about while writing this
series and could not really decide upon: how to deal with operands and
functions in Rust that can potentially panic. Using `checked` operands
everywhere is a bit tedious, and even with great care there is no way to
guarantee that no panic occurs in a given function.

Panics are a big no-no in the kernel, yet I don't feel like we have the
proper tools to ensure they do not happen.

User-space has some crates like `no_panic`, but even these feel more
like hacks than anything else. Something at the compiler level would be
nice.

Maybe that would be a good discussion topic for the Plumber
Microconference?
