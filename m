Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNHpNW8bp2m+dgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:33:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FF41F4A8C
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:33:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC3210E89A;
	Tue,  3 Mar 2026 17:33:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="iaG78nhP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021107.outbound.protection.outlook.com [52.101.100.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0773410E89A;
 Tue,  3 Mar 2026 17:33:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h41p/HdVLooi1k7PI1+aqFyRHD+FxBInrclXBmpKsrUzaTgn3D9jiGHtb3ahsGRhUiujUQ0YO4IB4/Vu6mdcXZ9jYuPImhQJGuHLcwb2+UBYPpqcot4LFWWTaZC4a3k0GNd7Qf34buM2x7U5n2LgJBe42kiO9A77Z46CmYGQg+/XMTReGy5dntxZevFlrQ16gNkSS9mv5bWp6SbamkKT5w5KSjiAZuh+ThcCSc0oz5ZS9ldo+YrRFZAg/vdmAx8pL5GXE/CNXQbyMUg5JspdBXdzb6w9ZWxIT87qLdfJmEP9rAmXA3ZpRyu2dJbdSM13W9mNLRT58wlNpps54faLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlTiPhS794fhWxyIG+rGyfIeP6pUrLWtu+Ujm/QiDcI=;
 b=dbDVXZvvLhyIYZD5ayGQYij2gIEq/NKdjjOQhSbSMv1gSSiLMR2JViNQGqP5xjpsgiApKO5pQwpzYNv6oSQRKuNiD7GIzq4yKtcnM1aWFUM+I6Kx2oYPbiyPFL0a+mL2o/Ik3YImu8+At+g7ABzVWwTth8LhOQibkxZ6oJqXMN0RO74b3N1EvmiXK/fVZHKXNGxndU9Bznq9d/OSNECgEAlhoI0VrMS1RaZskCC/8JIDmNIMdngHzgPn5IASlcyx5LksIwFWr34qGnzOHlSWxNVDYn2rZzfEmU82BD6L3BMw+5AOwOmr+NrDqUpsAP3G0Zlc2YqJ7RzFJiAP44xmCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlTiPhS794fhWxyIG+rGyfIeP6pUrLWtu+Ujm/QiDcI=;
 b=iaG78nhPpWt60Q0QmwnKJ/aQ9x+8Hr836H79nHqP74HZRzsEpR+aiAHbe/nUJtbu0PHsH3B4q7VOpQV2GWRlzv702NzjEsHUmcBvbpo4E8zu36ldp2WuSYRnNHun/zmTm6uKG6KfXOne7lSE9mXbgaHAK5I8x/H0myol7ms3kYo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2431.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:12b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 17:33:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 17:33:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 17:33:25 +0000
Message-Id: <DGTBSPDSQKA0.LG8DPD4GT4CM@garyguo.net>
Cc: <driver-core@lists.linux.dev>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 7/8] gpu: nova-core: convert Gsp::new() to use CoherentInit
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>
X-Mailer: aerc 0.21.0
References: <20260303162314.94363-1-dakr@kernel.org>
 <20260303162314.94363-8-dakr@kernel.org>
