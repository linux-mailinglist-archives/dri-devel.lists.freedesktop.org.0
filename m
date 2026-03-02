Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGGLKKzKpWnEFgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:36:44 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 027EE1DDE43
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 18:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066CC10E56F;
	Mon,  2 Mar 2026 17:36:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="tLj4Fdvu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021116.outbound.protection.outlook.com [52.101.100.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C115510E56F;
 Mon,  2 Mar 2026 17:36:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ntwRxusqsU6x82aOsOBpgPWtcwC4qkHr2YjZCEhdIZ75u1NScwKghHSZBbba9DGlxU2RYOOeLvPyHztWRt67ESjar/DVZH21iFIoYoIf9SM0umoEC9qvF4+ehp6wUwfeckatfZ/jTBVL/RBfj45w6yN1f4WL962GVd1fxgsdPAINu0KFY5RRHZz+oE6DLbODEtoZO265ZSQOB4m5eP1x6kUOpZs1H1sDMqgjR8UZ0b5QQzn9dQodFtg/W4h1o6JrDVU9IE8FXeUVDJ+ym1uWf723B4ZFRpI7Snm3ZbuWCB+YfM+w4fOZdREaXIkwUY4JFYKy/lQa2QTC+ZbAX511IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpD4u/DmY9wO0Kd/licBeEvQWva0TvAlAIR5vcIfSuk=;
 b=iqUCJEVFopldE3HkqsAfhQvagKdMIlXB8nubpTIaNv1g3eJYM+JLCzTarcZIkxBtBb3xEHJW3Sq/AplbWCv+AnLA9+SCQLDPWEYJhLHtrBJuYnsZkX5+6v5cW83MkKI458hmEgJCM6GKxdsYO7D8A2FZZ4e88Vuf1CH9SZEUbh77Q/y1cQoTdZbQE0dhr5rQ1ko6OFph6XzkdpvgbUMlBFXubw8eL659ee/EC4DFCa7KtnJBjgcqQ/6XeHOqVVQu6BviadwauAFrMg7ousjxFQSp04foZj/Y7GonU02cNg29IsKu7UK21wOLa5vRfiBtVk9mFzUXRkZ+YtFscOLffw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpD4u/DmY9wO0Kd/licBeEvQWva0TvAlAIR5vcIfSuk=;
 b=tLj4FdvuJXcuEx9VZHJLSFlVuEZ1FkocnQdmX2gbtn9KeoJjFmmf+mHbPG8V6RwYuJElt2LMvsErKHEb5Uc+kq0kHtNIsg1MsuqZMgG3yJg1eKZFmttS5zmsDJLdnrOQnvDQ4eNPUQ6NBbCAnqliDpNT+ulg64+VurYyRZoj4Kg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB3635.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.21; Mon, 2 Mar
 2026 17:36:36 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 17:36:36 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 17:36:36 +0000
Message-Id: <DGSH8LCY1JT6.2YRPF2ZO49OCA@garyguo.net>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, "Zhi
 Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v2 4/4] gpu: nova-core: gsp: add mutex locking to Cmdq
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Benno Lossin" <lossin@kernel.org>, "Gary Guo"
 <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260226-cmdq-locking-v2-0-c7e16a6d5885@nvidia.com>
 <20260226-cmdq-locking-v2-4-c7e16a6d5885@nvidia.com>
