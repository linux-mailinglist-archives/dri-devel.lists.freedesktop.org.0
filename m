Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEEBB8EE87
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 06:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A782F10E030;
	Mon, 22 Sep 2025 04:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="kV/1PjjA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012058.outbound.protection.outlook.com
 [40.107.200.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1D110E030
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 04:11:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKiDjzmhCOQ1y6WXSQcFZMtZxaiCGF7iyKO3fLb4kz+O+1p5XoMt4j44/0418y9Y2mwqBLvz7bkVhCo+SpVTs3X+odsxJ6t606sGFRu0RNDFd5r0E/2//N/SqvVli+OnFzkGUxnsj5cmSwb6xqHM0yR9DazhJ6nju0T9FKdpqtaGZ4nCSl1Z3m+gk6DvrZfteyCPdLnBPWDXYFqKX7My6LYve733C4qNgsR4KNAAmnOBrGebKwJIxlGQoyIzA2x/0esozBWFgGz3B3mffTsOCSQCOCK+4M8QQPTYYQ095oNhN42p0JOLL0wq5i4SP9a08xrFb6osOFf4m7i798Sr3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKrxDeZnlKUCUdQ67KRFxtD+3VexIWr9rARN1nAHmgE=;
 b=FraznzBE+grMeH4fPH1wPAXdB1rXYJWi6bpiyGzg9cIzEmqAOywtrbWRxb85wd1ayJd8A0vdww5nQM6AanXBETlEQ19V1++GYksTQ/scKlbu92F1oI14ti4TeXiOLAyG3CQATzX175Qa4ABie0RmoGc7xdJ55aP7meFXwzJ6RIyO5NibbXT7SgpcwscMDua8edm4fZichzwUxJ6VjQzjK1BBqq/Q0H+GwYlavARFBCgxfqPa/KDVvx//zPiUDvjda+J2sjC5usyD/B3ateCCuXJ489bD4p1zTBBptqYMCKe2oWYoKnnqcRpY897W0ayNRRulis8KKh3YiQ0bdlOwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKrxDeZnlKUCUdQ67KRFxtD+3VexIWr9rARN1nAHmgE=;
 b=kV/1PjjAyrw9LE2H7qj1TfeMG2EkwcuhnT52OsBvTkQDYocIbp2NEypIPspQaSD72V2Ij45JlAEbjKTctRhd1IjvgN4Map6i8Wxiee13iq7olswEX1Boq1DfwyWp+Ax/IN+O+i8HEm2RXpDt18ZlZzlI5+kowksOYrXSaYuE1xLRmdkPnX+Sh0UP68nquNNNcr2eQtCPvgtidZK0DGWDT7nEGaejj5w3W1qvhCMT7BHoJiQvQat8fKqCnjDyQR2rN73XAceWXhZrdG9fl8BBesP6UAHH31ajrnKK31+MoZip2La7FMuwaxq/zVTwfcQoEQkc3JCg0j4ZfrPynR5UDA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 PH8PR12MB7026.namprd12.prod.outlook.com (2603:10b6:510:1bd::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 04:11:13 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 04:11:13 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 13/23] staging: media: tegra-video: csi: move
 avdd-dsi-csi-supply from VI to CSI
Date: Mon, 22 Sep 2025 13:11:05 +0900
Message-ID: <2325951.TLkxdtWsSY@senjougahara>
In-Reply-To: <20250906135345.241229-14-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-14-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0290.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::7) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|PH8PR12MB7026:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bbcac1e-be9f-447a-bb3d-08ddf98e117e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UU9YckxRdzd0Vmhmc29qdGk5L0NIZTEzY1JtWDBQa2Qwb1pFcEpxb05zYWEz?=
 =?utf-8?B?WkcyMHl0dTZGSmNCMWkzSFYrY1R6ejlsWUdUbTFFZWh2aUtjZ2tvMkpZamJi?=
 =?utf-8?B?SzVLd2Rjc1lNRGR2ZW5vK2VsUDVYMGtzVjk5NVNwTzlLbVU4UkFDN1Bwdlpu?=
 =?utf-8?B?ZzFaOWtBTWlHWGJ1Qzlpd2twU2wzdVRuTlNYSHJsOXBXVm1VMWdKUk0yZ1ZJ?=
 =?utf-8?B?STV3STU3NjNEdnZ2WTNGcVNXY3lMSFEyNEZOdG15WDlBOXBPRTVUbnNRZWNa?=
 =?utf-8?B?aWRSY0NvSzlZdXUzWkE0NGI2UC9ZZmdyc3FiSGJDNFB0SkhxQ1NkRU1Uc1dL?=
 =?utf-8?B?Q29lV3ljOEtSOWxhK0VSN3IweEhFYVNlZkNXbmw4bzVLOHhacDNBY0FxRmZ4?=
 =?utf-8?B?ZlFlWlREODRFb2gxN1Z1V3JEUVZTSCtSd3gyeW5lbWczL1RWUDRzWW1VSWdP?=
 =?utf-8?B?Wk51NzJDUjlJaDRmZVp3Sjc2QndoVENvbEhqZ0JWMFBKbXpaeHRPd2tWMlNx?=
 =?utf-8?B?NWpwZ3c4SWNZNE9oOEtCQXlDQXYxamJ6TlNGWEVTRHBXemRKeE80b3MyVExw?=
 =?utf-8?B?TWgwRUt0SUMxaTRjU0gxZVBkOVBUS2wvdmZzZEJsU0VIUGlySnpTT0dhdlpB?=
 =?utf-8?B?aWg0Q2JTMEV1K1krKzQ4SVhOTDR3MlBndU1xYkhBSHVpM2tUdHZiMDRyVFJq?=
 =?utf-8?B?Nkt4NUhoRDNuNXE4aHJHa3VvRkJiRGlGOVFwUUJEVC9tR3hZSlpzOUd2TlMx?=
 =?utf-8?B?YXo3UTFkN2dpWW44RzJPVHBTZHRLNFpKVGc5TS9VQnVBQk0wcGlnWE1yeXRn?=
 =?utf-8?B?dGxMNTAxa3ZVbmtvd29XeS9TaE5va0lKclJnMTVUd3E1OE1DbzhKeENBTGIy?=
 =?utf-8?B?Y0lKN0RZbTloNnprY3Q1K0RkbWd0WUlVbFl5YStvcmdGZTVkVzVOci9DQzVo?=
 =?utf-8?B?QUc4cm1oWHFYR0V6b1pSNE95ck5LcEhERmV3VVVMclVocU9sKzNTaHQ2YTJv?=
 =?utf-8?B?Qy80L1hUVDh3RUZrRjBBdzVVbGNUSjBjZDA5TjlmK2ZITER2Z2dDbm1LL2dp?=
 =?utf-8?B?TnVHRkZlcWhIT2NVWXMrNjhoNDhRTEJuS2FZaWk2NXN3K1pnSWhaKzVoWXhp?=
 =?utf-8?B?K3RrcHVLYWYzVkx6WXZoWHoxR2x0cXdnbDhLa0dvQlJLRlVrZktSZ01WSVZa?=
 =?utf-8?B?STNvWmkyU1ZZZGNrUVQvRVh5VlhzekVPWjUzeHRTMFpLb21YZlpHMjkvKzBh?=
 =?utf-8?B?M3JFNzV4VUZlZlQ2L1AvaFFhYUhocXVCQjRPSnRSNW0xS0hxdkQvV1hyVjBC?=
 =?utf-8?B?U1V0MkpCL3ZMYmFhRE1iWWZqeU1Ib2pmMExEeXRrK3AyT1hqc3BBUUYvdC92?=
 =?utf-8?B?NjhidTZRNHB2emRwZENKaXRPeGtiYUd4VUk4THM5a3hCb0Rkd1kvN1owUC9K?=
 =?utf-8?B?VVlES0NYTkVEanNkZVl1R3piTDlJUUlNRG5qNmhpWGMrMmcrUXZxQWErYis1?=
 =?utf-8?B?TnZrUzZhOU81clhORldBTGJBVGtzYnR0OGhzcHpZS1gxTE9ISFEvK0F2K2Qw?=
 =?utf-8?B?MjFHcU9aZk5UODVKbG83eHA0QUdZaHRhd2ZXdGdkWTFrdVp1TWphWllHSWMy?=
 =?utf-8?B?ckcrdmZjQ0xYa1hkTm81dTVkRWV5amtsNGFzb0F6SjNzQnpSRVdrYUVnZXlh?=
 =?utf-8?B?YkQvdW5BVS82MTc2QjhaOVdsRXVjeGEvRGxRVXhrb1RsZVBGSkdDbGZjc0ZF?=
 =?utf-8?B?U0dnSzh1TDBqa1VraG1sN1BPbnZDR1NudXlsMjRWMk0vQWIzbk5HT1lCWlhG?=
 =?utf-8?B?OEtvVDlqb0EyTFlxVjlrSnlNSDZNWUVMRCtlTmEyeVlHaytzTndtZm1lMk4z?=
 =?utf-8?B?Z2JBdnhpTndmLy95dmN0TmxkcUJ1Y0VpbnR4Y1FWUUJiSHpIc1Aza1VUZklW?=
 =?utf-8?B?aUVDbVY4eFQ3RmZpa01yODJLRjQyaFFhZHlCRE42UFBYdWVhbkgrcDdISDZt?=
 =?utf-8?B?anhZS3ZNVlNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTR0SktTTzRGTXZtWFRYNGFIY1RURTdsdXJQdVpvdmJ2Z0J6c1VRa1NqYllF?=
 =?utf-8?B?RUlZUVVibzcySG9HUTdZL2ZCZ0dRVkgvM3hRdHRvNlRXOVNUMU9rZ1JWd3o5?=
 =?utf-8?B?WE03TitRcG9jWHMwODBlZUFTZ2xya2xZMlVRbGtLUmh3WnNDVHhnc2VwMWxB?=
 =?utf-8?B?Mkl4Njk1OURLd2JuWitwV3JucEszd2dIY0dLcXdHTWY2eFJKS1NWdU1Ec1Nw?=
 =?utf-8?B?bStsa2xKYVVRT3ZIaG1GMjhXREtqdnMwaUxmSHNzTk9seGsrZUhDK1hmeFpK?=
 =?utf-8?B?WnRvRTcyeFpSN3NtUDlVcFJjYldPYlh5dWhVNk1oWGRMSFhlT0U2ZGQ2eVov?=
 =?utf-8?B?aVgrTmhRUTlPdzF3bUNrc05GT3JpUHNVUFdpd3ZBS2c2OGRLZFZFek5sNXNX?=
 =?utf-8?B?RHRPSldTK1M2L3ZGZzF5WjdLdTlnSEVpSFN6MVgrbkptZlEwNGtBaGZDaGdZ?=
 =?utf-8?B?YnpWL0V1OFBsYlREbXpvTkRVUG9UeW5VdzBuTkl0Z24wKzZsZ25MNUVKcEhI?=
 =?utf-8?B?WW9uRkdZRmxkOUlVWVZ0U0dOSXFweisyT3VDeUtuM2NnUnB2VnZSVXJLaWRP?=
 =?utf-8?B?NE5Td3B3Q01uZGp1dmZXZ0pjWWFCN1JMQmFCbjlYSDRFVkREUkRBd21YcHN0?=
 =?utf-8?B?NnlCK3FtWlpkbXJvWFdxNVZONHcvWDZOeHQ2TWF3SWVPRk8yVlhBdWt5MkEr?=
 =?utf-8?B?Rjgzak0yRzlGUEhTY0YrWDRjcUdvOFc2L2V5bzJuM1VZdnI0MUplUWI1cDdO?=
 =?utf-8?B?b01MUDlwL1hJWk9mSlZuOTFxQ1pvSjkwdGNyL1VQbFppMXpveXhlMkI4eUUx?=
 =?utf-8?B?UmMzY1dTUXAzMGx3RTA2THJQTjJoQlhBVHIvUVJZMWxScHd3ZTFMeWE3VWt1?=
 =?utf-8?B?UGRmWmR5QzFMQUxiN3RLektGOEZTTjkxN1hFMGc0QjRQeGJCZFpWVDJiNmRR?=
 =?utf-8?B?NHJlNmNMTmFpanFCTjZrT05QaUNUempTNEFVSGVlWTRuMzV3STlJQ01LZW0z?=
 =?utf-8?B?YUJOcWVka2xUaXF5bjNrTWZOQ2tFbytFMmdwVnBYM1lmeUxyQW8vYVFWQ3or?=
 =?utf-8?B?NHk1b0YxZXE4UTBNb2tHY2l2dWRwUFJZZU1ta0dmMjExYWpjeEFCT2hKZmh4?=
 =?utf-8?B?VlczY1NCQWNleitVL282SldzM1hlbzlLTlh5WFFGdmJEUFpwQXptQlp2S3o1?=
 =?utf-8?B?Y3ZiSWhhNEJ0Nk5Lckl6WEd3UDBRUEVXR25nM1F2VW1yeDFib1VvZVhiTHNi?=
 =?utf-8?B?WGFQbUNDbURKUm8wbGhwRmZ0UmVBdmFELy8xT1U5Q3B2STdUSmJlNzlDTTI3?=
 =?utf-8?B?TERFQU9laEZ3TWhvYjhjODFCTS9hazd5VVBsZFA5Uld5SXBCQWdxbHZqanA5?=
 =?utf-8?B?a3NzVExndmxRZ2J6MG1xTXh1dDNqckh1WWVZOExEOWF4RE5kOGZ0SmwwdEd2?=
 =?utf-8?B?dm90SlZzNEVNaGlzWW5EVWxEUXZWd0RuNkJQSjc0cGl0bjM0R093WUZ0U2lt?=
 =?utf-8?B?RUJhMUpYUnBHSjk5aFNWNEVCTEYxQUtCTmVia0paaTA0TGlTektaa0FzY0pp?=
 =?utf-8?B?UXI5WTE4N1M1NEV2NG5LZnVpNUxoUFowMnVNR3lIaWxhUWVLU0p3UEVGcDFV?=
 =?utf-8?B?b1FDWGVpTGJqRzIzaXdEM0k3ZGE0VWhXRXcvNmpjUThJZFhWY1g5TDk5Z29U?=
 =?utf-8?B?ajJoN1FLeWJadUNEZW81N1h2Y3RUYUlqS2tGMWxjcW92K01sRWpTS0UvZ0gz?=
 =?utf-8?B?SEhqY0dpUkNabFFQNXErYmFuQ1IvR3IvUkZVdDhSczFwS2VwbGZoWm9USVNO?=
 =?utf-8?B?YUtOS2dma3NSZHdDbStFNDBZQ0VGUVdVOUZrVmRjNzdGU05FZTlyUXJNRjdi?=
 =?utf-8?B?QmV0Q0ExWUVaWnN1R2pFVzdCV1VPdnRjRzg5Y0xVQmt0b1BPd2FHM2pmbDNx?=
 =?utf-8?B?T1h0UmZuak1uOW1sMHBNL0lZR0ttTTBIb2w0aDQ2YmhYWG16QUsyQVcyWEZY?=
 =?utf-8?B?MFZRZkRtWUJORXNLY2FmYkdDbXVQRkdIdkdFSHhWQ2w3K3BzSEZVbDlnTkEw?=
 =?utf-8?B?VGpVQ2VjWjYxRm5FRGVrYk8zbTZzQUlOcWp6ZmE5UHo4YlZwYXE4ZEp5WGRk?=
 =?utf-8?B?M3Z2akluazRqVEpiMSs1UXpnRXZlNGwzd3FPK3dZOHFUeWN6VTUzRWZuYXFz?=
 =?utf-8?B?NzRnRFh3M0NCcDFJSktsLzJQSTdHNjNUOUxCMWxUYmw2YTFYWFczdForSUhR?=
 =?utf-8?B?VzhQQWlmMUxTWTMyb2pWNzk4cUVBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bbcac1e-be9f-447a-bb3d-08ddf98e117e
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 04:11:13.4079 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPXNLpM1tkn24/3ckfm/2Yrv1crWcUx90i9CrItLSXLFwjko4kMUZRS1XsDUipUQPTMsUGLwaw/xqKlUc2o26A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7026
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

