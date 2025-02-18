Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B45A3B3EB
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 09:31:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 055B110E793;
	Wed, 19 Feb 2025 08:31:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=de.bosch.com header.i=@de.bosch.com header.b="JX72JEYL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE0510E33F;
 Tue, 18 Feb 2025 10:08:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jt9dB/nmLhEHKvFsYfOXJ1bflQgBqyG/32YmezM6C9TmV6ixterw5MMrgkJ824sbXzR1vjw3F3jq/jj8xqg0+V/6KCvaIdNinMSdMDNpAobinsUfiHMEwB4+0520hVFWlDtgz/S/zMMTRpABA2061f52fg7RKx/+m5gSrXs/q2S6ld3hNbn2OEZIRjNI/6X+4YP+qsf9hXe5Lqy7YMtXb/3Do5uVoK44iNBalSEqrq8joBnp6gX0wC13qs2NvmhqVSSsOVbh8jWRqmJW8Td9MvABHzbAUtPv4DX6FxSmjcbR+zklBTe/NWUCfeAoNXbv6eI8kVj8WX8nexDpRJ5oDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9Jx9BPbbTkvngg7lfIg3yOoNY7GJbz2qTHa2w/pZ+fI=;
 b=gOM6sgvq2CTEqQ4jUTs9G+LVBb0+b9NA8Wqemi8a7bVYK/6dW73g5MCDVDc/oPoidfMIWiXg+U9gI9dfNr8yQRw+zm3No0YfyeCk6IG6OtZ5TDquhP9LmphblclP7R3zLTMZebploGoSQVgyd75ECku/n4hKbQXtfY62K24qXveun4libGEIsCvWcuC8LKOR7xVPNatqCpk0GZQiD6/Jp3ikQt5cHnr2YoFlrLAysh4YPoRIrFHVhntr7uw+b2XXEFu0pR9/s33KJlCn1+kEJILkaEaaQdJSOeaaYWF5QNs8JVwQ98wd1s9/cvITQKspJIulQQoqqtyTK3LZAaSqtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=nvidia.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9Jx9BPbbTkvngg7lfIg3yOoNY7GJbz2qTHa2w/pZ+fI=;
 b=JX72JEYLyCMwHwrYvnFchZKwqZE6rVWiYGfUkVGyp1wd1naDM9xrcbGaYf+CxvZAzdiuuLx52jEaGPZ+fg2wLpDccVSqu2psU6KmHRo5JOmDsMJp/TQuPHg/rUuC/bzxsgrele6cCXq4ke6Ya5cpNyTvejl1sdrTWciIxPXfeq8uhy5l9rC8n5L72HjMtLSLcBEy32a6ebj71t5nLgKbnBp3//4WLsQm/5gtCxuIdnMKUZLeK3ggauBbFcAq44/8ELx2huZz1W3iYn8ikeiZO4gb2PSwPr3YqAATGmxUR794CYvU2BkqwVd9Dr38VxVO/k3eDwE9jpDqy6i+IfJ8QA==
Received: from AS9PR04CA0041.eurprd04.prod.outlook.com (2603:10a6:20b:46a::30)
 by AS4PR10MB6159.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:587::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.12; Tue, 18 Feb
 2025 10:08:11 +0000
