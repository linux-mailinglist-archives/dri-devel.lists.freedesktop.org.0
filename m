Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706B0A3D39A
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 09:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88A6A10E8E1;
	Thu, 20 Feb 2025 08:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=de.bosch.com header.i=@de.bosch.com header.b="RIOZeZlh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2086.outbound.protection.outlook.com [40.107.22.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 171CC10E8CA;
 Thu, 20 Feb 2025 06:23:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ei9Qllv8rZ5Z0rNTwdU0MGCF55A78yZMTNIkvK3+wKLB8Q7MC+H6Ip3U8Cf0CruuAEhfIiSpXk7RH4UJyHG9ET1OIvzmwrVlpqV8NrLkB//m06uJZ0pGn6FqKazl2nPTk0rgtG6w/DWKY+LUqImijI5H87JsVWXHz9dfXyhczRIid5ktg9O9VlQ1C5QaYS/jBeZo8a2A3Z8NPbppAJQYuP13qE67022iVKoYrzHQ5jNHj4bm8IZl2KS7E2PxlEx1wAktU1B63j+B5ZHu4FWlW/UBbK4F251PweS62weAJlQ8vo+doz7L2ES87phyIYdbFu7mtAeS1xTXvBJ5zemraA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3s/D5YZOhh6AmuqgdpyWT9gp340ibbCmeMR9Gyf/BJw=;
 b=KjZgtI+iZYi5+LPnsTUyjXiFGVoxellORIl3MDXaql1oCj8d4zz1A/a7RtbRG3I7YmTr1dYuBdW+40Hi8OOUv48q80HiAIfy4LBU68TFdaIteeBSu6GF7QXH12MYhwinVprjV7XO6hHqbqB1iXl1EmY8/6Af+qMkNX0C94BOL65jl9j2y+cyOuuUf6FmscO1Yld4/eBqyO1eJcILQU/bj8VvIrbN7NDCiE53lI2OOY+oo8x7/r5btPEywDvovpOMbWoEPP4uv/SFrUhkSevJKVDghufc84T3CoXLfQeLDYKYvjvh7/lom7kxHhxL+jZIm3eL/dS8Pukhqb2vHn5yRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=nvidia.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3s/D5YZOhh6AmuqgdpyWT9gp340ibbCmeMR9Gyf/BJw=;
 b=RIOZeZlhn+JlYuJDligr4IQ7qgb2DgLbuD38JfU2ns6iVZjQjtViy94SOHHKL3rfUG3+K0WNqN7GI15f7i13I2F5Bsozbj/R9LQJFAy0CvBb40IHah6oooEJ0oKfT92J/VAo325PRJL6vJ6RAqOxykYcOQKlySjuG9z4l4a7iRmCATBLyV0aCnLckR5iYmYcQ0Cj5y4H5mRqdRV20FHr4xeJL1F1axOmmJH8N6bnYMHF+IUccc9TIEtoyQrCTp/s7rbA9WJ1VUDwrF/BtSM66mV6dgeIN+Q15bgkO7kShE6IBfVIEiq/PxUgcnZl6SGXSUAeph9zuJWDqZniuRtOOw==
Received: from DU7PR01CA0014.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::21) by AS2PR10MB7687.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:642::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.13; Thu, 20 Feb
 2025 06:23:47 +0000
