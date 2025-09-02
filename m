Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DE2B3F1C5
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 03:10:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B67410E557;
	Tue,  2 Sep 2025 01:10:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Q3bZgqcE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44B810E557
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 01:10:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BscJ40ZCqlrZ3VbmnzX4TLGWRKfeycxWeBxqp5viirMBkgqrFw6UKLE/WCXrpoII858nudGT0GbkeQ8pSJ/hGehVLDQuypSM2QKgfP+l7cm1cr7n/BzXufRwgt3d82YuNWfYLhaWMbsCdIujAqAxvKiy3EAB7FQjc+E3nAWN5GNBxTG2iX1VV4aTlCSf+AdvI1WCWuD4kjceiP+5wLjth5Cw72uMKwQ9A2gKywKhOpLHPjdnyadXPxyOl3SLDVzyek3UoZTIN/K3XX4lQZlROjL33Hws08D0a22qrwrH/bIRpdnCR73hsf9HAgBxXdRyipRkFmbax3QFtxc8y+c5Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hLUF5vnydYALl38yZfeVPrh94rrNE789iZjuvCavE3g=;
 b=qZeMa3w4YH6fqKApE25VEr/QFYoasOlXsTroRGU94jk1BQTbM+RKiJCl1JXue0R4T0fYQ2N5celh6dK9XUD6hIDqC7eAI9JO1hnHNSBAz6y0P2HpvwoSROVc/8VaLjUW5zbFGvGkMZDPCtbco6+O3vG3wzMXQcKXpxhfM9FZM7FXbSAOz0mdy/JbiZUMoZclgMAqUxWUrcIyy3DV0WaAS78whJp0UUekYPsZ98B0H/e5RhwMPxk0LggP5fvqn7BIL/U9F1T1R7MbpeO3i+u2ipgeP1s+5CHUZIYnOIjHqcWB7vsfExRm140x0dElSU9dp14GhJOUO9WU1eEhp5WYlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hLUF5vnydYALl38yZfeVPrh94rrNE789iZjuvCavE3g=;
 b=Q3bZgqcEt+n+b7t5gkVpceoTThrqkATCd7u35eRRa25zkuBUF7pgQbyiJmYVVfTpAKk0M2yi96aBvGlr9vF1ntmRCkAV0jmIRplo/1H4szIOs8uYJuXAOCkc8ybZ1ufjmoRIV5p93ETA1IxeBcj6Q+1Qmdc7JdfsWBwGyjfgzdDbvLmYuCRTqPoK5iGCiqZD4ik02WxS9DC/x68II+2aoEHFdO0rFBERmjCr5ysjAY7k8RL9s4d3lRkVSXI3LbFvutpCbfKo1WxkYkPP7ASXkWACbbSzk7JdUc+74DoqzwqbHT/5kWCGhvm4g1lUKTlJX/OJvqyPj5N0mL/+oz0xyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 CYYPR12MB8992.namprd12.prod.outlook.com (2603:10b6:930:bc::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9073.27; Tue, 2 Sep 2025 01:09:50 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 01:09:50 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 15/19] staging: media: tegra-video: tegra20: expand
 format support with RAW8/10 and YUV422 1X16
