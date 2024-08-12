Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905F694EF21
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 16:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D7BB10E22F;
	Mon, 12 Aug 2024 14:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4ISe5BQ4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0503D10E22F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 14:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tSqOPCZ3Mnwd3Cu03spXhCEejewdHAvS/q699Q5eMxRLFuhReRGtFM2HZ/uBdY9rP/F/+hmagW1kwMErtkFdNB8uVtPMWOAioQ1Y845laMekX4nxQmjDPHtQQrPM8PmwheAMnSNzSDo+Wv0CeWaQHNOWhxafS7D8xrBI5PXZginCRf6EWRunTLCAxWdFNTD7CxbKpMahur/lqqia0t9ef6P8qoUVFMRoKAPvRdXx2hpEnBQoQTRGUotX1pN62c7qZxbn8hZ2wlibAZJI84ap7zVn8m2IQZkEMWkzwRGHUmLBJxpLUqCWRdUGRDsCkmNmoTwieRe2bQFRVlXD00IKxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHDXotm5W7Y6GApY5YAS3hWIAM+2gpC0oPEDAsV9cY0=;
 b=i1RBT4R5LR3kSZ3MAzMnXPoyxSDRuP4+J0/4OYQIcT3v0pJkO54rnJiNY0InFFwiY+z7kMcYhht6zTsuczFQFTT75UNsBBCcB7+Z8JvDGgRetWfYp6AiEBHRflAMYvsRQ8bX3v9OV58zvokCuMkj9R3OTi/fef68j+vv8JwxtCu2iHEZwTxv+b+/O/1jlkf/VcpoxRRGxR5S0Q/lAdbqPTlctOu9z6UcNdXUdrK1VCLALeuTyN8bZgaONpUJOWNB8Y7S3uMlWjIrf82Uiu4uQESLunDxWttB4JRFtTY6eRc4sj/uUY/PyVFytABVata0I8O/VD6ESLIL+VNAwi5dig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NHDXotm5W7Y6GApY5YAS3hWIAM+2gpC0oPEDAsV9cY0=;
 b=4ISe5BQ4fcqceBKDJt/tHxESdwO6LwrTgPs+EUCxwhG977xJj0s7UQMj83nrHnGx/4eosyaSf4bOTqSvXCDGwKbELnxPT99fv2lk+v6ayMtLS1hCtYtn1UjVd5BNpoo/F911jFod/a1M+UOfpdrgX7ZmP9ox5afx2r1bcsgDdRU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN7PR12MB6839.namprd12.prod.outlook.com (2603:10b6:806:265::21)
 by SA1PR12MB8741.namprd12.prod.outlook.com (2603:10b6:806:378::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 14:06:23 +0000
Received: from SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4]) by SN7PR12MB6839.namprd12.prod.outlook.com
 ([fe80::eaf3:6d41:3ac0:b5f4%6]) with mapi id 15.20.7849.021; Mon, 12 Aug 2024
 14:06:23 +0000
Message-ID: <2a88d198-f3b6-4684-b528-4aaaa0340d46@amd.com>
Date: Mon, 12 Aug 2024 10:06:19 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm/rect: Add drm_rect_overlap()
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng
 <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@samsung.com>, Alice Ryhl
 <aliceryhl@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>
References: <20240812123147.81356-1-jfalempe@redhat.com>
 <20240812123147.81356-3-jfalempe@redhat.com> <87sev926na.fsf@intel.com>
