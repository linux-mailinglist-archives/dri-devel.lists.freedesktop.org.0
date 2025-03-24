Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8440AA6D2C3
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 02:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D645510E155;
	Mon, 24 Mar 2025 01:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2050.outbound.protection.outlook.com [40.107.100.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B262310E155;
 Mon, 24 Mar 2025 01:03:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QtMsBnoXmPyNT7KeM/SNcRQbl69N48v8k7S6MEC2/cUiYACeVipRfFN/1UBH7fcUkCLhujXwQqK/QNGpWDthTZoNCVgUajOOXxRAYhp4n8PHwtR6PznK4gzPDcO2iV4cRDt7ol+oqenIfX35DZmLTkZxX8LLby24gbF3DrCUp/8Teny1eyYXEUdOhjztbkAu8lRujqvrJ092+FLN8Ih9IZqCLriz5zzY7aYD+JQ9u5u++otOewJznnN/qtbNL4sfaBO6pHmadhnYNH+vIWJL1qT5NaxxpUXLR+AH6M/Wjur7IgW0bNiSp/+DAL2vgZv8roDm/l9TmMSrA4gaidlJxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=luQqx1BMOT3rBcFW1spHs+SRlLWFlDh5qSAvNtfWkuo=;
 b=lqN518S+eAm0zJ/8uDxfnY6av8OlAt7K29M/RglR7dhymEpYnB0muzqQvp7JBEwA3u9c2OFKsc0K5Y1G1HS1uj2sqZmBAp1j7QHbUPBkLT+kfFrxAncCCJIRHR4mMNeKhREucIMin9mrTfFFLYc+yLoBEe2XsgPNI2LCNaYZGXYIrBGXh1FbDkUfgKA/ST7NPqmuC5ES4QRS0r2Gfv19OSTsguePPAtyvXc9xqMX0tVfB2cEiaRXjNxKo/am++jTahxhu5u3oFeAhrhas5hhapwJebXznUNUgdUCvkmZ7Wr6st3CHFou75Qj3FSEJ4p4YaDE+2m68cyg/EIdulMeAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=luQqx1BMOT3rBcFW1spHs+SRlLWFlDh5qSAvNtfWkuo=;
 b=N0xnuUltYRO56GEbgR/9dumjyb7Dm//OgCdXSMbRn8/hbt9TpSnWE0xI32+xr/ArLynWEHqJ5Ntjg1MKvsxhUtndcCeMdrEJQizvhlHpVU1sae06JMycgoVofv0tVkXbmh5Y/m5G8DEGhjbI++L1Kj+3eGrITAVMOwsr2icTGGVWF7wSLf+WefeHO6gMjghTnKeZ5XrSqTj1XMdZW/uS8UElVuTvo2hydYH/SR7jWyG7qlofQsiKAdBXeyEP55ufVI4TD3LYijCLho/lde4VnV2+R0qDs8/axEw3dtah05PDPMw46zEfrWSMfVYHFUrCsspGiNEsKQvtGbJAoz5t3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6010.namprd12.prod.outlook.com (2603:10b6:8:6a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.42; Mon, 24 Mar 2025 01:03:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 01:03:31 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Mar 2025 10:03:27 +0900
Message-Id: <D8O3BBP1RR5Q.2S2NBBCAEX1KI@nvidia.com>
Cc: "Boqun Feng" <boqun.feng@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "David Airlie" <airlied@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Simona Vetter"
 <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH RFC v3 6/7] gpu: nova-core: add basic timer device
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Brooks" <db48x@db48x.net>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
 <20250320-nova_timer-v3-6-79aa2ad25a79@nvidia.com>
 <Z9xb1r1x5tOzAIZT@boqun-archlinux> <D8LPCCP6JNYU.28DYTEK5BB74K@nvidia.com>
 <87r02qz77h.fsf@db48x.net>