In-Reply-To: <20260226-cmdq-locking-v2-4-c7e16a6d5885@nvidia.com>
X-ClientProxiedBy: LO4P123CA0050.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB3635:EE_
X-MS-Office365-Filtering-Correlation-Id: c41056ff-c6d4-4e81-ea20-08de78824107
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: l8HTVzeO2jTiySMTitgGjS5rktkzarA0peNFB0YJroi2wvBW9hVbOXlWVxU7Wf851/J/mKumluiB6Pk+Q1hYcKfOXqi69S+3Kjffx29MTMXzoGfxkrFa0rabziVk6M2rpSF5Qa/N3qhIBmaMYHrUp4f1qgMAhkY6eUysvZeAF+dqSXQ6tkSW7YggIjO/m98rejmoDHgYEQYK0oQrMain6BCohKOzQAFpk25Amf+jsbbQEKJFbIk41JbtCpycTDAK4gDFyXjNG+NY9TYEpm41MfQcLn+ZFAOzcHstsZJxWGqVy6+lijXLrUIgW2CTeMQ9VtY75vuFt7J2BLakKIH2O036Txvr6OzWBaGUI+dKhdB/sF3Qs+PcUulxDJ8zV0iyURh8wT1wnuYiWE7FnAUrdHSTrXQ1gSb6V2qyy9QIwvlK53N15fwG7oGUxEgnZmUwcnhQvmnb0H8MA2ZlnhbdyC0BpiZR4M/QDjo1HH2lQj0h3RZyVTt27TZCgMbOmTWnhj6nBs03nTMDCG0psD+O0ifxL0+eK6e3bPZj1gxqHWAhAUZmsTfoPk7DZHey14ilB+fA3MRwxF0ZEkZ/H87TAlXPEZgFJgHnFarMK55eRsLkq9Yqucfz6jjnfsLyRr4qdW8qFHJrp3XEIfm5G8T8mD6fNPEwm7aWyzTTuouJzOyWwPBHOhzYad9v9sGCmFOzKVmAiql0KbpeM7t1Zzd+BBUqFgvJt/r0qVunuxf/ZT0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmNLNERia3FSOGRFMlpJOWg4Q1lmbDFIR0FNU2xORlRsVnZnbmhZTmlNVmlW?=
 =?utf-8?B?SzN1OVMrRkc5T09YTmxucG1ocDhoUG9yWFJHbmEzdS9OQk81V3BIOGIwMlpS?=
 =?utf-8?B?OVM1a2V0VlZubUh6L3FlVktML1JwRlBaa3RmSXNxMnliL2tya3E3b0VHQURT?=
 =?utf-8?B?ZFJVUysrV2ZDQ3VZZFFDK2FZRUc5UlBYVnJ1MDFSeDBDZnI1Vnk2M05ubkdN?=
 =?utf-8?B?cTR0QUpWc1RGa0Q2T3NWRlBBbGJGK2MwYVl1M0w3bGlCWldaT2EyNURXQWhY?=
 =?utf-8?B?cUpUcCtwVkpiMlAzSVNJS2E2NnF1b1VHVzBPeEVISEtQdXl3c3FRSldCamNU?=
 =?utf-8?B?d0tXb1I3ZjVVNUNzSDRUc0xZRm90NytkelpiWGdKN3BkSGRBQ3lBeEtOMXhh?=
 =?utf-8?B?dDRENjV6dUJqV0Q5Tk1TZXVDODU3UktvYTZFaFg1QUpWbjJGc0gwVEJBaGdH?=
 =?utf-8?B?aUk3U3AzMitxQURuRDJUQlh0dGxFQ1NVdVpKSWE3VXdINTJ6aGNKVTZuYTM1?=
 =?utf-8?B?L1V3TUJINXE3RUloSzA5dlk5ams2WUJ1YXFPYjdMclJab1NVMk55Q0t6alM1?=
 =?utf-8?B?aEc2by92T2ozRUUzSVlsQmw1d3cvN0RlYTVQbm4rWURIYWdvUG5MUlFWbUVW?=
 =?utf-8?B?Vm9oMGxqRXk4SXMzVDc2NkJZejQ5S3ZkRk1VUEx5MUZuY2NFRkVFcVVwMkUy?=
 =?utf-8?B?WERZYjNuSExROGRwMGdIN1diNmw4TWJicEpna1NtaXg0Skxzdko2cUNyM0x6?=
 =?utf-8?B?U3o3Nlhkblk0WGFjaExjM3ZaZkdQMHNTMXdrejNoRnN0QVB3UmNrd3d1dnRu?=
 =?utf-8?B?b3FTMVdpOTRuT2F2a3pTb2Z4eG05MWFoYzFMRnRpVzNWKzdhYUl6M3JhV3JV?=
 =?utf-8?B?WDhRMTU0dWRBeUtBcmF5NmVDL2tMcjBaN0xnNllSOG55UU8xSlVsbHdPcWpU?=
 =?utf-8?B?TlpzU1luTExZbncwSytDN21adTA2RFNSQTl1TEprRjVpVy9SWWJaSGxlMTlX?=
 =?utf-8?B?NFdtbmdiVzhRRFRya1hPTnZ3Zk5PRGFueVNmaW1NVnNialRDRnprdnBCUHBi?=
 =?utf-8?B?aUd2YWh5R2ZkdHU0dlk4UXFMZFRBY283bVA1RythaHlwb3JkeDJnN0Z5bnBp?=
 =?utf-8?B?Wk1yMjd4dE9aUkp3SnVkQVpHUE9BTElKdlJwdElsNHhzaE1OU0Z6b0NlSUto?=
 =?utf-8?B?d0lKaWVrZGxueVA2SXdaUlZMa1dTM1ZNUHNDV2UvK0h0N0RsS2JCV2txRGxG?=
 =?utf-8?B?bzlOdDdjZjZ1Y2xxWGdhOGswVkxKeTQzZGdPVFBPT2RyOTFCdDhVMmJaUjFh?=
 =?utf-8?B?cnQySjdNcE9tSE52YWdZVkk5MTg3SmVtcFZXZ0FlUUFkaklmaHBJV2lZcVll?=
 =?utf-8?B?eit4elBRRERhZmhBWGtVdlB1c0FRaDlQdmVyV0t4MVlVOXZDUEwvMGl4UGJO?=
 =?utf-8?B?bWJXdEJaSjRLdzA4cjZxT2VMZUp4UUViYjQ4VjBwanRxcXhDMmVSRUtUSGw2?=
 =?utf-8?B?RW9YMk8xM28rb084MXF0Qnp2dkNNZFFiajZJQkI4bHRPWUNIaVZ2VnY1TzJ3?=
 =?utf-8?B?ZGJucVdaNjRDaFFPNDY1Y05taE9pWHM0OXRaN3ZyQ3lyUGFjMnJSYVNqQVk4?=
 =?utf-8?B?OW1GV0dYR0IycnVlaEJ5WUp2VG5XbnM5enlpK0JUOVQzZGJIZ3pTckVKYy85?=
 =?utf-8?B?RkFTZ1VQRExPc3k2dGRlMFpKTHdxWnA0a2MrZ1orQTZydnR2RE15eVBkR1hr?=
 =?utf-8?B?NitRbVZWTzgxWHlMOWZNdnVPV0U0VFk2cnhSKzY1ckllYW5NU1hFTmdla2Zs?=
 =?utf-8?B?NzNBcUhDM2hIc2VuNGhSUC9GUXgwVkNlNVdhV3lHalg2U1pHeWhLL0hLcld0?=
 =?utf-8?B?WmViV3BxMzJyTkk1SVhyN1pNVUIwdURmaFV4SzVVeE8wWGhaYm5tbCtSdWN5?=
 =?utf-8?B?VkljSTYvaWF2b01YZHVTZUpJNmd4Skp0K3JxV2piZ3J5Y21nbG5BR1B0NHV3?=
 =?utf-8?B?QUZZbThYMHN3UXhMSGs2bWxBSkc5cHJEWGY4N2lXWlAxMk5uOEpRK2xVQVFM?=
 =?utf-8?B?M1RXQjI2V09CbXowLzRyWkxWZ2hrdGZxSjdIa3l2TjBNL2oxRElUODB3RDUr?=
 =?utf-8?B?RWF4eEhPNmFNSWhCOG1Hekh0anhzc0w1RlR2Q3QxekhGa3N4b2VpOGdyZGVr?=
 =?utf-8?B?aE1QQ2poNzBYdnVoc3I5aGF0b0tqNUhQdDh3MkgwM0RyMVZWQjZBVy8vUTFG?=
 =?utf-8?B?U2lpQzNQczdKNWtMUzk1OVdTU3kwQTltZVNkUkp6bDVMM3h4SllBOXlYQmRG?=
 =?utf-8?B?SEM2UWlISUdZTlpOaHNidkY2OVl3RHBtUldHTktKclA2eitUVUdpdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: c41056ff-c6d4-4e81-ea20-08de78824107
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 17:36:36.7522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONMjTSRbTNiPmHdDvpisR3hiAeoook0D8oJS/xQt084eVbROs3bAdbYvLQRcB7xD1gRS9+MKHlCL6oMVzDBfRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB3635
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
X-Rspamd-Queue-Id: 027EE1DDE43
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
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,garyguo.net:dkim,garyguo.net:mid,nvidia.com:email]
X-Rspamd-Action: no action

