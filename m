Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UF2HFk+cpWmfEwYAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:18:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF1F1DA8E0
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 15:18:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525C510E105;
	Mon,  2 Mar 2026 14:18:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="SojWXDMZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO0P265CU003.outbound.protection.outlook.com
 (mail-uksouthazon11022131.outbound.protection.outlook.com [52.101.96.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83A1910E521;
 Mon,  2 Mar 2026 14:18:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dyQ4V2MxLF3vcEup2k71LP3rTN7djM5N/YAyYbp8RvxgdkXE/5fRSYMiJhD2P7yp+u+ga1awUuifkH7DzHTadrrkwaAZIbO1EtCLECEgbHJlBrMVYIkiDKm4l8WSLY4JihK83yLs3mb1PEAMvCr8SBvvNgm822i7PvjEoJD+F7E9ywzj/SvSb6L0eLnh2B0fcmtBjHHNKN2yh0mx7zr4jrrv1qnOkDVn/7y5mq1OVa6vL1u7QpV70W7Ei7IzyqLtPR09xfdpXhVaK+WkKPUqroaIJRM64UDCQD2/gIv/D+dnMLWWwlAQ/WsMgQy591tMpsPpcmbu83Qwr/thsb2dLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=27hg2lWPJoZZ7dtgu7e0bWSqw3+DIEaMGm3+TVlFREM=;
 b=cKD6hxW23hl/r8Q8hDCFothk+mB6MXhDCRNe0KF05yNSClSfGwx2xYiNjPR9AcnOqD6Uf3aPfcDPdEjOFpMr/hpL1EiJyKdhKkEHICKajqT2QYPqWQqEv6Td8njWmEFtNSukg+5RXgKkUKcdJx3E915FnyA7FT201a9JeWdgAs+Hms+1UeT5++OxwR2un8/x6H738HWtI9zqKTAUCupBvJg+CCPwLP6v0+CcaufmPQp5FyoO/cjoh9NOFj3fCIhwrFNzi4r8NzO7uubHVVdeUC24a1T14sCgaUonqHf/a28oS3eOPuiIMdRLzed/r/MkEzApvEXbfcG99BJo4moL/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=27hg2lWPJoZZ7dtgu7e0bWSqw3+DIEaMGm3+TVlFREM=;
 b=SojWXDMZYyisTlg5PTRUeXCLD/AHiC1h4jk1AZlTP1ig8zlwlOwLJ6a6I67Zsmc3MClcroGeosEzP73GfFDBOKOgVztSRnnnS4Tq1yKnxhaMDooIOhMO0YEDhVS+Ew/jtq8D83EVnLJPgEmu3m3bWP5litLEgue15XyJIcwUMas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOYP265MB1790.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:f2::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.16; Mon, 2 Mar
 2026 14:18:45 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 14:18:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 14:18:44 +0000
Message-Id: <DGSD13LEUEZK.DXHNXLIRVY24@garyguo.net>
Cc: "Zhi Wang" <zhiw@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alistair Popple" <apopple@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v4 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
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
 <20260302-cmdq-continuation-v4-2-c011f15aad58@nvidia.com>
In-Reply-To: <20260302-cmdq-continuation-v4-2-c011f15aad58@nvidia.com>
X-ClientProxiedBy: LO4P265CA0143.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOYP265MB1790:EE_
X-MS-Office365-Filtering-Correlation-Id: 11787b35-8a4d-438b-d8a8-08de78669d04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|10070799003|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: tj9CTx9LMGM7ac5ysuDgedQkENssua55DeLqm11BhDe0HSFq6VeVbGV7iXD5cKpLZbCW35psFGu8+8VMdH1kZtnTUyrv+xl9//k57fDpoTg4TWcblEssK80zEbE+MUCl3XmDgPGXfCN2ADQU1Uz49k20FdlsHsscv+KOFqn+8pAAxkTxrNKvkzwBBKJDF85dYqbBeSbFoNEXyfLnbau6yqe68O48dUv4ql7ibuc/oLA7kH9f1ix34tn0Hhj9plg7PLQqcEjhRR8pXcocOmqt2/V++86NPCDhrvaeJySe3WBRDRiE+mzxndm/avg8n4q1fN/LCtLZEr++bm/HX75kdzEz0sSldHDIMnqiFAiL4UetrRIjb/oEwgHrxUP4g2ZjY1HNvgYoQBCHTu+gsEIOdbZFU9o+8WgADbFDO9Gk9cRF9VgkCMw/nenVJR8YqMXond+qjPupIe28OEuIhZZb+WOQt9PD8mpoJHdKu+TY+kO0sihVDU1NRhe9zcrPxH75iS9AFEkm9jyRaNFBRD4FKZO7oz+8nwTR3JwfNtOP+1C/NazsOsnX6dMHu8s0XOnNRXN7EcNEuMoHCUGu6V/w5LNk3ayx48l5peFqnv7E++S1gaOvhsPYuz8Du9XkdPEDn7lQMgkhDIbtWzLg/Ht4UWbc1JuFFJh/bDMGBmBi3zyKwuFvU1q1nNdp1NnYDpmoCAemE/s1Wf6J6jodhsfJsXyVGU3V7moXWGHqpN71Kc0ggQLym+tSGCb/uaCwTWuBVEsthfF5PS88f54tVFyq+A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(10070799003)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UTY0YmtPUkJPZXgvMUNGdjkxdCtwODNrQjcyczVtSHlWTFh1Mnl2OHVoNFlX?=
 =?utf-8?B?NUNnWnAremowaHQ0ZTREWHhDR0FvUnhGUTRFRFlFY1BUYWpZMFJFbllmTjZt?=
 =?utf-8?B?dUpoUUxiT3VKempLYVVIRUYxMXoyZzBxTnAyeEhDRmJnMExGdk1oUlJQdkVB?=
 =?utf-8?B?R2l1MGNrSXlUYzRwOS9NZDAwdEduYUZIOEFxaVUxanBhMGxSNkNpV1hVeUpW?=
 =?utf-8?B?alQxWmkvSS9yZ2VPZkRoSzZwZmk4ZzVtMUNBcFhndWdjUmszTVdxMGV1OWEy?=
 =?utf-8?B?TTRrTVJOTWNnaHFFZ0NCUTBqSHBOWGhTckxrZ3V5RXVkaWxnaU9nbVVVN3RG?=
 =?utf-8?B?VlJvSEUyNndHOUF6OVdPTWtQZUIxQzVhMEZrUmdnb2lKQm5VS282VHEzSXRj?=
 =?utf-8?B?K3Z4d1FFZVlQUHhTUlBpVTB3TGFObkRyWjkxUnVHc0tXQ0R6NWdjcE1mMGk2?=
 =?utf-8?B?VUQvdEtxeDdxVkc3UU44MmJod0QwU2N5SnRHSUVHWDYxdXpRQWozTWpzditN?=
 =?utf-8?B?U3htUDcrb25TZHBLdEZlMFBzcExud3BadG52TXdxOXNvcCtEUUxoRk50SmFP?=
 =?utf-8?B?Y2UydjZld2dmREpzSzBJRGNwOGNDaExLQWJaU1JRaElHcmhPQVNGUGNNamlF?=
 =?utf-8?B?bXFRbDhkSTExeWs1dE5CYUZ0M3hsY1JjTmttOFN0YXZtZ053TVdEeWkyVUpl?=
 =?utf-8?B?UE5WdnZjZTBRUUtnZEExT25XWWhmckdnZ1h4QlhIYU9JV0dEWHBEK1RudWFp?=
 =?utf-8?B?a0NDYmltajk4TnN2TUtZN2hWODFZSWsxNENrc3UyWmlObTZpeXZ2L09NQUVE?=
 =?utf-8?B?d3pHSURXam5OM0ZMRzl2bW1pRmVWRjQ5eXZXK2tWTG40N280d3pNZWdHS1BC?=
 =?utf-8?B?NVhVVWZjMXozOGFKTC9CTVJtZmJlSnZyeG1Ra1BaMytzYlJuMjZrRFFuempq?=
 =?utf-8?B?OXFPaXFMeCs4WUx4QnVGTUFldUpLcVJEUW0vcmw0ZnB4SHNsSzJtdHRBa3pY?=
 =?utf-8?B?U0RuSXIwelNSTk1iU3piTWRDa0kzUDM0VTVwWDdnNUFzQVR5RDBhVEpLb3VO?=
 =?utf-8?B?RG80VHdUTVhVVzdUc0RUUXlJeDJwTHdmMWdPSXJHVWdac1V4SWc2ME9XdzJW?=
 =?utf-8?B?NzFycVVCUWtiSzczNk84UWhnaHlROWx0OU95KzNyeDhDUjh5YmVJWGkrK1c4?=
 =?utf-8?B?T2VlYnJCMElIZDdsR0Q5cCtwazcxd21hbzBrdE0rL0p3UllCbXBlMlZwcjRh?=
 =?utf-8?B?RjNNRkVxTmJGSlU1SE5pNHFlODMwUGsxT3pLMUdob1UzY0F6c3k1L0w1WDZp?=
 =?utf-8?B?cTNjWTNmR2liaExiNk4zYytvYmVXV2xqNmJjU2FrK0pncDZVYWRzamRBKzNB?=
 =?utf-8?B?UlNIckN4OE5ZR2lkSmJGd1JOY3V1MDlIR3RITzJDWWZ6cUNZRno3RXNGbko2?=
 =?utf-8?B?ZHdlbXRBVlZ5c3d1QlZNRFlUWURBVFNCWlFPUzRRZ2NCc01PTGFtR3pmMjhM?=
 =?utf-8?B?MG0zU1JIMTBWZCtORGIrTTgzVkNkcmpCUUNhYnJxa0E3ZldLT01MckdXTmlk?=
 =?utf-8?B?WUQvQW9NODJtMExoUWh0QlNkNnVaMmVZU0N3ZWIxUXUvN0Vzb28xM3FIQzln?=
 =?utf-8?B?NUZBeVR3ajRlM1Fhb2Q3TllMcXRrVngrZHVlMSswUldYTWg2Tm93YmhVRjgy?=
 =?utf-8?B?UFRkY3pKdUNuQ3NMWG44cWpvT1VnT0ZkT2FIKzJQYXNNYmNEYy9SRXlDOCti?=
 =?utf-8?B?MTF2RWFDNVR3OXEremx6V2FHcUNvK3cxTHRDUjFhSU9LaDdZbVErNk1TRVdX?=
 =?utf-8?B?N1V0RVdYNUpxaDd3TysvQ1pCcWl1RXh2bWlWVzNYWlJpM01hbzdxaGlOdmVR?=
 =?utf-8?B?RUQ2Y3NZV0JvTkM2QTJ1LzJIQmM0SkxWT0czSU9DTzlZYTlnTHhmWE8zOEox?=
 =?utf-8?B?US90M3NwOG5GM2tVUXZCbGR3WS8yTTlXUnFLaHBpUTQ4dnBLNmVvQXhueVdI?=
 =?utf-8?B?dkNEUlFLQk9iNi9adWRDMm9DS0VKUUVnMXAvZWtIYTR3QTUxRmNwM0J3ZUFn?=
 =?utf-8?B?M0JFaWVPR2NaUkxoeEVOazAwTUlHbHYyR1ZhNDhya0FuTGRkR2IzWC9obXVL?=
 =?utf-8?B?blYzN0lpZkZyUCsrQ2dkazNuQktVQjRKVlRWT3ZEdHNKUk1LSFVkSGFUTTlo?=
 =?utf-8?B?ZVBtVXJ4czhxbmR1aUZNVVk1SW1zSmNsZHV4OVpDTzVxOG5EZG5mdTgza1U3?=
 =?utf-8?B?cUJEd2U2dzB5ZTcyMkNXbUtTUkNvWVMyRzhIR3ZMMVRjRXhNMEcrVUpyeTJU?=
 =?utf-8?B?dWg1RjBHWGdxTnd3OWdCSEhmWUhPYk55STlNUVNuM0JRZGRCNi9pdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 11787b35-8a4d-438b-d8a8-08de78669d04
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 14:18:45.0333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PtVVGU14QDMkxTKhcx/hT/peqd3Py3YSIlqr+XXLKLTB9K9OS8hCcN9kakDFoCvLcaPZYIykUXWyn6trhOFVMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOYP265MB1790
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
	DKIM_TRACE(0.00)[garyguo.net:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	URIBL_MULTI_FAIL(0.00)[nvidia.com:server fail,gabe.freedesktop.org:server fail,garyguo.net:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,garyguo.net:mid,garyguo.net:dkim]
X-Rspamd-Queue-Id: 9EF1F1DA8E0
X-Rspamd-Action: no action

On Mon Mar 2, 2026 at 11:42 AM GMT, Eliot Courtney wrote:
> Add a timeout to `allocate_command` which waits for space on the GSP
> command queue. It uses a similar timeout to nouveau.
>
> This lets `send_command` wait for space to free up in the command queue.
> This is required to support continuation records which can fill up the
> queue.

Any reason that this isn't implemented as a `poll_allocate_command` which j=
ust
returns a `EAGAIN`, and then a wrapper function that just waits for space t=
o be
ready when it got one? This way the logic is cleaner.

(I write this with Rust async in mind)

>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 39 +++++++++++++++++++++++++++------=
------
>  1 file changed, 27 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 87dbbd6d1be9..efbbc89f4d8a 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -250,6 +250,19 @@ fn new(dev: &device::Device<device::Bound>) -> Resul=
t<Self> {
>          }
>      }
> =20
> +    /// Returns the size of the region of the CPU message queue that the=
 driver is currently allowed
> +    /// to write to, in bytes.
> +    fn driver_write_area_size(&self) -> usize {
> +        let tx =3D self.cpu_write_ptr();
> +        let rx =3D self.gsp_read_ptr();
> +
> +        // `rx` and `tx` are both in `0..MSGQ_NUM_PAGES` per the invaria=
nts of `gsp_read_ptr` and
> +        // `cpu_write_ptr`. The minimum value case is where `rx =3D=3D 0=
` and `tx =3D=3D MSGQ_NUM_PAGES -
> +        // 1`, which gives `0 + MSGQ_NUM_PAGES - (MSGQ_NUM_PAGES - 1) - =
1 =3D=3D 0`.
> +        let slots =3D (rx + MSGQ_NUM_PAGES - tx - 1) % MSGQ_NUM_PAGES;
> +        num::u32_as_usize(slots) * GSP_PAGE_SIZE
> +    }
> +
>      /// Returns the region of the GSP message queue that the driver is c=
urrently allowed to read
>      /// from.
>      ///
> @@ -281,15 +294,22 @@ fn new(dev: &device::Device<device::Bound>) -> Resu=
lt<Self> {
>      }
> =20
>      /// Allocates a region on the command queue that is large enough to =
send a command of `size`
> -    /// bytes.
> +    /// bytes, waiting for space to become available based on the provid=
ed timeout.
>      ///
>      /// This returns a [`GspCommand`] ready to be written to by the call=
er.
>      ///
>      /// # Errors
>      ///
> -    /// - `EAGAIN` if the driver area is too small to hold the requested=
 command.
> +    /// - `ETIMEDOUT` if space does not become available within the time=
out.
>      /// - `EIO` if the command header is not properly aligned.
> -    fn allocate_command(&mut self, size: usize) -> Result<GspCommand<'_>=
> {
> +    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Resul=
t<GspCommand<'_>> {
> +        read_poll_timeout(
> +            || Ok(self.driver_write_area_size()),
> +            |available_bytes| *available_bytes >=3D size_of::<GspMsgElem=
ent>() + size,
> +            Delta::ZERO,
> +            timeout,
> +        )?;
> +
>          // Get the current writable area as an array of bytes.
>          let (slice_1, slice_2) =3D {
>              let (slice_1, slice_2) =3D self.driver_write_area();
> @@ -298,13 +318,6 @@ fn allocate_command(&mut self, size: usize) -> Resul=
t<GspCommand<'_>> {
>              (slice_1.as_flattened_mut(), slice_2.as_flattened_mut())
>          };
> =20
> -        // If the GSP is still processing previous messages the shared r=
egion
> -        // may be full in which case we will have to retry once the GSP =
has
> -        // processed the existing commands.
> -        if size_of::<GspMsgElement>() + size > slice_1.len() + slice_2.l=
en() {
> -            return Err(EAGAIN);
> -        }
> -
>          // Extract area for the `GspMsgElement`.
>          let (header, slice_1) =3D GspMsgElement::from_bytes_mut_prefix(s=
lice_1).ok_or(EIO)?;
> =20
> @@ -497,7 +510,7 @@ fn notify_gsp(bar: &Bar0) {
>      ///
>      /// # Errors
>      ///
> -    /// - `EAGAIN` if there was not enough space in the command queue to=
 send the command.
> +    /// - `ETIMEDOUT` if space does not become available within the time=
out.
>      /// - `EIO` if the variable payload requested by the command has not=
 been entirely
>      ///   written to by its [`CommandToGsp::init_variable_payload`] meth=
od.
>      ///
> @@ -509,7 +522,9 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, =
command: M) -> Result
>          Error: From<M::InitError>,
>      {
>          let command_size =3D size_of::<M::Command>() + command.variable_=
payload_len();
> -        let dst =3D self.gsp_mem.allocate_command(command_size)?;
> +        let dst =3D self
> +            .gsp_mem
> +            .allocate_command(command_size, Delta::from_secs(1))?;

Let's make these consts, not magic numbers.

Best,
Gary

> =20
>          // Extract area for the command itself.
>          let (cmd, payload_1) =3D M::Command::from_bytes_mut_prefix(dst.c=
ontents.0).ok_or(EIO)?;

