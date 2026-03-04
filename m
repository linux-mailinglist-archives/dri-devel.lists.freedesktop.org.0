Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIccNKIWqGlTnwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:25:22 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235871FEEEC
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 12:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7782010E9AE;
	Wed,  4 Mar 2026 11:25:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="GogqJz2T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021075.outbound.protection.outlook.com [52.101.100.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C716910E9AE;
 Wed,  4 Mar 2026 11:25:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATTJ6biRlt8RIS+Lev2A/k0dQN1oZ5URfM+JbKkT58cmwpNODoTLdhs6ZAlHV+EEJpKSIn0o0io9PJy/7Nf8lZp3xEHzzd+BXIBm2vEyHHVrc9LZWixiS2wQb5pWePdEBUpyOn8V08Cgwgp/4Md9W5x3UFlZGg4F5zXFknVnaIkOejjrJKjVIuEp3w7QI5DDGPpS9UBol8Ru1UYlBuMtu/jH5YVSaMCrXXSBA+4XzJQQD+FJgHpY0FlgBqoqe1WfP0kqmEVt1epApW6Truz2k32gNLKNrffjw3ieh3bBY0xxcF+LhT5lN3yp7stbHpUU3+rANlNoEP/qKPXexXEJJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vt0UqjRC4hDSk+4WzKq6JATpuAI2peyLQyKVbsGcrpQ=;
 b=JO1L/5OWsmrDEvGN7OlFDD5EX4Nc76m/teCkIx6VlSQM5JXOyhquE5iUHeZiZ4p5JbdoeF8FIfzYQsw5RQZuETBO03BxFsW1P3sSlNt+qfvLt0xaC4+ze8N2tsjzoW1a9/Ta+QiIz+6SpUBjErMagsFzIEnBWprUZ5xFiwrG/Sqre1fJSve428C4tFNKROk6dKWN+HUbo/FpLgLe2Ndi9dTGBsey9lVbO+CT+6Gcbq5lXb2hsqaBbwD91iBrjhc+iHuYHMIoaQ8ezELmsuFL+/py6Hl24S8kFlYclClsXruMgaLZZtIhKcEzownc088U7X2HNFfBAuq+9zusoEtMTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vt0UqjRC4hDSk+4WzKq6JATpuAI2peyLQyKVbsGcrpQ=;
 b=GogqJz2TP2O9XLQZwcAFenNZdLQk4vkNOaF4st853NKXxlKaXjpdIwCMbU1Ho+z/P0YMleDPAUgUKdnBp3tOPPf5tnisSszbxos5fcYzfDOWu2XKfVxTyvbFagv/xPWH9QauTWxEPYlsXjl6l9GrrQtARWRYZVReFp/27YRDO5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO2P265MB2446.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:12d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.17; Wed, 4 Mar
 2026 11:25:09 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9678.016; Wed, 4 Mar 2026
 11:25:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 11:25:08 +0000
Message-Id: <DGTYL9RNLI6W.2EDM61M64V7PK@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v3 1/5] gpu: nova-core: gsp: fix stale doc comments on
 command queue methods
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260304-cmdq-locking-v3-0-a6314b708850@nvidia.com>
 <20260304-cmdq-locking-v3-1-a6314b708850@nvidia.com>