In-Reply-To: <87r02qz77h.fsf@db48x.net>
X-ClientProxiedBy: TYWPR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b361b55-d368-4485-ec05-08dd6a6fb13d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUgrOCtqSUt4L2NwSEFqK0FKdzlnSktzT2FBUnlJblBUemoxUkVnbWljbWpZ?=
 =?utf-8?B?N2FVVXBPaHptZ3lzd3ZrNFZ3WncvQTliVXV4bHB0WlY1QktmZlRDTWZEb1dm?=
 =?utf-8?B?dGQrUStxNXcwOE9MRlMza1ZKSENaTytOVG41aW1Dc3lRdHZSNi9XQWE1UzNU?=
 =?utf-8?B?L0J1Rk1QNEVxWHZqbkVhejVwWUxEVkk5SE0xT0NMTTlIV2U3UlVFQXR2Kzky?=
 =?utf-8?B?ZDFtdnBsNXR6ZUtDZXBZZ1V5ZkFKaFhHMGE5bFZ3Sk9YOGYrb1IyZmVib05T?=
 =?utf-8?B?ZnhsR0hqTWdEWS84Y1EvTTRjZk0wN1lScjQ1ZlpReW04NHZjWksxVjdHTTJ1?=
 =?utf-8?B?MFUrNWp5UE85OEVTcXZDUHFqRzNYMVprQzgycHBBdXM4U3pINDhUYjkwNDlB?=
 =?utf-8?B?R2U5ZGJVaGtrZlpNWHlaRTFjZ0tkYTA1RnpPWUZUeHdiSE5VOFpNcklMMlRX?=
 =?utf-8?B?V0M4aVBSUkhNSEpQNm9INWVFR1lad1NOTTk2VzZ2RmhlYjQ5VWRic2YxQW5s?=
 =?utf-8?B?MU4wb21JV3BZVjVOalNTSEhvVVZ5NzEvOTJiVDhzTWdhUi9sd0t6Y3ZHN05o?=
 =?utf-8?B?N2ptcTMzQ2MvYURNZG1QQmVVUFNiZHpOd0VJSkF2Vk1Rbk1ZcWFEYXRrMXF2?=
 =?utf-8?B?bU41Q0k4dytlQmkvS1lMbjdXdFJwRC9JMXNNS1YxbEtWL1FDUHJ6em5pNFFu?=
 =?utf-8?B?anBKUUljM3lPUXJPVDR0dDBEMmFUd0RLQU80ZVRuT1ZGRS8yekRyZE1MNUtE?=
 =?utf-8?B?aTFuK1ZwdFlLVGFNbFpiMGcxeW1sSHJIankrQnRQRmhYRWY2RWdJTys5Vmo5?=
 =?utf-8?B?WTl6YlZZYlhyM0h3MW4zRjhLL2tIYk5HVGI5RTJTbys1TFM2SVZOR1Vadk9O?=
 =?utf-8?B?blBoaUFNWktOanVBN2xZbkM4RDBaaklZcGMxM2N2STkvYk42eHZIdjRSTTlM?=
 =?utf-8?B?QkU3THJZMitsbThJMEJJTjZ6QzFRZ2QvU3lvcmx5T0ltbklpWC9NRmpXRjMz?=
 =?utf-8?B?bUJMclpkZ1dyWHVYNnpMNjNTOElFVEN3K1h6M01Bc3ltcVRPV3h4a3BxUUsw?=
 =?utf-8?B?b2RkTFpSZ2hPU3J2aEZDc3NPS1l5bTNpTldPSVN0Vno5NHo1MzJoMk1LbkdP?=
 =?utf-8?B?K3FsU2txSnhYOVR6SWNrN1ZOcG1TT3hOSE5BSFZkaUZEL3h3cUdxd1E4YXVr?=
 =?utf-8?B?OWhzaTZ5Q3Byc3dtVjEwNHd5Wnh1clc1RnEwVVJJVGFWM25tSHFRbFpGTzlR?=
 =?utf-8?B?SWI3Y3hVQVpsQW0veFZ2NnVTRTRJdmZ5TEF1ZnhVZVAyNEFmVktMblRQbGlR?=
 =?utf-8?B?R3JkaVViR2gra0FVNEZ4ZS9pN1dERHoyRSs2ZjgrbmU4Z214amxLNlhoU29O?=
 =?utf-8?B?TlRsV1VPOFEySldQNUE1WXBIaUlQZlFLeFNicU1HdGNEa3ppWHVYRDFqRDlC?=
 =?utf-8?B?eEd1RXJsSDcwb0QzcVN0VVByZGFyZGVwNkFBMjV1M0VmeEtEYnhkTlFERWtx?=
 =?utf-8?B?Mll6b2xnTFBNKzRNRGZtZ1lETXp6STE2M1dYODJVZjlycEZwNVMxVHFqVjdm?=
 =?utf-8?B?bjBEdDVVc1BhdTA3cHpDUk1lWERob2JBbUxEdFU3SElDcTIrY3J2TkRodlkw?=
 =?utf-8?B?Y1R6SWJFTFlPOVBFMXFTeDhIbkJUNTZEVGIzSkhBb3o4dHE1SWg1Qk1ub1JO?=
 =?utf-8?B?dFJaYWVsVWREc1BMRjVPbElBeGd0Z2VWQUxySkpwMWlYWWJ0TnlGMnlNaGgw?=
 =?utf-8?B?MWFYUUJleFFTY1pkckxYcmJiaXRuTk54YjJzWUhkaHBGQmhKR3pwZkIvSzls?=
 =?utf-8?B?bCt2RXQ2OUxHeUZwcmxYTEg4d2tKa25FcWt2KzNIa2FlakRZQVpQTEEvYzVJ?=
 =?utf-8?Q?rZMtIhENZ9tJL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDk2MnlkM1FIajZBcHFjWFBIeHgzNVU5TExqVk1PTGc1L2g3dHZqcmh4RnVj?=
 =?utf-8?B?bTcxaHJQbGFXNGxmMVJCTVhaZGhhTVNRSjA1TFhqSHFobERzdGpHTm00aGZw?=
 =?utf-8?B?QlE5aVltN2haQktOYVNSMmpydklmWlRwNjVPa1NhZDF6U2VMNXJrOWFnN3hT?=
 =?utf-8?B?NDF4ek1LZDJrdDQzaWp4RiswRExBZzY4YnBPRlM1cGw0b0pGd3FKdWk5WExJ?=
 =?utf-8?B?TDlFVkxZKzBHN25TdytGbUNKSDZJYXFHQzc3c004UlQvQ0RSVlVVZHdpZzl5?=
 =?utf-8?B?ckcvZlBGQ1FHWWpJY2tVLzVJdWFNRGVNY1lCd20zclMvSGZLQ3lzK0lPUmM1?=
 =?utf-8?B?blhKdUhxUHpveGpiRDNwaGdPcWNRVFVUMklROHlpczZSUHFZL3ZmOG01eDlD?=
 =?utf-8?B?Tlp2bU9OUWptbHFtOUlsWnBoT1dEeVhhcTdsaWt2UjBGUlVhc0dQc1JPTk50?=
 =?utf-8?B?VVJDRVRUYnZOalprelNsMzlkblJGVkhCVnVveW1GWGlQUVRPYU5Sa21NNzZG?=
 =?utf-8?B?Y1grbnZCb3VsSFVXdUFFTEZ1aXVtY2p6NUl4Y0R5WkcvWGFFV2sxZEczQWRU?=
 =?utf-8?B?K0JsanYyd2RKK3NscW8wb05STVVQZ0hJUWI5aGFaYnZNTkwrVEtnbTgvYktH?=
 =?utf-8?B?Y1drMnh5SjJJdXdnWGp1VW1ZNzFaSHl0N3g5cVI3bW5nTWczeVlyNGtKTWhn?=
 =?utf-8?B?Uy9vdU5mSmhjVE5GbmVJSHkxVWhlSDFKcUd4cU5RVFNIZ28wczdiaUNZZ2Rn?=
 =?utf-8?B?aHBBWXhWdmVvYnNSL2dlL3ZWcjhJUUpZaHl6Y0taT2NyRUJyY1o1MkNEVFVp?=
 =?utf-8?B?dlB0VG9RWTJiQ21hY091QWZBOHdjMkkycUpGL1RQNHY4Nk1rb1VYazZ5TzNh?=
 =?utf-8?B?TUhsSEV0RS9CMnRuTkt2OFZhU2tUT1czV0ljVzJKOU03Mnd0QUNVaXNlN3hU?=
 =?utf-8?B?RzVZWmhuWFdIdGF5YVl3Nmc4Y2ZYOGMxK3RLcTlUSW02d2xHMDdxNHFISXpF?=
 =?utf-8?B?Mk5PaTdrU0wyMko5MWNFblhLQjIxWE04YlliZTQvbzBNZElXUFNSelI4M0pi?=
 =?utf-8?B?dzAza1FRZ1dUaW52TSt1N3RtdnpoN29kNXVYZFh4b3ZOc3psSFptUzFvNTkx?=
 =?utf-8?B?SXUvcmZGci9jalBXU1ZwQTUxLzl4cTlpNGJ0dDhvZW54U0VkM0tKVzNlMjRD?=
 =?utf-8?B?WVlPWGlyWVpyQ3NOVnpaaUFmaWV6U250ZG5TQVlzaThFU0ZySXB3OTBtNDBP?=
 =?utf-8?B?cVVFWFJIcEtMM1M5OG1rTUplOXBEQ3llakxtR2g0Mkx6ZTNrSGZTWjNwaVNt?=
 =?utf-8?B?ekpkQTVhdTBXZTdoWmVsU2NHMTdtVks3clVqbkxJQ21yWGVHNFRQSmFhSXha?=
 =?utf-8?B?UEx4cXRRM3BvSjV4Vjk4Rjk2TGxFK3JpczNTZkVpZXpza3BEVm1sSnZYK0hp?=
 =?utf-8?B?cnJKa2lzUm92ZW5zUXpDc3ZWbUY0OE8ramRCZTliSVBiY3k5Y1lCU0hIS3pD?=
 =?utf-8?B?QXVUMnJFR0IvMW5DdjhHVWI1cjVaVFR6YkNmYUF2YnFWMThmdWQ0dnZOUjEy?=
 =?utf-8?B?SldBc0h2S1doRUNhSWg1WE1WSzBSSHNWaDBPYTNZaFo0dyswUnhtMHdRSC82?=
 =?utf-8?B?cEh5WTlMeXVIZVJHZk9HVnhwdzBRYVQ4a0ZLNXZ6ZVRTbGJjb0dpa2gzOU1k?=
 =?utf-8?B?ZFcwdjRMR2NMWGlVeklTRFk3WVoxdzA4RHVKdVBqTVdMNHRhc0Jta3RENUQ3?=
 =?utf-8?B?ajZxYXU3YXVmSUR1Zy95NXg4TGx0NXBjVTRucHB0TVJYV3hkUDZ1bFZvUWx2?=
 =?utf-8?B?YThSdkpsVlVnSkU4QzNhd21WWkRjREtzMEg5QkhHNENRanRiTmVuRnZsdGtm?=
 =?utf-8?B?OU80dktyeEVoMC84TnlWVEhwdEpOS0lITXdnU0F3dkVMcTJrY1BrdzdHVndr?=
 =?utf-8?B?SU5LY2dtZk9CQk5Ra1g0N0RqQnUxZFJyZW5WdzJiTVFXUlJDY2ZwWC9XR3U1?=
 =?utf-8?B?WDZuT3doQUtpRHpEdlgxNkJ6NkVNTHVwbWZieFQ3L2VlSjRsTEtEYjVJRGMr?=
 =?utf-8?B?NFZGNXQrU2lBdEtGMzFLd0tpOTlmampEQVFYSmkwZU1ja1JSTXoyREJVd1c0?=
 =?utf-8?Q?K+d9RlwRf+6EIA57UqiSymdK4?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b361b55-d368-4485-ec05-08dd6a6fb13d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2025 01:03:30.9497 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6bawlSataYlr9L+WN+uhmndzwpqRysVmUfL9+JxQZiZdYVBhNWBV/A8U9ICDNUhHjkb+IRqeaF0YZTkmezZk5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6010
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

