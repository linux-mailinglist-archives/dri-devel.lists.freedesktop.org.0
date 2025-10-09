Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0FFBC7B79
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 09:29:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A61110E938;
	Thu,  9 Oct 2025 07:29:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=de.bosch.com header.i=@de.bosch.com header.b="FCGXxUIm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011021.outbound.protection.outlook.com [52.101.70.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAAC10E91E;
 Thu,  9 Oct 2025 07:00:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pUrwMvW7RZlxlDkZo6GNmFuy3+yN1JEksnxPACkpTIcyift25ECoXbcD7Wu0NyQQ95myzRv1yhT38bsefA0JJZ1DzB0CewQi0EOW8hTPjcdzw5xtNsfwcFrXOWLNREyejDGwe9G/uJnKl07RkZsfFs1F1Io10fhgqu3cM75t5YEDI2ZJhNGg6p2197oaUvdW8X2sTNGjgtdUwbYlxpjn9ndO1pQHBiAezv0OQ4RW0swChwqmFjpBHp4THivgplzdnMFqh1gYjR/lOX+ZAX55VARyRyHBrGirv1f9cZYpZ2JgX49KBpaat6SMJp4Iw/SHZqDxf/rdVPw6p61GBhH9Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17V7QUVJQSIRTH/4Qh7koqId21SkHMQ5JkQ5cdOeU54=;
 b=wKLrYnEu9WuY/0tT59UyMUNDdAYmU3tRTN3A4gvwS1av3bAi4HfyAapUWYDiKkGmTIm1rTKMt7XSZineLEiuRAzG6y6Nv4DQoihiYiclIvkEgCjbel1ZMg6WcN3LCIpbT6xdJhiAl3Qp3pKdcAHZJgASULnxjxnOfKLxPDLzDSe+CUSAx4xX808R1ajLoHrrTeRVXGkNva7/niHGha/PDG65icFhHQCxu7Bn0mf8Li0PQe2kJSVrS9u3x/GqXfHVDs7NT4mJqf8jyOWaUYRtC4GZI3O17TiM7G9vdj2P+jt7mFW9eZa0Pub2O7yOBn4k4byW03l8T6M5IngYLqiwMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.205) smtp.rcpttodomain=nvidia.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17V7QUVJQSIRTH/4Qh7koqId21SkHMQ5JkQ5cdOeU54=;
 b=FCGXxUImL894X74ZZFp9/dbwmK9IxpIwN1YysZpNC6ngAlFETq0YGDTMDoGYE1za5wE0gdmIvUddFWqi7VYTFKkId5i5VS32YMDZI+Pqu2fg7LD2heNJz5lijm4ZuRcaREA8oE+GGiUMcp26DpdsSIAP9Mzq0xvWpzGxyRIrxBjfDwUkzIeoCFDFpVAZ/3bDSXc86+8+VUn7UW3DQ8kJaqUw6t2GOAEFwKH9ovrBl4EzmFGfxTB6xq7lcT5G/rStLNRzQ98bZZcTXv6GeT3uJpSipgk8xiTtT++tE3sLuI99XuskRTocJ0LexIdgejL4EzKhsDkGyChWI8/Sis72Jg==
Received: from DB9PR05CA0028.eurprd05.prod.outlook.com (2603:10a6:10:1da::33)
 by AS2PR10MB7322.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:606::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 07:00:14 +0000
