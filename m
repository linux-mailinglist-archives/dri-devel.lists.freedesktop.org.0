Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGhxDXUWp2m+dgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:12:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04331F474D
	for <lists+dri-devel@lfdr.de>; Tue, 03 Mar 2026 18:12:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A65610E890;
	Tue,  3 Mar 2026 17:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="Ssh1weHd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021120.outbound.protection.outlook.com [52.101.95.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C67BC10E890;
 Tue,  3 Mar 2026 17:12:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeQalYl+DU5pFhSmM1X0c9i4BAfTN0lZ60gFUl7FCigOMitRhwwQAYHUdBz5B8mHiouczw35Xn2+yrkn1akgQ+mzm3PYfm7yo1D2Yc8JU9b1BULt07tthzk+v1TVEjTCFVJmcWTfbyzS/vhXQbLFzqUUUo0f6QTlqcTweJpT/e9jv8RIX5S0OfYxPaMpQ1FTxPHp7fHTGhWpkTnW9cUuzU9a6i7uxfLDWOpQvcuAvLj6PwG6KNLBsL16kbjshGY2DdCffTXv0+hS25QRIFJ/drNl0BajLjXYlz2Mt4hP67McQTdUN/qCQcauoh+M8wUWRULxJvDI/tPR0NBFvCMhUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nX1G3CzB+Ex4TjwHplCQvruO6PgGcr1nz6FAbx91X0U=;
 b=yI5p5uLfY8OQAl7CeuWYCco4rS4P5xMzRf5sGSyfWbiJh6RqcPQxlQIczSzX67HOFvozuILH9vpeOOSoWEL0zZoItF9CXx2wq9PylG4ZxMcit4WLES0COpydCDNlVHma4/tpr8fwWql0PviXutVVv+BqYuHGWWHH9ZDakEzBHqySEgOTRivPZ7sf34Tcps+xaWuz+TAm8ufBuMrT9S1ERupXvuwPmPwWJVKqWoJFvhXXKJxwx7O0jP4LDUYUP4NjdjhGbUrvxutkIrNrFGsuYb7cAW+bc2mYa5cdcc50FUspyQ6x3ljQF7Nw+PLwMSL8EBxAJQ1XV3zfywRG5bxYVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nX1G3CzB+Ex4TjwHplCQvruO6PgGcr1nz6FAbx91X0U=;
 b=Ssh1weHdpQjuExuHtb7fqK0htVhIkML3Q9/vlPYTDK60eh56YbSq9gecV6ecFwU6/WxYJHfUooE3jY+SQHBT6LAixJI80Iznce3Zt9vupIM8nA6BY0drbQpMzEQmBZWxwEPaxIB9z/j7fvxqh8JHfzuRJsby7r9Az+Z1esGe+w4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB6315.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:190::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 17:12:05 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 17:12:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 17:12:04 +0000
Message-Id: <DGTBCCWB81FE.1ECVE2VLBGK7N@garyguo.net>
Subject: Re: [PATCH 1/8] rust: dma: use "kernel vertical" style for imports
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>
Cc: <driver-core@lists.linux.dev>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260303162314.94363-1-dakr@kernel.org>
 <20260303162314.94363-2-dakr@kernel.org>