Date: Tue, 02 Sep 2025 10:09:47 +0900
Message-ID: <3765586.e9J7NaK4W3@senjougahara>
In-Reply-To: <20250819121631.84280-16-clamor95@gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <20250819121631.84280-16-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP301CA0064.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::16) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|CYYPR12MB8992:EE_
X-MS-Office365-Filtering-Correlation-Id: 189c6230-4673-4011-aff3-08dde9bd6a3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clQzbHNLQ0ExcWZGMm5QMzFGVlBRMDJYUlEzbjRWM2FzNi93bGdacEFSTEE1?=
 =?utf-8?B?NktUaWo1bXVxbWE5bUZOTUNiM1drSEdDbStmcHFOSVRQSDAzNWhsUlhJMjRX?=
 =?utf-8?B?djRPditoM2pWeFVqazNvemhVZTNiRnUwZmJqSjRrZ1NKTlVzaEIyZnZYK0hF?=
 =?utf-8?B?WnNxRzlkRHhGbStMdS91eTVJMXBqOVJhMC9ncmdzT28zVmdma1FnT2FLOWkr?=
 =?utf-8?B?QkVyL3JmdXN5OTFwYWNOWDhBRVQ0dEcvYVVyL2g2WlpKSXp4SVJGR1lETENx?=
 =?utf-8?B?K3kvUEVHamNOZTg0b3RQOW1JbjZieGIwYW54OGxydDQrS29ZNUMzRmNORWRo?=
 =?utf-8?B?enJuc1BIL0IxaHJiWGVJM0NQSlRyT0ZzbFZHNWo1cjJxS3RmTkw4bnkzNDRm?=
 =?utf-8?B?RkZua2d6bXdYZ2s3V0NOUndCVmxjai9BbklWRXJGM2FRWFRjd1locjdkZ21I?=
 =?utf-8?B?Wm1tV0trZkFaRkVvYlJXTFQwdjdYV3pFSmQzTkhxU1lKYTdKRWppanFQSHJn?=
 =?utf-8?B?bGdVYjJZODV5R044c3JsenZ3UHZZbS9xQTNuV1FrbVUvNjlaSGJZay9tTGlS?=
 =?utf-8?B?dlpVaGNweE9uc3pEbW0rN1JYOXVBWk05blA2dTRqZVMyWXJOTU15TnArT205?=
 =?utf-8?B?dzFwdU1WKzd4bFlHTEl4VnlJYVJSOXJNN21BREVMTGNSWFN0Y2lsb0Z2WXVt?=
 =?utf-8?B?d1c3eFEzNTlIMklkNmVwZUllU0tOOWpIZ3JhUlAwMm5kcnBEeXdCaDkrNEdh?=
 =?utf-8?B?TEttdW9NcUpFNEg1WWQ0cE16dkd5NGV3TElHWEY1dGJBbVhYQ2RaWFlZdS9K?=
 =?utf-8?B?SlZYVXhLb0ZKZmR6bGJ0Qjh1Rkc4T3FwZk14L0ZxU29idjJjc3RkYlpCZEJC?=
 =?utf-8?B?dXRFemwwbk1LbTBUTTJkSTlHR0VFNXVVWU4zZkJkdTlkZFdHMVc2REQzTlBh?=
 =?utf-8?B?MGlDdW9WUHZJNGRRZ1hWTFpwb0MrTHhmeVBQZVVMcFdhcGxaYkVnSnBKVm9L?=
 =?utf-8?B?b1lJd3ZMWVNqMkxJMlhCUUUyS2xvTURtSWtnTkxIUmdJM3Y3UHoxdi9vVU1J?=
 =?utf-8?B?ME5TSWV4aFlEckVDNEwyeEdMZkVuTUJocVhkWjFxQ1pYd0IydldWOElSU2ZT?=
 =?utf-8?B?OENocmFjMGNlYkxwRTMybE5jYTJmVmpmUGwzbkxjdWw0NGVzZUtsV2themFG?=
 =?utf-8?B?Vy8yY0xPMHFZdWYva2hKV0ZneGxCb1kwVVYxZEV4bngrNVJXdzQ3K3Nzbm1y?=
 =?utf-8?B?QVlCZFVycFJhYnJKYVNHemVibGQwbWZzWVlNT1BPQWwzQWkrNHJkaGh6K2VI?=
 =?utf-8?B?eUxndXFpd1F5c2dYNytaVGRaREpQeHB6dFp0QWNBbmg0aXBZWC9WV3dlYm5P?=
 =?utf-8?B?aFhTSWx1VUNDMTVvNmVuR3RkWERSRCtVdU5TNW4xanVjK0F3RVlrQVJsWDhw?=
 =?utf-8?B?eDhrRXJ2MzBQcjQzT3RRZ29leVJ6a3RBTUppdDBtcytSMEpjL2xTOUFodmVI?=
 =?utf-8?B?R1k0dmV2NUFVK0o5b1ByNWp4dE5WcmZCTS9OZmpkSUVLeFM4alh1ZjdJUStD?=
 =?utf-8?B?eS9yUnE1NlJSMnh6NTU2L2w0UWsrTEZVQUYxbnVPb0hPQnp5UFFGemFYT21t?=
 =?utf-8?B?L1VVQ0lIaXo0a1Z6ZzdRZkgyazliTC9wMFRBUnU1RWN2S2NzeFJsVHpMclo4?=
 =?utf-8?B?anVmRXJROUJvcWZrd2NYRWdXdnJKK0tpbVFBY0dEN3k2dkZIRkxjcWZ1WW5L?=
 =?utf-8?B?eFRJQWdmOUFJYi94dlN5bGcxYnNLT1BjZUpNNkVZZFBlYm9IeDAwbjNOamli?=
 =?utf-8?B?RzFpcS9rbjF0VHpNL3RwOGhLTmxveC9RNzBkYnZENnZ4andMRzB1ancybVNn?=
 =?utf-8?B?VmdJT0NPM2ZrSEMrTkRUTGZQM1Z4ai9vMXVLcGd0bVFGK1pETE5Yc3RhR1p0?=
 =?utf-8?B?YnA5aHRWM0RwU2FDdzhxNDYxTWdacUpCanVSVmFMeTUrVE42d2F1clVyQzBG?=
 =?utf-8?B?dXc0VGp5U01nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0lRSU1kNW5HOGFxU2hlUGNWWEdybnVaK2RCY1NpQlYwMFk1VitnSHcrd08x?=
 =?utf-8?B?eEYxN2tRZmptS1lxanhWL2c1R2t0N0h1emZ0UjhRUGYxNklYZVFjV3ZFemIv?=
 =?utf-8?B?MW50MExpREVNQ1kwUytnUDdGQ2dDUUtNdEV6RVdGYk5TUmJoQ3VYVUJRbGFw?=
 =?utf-8?B?bTJvS29qbFJxV2duUjFyUU05MGd5R0NSMzFvYUxxQks1MWk4UUJqOEttOGI0?=
 =?utf-8?B?TU5yRGI5bXBQdzJONnNxMlhnK3lLTzBTZzU0K3A0eGY5b0ptc0RnbkN3NnlK?=
 =?utf-8?B?T1FmQ3Y3eVBSYm1NbHY0Qjl2OXpUMW5ZSWNRam5UdEdSSGZQb2FyK3F2c3FJ?=
 =?utf-8?B?MGF0V1BpSVpST05pSFczcEpHRkNNenVvU0lqZnBtdHlmRGQ2MlJPMFAxMlk4?=
 =?utf-8?B?WGNWSVBuQzA4UXBOcFBKeEpDc0dsY1BsOXhvUUMwdEIyeEZNRnVCZUlxVG1C?=
 =?utf-8?B?WWZVOUsySW9nT21POTBzMjlPRmRDUHRxRG9CR2NPeDdGTVJ6NklKUm9PZXoy?=
 =?utf-8?B?KzNycDlmS3cxMG1WVi9wM1JNMWVSMy9PQndUcjdzZVVtQkVMemVFNFZrdXZU?=
 =?utf-8?B?ZzlvV0VMb2EyQXJFUHM0Z0wyTHNhRVlHK3VzVUI4eU1IOTJTdS9PdUkwUEMv?=
 =?utf-8?B?TTJsb0Q1UWd6RTBOVGlsaWRUNUdETVkrWmJKU2x0dzgwc3J3Zk9SNXRsUDFr?=
 =?utf-8?B?TzNSTCtac0dtdUZaWnA3L3AvTmpHLzlSOXZNZXljdWNmaUVZaHFybzJoVkhP?=
 =?utf-8?B?WHFuekkxejB2aUppY3RoRGVYUXFORE84QWgrMVhhR1JZaFlsNGg3SnZqSDNx?=
 =?utf-8?B?ZUNNaEtXT1JsQlhGOGM1OUJBbUEyV2lacDZzWWxrL1BPRUxBeEZVMS8xaEdN?=
 =?utf-8?B?bGlhRGxCZnl0NFJTN284UkZGRXBlUFNRVEx5S0hRL2JJY1VOc1BKRS8vOE54?=
 =?utf-8?B?R0c5K3B5a1dRbWloQ2tTVXExeWFmMlVRWCt6MU9qQnd5QkM4L24vSUtZRnBq?=
 =?utf-8?B?UTYrUUE0dHk3Z1dvaUd6TUVSaG9VNk43WnRuNTNzWkx2M0Fvenl2L1pxcGFu?=
 =?utf-8?B?U0UzN0xydjhRZEtGL0tUTW5OMUtvQnhJUFQ0OHRIemZhaVVjSHRPNnBSNXBa?=
 =?utf-8?B?ZERMVnhDSVB5TFJmUTVZbDhTaUFSbUxBcUVDTTdoaGpHSGhEQk5CMHl4NDli?=
 =?utf-8?B?VDhzNHYwYWdpcVhCMDQ2WUdkWkRJb29CaVFLTXRGQ2pHM01DSytpV3ZkMk9W?=
 =?utf-8?B?MFlGaTNLdkFuNm1SS0s3VVJsOHQzcFR5Qkl6akp6MWRtWEdQVWxLR01aZHVR?=
 =?utf-8?B?am9abjlmNklZWFhOZ1NqNFIwakRBVEpONUw4Y2F4S3lsVndVMnRyckd3WEZk?=
 =?utf-8?B?L1dwM0hMeHNrRHc5T2I3bVdmTzd0NzhWOWhNNjZTdmJLQzV5anF2c2pOUmtK?=
 =?utf-8?B?RTZESHRTOVJvNmdvRThSTktORzdvQ2RlNGNoMFJOS3R5aDlDMGVpRWRKMzlw?=
 =?utf-8?B?NnVBeUw5Z09DUk0zeG1aS0FwdzR3NkVHRzd0cGpTREJ5NmoyekZ1L3VLLy84?=
 =?utf-8?B?UllVQzlGaHJ6UDB0NElYNUZ5NlBORUNPT1ByK1c1WisyZFp1YXNmalVyT1FB?=
 =?utf-8?B?L1AzeXJkeGdjVHI2cFZrVU9VaEN1b0cxZ2Npcm9aSk12RGQ2d3hBV2F4VGh6?=
 =?utf-8?B?ckZNKzQ4MnpYWmxYT2k4QTlZUi9qTVFMVUppUVZ2VnVMNUFFbFZjU1IvV1hh?=
 =?utf-8?B?c0F6cHFkYjdaR05yZGhNb2xiUWxpUUlFcEIxajYrbFdHZEpCS1ZCTkoxQmRD?=
 =?utf-8?B?MnZtOHlydHlaVE1lRWJUZ1h6S0pnSFEwZ0lqT1ZOaURaZHZRN2lqMnIreXln?=
 =?utf-8?B?MjErRmMzNk1jdStWS2VnUlphY0NZbVNOU0VaMytNWGJtclZEU0RRaWwyNWFS?=
 =?utf-8?B?U1gzV2orV3NjOVIrNHl6R3RQWm1MK1JzdUxzMnRJMDg4WE5USC8rVWoxSDA4?=
 =?utf-8?B?d3dhbEFhS1plWXNhdG5aajd0Q0tqd1BhK09tc0svTklVZXNrWXdpWTlEcjdP?=
 =?utf-8?B?aVB0WkQ3SkR1Ti83dXNTVlhPRDNZNGszM3pxUnZNYy9NM0x6TFVJdHp1SWN6?=
 =?utf-8?B?MzhtNzkzaHNqaldOajZCQ3JyK1pmNlpoQ1ZYakI0ZWwwdEppWVFJK1NYcDB0?=
 =?utf-8?B?Tng0b3llaGNJSXgvRTRsd0NzK2l0UUkzaUljdnc1dERNTlFmQnF5TUoxOHVI?=
 =?utf-8?B?dzZpeU1UNklXV0NKOEdsR3I3K0NBPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189c6230-4673-4011-aff3-08dde9bd6a3b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 01:09:50.0175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WoAeIPpjo2mB9eh8egHU8wFnzyukKAmAUqElvaWRnfZQAmdrr46kEt467mcbgpStsRUukLmnc2VJzbgM6dHgaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8992
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