Received: from DB1PEPF000509E9.eurprd03.prod.outlook.com
 (2603:10a6:10:50f:cafe::76) by DU7PR01CA0014.outlook.office365.com
 (2603:10a6:10:50f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.16 via Frontend Transport; Thu,
 20 Feb 2025 06:24:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509E9.mail.protection.outlook.com (10.167.242.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Thu, 20 Feb 2025 06:23:47 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Thu, 20 Feb
 2025 07:23:47 +0100
Received: from [10.34.219.93] (10.139.217.196) by SI-EXCAS2000.de.bosch.com
 (10.139.217.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.43; Thu, 20 Feb
 2025 07:23:46 +0100
Message-ID: <af1afdfd-56fc-4101-812f-e33a370cc4e4@de.bosch.com>
Date: Thu, 20 Feb 2025 07:23:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH RFC 1/3] rust: add useful ops for u64
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, David Airlie <airlied@gmail.com>, John Hubbard
 <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
 <8d95cfde-30bc-4937-99d3-0077df43867a@de.bosch.com>
 <D7VLEXCQ5VYN.3N0G7XXCVLH6L@nvidia.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <D7VLEXCQ5VYN.3N0G7XXCVLH6L@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E9:EE_|AS2PR10MB7687:EE_
X-MS-Office365-Filtering-Correlation-Id: 81896265-b0f3-471b-d7b6-08dd5177224b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YnROZEdIRG1pb0kzN1FLM0IrdHB5bmxYc2xNaEpvQlg1RnZwR0tKcEMyY3M1?=
 =?utf-8?B?KzBUNjF4czU4enc0KzJJUUZkVkZZS0xYUVdka3k0NGtIVGNUUTJKWXozSkd4?=
 =?utf-8?B?UzhMKzUvZVhtU3BTVnZRVUoyaCtVUDN0UDBKcCtUaTFUZS9veG13WXBoOE5R?=
 =?utf-8?B?U2E2SkE5Mlp0ZkM4ak1CeExtTHhyeTRBTzVybDRvdUYvemgzb2JjcHRKcEE4?=
 =?utf-8?B?dVpsMldRdFVPSkdCY0ZHeVUrSFRaSEhVV2NEb0I4VmRWdDN4SEc5R1RkYWxn?=
 =?utf-8?B?TmQwUEVJU3pLNHBjeEFkUzd3UFRMRUF1Nmg1NzdieFB0OG5XZ2JrL2NINm9B?=
 =?utf-8?B?dmJWdW5WNitkd3g2N255MlNiRk9lVVJhdUQ1WU1RZTN6L2g3Y1pHbXU5U0w1?=
 =?utf-8?B?djY5WCtDVDNtUitaS3FiMGJhQ2twbVhmenVUYUZCTGJxbTBPUjI3NWFtTHBU?=
 =?utf-8?B?T0lZNTlRVWJVZkdjR0VFSXZzU1dDbzczMExTQ3E2L0VqcW5iallWQ1BNc2NU?=
 =?utf-8?B?dXk5Z3ZQOER5a1JaSDhNZUZjSFpoZk05TWFOdVhkT1BVdHFCUkFNV253dG9n?=
 =?utf-8?B?OENRTzBGTmJERmUyN1VHdzVCdnhDWDZRRDNzbjA5T1NkWUlwbTQ5R05NcGU4?=
 =?utf-8?B?QTVwYXF5V3U3Q2pxWWNIdksyY1RZS284WGxXOUZKNXIrd2RjeHBranJacFp3?=
 =?utf-8?B?SkhJZUhpL0hmaHZqRGJpRTJ0eWxpWklpdkk5eldOQ0c4cFNhbnVNb2VWL2VC?=
 =?utf-8?B?Z2x6Z1Fxbk5CdzFNUzZST3RnTHRxQlN2L2krUVUvYjc5NkdadWFoUG9mbWJQ?=
 =?utf-8?B?RzloOXhGSmVCaEl4SVpuaWJ4eWgwcUVsUzlnb29HVFAwRUJsZ1JiWWtpTHpo?=
 =?utf-8?B?Ymo2VllnbEtBbGVrdFJyT1pZSmtWVXhwbWZMaHFaVURQaGxvV0dlbjkrUHpx?=
 =?utf-8?B?V0M5T2JRUWl0Z1JrSVlWam9Od0E4cElMMDhiRVJoK29udzlWOXhHVTlwdm9Z?=
 =?utf-8?B?bGh5UTRqYlFwUEFUbksycC9KOUJrSTJmQ1NraXZSZ3k0aUVjTWdPU1haSUJB?=
 =?utf-8?B?WHR4NUk4b0ltVTRJNlRLQ0NYSFdiazJycXVzZnd1Y3pnZld3eHo1aEtPWjJF?=
 =?utf-8?B?WkdGVWdpTVl0eDNSRTFCTGFjeUdSeGNxTGRTU0VpUGVOTmRHclBzcGUzZjI4?=
 =?utf-8?B?KzVOdU51TlQxK3N2ZWhTSTB1bnBIdlI4eFRLMVJNQVFYNnBGY3V5UTBRSVFi?=
 =?utf-8?B?cWk5T2QxVE1MRmVSOG9UemkvUUhwZHhRWHI4SFRMRmdZOFkvRUdxRUFCQkhE?=
 =?utf-8?B?YUdneDRvWXZYSU5iMFNIdFYyY1g2aEI5OXpWaEtxaCtmcjVLNU1Xd01zQlFi?=
 =?utf-8?B?TkNGZUp1VXI0NER6QmpObCtJNE9rRU9ENUh4L2hVdUV0T0dyZEdDTnA5SHNr?=
 =?utf-8?B?blRrYWxuZlBBMnM5ZGpJL0V6MnJEOFRnRWpBYjRjNU9YeVdoNGlmSVNQM1hE?=
 =?utf-8?B?RElBT1E0aWRWdlozT3RCYzhaOTBQUkVjbyswMXlGLy9JSFRCNVBzbURLZ0VJ?=
 =?utf-8?B?ZGc5c0hnRjFzME03OHZQVzRMMnZwNnBmVUUvU0xyZTlYWHZMWjdoMVBwcFU5?=
 =?utf-8?B?b1NrRTUvVHRVOUNYc3dxR1RZWVJ4SEgxbmJob2tacGxIVFJXTjBodFBFRDlX?=
 =?utf-8?B?WERxcDZvTGFwN3EwMUtVOThrRnFJZGVuOXJiV2hFWE53SEpMK1VUMmJtcDhT?=
 =?utf-8?B?WnBwcWJHR2dnYXdiQ3hITk9ybFFqRUVpTHBZVVhlcFpTRWFtMXRJeENJL1Za?=
 =?utf-8?B?RDhmVmxZMmRoU0V3QWtheDNzNVVObzYwNUxlbFd5VGxoSEEyMDAxaXJ2OFZM?=
 =?utf-8?B?b2d3UU1ZTU5Fd0pPQ2JlbW5DL3g3a3praklrN21BME5GNkpCMGFUZzJDRnlk?=
 =?utf-8?Q?8CpODyr4F+I=3D?=
X-Forefront-Antispam-Report: CIP:139.15.153.205; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:eop.bosch-org.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(7053199007)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2025 06:23:47.3894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81896265-b0f3-471b-d7b6-08dd5177224b
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4; Ip=[139.15.153.205];
 Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E9.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7687
X-Mailman-Approved-At: Thu, 20 Feb 2025 08:48:19 +0000
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

On 18/02/2025 14:07, Alexandre Courbot wrote:
> On Tue Feb 18, 2025 at 7:07 PM JST, Dirk Behme wrote:
>> On 17/02/2025 15:04, Alexandre Courbot wrote:
>>> It is common to build a u64 from its high and low parts obtained from
>>> two 32-bit registers. Conversely, it is also common to split a u64 into
>>> two u32s to write them into registers. Add an extension trait for u64
>>> that implement these methods in a new `num` module.
>>>
>>> It is expected that this trait will be extended with other useful
>>> operations, and similar extension traits implemented for other types.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  rust/kernel/lib.rs |  1 +
>>>  rust/kernel/num.rs | 32 ++++++++++++++++++++++++++++++++
>>>  2 files changed, 33 insertions(+)
>>>
>>> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
>>> index 496ed32b0911a9fdbce5d26738b9cf7ef910b269..8c0c7c20a16aa96e3d3e444be3e03878650ddf77 100644
>>> --- a/rust/kernel/lib.rs
>>> +++ b/rust/kernel/lib.rs
>>> @@ -59,6 +59,7 @@
>>>  pub mod miscdevice;
>>>  #[cfg(CONFIG_NET)]
>>>  pub mod net;
>>> +pub mod num;
>>>  pub mod of;
>>>  pub mod page;
>>>  #[cfg(CONFIG_PCI)]
>>> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..5e714cbda4575b8d74f50660580dc4c5683f8c2b
>>> --- /dev/null
>>> +++ b/rust/kernel/num.rs
>>> @@ -0,0 +1,32 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +//! Numerical and binary utilities for primitive types.
>>> +
>>> +/// Useful operations for `u64`.
>>> +pub trait U64Ext {
>>> +    /// Build a `u64` by combining its `high` and `low` parts.
>>> +    ///
>>> +    /// ```
>>> +    /// use kernel::num::U64Ext;
>>> +    /// assert_eq!(u64::from_u32s(0x01234567, 0x89abcdef), 0x01234567_89abcdef);
>>> +    /// ```
>>> +    fn from_u32s(high: u32, low: u32) -> Self;
>>> +
>>> +    /// Returns the `(high, low)` u32s that constitute `self`.
>>> +    ///
>>> +    /// ```
>>> +    /// use kernel::num::U64Ext;
>>> +    /// assert_eq!(u64::into_u32s(0x01234567_89abcdef), (0x1234567, 0x89abcdef));
>>> +    /// ```
>>> +    fn into_u32s(self) -> (u32, u32);
>>> +}
>>> +
>>> +impl U64Ext for u64 {
>>> +    fn from_u32s(high: u32, low: u32) -> Self {
>>> +        ((high as u64) << u32::BITS) | low as u64
>>> +    }
>>> +
>>> +    fn into_u32s(self) -> (u32, u32) {
>>> +        ((self >> u32::BITS) as u32, self as u32)
>>> +    }
>>> +}
>> Just as a question: Would it make sense to make this more generic?
>>
>> For example
>>
>> u64 -> u32, u32 / u32, u32 -> u64 (as done here)
>> u32 -> u16, u16 / u16, u16 -> u32
>> u16 -> u8, u8 / u8, u8 -> u16
>>
>> Additionally, I wonder if this might be combined with the Integer trait
>> [1]? But the usize and signed ones might not make sense here...
>>
>> Dirk
>>
>> [1] E.g.
>>
>> https://github.com/senekor/linux/commit/7291dcc98e8ab74e34c1600784ec9ff3e2fa32d0
> 
> I agree something more generic would be nice. One drawback I see though
> is that it would have to use more generic (and lengthy) method names -
> i.e. `from_components(u32, u32)` instead of `from_u32s`.
> 
> I quickly tried to write a completely generic trait where the methods
> are auto-implemented from constants and associated types, but got stuck
> by the impossibility to use `as` in that context without a macro.


Being inspired by the Integer trait example [1] above, just as an idea,
I wonder if anything like

impl_split_merge! {
    (u64, u32),
    (u32, u16),
    (u16, u8),
}

would be implementable?


> Regardless, I was looking for an already existing trait/module to
> leverage instead of introducing a whole new one, maybe the one you
> linked is what I was looking for?
Cheers,

Dirk
