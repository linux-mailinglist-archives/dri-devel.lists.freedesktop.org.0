Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BAD1C563B8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 09:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 943CE10E5EC;
	Thu, 13 Nov 2025 08:22:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=de.bosch.com header.i=@de.bosch.com header.b="gs/KFika";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011032.outbound.protection.outlook.com
 [40.107.130.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8297110E0EC;
 Thu, 13 Nov 2025 06:27:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KOr3je8k0+3ETvtZCnGLI2sUS3js18rScISJqJ2Us8wyldxKVCvHDbXzIEkIaTz3Z8GXxABeyUdzHC1OFMENajIWvxwEpeb7JHqmWK+FKjgkSDuC+uegcIxv5YP+wGq8Aoukwj69Hij2hYuV4JiSm3rcm7dNzpmcJL2J1LFlzU2ttAW2s3DgCYI5J9FoMRbbB98vbAfp7DrBmFhvF3nB5H4wHMo95N6R1G7kcBqJ2ZOHNx+6eqR1x36sHRnoZgLN5KJBaxJ2MU7HvzqRZ4Nm9xbalfl5TmAEUdmv4LjC4TRrcbg3KaYZyNAZjAeT1I+rlLZMq0iClN0Og+PTkuFF/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BE3U077CYXQt2mJNlPLMnKGFuXD+PuiVE5JovFJ7ZdY=;
 b=lnZg3z8IfY1FiSI/ns3c9h3ipY+qlEqfNgoSkHCHiV8o8qf5VgGkR5Xrf5yNZ+A6Z7wB0SI3SsgtZoTjHJoels1C3lLzTw9Fy5LpFur3CwaxmIBJPYDi5ARTWeH+HGLVvC9fqMnGQEfZHm00PVtL01CdTLQMBFSMCJwVKsXWoWiiWrQdqx87sN+PdMVazexLipvpgTNFcE8fet+lT9zoHm1tWBf9V9oAk9evSYDCVTg9WxcoifwSqe8zdkVyH7KhgdcNcjqdBEaVWyvZdSZBObP40ELMBeQgmZJbX/YmflOaHTJ/4Un1ntQD/51HiDDi5lN4pr3C8/8KkSqPwLDAPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 139.15.153.206) smtp.rcpttodomain=nvidia.com smtp.mailfrom=de.bosch.com;
 dmarc=pass (p=reject sp=none pct=100) action=none header.from=de.bosch.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=de.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BE3U077CYXQt2mJNlPLMnKGFuXD+PuiVE5JovFJ7ZdY=;
 b=gs/KFika4rNRYVcFBgrcv0hFhOUcNKwKfMKek57VbEktgC9eYFxnqStzwgj6e5GMyN8vfiPnr1aQBtPM3yg4KpeHGIldtP3ylQ1ikHaGuDayIQ6pKktO2Dh3ACqY8q6RpNBSqwTucEKsLq4DeosK5NwB7aOlm1fWetUSTzOw3Mwj7OzBuhLLTogKbHPZ6ZhipGeniWE5KK0bhmbpd63ugLVnGn7y8bcekTK+AKxkb5jzmxq9NYrJfbXantc3hebXIIrU8mhhwblzmS1fZ7GMuN5exY36Pk3ruLbUWo9PCkh8gzzaGvOJgFmm50oKJBpT+5O5MrotZhQHdJ6G8sETNA==
Received: from DU7P191CA0016.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:54e::26)
 by GVXPR10MB8057.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:115::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 13 Nov
 2025 06:26:56 +0000
Received: from DU6PEPF0000A7DE.eurprd02.prod.outlook.com
 (2603:10a6:10:54e:cafe::c3) by DU7P191CA0016.outlook.office365.com
 (2603:10a6:10:54e::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Thu,
 13 Nov 2025 06:26:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 139.15.153.206)
 smtp.mailfrom=de.bosch.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=de.bosch.com;
Received-SPF: Pass (protection.outlook.com: domain of de.bosch.com designates
 139.15.153.206 as permitted sender)
 receiver=protection.outlook.com; 
 client-ip=139.15.153.206; helo=eop.bosch-org.com; pr=C