Received: from AM4PEPF00027A62.eurprd04.prod.outlook.com
 (2603:10a6:20b:46a:cafe::61) by AS9PR04CA0041.outlook.office365.com
 (2603:10a6:20b:46a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8445.16 via Frontend Transport; Tue,
 18 Feb 2025 10:08:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 AM4PEPF00027A62.mail.protection.outlook.com (10.167.16.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.11 via Frontend Transport; Tue, 18 Feb 2025 10:08:11 +0000
Received: from SI-EXCAS2000.de.bosch.com (10.139.217.201) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Tue, 18 Feb
 2025 11:07:58 +0100
Received: from [10.34.219.93] (10.139.217.196) by SI-EXCAS2000.de.bosch.com
 (10.139.217.201) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.43; Tue, 18 Feb
 2025 11:07:58 +0100
Message-ID: <8d95cfde-30bc-4937-99d3-0077df43867a@de.bosch.com>
Date: Tue, 18 Feb 2025 11:07:46 +0100
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
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20250217-nova_timer-v1-1-78c5ace2d987@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.139.217.196]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A62:EE_|AS4PR10MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: 17295578-19b5-4cef-ca0b-08dd500426a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZFBUaEMwQzM3TUgyaDVjaWJBSnhyVDBIUEcwZFhFZi9yM2QwaHZOQmJpWTBL?=
 =?utf-8?B?Y0VkU3VybHBUWWZ0MFA2d1FjbVZZdzg5WG91TDZSQU94NDN5bUdjTFlWeElG?=
 =?utf-8?B?WVNPTVhnK1p5bmVKKy9SR2N6d3RreGk5THJQOEMyLytHQnRWekZtUkhSbytq?=
 =?utf-8?B?RjFHUjAwdkxINERuRWh1bjdWek1nc3YvY20yaGJvRHh6RHJGWG1COUdGQjUr?=
 =?utf-8?B?dVVsWkRlTEhmRDljcUpieENocDBvZ3ZvVjBJNXNEdkJWNXkwZ01iZVlSMi90?=
 =?utf-8?B?UmdmallVN2I4M1Z3U29nWi9mK3prVUNsYUFLTWhQRk9BU1dFdVo4QzgvbVVj?=
 =?utf-8?B?bGpaUzB4amtkdWVEQUFkVnpsRFUxVlNhVjA2Vm16NWhBTWI3RmdQTEFuRmdr?=
 =?utf-8?B?bVpIWEttZCtPWE1Sb0pjOGxyNGQ3TE1HSU8yRHJFNFlSb1F0NnFYQzg2ckFL?=
 =?utf-8?B?eXdnVWpYK0ZIUEZDem91UXZnVTBZTC9MdUI3NFpXaWY5UFg1TVdwZHVMRVFH?=
 =?utf-8?B?QzJneUtNWUNyUTNDSGZaTWVYbVJna1p1UDhiNEhxUjZCR2NQcG5nc0pieHV3?=
 =?utf-8?B?MEk0NjgvL0xqRHB5UVh3WkpNai9LaTN2T3FiVUk5eUpzdm85R3R4QmYzUDVT?=
 =?utf-8?B?b3lSM2FHR3JCMzllNDVkQkRvM2RTQ3o1VTZubFRrdHFwQTBHVnFTSFQwZ3lG?=
 =?utf-8?B?YWxuaW1YeloxVEFCNGRtajFCNHI1aWh5bnMzVXluL0NWdWVrSW95MFJidUZu?=
 =?utf-8?B?R3F2Sm1KUnowNkgyNTAvR01paGJGR1ExNHNFc0l2S3JVUzQyMS9jb2phSlVJ?=
 =?utf-8?B?SXhJaFZQQWJCTXBzTW5NR2t1YXBES3Q3NGZ5MXpCN0pVT1Blc1RmcmYxTDdY?=
 =?utf-8?B?am5vU0ltdVZ2RHduTmtkek1kQUZUbTN2cytFRUsrWXVJd0FNRTdIekwrR1l1?=
 =?utf-8?B?eHdENkpUK1NNOUFXYXhnNlVxT0lkc2FZeHJOUUVkZklheW4rR0NSeU1pVkJa?=
 =?utf-8?B?YzVFWU04RnJwNXVVUUplcWRBZHp0dmMwWVp3WkNrMU5BNjJZWXB6VHF3SzQ3?=
 =?utf-8?B?cE1qN3lvUTltM1BaWlJtQmRNWURjRmFSOVNBdGUvUEpMQW5EVVNHOGFiMGRx?=
 =?utf-8?B?NFRnUTJrWkFwaG14RDRTeWJtajM2MUV5dEdMelBCMVAvT0dhZlkwdXJwNkRu?=
 =?utf-8?B?WDd3OVU2YzNCOTIwOEJ3ZDZhRENvSXNhczNKVGh1cWVxL3VKWEJRejhSaEdH?=
 =?utf-8?B?YVUycmIxRmFRLzVlNlo5M0RuL094bnF5aXRNZU8vSVUxQ0UzUFlNcnZhRDY3?=
 =?utf-8?B?akVUNGVGdWdMa2RpU1RJaXlhSEZ2RmZaUnRxSDR3Q2c5T3FnNEtLSi9iTkpM?=
 =?utf-8?B?VmlnS0hyZUVDWUNNaUlBcDdEZjYrTk56Q0Y4VkJVblg2Yy9YWEp5VE1ZZ3Fx?=
 =?utf-8?B?NXA4YXo3MDBuSThsM2JzVmk4RjFoK09KdHBPMGFub3h3RVhIZmZIZ2dCTnFh?=
 =?utf-8?B?Vnk5dDhYWHUrbzBqaG1lSVF0YnpXMHoycG1TTkpzUG9pSjlZd2hUR2lldWhM?=
 =?utf-8?B?cjBYRENFWFZMNzNGUlc4b0ZqSU56UEgrN0dzVEtMVlZUb3J2dWkxNm1zaEFG?=
 =?utf-8?B?cVMyY1Zpd0d3ZTdPM3VSWUs0SnIzd2Q0b1pzeXN5VGhac1J4RmcreEVGak9S?=
 =?utf-8?B?bjdoUW52aCt3WFY0ZEhoU29xQ1NVRG1SbVU2aElVQW1lK0hBazlCQWR0Z0VQ?=
 =?utf-8?B?b1BKZ1dWVkMweWFyVGlKZFQ3MEE4WDhOVUpmQkEyRzBwWWRFMkZVZ1dveUxw?=
 =?utf-8?B?RnFlV0JDd2FIVVhwTWVFSzJYUFdxMzhXY29JY3JraFhBc1VDelR1eGRyMHRZ?=
 =?utf-8?B?N3kzaWNRWjdreHV3czFrVU5ERnZTYVZFYzExWE9JMVFSLzRnenQ2a1BPaU5M?=
 =?utf-8?Q?rdoNgYsqB6k=3D?=
X-Forefront-Antispam-Report: CIP:139.15.153.205; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:eop.bosch-org.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 10:08:11.4475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17295578-19b5-4cef-ca0b-08dd500426a7
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4; Ip=[139.15.153.205];
 Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: AM4PEPF00027A62.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6159
X-Mailman-Approved-At: Wed, 19 Feb 2025 08:31:48 +0000
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

On 17/02/2025 15:04, Alexandre Courbot wrote:
> It is common to build a u64 from its high and low parts obtained from
> two 32-bit registers. Conversely, it is also common to split a u64 into
> two u32s to write them into registers. Add an extension trait for u64
> that implement these methods in a new `num` module.
> 
> It is expected that this trait will be extended with other useful
> operations, and similar extension traits implemented for other types.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/lib.rs |  1 +
>  rust/kernel/num.rs | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index 496ed32b0911a9fdbce5d26738b9cf7ef910b269..8c0c7c20a16aa96e3d3e444be3e03878650ddf77 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -59,6 +59,7 @@
>  pub mod miscdevice;
>  #[cfg(CONFIG_NET)]
>  pub mod net;
> +pub mod num;
>  pub mod of;
>  pub mod page;
>  #[cfg(CONFIG_PCI)]
> diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
> new file mode 100644
> index 0000000000000000000000000000000000000000..5e714cbda4575b8d74f50660580dc4c5683f8c2b
> --- /dev/null
> +++ b/rust/kernel/num.rs
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Numerical and binary utilities for primitive types.
> +
> +/// Useful operations for `u64`.
> +pub trait U64Ext {
> +    /// Build a `u64` by combining its `high` and `low` parts.
> +    ///
> +    /// ```
> +    /// use kernel::num::U64Ext;
> +    /// assert_eq!(u64::from_u32s(0x01234567, 0x89abcdef), 0x01234567_89abcdef);
> +    /// ```
> +    fn from_u32s(high: u32, low: u32) -> Self;
> +
> +    /// Returns the `(high, low)` u32s that constitute `self`.
> +    ///
> +    /// ```
> +    /// use kernel::num::U64Ext;
> +    /// assert_eq!(u64::into_u32s(0x01234567_89abcdef), (0x1234567, 0x89abcdef));
> +    /// ```
> +    fn into_u32s(self) -> (u32, u32);
> +}
> +
> +impl U64Ext for u64 {
> +    fn from_u32s(high: u32, low: u32) -> Self {
> +        ((high as u64) << u32::BITS) | low as u64
> +    }
> +
> +    fn into_u32s(self) -> (u32, u32) {
> +        ((self >> u32::BITS) as u32, self as u32)
> +    }
> +}
Just as a question: Would it make sense to make this more generic?

For example

u64 -> u32, u32 / u32, u32 -> u64 (as done here)
u32 -> u16, u16 / u16, u16 -> u32
u16 -> u8, u8 / u8, u8 -> u16

Additionally, I wonder if this might be combined with the Integer trait
[1]? But the usize and signed ones might not make sense here...

Dirk

[1] E.g.

https://github.com/senekor/linux/commit/7291dcc98e8ab74e34c1600784ec9ff3e2fa32d0

