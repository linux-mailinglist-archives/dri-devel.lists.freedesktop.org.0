Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AFEBA719F
	for <lists+dri-devel@lfdr.de>; Sun, 28 Sep 2025 16:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB60810E035;
	Sun, 28 Sep 2025 14:34:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oTL+2Ynu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011030.outbound.protection.outlook.com [52.101.52.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D733710E035
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Sep 2025 14:34:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9VMTF5NzioZ71cg09K1kja6LXYt1d4LR6+JuUjVexlLzkfo+/7MPe3pTjrOEqmW3aHXRwrNE9WJnyCG2Ux3KBMOSSYY2Y9EHgDJobAP6DwKxNToPKRDLVm9myYiVGjxzSC3Xa5ucehUMEiswWIsY4qUhch7cLW7jOjRylMvK6ciHqlB4b+a3fP8QgwdCM/4aRY2owrsw8eJxpo8BkCOPi4/U9BPA3szW7nRzwbA/NMldUnOZT96MNUCkHqhuBkNu9ACxDTCZOY/5tTNb39Sx4s8fDIBuD3LrM2ePli7s+wUJDkQmJnC5BZlDyBzgY3tZjSM1cI1xBmImvim9Egrww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mnojcLyU4j4fTu/W4eyx44A843xthFqw9y2yDB6NMTY=;
 b=DsrCU+Xd3sAXr7Esi4pleysSB186DJ6KlJ9sqnS3UmiiLgap8TW7o9kERxWq/29DIqHffcOgdMkhnAvxEExQc9iW7F+ugWsKPc+dFp8S+46PH5ls6A2yuq8SCq4MT0aj6ylKvfk2syNzBeI4oKr6pmlOiTf6y7AhgLCqp0mfAf9sDz3hLlowV52dvDEhpUFGUBjkFnJxOnoP2/U7wG4SzePvrIK5a/groApICZ0+6BSc8QoXRT6lA918MhIzD60JYItao0sD5MhhpQk1AE3OSwpTXosveuDVEmI7qXfs3yjQ8Y5QRkemMUbMp1YxrOvH5I2xjg/8Uh+o1LDBexVg9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mnojcLyU4j4fTu/W4eyx44A843xthFqw9y2yDB6NMTY=;
 b=oTL+2YnuPk+4YrYW+nTUUzUIys05ZrID9zUjvftvaFoGe/wxtqrQfVfDQRGZvG5JysqxaPqUUPXJXK1Vdr31Td1D1t6CsOmub5yiSD+IM5bJa0FdsKvmZzsEQix4rE/6n5lEzP1NaLGApaNjva2asvT2IaWSUhD2PAOzAT0ASok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Sun, 28 Sep
 2025 14:34:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9160.010; Sun, 28 Sep 2025
 14:34:34 +0000
Message-ID: <5873bc43-1d60-419a-9c5b-e623fc5e9c47@amd.com>
Date: Sun, 28 Sep 2025 16:34:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
To: phasta@kernel.org, Boqun Feng <boqun.feng@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, Lyude Paul <lyude@redhat.com>,
 Mitchell Levy <levymitchell0@gmail.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org
References: <20250918123100.124738-2-phasta@kernel.org>
 <aNa7BDpKS2KA__4M@tardis.local>
 <2aa5150d913fcd4d321db52bc6bad1770f68e778.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2aa5150d913fcd4d321db52bc6bad1770f68e778.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR20CA0055.namprd20.prod.outlook.com
 (2603:10b6:208:235::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: 44a7d794-71f0-4dd8-0d63-08ddfe9c24f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bmNxd1VNNTRVVVdBRnhJN1FTM0Uyc1ZFRUl5M2VXKzVjTXRlOUMxU2d2eWZX?=
 =?utf-8?B?RnE4QmFqTWtNZWhodEFLNFJwQmQ0NWZDT1I5eUZOcFZYa2tZL3JqMlp2cjIv?=
 =?utf-8?B?M1Erc3RGR2xyRXFmYWplc0wveW45ayt0M3gvQnFrMTQrWlkvVnpxcnFoN0FO?=
 =?utf-8?B?dWtHZi9BbHdKZ0J6MmdpdklTZnVZQkY1Ui9IWktKRjRIQzBjRUFvR3dZWGhp?=
 =?utf-8?B?LytLSVlENjdVTGV0b3F6L3Y0WEtlR3l2VG9BaFIxY3BCZ3ZYTTFmRi9HVzdU?=
 =?utf-8?B?UnJKSStLYTV6RXowWXYrbk1LSi9LYk4xaVBlUXVlaGN6MnJxUy84bGdWZnJK?=
 =?utf-8?B?ZVZtV2lHRzdxZUNGSnhRNDNiMTVOTGU5c29QMzFZSWxlYWpMVWY1Qkd2S3ps?=
 =?utf-8?B?N1Yzc3RDeU5BZmM1WW10UEhVemZNbGVqbFpOczJBZm42WXZWZVVLR3piUC9B?=
 =?utf-8?B?Y2R3WVd2VTU0bFg2aDJ0ZzdvblhVR1VvTUJJaHliT1hMbHdTdzVVLzAwS204?=
 =?utf-8?B?eHVTMk84ekUrUS9pWU43S0N3ZktCVGduSTRsczJ4eVg4LzFSaGhXMlp1ejdh?=
 =?utf-8?B?Q3g4VlltOUpibVA0SHFkVGNEeWQ2ZzhKRmd2OHNrS2tLbGxGNlVyRVVoVWkx?=
 =?utf-8?B?amRPN1pWaDFmREtYTkJVWTBhcVhYbGttbmc1UC80YlJ2WTVVL3ZoWENoRWpl?=
 =?utf-8?B?aWpmbXdVQWIyNHlPanpvN0ZoVlFxd01rdFZsUnVTMDJFTnJOSzhZbkZmTzdG?=
 =?utf-8?B?K3ZWc08wSFFIeUpJR2xOQmc5NXFZdGF6WTFhVGl6dWVRdHYySDVUcXJEUHBC?=
 =?utf-8?B?cytVZDBsMVlIbjI1bVM3dkUxdUtEaW1VcXJGdVUzYTJKcTJxem1iSXdxWE0r?=
 =?utf-8?B?cE9wcVhUZG04U2VsQWNMMStTdzBnSW1pcW1VR1hLWTB6QmEyVjNLU0Q4UTlE?=
 =?utf-8?B?UkhXTWh6WHd2N0xWMndEQVlkSzl6QmlNYVJNeTJpcU5KS0NNdDY0NEgxc21R?=
 =?utf-8?B?dkN3ZVZvejVwK3AyWUljSmFjWEZYdDV2VHhJbkpOMEViQjJRUnpvYk5UTlhK?=
 =?utf-8?B?NENJTlI3RkJhUVRJNW1oN1BwWmF0Z0VCdTYzWnl5NGFtbllJbmtNaUNRQ2dW?=
 =?utf-8?B?TjNmU0F5ZHU5ZktDR0d1MXk2ZVNUam1mQk9ya3dtUmxqMlp2SXVOaHZNYldh?=
 =?utf-8?B?T1Zka0puS2NTM2xlUmhMVnRZL0hMYms4LzhRcXV0STdjR2hnY1AwblFER20y?=
 =?utf-8?B?Z2ZOZDZ6S2JldUM4NzRWZEs3eWIvRVk5WjZkVHNFOFVvc2NGcUtGRlVOaExV?=
 =?utf-8?B?N3F6TWpkWWRYMWViUGswMXNMYXlZRVNZa1JzZU9LUWwwS0ZxRjlXLytjU1pL?=
 =?utf-8?B?allPY1J4blIxTEwvTHI1NFMyTGRIb1FUWXozbDVYb0dmRG9HcUVtQ0h0WnBM?=
 =?utf-8?B?ZmRxZXMxejVCdDFZQ2F0RmRXckRyRm9qSFZKWUc5Q0JBTEdDRE4wVHRXMzRE?=
 =?utf-8?B?Q3RyWnBWWitHTHBaKzI2Smt3c2M1YzZxQXlpeCs3eDQ2dTl6YjRmTHdCR2x1?=
 =?utf-8?B?MzZzNDhDdkFuRUQ3NTNqZmk2c284bzh4bi9OYkZacEpOMzdSdlpSQ2wrZVNL?=
 =?utf-8?B?cERxeFk5UVhVKzZaWElCTy9iL290ejMycWFYSy94N0prd2wraEdtL3ZrN0FK?=
 =?utf-8?B?QXROKzU3RUpiVGh4T2QzaEQvU3hzNVV4WnFtQjRPS1RabHRhSFZzL2NnYU42?=
 =?utf-8?B?TDlsaWQ4SVFSVVhrNW1JUjZXMGtqMjAyQVFSM0diYXpvMnBodmNHMDJmcGpX?=
 =?utf-8?B?UUxMMXdsYmVnOHhOUUxObWZSZkdVandtcnAxSjY5VDMyT2FpWThOYlA0RUJN?=
 =?utf-8?B?OC93NDlyQ0o3L0VsNHFBZlE1WmRGSmY1YzZOU01GS0VUbS9yK0gvbnpEdVZa?=
 =?utf-8?Q?ESM2P88mvNccH7/Ja6CMj933Egwqzind?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K3kvM2RDSjY4a1pwb1FWYm96QVBheGV3dXNPTnNTQkVJSTgvRTZiTG5UY1Vx?=
 =?utf-8?B?R3Z3T0ZVL3NKanBHN1IzQXZ1VlRQdUNCWVVOQ3FLeFhhN2x6UDliRU12VUIr?=
 =?utf-8?B?d2NPRDJubzc5QW9Xb2tBMElraFRDdnkzSUhkbzlSSFhHMGwvWGlaMXdXZE1W?=
 =?utf-8?B?NlF5M3F4eGk4UVZickdFaGx0WHQ1WWtSRVdudlNHUVRVUThNNEZ1cXNESG9l?=
 =?utf-8?B?NmhVVnphQTJINkNHSDkxc0RlU1hQa09GM2VFUzlqeWxPaGJBRzQ5N0E4akU2?=
 =?utf-8?B?ZDllTEtMaG9RaSt6K2tDTVJaYmo4MDZGNWgvM1B4cTdlL3JmajdDblRZZHpV?=
 =?utf-8?B?b2lwQ3FZa3EzOFFPSExmaGlnem1OUGJqT0lUWlRuUEU5YjhadCtLM1BEOE12?=
 =?utf-8?B?SDM3M0VuQ3ltMkY5WnRHMUp4bzZyeGE0cjQyL29tUDd6M2R3MHlZektJY1Nh?=
 =?utf-8?B?ZEdDNVpScGtMMThoUU5JZFhGN2lEcEJaWDZ3dzRYbVl1VXlIdHZaSnNNK1ZF?=
 =?utf-8?B?UVA2RkZzMjRlMDFXZHR5TUw0Ryt0OVkza3RaMHJDanhtRmp5a0g0UmlkMmdH?=
 =?utf-8?B?bnhxSWEzNm9KV1NDTndiak00eENHOThQSkdQY0VVdGVOOE1BbnVzb0djNHdK?=
 =?utf-8?B?L3gwVmZNa0d6ZUNsWmRIZDFkajlKaWhPQVl3SDcvemtvT0dRVGp0UEJ5TzNq?=
 =?utf-8?B?RjBJamNQRVY1Wm5SYy9EVk1YZWdzMUZvckluVE9KMEVUdUtVczVaelEyUGZM?=
 =?utf-8?B?Lzc3ZkxxOVZ1Zy9WbEpwcVpDN3ROWmZlcUY2cXcyUHp0TkxkSXJyK0hVeFB5?=
 =?utf-8?B?b3BncE5JNUdzTGNxZHhpZ1BJalh0UHNBMkVPaUQ0NVhjbnc4citLbmNCODMz?=
 =?utf-8?B?aGR2MjRNYXlSc0llZ3FFSHNGU2kxTlNKa2FhalN2bTZMTHArWEl1cE9ISVpN?=
 =?utf-8?B?LzJ3disvaDByTTVDZTRUY0Y5Q3c3NngyODVWSU90UjhsWjJ6VU5GQTZweDhR?=
 =?utf-8?B?V0x0UXMwbkV6VlNBZ0ozSENuaUxHMVJURnY1Uko4YVBENmtWVFc0RWh2YlFj?=
 =?utf-8?B?VkF2bXBQWGx3ZjVjMnEyNURHcDZqYjlEVnBTMWpNSG1pU0kzY0w1anBTMXFH?=
 =?utf-8?B?ZlVuVEhHYkhSaklQQ3pBSjRVanJIWHFjWERQalAxelFsa1YzTXdoL215THdI?=
 =?utf-8?B?WFdZSGJCc2x0eXVpaGE4SG9OTXNHT0NnelhNS3A0VVBKTjlESmF3di90WnNW?=
 =?utf-8?B?U042bFNpVDJTYm1qZFd2RDE0VzcyUUtuNjQwajgwL2ZhUWdVeThReVZHam9B?=
 =?utf-8?B?bDNFSnBlbmo1Zk5ERUlvM0o3MGJmbkt2cWg2ZmpjajU5aUlFY0JNR3A2U3Fh?=
 =?utf-8?B?ZGE4dzJ2WTR1dHE5UHVmWnVCOFVkdmZycnladGhPenp0TkdTVERHMWpuK01t?=
 =?utf-8?B?QzRkbFRSWUorZG9mdjZ5Tm1CZ3ZkMVdEU0twK3NqNXhkbVB6Yk5talFnNzNQ?=
 =?utf-8?B?RjNka2RDUE5wV2VNdmJodDh0RDRVSk8wNGxUNFJMczhpTzNQWWU0ZjhLREpF?=
 =?utf-8?B?cW9iSFdJKzYvdGZUUFNlRnU0N0ZJakVCeUlQemxsN2lYU0hWMHViR05uODZr?=
 =?utf-8?B?cWY1enBVSElJYUV5eWhERWJaS2FSRHE3TjJaTzA3MkZSSDVka1FWbXM1U1Vk?=
 =?utf-8?B?M0xseE1mR2xzSmdzcGJCY0hlNDJWaHE3MVJ3ZzZaL0xoaTMzbWlrZ0xwTGRY?=
 =?utf-8?B?eDU5cUEveHU5YzFFaGo5eDBsTVBJNDV6OEVVOHI4TUkxRlZQMG1hbUlzWFkr?=
 =?utf-8?B?a0UyWVdTK0wyWTdFUHZVL1NoeTdla0gvTmtnZjNhNGt2WlNhcnQ0ODRabGNJ?=
 =?utf-8?B?U0JvZzVYeUxUK1BFYXVidURJYUFkRnFvVjJjRDFRQ3QvbHB0QjhmcTh5L3cy?=
 =?utf-8?B?dXloRkkwZktKeFBmYmQrb28wZWpYbDhGQTNqdGp5aFpnaERRTVRweEcvMHdh?=
 =?utf-8?B?MERwTGZ2RC9HN0FQNkIzNTRmOEdoR2Y1aWNuK1lPbTZmYnJHOHZNUi9NSVoz?=
 =?utf-8?B?MUt5RDE4eVpMZXdvNzIzRjF6UHFiV1BkYTJVNGhpSzcyQmFXak4vcXAwM3hN?=
 =?utf-8?Q?MdRkd6UWw5Dl9NhUC8pMcUz9f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a7d794-71f0-4dd8-0d63-08ddfe9c24f8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 14:34:34.6667 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /PAl4UKWFo8eUQEEobTcqrEAVU9K+qevxy/MRbaUaLKyoM9nCeY6SuF8wOaT6xsc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042
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

On 27.09.25 11:01, Philipp Stanner wrote:
> On Fri, 2025-09-26 at 09:10 -0700, Boqun Feng wrote:
>> On Thu, Sep 18, 2025 at 02:30:59PM +0200, Philipp Stanner wrote:
>>> dma_fence is a synchronization mechanism which is needed by virtually
>>> all GPU drivers.
>>>
>>> A dma_fence offers many features, among which the most important ones
>>> are registering callbacks (for example to kick off a work item) which
>>> get executed once a fence gets signalled.
>>>
>>> dma_fence has a number of callbacks. Only the two most basic ones
>>> (get_driver_name(), get_timeline_name() are abstracted since they are
>>> enough to enable the basic functionality.
>>>
>>> Callbacks in Rust are registered by passing driver data which implements
>>> the Rust callback trait, whose function will be called by the C backend.
>>>
>>> dma_fence's are always refcounted, so implement AlwaysRefcounted for
>>> them. Once a reference drops to zero, the C backend calls a release
>>> function, where we implement drop_in_place() to conveniently marry that
>>> C-cleanup mechanism with Rust's ownership concepts.
>>>
>>> This patch provides basic functionality, but is still missing:
>>>   - An implementation of PinInit<T, Error> for all driver data.
>>>   - A clever implementation for working dma_fence_begin_signalling()
>>>     guards. See the corresponding TODO in the code.
>>>   - Additional useful helper functions such as dma_fence_is_signaled().
>>>     These _should_ be relatively trivial to implement, though.
>>>
>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>> ---
>>> So. ¡Hola!
>>>
>>> This is a highly WIP RFC. It's obviously at many places not yet
>>> conforming very well to Rust's standards.
>>>
>>> Nevertheless, it has progressed enough that I want to request comments
>>> from the community.
>>>
>>> There are a number of TODOs in the code to which I need input.
>>>
>>> Notably, it seems (half-)illegal to use a shared static reference to an
>>> Atomic, which I currently use for the dma_fence unit test / docstring
>>> test. I'm willing to rework that if someone suggests how.
>>> (Still, shouldn't changing a global Atomic always be legal? It can race,
>>> of course. But that's kind of the point of an atomic)
>>>
>>> What I want comments on the most is the design of the callbacks. I think
>>> it's a great opportunity to provide Rust drivers with rust-only
>>> callbacks, so that they don't have to bother about the C functions.
>>>
>>> dma_fence wise, only the most basic callbacks currently get implemented.
>>> For Nova, AFAICS, we don't need much more than signalling fences and
>>> registering callbacks.
>>>
>>>
>>> Another, solvable, issue I'm having is designing the
>>> dma_fence_begin_signallin() abstractions. There are TODOs about that in
>>> the code. That should ideally be robust and not racy. So we might want
>>> some sort of synchronized (locked?) way for using that abstraction.
>>>
>>>
>>> Regarding the manually created spinlock of mine: I so far never need
>>> that spinlock anywhere in Rust and wasn't sure what's then the best way
>>> to pass a "raw" spinlock to C.
>>>
>>>
>>> So much from my side. Hope to hear from you.
>>>
>>> (I've compiled and tested this with the unit test on the current -rc3)
>>>
>>> Philipp
>>> ---
>>>  rust/bindings/bindings_helper.h |   1 +
>>>  rust/helpers/dma_fence.c        |  23 ++
>>>  rust/helpers/helpers.c          |   1 +
>>>  rust/helpers/spinlock.c         |   5 +
>>>  rust/kernel/sync.rs             |   2 +
>>>  rust/kernel/sync/dma_fence.rs   | 388 ++++++++++++++++++++++++++++++++
>>
>> I missed this part, and I don't think kernel::sync is where dma_fence
>> should be, as kernel::sync is mostly for the basic synchronization
>> between threads/irqs. dma_fence is probably better to be grouped with
>> dma-buf and other dma related primitives. Maybe in kernel::dma? Like:
>>
>> rust/kernel/dma.rs
>> rust/kernel/dma/dma_buf.rs
>> rust/kernel/dma/dma_fence.rs
>>
>> Thoughts? Miguel, Greg, Danilo and Lyude, any idea or suggestion?
> 
> @Christian König's opinion would be valuable, too.

Oh yes, please don't mix dma_fences into SW synchronization, it's a HW synchronization primitive.

> I'm not super convinced of that because dma_fence has not really much
> to do with DMA. They're not very different from completions and are a
> mechanism to synchronize consumers and producers.

That we mixed up fences and completion events caused a lot of trouble in the past.

It's astonishing how often Sima and I had to reject peoples ideas to use the dma_fence as SW sync.

> Actually, before f54d1867005c3 they were just called "fence" and then
> renamed to "dma_fence" because someone wanted that name.

That was also partially done to make sure that people understand that this is not for inter SW sync.

On the other hand the rename didn't helped much :/

Regards,
Christian.

> 
> 
> Anyways, I don't have strong objections and mostly care about having
> them available somewhere.
> 
> P.
> 
>>
>> Regards,
>> Boqun
>>
>>>  6 files changed, 420 insertions(+)
>>>  create mode 100644 rust/helpers/dma_fence.c
>>>  create mode 100644 rust/kernel/sync/dma_fence.rs
>>>
>> [...]
> 