In-Reply-To: <20260304-cmdq-locking-v3-1-a6314b708850@nvidia.com>
X-ClientProxiedBy: LO3P265CA0013.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO2P265MB2446:EE_
X-MS-Office365-Filtering-Correlation-Id: 4138f40c-1839-4d44-efed-08de79e0b15f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: maDZFbNR8N3/bLkt6VH7+Z0Ret0ermSNAoX4mJblSZ+uCWjfSQXvoyxnOmXdz9H2QgH9u5HWFCUMohvhwFX1MUytyIdzuHS4BV7gceCc0H6M9bQx1UpvMPFxRz5uzo562/Z/tniXULQqttWIJZpG7d27gPrVyykEkNLvoUZhdb0tCpP01fp6txltQus50vNBEBO1NcEc10aMKxuxms5s8In+UAs7H5sXEO22rKDryfCuqPLpxzTEAR/KBUiq588zt4S1jqDJLTLYuhkIiBV+xk/btyQ2sCpFAQdjtjOre2tfsiBRSzOpYYwRcdQ9VUKpSuTxoPz+tZg5rVJ3S57yb/TsWCkfckJs8fp5Ha4bwItjuxeV6u2CHXF/IkIDUqvgH6/LjLv0y7AywAm7NRIaUumocy9rCzPiwfwL4tfh6xNFhgm8Xiw8L77jY/OIwJnpDQRZNYjd+RyYjik17KzLjsfInEQjBmfbCGnXgOAl/jnqIE+sM3GYnW+ZJzxTeyjrTXM/Yz1K2QoDfEquqPOvlPUP17HCmhB5pZlK2lI1Nf4sw1XFF6Wec69xOJ12jIeUzi8nn7rTRhYVgavtpsBmrzPZSa2HN+usHjDMV2nWWl6f6QsIFAiRydxfP8MAtqDuWIG5DJTk6025ReKB5bMjQadZ+amCbrmr6T7Xds5SgKCPW4jPAsGqsLlE5y5PAFqiSbLNkoJbLAnvrsTjL1A5hTzkmprgJsteBxVnT3Jmn1g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MlFkdGhvR3lHN2V1R0dvRUk2ampHeHIwZHU3dkJadXc0NWRadVBYRmU2Qnh1?=
 =?utf-8?B?OGpuMnNNY0d2ak0yaU5nWmVJZ25RYndpd2U4NTZtYlBJSGNWNks2VWZNUU15?=
 =?utf-8?B?eWY4MjZIUk01S3ZraDQ3bzczOWxoY2NKOXV6REt5WThSdVNXVjFwengvdGZM?=
 =?utf-8?B?ekRnQVdGZllPVEd5b3BYQ1NyK085YTFBWnh3T0lYS0FwTUM4RkxIR1p5WjFD?=
 =?utf-8?B?RnlzN0lYeDgwL0l4azJXQmlHTzZ6N3A2L3pNa1F3Vk43SlNqd0NkRk1mUHdW?=
 =?utf-8?B?QVUwSStvWWllUld5b1B6RDZXa2JPTkZPZlFGSGYzUmQ0eEhQMDZIS0g2NWNP?=
 =?utf-8?B?L21OeEhwSGgvSDU5bGd0NUQxRUlCS3cyV0tjOEJ2TTdrNkhzK3BYaW1JSnZi?=
 =?utf-8?B?OVpveXNwVFNLeHFaU0FsbldWRno3RFQ3REZzRlpmNmNRUTFpMFptT28yN0Jx?=
 =?utf-8?B?NEJFR0paR2VQelh6VzdrWEhxRFFrVFJ5eGRMampwb3Bha2t1S00xYXZNZWYy?=
 =?utf-8?B?VmJMK1A5NDh4emcvQ3lZOTZ3UVBTOThKM0xGejNOSTRIeFV4MzlTNDZtK2dI?=
 =?utf-8?B?bmVlaWNQMllmTldwQkNCL0NVTndhLytGemdISW1TYXlhdnU2cTAwOHl2NEdD?=
 =?utf-8?B?THdQRkkraEQrRWhNYzNFVHh1Q2swTStVazdtejhXbWoyNlBJOWhGQVRqaEgz?=
 =?utf-8?B?SDR3TngrcnhPNWlkNDFhNFUyZFhETzhjek5STkRVdUVUTUw2ZkhsTkEwMWZS?=
 =?utf-8?B?aGNtNmY4bStBdUlYenJlUHlyc0RSREcvZ2dSUVBBNGxybFYvL2o3YzYrNFNZ?=
 =?utf-8?B?Ym03T0V4YU51RFVYUDY4eUw1eFgzMWt1Tm1mZDhuRHUzWUpNeHJub0hrc011?=
 =?utf-8?B?NWlIdFc3WU1BQmxTQ3ZpQXNqaEk5QU9kekFFcXJtdUdZOGg4aGlWelVicGl6?=
 =?utf-8?B?Q1I1Nlg5UWRPRkdrVmIzbFJvWGY4RWdzOWo1UUhRd0JBYi9MWFovd004UnVQ?=
 =?utf-8?B?bW1BOTFMRGkrYk1JU1ZTU2dLNU43SXpwZDJGQ003dHI1YjBGTEVLc05KbXhl?=
 =?utf-8?B?bDBLWHNENzVzdlRiR05IMXMyYXFaVG4ySEd1MEtDZ2NRNkc4Uko5eUhxQjJ6?=
 =?utf-8?B?TVkvbFhBTmFacDJtM3lnRmh4dkNKdENZdFpTSmUyckFuQVQzYWtHMGJRR05L?=
 =?utf-8?B?alNGYUlhSVVzazVPY0VIQ040cVlSNlRqNHNxNlcxNjh1My9LSDlrRkxpYWRW?=
 =?utf-8?B?cmFhblozd3p1V3o5RDVYK0Z6Ri84MWZZVGxUUDc1RXUzQ3luODErOXpzY1di?=
 =?utf-8?B?YWwyNHhJOHZyNDI2enA1b0tLcFR3MjJDZk5LdXRjUnBHRHo3N01BVVdKS2Z1?=
 =?utf-8?B?SE1QbXdESlBka2R6TUtwU3NBMmdtYW5jVXdQczF4WjBMd1hYM3dBZWFudXB4?=
 =?utf-8?B?MVB5OWN5NngyZDdSZHJhWnVBR3V2VXNGL0ZLNGJRd2I1N0l6cjhZZXI2cXJp?=
 =?utf-8?B?NDk0Q2xoa1pBdHBYWWY2U0JKMjJvRkhueG5zWWNxdEhoNVBFNTNaQWpWSjQr?=
 =?utf-8?B?N1BtU2RCczFWaHhKaFJSQkMzRmZmblBWT0Z0Q0tRK1lIU1dheXRScVhJMzcw?=
 =?utf-8?B?Q0paa0ZndG1kYkpRVForR1BDMFViLzBFV3dZaUFFNFZ1WC9LeGY5aWhqLzli?=
 =?utf-8?B?dTUzSUVlek40WkFrTFpRZlpNSHFNSmVtY2RiM3RtU2p3eEFSV2loWldJN1Bm?=
 =?utf-8?B?aVZadmduL3ZpNVFCQmprdzdqNDlUZFR1WHhLR0dDYXRUaGNIaWRPTUNpamxH?=
 =?utf-8?B?ODRYSzlrWGpOSUh5MEo1Z2wzaUM5NzJUbk12V0dDWFdiLythbnYwb2NpWEsw?=
 =?utf-8?B?WG5OZ1dpK3RiVGJ4WjUvRmxHb0JFWjRBU1BnWjh0dVY0bVFkTnR6YnBWMFV4?=
 =?utf-8?B?RDF3STJYcTF2VldxQk5WSUhKNGlhbjZUd0x1aHVvTVJsbVdrNG9KSi90b3E0?=
 =?utf-8?B?R2xRVzFiQk5CWVlYckJ5aDFpVlJmdzRPT2tDeWw0bjZWV2Y3cGFKaFRJbmlq?=
 =?utf-8?B?RWNRY2xadzJTZjR1WWs1bWpjYWM0ay9ZVHovS1ZpNkppTXZQWmF2Uk0yT2Z6?=
 =?utf-8?B?ZUFmYWQ4eFRtcCtXVXpkbEc0b2hvTUc1c0pEdW9jQ05Bc3dKeHpvS0dRaFFZ?=
 =?utf-8?B?ckFGQ1UzOGpFZmdwVWl6clBhZUR3Q3hyY0xqSjM0VXNTN1NtOHo5UWc4WWlW?=
 =?utf-8?B?UTNhOFZsV2gxaXk1bHhHUWU0K2J4aXZvcDRib0JrdkZtS3FNWmR5aFY4aUpi?=
 =?utf-8?B?RFBzN1J5Qk9YamtxSWZxSDlNZDA5OWp6QkhNY0hCNGhMWXFUUEpGZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 4138f40c-1839-4d44-efed-08de79e0b15f
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 11:25:08.9512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KU3ZkiCBaIFWwJ99+6WUttSYGRCdXcHfwYrwwtc2AnFWTd2DEm8M9AagRpj2lHNg5b6hH9g67oERFLmPRK3iHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO2P265MB2446
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
X-Rspamd-Queue-Id: 235871FEEEC
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
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,garyguo.net:dkim,garyguo.net:mid,nvidia.com:email]
X-Rspamd-Action: no action