On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyatoslav Ryhel wrote:
> The avdd-dsi-csi-supply is CSI power supply not VI, hence move it to
> proper place.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/csi.c | 19 ++++++++++++++++++-
>  drivers/staging/media/tegra-video/vi.c  | 23 ++---------------------
>  drivers/staging/media/tegra-video/vi.h  |  2 --
>  include/linux/tegra-csi.h               |  2 ++
>  4 files changed, 22 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/csi.c b/drivers/staging/me=
dia/tegra-video/csi.c
> index c848e4ab51ac..1677eb51ec21 100644
> --- a/drivers/staging/media/tegra-video/csi.c
> +++ b/drivers/staging/media/tegra-video/csi.c
> @@ -710,6 +710,8 @@ static int __maybe_unused csi_runtime_suspend(struct =
device *dev)
> =20
>  	clk_bulk_disable_unprepare(csi->soc->num_clks, csi->clks);
> =20
> +	regulator_disable(csi->vdd);
> +
>  	return 0;
>  }
> =20
> @@ -718,13 +720,23 @@ static int __maybe_unused csi_runtime_resume(struct=
 device *dev)
>  	struct tegra_csi *csi =3D dev_get_drvdata(dev);
>  	int ret;
> =20
> +	ret =3D regulator_enable(csi->vdd);
> +	if (ret) {
> +		dev_err(dev, "failed to enable VDD supply: %d\n", ret);
> +		return ret;
> +	}
> +
>  	ret =3D clk_bulk_prepare_enable(csi->soc->num_clks, csi->clks);
>  	if (ret < 0) {
>  		dev_err(csi->dev, "failed to enable clocks: %d\n", ret);
> -		return ret;
> +		goto disable_vdd;
>  	}
> =20
>  	return 0;
> +
> +disable_vdd:
> +	regulator_disable(csi->vdd);
> +	return ret;
>  }
> =20
>  static int tegra_csi_init(struct host1x_client *client)
> @@ -802,6 +814,11 @@ static int tegra_csi_probe(struct platform_device *p=
dev)
>  		return ret;
>  	}
> =20
> +	csi->vdd =3D devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
> +	if (IS_ERR(csi->vdd))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(csi->vdd),
> +				     "failed to get VDD supply");
> +
>  	if (!pdev->dev.pm_domain) {
>  		ret =3D -ENOENT;
>  		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/med=
ia/tegra-video/vi.c
> index 2deb615547be..05af718b3cdf 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -1405,29 +1405,19 @@ static int __maybe_unused vi_runtime_resume(struc=
t device *dev)
>  	struct tegra_vi *vi =3D dev_get_drvdata(dev);
>  	int ret;
> =20
> -	ret =3D regulator_enable(vi->vdd);
> -	if (ret) {
> -		dev_err(dev, "failed to enable VDD supply: %d\n", ret);
> -		return ret;
> -	}
> -
>  	ret =3D clk_set_rate(vi->clk, vi->soc->vi_max_clk_hz);
>  	if (ret) {
>  		dev_err(dev, "failed to set vi clock rate: %d\n", ret);
> -		goto disable_vdd;
> +		return ret;
>  	}
> =20
>  	ret =3D clk_prepare_enable(vi->clk);
>  	if (ret) {
>  		dev_err(dev, "failed to enable vi clock: %d\n", ret);
> -		goto disable_vdd;
> +		return ret;
>  	}
> =20
>  	return 0;
> -
> -disable_vdd:
> -	regulator_disable(vi->vdd);
> -	return ret;
>  }
> =20
>  static int __maybe_unused vi_runtime_suspend(struct device *dev)
> @@ -1436,8 +1426,6 @@ static int __maybe_unused vi_runtime_suspend(struct=
 device *dev)