Received: from DB1PEPF000509E6.eurprd03.prod.outlook.com
 (2603:10a6:10:1da:cafe::ca) by DB9PR05CA0028.outlook.office365.com
 (2603:10a6:10:1da::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.20 via Frontend Transport; Thu,
 9 Oct 2025 07:00:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.205)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.205 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=139.15.153.205; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.205) by
 DB1PEPF000509E6.mail.protection.outlook.com (10.167.242.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9 via Frontend Transport; Thu, 9 Oct 2025 07:00:14 +0000
Received: from RNGMBX3002.de.bosch.com (10.124.11.207) by eop.bosch-org.com
 (139.15.153.205) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Thu, 9 Oct
 2025 09:00:04 +0200
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.27; Thu, 9 Oct
 2025 09:00:03 +0200
Message-ID: <5a5bd549-f5b7-41ec-b493-bda427d1218f@de.bosch.com>
Date: Thu, 9 Oct 2025 08:59:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
To: Joel Fernandes <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
CC: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, "Gary
 Guo" <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, Benno Lossin
 <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, <joel@joelfernandes.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Andrea Righi <arighi@nvidia.com>,
 <nouveau@lists.freedesktop.org>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <20251003154748.1687160-5-joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.219.93]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509E6:EE_|AS2PR10MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 1749e530-b0eb-46ec-9090-08de07017f74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|7416014|82310400026|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dHlnSUVLcFB3ZUVWbUFMRnpZeEI0UXpxdWcrTzF2dGV1RGRwZGpxNWFQdkwx?=
 =?utf-8?B?TFAwTXNVZXErRWJqdisrdFFZMVoxcTI5VU9scEc0RCtjVkFiMDdqVCtrbnEv?=
 =?utf-8?B?KzlSTG9VMGJDcWhXcElGSGRYNVE5WWlZa0t0WVhOaGo2V1BkSDZrTGpNR0k1?=
 =?utf-8?B?RTBsK2FVdUJxRzFIckhER0dGWms0WjNFZkFhSkUxNmdKbmRacGJDZS85ZjlC?=
 =?utf-8?B?K3MwZWFYYTQ2eWl4RWozZWEzU1dQaFh6VnR4L0lheGo2MVBpaFhsTFkxdGpW?=
 =?utf-8?B?ZEJiTEFka2djM2tNQXczYjJUUDE5SGtpYldPU0t1eEs0c0diazI1SkF1cGVY?=
 =?utf-8?B?TU1YNG45dGpvWk9GMHhVN1Y2bDdlS1pvaDJYQUJDMUk0UkQ3OVZEMGphMlRv?=
 =?utf-8?B?MzFYNzdlcitIMmlvTDJRUFpJWGw4YmhWM2VKekErWDRidVo4MTBEd042Z0xZ?=
 =?utf-8?B?RHVaMXhYZ0pOL2VObHFJamp0N3o4UzVOVm9GVFAzaUZ2U0tpN25Rdk1wNWdH?=
 =?utf-8?B?MFV0dlNlUllobFRnQzZVeHhGbUR1aHNtRHFSL2NYY3NjY1h3OGg0ajZrcEky?=
 =?utf-8?B?K3NtcGRlY0k3MHN0VEJnRWQvR2dlZjBWS0lvbFBUaVI4M2hHVDFyRXlFeTdF?=
 =?utf-8?B?S29xMUswdmRBb0RMVjZaTTZVQ0lVVjhTS01IdVpydUhHYUdxL1laWEYvMkNw?=
 =?utf-8?B?Ym8rck9nVU9hTE52VUF5emY5dU40SmNNYmdVcU1PR2wvUG40S1FaL0xOTnJM?=
 =?utf-8?B?K3JuU2tJcVErQm1aZDhLei96N0JtV0VhQ1lrcEtoRzJWaEdzR0Zyd3B0bmRq?=
 =?utf-8?B?Y0dvRVJWYkgxOVVuRk1GL2Nwc0Y2WVU1dmZ6SGQ2cHcreElhb1E5bHZEeWx1?=
 =?utf-8?B?blpjalFCbXJyV0ZEdTRRNlZETURGUW5kRU9XSVdpZ3lXWDU0TWduWk5zTTVz?=
 =?utf-8?B?R3FKVEE2SmJmbVRPRDA3ZXNNc0lYT1Z4V3hPdm1MMHl4NVliOFVzOG5wQ3c4?=
 =?utf-8?B?bXhDWkJQcW1zbUdkZmdhVzNvcUJlbGpaeGJlSkljSWVYMEJ5ZFhvcHhTWU1q?=
 =?utf-8?B?dWZMWERSMFdHRjA0UVJqSlBRSGozeFZlNlUwTmN4c2NXQW1ycWhCWXRTVlF1?=
 =?utf-8?B?RTFWOUxiUkZwVkxyMzdPVEd4RGppbzVIUmo2TVlmbTZsaDNpazhuUGZkWFls?=
 =?utf-8?B?RkYrSko5enVpY2pKQUppQzcxMk1UYXVuYmVhK3J3c05pYlhpQVhFRExpVWdO?=
 =?utf-8?B?VXlaY0phdFlmem5jNFpHSlFjV3g2LzJobFMyZkhrS0VzMCtsdEpMR1pkeGNQ?=
 =?utf-8?B?eTNqMVJEWG44bFJYQ0RtWWxxeGJobGJpWVJGYUtKUXRiTU0yTy9vRXNlNHcr?=
 =?utf-8?B?NGJCZW1Sc1U2N0swQ1h1a1c1R05KMER4clVUU0VrdWlnUklhRUJ0djlxeTlq?=
 =?utf-8?B?TjR6RWswYUF0Z3l4NUtqUDB1UW5PbUlQOVgrNllmZ0J3Mmo2V2gwVGxIM0RM?=
 =?utf-8?B?ejZ5UnRKaVFEVEJDb1BrTmdJVUpIMWdHcTRMNlV5NjNDTXdZTWFPMWhhU1dr?=
 =?utf-8?B?c2JIQy9xdWYwdmtycmxPS0FjNk9GQkJrVGcvVzBXOVlvYWF4YVIxNXVGMG5v?=
 =?utf-8?B?SWRFMjVqME8yRW05aWRPN1crVU5IL005aUJpKzJCaXRaTjJDVzZNeTJkVXh0?=
 =?utf-8?B?Q05hTXZ5UmpIdGpiRmlTbXZUWFVmUDRNcW0rOW15TFNxRFlxbG5qcUNsVWVR?=
 =?utf-8?B?ZkFLbnZYN3UwWmRzZWIvZXZuT3FJUFVFVk5TVVRkYUxKVmdKeGNrczJCMFpY?=
 =?utf-8?B?SnBTQ3B3UGI5algvd2N0SGdvc1B3bnF3T3UyZVBQTVhjT203cFVPOWlMNDdB?=
 =?utf-8?B?L0hLWURJK3RJby9QRTYzS0Z3S1U5YmppS3hDa0RFRnpTUjhWNzlKVTlzQVo4?=
 =?utf-8?B?aU9TNDVsMzhWdXc5Vnc4OXdZdDVxU3Q2cjRzM2JoVk9saDhxL1I0NEptUXEx?=
 =?utf-8?B?STJIL01ZbkFZOXdLOGMySkFoYkZURmJuaTdabFF5K2s3Z1VzQ1NyN1Y3RjFB?=
 =?utf-8?B?dk1mVVF2T1ZBY0o3emFwK1lSQ0hhWnFhaGhwVjV4MzNoandUVTEvbjZ6SkpM?=
 =?utf-8?Q?8JdI=3D?=