Received: from eop.bosch-org.com (139.15.153.206) by
 DU6PEPF0000A7DE.mail.protection.outlook.com (10.167.8.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Thu, 13 Nov 2025 06:26:56 +0000
Received: from RNGMBX3003.de.bosch.com (10.124.11.208) by eop.bosch-org.com
 (139.15.153.206) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 13 Nov
 2025 07:26:55 +0100
Received: from [10.34.219.93] (10.34.219.93) by smtp.app.bosch.com
 (10.124.11.208) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Thu, 13 Nov
 2025 07:26:54 +0100
Message-ID: <1da3adab-f52c-461d-bd68-8623d6d7e223@de.bosch.com>
Date: Thu, 13 Nov 2025 07:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v6 4/5] rust: Move register and bitfield macros out of Nova
To: Alexandre Courbot <acourbot@nvidia.com>, Dirk Behme
 <dirk.behme@gmail.com>, Danilo Krummrich <dakr@kernel.org>, Joel Fernandes
 <joelagnelf@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, "Boqun
 Feng" <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, "Trevor
 Gross" <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov
 <yury.norov@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>,
 "Andrea Righi" <arighi@nvidia.com>, <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
 <20251003154748.1687160-5-joelagnelf@nvidia.com>
 <5a5bd549-f5b7-41ec-b493-bda427d1218f@de.bosch.com>
 <DDDQZ8LM2OGP.VSEG03ZE0K04@kernel.org>
 <DDDR8DIW6K4L.21F81P26KM64W@nvidia.com>
 <7dd6c190-2598-4a68-8431-e03e41b276ea@gmail.com>
 <DDXVGH53P7OW.1UWNG3SM9S0A1@nvidia.com>