On Thu Feb 26, 2026 at 2:50 PM GMT, Eliot Courtney wrote:
> Wrap `Cmdq`'s mutable state in a new struct `CmdqInner` and wrap that in
> a Mutex. This lets `Cmdq` methods take &self instead of &mut self, which
> lets required commands be sent e.g. while unloading the driver.
>
> The mutex is held over both send and receive in `send_sync_command` to
> make sure that it doesn't get the reply of some other command that could
> have been sent just beforehand.
>
> Reviewed-by: Zhi Wang <zhiw@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs      |   8 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs      | 266 ++++++++++++++++++---------=
------
>  drivers/gpu/nova-core/gsp/commands.rs  |   4 +-
>  drivers/gpu/nova-core/gsp/sequencer.rs |   2 +-
>  4 files changed, 153 insertions(+), 127 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 55899eba75db..d12ad1bd2cd8 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -128,7 +128,7 @@ fn run_fwsec_frts(
>      ///
>      /// Upon return, the GSP is up and running, and its runtime object g=
iven as return value.
>      pub(crate) fn boot(
> -        mut self: Pin<&mut Self>,
> +        self: Pin<&mut Self>,
>          pdev: &pci::Device<device::Bound>,
>          bar: &Bar0,
>          chipset: Chipset,
> @@ -214,13 +214,13 @@ pub(crate) fn boot(
>              dev: pdev.as_ref().into(),
>              bar,
>          };
> -        GspSequencer::run(&mut self.cmdq, seq_params)?;
> +        GspSequencer::run(&self.cmdq, seq_params)?;
> =20
>          // Wait until GSP is fully initialized.
> -        commands::wait_gsp_init_done(&mut self.cmdq)?;
> +        commands::wait_gsp_init_done(&self.cmdq)?;
> =20
>          // Obtain and display basic GPU information.
> -        let info =3D commands::get_gsp_info(&mut self.cmdq, bar)?;
> +        let info =3D commands::get_gsp_info(&self.cmdq, bar)?;
>          match info.gpu_name() {
>              Ok(name) =3D> dev_info!(pdev, "GPU name: {}\n", name),
>              Err(e) =3D> dev_warn!(pdev, "GPU name unavailable: {:?}\n", =
e),
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 6bb1decd2af5..5010587c96f9 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -16,8 +16,12 @@
>      },
>      dma_write,
>      io::poll::read_poll_timeout,
> +    new_mutex,
>      prelude::*,
> -    sync::aref::ARef,
> +    sync::{
> +        aref::ARef,
> +        Mutex, //
> +    },
>      time::Delta,
>      transmute::{
>          AsBytes,
> @@ -54,8 +58,8 @@
> =20
>  /// Trait implemented by types representing a command to send to the GSP=
.
>  ///
> -/// The main purpose of this trait is to provide [`Cmdq::send_command`] =
with the information it
> -/// needs to send a given command.
> +/// The main purpose of this trait is to provide [`Cmdq`] with the infor=
mation it needs to send
> +/// a given command.
>  ///
>  /// [`CommandToGsp::init`] in particular is responsible for initializing=
 the command directly
>  /// into the space reserved for it in the command queue buffer.
> @@ -470,66 +474,15 @@ pub(crate) fn command_size<M>(command: &M) -> usize
>      size_of::<M::Command>() + command.variable_payload_len()
>  }
> =20
> -/// GSP command queue.
> -///
> -/// Provides the ability to send commands and receive messages from the =
GSP using a shared memory
> -/// area.
> -#[pin_data]
> -pub(crate) struct Cmdq {
> -    /// Device this command queue belongs to.
> -    dev: ARef<device::Device>,
> +/// Inner mutex protected state of [`Cmdq`].
> +struct CmdqInner {
>      /// Current command sequence number.
>      seq: u32,
>      /// Memory area shared with the GSP for communicating commands and m=
essages.
>      gsp_mem: DmaGspMem,
>  }
> =20
> -impl Cmdq {
> -    /// Offset of the data after the PTEs.
> -    const POST_PTE_OFFSET: usize =3D core::mem::offset_of!(GspMem, cpuq)=
;
> -
> -    /// Offset of command queue ring buffer.
> -    pub(crate) const CMDQ_OFFSET: usize =3D core::mem::offset_of!(GspMem=
, cpuq)
> -        + core::mem::offset_of!(Msgq, msgq)
> -        - Self::POST_PTE_OFFSET;
> -
> -    /// Offset of message queue ring buffer.
> -    pub(crate) const STATQ_OFFSET: usize =3D core::mem::offset_of!(GspMe=
m, gspq)
> -        + core::mem::offset_of!(Msgq, msgq)
> -        - Self::POST_PTE_OFFSET;
> -
> -    /// Number of page table entries for the GSP shared region.
> -    pub(crate) const NUM_PTES: usize =3D size_of::<GspMem>() >> GSP_PAGE=
_SHIFT;
> -
> -    /// Creates a new command queue for `dev`.
> -    pub(crate) fn new(dev: &device::Device<device::Bound>) -> impl PinIn=
it<Self, Error> + '_ {
> -        try_pin_init!(Self {
> -            gsp_mem: DmaGspMem::new(dev)?,
> -            dev: dev.into(),
> -            seq: 0,
> -        })
> -    }
> -
> -    /// Computes the checksum for the message pointed to by `it`.
> -    ///
> -    /// A message is made of several parts, so `it` is an iterator over =
byte slices representing
> -    /// these parts.
> -    fn calculate_checksum<T: Iterator<Item =3D u8>>(it: T) -> u32 {
> -        let sum64 =3D it
> -            .enumerate()
> -            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
> -            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_lef=
t(rol));
> -
> -        ((sum64 >> 32) as u32) ^ (sum64 as u32)
> -    }
> -
> -    /// Notifies the GSP that we have updated the command queue pointers=
.
> -    fn notify_gsp(bar: &Bar0) {
> -        regs::NV_PGSP_QUEUE_HEAD::default()
> -            .set_address(0)
> -            .write(bar);
> -    }
> -
> +impl CmdqInner {
>      /// Sends `command` to the GSP, without splitting it.
>      ///
>      /// # Errors
> @@ -540,7 +493,7 @@ fn notify_gsp(bar: &Bar0) {
>      ///   written to by its [`CommandToGsp::init_variable_payload`] meth=
od.
>      ///
>      /// Error codes returned by the command initializers are propagated =
as-is.
> -    fn send_single_command<M>(&mut self, bar: &Bar0, command: M) -> Resu=
lt
> +    fn send_single_command<M>(&mut self, dev: &device::Device, bar: &Bar=
0, command: M) -> Result

Any reason that the `dev` is passed in everything instead of just have it b=
e
part of `CmdqInner`?

It appears that the `Cmdq` methods don't actually use it apart from passing=
 it
to `CmdqInner`.

Best,
Gary

>      where
>          M: CommandToGsp,
>          // This allows all error types, including `Infallible`, to be us=
ed for `M::InitError`.
> @@ -583,7 +536,7 @@ fn send_single_command<M>(&mut self, bar: &Bar0, comm=
and: M) -> Result
>              ])));
> =20
>          dev_dbg!(
> -            &self.dev,
> +            dev,
>              "GSP RPC: send: seq# {}, function=3D{:?}, length=3D0x{:x}\n"=
,
>              self.seq,
>              M::FUNCTION,