X-Forefront-Antispam-Report: CIP:139.15.153.205; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:eop.bosch-org.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(7416014)(82310400026)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 07:00:14.7195 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1749e530-b0eb-46ec-9090-08de07017f74
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4; Ip=[139.15.153.205];
 Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: DB1PEPF000509E6.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7322
X-Mailman-Approved-At: Thu, 09 Oct 2025 07:29:03 +0000
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

On 03/10/2025 17:47, Joel Fernandes wrote:
> Out of broad need for the register and bitfield macros in Rust, move
> them out of nova into the kernel crate. Several usecases need them (Nova
> is already using these and Tyr developers said they need them).
> 
> bitfield moved into kernel crate - defines bitfields in Rust.
> register moved into io module - defines hardware registers and accessors.
> 
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>   drivers/gpu/nova-core/falcon.rs               |  2 +-
>   drivers/gpu/nova-core/falcon/gsp.rs           |  4 +-
>   drivers/gpu/nova-core/falcon/sec2.rs          |  2 +-
>   drivers/gpu/nova-core/nova_core.rs            |  3 -
>   drivers/gpu/nova-core/regs.rs                 |  6 +-
>   .../gpu/nova-core => rust/kernel}/bitfield.rs | 27 ++++-----
>   rust/kernel/io.rs                             |  1 +
>   .../macros.rs => rust/kernel/io/register.rs   | 58 ++++++++++---------
>   rust/kernel/lib.rs                            |  1 +
>   9 files changed, 54 insertions(+), 50 deletions(-)
>   rename {drivers/gpu/nova-core => rust/kernel}/bitfield.rs (91%)
>   rename drivers/gpu/nova-core/regs/macros.rs => rust/kernel/io/register.rs (93%)
> 
...
> index c0a5194e8d97..c24d956f122f 100644
> --- a/drivers/gpu/nova-core/regs/macros.rs
> +++ b/rust/kernel/io/register.rs

Assuming that register.rs is supposed to become the "generic" way to 
access hardware registers I started to have a look to it. Some weeks 
back testing interrupts I used some quite simple timer with 4 registers 
[1]. Now, thinking about converting it to register!() I have three 
understanding / usage questions:

* At the moment register!() is for 32-bit registers, only? So it can't 
be used for my example having 8-bit and 16-bit registers as well?

* In my example I used io.try_write*() and io.try_read*() for the 
register access. What is the relationship between these and the 
register!() accessors (e.g. from the examples BOOT_0::read(&bar);)? Will 
both stay? When to use which?

Note: Due to the file move obviously not the full content of the "new" 
file register.rs is shown in this patch. Therefore, let me try it this 
way, citing from register.rs:

-- cut --
...
/// This defines a `BOOT_0` type which can be read or written from 
offset `0x100` of an `Io`
/// region
....
/// ```ignore
/// // Read from the register's defined offset (0x100).
/// let boot0 = BOOT_0::read(&bar);
-- cut --

* What is "&bar" in this example? Is it the `Io` region the explanation 
talks about?

Thanks!

Dirk


[1] 
https://lore.kernel.org/rust-for-linux/dd34e5f4-5027-4096-9f32-129c8a067d0a@de.bosch.com/

The registers:

const TSTR: usize =  0x4; //  8 Bit register
const TCOR: usize =  0x8; // 32 Bit register
const TCNT: usize =  0xC; // 32 Bit register
const TCR:  usize = 0x10; // 16 Bit register