Content-Language: en-GB
From: Dirk Behme <dirk.behme@de.bosch.com>
In-Reply-To: <DDXVGH53P7OW.1UWNG3SM9S0A1@nvidia.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.34.219.93]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000A7DE:EE_|GVXPR10MB8057:EE_
X-MS-Office365-Filtering-Correlation-Id: e189f81e-a2df-449e-482f-08de227da49f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MXJ3OGk3cTdHZXMzdHhJcStCcHo3WmZ2bStqYUFmVE9xZEg3dEtkNyt3aSto?=
 =?utf-8?B?YVVnQjRMWForNUZmdzVmRDQ1UnhySmVaWGxuMzR2LzBzWnFIVTRsZzFubjh3?=
 =?utf-8?B?eVZ2eUhOcjZ6UWJzL2ttaE5uSnJsRWpqbVFKMVRweDNhcXpnUmhsOVJlYllu?=
 =?utf-8?B?NlRUSmttM1lHUENtMEpYeWVULzIraU9ZL2RVRk5OamJKQjY4QmczZEpiYzRh?=
 =?utf-8?B?SHg2aVpWMHZ5MjFtTGhDNS9nenQyZWdGYm5GY2t3bG8zYmdJODhHUWJLVWhK?=
 =?utf-8?B?ekczQXpJYzNISkowNEJiVFJFK3k4RUl3Uk9SelhUUk1XMDJoczhlaXBoOWIv?=
 =?utf-8?B?Ulhtd1BYNVEyb2h5RWV3YnAzdnN3UnNtLzlGV3FldVZ4bDJRKzRNekZtZVNH?=
 =?utf-8?B?Uzh4QzgvakdiVisrb2N1VjhDSWdKVVhpaUNGN1VOa0FFZXdKQi8za1RVU3NP?=
 =?utf-8?B?REVib0YzekRrQUx1WlVMY0NTTkNmZUF0NTBuMUZtdlFLeUYxR0JzbXRMaUsw?=
 =?utf-8?B?dVYrZ2RIS3oxZllVRForTXhTOHlWRzQwSm1WOHdEdFFYMmJYaFJUeUpINUlt?=
 =?utf-8?B?MG5uUUYramMveVpXTmpSZTlYcjZCb3hCY3E0eDJHeS9mdTFWU0hxYTRLQ2lj?=
 =?utf-8?B?cldzNmNQY1hWQ0t0SnpuU2RTWERhV2RjczFmY1Q3V3Zlc1h3K2JUS3c4RE1G?=
 =?utf-8?B?VzRzai9QUW5ETXFKelNtMGRMTFVZOThidVlHZk84bm92c0NOZmV5QSt6K002?=
 =?utf-8?B?ZkUrSVo4UzlicGlNejU2R1BRaU1ETXA3T05mb1UyWkpmeU84ZFl1eGlGcFk4?=
 =?utf-8?B?UGNyNmVrSVZVcnlmVktuYmlSdFNDZGQzc01EZm5TZU5OeTIrVGNUOWFFUjBX?=
 =?utf-8?B?WTJzNnFua0srakJRS0RTOWI3YTd0VlZLMzM3dnJNS2tQWmJqWFlXZzF5TDlX?=
 =?utf-8?B?QjdTYm5XSWZCcDQ3SGU3NmltNUZ0ajZ3bHQ5ZG5LN3EzbG5lOVNhN0JYZ01U?=
 =?utf-8?B?RlBta1JxOW1wUzVBZW9UdDhEc2REUnNzam94UjVCQWoyeUtZT2ZnT1Y1WHpl?=
 =?utf-8?B?L1pDbUpURERpOEtZUUhYV1krQjVFRkMvdkJBeVFZdTNWWk91bTd2ZmY5V0lr?=
 =?utf-8?B?ZUwwSVZCM3k4ZjBJbFBlZGY3U0JXTTg4Nmt3MFowWXpWQ2dlRHFLdmFGRTBF?=
 =?utf-8?B?MVBGdUdNUHVDTHN3ME9aY3pER2lBMDM3MWthS3crVkRQRk1tdUFsUzdhRTZo?=
 =?utf-8?B?bDFsOGVYNWJwS0NuUmdmeWhkWHA0Ni9FeDArWGdOOFQvOTF5NVIweVJTY2ZP?=
 =?utf-8?B?WGtlenJLcml6b3EvaW9mSk5MdGZaWjlBSk8vbGtJbzJTOVBQTWI2c0x0eUIr?=
 =?utf-8?B?WHhDQXJSTW5XRDlEYUlxdGVJd3k0RG45VWUyTDNWaGNBVkY1dG16QmJSbGZJ?=
 =?utf-8?B?VFlxamZKN0lnVklGZTlBcVBFM0RqblRWMmQyRFVRbERKQ0RMcHdWREVMbHIr?=
 =?utf-8?B?SHd0UE1tZHJxOVYwSjJlQnNRZnlnTG1xcHNyRmk5U00vTldBWC9OT0k3bzBJ?=
 =?utf-8?B?cmVlZU9ERjVZenZ1RUVuejB0QU9DNHByNkFiQmtlSWxNZE9JR3hsWlR4bGZ3?=
 =?utf-8?B?TXRtUDJvd2lmRzRJWDR0RWhuMW1PZHRnK1NpalNOQStTd1loL05pWlVEa3lN?=
 =?utf-8?B?VUFCZ3dBemxnRXgyak5aeHF1KzJFWkRQTmhLMzNrU1NwZnNOUDlpTExGRm9Q?=
 =?utf-8?B?ckZwVWNJMXpNNHEvSk5qL0w2VVZQb3doeC9VTlI5Vi9JQUx2TzQrSXNLZklt?=
 =?utf-8?B?Y3Z6ZWtMWkg0eUZFdmQ1WE9SNWlhQng5WjN6ZlRmWFdxMTIxOUFVR2RTd2pm?=
 =?utf-8?B?ajczTnJJNytZV2tjRk5CM25XN0V3M3lHSGtJM0o2bG1rQklFcUxLV05ueWww?=
 =?utf-8?B?SFlvYW1hNUdkUjJQQnI2dmpmeWx1YnY4ZGx4U3dsaFNSSFRoQ3NnemFiTk9w?=
 =?utf-8?B?OHZqNXlOSDFmWUlPVVlVb2theUtnT2FKRjZsOXhYdzNscTZ3ajhkeFM2dzNE?=
 =?utf-8?B?ZXpGdmF0N1FrRi9idGhQeXBVWHMxbURDeTNDd0ZyNWpNWjRML3g0aU1RMGRj?=
 =?utf-8?Q?HZMs=3D?=
X-Forefront-Antispam-Report: CIP:139.15.153.206; CTRY:DE; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:eop.bosch-org.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: de.bosch.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 06:26:56.0620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e189f81e-a2df-449e-482f-08de227da49f
X-MS-Exchange-CrossTenant-Id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0ae51e19-07c8-4e4b-bb6d-648ee58410f4; Ip=[139.15.153.206];
 Helo=[eop.bosch-org.com]
X-MS-Exchange-CrossTenant-AuthSource: DU6PEPF0000A7DE.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR10MB8057
X-Mailman-Approved-At: Thu, 13 Nov 2025 08:22:35 +0000
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

