Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NwKKiyzgGl3AgMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:22:36 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDE9CD46A
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 15:22:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A69F010E2B3;
	Mon,  2 Feb 2026 14:22:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="sd5e9QGY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CWXP265CU009.outbound.protection.outlook.com
 (mail-ukwestazon11021136.outbound.protection.outlook.com [52.101.100.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BC910E2B3;
 Mon,  2 Feb 2026 14:22:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ia1GSsGBcbolXHnURyikopQFS5Z4XeJSctQ1Z25yCHmnKR0zux8VPBDju0AHiDMXHXX42tMwamHqQXp34rH9DDSr+yVGPAdo+okar46irTtzoM+L5RyTPK/vJr/xOZBn4LAoG7e2ZUumG+WTZANpt4lMmi/jfOo1xIQkIUgVRAhBOA0+duN6c5KWX7DEBxrQ2HAY+2EUUaLGRJUZVQNtEggqMIHrcrGu4/fm6k+vVngIDdbD523thf1fW8j/a7sCgS7GbJlEDCEPxcbt7BpGXBcAW0lIafV59ALeAHMz1ArutEPnsjR1Li+PGTrMScyHdn0zfMqfM3kMFuKkYWVPQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LzEVbulHNCV0l9Koz8I3Fns9Ac+dNgg9IFy2GfYmH4g=;
 b=PfEnEuerXAcTBNzld6ZDhYIzBwZyBUSM+XjMMEwmAM/lbMQJUg6dnoqu4xZSHyAE1p+3ziClhzFPEyJv3JdrqWiX4uoj4WJPx5evTt1kfPdCMIREPX3g5ktuv/ViXWyoLX1gbYHI9Q0Iqp2imX/CZ/j8UQsUYQffWP7H249TAn4vywRreWE1lsM8hgbqUepa3YOJnbrbawmW1ymqgtZUnKcM8zXfj59haz8q3uIiCLcz5oNtDh0J43pG+2BN9qfeCyO+80ARcZFkUvZr4RW7Ao9MPa2+Ivhy91UviAQcQPsvZliJDjVtUFrLrwY8ZXCKRk6XHc9UDNHGj0RYpjQctA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LzEVbulHNCV0l9Koz8I3Fns9Ac+dNgg9IFy2GfYmH4g=;
 b=sd5e9QGYNYKw5cKPPfwG2mLYYrtok2VODHl9FCMpT4kHIGRE0TDdzVR7hvK8mq0dfnopklIyxLUGQoq/SvRNqJj57zb6EldHxkr4l7Yu3ZVjc0SXvLUUAUjtHzozFyh6Y3MmHGYU7YJ00umHXEejcZWdbnskZOl8a6ahp/agwHg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB7368.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:201::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 14:22:25 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 14:22:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Feb 2026 14:22:24 +0000
Message-Id: <DG4JKNN0NWNP.51QYIKZ74VVK@garyguo.net>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 0/9] rust: dma: add CoherentArray for compile-time sized
 allocations
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Robin Murphy"
 <robin.murphy@arm.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
X-ClientProxiedBy: LO4P123CA0676.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 02809bfe-9dc7-4cb4-bfdd-08de62667cb5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGZxdXZnczQrTUEycmVpMzFDbUg5Z3c5ZTcycFpYUnhjbk5UZ3hOaU9GQmQ4?=
 =?utf-8?B?TFUvQnJQclZ3ZDRzcWF1UzNPUkpVSEhyOU1WRy9obHI3cHpLcHFrZEZZUEdZ?=
 =?utf-8?B?ZDNpWWRBS2txL1JndzJhQUxra3Vsd1dhSWxlbGVndFA4djkvMmhTNGVWTHJa?=
 =?utf-8?B?NlVSQWxUSGdpOGRFU0Q5ZjBvYTlwdm92TG1MM0hPNjAvd1J4cHMrb1g0V3Rx?=
 =?utf-8?B?UkZ3WDNIWnY5bWFwRXhuTE5rRlhhMDIwYmVTN0dmSXFvQ1dFUXNHQWZ0aWFJ?=
 =?utf-8?B?UERTU2ZaeXdlOWIzM2VkaGZsakpqOHRGb1BNQktHelE0TTFzSklYZ0xsY2sr?=
 =?utf-8?B?bk51eE82c0ZCMVNWVDdXclppWVl0VUFWMUtJak9GQTdIeVowQll4M0Jma3Nx?=
 =?utf-8?B?TlZoZTJLNEE1b1NGbWxJQVdjT3ZNZzZZR3BwRkFBcGxlb0NOb0RnY0U3b2xY?=
 =?utf-8?B?SWZZaklJbDN3RTJzdEp1SmoyNEtPUG4xbFluY2hMQktsZnRITE0yNG5KRm80?=
 =?utf-8?B?NUNUTXhreUgwd2VIMksyOHlTSlZOcFp3bGNRK2NkQUYvNDNaTWx2cFBHbHdX?=
 =?utf-8?B?RHJjVVBrUXpqTWF6SXprSmFtQzRwbTlIVDlSSERiTFFYWkd1cDdXTVhvaWpq?=
 =?utf-8?B?ZXBlT3NIdVZDS2wvS2pEeExkNXNMT0tPQnZCT0xDUmVnekdSc2t3OHRwVFVn?=
 =?utf-8?B?SW8vZ2hlTktRSVA3TG9GdWZaOFdqenVyWGJ5K08rTlpLeVNKcVcyQ1JSVkNn?=
 =?utf-8?B?M0Y5d3JXelVzcjl5a0xacUpUZjlwc05xNm5mS2JUUm82YVd5YmJ6YmtJYXJM?=
 =?utf-8?B?dW4ySGxkdmo2WGd5QWtLRExvbVhDV3dIYnBpTDdNcGlhNmdPTS92M3Z4NlNi?=
 =?utf-8?B?eG1sMElTK1ZBVUNvVGdxbDZGclAvcGdiSVppZ1dQcy9zMmk4VDZXZjV2MU1Q?=
 =?utf-8?B?b2NDSVpyUDJ2aWI2aXptK1lxMHFYWlNHMVpFMS9leit4blZzN1RzaGJPeVA5?=
 =?utf-8?B?NFcvbzEyajl4Q3lYNG1JL09oTEZ0dnNhMDBpVW51VUxyK3lBeHhhUjd5WXVq?=
 =?utf-8?B?OFFLVXhwakxmVzNpSlJXWG1YQi8rb0EydUhCTiswWVZrVExUelRpNStoTU45?=
 =?utf-8?B?dHlXWnd0Yjg5M0EwMXpuOVNLR2wrRTlJSG12NldtYlpmSlB0cWtIL2F5blVr?=
 =?utf-8?B?YXZkRmg3S3ppdTdpVDRWdTM3bG10N2p3Z0dObVdleUxISWV1V1FOeUYxdXdR?=
 =?utf-8?B?aHdLMVVibXp4bmxLVUE0VFBRRVlGZU0wQlZZNWN6a29KMXNmZ2ZPVE9waWlC?=
 =?utf-8?B?S3htbHc5cFNxTFlYVnZmdktxUGxMY0ViSEJuT3RuZXhMYWVRNkE2T3A4UTVZ?=
 =?utf-8?B?ZlFWUFF6VVhPcHpLejNVL1dMeW93WHB4NUpRbHVJU2d4dE9PTWFWRnV0OXN5?=
 =?utf-8?B?VkUwTTBlRW9Va1RiM2EwQ2dqWEhrUHRtMjc4Ui8rVVkzejFzWVBjRGEvSmU4?=
 =?utf-8?B?ak9zSnhhbGo3bGoxUEhEd2drQTBJVjlYWC8xcngyRnpqTlBJZ1hGMXNsc0xD?=
 =?utf-8?B?R1J5MGZ5ZkdqRVQ3bHFjRlJjRTQvUzRjdFNQOXRVZXhOaC9tMWNRUlpEdm1O?=
 =?utf-8?B?Q05qNElGT0lQMTRRMm9GN29JV2JucW9vR21GUXJEV1I5ZGg4VWRCWGxkeFoy?=
 =?utf-8?B?dWREdllXN1h4SXBBY1drL1lDYW9vTmt5TmVBWllLS2pqUFBXSFpzZXladnU1?=
 =?utf-8?B?U3B6L0Y0eTRXcldXMFRDeWNwcFBkZXRUa2dZTkpRaGE2a0ZGb2dvUTRRVVlT?=
 =?utf-8?B?MlNQSjZjUVVBNndUd1JFNG9SYXM5Q0ltdlpTbHhLZzRJaGF1elJIZGUrTUVq?=
 =?utf-8?B?d2RkOGVtV2FDWVhoaHIrbjFYc2RFRi9mSzRNVkpOd3RNWWdCRjNRL0owTzd1?=
 =?utf-8?B?TFdSemIzVWNVckRXeHNjR2IrcnY2WHo3aWlyLzljZFEvYlQ4VzNrZ2kyc1Nw?=
 =?utf-8?B?THp6UUZhNnJueDkrdUtiajg1QkdPdDdrYzY3aVlTbXNiTHpucDZoY2VyblNE?=
 =?utf-8?B?T0pwSHhnZ0lCZjRQcXdrK2ZBUW1IQzN6VTJpM2M2VkFsbklybWpGRXJLZFRR?=
 =?utf-8?Q?CAqI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(10070799003)(921020);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWpldWlsQmJKRXdBVmFvZlUyTVYxbEYxeWZNMHF5Z29ESVFOVllSTkozRE1y?=
 =?utf-8?B?WXRWbkR2UU5qbFN0eHFUblJFRkIxMDBwc2gyRnYzZE9Ba2RtOWk2Z1BnOUsz?=
 =?utf-8?B?dCs2b2VGbDNMSTloN0FuaWkxTFZVR1R6K1F5a0kyaUgxSjJjcUUvV1lrOHdT?=
 =?utf-8?B?djJNL3dQWmNxdHd0QnE1M1lid1FmYXdEaFJLd3d3SlVnSzhaMENhbExtWEx2?=
 =?utf-8?B?aW15MGkvNk9kYnkveDFZd29CalFhOC84MGgxZEhwYmZ5SU4xOEVvZktDOFU0?=
 =?utf-8?B?SXpqaFBWQnpuMlVvdHBGZVVMWkNaM0VWdm9IRkpiSGx2R3VHR1M1SDE0b3RU?=
 =?utf-8?B?dG9PSENTNVVIL3l2dUc0N3FSZmxvUk5ueFJqRk8rbXFQUDNMYTNueXgzdWp0?=
 =?utf-8?B?MjN3Q2g3ajcwb29MaVBjd3VZbHJPbjEwSXh5UEVRMTRGaUJEVjVjQjNML0N0?=
 =?utf-8?B?S1ZqMkJLaE9RZzN3YkNmaUVaeURndGVEZ3lFUjdRVGh6WDRDTUVCRUU3N2Vq?=
 =?utf-8?B?Qk9RcTRFK0ZOZ1hnYmhpblV4TGRJN2tHSFM4SEJnRWtwMTk0ckx5aDBDVDZq?=
 =?utf-8?B?UUhzem5heTVqVTVSWSt3SHdyZkZyMTJ5a3FWT2J3cjVsbjZ4YldoKzFoM2tu?=
 =?utf-8?B?RHFFN1BNWk1zeXBTNGdJMlFHOVUwVytxRkJST0V6aUxqZENwclpjRXJJdkZX?=
 =?utf-8?B?a2RSY0w0aG95WEpRK09jYk5pdXJqcXk3Y2ZJa0hkSGkycXR2WG1kN1lKSXFs?=
 =?utf-8?B?UXB3YTB4WmRDWmEyZWtHZkJ5dDBYWEZLNFlwMzhCQSt1OStpMzlPd0VmZlRQ?=
 =?utf-8?B?OFVSVndBTllZeHMxK3czTERSR3U1bWFiV0J4NnZXd2FJSGNJbFRuMEtUbGk3?=
 =?utf-8?B?bXZJUEpwVWkwZ284N0JvNGNMV0NHZ3UwSW45TEljdDkwY21kZVV5VkZRZUZU?=
 =?utf-8?B?SWd2VmhxN0RtOXFEU05uMGd0UjBEWWxka3h0aVpXQVkyL1VSWEVaQ2UzenBT?=
 =?utf-8?B?bGNpZkdnT1ZyZkplTTl0QXlnSWEyZFJVT3FvMmZ6d1N0SkNMdHRpNnJhUHZu?=
 =?utf-8?B?Tlg5TDUzNHo1SEVCcEZVZkI3ZU8rNDBHVWtZRkNmb2FMaThnTjJrZ0grMXls?=
 =?utf-8?B?aVhMdmVQd1BDWE1pYVkralhaZkNJRjlCazlDby9oL2JmRzlmQTJLbG45cnZZ?=
 =?utf-8?B?QmRCYnU2MGV6dmRmaXp5MG5Hc3FBRVFTczhzT05DWGh5Y09SZ2srTnYxVUtD?=
 =?utf-8?B?YWNyVVlXdU0zRkcvcXc4TnhadU1FV2huOTg4Y0lGTHRqcStDQW9Zb09kZTc0?=
 =?utf-8?B?aDduZGtzSmM2U1dXa0NDeVZBdTA4a3h0a1NVZ1NxRVE1TU1uQnlvcEtFVEdt?=
 =?utf-8?B?TlZ3cUxXVlMybWN2TGJZalE2VXVZWkZmTEVUOC9FVHgraVBtTHFyalVTYmxM?=
 =?utf-8?B?Vk1sUkFVa0pQVUphRkJqQ21raG1lRUh0RGExbWlkNUVGZEt6NDhnY09lZ0lM?=
 =?utf-8?B?eDRST2VwaHVoVVMxbnQ0VEVOT1NoRW1tbk9aWjRhWk16SDRWZmI0TXJZT2tC?=
 =?utf-8?B?RS80VG1KN01Zd2NwWlZpdWlkSGVMdm5Vend1QTN5Y0RDZjBTVVRWWTlyeklQ?=
 =?utf-8?B?S3JXKzJjM1d6K0UxNjdlMEhjaXA4aVkxYkdsSjVqUEtEdFFBYm1zcGVWWDI1?=
 =?utf-8?B?eWIvdWw2aUh5UjVyT09BMCtJbi9rQmZpeDRQenorVnFvenJaZ3hJVUFvdEI1?=
 =?utf-8?B?Y0YxOGNpVnlNSmQ3NUpGTW1Db0RPenhNWDFNUTJjcUVCQjE2bTc3bUpNR0pq?=
 =?utf-8?B?aWdMN0sxdlhEelZtQkhIYkZUckJLeWJNeVBxbDVMZUpiY3VzeDZPNVRERVlN?=
 =?utf-8?B?M2R1Lzhldldoc09xbVhUZjNSUFQ0YVpmT2xBbU5QYlVWWVVoUXhqQ295MTc1?=
 =?utf-8?B?ek4zYjlNalpabFQxcVpqK1VGelpiaElSQlI1dDJyaVBUbER3RDdWR3ZCUVFp?=
 =?utf-8?B?eGtVTFNGZjg0NnJHaWN6VW1DK1hDS0FkKzlwbDJhdzVnTGxobDRUdUtLc2px?=
 =?utf-8?B?d2VBOU5hVXVuWXlGNEVlY2pkVTRPejhnNUpyNEVIaENwYU1GWENVRnpIZHlv?=
 =?utf-8?B?UGFPbEcyRTl2bHY5eHljb1BxcitjMWdMay91WUtUVVN2V0hwVVZjZmxTUC9t?=
 =?utf-8?B?MVlPZFM0VFVnOEw5NEIxdTFocWFCQ2Y4RmhHWVhVMk9GbXl1Z1g5UmRPK3U1?=
 =?utf-8?B?UGlsZnJxMDFiYjlxQVozaytKK2tnb05GUHBTVTVpVWFocjc1akhRMmZ6a2p2?=
 =?utf-8?B?elc3RStQRGJiNHRPQ1ZudHZCa2ttdEJaa3JMVU9RNU1PZ3poV0VSQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 02809bfe-9dc7-4cb4-bfdd-08de62667cb5
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 14:22:25.2397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2evaWRiJlxrl584Pe8e/s4Ksz1kxGa6m0aipw/hbEwS9eaGNhdifLYvNB/J8ZW6SL1n9Vj90m/J0peybGg5Leg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB7368
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
	FREEMAIL_TO(0.00)[nvidia.com,kernel.org,google.com,gmail.com,ffwll.ch,collabora.com,arm.com,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[garyguo.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zulipchat.com:url,nvidia.com:email,garyguo.net:mid,garyguo.net:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 0EDE9CD46A
X-Rspamd-Action: no action

On Fri Jan 30, 2026 at 8:34 AM GMT, Eliot Courtney wrote:
> This series extends the DMA coherent allocation API to support compile-ti=
me
> known sizes. This lets bounds checking to be moved from runtime to build
> time, which is useful to avoid runtime panics from index typos. It also
> removes the need for a Result return type in some places.
>
> The compile time size is specified via a marker type: StaticSize<N>.
> Statically sized allocations can decay to runtime sized ones via deref
> coercion for code that doesn't need to know the size at compile time, or =
to
> avoid having to carry around extra type parameters. The implementation
> follows a similar pattern to Device/DeviceContext.
>
> The series defines three type aliases: CoherentSlice<T> (for runtime size=
),
> CoherentArray<T, N> (for compile-time size N), and CoherentObject<T> (for
> single object allocations). It also adds infallible dma_read!/dma_write!
> macros and methods to CoherentArray, while prefixing the existing fallibl=
e
> methods and macros with `try_`.
>
> The macros keep the same syntax (i.e.
> coherent_allocation[index].optional_fields =3D expression) even for
> CoherentObject, because the [] syntax is needed to know where to split th=
e
> actual CoherentAllocation object from the fields. This means that
> CoherentObject is indexed with [0] in dma_write!/dma_read! macros. The
> alternative is defining a separate macro for single object access, but it
> still would need a way to delineate between the allocation and the fields=
,
> perhaps by using commas (dma_read_obj!(object, fields),
> dma_write_obj!(object, fields, value)). This would be inconsistent with t=
he
> array/slice syntax.
>
> The last patch in the series may be useful as an example of what this
> looks like to use. Also, there is probably a better name than
> CoherentSlice. I found that specifying a default of RuntimeSize on
> CoherentAllocation stopped the compiler from being able to resolve
> which alloc_attrs to call in usages like e.g.
> CoherentAllocation<u8>::alloc_attrs. Also, we probably want to encourage
> people to use the statically sized one if possible, so it may be nice to
> avoid defaulting CoherentAllocation to RuntimeSize.

I've already posted an example on Zulip but for visibility I'll post it her=
e
too:

I think the design should be `CoherentObject<T: ?Sized>` so that if you nee=
d a
`CoherentArray`, it's `CoherentObject<[T; N]>`, and `CoherentSlice<T>` is
`CoherentObject<[T]>`. The existing `Io` that has a fixed minimum size but
variable actual size can be abstracted as a new type.

Link: https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/t=
opic/Generic.20I.2FO.20backends/near/571228593

Best,
Gary

>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
> Eliot Courtney (9):
>       rust: dma: rename CoherentAllocation fallible methods
>       rust: dma: parameterize CoherentAllocation with AllocationSize
>       rust: dma: add CoherentArray for compile-time sized allocations
>       rust: dma: simplify try_dma_read! and try_dma_write!
>       rust: dma: rename try_item_from_index to try_ptr_at
>       rust: dma: add dma_read! and dma_write! macros
>       rust: dma: implement decay from CoherentArray to CoherentSlice
>       rust: dma: add CoherentObject for single element allocations
>       gpu: nova-core: migrate to CoherentArray and CoherentObject
>
>  drivers/gpu/nova-core/dma.rs            |  10 +-
>  drivers/gpu/nova-core/falcon.rs         |   2 +-
>  drivers/gpu/nova-core/firmware/fwsec.rs |   4 +-
>  drivers/gpu/nova-core/gsp.rs            |  44 +--
>  drivers/gpu/nova-core/gsp/boot.rs       |   6 +-
>  drivers/gpu/nova-core/gsp/cmdq.rs       |  20 +-
>  drivers/gpu/nova-core/gsp/fw.rs         |  12 +-
>  rust/kernel/dma.rs                      | 555 +++++++++++++++++++++++++-=
------
>  samples/rust/rust_dma.rs                |  14 +-
>  9 files changed, 489 insertions(+), 178 deletions(-)
> ---
> base-commit: c71257394bc9c59ea727803f6e55e83fe63db74e
> change-id: 20260128-coherent-array-0321eb723d4c
>
> Best regards,