On Sat Mar 22, 2025 at 1:20 AM JST, Daniel Brooks wrote:
> "Alexandre Courbot" <acourbot@nvidia.com> writes:
>
>> Hi Boqun,
>>
>> On Fri Mar 21, 2025 at 3:17 AM JST, Boqun Feng wrote:
>>> Also an Instant type has been proposed and reviewed for a while:
>>>
>>> 	https://lore.kernel.org/rust-for-linux/20250220070611.214262-5-fujita.=
tomonori@gmail.com/
>>>
>>> we should use that type instead of re-inventing the wheel here. Of
>>> course, it's currently not quite working because Instant is only for
>>> CLOCK_MONOTONIC. But there was a proposal to make `Instant` generic ove=
r
>>> clock:
>>>
>>> 	https://lore.kernel.org/rust-for-linux/20230714-rust-time-v2-1-f5aed84=
218c4@asahilina.net/
>>>
>>> if you follow that design, you can implement a `Instant<NovaGpu>`, wher=
e
>>>
>>>     ipml Now for NovaGpu {
>>>         fn now() -> Instant<Self> {
>>> 	    // your Timer::read() implementation.
>>> 	}
>>>     }
>>
>> Ah, thanks for pointing this out. I'll keep track of these patches,
>> hopefully they get merged soon!
>
> Would that actually work though? Instant is a ktime_t, which is a signed
> i64 rather than a u64. When I read your patch I assumed that you had to
> add your own Timestamp because the value had to be whatever was read
> from the GPU, independent of the clock value kept by the system or other
> hardware.

That's correct, and honestly there would be little benefit in using an
already existing type outside of not re-writing very similar code as GPU
time stamps are only used locally anyway. I'll keep an eye on these
patches though in case we can harmonize things a bit.