On 02/11/2025 04:00, Alexandre Courbot wrote:
> On Sun Nov 2, 2025 at 3:51 AM JST, Dirk Behme wrote:
>> On 09.10.25 13:28, Alexandre Courbot wrote:
>>> On Thu Oct 9, 2025 at 8:16 PM JST, Danilo Krummrich wrote:
>>>> On Thu Oct 9, 2025 at 8:59 AM CEST, Dirk Behme wrote:
>>>>> Assuming that register.rs is supposed to become the "generic" way to
>>>>> access hardware registers I started to have a look to it. Some weeks
>>>>> back testing interrupts I used some quite simple timer with 4 registers
>>>>> [1]. Now, thinking about converting it to register!() I have three
>>>>> understanding / usage questions:
>>>>>
>>>>> * At the moment register!() is for 32-bit registers, only? So it can't
>>>>> be used for my example having 8-bit and 16-bit registers as well?
>>>>
>>>> Yes, currently the register!() macro always generates a 32-bit register type
>>>> (mainly because nova-core did not need anything else). However, this will of
>>>> course be generalized (which should be pretty straight forward).
>>>>
>>>> Having a brief look at the TMU datasheet it looks like you should be able to
>>>> treat TSTR and TCR as 32-bit registers without any issues for testing the
>>>> register!() macro today. I.e. you can just define it as:
>>>>
>>>> 	register!(TSTR @ 0x04, "Timer Start Register" {
>>>> 	    2:2    str2 as bool, "Specifies whether TCNT2 is operated or stopped.";
>>>> 	    1:1    str1 as bool, "Specifies whether TCNT1 is operated or stopped.";
>>>> 	    0:0    str0 as bool, "Specifies whether TCNT0 is operated or stopped.";
>>>> 	});
>>>>
>>>> Same for TCR.
>>>
>>> Patch 2 of this series actually adds support for 16 and 8 bit register
>>> storage.
>>
>> Hmm, how to use that with the register!() macro? I mean patch 2 adds
>> support for different storage widths for *bitfields*. But looking at
>> patch 4 [2] it looks like *register!()* still uses $name(u32)? With
>> that it looks like that the register!() macro still just supports 32
>> bit registers? Or what have I missed?
>>
>> What I'm looking for is a way to specify if a register is 8, 16 or 32
>> bit. Using the example from above something like
>>
>> register!(TSTR<u8> @ ....
> 
> Errr indeed, you are correct. The `register` macro's syntax has not been
> updated to take advantage of `bitfield`'s storage types, and `u32` is
> still hardcoded as of this series.
> 
> This looks like an oversight - a register is basically a bitfield with
> some I/O, so making it support storage types should be trivial. I guess
> this hasn't been done yet because Nova is the only user so far, and we
> don't need/want to explicitly specify a type for each register since
> they are invariably `u32`.
> 
> But it wouldn't look good to change the syntax of `register` after
> moving it out, so I agree this should take place before the move. The
> same applies to the visiblity feature.
> 
> One way to avoid a update all the declarations so far would be to give
> Nova its own `register` macro that invokes the one in `kernel` with
> the relevant parameters hardcoded.


Just fyi, hacking something like [1] below does work for my (very 
limited) use case. And it defaults `register!` without type to <u32>.

Thanks!

Dirk

[1]

--- a/rust/kernel/io/register.rs
+++ b/rust/kernel/io/register.rs
@@ -276,33 +276,38 @@ pub trait RegisterBase<T> {
  /// ```
  #[macro_export]
  macro_rules! register {
-    // Creates a register at a fixed offset of the MMIO space.
+    // Creates a register at a fixed offset of the MMIO space, defaults 
to u32 if no type is specified.
      ($name:ident @ $offset:literal $(, $comment:literal)? { 
$($fields:tt)* } ) => {
-        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? 
{ $($fields)* } );
-        register!(@io_fixed $name @ $offset);
+        register!($name<u32> @ $offset $(, $comment)? { $($fields)* });
+    };
+
+    // Creates a register at a fixed offset of the MMIO space, explicit 
type required.
+    ($name:ident<$ty:ty> @ $offset:literal $(, $comment:literal)? { 
$($fields:tt)* } ) => {
+        ::kernel::bitfield!(pub(crate) struct $name($ty) $(, $comment)? 
{ $($fields)* } );
+        register!(@io_fixed<$ty> $name @ $offset);
      };

      // Creates an alias register of fixed offset register `alias` with 
its own fields.
-    ($name:ident => $alias:ident $(, $comment:literal)? { 
$($fields:tt)* } ) => {
-        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? 
{ $($fields)* } );
-        register!(@io_fixed $name @ $alias::OFFSET);
+    ($name:ident<$ty:ty> => $alias:ident $(, $comment:literal)? { 
$($fields:tt)* } ) => {
+        ::kernel::bitfield!(pub(crate) struct $name($ty) $(, $comment)? 
{ $($fields)* } );
+        register!(@io_fixed<$ty> $name @ $alias::OFFSET);
      };

      // Creates a register at a relative offset from a base address 
provider.
-    ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? 
{ $($fields:tt)* } ) => {
-        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? 
{ $($fields)* } );
-        register!(@io_relative $name @ $base [ $offset ]);
+    ($name:ident<$ty:ty> @ $base:ty [ $offset:literal ] $(, 
$comment:literal)? { $($fields:tt)* } ) => {
+        ::kernel::bitfield!(pub(crate) struct $name($ty) $(, $comment)? 
{ $($fields)* } );
+        register!(@io_relative<$ty> $name @ $base [ $offset ]);
      };

      // Creates an alias register of relative offset register `alias` 
with its own fields.
-    ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { 
$($fields:tt)* }) => {
-        ::kernel::bitfield!(pub(crate) struct $name(u32) $(, $comment)? 
{ $($fields)* } );
-        register!(@io_relative $name @ $base [ $alias::OFFSET ]);
+    ($name:ident<$ty:ty> => $base:ty [ $alias:ident ] $(, 
$comment:literal)? { $($fields:tt)* }) => {
+        ::kernel::bitfield!(pub(crate) struct $name($ty) $(, $comment)? 
{ $($fields)* } );
+        register!(@io_relative<$ty> $name @ $base [ $alias::OFFSET ]);
      };

-    // Creates an array of registers at a fixed offset of the MMIO space.
+    // Creates an array of registers at a fixed offset of the MMIO 
space. (u32 only for now)
      (
-        $name:ident @ $offset:literal [ $size:expr ; $stride:expr ] $(, 
$comment:literal)? {
+        $name:ident<u32> @ $offset:literal [ $size:expr ; $stride:expr 
] $(, $comment:literal)? {
              $($fields:tt)*
          }
      ) => {
@@ -311,20 +316,20 @@ macro_rules! register {
          register!(@io_array $name @ $offset [ $size ; $stride ]);
      };

-    // Shortcut for contiguous array of registers (stride == size of 
element).
+    // Shortcut for contiguous array of registers (stride == size of 
element). (u32 only for now)
      (
-        $name:ident @ $offset:literal [ $size:expr ] $(, 
$comment:literal)? {
+        $name:ident<u32> @ $offset:literal [ $size:expr ] $(, 
$comment:literal)? {
              $($fields:tt)*
          }
      ) => {
-        register!($name @ $offset [ $size ; 
::core::mem::size_of::<u32>() ] $(, $comment)? {
+        register!($name<u32> @ $offset [ $size ; 
::core::mem::size_of::<u32>() ] $(, $comment)? {
              $($fields)*
          } );
      };

-    // Creates an array of registers at a relative offset from a base 
address provider.
+    // Creates an array of registers at a relative offset from a base 
address provider. (u32 only for now)
      (
-        $name:ident @ $base:ty [ $offset:literal [ $size:expr ; 
$stride:expr ] ]
+        $name:ident<u32> @ $base:ty [ $offset:literal [ $size:expr ; 
$stride:expr ] ]
              $(, $comment:literal)? { $($fields:tt)* }
      ) => {
          static_assert!(::core::mem::size_of::<u32>() <= $stride);
@@ -332,20 +337,19 @@ macro_rules! register {
          register!(@io_relative_array $name @ $base [ $offset [ $size ; 
$stride ] ]);
      };

-    // Shortcut for contiguous array of relative registers (stride == 
size of element).
+    // Shortcut for contiguous array of relative registers (stride == 
size of element). (u32 only for now)
      (
-        $name:ident @ $base:ty [ $offset:literal [ $size:expr ] ] $(, 
$comment:literal)? {
+        $name:ident<u32> @ $base:ty [ $offset:literal [ $size:expr ] ] 
$(, $comment:literal)? {
              $($fields:tt)*
          }
      ) => {
-        register!($name @ $base [ $offset [ $size ; 
::core::mem::size_of::<u32>() ] ]
+        register!($name<u32> @ $base:ty [ $offset:literal [ $size:expr 
; ::core::mem::size_of::<u32>() ] ]
              $(, $comment)? { $($fields)* } );
      };

-    // Creates an alias of register `idx` of relative array of 
registers `alias` with its own
-    // fields.
+    // Creates an alias of register `idx` of relative array of 
registers `alias` with its own fields. (u32 only for now)
      (
-        $name:ident => $base:ty [ $alias:ident [ $idx:expr ] ] $(, 
$comment:literal)? {
+        $name:ident<u32> => $base:ty [ $alias:ident [ $idx:expr ] ] $(, 
$comment:literal)? {
              $($fields:tt)*
          }
      ) => {
@@ -354,17 +358,15 @@ macro_rules! register {
          register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * 
$alias::STRIDE ] );
      };

-    // Creates an alias of register `idx` of array of registers `alias` 
with its own fields.
-    // This rule belongs to the (non-relative) register arrays set, but 
needs to be put last
-    // to avoid it being interpreted in place of the relative register 
array alias rule.
-    ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { 
$($fields:tt)* }) => {
+    // Creates an alias of register `idx` of array of registers `alias` 
with its own fields. (u32 only for now)
+    ($name:ident<u32> => $alias:ident [ $idx:expr ] $(, 
$comment:literal)? { $($fields:tt)* }) => {
          static_assert!($idx < $alias::SIZE);
          ::kernel::bitfield!(pub(crate) struct $name(u32) $(, 
$comment)? { $($fields)* } );
          register!(@io_fixed $name @ $alias::OFFSET + $idx * 
$alias::STRIDE );
      };

-    // Generates the IO accessors for a fixed offset register.
-    (@io_fixed $name:ident @ $offset:expr) => {
+    // Generates the IO accessors for a fixed offset register, using 
the type parameter.
+    (@io_fixed<$ty:ty> $name:ident @ $offset:expr) => {
          #[allow(dead_code)]
          impl $name {
              pub(crate) const OFFSET: usize = $offset;
@@ -374,7 +376,15 @@ impl $name {
              pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
                  T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
              {
-                Self(io.read32($offset))
+                Self(
+                    if core::any::TypeId::of::<$ty>() == 
core::any::TypeId::of::<u8>() {
+                        io.read8($offset) as $ty
+                    } else if core::any::TypeId::of::<$ty>() == 
core::any::TypeId::of::<u16>() {
+                        io.read16($offset) as $ty
+                    } else {
+                        io.read32($offset) as $ty
+                    }
+                )
              }

              /// Write the value contained in `self` to the register 
address in `io`.
@@ -382,7 +392,13 @@ pub(crate) fn read<const SIZE: usize, T>(io: &T) -> 
Self where
              pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
                  T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
              {
-                io.write32(self.0, $offset)
+                if core::any::TypeId::of::<$ty>() == 
core::any::TypeId::of::<u8>() {
+                    io.write8(self.0 as u8, $offset)
+                } else if core::any::TypeId::of::<$ty>() == 
core::any::TypeId::of::<u16>() {
+                    io.write16(self.0 as u16, $offset)
+                } else {
+                    io.write32(self.0 as u32, $offset)
+                }
              }

              /// Read the register from its address in `io` and run `f` 
on its value to obtain a new
@@ -401,8 +417,8 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
          }
      };

-    // Generates the IO accessors for a relative offset register.
-    (@io_relative $name:ident @ $base:ty [ $offset:expr ]) => {
+    // Generates the IO accessors for a relative offset register, using 
the type parameter.
+    (@io_relative<$ty:ty> $name:ident @ $base:ty [ $offset:expr ]) => {
          #[allow(dead_code)]
          impl $name {
              pub(crate) const OFFSET: usize = $offset;
@@ -420,9 +436,7 @@ pub(crate) fn read<const SIZE: usize, T, B>(
              {
                  const OFFSET: usize = $name::OFFSET;

-                let value = io.read32(
-                    <B as 
::kernel::io::register::RegisterBase<$base>>::BASE + OFFSET
-                );
+                let value = io.read::<$ty>(<B as 
::kernel::io::register::RegisterBase<$base>>::BASE + OFFSET);

                  Self(value)
              }
@@ -441,10 +455,7 @@ pub(crate) fn write<const SIZE: usize, T, B>(
              {
                  const OFFSET: usize = $name::OFFSET;

-                io.write32(
-                    self.0,
-                    <B as 
::kernel::io::register::RegisterBase<$base>>::BASE + OFFSET
-                );
+                io.write::<$ty>(self.0, <B as 
::kernel::io::register::RegisterBase<$base>>::BASE + OFFSET);
              }

              /// Read the register from `io`, using the base address 
provided by `base` and adding
-- 
2.48.0