In-Reply-To: <20260303162314.94363-8-dakr@kernel.org>
X-ClientProxiedBy: PAZP264CA0044.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:1fc::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2431:EE_
X-MS-Office365-Filtering-Correlation-Id: cb1dbf51-7813-48cb-861a-08de794afa18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: 7mrfKyQjqYFrsaDkFnFHQ+n4VORZ+Q8jloQnxxldGGv13qWIGkKsP+Whh+W+Kk21+PKq7RMOP2xuaWm78R7eh39okumNnIQZQdM5Npc/owE9/70KuWckr7RA2bmrTU7orwiaPkfgb6SU0eae8rJsZ6aJUF2ysCMomg+Xhnn9EyB+N/MT89Dk4YKWqOv7xad0jUAzym0F4kmrmHROKwMETKa1Ff6yq+SVP5Z2Fw+vyQ4oSs68e98YozelLDfgagiCl1KhclTMIJ0DWU0ChQ+T9kItILGE2jh4NMS1YDoUzhoOGSXQ90L22H1zKXihnrtife6NNkN7WqwaOEdpl8qYMu4VQDApKYOMW9jbKt3YZzzFGvHMvX4vxKUK1Camdozfr0J81E6bLloh5aG8Ens4ZgZvHP+g3W7vcTxCeuxc9GQHqye7+8kTKN31MzxooDRlXptycgppoAO4RjJozvr8jgxIa+o9kqvYCkDcKM7ACz8LdHPV+xOVYYmTv2qXw4W8EApVouGq/+amqMA1NwiVNVGUz2mAsbEOT3o92YZn3qiHuSJL2vR8zLPHDhyfu09iLYD0kGRkmMkVULMK6J2Haf78NyB39RV3V7ElZWKlE7+W3DXz2CetyibMrMwT3060x+J0ykN6oaNHSyI178RdA63IeYd+LR95Z7/U7nvwEkEyB9r7tx7LcoM1vAeaXEDtJNvAd4m/SLQf2JZI5aGQ/ZLNZ82Ijd3ExWeu+N5TFpIY3fD8zr0IQwKKlD0clJ033IWWvVJOF2vJ7Xp5p2TqZYc2uxWcM/dGBhexs2C6Yq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1VSZzFsbGJ6ZjFpZ2RSRjl2dThJN3BPUkR3SmhaWWZjdnZhbGRhUCtiOHVp?=
 =?utf-8?B?K245ejRXdk1lSThKSGhNbGJUb2t2dk02VW9JbUNUd1NVY0o2dy9hSTJvUjl2?=
 =?utf-8?B?MituU3F6V3A4V3FnUGNydG12c1c1SEMya2pwVnlncWlwaSthb3R4M3RJRkVq?=
 =?utf-8?B?WW9rMU1pWnV3QVFQYndvTkdObEpRK1I4SGt6dnY1aFNHd29xOVBMWUMxSkU3?=
 =?utf-8?B?dWdYbDVYaTlqallmRkh5d0hVMW9zcW1pS3NEZmd3WFlGV1lMVXpKTUFWSkJI?=
 =?utf-8?B?UXhCNDZmRUtMSldWdDlJSk9tTGRpS1NYT1VHMXo3UGZXRks2Tkh3MGJ1cWtI?=
 =?utf-8?B?WmVVakFVaEJsNDBrT1N6MWFaOW0wMGRPd3NaMWxKNEg5WjlpZksvMEFLaTdN?=
 =?utf-8?B?YVJXRnl2djhlbWNmSUtZV3F1elRBcnlyQ3B5V3A1NExTZmw3SU03ZFkvZG9q?=
 =?utf-8?B?T0hBUDBkLzVsRC9LdmhPRGdSSjY0bjZGWjJveitjUFBUS2htZ3RUOUJLM1I3?=
 =?utf-8?B?dHFlTG1zMXduajZlMFBHNHdCTVI1RHJ2SVE0ei9PQmJKVlMwN2c5VG1haytw?=
 =?utf-8?B?YXlhQU9ldTI3Z21mcTI2bFNNQ25FMEl1WFVLckY0YjRET3NWVmNhL1R3M0pS?=
 =?utf-8?B?RHJnNXRQbVoreFdCY21TNy9LUDBJYUZrQ0owMjc4NHNXQThYQ1B0a2t0Z1hK?=
 =?utf-8?B?bTQzR1R6QU1WMmg1U2ZPSndRRTMrTmNTQVdBUVlweWxaY3UyZDNGR3dDQ3J3?=
 =?utf-8?B?UzQ2RkhRVzZQTFZQUS9OSUp6b1R1blFpNytUamY1cHYrSE1LektEc24xQWUx?=
 =?utf-8?B?WGpQNjF6TkZjNHA0azN3QVlPb3JDN3pxUEo4V1VkT0hjNUJmZzE2UEdkaDE3?=
 =?utf-8?B?K1ZmNTJBU09VS1grcXo1WGdYU0NtclpjWk4reUdwTG81WndqSS9CWGRiZWxJ?=
 =?utf-8?B?VVBuNitVbkdCS0ExblRUOEZrWFQxSmJ3ODgxcjNOa2t3N3BWbWIvNUt3cnFC?=
 =?utf-8?B?OGFBZnBucWVESGRqU2pSYXNMVXFkdE1QemhHSVpqUHdtQjNERU8wSE53Nm9Q?=
 =?utf-8?B?MG1FR0E1dks0NFVyMCtIWjlSQXlYRVRWcng2TytmQjNTZ0dJMXI5bzVRZHdk?=
 =?utf-8?B?K3pVbHRscmViUHROeDRVeDR3S1FwcmVFMFhYcUVjcEU2N2FTYTY4NHZHS3cx?=
 =?utf-8?B?bzdrUy8zYzBZYWFyUS9wMmRyQnl1ckRJS2gxYXI3ck9yMnZRV204V2p5b1FU?=
 =?utf-8?B?MmF6VGxjKzl1dEJ6OXB6N2t1OC9qU3g0U0FwTjl5TUNjTnpzRGJ4Z0ExdG1Z?=
 =?utf-8?B?R1BkVG1GRXIwOGF1VUJKNHBiU0orcWJuNXRyaUVCSzNHS2ZqcGQzdGxYN0Nl?=
 =?utf-8?B?VkhZd0xUN3pWajBlUFZrTktQeFRZWUM4TGhlalJ3MWpMTkpaV1cyZTFjMHpn?=
 =?utf-8?B?ODBTLy9hQ1gvcUpOMzhHaEN5NGJxTFdPb1ArbEwwN2xyNkpZSEtUR1JZSVNF?=
 =?utf-8?B?MEE5UTM1RVlkQnhnMytsUU9iZDZ0aThtZEJYQjFaTTZCVTkxTktjeWNXNkdU?=
 =?utf-8?B?WDM2aWFwelhhcmFkWnc4U05KN2dtRjhvQlcwNDBWa1pTYzE4ZXBHMWsweTRB?=
 =?utf-8?B?bU5rSExFd0szRXJBeDBpNXJwWmpPWXA3ODRkOFVNMm5lOCs3K3VuaUlzbUFO?=
 =?utf-8?B?NHpLcWhERDMybFU2VGROUkxOUVExMWNEZWlXbXBoUGIvbFl6RmlseUt6S1RX?=
 =?utf-8?B?cS9nRHhyZ3lQbnZWaVVETThNK25hSTNOOWNKMVpMd2gwdllQRHEzS3k3cis4?=
 =?utf-8?B?L2sxTTRsMmpsTlNrM3I3RW9ZWks0Q2ZnUWMyWDJmQ2dGcmkvMndURWJlSE5Y?=
 =?utf-8?B?QmJOUmdIV1BNNUFGNkNKVE8xZkhsR2poMk9DVkRsS2w0SUVGNm5sK2x6NXpk?=
 =?utf-8?B?ZE5qZ0I0ODh2NDh2VndraWJpTW4vRzJXVHZ4cHdzR25xdUNyL3ZQWFdOZzRy?=
 =?utf-8?B?cDRrTFlkM3J4eXJhSXpmNGpLcTQzT3pyUGlBVmZyL0w5empGcHVsbHZmRG14?=
 =?utf-8?B?bkE4akVkNUtxU2VFTmdaSGRuWm1GdzBqMzZwd2RuN2IvMGZ5KzN6dW5zcVg0?=
 =?utf-8?B?eWFxbFJkRnVQKy9TK2FUa2grSUVSNWovcGE2N0daRmZiSHRpSFR4VnNMQVJo?=
 =?utf-8?B?V1hhMjNlTWh4cHVMcE51eUgySm1ac2NNeWVnNStlNithQXRXSlFHWFAyMEth?=
 =?utf-8?B?WFcvR2FyTGtKTEpoOU14cjBONytidlZ0cVg3MDVzMEd6dDRIQjkxWWV3dnBx?=
 =?utf-8?B?b1YveDJTclpUUXVib3MwaEcxVjYrNUhrYnNuZ3dDaU1LSjRGbHlBdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: cb1dbf51-7813-48cb-861a-08de794afa18
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 17:33:26.4503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvGkia3CeczyuIC+vCxWJv+Cg9KETMpUguSJBxJhXD3IFZkpg50vwIqRWINxpB2wwwaaRSQQWsz2Lu3aXA7RMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2431
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
X-Rspamd-Queue-Id: F2FF41F4A8C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,garyguo.net,protonmail.com,umich.edu,gmail.com,collabora.com,arm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:dkim,garyguo.net:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Action: no action

