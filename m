Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64D53D3B03A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 17:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF3410E4B6;
	Mon, 19 Jan 2026 16:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="XksQeP0L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021137.outbound.protection.outlook.com [52.101.95.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FB210E4B6;
 Mon, 19 Jan 2026 16:16:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXMqzNrLvRssRFT0e9l9F28BPpsuOATte/8jwbgVfF0i3BCLo9AzngiL3VhPepyEcvXcuDgVt6U4yg1Sg+lfQdgOBIjL0+bspmgNmPoBMW4OTyHZSe0hHLpB7YZqpn+BEYHGjzROm1k7ABfRjBchlkVkXEWVL/MiKh9PD8G1earFLcoVmjRHMag3WVbaH7TTUKGaNfa6bM3NuzykSOsFxN4FzAaOpReNURibtgyRitSpkGKTSntszAI1nE3LXRllGq7HES9ML29fH74gAjiPOhHi6GgjT0GSXKJyen9Tqyzr99Lcr72ONl6Suepa3l6bqAm30Wc6rvFGbHrOzygwgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUC3Fh4o4o+v9tcyDyaZgwuHl1AltoFTGheU6s1EtpM=;
 b=BTS/9yvetKAv1OIywboOI459oxBohjVURq13u8JslDN0jsmY2FuMred7VxEXTlTG+Pi13ez7UtQJBSatlOyr4kDBVcBiVfGBDuiZ3RycS7jZbJsja/cSezCeAatlqs5iJd0UTnvAuIfBv63BtFdTR9/e1R2nv6cjbzjfrGH6VGOAYPb0dsgK2BRkZ0xZ4e4Ml6dxwIvGKCCq38L3ed+Q4oRVqcwHtg0QxFfDUI4LPw1F3J/5rJwDHIWJ6jir4zlMLKCxaWlqiwhvcu/LUHV/vTSj7beZUPIiPaQiidmjZW6/zmEnuGJQw5eaQ8Jn0RpwJ7WAkEBun+jABQ4fgVMFzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUC3Fh4o4o+v9tcyDyaZgwuHl1AltoFTGheU6s1EtpM=;
 b=XksQeP0L+ImWxgNiUMAtshYz7bRalTIHDBx5NOxXZBFrs6tETC4MQQ+mhjzrIX13hvX+J5aZl5lD2ve/Q3WFwG2uWi5huqoXorxJ5v2RUVzftuZlrvGLj1YSco3tsB9ibIFf74GmASZmZAY2HyuE8FyXG1rekV5CridK+RvxMrU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7618.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:398::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Mon, 19 Jan
 2026 16:16:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9520.011; Mon, 19 Jan 2026
 16:16:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 16:16:48 +0000
Message-Id: <DFSP8MA4MZA5.3A6IQ1HS6UF8G@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, "Lyude Paul" <lyude@redhat.com>
Subject: Re: [PATCH v2 06/10] gpu: nova-core: gsp: derive Zeroable for
 GspStaticConfigInfo
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
 <20251216-nova-misc-v2-6-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-6-dc7b42586c04@nvidia.com>
