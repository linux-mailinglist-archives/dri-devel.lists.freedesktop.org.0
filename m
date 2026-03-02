Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gI6SHeKUpWmPEQYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:47:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2A71DA0C1
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 14:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7220210E35B;
	Mon,  2 Mar 2026 13:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="XPY5izZm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU010.outbound.protection.outlook.com
 (mail-ukwestazon11022106.outbound.protection.outlook.com [52.101.101.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEA910E35B;
 Mon,  2 Mar 2026 13:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WetZ9qO5Utor+0E9CSKRSBiB4WJOXrZj/DUmy/RUv5J4QWUmFrL014TvniFfp1wufigddbIe+d8klOufYB9ZXnigVRpa0byxaS1B1JDGwhREumvNyIRCzrntI4pJFq+rJq5bDYvmEOtrG/CGExKs3/G3MCLfy25XRhNRPxQFnwpLUjvYza8CVnO8PN4F1x5ClfUlJ/B8ZAnfnlN4xCq8DLXFYL6GYn+oP4o1fC38aqruyH4NQKh0Q2PAE7KVXbFsEVgXtbHXqyaF2yF7eopcyhIWCQCPL2IGgEZuFsdP1ZPBwohOmO6cBXR2yWLVtN4525yXRK+2WImq/1cMq0g2+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bANeFdfLxsO5KW2XqUIIelkyxLYFOgBJLn+bjnHTG9E=;
 b=X15rZwLIDNA0F8XL/FdmFeJudp+CT/qc3XY2n+O9/pMfZhdyG/tHLGMMqpfsblDaW4CDBXS26sMPxA6pp6m0N0oX1pyGLbPfUFlz+BPikg8S70X4gubipi1LS8QeQJDfZ4OfH662ipjb9Nk7W0FL5cZv6pEF3ypwhbhxAwb4X0LeiQLYnGPYiUfeOUkvIM70e+CpH+fYt1g5xDkdbrFLYFNpRGgpy0NipdrETubmk/KCCSHvFAZyJ7n7Cde+WUbXYcw1LrKbETnEi2Pxhx4RE5ZWBqltk9Sud6Qn/KrwNaWn7hQXZqqCjTumByTHCzrJg1j221M8+BLI8JIQheMnqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bANeFdfLxsO5KW2XqUIIelkyxLYFOgBJLn+bjnHTG9E=;
 b=XPY5izZmLizoPFzjI8mPPQB38arxUHlCxX3TA/fgPImLX4hYQWCm4IurwYFwXJym39K0F6n2jW0LtYPdP+LviKskHz/50FVCGfEfqcn3kH94yvdCT+36eX+EIsBJeb3W7xs9vvx6HZzqfAJ0D+U3hDZtWFsuufGwac/ZAWCoXJ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5568.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:158::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 13:47:04 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 13:47:04 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 13:47:03 +0000
Message-Id: <DGSCCUH798RC.3JBL3K24ZYGNK@garyguo.net>
Cc: "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 1/9] gpu: nova-core: gsp: sort MsgFunction variants
 alphabetically
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260302-cmdq-continuation-v4-0-c011f15aad58@nvidia.com>
 <20260302-cmdq-continuation-v4-1-c011f15aad58@nvidia.com>
In-Reply-To: <20260302-cmdq-continuation-v4-1-c011f15aad58@nvidia.com>
X-ClientProxiedBy: LO4P123CA0522.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:272::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5568:EE_
X-MS-Office365-Filtering-Correlation-Id: 706588fa-6294-401c-e00f-08de78623025
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: ZKPc0FM53CCPh2cC4IuH7a8aYcex8M9Z6qVlUr5tyOIMZflvefmujZ016uOWIw7j5Aq+agF2ZPKBHBnoGByNRWKqh2OATsjEKSoRbTCB+ScDEGSQOTABWBQOASITYTX8IMWuuItQumuqOmrq2g/x7wTPrhfe/dbreh2lplU4bAkqHSouSZAMOgI8XEtmQJt3OIylixtUfKiG2PGFMRwFPmpqJ3hpLHr6s5XgUwLMuhbbae3uVo/uOk5U3xdASMaEOmkVPcEs92jsemM1WFIHv5Q5lYfVaS1BiTNtZ39tE0HzY4XT6ZI/eE+uw/cP+44Pl/eDZTqaOPsC6372iWbcrQCGfXSL/pKVbnm6BNnOPQAbbxipf8uIuw/64qCoblWhEk8wPNcG3LYQh3lDWCvWgIhoJ+s9CEQDOARKJ061immibnmIBfoJEx/8Hq+qk0PW18ebCveDZwc68AFEfsRGxzgKRzqi74vTZQ0OlgUwtalLrbxXpLDqOiK11Dz/Ja01E243tq+aakNcxLOMcXdS6TqGqV7TumxmIa5Vo8LokwxS4iZxvAIYfyB8z80Zc9NYEfcR/apA5ZPPTLmXFXXVCkdmlxOs5nRRbwmAoVO1K5Ldzja/OeD93EG3jkLbw09jvu9BSaBsHfoRNYDkYo3SREiUBrA5jBrxplhanKCCjU3aF1vD54UbxIhZzUaV5YLYgdQE3xkPqSroiFrbeisXH5fwq4oLrABy+zN1VSKIqepsQFAZdhT+MHqt5xkn0idawbWKMTp/sb8GJx12m6OlBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(7053199007)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmlVRzAwQStFaTlNL3g0OVQ0WFg0UjBjdWcveGNCRGtZNHVtd3NuaHdiUXBO?=
 =?utf-8?B?bnhUUGlaU0VIU2Vmb3pzVjlUclNjbmt3ZmJWT2g5SnhSdVRNS3E4b3gwK0Q2?=
 =?utf-8?B?dGk0ZzYzdjRrRWd0WDNqWU9iendranlOcDd4dlB2dkZsaVFsR09lWlZROVBS?=
 =?utf-8?B?QnFIR0tmRlhzdm53ZmYrK0I1SkxwMXJqa3ZHVGNZRWxZbmFzbVgvTGhMOVZY?=
 =?utf-8?B?RXlwTHZzRjhScVhZK3pGSlJ1ODR3ajJ2WnJSRkNTbEhZTitoalQ2UER4R3BE?=
 =?utf-8?B?OTBjOGxMVUdqeGNtZ3pGRWFKV3ZxK2krWFVJb1Z4UEx2MXdNODh6a29mcEhL?=
 =?utf-8?B?SkVsT0tZUDZpWkdFNXJTU0tMVFlqRStwL2lwRzhwUzFjTG1KWmphWGVNOHlR?=
 =?utf-8?B?ZXdXRGpFelp2czRnaDRaYUdkdmRnQ3drQ2VlT3VrVlhwZWdDYysxdy9aUkE2?=
 =?utf-8?B?Uzk3b3p2K25PV1FZS1l0M0hpcDN0ZXhoWTBVZlU4UkZjM0Q3L3Z4dnlOcEpS?=
 =?utf-8?B?ai92NGxMY2VOS0NVSTVpZ08wR1g4VmQ4bEc3a3pCSldocTQ3eXAzcU44dzU1?=
 =?utf-8?B?UENFMUwyNlFoczZaTUlGS2QxSlJzUDV5bnBoRWM2VGwzODREWmlnYWNhWWNq?=
 =?utf-8?B?MFViR1BONzRadmRHaWtseTNwNnJucmZTK2pHTFBxQTh0UmhlRC9aRVJIeU1T?=
 =?utf-8?B?dHJ0N1F2L3l0dGlQR3pGYy9uMDlDVEZTYmxRQVVZVlFESENlT3crVU1nUmwx?=
 =?utf-8?B?SVNSajRiU1JlbjNVekJiMm5KaVkxa0h6NE91ZjRzclZJZkdwZXRBbjRFQmJx?=
 =?utf-8?B?T3IwZ2dKdWpZcGZ3Y1BHbDhzMmJNcis1VUVPTDR4Q3JWRk5UaWYrV0U5MjNz?=
 =?utf-8?B?R1Bkd2h0dVRUMmE3OXBYN3l2ZnloODJTd1VseG4vMnZlNFBNMjUrM1dzMGMr?=
 =?utf-8?B?NTEzdWRhU0I3UmpaNm5rNFVoNlA1WTdpWVdEODVISWxiQVMwN3NBUEFFSEFt?=
 =?utf-8?B?a3RxT1d0dld2dnY0aVRVSEQ4Kzl4T2hCeWw0Zk5ndlZDNXhXYVVGYW8xMHRo?=
 =?utf-8?B?VENRcmErWGlzQ3JhRFdGOE5VS2lVZmFSOHRZOEQ4Ni9mQ1J5V3NQNDI4ZTFM?=
 =?utf-8?B?QnFhaXpSN1BnTkwyV3p4bGRuaUo4TWJ1NGhka1RSTDl5dFNCenU2SEl6NWhD?=
 =?utf-8?B?TVJmaUhybDhXRHVwMEU5RWpaZndrbng5WEFZSUw1WHBGbUlmTHFRTzl3dEpQ?=
 =?utf-8?B?Nkw2b01lbE5GaFJydldkNkd5K29yRFl6aUF3VTVaT08yNXRHVTZOOUNnaUN3?=
 =?utf-8?B?VzNBa2FoemQzT0xNSCtZOGlLa0JoMlU1M2pBMjVVUktUNG1xcnE1Q3FrUko1?=
 =?utf-8?B?MzRaejJGTnRxSnRjZ0ZLc0JkU2Npd1Nkek5WWGdYSnRKbmRZS2dBa0lxU0Fx?=
 =?utf-8?B?Z05SMzdPQXdkUTFLZEViaGF5RU1HbExENm5HSWxzMmpMVHVzTHVjK2xJMFlK?=
 =?utf-8?B?a09JSk5lMytZZlYyNnc1dGVZN1ZkbUwxRm1RRHR3M0daaGFndHFiOGFVZ3h5?=
 =?utf-8?B?UExSdVdsSGhnd2x1dUlFaFBCdW1QNS8zUGlJSHYwcllEKzYzQUhQK1FITGhY?=
 =?utf-8?B?Wk8rVEpKZlhVV2wyTGFvNEtaQ1JlVTJRcXJrSnhreTVkSWE4aGxzYjZqNFBr?=
 =?utf-8?B?UCtUemIvTUVZUVFoUkhDUXJRMWVMTGMyeklCbm5XTnA3ZDBOcFo1dGZoSFl1?=
 =?utf-8?B?Y0tLR3Y1YjRNZ0xXdTlMbmZUWEMzOXZ3MHFxQkJTVjgzQTZTb0tyYyt5c3dl?=
 =?utf-8?B?NWJxSXFpdnMrcnZFNG9xYkJhTGNkTEhlSnJ0UXR5S3ZUNVpQNCsydkoreXFa?=
 =?utf-8?B?SGFob0luRnpoS3NrK29uaVZCTVRVaVdJUXRKTlBZZ2RCMTV0R2txenpUOVRO?=
 =?utf-8?B?alJUYWM1KzhEaXRLUlNJTEpUbHNEQitpc0ZjSWVwL056dGNqU25FWlphc0lt?=
 =?utf-8?B?RGVCU1g2ZVhlc0JoM3JaSmtvc3RpdVVvb0NBNHdIcFdNcVhzb2hrQmVtUk9h?=
 =?utf-8?B?K0NRdlZjVmlkU2ZkUjNIQ2xYMVlCZlZQdUJiZEZ3M1RpSWlCRHM5QWhBaFRM?=
 =?utf-8?B?bWQzcldMZm5kYk11ZHEwbUUxa0t5WDdoTkhidFBldE0xb0JaVkwrNENadmNw?=
 =?utf-8?B?cm82NDNFSVN4R2JjQklzSEowSU9IUVljSXVVV29McldEZDcxV1J2U20rT3Jr?=
 =?utf-8?B?V0JFRVd1cVlrU1JJRTM3OGhIcHdQS3hwbkNQa2VoVWRjMzIxbmM0K28xNUcy?=
 =?utf-8?B?NHVCVlVaYjBxNzJPZjRKZy9lN3krL2VuSE5vMm8rOWNzSzlST0Y4dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 706588fa-6294-401c-e00f-08de78623025
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 13:47:04.4105 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UsQFOMSexeDnG9VWVb0UOMXmFanNWRqROO9wvE1FMXKFnxp7mVvXSsKwvhv5YlsnmA6q0RY339V9ZCTP2cxICw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5568
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: 4F2A71DA0C1
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 11:42 AM GMT, Eliot Courtney wrote:
> There is no particular order required here and keeping them alphabetical
> will help preventing future mistakes.

Looks like the current order is in increasing opcode order. Granted, curren=
tly
they're generated in bindings and then included as such, but perhaps eventu=
ally
Rust code can be generated directly so the ordering could make sense?

Best,
Gary

>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/fw.rs | 67 +++++++++++++++++++++--------------=
------
>  1 file changed, 35 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index f1797e1f0d9d..4b998485360b 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -191,34 +191,34 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_la=
yout: &FbLayout) -> Self {
>  #[repr(u32)]
>  pub(crate) enum MsgFunction {
>      // Common function codes
> -    Nop =3D bindings::NV_VGPU_MSG_FUNCTION_NOP,
> -    SetGuestSystemInfo =3D bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYST=
EM_INFO,
> -    AllocRoot =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
> +    AllocChannelDma =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA=
,
> +    AllocCtxDma =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
>      AllocDevice =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE,
>      AllocMemory =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY,
> -    AllocCtxDma =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA,
> -    AllocChannelDma =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA=
,
> -    MapMemory =3D bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
> -    BindCtxDma =3D bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
>      AllocObject =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT,
> +    AllocRoot =3D bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT,
> +    BindCtxDma =3D bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA,
>      Free =3D bindings::NV_VGPU_MSG_FUNCTION_FREE,
> -    Log =3D bindings::NV_VGPU_MSG_FUNCTION_LOG,
>      GetGspStaticInfo =3D bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_I=
NFO,
> -    SetRegistry =3D bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
> -    GspSetSystemInfo =3D bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_I=
NFO,
> +    GetStaticInfo =3D bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
>      GspInitPostObjGpu =3D bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_O=
BJGPU,
>      GspRmControl =3D bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
> -    GetStaticInfo =3D bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
> +    GspSetSystemInfo =3D bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_I=
NFO,
> +    Log =3D bindings::NV_VGPU_MSG_FUNCTION_LOG,
> +    MapMemory =3D bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY,
> +    Nop =3D bindings::NV_VGPU_MSG_FUNCTION_NOP,
> +    SetGuestSystemInfo =3D bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYST=
EM_INFO,
> +    SetRegistry =3D bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
> =20
>      // Event codes
>      GspInitDone =3D bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
> +    GspLockdownNotice =3D bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTIC=
E,
> +    GspPostNoCat =3D bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
>      GspRunCpuSequencer =3D bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUE=
NCER,
> -    PostEvent =3D bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
> -    RcTriggered =3D bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED,
>      MmuFaultQueued =3D bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED,
>      OsErrorLog =3D bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG,
> -    GspPostNoCat =3D bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD,
> -    GspLockdownNotice =3D bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTIC=
E,
> +    PostEvent =3D bindings::NV_VGPU_MSG_EVENT_POST_EVENT,
> +    RcTriggered =3D bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED,
>      UcodeLibOsPrint =3D bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT,
>  }
> =20
> @@ -227,38 +227,41 @@ impl TryFrom<u32> for MsgFunction {
> =20
>      fn try_from(value: u32) -> Result<MsgFunction> {
>          match value {
> -            bindings::NV_VGPU_MSG_FUNCTION_NOP =3D> Ok(MsgFunction::Nop)=
,
> -            bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO =3D> {
> -                Ok(MsgFunction::SetGuestSystemInfo)
> -            }
> -            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT =3D> Ok(MsgFunctio=
n::AllocRoot),
> +            // Common function codes
> +            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA =3D> Ok(Msg=
Function::AllocChannelDma),
> +            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA =3D> Ok(MsgFunc=
tion::AllocCtxDma),
>              bindings::NV_VGPU_MSG_FUNCTION_ALLOC_DEVICE =3D> Ok(MsgFunct=
ion::AllocDevice),
>              bindings::NV_VGPU_MSG_FUNCTION_ALLOC_MEMORY =3D> Ok(MsgFunct=
ion::AllocMemory),
> -            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CTX_DMA =3D> Ok(MsgFunc=
tion::AllocCtxDma),
> -            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_CHANNEL_DMA =3D> Ok(Msg=
Function::AllocChannelDma),
> -            bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY =3D> Ok(MsgFunctio=
n::MapMemory),
> -            bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA =3D> Ok(MsgFunct=
ion::BindCtxDma),
>              bindings::NV_VGPU_MSG_FUNCTION_ALLOC_OBJECT =3D> Ok(MsgFunct=
ion::AllocObject),
> +            bindings::NV_VGPU_MSG_FUNCTION_ALLOC_ROOT =3D> Ok(MsgFunctio=
n::AllocRoot),
> +            bindings::NV_VGPU_MSG_FUNCTION_BIND_CTX_DMA =3D> Ok(MsgFunct=
ion::BindCtxDma),
>              bindings::NV_VGPU_MSG_FUNCTION_FREE =3D> Ok(MsgFunction::Fre=
e),
> -            bindings::NV_VGPU_MSG_FUNCTION_LOG =3D> Ok(MsgFunction::Log)=
,
>              bindings::NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO =3D> Ok(M=
sgFunction::GetGspStaticInfo),
> -            bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY =3D> Ok(MsgFunct=
ion::SetRegistry),
> -            bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO =3D> Ok(M=
sgFunction::GspSetSystemInfo),
> +            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO =3D> Ok(MsgFu=
nction::GetStaticInfo),
>              bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_OBJGPU =3D> {
>                  Ok(MsgFunction::GspInitPostObjGpu)
>              }
>              bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL =3D> Ok(MsgFun=
ction::GspRmControl),
> -            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO =3D> Ok(MsgFu=
nction::GetStaticInfo),
> +            bindings::NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO =3D> Ok(M=
sgFunction::GspSetSystemInfo),
> +            bindings::NV_VGPU_MSG_FUNCTION_LOG =3D> Ok(MsgFunction::Log)=
,
> +            bindings::NV_VGPU_MSG_FUNCTION_MAP_MEMORY =3D> Ok(MsgFunctio=
n::MapMemory),
> +            bindings::NV_VGPU_MSG_FUNCTION_NOP =3D> Ok(MsgFunction::Nop)=
,
> +            bindings::NV_VGPU_MSG_FUNCTION_SET_GUEST_SYSTEM_INFO =3D> {
> +                Ok(MsgFunction::SetGuestSystemInfo)
> +            }
> +            bindings::NV_VGPU_MSG_FUNCTION_SET_REGISTRY =3D> Ok(MsgFunct=
ion::SetRegistry),
> +
> +            // Event codes
>              bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE =3D> Ok(MsgFunctio=
n::GspInitDone),
> +            bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE =3D> Ok(MsgF=
unction::GspLockdownNotice),
> +            bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD =3D> Ok(Ms=
gFunction::GspPostNoCat),
>              bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER =3D> {
>                  Ok(MsgFunction::GspRunCpuSequencer)
>              }
> -            bindings::NV_VGPU_MSG_EVENT_POST_EVENT =3D> Ok(MsgFunction::=
PostEvent),
> -            bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED =3D> Ok(MsgFunction=
::RcTriggered),
>              bindings::NV_VGPU_MSG_EVENT_MMU_FAULT_QUEUED =3D> Ok(MsgFunc=
tion::MmuFaultQueued),
>              bindings::NV_VGPU_MSG_EVENT_OS_ERROR_LOG =3D> Ok(MsgFunction=
::OsErrorLog),
> -            bindings::NV_VGPU_MSG_EVENT_GSP_POST_NOCAT_RECORD =3D> Ok(Ms=
gFunction::GspPostNoCat),
> -            bindings::NV_VGPU_MSG_EVENT_GSP_LOCKDOWN_NOTICE =3D> Ok(MsgF=
unction::GspLockdownNotice),
> +            bindings::NV_VGPU_MSG_EVENT_POST_EVENT =3D> Ok(MsgFunction::=
PostEvent),
> +            bindings::NV_VGPU_MSG_EVENT_RC_TRIGGERED =3D> Ok(MsgFunction=
::RcTriggered),
>              bindings::NV_VGPU_MSG_EVENT_UCODE_LIBOS_PRINT =3D> Ok(MsgFun=
ction::UcodeLibOsPrint),
>              _ =3D> Err(EINVAL),
>          }