In-Reply-To: <20260303162314.94363-2-dakr@kernel.org>
X-ClientProxiedBy: LO2P265CA0094.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::34) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB6315:EE_
X-MS-Office365-Filtering-Correlation-Id: bfb6e826-9e85-406c-6c78-08de7947fe5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|7416014|376014|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: L+/pq19WRhRRofztAnghoE4LC8VTYSK3/7DdKYuemrIyWk697rowgFsnWR8osHIhIyPib5Gs429Pf5vWcPEcC6lhYAq06aLuleD2UAGxCIm2K1XeUQP1lRUhKmRqmdYLJgG2/gnjTk1KV7zjUNKRMCEzpRnmMDqtVC1q+79IKoGmVZk6Zdp+MLB2I0kpgY+IFAnituExZY1zEKl8Aayyf2l+WR1/5a/S0gnYWAHxIjAvn0eBRutxOK2IR74U6072+t/ljoLFyEnZdiFifXjNZwDiloJe4ls3pIGfb63EWFiJz31G7LmM82WAzEZIJfPBeeoFMKvpkFwLr73KsLRnLL8YC2ZMB3ICQYBDKLBzJSc0CsqD0DWO5eCv9Qjr1nhN2oCts1dOxNWFlJYRqsrnGqVkeMC4w0VlJuh7h9Pr0wYi7njh2kxirsyQ9XsWRUnD7xHURpDbEr49iiI9vYlzlWvaAFedr3Ovph3XHTQ4BWoP5jKQJ+lRHGAPac4iKXGrkekQ4mcQQGkBeRFfxm55eYiyOLUj13LphjPFis1sE4Ma3S1PHqHErcU7hrup42hTxH8V7i9YtODCtcDZ7U19HLu8G3j9z0Hwz9EZzMNVMWcFezN9yT0TGkS0+H+alBsDxutdQI33AGHFe81ikRGkuAkcMJ/N1yJumzp4IQWS1R/ymBDAJfB74Lw0h7/Y8h0DQf5u8r11TVfo9pqHKNSdJWVk614JJ+oyZbBqOFK0t0UvIrs7VrOVhkBlaq0dc/I9dGc5XiBjdk8/lnWc8HRjGg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnZqZDVCUHhjUlBva2tGYTdBVU5pd281d2w0am8yZitjZ1hyWnFybkdmcG40?=
 =?utf-8?B?T01zUE9kNk5ybnNRL0NDL29Ec3M0SUp2dktmWXNFWEM0M3M5bEVhclZxVmto?=
 =?utf-8?B?eGhnalpxeXRpdlc2M0VzeVhnVzcwVVc2ZytGUGgzWExrT1VnUGk4ZXMrODVD?=
 =?utf-8?B?MUZtdmJHVXFYUUQvb1hDQUFYOUJuTXE2a2tRK1hKQ1c0TEZwdVNYK3BHTCtj?=
 =?utf-8?B?V2I1Y20zMGVUMW5EN3Z6bGdqVEMyQXZoQ2xVUENRWkVCWUZrK0RhS1pvQmp6?=
 =?utf-8?B?MnZUR29HQU96UmV1ZVFVYitKSDJLQ3J4ZVVTV1NETGlaLzdoZGJkVlpUSkRX?=
 =?utf-8?B?RTF2M3NJYkx3Vm5icHZkZW0wcDhKdjh1bnIvTlRYYnpFRUp1NFNnbThrcGhF?=
 =?utf-8?B?bVJrNXVSbVJkSDkzeW15am9Md25udXV1QklscWErcmRDR0E0djBnL3pBaSth?=
 =?utf-8?B?WDNnazhuZWVBUXpJYlFXWDZkbUxSSEJ2cFdyWHk4bEZRbng4N0pEOStlL05V?=
 =?utf-8?B?bXk4cHlKdVZTbDBZa04zL0JrNXNuK093L3crZXpsTE92VHYzU0ZWd1pCbXZZ?=
 =?utf-8?B?Vi9Wbk84bmsxcW1DVVp1UHBYYjFPU041VmQ2VTFPZ1duZXdzam0rTTRrb0NF?=
 =?utf-8?B?SzdNdXFtbHpyMmNuZWZpZnovUUFkcnBaZW94QkFBSUtLWVVHUnJvK1FFb1Jv?=
 =?utf-8?B?SnJ0Y3pwNjRIWGFidm9xUVZuTDVlSmtsR3VaSHM5TkpQbGM5aEVyNERBelVz?=
 =?utf-8?B?UTJCUUNuY1pFQ1l6UFJtaUxXNG03bk5sT1drQUNwRjZieXNyb1pkTGszSnQ4?=
 =?utf-8?B?V0htNkRWdU8vcTU3RGp1MW1xTEtvVXZiYVhTT2ZmYnBTbkFIRFRrS2JQSzJO?=
 =?utf-8?B?Z2cxbmQ3M3JMMHdiRy9lYjNEN05UOXhmK2ptT3ZZUjBpZldTN0VtMEoxckZX?=
 =?utf-8?B?d3pEUGttdTJOcmdiOFVPL0JMUFJRbCtLdkhNZ2hPcVdySHJzMVVTRjFxdEVr?=
 =?utf-8?B?bG16T0hHUm8ya3NWUjloc1pQZ1Yyb2NOYnJYYytUQldaQXlUOWlzWGgxdVN1?=
 =?utf-8?B?NDBHdHVETkt1Vjh4QTJ1NHc3TnpBOTdaYjVmeFJrMEVlNVRvbmJwZDltR2lr?=
 =?utf-8?B?dkFEZHk2SjdZZ3JaVHJINmNVTGZDUHdHRTJOeWtCUlhWSmlhZE9NQVYrcGVH?=
 =?utf-8?B?R2lCaDN5Q0lERThIakJtdVlXSFNWSzZma0FhV1NOWjlqejQvdDhmRWtrUGtQ?=
 =?utf-8?B?d1BxT1lTblozd0p1L081MGt0ZUlpRTRYekJmeS9iU0VkcmNoV3pFdHlFQW5q?=
 =?utf-8?B?blJ1bm9OV2RESkZMRlRjWjVwd044M3dWUWR2bFNmWFlCcnFmbzRnTEh2cXo0?=
 =?utf-8?B?N1B1a1c1Q3FQYzhLYlQ0YlZuRnI2cFRkdHBKYWVwYnhVSVI1RE84QXJXRlVE?=
 =?utf-8?B?RHpWNGFHZGZ0KzlyMVlzVkNYeXZ1OVp4SUZGK21wNGZJeEdiRkdMVUhabUgw?=
 =?utf-8?B?TnVoZ1MySGYzOXc2UCtYb3N6YzRTTzVaak5wRThpV25rRk9wWFNHL1F3MVQx?=
 =?utf-8?B?OU1waW9ubWdmcjhPMTZhaEx5Z3ZPY0V3b3RCQUgyUnlFSmZNUy8zdnhaaDAr?=
 =?utf-8?B?dFV2YncxRUdDbEE0ZkZ0YVhVRFdHNzlmdzlzWDl0L2dHRXY5UWRHWk5DWWlY?=
 =?utf-8?B?a05OVjlCakRRU3FjaVFpcmVETFBxc2U5UGYrdTFkeHc3Wm9SN0NRQzlUZHhl?=
 =?utf-8?B?R1NtenpGZ2Y2MFBoQnBLMUppYUdJempCU2RuQXk4TjN0WjBzSVRYQ08rbFV3?=
 =?utf-8?B?TzkrQ2E3c3lsaFgzd1J2bWJzZXFpcHRLWHQ4UGFGSGpXSStpUHI1WGUxVE9j?=
 =?utf-8?B?bGM3Tlk0U1dCLzFPZ2NoQmRRcjBDcWZ3NnlDWU85eUFyeEN1Mm9wSjQyUytZ?=
 =?utf-8?B?ZDJxZG5VQkgycmxBWFgvNUJiditMZjlhdDN1Q0t3S3luV1hObllvVXg1a1VH?=
 =?utf-8?B?VWw1K1NVRlZkaEhwS2lnNXUzTFFveUJGdTQzOUp3R1JOSTAycFQvckYya0Fu?=
 =?utf-8?B?Sm41c3hYZkxsWUNmUlBydFM1VFhkSEs5Um11VEYyd3BHSGtYcjU0Tjk2Mi9L?=
 =?utf-8?B?c0p6ZGFmN1FwL1M1K2paMUY1TklYNXRXNlpWTmd0RmVveDdyQWdPbEwrOEFH?=
 =?utf-8?B?L2o3RlgrOGJBTkNZZmNvNExEQUU0ckEySm02dEZEK0s1T1ZVYVVKWjhMOG5r?=
 =?utf-8?B?M3RVejVHa1lkbnlseVQvWHRwTFV1anN4R0M3cjhsRG1nZ0M1TlJrYVMwbThQ?=
 =?utf-8?B?SHYzYUZVOUVlcmxjWnhPSzVJS0UzVnk3RGtNbGxBLzJia3E2Y3RWZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: bfb6e826-9e85-406c-6c78-08de7947fe5c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 17:12:05.1276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AYt3lv8d1CutGE7ioxRjBC7IeZKQ/lXy+bhj3i2j7PdhyfS7ulEQQgYaVkngV4qiUXf0jpTdXebRGIa/Cu/+og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB6315
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
X-Rspamd-Queue-Id: A04331F474D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,garyguo.net:dkim,garyguo.net:email,garyguo.net:mid]
X-Rspamd-Action: no action

On Tue Mar 3, 2026 at 4:22 PM GMT, Danilo Krummrich wrote:
> Convert all imports to use "kernel vertical" style.
>=20
> With this, subsequent patches neither introduce unrelated changes nor
> leave an inconsistent import pattern.
>=20
> While at it, drop unnecessary imports covered by prelude::*.
>=20
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  rust/kernel/dma.rs | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)