X-ClientProxiedBy: LO4P265CA0126.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c6::17) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7618:EE_
X-MS-Office365-Filtering-Correlation-Id: b0f2f97d-3436-42d3-9c82-08de5776261e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NDhEcklveUcvV3crWTQyeG9IMExuSTN3UUF6ZEE5STYycmZsTUxGUlhXeldu?=
 =?utf-8?B?aWg3UVQ0SW9lWjBUM3FQOUowazB6cG5GTjBidG1JY2ZxVXB2cGZ3cGZaUGJl?=
 =?utf-8?B?aW1sM3FhcmRJWkFXMVl1YXdRZVZ5OGZZRTFNVUpEOGF1N20rdHdDejh2ZXpo?=
 =?utf-8?B?d1YvbmYzUS9WVVVGdHdBNGRkRExHaW05UWNwUTAzaEdVUjJKSGFDam9STmVE?=
 =?utf-8?B?VkpZZjFQVEFVa1cwVDJnbVlJd244L2Q4Z2ErVlg4TVVmWTdKMVliZFhqd2x4?=
 =?utf-8?B?YjFzanVFam81UlFEMC8wLzlUVzd4ZFl2eCtocE9JRnZVZmR0cnhRZDVsMGd4?=
 =?utf-8?B?NnZQTGhrTVdQUFAwZnVUb0IrOU1xdzQ5ZFNRRGZ5Nm5xdTVZU0pIcTdHeVJS?=
 =?utf-8?B?cHNiQUVtV1dCeTFpWFByellqWThadWlOc2hZNW1NQXVwVC90Qk5BVFFOV094?=
 =?utf-8?B?Z2JQcHdBYTFORng3S01zTXd1VzliSUF1NlBZcmVLSTJJMlpoZkZJeGtRenpJ?=
 =?utf-8?B?QmV5bXdHU3RmRElUd2VoaW15dW9lK3VtZ3NBdWpLeTZMOEx1bUR4SGpNVWNT?=
 =?utf-8?B?QTlHYk5pTDJTdlN3ZlBFWE9uY1Y4Q2RRdE91Z09ZdHprekVoWjJkNytFREIr?=
 =?utf-8?B?TmZvMWNPV2ljWmliYWxNUmQzalI3MXpWTVVRTzVsQUZWT2F3TDFZbktzcC9Q?=
 =?utf-8?B?RWNwZVkyMGpPU0JpSVVIc3FaWjFxQjVaWkZTT3BSNmVOV0dqbThRUTlERTgx?=
 =?utf-8?B?bFZNR1hQTFpBOFVMYmFQV3RIQitWTFdpTHBWYzJGeWVzQ01CZ1dDcXFET2xS?=
 =?utf-8?B?Ymkvd1JvTjVvMkZzSkEvbFdISzdxcXg5YWZDdmxCN1JySVVLaUJtMjVUaFkw?=
 =?utf-8?B?YlpFUjFtSmsydVJOMHRFUi9TbmZLb2J1bHdIVGs4ak90V1FjN2FqTlViSXR0?=
 =?utf-8?B?WGkrM2NHYzBTUVl3YkxKRFpwbjBXWU03Y2Z3ZlBpV1JhUDdiM2NFSHJrZ25E?=
 =?utf-8?B?bjVnVnZpMnZZTFBmWU1TbUpFRnpIdEtQcGNGQmo1a2FtcDRFeEhuOEZRZEEv?=
 =?utf-8?B?UHkxZWhOYUJ2MXdWbGRPdXlZR0didkRCMlVVZFBiYXNScDd6bzdLM1A3S0dz?=
 =?utf-8?B?UjdXU0pzcU1HY0p3Yld3dm0wVWl5WlVFNEUxaVM2QlVJazVGbFB0OGRWN3N3?=
 =?utf-8?B?c1YwZmd5eXlQbGFaNmc0VnF0dHlvQVJJUE56TVFFc3RPVm1tNmFSMUlGZXhu?=
 =?utf-8?B?TlJ2c3gwb1ErV0U1NU90MUZSU0gzclRHWnk2VkM1NFVxRkk2Z0dmbm5hd0sw?=
 =?utf-8?B?K1lIejBIZG9NYmlMeGZiejY2S1ZVQjQwUllzZXZScTQzeHluMWtCOG9KSFJO?=
 =?utf-8?B?UU90UXk3TUpGamlNQ3B6LzFwZ1lKQktIektBY2RYYU1CZWZNS0FDbEVBcUpY?=
 =?utf-8?B?dzNudVdSUFNZK3pFZ01DeXRpRy9EaXpnZDRraXdKcDdkdDRCM1orc01FYWFM?=
 =?utf-8?B?K3lwUXcvVUNUTUREQzZUSE9BRTNPZ201S2lrNU1aY2FvQXBuRHJwa2tWTGRW?=
 =?utf-8?B?blZoWXEzSHZnRU1xcXY0Z1RnZHZtRUZWaVNIOWJ1Z3ZEZk1CK0krWDZUOVNG?=
 =?utf-8?B?OHBGNTB1eWhhWXk2N0dNMmx5UzJyYVcxdXdvU3dzQ3FmK1VkS1laejhLQ01I?=
 =?utf-8?B?YUFuNFEwS2Zrd2RFRzVsdTduWk1XUGlDemJNOGo5UlNoNmp6QnkwZG8wL1pK?=
 =?utf-8?B?WUhZWGhqbWxBT0QwMkZ3V3BackxnWXRtUzZkczcxL1FZbWdVRENBZGFWR0xh?=
 =?utf-8?B?Q2ZDK3p3bzVTRktjSUhTa0E1dVJuNkQ2ZExIY3l1cnNUTFIvOXBRM25vUCtJ?=
 =?utf-8?B?Y3NNSXZFWmFUcFVVWGFkT2QwZ1c4elFrOXVQKzAwVTQ4dDJVclJZMHltRzFh?=
 =?utf-8?B?enAzTkkvbW16alVHbWlVY1FyWHUxQStEZEE2MGJid1h6UmdvZUV0M1Q1bnRZ?=
 =?utf-8?B?dFRNb2hYZmNyczRjdEdIaDB1M3pnZHBBWldPUzJpbXIweVlXSGNHMlREL2k5?=
 =?utf-8?B?aWpZNEtyQjVmemZWdmdyZW9oQytCL0lOdG1JeXBWN0U5aEdCeHRLQ0EvWDU0?=
 =?utf-8?Q?jiZA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(7053199007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q3kvVHFPb2pteVRlS3FiT25lRmttMi9lY0c2OWxvdXhPdzB6aGUwVnh0MzUv?=
 =?utf-8?B?enN0eHZIdEh2UGJSOWhHQlJkdktJYUJXcGowUUlFNE8zVXphVnMxaCt5Wk9M?=
 =?utf-8?B?bDZVbkVZL213WXIwNkx4b29MbWNDOEs4UG1YNDYzVWZNaTlZWThwazczTm56?=
 =?utf-8?B?QmRhbDNqV1JmUWNPeE5yZVJsbXR0dzFxK0RSZkpzZEo4Wk9Qby93ZTBjczZv?=
 =?utf-8?B?aEEySC9mQ1JvbkVhNXhPTklOSy9jbjZza1ZVTXYvUkhpd3VFb016My9PUU1W?=
 =?utf-8?B?RXc4b2FZc1dhTFNORi81T0EzcExFUEFuOWhIN3A4U3RaeUR0USt5RVBPMUFO?=
 =?utf-8?B?bFh6cmVNbEJKY0ZKTTV0czRSRXYwSmQxNU9hL3laMURNdEpIQ2JuY05Fd1Bx?=
 =?utf-8?B?QkJNWlFUVTNIMTlWQ3phRkQvQkQrYzFUczdqU2hSZzFYVm5yWVZkSnJ4YWdO?=
 =?utf-8?B?dUJBWG5mVm9neCt2NUtlV1VDRnZ1SkxnYTVscFNwM09WN2RqYTBzd1pib0pl?=
 =?utf-8?B?MnR3TVVhdFc2RU5yNXRhZ3F5dHgrRDNUaGxkZmdaQ0k1V1NYWVNadGlJV1hG?=
 =?utf-8?B?b3dEYU1SZzZmU3JHWFl6R25QeVJZVFIzUjMyeEtQU2FQMW9tajU5MHFqaStq?=
 =?utf-8?B?MEUrRmIvZjF2SmdEM05qcmhXZ2lSNVBGZFlyMmRqNXVTZlNZMVZLNlNNb0E5?=
 =?utf-8?B?akZYSVQ5bkUyZjc4d3RtNVhjQm1kdHBHVWRsTVdqSVRVV1UwWXNNSWZLYmR0?=
 =?utf-8?B?NXRvRFFDaTV2NHR3NGhBY0pWeXFFVlUwR3lZZzU3YUFyTDJaSmUwUFI1bjJh?=
 =?utf-8?B?WUVwb3hlcGRvMytyekpWOVU3VXpaeFNYT2M0UjAzTUZrOWtVWEZITXZRYTFv?=
 =?utf-8?B?VVdQUnpuUDBpNWFTMlRtaVA1NTFWSVh5VVpBMDZYMkRxTjdNdVUxUTVnV1kz?=
 =?utf-8?B?ejhjRkdnY3EvV2lndmV3d0o0bklWWUEvRXJ2UW5RVTUzbDVIWVdMUHZ1MWNh?=
 =?utf-8?B?V2xoLzY2aWp0RDhrQ2tvSzIrdW5KWnZodlpHZks4SS8vaUpNWW5Cdis0R1Rw?=
 =?utf-8?B?S2lTcEhnSUU5Z2p5NWFtWTZtZ1U2ZnBsMGVVeEJmL3RCTXBvMDJGRExRdWlz?=
 =?utf-8?B?ZzBpZE5pLzMzRE53VEtiVkE4S0VzWDRDMWtEWkN3bE02aXZpOUVuVjQzS3gz?=
 =?utf-8?B?aWRieklkQVRXWkV2cFR0RUhXd1dmWTl0dVJJTmpMYWYrRWZlckdWNHlORHdO?=
 =?utf-8?B?c0REUjVQM1YvRWR5dkRTUWlTSFlGSG5vQ2huR0dybUZ6Z2dDUGVFUmhxcWla?=
 =?utf-8?B?emx4di9XMitkRldhOXpEVUxqWFdqYUZDVUlOU05tVlBvZmlFSW1vR2VSZjlS?=
 =?utf-8?B?emwwNmJBbDBnSmUzWDlDdnFITFJMSlp5dHZQYkJ5RmdmNVkvdXZhZGxzakNt?=
 =?utf-8?B?YmNaOVlXdTFLWUFoMThFR0ZSdGJZSlNVQVE5RXlKQlBsb0tSVmdrVEVtaWRQ?=
 =?utf-8?B?SFpRYllCZlM5UElRdUpFdlFld0Y5akR3ekpmNEVQZnVCZEtRSmJjaEU5TVB3?=
 =?utf-8?B?a2kzbmxEMExDdVNUbXBQbXo5RWFnZm9SaDUza0I3VEJHcjdoMUdSdC9oNDls?=
 =?utf-8?B?R2s4Z2JJUUx3MSsrOWtGZ0Z4SDVCYVRlMEZlWFRkcXBNcWovcVhQYWxJQXpY?=
 =?utf-8?B?VFY1ODVUV0FqZ3JTVGZCclVSYXNTSEZSUGNoMTE0T1JKMG9PUTNPY1FxQXZ1?=
 =?utf-8?B?OU1Pdkh5VVd2M3BYTmNnekdGOCtXVU1Kc0ltcVRTZDFENHQvNW1JbmJwT0tp?=
 =?utf-8?B?dExMcmtmbWo1K3I3NWhrVzkrcDdCeXhUM3JwRUdHQ0ZrbkZjKzZFZy9RWnFx?=
 =?utf-8?B?SElacG1zOEtMTE5jaW9RUnhRdGh0Y1E4Uk9raXozY0xyTHpzSmRySFEzTENo?=
 =?utf-8?B?Rks5blFtQ0M0MnZyanJyWGZaWW80eGZsVkl5UW4ycE8ybWJFTE5NbS9ZOXZC?=
 =?utf-8?B?S3Mwb0FENnFEMXdiL3hPdnlQQ0dOZU9VbFZheHJBY2x5N2l2MEVVMWgzcGp5?=
 =?utf-8?B?enQwa2NBMDZ0SXVsQVQxbVgwY2ZkVUsrWDg0RkpnMURKTHJRRVZEUkxubjIy?=
 =?utf-8?B?c2pMVktNOEtNckxCT0JLM0o4bWR0TjN6UElFcnJzbkdQS3kyb0hmV3Fvbk44?=
 =?utf-8?B?NjdiK0VGWlhFNnJnVTRjRDhNaWorbExvUVhaOHBYNStuKzFjV3p1NWJ2dXc2?=
 =?utf-8?B?bld1bmJISEVPQ3d2OXBmV3B0eW1IdVB6TG5sOXpzQTR3VjhqMTF1cFZORG00?=
 =?utf-8?B?ZnErMlFGcUF5dG5mblVzRWlJcENUU2dGakdBZGZldG9rckFsRWtuQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: b0f2f97d-3436-42d3-9c82-08de5776261e
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 16:16:49.1221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nCo+g1v/YDmzHt2H3sPRqRzFs1OX5Gpj8jL2KLtyX+S3vujz7HHlxJuBma321KRfq9CFRpf7+XDcB/fynBqzsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7618
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

On Tue Dec 16, 2025 at 4:27 AM GMT, Alexandre Courbot wrote:
> We can derive `Zeroable` automatically instead of implementing it
> ourselves if we convert it from a tuple struct into a regular one. This
> removes an `unsafe` statement.

With latest pin-init changes you should be able to derive `Zeroable` on tup=
le
structs now, no need to convert.

Best,
Gary

>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/fw/commands.rs | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-=
core/gsp/fw/commands.rs
> index 21be44199693..85465521de32 100644
> --- a/drivers/gpu/nova-core/gsp/fw/commands.rs
> +++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
> @@ -107,12 +107,15 @@ unsafe impl FromBytes for PackedRegistryTable {}
> =20
>  /// Payload of the `GetGspStaticInfo` command and message.
>  #[repr(transparent)]
> -pub(crate) struct GspStaticConfigInfo(bindings::GspStaticConfigInfo_t);
> +#[derive(Zeroable)]
> +pub(crate) struct GspStaticConfigInfo {
> +    inner: bindings::GspStaticConfigInfo_t,
> +}
> =20
>  impl GspStaticConfigInfo {
>      /// Returns a bytes array containing the (hopefully) zero-terminated=
 name of this GPU.
>      pub(crate) fn gpu_name_str(&self) -> [u8; 64] {
> -        self.0.gpuNameString
> +        self.inner.gpuNameString
>      }
>  }
> =20
> @@ -122,7 +125,3 @@ unsafe impl AsBytes for GspStaticConfigInfo {}
>  // SAFETY: This struct only contains integer types for which all bit pat=
terns
>  // are valid.
>  unsafe impl FromBytes for GspStaticConfigInfo {}
> -
> -// SAFETY: This struct only contains integer types and fixed-size arrays=
 for which
> -// all bit patterns are valid.
> -unsafe impl Zeroable for GspStaticConfigInfo {}