On Tue Mar 3, 2026 at 4:22 PM GMT, Danilo Krummrich wrote:
> Convert libos (LibosMemoryRegionInitArgument) and rmargs
> (GspArgumentsPadded) to use CoherentInit / Coherent::init() and simplify
> the initialization. This also avoids separate initialization on the
> stack.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/gpu/nova-core/gsp.rs    | 47 +++++++++++--------------
>  drivers/gpu/nova-core/gsp/fw.rs | 62 +++++++++++++++++++++++----------
>  2 files changed, 65 insertions(+), 44 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
> index 25cd48514c77..cb7f6b4dc0f8 100644
> --- a/drivers/gpu/nova-core/gsp.rs
> +++ b/drivers/gpu/nova-core/gsp.rs
> @@ -5,10 +5,11 @@
>  use kernel::{
>      device,
>      dma::{
> +        Coherent,
>          CoherentAllocation,
> +        CoherentInit,
>          DmaAddress, //
>      },
> -    dma_write,
>      pci,
>      prelude::*,
>      transmute::AsBytes, //
> @@ -104,7 +105,7 @@ fn new(dev: &device::Device<device::Bound>) -> Result=
<Self> {
>  #[pin_data]
>  pub(crate) struct Gsp {
>      /// Libos arguments.
> -    pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
> +    pub(crate) libos: Coherent<[LibosMemoryRegionInitArgument]>,
>      /// Init log buffer.
>      loginit: LogBuffer,
>      /// Interrupts log buffer.
> @@ -114,7 +115,7 @@ pub(crate) struct Gsp {
>      /// Command queue.
>      pub(crate) cmdq: Cmdq,
>      /// RM arguments.
> -    rmargs: CoherentAllocation<GspArgumentsPadded>,
> +    rmargs: Coherent<GspArgumentsPadded>,
>  }
> =20
>  impl Gsp {
> @@ -123,34 +124,28 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>=
) -> impl PinInit<Self, Error
>          pin_init::pin_init_scope(move || {
>              let dev =3D pdev.as_ref();
> =20
> +            // Initialise the logging structures. The OpenRM equivalents=
 are in:
> +            // _kgspInitLibosLoggingStructures (allocates memory for buf=
fers)
> +            // kgspSetupLibosInitArgs_IMPL (creates pLibosInitArgs[] arr=
ay)
>              Ok(try_pin_init!(Self {
> -                libos: CoherentAllocation::<LibosMemoryRegionInitArgumen=
t>::alloc_coherent(
> -                    dev,
> -                    GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitArgum=
ent>(),
> -                    GFP_KERNEL | __GFP_ZERO,
> -                )?,
>                  loginit: LogBuffer::new(dev)?,
>                  logintr: LogBuffer::new(dev)?,
>                  logrm: LogBuffer::new(dev)?,
>                  cmdq: Cmdq::new(dev)?,
> -                rmargs: CoherentAllocation::<GspArgumentsPadded>::alloc_=
coherent(
> -                    dev,
> -                    1,
> -                    GFP_KERNEL | __GFP_ZERO,
> -                )?,
> -                _: {
> -                    // Initialise the logging structures. The OpenRM equ=
ivalents are in:
> -                    // _kgspInitLibosLoggingStructures (allocates memory=
 for buffers)
> -                    // kgspSetupLibosInitArgs_IMPL (creates pLibosInitAr=
gs[] array)
> -                    dma_write!(
> -                        libos, [0]?, LibosMemoryRegionInitArgument::new(=
"LOGINIT", &loginit.0)
> -                    );
> -                    dma_write!(
> -                        libos, [1]?, LibosMemoryRegionInitArgument::new(=
"LOGINTR", &logintr.0)
> -                    );
> -                    dma_write!(libos, [2]?, LibosMemoryRegionInitArgumen=
t::new("LOGRM", &logrm.0));
> -                    dma_write!(rmargs, [0]?.inner, fw::GspArgumentsCache=
d::new(cmdq));
> -                    dma_write!(libos, [3]?, LibosMemoryRegionInitArgumen=
t::new("RMARGS", rmargs));
> +                rmargs: Coherent::init(dev, GFP_KERNEL, GspArgumentsPadd=
ed::new(cmdq))?,
> +                libos: {
> +                    let mut libos =3D CoherentInit::zeroed_slice(
> +                        dev,
> +                        GSP_PAGE_SIZE / size_of::<LibosMemoryRegionInitA=
rgument>(),
> +                        GFP_KERNEL,
> +                    )?;
> +
> +                    libos.init_at(0, LibosMemoryRegionInitArgument::new(=
"LOGINIT", &loginit.0))?;
> +                    libos.init_at(1, LibosMemoryRegionInitArgument::new(=
"LOGINTR", &logintr.0))?;
> +                    libos.init_at(2, LibosMemoryRegionInitArgument::new(=
"LOGRM", &logrm.0))?;
> +                    libos.init_at(3, LibosMemoryRegionInitArgument::new(=
"RMARGS", rmargs))?;
> +
> +                    libos.into()
>                  },
>              }))
>          })
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index 751d5447214d..59cb03a9b238 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -9,11 +9,12 @@
>  use core::ops::Range;
> =20
>  use kernel::{
> -    dma::CoherentAllocation,
> +    dma::Coherent,
>      prelude::*,
>      ptr::{
>          Alignable,
> -        Alignment, //
> +        Alignment,
> +        KnownSize, //
>      },
>      sizes::{
>          SZ_128K,
> @@ -568,7 +569,9 @@ unsafe impl AsBytes for RunCpuSequencer {}
>  /// The memory allocated for the arguments must remain until the GSP sen=
ds the
>  /// init_done RPC.
>  #[repr(transparent)]
> -pub(crate) struct LibosMemoryRegionInitArgument(bindings::LibosMemoryReg=
ionInitArgument);
> +pub(crate) struct LibosMemoryRegionInitArgument {
> +    inner: bindings::LibosMemoryRegionInitArgument,
> +}

FYI tuple struct construction is being worked at now:
https://github.com/Rust-for-Linux/pin-init/pull/113

> =20
>  // SAFETY: Padding is explicit and does not contain uninitialized data.
>  unsafe impl AsBytes for LibosMemoryRegionInitArgument {}
> @@ -578,10 +581,10 @@ unsafe impl AsBytes for LibosMemoryRegionInitArgume=
nt {}
>  unsafe impl FromBytes for LibosMemoryRegionInitArgument {}
> =20
>  impl LibosMemoryRegionInitArgument {
> -    pub(crate) fn new<A: AsBytes + FromBytes>(
> +    pub(crate) fn new<'a, A: AsBytes + FromBytes + KnownSize + ?Sized>(
>          name: &'static str,
> -        obj: &CoherentAllocation<A>,
> -    ) -> Self {
> +        obj: &'a Coherent<A>,
> +    ) -> impl Init<Self> + 'a {
>          /// Generates the `ID8` identifier required for some GSP objects=
.
>          fn id8(name: &str) -> u64 {
>              let mut bytes =3D [0u8; core::mem::size_of::<u64>()];
> @@ -593,7 +596,8 @@ fn id8(name: &str) -> u64 {
>              u64::from_ne_bytes(bytes)
>          }
> =20
> -        Self(bindings::LibosMemoryRegionInitArgument {
> +        #[allow(non_snake_case)]
> +        let init_inner =3D init!(bindings::LibosMemoryRegionInitArgument=
 {
>              id8: id8(name),
>              pa: obj.dma_handle(),
>              size: num::usize_as_u64(obj.size()),
> @@ -603,7 +607,11 @@ fn id8(name: &str) -> u64 {
>              loc: num::u32_into_u8::<
>                  { bindings::LibosMemoryRegionLoc_LIBOS_MEMORY_REGION_LOC=
_SYSMEM },
>              >(),
> -            ..Default::default()
> +            ..Zeroable::init_zeroed()
> +        });
> +
> +        init!(LibosMemoryRegionInitArgument {
> +            inner <- init_inner,
>          })
>      }
>  }
> @@ -814,15 +822,23 @@ unsafe impl FromBytes for GspMsgElement {}
> =20
>  /// Arguments for GSP startup.
>  #[repr(transparent)]
> -pub(crate) struct GspArgumentsCached(bindings::GSP_ARGUMENTS_CACHED);
> +#[derive(Zeroable)]
> +pub(crate) struct GspArgumentsCached {
> +    inner: bindings::GSP_ARGUMENTS_CACHED,
> +}
> =20
>  impl GspArgumentsCached {
>      /// Creates the arguments for starting the GSP up using `cmdq` as it=
s command queue.
> -    pub(crate) fn new(cmdq: &Cmdq) -> Self {
> -        Self(bindings::GSP_ARGUMENTS_CACHED {
> -            messageQueueInitArguments: MessageQueueInitArguments::new(cm=
dq).0,
> +    pub(crate) fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {

This struct is not that big, so I think we can just keep the by-value
constructor.

Best,
Gary

> +        #[allow(non_snake_case)]
> +        let init_inner =3D init!(bindings::GSP_ARGUMENTS_CACHED {
> +            messageQueueInitArguments <- MessageQueueInitArguments::new(=
cmdq),
>              bDmemStack: 1,
> -            ..Default::default()
> +            ..Zeroable::init_zeroed()
> +        });
> +
> +        init!(GspArgumentsCached {
> +            inner <- init_inner,
>          })
>      }
>  }
> @@ -834,11 +850,21 @@ unsafe impl AsBytes for GspArgumentsCached {}
>  /// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to f=
orce it
>  /// to that size.
>  #[repr(C)]
> +#[derive(Zeroable)]
>  pub(crate) struct GspArgumentsPadded {
>      pub(crate) inner: GspArgumentsCached,
>      _padding: [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_AR=
GUMENTS_CACHED>()],
>  }
> =20
> +impl GspArgumentsPadded {
> +    pub(crate) fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
> +        init!(GspArgumentsPadded {
> +            inner <- GspArgumentsCached::new(cmdq),
> +            ..Zeroable::init_zeroed()
> +        })
> +    }
> +}
> +
>  // SAFETY: Padding is explicit and will not contain uninitialized data.
>  unsafe impl AsBytes for GspArgumentsPadded {}
> =20
> @@ -847,18 +873,18 @@ unsafe impl AsBytes for GspArgumentsPadded {}
>  unsafe impl FromBytes for GspArgumentsPadded {}
> =20
>  /// Init arguments for the message queue.
> -#[repr(transparent)]
> -struct MessageQueueInitArguments(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS)=
;
> +type MessageQueueInitArguments =3D bindings::MESSAGE_QUEUE_INIT_ARGUMENT=
S;
> =20
>  impl MessageQueueInitArguments {
>      /// Creates a new init arguments structure for `cmdq`.
> -    fn new(cmdq: &Cmdq) -> Self {
> -        Self(bindings::MESSAGE_QUEUE_INIT_ARGUMENTS {
> +    #[allow(non_snake_case)]
> +    fn new(cmdq: &Cmdq) -> impl Init<Self> + '_ {
> +        init!(MessageQueueInitArguments {
>              sharedMemPhysAddr: cmdq.dma_handle(),
>              pageTableEntryCount: num::usize_into_u32::<{ Cmdq::NUM_PTES =
}>(),
>              cmdQueueOffset: num::usize_as_u64(Cmdq::CMDQ_OFFSET),
>              statQueueOffset: num::usize_as_u64(Cmdq::STATQ_OFFSET),
> -            ..Default::default()
> +            ..Zeroable::init_zeroed()
>          })
>      }
>  }

