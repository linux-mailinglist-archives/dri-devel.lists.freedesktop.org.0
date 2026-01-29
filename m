Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMERHq5xe2mMEgIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 15:41:50 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE79B1146
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jan 2026 15:41:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F1B10E877;
	Thu, 29 Jan 2026 14:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2P8z9l2i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011015.outbound.protection.outlook.com [52.101.62.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58FF10E876;
 Thu, 29 Jan 2026 14:41:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCIHReZzrXxaVjyMW47kciktt+oW0o4EYa3RJDlOPuFTvz1m6shV6TlOomOqvfhjzmfimYjc6LdPEabegTdUrlKrGyGf6voN+MloVJxoWddHTvw/E5aNIyRBH54a0VG11IAuF/5JYF1ddhqSGeZR85jgCNT9b02Ft6x3qUkgJBRn+uzLxqQBbIfmnwkWELcZafcxQhaE/pbcx5kB4n4zPhL+vLaHEv7hLvhTiAtZCMHoeN4ieovDeYFyKfPBx1vo3dSAvbtL9sNKj10Spj9AOmFsL4x8Qc8cJ8K3J086eVr5y7FhyMaeWzwYKeoDv19YL4BBQK8FuaZVTzqXgI2p8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qYXWtsaub+fvM2CUGHn2/c63WB2cdRA0q5hn/IYILdg=;
 b=arm4NKorOjCFDd96RA3nWjfL7g8bC7Qty/xERD/fLpB8qCoUvf/cr21RcKUpeJ+bE2R4D9CKdHz177nWamG5NWlJrzcYt4VT1taZO3MGoi0v7vfE7aawECIUKhkZF+SzbXskDgkm9t/lpqc0TbJvg7K9yaJjfQhiaiPVqQ5gz5ofqJnQJb7dfZBOdWduYkI8+S2NsFAqdjk68pK07GiXSl0R8UUdaE9+IBw1FKumyv3fXVgt5GnTQZCbAusS7A0EY7o7oZBGnIgz5vSgIZekU9TTtEmKuHzaFuXPH2ZrnU5qOPEcySHNS7/dOAbmTTvTkp0ei5xyzmkNz0qRbXFNug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qYXWtsaub+fvM2CUGHn2/c63WB2cdRA0q5hn/IYILdg=;
 b=2P8z9l2ixe1w4eP5zQGRJzm1dKeudxazDcR4MpB29za5hlMACTmGjlt2NzrthxynfTkHy9J3KWTjjOIR29EFZs8xeR5VgwvXfTwGmuGw4H14np8XgBfG0ccmkpfft5IiP/cym3aeYnRn47o4B3IRyKxmMimAyI0zSPa2D/wv0+Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by CH1PPF711010B62.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::614) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.10; Thu, 29 Jan
 2026 14:41:41 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::c3e5:48f8:beb6:ea68%7]) with mapi id 15.20.9542.010; Thu, 29 Jan 2026
 14:41:41 +0000
