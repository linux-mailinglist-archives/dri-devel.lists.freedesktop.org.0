Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D326B8EF5B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 06:54:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D2F910E04B;
	Mon, 22 Sep 2025 04:54:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B7orMvvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629B310E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 04:54:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cXSZBbYzylql5RG32ymE05vq02Qif3V5+YA47HvTJTLZWMpcmMcJToc5dUjnEbOZUWpmFKUDR8d/aziYU1vqG63p+C0pD7oHwkUk3+LqXNEBXZIlVzqNh5ir4GXCvGTXUm+FTn6akTxAl/PrLLOevwvDjLWvfb70uScCQEw+j5dXuyiJGcj4xk1k9d47MCOyfeRje1xuB2ja3+rYQnqf4Q8VfX5KtpJbA4ZFrbcMzEgc7H+4JQfe7NpdH/u9cakUuT0ErLAdZ+/bAraQ1tXAA+OTTwjwnQAkk5sw6kO89Yc0xC6/0OAM4GJBV7C4jqF1sfSCp3LID/BXnpca/fUkwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cV3YqXVVsFlXProdwBlYg/jTAiTLK5HOQu281eAdHR8=;
 b=cCHVT8D6nHxWfORh3ko4O+sMmgyRgAAqeEKAd+B0LzWe6YX+7ulVup8ql++UQ2LldH/uxCnvIWivyzSp+z4mJSos/WWgeNDkx9CGnsfcU7fuRYz4kARr40mKSXlD6FFPCG14RUtNhdeF5d7jMLKRehwW+2nn8ky62AZUUVIQG0G5+sHOEoAh6WRtiWKmY63SKidtbJ4RkGzy1VX50iGpgFjVqEgC/IY3AhwchXBATKkhyG+BgMCKE0/6xnf2BduQKB+AUODw2zraxUIbl3kiWPH5cVdtD8lSeM+crDdL/jqUU2Ja/OyTW2cT3G+EC2C5+jUtHQuuzWBC+vMDQPD4GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cV3YqXVVsFlXProdwBlYg/jTAiTLK5HOQu281eAdHR8=;
 b=B7orMvvRNqWQAGrMpeLCwDjTUbwjqrLlg7D2meGyVrB6Tyzi972mC+tt7hftiPCGuz96YGIUUemiQ3dEtFvYB6QwchCtR/gOoaE8nivNgERMQcmFh13mosqoZOrlHI7QBcyl1YzcsN4rRxkAHr5aAh1cwXpX4qmTOdtjiKorn9KsOOl4Y57n28+vHPohk1RO/O2ny2cDVzl1xFEghXyMlyA0duEpAYcZysjo0WMUx4P/DeMkygbh2W2qhPgnd+rcFB1hNgaYNx8oco7/7bSDi0A0VjGxdu+bh5aYzc1VAP099d3Rl63EUuR5i02qFx1LV2/lJXkq8GFLCzbOyzEGUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 MW6PR12MB8706.namprd12.prod.outlook.com (2603:10b6:303:249::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Mon, 22 Sep 2025 04:54:24 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 04:54:24 +0000
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
Subject: Re: [PATCH v2 18/23] staging: media: tegra-video: tegra20: increase
 maximum VI clock frequency
Date: Mon, 22 Sep 2025 13:54:20 +0900
Message-ID: <2331830.3VsfAaAtOV@senjougahara>
In-Reply-To: <20250906135345.241229-19-clamor95@gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <20250906135345.241229-19-clamor95@gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCPR01CA0173.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::11) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|MW6PR12MB8706:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ec6ff0-f857-4773-ae14-08ddf99419de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|1800799024|376014|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S3VFY2NGajlKa2p0OVYyckc2Q3RHblpjSS8rR3BZbkVKd3lmbVVqblhuZlF4?=
 =?utf-8?B?ZXRDeHdEOHhTRVpsbE9RQlZXaU4rTGVjVDRVL0xSWjFySmd1VFV0SHgxSjNn?=
 =?utf-8?B?T25RRG1aRHN4NXQ2VHRObHNrcGNXRlVLd2hRM2h1OEp0U281VFRmVFZwMkI3?=
 =?utf-8?B?bGkraDRDZE9qbFFyYWJuTTgrT3RSRDdBdzcwdEJXMDBrQ1l2dUVDeDdSaXdF?=
 =?utf-8?B?cDRmcGxEd3hLd0UwZERFb2xnSGxKL3NkVlNkU3V2MUxjZnVkVTQxK1ZsNWZS?=
 =?utf-8?B?bFl5TFYyNWFQUmEvWGdNaVYvdEE3NGUveTJTUGFjZ1hmN2ZqRkk1SGowK1Vv?=
 =?utf-8?B?bktiSy9xZlA5RE4yMlVCeDRGNERaamtRZGtXMW41OGhpVzk0VTRiMTRpeGxN?=
 =?utf-8?B?UnVTUEtsQnFiakNVOXJad2RNOUJzdHVSZDhhbkp3SzdxekVCYnBJaDA3dmJx?=
 =?utf-8?B?K3pXNEdRTGZZNml0S1dBYnlwdk1FSjZMSEtsdE5hbUpMOW5Nc2NvOXZkTUF5?=
 =?utf-8?B?QlI2K3E4V09iUU16c3B4REh2empWUHRGd3JIKzNjSmFBbGYxNjJnUGVLVzFB?=
 =?utf-8?B?TkRxVjNWazVoMFdUT2puVG9KS1o0eTF6V1M1SjFzL29yT01UbUtJdUloZWR3?=
 =?utf-8?B?elJIdXFIQlBHV0h4R0duMDJmRFRuRU1NVG9EbkU3ZzNSZlVjNXVRTHJ5dDhJ?=
 =?utf-8?B?Vk9CVGhRVlpiT1dGdGpiYlNGKzQ2c28vSDZScmkxa243VnVDdEJrbW8yWWRE?=
 =?utf-8?B?dEFFZlVGaG5FYzdZSWtFeFM5VnR2WGNRYzAycERPdlk1UFpkMU9TZnJIQW9w?=
 =?utf-8?B?N1o4Sm1MREdIdllITGFVYURYVzN1WXNHWWlSdHN1Zk8vVTg3SzFOb1VoQXdU?=
 =?utf-8?B?YUNLMk9YNTQ4T3dKTG1MZVJXeTlsakNNc2EzYXlMdmp1dFMwNis4cmdtWFl0?=
 =?utf-8?B?Q2IxT2V5Sk9KOGNkRkFPREFObWQrYXd2WmtBaUdZYnVjS3dmdnhFWHlHVjMx?=
 =?utf-8?B?aWZEZjBybDRpVDdSckg5ZzF2SGtYOHk2YUp2OG1QbGZldzBXT1NrUldhaXN2?=
 =?utf-8?B?eTVqald5Q282RksvMXRBaE9OUEk3dllWblU5c2RidU9mbTlSOE03aHJ4ejdp?=
 =?utf-8?B?WVd5RGtFRDFHSUdtTE9VQzlHcmYrcG5jTEwrM2NRalFIdWZIT3pBSFJoQkY3?=
 =?utf-8?B?Q09NM1BDVVA2ZDZ4NlRoR0tFL3B0a0QyeGFFQVFJTkN4L0Jid25QYm9Ja0Fm?=
 =?utf-8?B?Tm00T3E3Q0QwZFdkWnl3bDN1Wk1MNE5vSHJiMExJNDF6T0U4bHpSeUNIaTRG?=
 =?utf-8?B?emF6UExWak83eXk2aXdNS0tZOGkwS1pXWHFvOGx1NGtGS2J3bEtpVEpFZ252?=
 =?utf-8?B?alg5TVdtWTBWMGxSNzg4bnl5Ti9LT3M3SktTSFBmTSs0UjA3Wk9DdTJKVEtr?=
 =?utf-8?B?RHY5ZnZJUGNabkF3cDNVbk5pSTZycCsyRUw1TkFjVkhiYVhodTRYTURFTVVr?=
 =?utf-8?B?VnNhY05KM2ladXFMUEVBMnJjdFhmcWc3elRaeTIyTEUrVWxPVGNYZkYyVDVV?=
 =?utf-8?B?T09OOXp6M1lhekUyMHljbko3dHd3dUkwMzJrZ3NvRUtNY2FlbUFPKzlYK0M5?=
 =?utf-8?B?SkpMOFRJZFNLZndnODRjaUdUUk5TNnNoQzIyRmNJa0d3RjBWUFhUV3dtb0d3?=
 =?utf-8?B?Ny94c1RLQWRqTjAyaDVNRzZSNjd0RVc0bEN4WkxhbEdPU09HbGRVcUkzWW1K?=
 =?utf-8?B?RWxGS3ROclNKc3hzeXFySzUxajNzb3JONGU2UkV1Ym9oTXZuRG1GZ0RuTkpy?=
 =?utf-8?B?NS9LU2VTcEJjQ05wQS9taWZSdE9LSjZnUFdIOEVHbElxSUpyRFB0MlJZNVlj?=
 =?utf-8?B?M29CczVMUitlTndKaEovVnZJaGI3eml6T3l4bjl0eCtBWkFJSUpQM3A2NENO?=
 =?utf-8?B?K2VSTTRJdGdlbXdOUlZjZmNnSCtlYThyWC9VVXIvcGhBdFFWMlJ0bFBzQUxG?=
 =?utf-8?B?SUdLZnR4NXB3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NldtSkRFWDdJdExnYStveXhiOWVOMXF0UDZTSkxwaFRPUjFUUmFqNHMrT0w1?=
 =?utf-8?B?QnZ4QmJOV0pjK1U3Q1FIeUFRNFNKMTQwdnQzWmp6WFllNjZFc0kvMVJvYWpa?=
 =?utf-8?B?WkRxV0JxRDFtMjBUTTBQdURueFZNaW05THZQK243bndNdld6SXEzdUIxRTE5?=
 =?utf-8?B?YjFmc1pVR1BMRHFFTGwzMzRTQ1liRkFXOTZYRnQ2TjBzT25wMm5HQWJPNExV?=
 =?utf-8?B?TVJJTU5LVEc3NWxOKzl1NXN5WlhMb2lxdXhseVlYQUx1dnlodEFrb0tVbi9l?=
 =?utf-8?B?RVU0RzdPRm16QTlnSmtOQUZGQnJjMjlzNzUvZ0ZoYWNoWmxHWVFqendvbERI?=
 =?utf-8?B?cloySWVzOTVDZ1k5TlpaOGkwSGxHN01UVkI0V0FYQ1cyeHVrNmpmeUJtT2x6?=
 =?utf-8?B?T1JyZ2pvWUF6c2VNdDcreXBxL3lkZ1BpVmFsSjFrRDBDRFJDTEFkK0F5UmM4?=
 =?utf-8?B?ekJoNEVFUVZUZHNWN1VtcGljc0tuUDR3Rm1leVg3U3c3QjZGMjlTZEZWK1JG?=
 =?utf-8?B?aVFrOWN4Nyt5ZXJ4ekdSczFvbjhGVG56b1JNL3RVSGxKOUNTTHNJbTVva2o0?=
 =?utf-8?B?SlVQWG5rbjFwM2p0UWJ4S3JiYkxvVzdkS2lpbk92OFJ6YnhYbXUzSmwyRzFL?=
 =?utf-8?B?L0dTNjl5eGwwL2Urb0tIOHZKRHdZOEFmUEhCa0V2bXIrazd4ekRaL3JTQmNT?=
 =?utf-8?B?K29kdWJGV2dJdElTS0kxY3daNENEUVBkMTVkakNMRkdEdXBKYkxkM1c4VEts?=
 =?utf-8?B?RHFQclN4UlJOTzd1T3IyUHhQdStwWU9halNCSkp0MVpSeEhISmwycjNCVG1x?=
 =?utf-8?B?Njd1Z0NPUmFmNXNySnZCRm5tN0E4cm0yemg4d2lWSWZLblhXZ0NOMWgzU0s4?=
 =?utf-8?B?ZjdlT0Y3ZmJtamxWRlk0QjErbmxkNnF2U1ZVdE5LYWd4dUVKS2xZclZ5Ykdm?=
 =?utf-8?B?blNiV3JiZ2NxYXY3NmcyeWFxbDFENG03UmdXMDVpT2NvNFl0dEZEUHBsanAz?=
 =?utf-8?B?SFh2aFh6MlNsR21yN3YwYzBWeUZ6U2w4UTZ2cUhqb2ppazVGRit5M29JRWgz?=
 =?utf-8?B?Z05XdWhLZzNlWU9RTElJUk1USDBaeVFRQlpVNXpNSTBhUzVGY0pNUlNOSzQy?=
 =?utf-8?B?NDBnWEU2SmN2NDJNdmpaRXMwN1NnWWFIVHl5b1M0aHUwN3FBUVZueVRldkEw?=
 =?utf-8?B?TXlSSFJLTUpXOVRvVStnV2xSWkM3aFM1YVVkbW1sSnAyZ3h2TUFjWC9Ddjd1?=
 =?utf-8?B?b0RMZU5SZmU1TS9ndXlWYmR5KzlxandRbU0rUWg3V3lDVHhtYjdveFF6ZElB?=
 =?utf-8?B?UHhtb1RuVTdGZVl3OXBJbktaMjlXRVd5aXdxY1FWWEpjZmwzMitINXpHaVhT?=
 =?utf-8?B?OElMaGpwUlhzNXFaT2RvYWlOdGlPREdBNitTQSsvOG5MSEM2dmZ5ejZXRnN5?=
 =?utf-8?B?WGZTTUxHSWVPaUJlcVNQSE9WbEhMdGVtTThjVFkyM2trQ3A2cEE5TjZmdnNX?=
 =?utf-8?B?bC9zY0xkY213alpVcEpsQTJvR0FTSlB3NWdCM05saUI2WW5JVFpWNjBjZVM4?=
 =?utf-8?B?RFdKWTEwTU42NkRRRERmbmI2U3Mxa3RSZG1LVjJJTTVxMWxsVitvVDhXRmlS?=
 =?utf-8?B?cWJtdnhpRG5Va2MrMU9QNk05MVl2QUtWZmJYM0k2QUk3cHMyOGFPbGgyYkFy?=
 =?utf-8?B?VzFtdUlSeHgxUk9jR3hhaTBtYnBCQUQ0Wm1laGlwbFQ3ODlsWWU3SDFZdFZB?=
 =?utf-8?B?bXZvQjJsTy9IdUhPU2dDU3lzNWY5N2h4ZjlEWnNNT0kvQ1lwa1hYeXY2eVVt?=
 =?utf-8?B?WjlFZzF3ekoxWTM1VmxyZFhoQ1lyMVlaUUZhajF4Y2lZTGtOaUlHc2FRMDU1?=
 =?utf-8?B?VlMxWXQ5YnY5dnc4Tkh1aGhGcVlQaXpJdUFXNi83cXRXNmVXSGZ3M3orRkJV?=
 =?utf-8?B?SHB1b25DVnh0QXBsNzdtbE82ZjNlaFpUOGlsY3JtRDh1K0ZoYkZNUU0yWG5q?=
 =?utf-8?B?RkVYaUhSZ2w3dnJJTDkzeWpIU0o4dGdmRHkzZTQraGtvR1JlK2taZWN3Y2N3?=
 =?utf-8?B?bDVqWVVjWThxelBkMWtSQVcySVBzUlMycGt6YWNhN2Q2NzhPMUVzYTJvaVF0?=
 =?utf-8?B?dE1OZ2w1TGZhY01WRXRqRm9QTWt4cC95RHpKaGJtMllkYVAwMjdwYmQ4eHBX?=
 =?utf-8?B?MEpnbkJJRURNdEtLU0tMaTN5QVEyMDl3aCs1WGV4bEFKN0doQVVkcHpETUcz?=
 =?utf-8?B?RFAyT1JHUkpNTWYwaERrbzhzYVpnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ec6ff0-f857-4773-ae14-08ddf99419de
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 04:54:24.2553 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7vZgx2dy6eKgkFCQlHC8yMr1llNE+wEeFi01m+2ANAS8n7s532VRI+rtPipxNkciNTd5/zRX4wB8pRRgWSnS+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8706
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
> Increase maximum VI clock frequency to 450MHz to allow correct work with
> high resolution camera sensors.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/staging/media/tegra-video/tegra20.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/stagin=
g/media/tegra-video/tegra20.c
> index e0da496bb50f..3c5bafebfcd8 100644
> --- a/drivers/staging/media/tegra-video/tegra20.c
> +++ b/drivers/staging/media/tegra-video/tegra20.c
> @@ -590,7 +590,7 @@ const struct tegra_vi_soc tegra20_vi_soc =3D {
>  	.ops =3D &tegra20_vi_ops,
>  	.hw_revision =3D 1,
>  	.vi_max_channels =3D 2, /* TEGRA_VI_OUT_1 and TEGRA_VI_OUT_2 */
> -	.vi_max_clk_hz =3D 150000000,
> +	.vi_max_clk_hz =3D 450000000,
>  	.has_h_v_flip =3D true,
>  };
> =20
>=20

Where does the 450MHz come from? Instead of hardcoding this value for each =
SoC, could we just clk_set_rate(ULONG_MAX) like e.g. the vic driver does, o=
r does that get a too high rate?