On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> Add support for Bayer formats (RAW8 and RAW10) and YUV422_8 1X16 versions
> of existing YUV422_8 2X8.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 71 ++++++++++++++++++++-
>  1 file changed, 69 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c
> b/drivers/staging/media/tegra-video/tegra20.c index
> 67631e0c9ffc..b466fe7f4504 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -186,6 +186,18 @@ static void tegra20_vi_get_input_formats(struct
> tegra_vi_channel *chan, case MEDIA_BUS_FMT_YVYU8_2X8:
>  		(*yuv_input_format) =3D VI_INPUT_YUV_INPUT_FORMAT_YVYU;
>  		break;
> +	/* RAW8 */
> +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> +	/* RAW10 */
> +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> +		(*yuv_input_format) =3D VI_INPUT_INPUT_FORMAT_BAYER;

Should this be main_input_format instead of yuv_input_format?

> +		break;
>  	}
>  }
>=20
> @@ -220,6 +232,18 @@ static void tegra20_vi_get_output_formats(struct
> tegra_vi_channel *chan, case V4L2_PIX_FMT_YVU420:
>  		(*main_output_format) =3D=20
VI_OUTPUT_OUTPUT_FORMAT_YUV420PLANAR;
>  		break;
> +	/* RAW8 */
> +	case V4L2_PIX_FMT_SBGGR8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SGRBG8:
> +	case V4L2_PIX_FMT_SRGGB8:
> +	/* RAW10 */
> +	case V4L2_PIX_FMT_SBGGR10:
> +	case V4L2_PIX_FMT_SGBRG10:
> +	case V4L2_PIX_FMT_SGRBG10:
> +	case V4L2_PIX_FMT_SRGGB10:
> +		(*main_output_format) =3D=20
VI_OUTPUT_OUTPUT_FORMAT_VIP_BAYER_DIRECT;
> +		break;
>  	}
>  }
>=20
> @@ -300,6 +324,16 @@ static void tegra20_channel_queue_setup(struct
> tegra_vi_channel *chan) case V4L2_PIX_FMT_VYUY:
>  	case V4L2_PIX_FMT_YUYV:
>  	case V4L2_PIX_FMT_YVYU:
> +	/* RAW8 */
> +	case V4L2_PIX_FMT_SRGGB8:
> +	case V4L2_PIX_FMT_SGRBG8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SBGGR8:
> +	/* RAW10 */
> +	case V4L2_PIX_FMT_SRGGB10:
> +	case V4L2_PIX_FMT_SGRBG10:
> +	case V4L2_PIX_FMT_SGBRG10:
> +	case V4L2_PIX_FMT_SBGGR10:
>  		if (chan->vflip)
>  			chan->start_offset +=3D stride * (height - 1);
>  		if (chan->hflip)
> @@ -365,6 +399,19 @@ static void tegra20_channel_vi_buffer_setup(struct
> tegra_vi_channel *chan, tegra20_vi_write(chan,
> TEGRA_VI_VB0_BASE_ADDRESS(OUT_1),  base); tegra20_vi_write(chan,
> TEGRA_VI_VB0_START_ADDRESS(OUT_1), base + chan->start_offset); break;
> +	/* RAW8 */
> +	case V4L2_PIX_FMT_SRGGB8:
> +	case V4L2_PIX_FMT_SGRBG8:
> +	case V4L2_PIX_FMT_SGBRG8:
> +	case V4L2_PIX_FMT_SBGGR8:
> +	/* RAW10 */
> +	case V4L2_PIX_FMT_SRGGB10:
> +	case V4L2_PIX_FMT_SGRBG10:
> +	case V4L2_PIX_FMT_SGBRG10:
> +	case V4L2_PIX_FMT_SBGGR10:
> +		tegra20_vi_write(chan, TEGRA_VI_VB0_BASE_ADDRESS(OUT_2), =20
base);
> +		tegra20_vi_write(chan, TEGRA_VI_VB0_START_ADDRESS(OUT_2),=20
base +
> chan->start_offset); +		break;
>  	}
>  }
>=20
> @@ -446,12 +493,15 @@ static int tegra20_chan_capture_kthread_start(void
> *data) static void tegra20_camera_capture_setup(struct tegra_vi_channel
> *chan) {
>  	u32 output_fourcc =3D chan->format.pixelformat;
> +	u32 data_type =3D chan->fmtinfo->img_dt;
>  	int width  =3D chan->format.width;
>  	int height =3D chan->format.height;
>  	int stride_l =3D chan->format.bytesperline;
>  	int stride_c =3D (output_fourcc =3D=3D V4L2_PIX_FMT_YUV420 ||
>  			output_fourcc =3D=3D V4L2_PIX_FMT_YVU420) ? 1 : 0;
> -	int output_channel =3D OUT_1;
> +	int output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_RAW8 ||
> +			      data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
> +			      OUT_2 : OUT_1;
>  	int main_output_format;
>  	int yuv_output_format;
>=20
> @@ -580,6 +630,20 @@ static const struct tegra_video_format
> tegra20_video_formats[] =3D { TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, =
16,
> YVYU),
>  	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YUV420),
>  	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12, YVU420),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_1X16, 16, UYVY),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_1X16, 16, VYUY),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_1X16, 16, YUYV),
> +	TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_1X16, 16, YVYU),
> +	/* RAW 8 */
> +	TEGRA20_VIDEO_FMT(RAW8, 8, SRGGB8_1X8, 16, SRGGB8),
> +	TEGRA20_VIDEO_FMT(RAW8, 8, SGRBG8_1X8, 16, SGRBG8),
> +	TEGRA20_VIDEO_FMT(RAW8, 8, SGBRG8_1X8, 16, SGBRG8),
> +	TEGRA20_VIDEO_FMT(RAW8, 8, SBGGR8_1X8, 16, SBGGR8),
> +	/* RAW 10 */
> +	TEGRA20_VIDEO_FMT(RAW10, 10, SRGGB10_1X10, 16, SRGGB10),
> +	TEGRA20_VIDEO_FMT(RAW10, 10, SGRBG10_1X10, 16, SGRBG10),
> +	TEGRA20_VIDEO_FMT(RAW10, 10, SGBRG10_1X10, 16, SGBRG10),
> +	TEGRA20_VIDEO_FMT(RAW10, 10, SBGGR10_1X10, 16, SBGGR10),
>  };
>=20
>  const struct tegra_vi_soc tegra20_vi_soc =3D {
> @@ -606,9 +670,12 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
>  static int tegra20_vip_start_streaming(struct tegra_vip_channel *vip_cha=
n)
>  {
>  	struct tegra_vi_channel *vi_chan =3D
> v4l2_get_subdev_hostdata(&vip_chan->subdev); +	u32 data_type =3D
> vi_chan->fmtinfo->img_dt;
>  	int width  =3D vi_chan->format.width;
>  	int height =3D vi_chan->format.height;
> -	int output_channel =3D OUT_1;
> +	int output_channel =3D (data_type =3D=3D TEGRA_IMAGE_DT_RAW8 ||
> +			      data_type =3D=3D TEGRA_IMAGE_DT_RAW10) ?
> +			      OUT_2 : OUT_1;
>=20
>  	unsigned int main_input_format;
>  	unsigned int yuv_input_format;