On Wed Mar 4, 2026 at 2:46 AM GMT, Eliot Courtney wrote:
> Fix some inaccuracies / old doc comments.
>
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> Tested-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 492e9489e808..4829830b6921 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -531,6 +531,7 @@ fn notify_gsp(bar: &Bar0) {
>      ///
>      /// # Errors
>      ///
> +    /// - `EMSGSIZE` if the command exceeds the maximum queue element si=
ze.
>      /// - `ETIMEDOUT` if space does not become available within the time=
out.
>      /// - `EIO` if the variable payload requested by the command has not=
 been entirely

What's the benefit of enumerating all the error codes like this? Unless all=
 the
mentioned error code here is supposed to be handled, then it doesn't gain m=
uch
for them to be mentioned, no?

For the errors that do need special handling, we probably want to use enums=
 to
force their handling.

Best,
Gary


>      ///   written to by its [`CommandToGsp::init_variable_payload`] meth=
od.
> @@ -711,22 +712,20 @@ fn wait_for_msg(&self, timeout: Delta) -> Result<Gs=
pMessage<'_>> {
> =20
>      /// Receive a message from the GSP.
>      ///
> -    /// `init` is a closure tasked with processing the message. It recei=
ves a reference to the
> -    /// message in the message queue, and a [`SBufferIter`] pointing to =
its variable-length
> -    /// payload, if any.
> +    /// The expected message type is specified using the `M` generic par=
ameter. If the pending
> +    /// message has a different function code, `ERANGE` is returned and =
the message is consumed.
>      ///
> -    /// The expected message is specified using the `M` generic paramete=
r. If the pending message
> -    /// is different, `EAGAIN` is returned and the unexpected message is=
 dropped.
> -    ///
> -    /// This design is by no means final, but it is simple and will let =
us go through GSP
> -    /// initialization.
> +    /// The read pointer is always advanced past the message, regardless=
 of whether it matched.
>      ///
>      /// # Errors
>      ///
>      /// - `ETIMEDOUT` if `timeout` has elapsed before any message become=
s available.
>      /// - `EIO` if there was some inconsistency (e.g. message shorter th=
an advertised) on the
>      ///   message queue.
> -    /// - `EINVAL` if the function of the message was unrecognized.
> +    /// - `EINVAL` if the function code of the message was not recognize=
d.
> +    /// - `ERANGE` if the message had a recognized but non-matching func=
tion code.
> +    ///
> +    /// Error codes returned by [`MessageFromGsp::read`] are propagated =
as-is.
>      pub(crate) fn receive_msg<M: MessageFromGsp>(&mut self, timeout: Del=
ta) -> Result<M>
>      where
>          // This allows all error types, including `Infallible`, to be us=
ed for `M::InitError`.