Message-ID: <beabf7ac-f605-41fa-bcda-2451c4c844f0@amd.com>
Date: Thu, 29 Jan 2026 15:41:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: introduce page_flip_timeout()
To: Hamza Mahfooz <someguy@effective-light.com>
Cc: =?UTF-8?Q?Timur_Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Alex Deucher <alexdeucher@gmail.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sunil Khatri <sunil.khatri@amd.com>, Ce Sun <cesun102@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Kenneth Feng <kenneth.feng@amd.com>,
 Ivan Lipski <ivan.lipski@amd.com>, Alex Hung <alex.hung@amd.com>,
 Tom Chung <chiahsuan.chung@amd.com>, Melissa Wen <mwen@igalia.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20260123000537.2450496-1-someguy@effective-light.com>
 <2719069.vYhyI6sBWr@timur-hyperion>
 <30f2480d-016f-417e-9ddf-7805e4943e7b@amd.com>
 <2285353.hkbZ0PkbqX@timur-hyperion>
 <2f9bc706-02d6-4dec-a56c-53abc5d43f46@amd.com> <aXto53g2mSNsNmFM@hal-station>
 <1a75a4d2-64f3-4d19-802c-fc5c79b002c6@amd.com> <aXtvxTNow7bAYlYU@hal-station>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aXtvxTNow7bAYlYU@hal-station>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0215.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::16) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|CH1PPF711010B62:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e3985fc-0f33-43d9-1486-08de5f4483f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUNvZUMyM0FPbk5HbXdTZmFjdXdqbElJMndsQldpaTRLRkRoVGFpUk9wV0s5?=
 =?utf-8?B?OCtxSlV5clNKN3BIdTRUeTRza293RExja0g1TXZDcU1WSUdXM3QwbU9qOTU2?=
 =?utf-8?B?OGxYb0U3bFBHZW9Vbi9odGxET1NhR1FZRENkRmdxOW1WSENXa3U0eWtGWWJz?=
 =?utf-8?B?UXEvVTJHemU0V2pGemkzU1hqVitsVjZzT3VNZk1iVVRmYlA0VHh0bW9tQW1C?=
 =?utf-8?B?YXY1MGczUldWSS9rRDM4bE40V0IvSmpyTEZXdnZSOHptVmxqOWFyK2RLdXc0?=
 =?utf-8?B?aW5pYUVZZEVyRjE4WHplK3RWeW9hekdxVkx1dkVWQlZFWU9EUjh4Q1FrbTlT?=
 =?utf-8?B?djkzM1lISC9LRW9USm91WGM4Z1VSSFVMMVpYMHlXVE1uRmR2MHNnVkxKdDQ4?=
 =?utf-8?B?Rm84TWFQU044aUxrcFZvS2E3TG1mN3BPbzVtV01vK1BySnExODcrVHNaMzFF?=
 =?utf-8?B?UWVyODZZZXdZbUxYN3h1bFJXbkRYZEYrQ2tSNXM0cXNrYWZvNFZrU2dSb0dw?=
 =?utf-8?B?NnhCaTZ4aHZVTWNRNkk1Rk9KMkhCRk9oV1cyRUJVSm13b2M5MldLRDRpRTEr?=
 =?utf-8?B?ZFd0KzQ2TElOdlE4ODhHQTkyNm05REZoVnVCbE4yZCt1cnZwdUYzWVJ6NlZQ?=
 =?utf-8?B?ZjZIa0IyUmJlK0xydWZ6UUp6SDRqZ0ZsSUNXZUd2NDJzclpEY09mNkkyaXh4?=
 =?utf-8?B?N1dMeDVtRWQzYlBDRnhqNDVsNzZ0T1ByQkhibm5yZnBjWTBaL1gzUVBINTFO?=
 =?utf-8?B?T2oxVDBLUkpMSU5YNnhJWWhuWVlqeE5Mek1RdDhRNHR2T3E1WDdMRnhCY2Fa?=
 =?utf-8?B?TVcxNU0wUWpSQ25UNGxzNGkvdWcxYWNnVjdoNkgwQ004TjdnOG5hNXZMMWdP?=
 =?utf-8?B?M3ZRcUpxLzhJSkNMMjlLZzVTNm0yWXNhVWZ1SzBqR1U0UWNJZElFc2VMQkN2?=
 =?utf-8?B?N0cwUXAvYlExVjBMV0JQS1dCckFpRGFQY0piQTQrR3pGM1c1RkZESldXL2Qw?=
 =?utf-8?B?dmdUOGdQQUl2Mk9iN0hFSnRFTDFZTWQzRlBQemU5WmttOS90OE5YMGRDekV4?=
 =?utf-8?B?TXdGcklBNnJiSVNSQWdlbDJpSDdUMVZ6OWhoYTc4Rmo5RTJQdm4va0NZVWFO?=
 =?utf-8?B?cFdJZTBJUkJlcEw0ald6bllJUnhwcXppNlRiaUZrV05RMmdzclB1aWtDelVI?=
 =?utf-8?B?SVJBR3VTSS81M3hmdTY4OGdLbzJNMDNzcE90WGs0eTBoclhJbm1qazIwOW1i?=
 =?utf-8?B?SjlUMjI5OWtpbmNBbW55RTRXZHp6NEd0Qm55THdQbjlYUmxUbTBJaDZCVlBY?=
 =?utf-8?B?VHRxV3BYMzRZYkFYT2IvMVZMdllMWjZZdDNnUG9tcVFEcVVxd0dLenE3dSta?=
 =?utf-8?B?cUp5Mnc0OFRuUldmbXc2ZExEaG9lQ0FSK3BvbVplcUtLMTZnUWVYcGV0SmxJ?=
 =?utf-8?B?NFVPZjl4aEV4Nm1yNFhIWVI0RUZuTWJTTU1JMXhzVldFUis0c3hhU1N2SUN2?=
 =?utf-8?B?WFZHeURwWERkMXBGRkF4M216SGsydnZPd1JOQkpYUy81cW04ZFViaUhaeDZi?=
 =?utf-8?B?eGlvZnIrMS9CaFNQNGp3eDhYY3ZNZnV1aVFzTldFbDBOQy95RGlOL3U3RytT?=
 =?utf-8?B?RXNJZVhBZGM5OWUxMTExNyt0aXZQYlNXM2pER0ZBNVBCdHFQendwNFFUQUNF?=
 =?utf-8?B?UHhNSTVjYWFBZTkxWUU1ZE42a1RwNkFGNFJVL2gvQzN3ZUt3SGlyYUxLUUY1?=
 =?utf-8?B?NWlRUjRnMVczL3pDYXNwd3lwQVRlVlNBTkJmZUR5Rm5KcUk1UVlNTjFMYjNH?=
 =?utf-8?B?SjJYR0FURTJzbXVFUGZQUHJFTzlnL3Z4SnN3cXR3THBpd0kzNFN0bU14OWFk?=
 =?utf-8?B?VEM3UnRhdklwYkhRdEhnQ0lGd1ZMaDNtaTl4eTJoN0xZc2lYZEhMYTlwOEt2?=
 =?utf-8?B?c1BUWDd2dXE0V0RwbGRDRm0vQ2FqcE1Ld2UwdUU2RldmMTdSa2cvTkdzNThT?=
 =?utf-8?B?SmVFU0tBUkxoc3pYOEpLZzdxdWtjNVllMHgrWTloMXBtMzZ6cTluOGpvaG1x?=
 =?utf-8?B?ZDZ2aHFMZ1Rhd2J5blh4YVU5NjBUZFYyUnI5VXhPTmwrWG1ML3dnKzF2MDlP?=
 =?utf-8?Q?o7lg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eU9ESVU4K0RSQlorSWVHZzd1bUVMTndKWWRhbTR2MEdrbVVaZjRLc3hBOEFU?=
 =?utf-8?B?N1hraDdDb3cyTDJSTGc0ZGxDc0Q5WGhjQW9iUTJQZUxCcFB5OWgzSXB1QWZX?=
 =?utf-8?B?ZXNJWjBRNEFsUDg0Ri96U1piWEt0NlAyejlqVnNwRlhBL2RROEFVN2J1Unp0?=
 =?utf-8?B?amc0NjlkamVLR25Pb0xHWmt3L3N1MDFpUmlYMlBWL0x0bzFJV1YwaEkzNG1B?=
 =?utf-8?B?YVJycDRvZldQNGwwNUgySTcyVWZtbm5ua0JmUUh1djcyWGtQN0MwTm41Y0Zs?=
 =?utf-8?B?VXcrc01BUU1vSEtmV2NyOHo1emluTE5rQjgxY1ZsR2FjUXVXcWZobUtPMVNq?=
 =?utf-8?B?S2tKZEJxREs0YWpjRXNGcmp0eUlvMVJYN2p0NFpLa1hQTWlUSGEyU0hUem5s?=
 =?utf-8?B?M0NRejNHbFdTWmw5dFFEb0pFUGp4R1hIMGhZNXFDVUxmYy9LdEwwazBqNUs5?=
 =?utf-8?B?YzJpK1pKSkt2c0JXMnN2UHh5MmxGWWVuZnQrRXV3TFJRcE41TnN6cWFOYnh3?=
 =?utf-8?B?SmdrY3YzTkJwNFp0QWRuQjdlMUticVJUdk1yRjdORVdiUndQVk5hYk5lU3Np?=
 =?utf-8?B?NHBnN0dRSC9QRy9Zb0hMY1JiTzdEYlZVQWdJL0FZREZ6aTBiTTVkRS94OFMr?=
 =?utf-8?B?Y2pmQkJ0R1dRSHNjZlZmeW9NVnFyaVVCajJiZUVUK28xa1ZlNURzRHp2T21P?=
 =?utf-8?B?L2IrSUU4bGlmWnNsVTRsUVNQY2UwS0JSOE9WY1RzZjdJY0N5M2hqaWhkRndQ?=
 =?utf-8?B?bXc5cmE0SDNFSnF5eS9KSHVNaGV1Q0JNTWlTVDdIblBCbFYyUVdaZmh0bDZH?=
 =?utf-8?B?ZzVMM3VtTEp0UGc5cmFTWlF4KzZaQm1ISlB5eXhZNDdhV3ZmeGNqNUpjZFcy?=
 =?utf-8?B?WDJVRTN1TjFuQXE2UDQvd1pOK1JIN0FaVW5kZmcxMUxnVWY1OFFZYVNnZkV1?=
 =?utf-8?B?R1QzVDBINktBTnJsQVo3THUwZ202ZGJoaFo4SEdERzNSV2JxcjVLMlduTXNL?=
 =?utf-8?B?Nm84eTM4WWUzWVM3VjFFNndOQS9ubFF0dEEzMWh5UHNHV2ZyWmFQRDhqWHV6?=
 =?utf-8?B?R291b1lzdWtra3lieU1oN08rVVhobU8vRkxNNzJ5SXhkY04vZ1RaWVFtQytu?=
 =?utf-8?B?MDNXY1V3U0ZkbHBjT2VZUGNueDd4NmZhNHlLL2JKREY4a255U3oranNodWpT?=
 =?utf-8?B?Mzd0bGlZdDBCYjNqazlleXZkYjZCVDZqOEdtU0xFUElQSnppWVVEK2RZVUF4?=
 =?utf-8?B?Z3FyNGNzYnRhU1d4c1R4WStibDA4OXREUlc5OEdRRmRKZlZUbmNaNFBjTGVy?=
 =?utf-8?B?cW1RT0lvNktiV3lENlpCbm9PdTc2NWdlcVdEWU9EeFNqL1RlbCtLKzBEZ3JJ?=
 =?utf-8?B?NDhYbm5Td0R3emZVNFJKZnNJeUlCZHdvRHBWRUZ6S2NmQSttVHFXbUVXdzho?=
 =?utf-8?B?eDFCZHZ1MkZDWm5BUVRESCtGYm04Nm5qY2p2b296QzIzYTRLaitLR1RWVVRQ?=
 =?utf-8?B?UG5lSnowVWpsQnFsbVlxVEVzL3pBRDZQOGkzb1QwQWdObHNuRUY4ZjNZeEkx?=
 =?utf-8?B?WDRIVUZwS1dkc3VaTzhrWEpKN0V0ODhJTW55aEtZTlFTT05rOWNBYnFXaHJQ?=
 =?utf-8?B?d3grYjNRVFJ2MDMwRENYZ1hQTmJSMkZucHhXMjRhM0dPeEVINDZNTG5YVDZ0?=
 =?utf-8?B?dUd0VVplN2NQdVZCQVUwaEpQZUJJQnZhMFBjbVRRdDdlR1pkMWM4cDV3L29s?=
 =?utf-8?B?TlJqWmlPYWtsQ24zMlBoZ2FFYjQwZm4yazQ4UDJva0dVL3R2WldaWjYyNkpW?=
 =?utf-8?B?TmJvTGYrSWVjVkFHaDVmTzAwZ1FLMmhkbHdDa1NiVXRwS2dDUEF2M2I5WVUr?=
 =?utf-8?B?Sm9NOExud05DQ1hyRDUrK0swbVcxdldhcW8za0xjYUN2Z2NYaGU4MWRtendZ?=
 =?utf-8?B?R3dzb2xqNWV3WHZhS29ZWTd4ekIzanlJdGMxOTdrT2owZEZSUnpHUWlteHRp?=
 =?utf-8?B?TjY3d3BzWEtMaUdOejlmZnZLbEYxeGF5YkdNMlFvUVYybFM5VHVGM2lIL0hN?=
 =?utf-8?B?UkFFOGpjV0NPRDdkemZwY0wvRnM4ekNUYVhmK21vWVRWeU9CQXExcldiNG5Q?=
 =?utf-8?B?SmNwNEV2cEFLZ1VXRTNnVksrc1Y4ZTdvQ2VKYlpuVWNzcVlpcVlhL2EyNnYw?=
 =?utf-8?B?dDNoelVFVnNlZndpYUJHaFBUNXEyKzdxbHA1aFc4aTdxMlh5MDNUc1M5VEFk?=
 =?utf-8?B?T0R2MHNvKzc0M0M0MFpzL1BrSXVoTnpaR212MU50TW5nRWFvQmpBYUt3SSsw?=
 =?utf-8?Q?SW2pWJG79QCttAVcGl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e3985fc-0f33-43d9-1486-08de5f4483f6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 14:41:41.2650 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +pogQ1RQIRso4VUqMBfebtPiguKm1a+YRGWAuzdM0jBcI0JH69F+HVip1X6P7lQS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF711010B62
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,mailbox.org,amd.com,lists.freedesktop.org,ffwll.ch,igalia.com,linux.intel.com,kernel.org,suse.de,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 2AE79B1146
X-Rspamd-Action: no action

On 1/29/26 15:33, Hamza Mahfooz wrote:
>> Thanks a lot for that. What happens if you apply this?
>>
>> Can the higher level handling recover from that? E.g. continue after 10 second timeout.
>>
> 
> Without my series applied it just stays stuck (i.e. the CRTC is still on
> the last rendered frame).

Perfect, exactly what I expected.

Can you go into function amdgpu_dm_atomic_commit_tail() where drm_atomic_helper_wait_for_flip_done() is called and add some manual recovery to signal the atomic commit?

Very roughly from the front of my mind:
1. Grab the event lock.
2. Double check if it didn't signaled between returning from drm_atomic_helper_wait_for_flip_done() and taking the lock.
3. If it is still not signaled, signal it manually just like the interrupt handler would do.
4. Drop the lock.

Thanks,
Christian.