> =20
>  	clk_disable_unprepare(vi->clk);
> =20
> -	regulator_disable(vi->vdd);
> -
>  	return 0;
>  }
> =20
> @@ -1882,13 +1870,6 @@ static int tegra_vi_probe(struct platform_device *=
pdev)
>  		return ret;
>  	}
> =20
> -	vi->vdd =3D devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
> -	if (IS_ERR(vi->vdd)) {
> -		ret =3D PTR_ERR(vi->vdd);
> -		dev_err(&pdev->dev, "failed to get VDD supply: %d\n", ret);
> -		return ret;
> -	}
> -
>  	if (!pdev->dev.pm_domain) {
>  		ret =3D -ENOENT;
>  		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
> diff --git a/drivers/staging/media/tegra-video/vi.h b/drivers/staging/med=
ia/tegra-video/vi.h
> index 64655ac1b41f..367667adf745 100644
> --- a/drivers/staging/media/tegra-video/vi.h
> +++ b/drivers/staging/media/tegra-video/vi.h
> @@ -93,7 +93,6 @@ struct tegra_vi_soc {
>   * @client: host1x_client struct
>   * @iomem: register base
>   * @clk: main clock for VI block
> - * @vdd: vdd regulator for VI hardware, normally it is avdd_dsi_csi
>   * @soc: pointer to SoC data structure
>   * @ops: vi operations
>   * @vi_chans: list head for VI channels
> @@ -103,7 +102,6 @@ struct tegra_vi {
>  	struct host1x_client client;
>  	void __iomem *iomem;
>  	struct clk *clk;
> -	struct regulator *vdd;
>  	const struct tegra_vi_soc *soc;
>  	const struct tegra_vi_ops *ops;
>  	struct list_head vi_chans;
> diff --git a/include/linux/tegra-csi.h b/include/linux/tegra-csi.h
> index b47f48ef7115..85c74e22a0cb 100644
> --- a/include/linux/tegra-csi.h
> +++ b/include/linux/tegra-csi.h
> @@ -139,6 +139,7 @@ struct tegra_csi_soc {
>   * @client: host1x_client struct
>   * @iomem: register base
>   * @clks: clock for CSI and CIL
> + * @vdd: vdd regulator for CSI hardware, usually avdd_dsi_csi
>   * @soc: pointer to SoC data structure
>   * @ops: csi operations
>   * @mipi_ops: MIPI calibration operations
> @@ -150,6 +151,7 @@ struct tegra_csi {
>  	struct host1x_client client;
>  	void __iomem *iomem;
>  	struct clk_bulk_data *clks;
> +	struct regulator *vdd;
>  	const struct tegra_csi_soc *soc;
>  	const struct tegra_csi_ops *ops;
>  	const struct tegra_mipi_ops *mipi_ops;
>=20

Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>