Content-Language: en-US
From: Hamza Mahfooz <hamza.mahfooz@amd.com>
In-Reply-To: <87sev926na.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0023.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:6a::19) To SN7PR12MB6839.namprd12.prod.outlook.com
 (2603:10b6:806:265::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB6839:EE_|SA1PR12MB8741:EE_
X-MS-Office365-Filtering-Correlation-Id: 33166872-c74a-4919-16bf-08dcbad7f2f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NjNXN09pTmlhTzliZ0FyNFBrNklJbU41RURPYWh5dmw1NHVyZGs5QmlwQXQ2?=
 =?utf-8?B?UmNQdld1c2ZZOWlRRnNvTlJFUXZsNk9qOVIyYkZ0ODFIc093S0RmUHlQSXcz?=
 =?utf-8?B?OE8rT3RGMEl2cFkzOXdkNTV0bUxBZEFhdWdXTnkweit4V05KTktpNEdCWXdI?=
 =?utf-8?B?RTZXcHRtVEI0U3R3L3E0cFdIR3JON05rY2ZYeEdDY0pVMUFxbWYxSnN2V0R1?=
 =?utf-8?B?K2Q0N2x2U2FiYWZiZVFBRTB0ejdDdjg5SFRscnhwOFVJaTV0T1VyVUhTV2RM?=
 =?utf-8?B?b2ZUdVdxRkxpMjZ6T0ZvSHlMTWp1WUtsSUIrSlk2M2RxRXh6SzVNRzdJZTA2?=
 =?utf-8?B?dTBxajhDZENCQ0lNWGlPaGFjd0ptbG1HaXpwdTlJTGxHaHFxZTFHcEV6SS9W?=
 =?utf-8?B?U2h1VUMyOFBLR2VpUG01MVd5UUpKUjNwTDNISDFYUzZHQXlUUkRrWGVVeUFK?=
 =?utf-8?B?SUhVUzJIekpmeTZ3QUMwTnYycUNCWXVUVXgxRE1Fc3ZYdmluZTB2M3JEODlu?=
 =?utf-8?B?ZUh3STlaV2RITHJXa3BINjBpYTVkb2hLUDJVMWV3dnhNNnBEN2NvbDdpLzJJ?=
 =?utf-8?B?T1N4dzUvNzVKQW9yeWRVR1E0STRzb1ZJYUZET2JlS1YvVVhncUJVbldyenY3?=
 =?utf-8?B?VUVteXhLQWdIT2x2emE3RWpxWjhwZTljNFNPSmRwaUpkaVBxUFlsdGRDOGJX?=
 =?utf-8?B?djdzK3dWU0F0LzZwdjRaYXI1enpFK0tPZnFTaUFGN3FtNlAvRGd4YXg4bnFK?=
 =?utf-8?B?NS94SWloOFNIank2RUdOR3ZxVFI0QTNLZy9RcHhyYmtoVjlyTzZJbVh3cjZ6?=
 =?utf-8?B?ZGYxbkhCOEFRQVkrTXpFZnRPTlMvNC8yWVZITmJXMlNqR0VteXhWK0ZxMFE1?=
 =?utf-8?B?U2EyR1dXUkRNZkpnS045Vk54QUxQN095Q0FSYkQ4QkxRUjhvOTV0UkVJSW5n?=
 =?utf-8?B?ODVWWkR0aEE3cHZlaFBJcUZSUEdvNUkwQzRZWkFSUE5nTnBlL2VFa1RkakV5?=
 =?utf-8?B?cmt3bHhCOFdCSXJzWWtreEtrS00rTWZtMFVSNElpNHh1RXJQc2ljNkpaYUh2?=
 =?utf-8?B?aEJ3TmczdDNXeEIyWkxFeDFqK3ZoNDdYT25MLzE2V2pGT1Mrd2NaSGhhMjFu?=
 =?utf-8?B?MlR4ODdCcGtuUm9BaEpYS3VzT2lPdUJwOHRLTG0rTGUza3E2VEtoK0VDNEhy?=
 =?utf-8?B?ckppbHBrYzRWcmpuMFp5TUZ6ZFk1TDJzcjNHeEE0QnNOOEorTFRWczBRc3FV?=
 =?utf-8?B?eFFiLzFTNWFYcUx1V1g0anUxQ3dPQ09mZE00cS9URmxqQzQ1cFJxQzg3b1Rs?=
 =?utf-8?B?Y0owdDZHZXUrbEhTNzhEeFI1N241YzV0NDREcXFSM0J3TEtQMTgzRVlVNUll?=
 =?utf-8?B?MDdYMEVOYW5SNjZtTHowUHByck8zNVQxR1NBaU9rMWJGMHdTUm5pU3N0bFVH?=
 =?utf-8?B?dEdhT0VROXViVy80eUFoMmdPeE9JaEZuQ3M2NDZwWjJJRlN4V3A3c3EwSDFY?=
 =?utf-8?B?ajUrWjdQNlNjaWVMV3hZVFc2YzF6bFJmNW9HeVBUdlhNb25SQm1Wclliclho?=
 =?utf-8?B?dzZlTWV3Rk9wVWNxQkxWb0hza21EckFtL3JXQVFNakU1SURDTmdsRGQ1a0l0?=
 =?utf-8?B?N2pZdC9vM2l1ejc1ZGxyRHd4T1RDTm1zOEIwQTVFaXN3ZmZCVTVNRk1zY3o2?=
 =?utf-8?B?TGU4MTM3Tmg2cUFQWWRUcnRUSTM2WU1vb2U0d05vTWd5My9UeVU4OHNzZ0t2?=
 =?utf-8?B?VzR1SHFydHFIREtPRGppMnBHbjZ3RVdLall2L0JubVBHaG14d1dPZDJDc0xD?=
 =?utf-8?B?M2xnWCtNUnUvK3lrbkRjN01uVEgwbkVvV0ZhcDJaWTlLb3pYZ3RLY3JYazB1?=
 =?utf-8?Q?QyrPXPZMyYPMW?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB6839.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnRITTBsQVVoVnN2aHhJRDdRQzNKRTcvZmZUVmhQMTlrbWlxMytDeW1ZUStD?=
 =?utf-8?B?RjhTeHdmYXR1YzFwQnVKeTVPNWl4TUFqcDlQakdrTFpOU3VQQlY5bTFWZy9v?=
 =?utf-8?B?OTFzTHpDekQ0elAzc0VtR3g4YUozZS9DcFV1Uk1ibUJXWWlMTGFrNUVZcUVt?=
 =?utf-8?B?OXptWEduV0NPNUp1aFBFNm5ZMjQramVES0dIRU1mS1NnNHV3YTdnQmJuY3Z3?=
 =?utf-8?B?VWhxZVlhWW5XTzMxTHpxcnNJK1hsSGp5WWlWWG9hS21aLytmeEZWK05RcTZj?=
 =?utf-8?B?WUpONEdHYTh0Q3NiRFJVd2FsQlJBazJ4NWgrSTJHcm01cEZlb1RmVkpUbkN2?=
 =?utf-8?B?N3lvaUs2NXpIN0o1RjN0dmRGMXMxNldDSVAreUtjRkZvY3dveld6SjNnVGZv?=
 =?utf-8?B?M3BuQ21WUEZ1QnEyYzhsSEcwRWJwSWh3UzgxOHdOZlpqZTV2NWVTc1A4c3lU?=
 =?utf-8?B?TWd2cVA0Q29vNnBsU2V2M09LM0RjaWU0RmlSeENDMlVTdUpUVml2eXBReG1z?=
 =?utf-8?B?MHdGbGhNTk4rYVdpMWp1cGlOd1RTMkNyWkF5dUNZb0ltMTMzc3NXRExMb2tI?=
 =?utf-8?B?WlVvc1g4cHpEdm40ekNFSTZjcjVURExYVTlVckNvZTRsR3gxYnV3ZFFGbTFy?=
 =?utf-8?B?OFhWanFFUisyd1doV3JmYmpOakpiaG12eTNUaURrMXpmUVdnSW1nQXV0enhO?=
 =?utf-8?B?Tk9Pa1V4S0xDNU9UeGY5aUFaNmVSTFR3SUVPbzkxWmtPejhoLzZ4UXV2OFNG?=
 =?utf-8?B?ZFRoME9xY1hmZDlrWmtSYndyMmV4UmpTNU9HcHEzRHhmNVVzbXFrM0VXWERF?=
 =?utf-8?B?eTRTbDRYTnhrTDd3K0pEVGVLZ3lTenc1cEVhMnl1NmxiVE9KRUhaWUhTUko5?=
 =?utf-8?B?K1ZENklhREhkSnVCbW5vRjU2TTBWZGxYL0wvTUNYM25NUmpSZUxKbFc4ZVBJ?=
 =?utf-8?B?QnQzeWRDamtvSkVZZ3YwY3RRbjV6VFFrOTFpc2I2VUF1Z2huSXorQXpHUXNw?=
 =?utf-8?B?RWx5TlpSc2t5aVp3YnNqNm1vSVVETXVDNFE1dHpXWGJ6MFNSZnMwUzJnc2hN?=
 =?utf-8?B?eGFSYnV3MW10cFpqNFdtRzZwNm1uNGRMY1BYM0YyVUJkcG81Y3BvaXpSTnFv?=
 =?utf-8?B?TFBldktOY25kZVpJNGVZU0RkMUtuZDYzaGo5cjdvQ0o5YXlsZzRkY2I0d2Y3?=
 =?utf-8?B?RjZEeE1GSDVOTytXam5SUURxSEJ0TXJxeUpmWUF0V1F0dVpWTmY2NXRick54?=
 =?utf-8?B?Ty9kQi9VTlYzbTFWQ3lZMnU4eUFtdXNVa1pjYmFMbkVleTBRMG9zZDJBaDFB?=
 =?utf-8?B?ZTVFQjcxY3QzVnk0WDhYeXhidm5HWnl4aFU4a0VENUJSUEZIcjRVQVBDMzE1?=
 =?utf-8?B?UW1oOHFXQkFSaWY3bU9tZzI3eUF1bFNkL1BiRkFUZjZIS1NuVVVCNU9nbW9a?=
 =?utf-8?B?Yk5DU1ZkTnZQcnFrbkhhV3U5R3BqNkhTb0lOMUs0WWU3OHFyWkpIWS9mUi9u?=
 =?utf-8?B?SzgvWmRkMHk4MHQ1cCtHMGQyd0FZZ21wUVpTOHRJdXRJQUNSQ3RWMWg3YXNM?=
 =?utf-8?B?eXJOVkh2MzBjUGVVeFRUa0pERm5rZlh2d1lmai9QUEF0dm5KcWUwN2xkSm42?=
 =?utf-8?B?VysyaHN6SjZwdVJLNWJhRUdEQjcxbnJQd00yamFoM0YvU0o5TE5zYUxUdmRl?=
 =?utf-8?B?dFdEanZsSDN2V2k3S2E0eUljbXlFaFVVditlY2RKSlVFdDZkeHNMV0gzbVRX?=
 =?utf-8?B?Zkt4NVB2MDRkNFhGbkQ2MXlHcnlFelIxOEFFQk8rM29vY1Z2M1drUFZUZGRJ?=
 =?utf-8?B?S09EdFY2M2M0SVBBaEx2d2dNWmlRODArdG9semw4SmM0NnFXL2k0K1ZwbGVJ?=
 =?utf-8?B?dlRMaHU4N3RqS2pDRlBUOGNNV2lEaE9qN2ZOTVFmVmppemQrSXBFdDVoRUNR?=
 =?utf-8?B?MnhOYzNCNXlYUmdlVVJnaGh0WFdVMzVhUmFaQVVpOFQ5b3NiYTR2UjNOZTl1?=
 =?utf-8?B?ZVpzV2ZDUElHR0lRcHFydHVIUERJbFBETk5wMEdQSEFENGJlK3E1WXdENVQx?=
 =?utf-8?B?NVVwdFVPTi9LSU1WN2s1b3FrREI0UC95bXZLazhYWEg2NzdGaUNJVFMwSUFP?=
 =?utf-8?Q?is/8s6dqFkdwAedkVlR3zOIP+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33166872-c74a-4919-16bf-08dcbad7f2f0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB6839.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 14:06:23.7477 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hk7dWjz3ZGVGVC7sIL91H5HTyZOGjkCrcftEKVlAx5tFuaYOoimIFQnLFyE+Qg4AIW2NqkwAqCLPHHOCDg7vlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8741
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

On 8/12/24 09:49, Jani Nikula wrote:
> On Mon, 12 Aug 2024, Jocelyn Falempe <jfalempe@redhat.com> wrote:
>> Check if two rectangles overlap.
>> It's a bit similar to drm_rect_intersect() but this won't modify
>> the rectangle.
>> Simplifies a bit drm_panic.
> 
> Based on the name, I'd expect drm_rect_overlap() to return true for
> *any* overlap, while this one seems to mean if one rectangle is
> completely within another, with no adjacent borders.
> 
> I'd expect a drm_rect_overlap() to return true for this:
> 
>   +-------+
>   |   +---+---+
>   |   |       |
>   +---+       |
>       |       |
>       +-------+
> 
> While this seems to be required instead:
> 
>   +-------+
>   | +---+ |
>   | |   | |
>   | +---+ |
>   +-------+
> 
> 
> IOW, I find the name misleading.

Ya, maybe drm_rect_encloses() would be a better fit.

> 
> BR,
> Jani.
> 
> 
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/drm_panic.c |  3 +--
>>   include/drm/drm_rect.h      | 15 +++++++++++++++
>>   2 files changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>> index 0a047152f88b8..59fba23e5fd7a 100644
>> --- a/drivers/gpu/drm/drm_panic.c
>> +++ b/drivers/gpu/drm/drm_panic.c
>> @@ -529,8 +529,7 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>>   	/* Fill with the background color, and draw text on top */
>>   	drm_panic_fill(sb, &r_screen, bg_color);
>>   
>> -	if ((r_msg.x1 >= logo_width || r_msg.y1 >= logo_height) &&
>> -	    logo_width <= sb->width && logo_height <= sb->height) {
>> +	if (!drm_rect_overlap(&r_logo, &r_msg)) {
>>   		if (logo_mono)
>>   			drm_panic_blit(sb, &r_logo, logo_mono->data, DIV_ROUND_UP(logo_width, 8),
>>   				       fg_color);
>> diff --git a/include/drm/drm_rect.h b/include/drm/drm_rect.h
>> index 73fcb899a01da..7bafde747d560 100644
>> --- a/include/drm/drm_rect.h
>> +++ b/include/drm/drm_rect.h
>> @@ -238,6 +238,21 @@ static inline void drm_rect_fp_to_int(struct drm_rect *dst,
>>   		      drm_rect_height(src) >> 16);
>>   }
>>   
>> +/**
>> + * drm_rect_overlap - Check if two rectangles overlap
>> + * @r1: first rectangle
>> + * @r2: second rectangle
>> + *
>> + * RETURNS:
>> + * %true if the rectangles overlap, %false otherwise.

If you do end up going with that name, the returns doc ought to be:

%true if @r2 is completely enclosed in @r1, %false otherwise.

>> + */
>> +static inline bool drm_rect_overlap(const struct drm_rect *r1,
>> +				    const struct drm_rect *r2)
>> +{
>> +	return (r1->x2 > r2->x1 && r2->x2 > r1->x1 &&
>> +		r1->y2 > r2->y1 && r2->y2 > r1->y1);
>> +}
>> +
>>   bool drm_rect_intersect(struct drm_rect *r, const struct drm_rect *clip);
>>   bool drm_rect_clip_scaled(struct drm_rect *src, struct drm_rect *dst,
>>   			  const struct drm_rect *clip);
> 
-- 
Hamza

