Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIoJFofJn2lwdwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 05:18:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E9B1A0D1F
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 05:18:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185A610E86C;
	Thu, 26 Feb 2026 04:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FWo2pASW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010042.outbound.protection.outlook.com [52.101.46.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5D010E86D;
 Thu, 26 Feb 2026 04:18:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QwVulG7LTTfyxpDidEXgeV9bSpTrB6eUgo1ULJelT/OJNW6imQKiq/wN0m5WhBHWIZaDOo77NRwEIfpNmzw/+VvOLTP1jQWhVh7I5mhe0meO9p92Tfms2YFZSLo09caUKLUsT7sCW5e22tWdbILPosOw7vBeiR1D6zjrRKm1LojtwYzzIaq84Nl0Q3VouN2hXtVDYVfX23WCeEtdQIYG0Ptjm5tkBta1NyHppBe+xQz20mkc3th2GufT7y390dZsxGi6YUlGj7A9rXZz760+zNT509cJk+DVrd6gqtqAQvorL88ZAGQ8HTiM6LIrfXyjE1dtfdlktllmlnZonCZaBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ylf2rAimtEhgYPaEiso7sroe8E+2SkL9ec/5simq0H4=;
 b=A6aWLh23qgVVmdi36b5i1VZP8gGFQZ1doBmMCHuF+lfMEQeePYqlR9KIqulRnO9YNlequyalQXGN9fp7PL8tsa3GBROqg5ppl5ppU81tV1i9VTingFZVGJF35/wURMFpmNV0j5dL3RH5NJQ1U3RqZ3B3nbO4zncBH1+srKpqEWUPQ8dE/FwbbuWtHXgQh+xnhxl0iEObVCOugkECuVOW6IKGTDI8qIFrieEvuJzcyAdJbJ1trNjyj/b1P/MTd2jG3t/fEJ94kE/vUaaTRFFPNT+ZHsERxjv2rR5FHfgiV+FB7d4hgvhHM0ayavCFUTP8nvT6VmhRUptRUFdDZMy4Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ylf2rAimtEhgYPaEiso7sroe8E+2SkL9ec/5simq0H4=;
 b=FWo2pASWtFE3C5hBUGmtgBeXsLAn4FSo09AW7WeUGg3+ta52Iy7k/00qDbv49Go0MJuDiOio4Abewwe470gYU7rmD0ncvTKSlsHb4aHziHqmFSgnrsax0fiUVJi6f42W3DTLwgbpJ+hkkEHW/+V1h5Pqo7ueqaTX76lMpFUN8rWnHZRhVOQJ9TyhCYtJIKw/DDt9aFj0YarxJp76Ush3iDe1e3hS75eEDS+Z3UJc+TgZXNEy8eVQY0iYrow9N6zNPEr+pLdrLi0WEPld/5qydfuBChtcxDYtSgP0KvDoTjMwzrYAHnNKUGp00SYBzymw60VUzAK4wfd24sTtcH0fTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB8164.namprd12.prod.outlook.com (2603:10b6:806:338::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Thu, 26 Feb
 2026 04:18:07 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 04:18:07 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 13:18:04 +0900
Message-Id: <DGOLR0LHG7NT.2PD051OZCD01P@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v2 7/9] gpu: nova-core: gsp: add command_size helper
Content-Transfer-Encoding: quoted-printable
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
 <20260219-cmdq-continuation-v2-7-2e8b7615536f@nvidia.com>
In-Reply-To: <20260219-cmdq-continuation-v2-7-2e8b7615536f@nvidia.com>
X-ClientProxiedBy: TYCP286CA0194.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 32433e55-dfca-403c-2ff8-08de74ee0b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|376014|7416014|366016|1800799024; 
X-Microsoft-Antispam-Message-Info: qhjGaNt5C1nNNDroXkA//n+gM8yZFuMhc47rb09Cyu5iBTEe8OOfuqyC2AEtweo2GM9UY5u5uCrEtBtt7xp+MStNR6h+f1fEecl0+hPf3dmOElS8JWcEwYVP8RXt3D5X/sYOJbmSFFqFnNgqtThrrF7JdrEJxBN3yNqyzp+3/LDRsw8ZRuUf0MMOEODwKwDg0t95Q+OLOBB7MGXeYCCDiOGds/B8xLGHuey4nUsKUbPwW12UMNaHviYuXbPZgVS50ZwdwC129069Qa/W9nxAliExUtK5nfAGku9NdNoJzoIeKm9ojcyKW/gobVjQYBeHhOlS+v5NpdG8Fjg5o7yKvpCePB/MSVVWUGhacb6CRcpEFgIWFVunxQB+B6vDU7v5Lvo6V/Ooprhh9OdBfndlVP9vHY2/cD3ON9V2H6QpXYvLpPqXB3+ZCn8Pbx7BkqURDSsYjp141VS9fgoljhsh0K7X7IFlcLCcXH1JXZ2Hm+atKdb78Pn66ibfW3U6yv2+6XOKk/+8al8+3St7uRBPAzkQP6887c9voeat8aiook8p8lwXd1alwiCLU/pqK2zKdKl8NWnOcNIA3aj+XjNJKxf1bDg6ikACYOfiBAOgLYJAOCmDFzII9Kdm1mCVGyh342ZTnrA+o+eadzN7x3Dti5nQXAGjuzITTV/43dclJnx6G/cfscZK31+Okom40V6oeWydUKiG6GsYsNn45X6hqN7u51pnt/HXMwes3UQ29ZQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(376014)(7416014)(366016)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXRTUjhuNEI2WERhaWRncnVNRlU5UzlLenZ6WXh0TUhiUEZXTHlnK3hQOWE4?=
 =?utf-8?B?VE41UXBOOUptbFM5RzRINUxVd01LUlR1NW94ZjMxcVV1K1VvTW03NUVKUmpH?=
 =?utf-8?B?K3RvN3JPdFFVb0c3cnBoRytBWWpQQjFGajk1SjE0Y3YwRHVEWiswT0Jhb3FU?=
 =?utf-8?B?V1hRdldzSVVpaVhFZU9VMWljRi9hRE1yamRLalp5QjZsRHc0M01lVDU5VzFY?=
 =?utf-8?B?N1d2YW9YZ3Q2dmtuWlZvL2FLOHBEZmxlWnVxRzRydk0xVHIvQUdBUGFFVll6?=
 =?utf-8?B?d2RxTVZ6R2MwUUdZQWhzZHJma21GUXZXOXRXSWMyN1VFQzdnNzhGbnhsc2VX?=
 =?utf-8?B?WnpuNWxJeWsxc1ZLWmxzQkZVRFMxdTBzcVd5YlY2ZmxKZU0vcVBxUk9mRlVv?=
 =?utf-8?B?Z01SRjlicVlQUEFaNWozRDRJalhwN25CRjZyMFA5V3A4ZHBIOGdnenk0d280?=
 =?utf-8?B?Ylc5aW55WjdzSVVkamNnM2N3OVhYUDljeHpnMlRPUmlqNDd3SlUvZlRmdnV0?=
 =?utf-8?B?SFk5ODY1SHE1TDB0ejFwcWd4UFlxMFN5dndIUFhzMzlQV0YrZnp5WkJadEdm?=
 =?utf-8?B?cG81U1VSNGxGMXZDUGYxWVEzMzBVT1BkNE9mSStmQmhzUmpxVkNMdTZTZTgx?=
 =?utf-8?B?T25YK21DUmZ1SnNDK1BZSjVWcUovNUN5bzMrMnZhVkNDeVlIRUxQb3ZDRVhv?=
 =?utf-8?B?aEg4Tld1U3g5eklleEEzZjlBUDV2bGJDeDY3L2QvQnIzVnhRa25DMy9nUGNp?=
 =?utf-8?B?ZzZsMXQwWnpvb0dkcFFzdFhRRVNqVWNqSEhxQnZzVzFjUDk2QXEzR3ovdVVt?=
 =?utf-8?B?eTJjWGlrTWxuS3VVbFp4dHNaNWRtWStIQzBjaE9sTS9Ea3Z3a1BCWEtFSlBu?=
 =?utf-8?B?Q2NjM2oxY2hlbFF3WXJTa2FPSWNMQVlFNFZ4UTU3WTd1VllXbWFvT3NYQW4r?=
 =?utf-8?B?ekNMbzJ2ekR2TWpJV2xUdEJsK3NBMjJuSy9GWHI1eVg5UHR2M3VuRXU5MENq?=
 =?utf-8?B?S3M3OVozTXlhYlZCdHBaa0I1RjVVc0Q3MnF2M01pQ3N3ZjNzdTJmQ05yK0ZR?=
 =?utf-8?B?cUdzNE9aTTkvcTE5eGwwUkFlTStPeGhrQittSWVqWkM2aHFYOHNXWUVpUmN3?=
 =?utf-8?B?Z1lxNEpKbExSZFg1NUdack1NK0F5WThaZllGZDJFcjd2ZXEvc2NnTTAwVmhy?=
 =?utf-8?B?ZTdPbkp4RkRvTWdCY3JkWC9HYWZRWHhLZEFJR2c3TWVHOERBS2svMVc1RFlQ?=
 =?utf-8?B?RVlPQnV2T2E1NVhBOHZtQUIxSk9ibGpVK0d4S3F6UUFPcFE1N3dDaUY1ZXEx?=
 =?utf-8?B?NWxObWF0V3U0dmxrZ2xMWGw5NkViZ0RkTVhvdjZIY0huVkpxWDBld0NjOXNo?=
 =?utf-8?B?a2tDdm5HdG9LNERqb2NROURtaG1qWlVzaDEvcUY2dkRTS0txcGtCbTJ6eC9v?=
 =?utf-8?B?djg5UzU2Rk4vTW1PN1RVYWNHZGZsN001WUMyaGM3N3gvTldCNGNsbnpOanBB?=
 =?utf-8?B?TUdZVGlrcEd3TnYxZmtLczlwaXFvQVlsL05qMG42U2srWFBVeHIxd1pmWUtL?=
 =?utf-8?B?aENUeFZMc0ZoSzFQalBDbVN0VE9zeDdERGZaeXBWK1M5RXFrZDQrZjNjNHRN?=
 =?utf-8?B?RE9mTDFySk55WG9mTzZTSDNFYUdrU04xM1Zyc1Y1bHozRzlzVXhPQnIrbktz?=
 =?utf-8?B?QTluUHpHck5sZW1lQ1J3TmZmS05vVW9lYldodExQdGZyVDZFQk1XTVM4WUV2?=
 =?utf-8?B?Q3RFcTMrK2d4V3BTYWFlbjZER29JY0k3dTIrTHhXNVRnVXovamNmeVY3Vzdp?=
 =?utf-8?B?WnRuR2o5Sk5HQU82M2FyMldLMmljNEV3MXhLMkloNTMwQVo3VVBOM1pLOCt1?=
 =?utf-8?B?b0lka09WN3FoTDVYLzVrUGZuSk04TXM5alJ6SDdkekxPL2tzQU9yS2pYRVdO?=
 =?utf-8?B?elVKckZxS1hRZnlrRXhWQVR1WHBnV250K3MwYzhWdW5jQWorK2xIclRSNWJR?=
 =?utf-8?B?OE1xbDRWYmNNc2F4TlFLZ3NYcCtIZ1VyUWVHTzBRVUloVDNFZFpUS2R6YUxa?=
 =?utf-8?B?QldxWU1xQ3dBOUJmL3N6aHZhalQ3YjhjVDZCL00xTldRRHpuRnlZWXJXeURn?=
 =?utf-8?B?ZHMvdHhKUkpGUGROZXU1VkxIWnlvMlUwcnBsQWVwS2NWQjQzdnlSOXNhM2Jw?=
 =?utf-8?B?WXlJS0ZqRk9GaTQwR0FIWHpVNUdFOEoySkg0UnVWT3hCTWlMMVRUS1JaVU1W?=
 =?utf-8?B?QlYyY0pycUVEMHk4dXI4Vk1vNXhVYzY0OWJEa2lqL1lBQXdHbTJzWTVQemRO?=
 =?utf-8?B?cW5jcXIzWlpsUk9BR05OZTRZeWsvZWl0QW9oZzZ6dkNWbXJERkVMdzIxdE55?=
 =?utf-8?Q?8PVSsB7FvrmEgn/937bwLvKGccSGbiLdu0MjIAwcgeBNo?=
X-MS-Exchange-AntiSpam-MessageData-1: jqqzeCTLGBkD9g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32433e55-dfca-403c-2ff8-08de74ee0b66
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 04:18:07.6792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IZqsNdk0GbimAGaoE6uKGRbBdZuyFxNK+sY6Y8fc7bkZrNi2xfz8gJz+nf1B7B1Bjrtg526jsWavWeYUYgX1lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8164
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,google.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: C6E9B1A0D1F
X-Rspamd-Action: no action

On Thu Feb 19, 2026 at 4:30 PM JST, Eliot Courtney wrote:
> Add a helper function which computes the size of a command.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  drivers/gpu/nova-core/gsp/cmdq.rs | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gs=
p/cmdq.rs
> index 1547687834f8..f832252ae45c 100644
> --- a/drivers/gpu/nova-core/gsp/cmdq.rs
> +++ b/drivers/gpu/nova-core/gsp/cmdq.rs
> @@ -437,6 +437,15 @@ struct GspMessage<'a> {
>      contents: (&'a [u8], &'a [u8]),
>  }
> =20
> +/// Computes the total size of the command (not including the [`GspMsgEl=
ement`] header), including
> +/// its variable-length payload.

This comment reads a bit funny with the "not including but including".
How about "... size of the command (including its variable-length
payload) without the [`GspMsgElement`] header" ?
