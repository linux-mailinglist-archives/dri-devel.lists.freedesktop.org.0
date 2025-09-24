Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17536B9C82B
	for <lists+dri-devel@lfdr.de>; Thu, 25 Sep 2025 01:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69AAC10E086;
	Wed, 24 Sep 2025 23:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dzS0fgX6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011004.outbound.protection.outlook.com
 [40.93.194.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C7F210E086
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 23:20:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LfZdc34nMyGXYoaIPXGCnNfMcqoS5Fxk+yiifxWwPWPG43AvTMMmFCG8++20Bzj8kex8Tg9+eXDpxshFyww3P4+fXsGeB/tmcJunOlRJaHhjPAp2HToKJmUGyYsRUAQUX9fLBR4pEq5yze4Vh+kPj9ZfLe3lzMODMN6cH2Rx/u9PrNRm19Fnytv7mdBnKkl+wdqNOqWXuuHCV3m8CObXfJgCAea7zNae54R6e2JvUvpjFdZ/fSREMKQubcbR2KNyQbsuJJTAyaANndeRYnnKvwwze6N+tBJpJEuonaeA+jllDJUgxzd1kZOfuzzutKT5QuajSrFLqt/OyjsGH9GLxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1w5uTXpsLqHRA8xJZfpQjkJ6SLMJjCAabVAEl2zthtk=;
 b=CZMP+tL03CmZS+yH0OCyDaWdiEpZONfWRZyQMAklVPeNVOKXt+F9UR1oC4gNPdPiLRGD2R008SZDl9OJng0rXNb2lyOHpgPzv9v6YltiW7hBVvjk/cD1lguxAGCVZBfEmUH169TbLT3HJF5V3AlF1gCHJJGSLkfpINFzu+IDCIRFtx1rFcvIiLzOKahtdbWW7mt1jKxgQ9Ca84AAO8rJa8RFYohi1zuXXOIEVNcbQ/8zhCM4qYSsu+wDvZah9InfQBjWmzxPp7oeX31IEBRhel/Vy0Td9HOAZ+VE6pY/M3X4Sss5pKbaKgQegeGmmwiqHImqx+vbiNy3rQJP3SWnsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1w5uTXpsLqHRA8xJZfpQjkJ6SLMJjCAabVAEl2zthtk=;
 b=dzS0fgX6Yd8IIVnqzW3yrB14m7OPuBU3Ruaw8Vo7XNrcR/lOTC5Ofo0c1NMTPKkzpLA3pfB5nqp/eWZ39QSVYh9DIx6MVNBCppfRSp5EEtOgD4/+qZ9UJt9Pofi6KOAPh4Ro1e1ZRVS4a4pXSRQIU9rxHeqzi9CDmQWIfB4ODCusi7N0nC6Oh+wewGfpayO/MqUvtRJw5KfZZAa33u4IvosFRIjWKbQOW/UvdVlwWZ5R49qK3faG50HaSRCMUMuPR6DjHY0/uMquP71k9SsSWiYclQyOnneshUkux9eEyaJqnapbb9uVn2Y411wri/vH/DM7cmbxYco1eJ56p5wU7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 CY3PR12MB9553.namprd12.prod.outlook.com (2603:10b6:930:109::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Wed, 24 Sep
 2025 23:20:40 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9137.018; Wed, 24 Sep 2025
 23:20:40 +0000
From: Mikko Perttunen <mperttunen@nvidia.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
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
 Dmitry Osipenko <digetx@gmail.com>,
 Jonas =?UTF-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
 Charan Pedumuru <charan.pedumuru@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 16/23] staging: media: tegra-video: tegra20: simplify
 format align calculations
Date: Thu, 25 Sep 2025 08:20:30 +0900
Message-ID: <2263926.yIU609i1g2@senjougahara>
In-Reply-To: <CAPVz0n0HmYAF8=1q6jQCuWn0pmcwqAzNTNfPh0kvJ_BiLByP1Q@mail.gmail.com>
References: <20250906135345.241229-1-clamor95@gmail.com>
 <16036554.JCcGWNJJiE@senjougahara>
 <CAPVz0n0HmYAF8=1q6jQCuWn0pmcwqAzNTNfPh0kvJ_BiLByP1Q@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYWPR01CA0004.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::9) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|CY3PR12MB9553:EE_
X-MS-Office365-Filtering-Correlation-Id: 61da9ea2-0024-4cfe-75a0-08ddfbc0f9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWZoWDJGZFlsY0FuMU9tTGY0VWNwYTJsU1VnSTZ3d21NQytGaVZMdXpoSFBF?=
 =?utf-8?B?Ui91elorbVcyS0F6M3p1Rmo1b0wrR3d2alFkRDhETEVwN1Q3cVJmVVVSdVhj?=
 =?utf-8?B?L01EOUFUTjdkNHhBU3hweTBPTGtFVjNzUkMzWWtyaG5DckJUMEpjSWo2MGpH?=
 =?utf-8?B?b1hWYlduK2hkdnRhV2dzeTBxUzJGS2FRS3NvSUE2enVndFAyalhOMFlodVc0?=
 =?utf-8?B?OEMrU3JNMzdqSEdHeWRZUWpmS1RJS1FwYkhaSmJnSmdubGtBeWFuUHA0cEtQ?=
 =?utf-8?B?QXp3aThLc2tqa2swUndyQVVQd0xXYzhtazF0WmV2ZzU4UXJiTUVjOXg0MURl?=
 =?utf-8?B?d204WUgvemV1dmpERkcrMytPSVgxZXRvbnFhZG1hQW9WZEZNVVI1WCtmN2hk?=
 =?utf-8?B?eUd1YjdvdUFBUXk3WS9mdGZuQWtud1EzYndIdXl5YmlQREZ4R0RSa2dzMnAv?=
 =?utf-8?B?a2ZzTDZxUmY2elpLTWJhd0VDQWVzZnFNVTFlUkpBZmh3cHlveGcwTVRMcnlR?=
 =?utf-8?B?RG9VUEpMOWlDbkFGSVlyWFlDcytLZHBZbS9teWZVTzc0dTVjTnY3TWd2ejRy?=
 =?utf-8?B?TElLOHh5ZmZFT2p3eW5oNTg0UTc4eXJwb2dvb2VUV0VJd21SSmh4a1F1UjhC?=
 =?utf-8?B?MVo0NUNSZlNlRTR4WnZ6UndCTUtmWkQ4VERXbXM5UE5RUTUyNXNENWt4eUxW?=
 =?utf-8?B?eWZwTDJJNndicDZGbUkvM1RtQ2dnMHJLbnNHTnM3eHpNNitQRWpTNGJ5Nko1?=
 =?utf-8?B?OFRjRi9tVFNDdHNyRlhqeVhVSG41Vnh0cjg3ZStWVXN3WVlzdUVzMXRXTXAr?=
 =?utf-8?B?NWRvYWYyd1o1OTZpMXUyMUZxcStscFJLZGg5MTk0VHdxVzA5Tnpkd1FxUzVx?=
 =?utf-8?B?YlFCSGMwcE4zckh1clptYXNsUWxzdWRVY1BvamxmWlMySE5nc1czNU1URitK?=
 =?utf-8?B?alpaUTNDby92SGlwZXlGbjdPOUhaVVZyWmVvL090VzlGV2ZNLzJ3NExJU2Zs?=
 =?utf-8?B?VmI2Z3ZZUTlLeEJxTW5RWVAzK291KzJIR1ZQbHM1YUIwZkpZZzNUc21LNnJ2?=
 =?utf-8?B?RDlpNU5DMm1FZUZmZHF2R2NCMy9ma2tXSFhQYVNQeTFTSmp4TWE0azBLRytT?=
 =?utf-8?B?aHRTMjloNENmSi9nL2tkRzJYU0p4bjNjVEkvM3FSNlcxTWdRazFreW15Sm5t?=
 =?utf-8?B?eDFhd1JGa2x6S3Y1TWw0czFwdFZCL2dwOGMyU05wZ2tHSjBxWVh3aXZVV2Jh?=
 =?utf-8?B?Rk9Xak1oZW1HTDR6V3B2WEgyNHhwTktSbnpUZWtVNFo4M2dTdlVRbzBCaENk?=
 =?utf-8?B?REFRK0J4c3psYXVubVJZandqb2xDYXc5ZVhGYk50NVJTVlYvKzMzMXRVdTRE?=
 =?utf-8?B?dzVUbzVBNXl2V010Z3FIcHcwQzhrT2lsUU9YMzV0WWFSdGExaGw5NzZIcDFu?=
 =?utf-8?B?NTVQK05HUmlSNENuSjNVKzkydTRicjlZRDJkSUZneGxFcDFReGttOWhETnM2?=
 =?utf-8?B?c0dvNXIvdmFtR1RFVDViY3lMbG96WnhtWlNEZ05XREg1Y2J1SzM4a25Od28w?=
 =?utf-8?B?NzhGV2VoZ3NQdERWOXFQT3psejYrWkR5R1VBUnRCd01XR2hLdHJLcXBnbzNQ?=
 =?utf-8?B?aXdHeStEWUZmYlBiV0ZKcnNLSkpzRWZOblZORkhGeWg1THNnUE4yd0d5MG5O?=
 =?utf-8?B?dWdBWXhIMHMvSzlWeW13UEFMc0tCVTFKM29YczFIb1hCRk8vRFhEQUFXTEd2?=
 =?utf-8?B?QXZQTHBDY3FNSlN0dWYrMWxRS1Z3OHhVc3huZnRGbVM0ZmcySDVIaUNQeHM2?=
 =?utf-8?B?SlFHRkNadTh2LzZLTmdWdGdydzg2Qk1jZjBXZnlsV1pNM1VUK2pScndsbDJz?=
 =?utf-8?B?elJzbkVKSUM3dERFT0hNSldmbHFycHBoTWM4RTJYcmQwTWtJZVo3Mkk5WkRz?=
 =?utf-8?Q?fQ00CoqoYTI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTRpYXk0Z0ZzSGxGbG1qc0N1ZVdJQzN5N21Za1V5VHdkVXpSOHl6VnJHdDJG?=
 =?utf-8?B?c2IxdGx3U3h6TW9VSmVZWmRuMUxkYkFENWdnNy9zRkgvQUU2U0JaVGFXeDBq?=
 =?utf-8?B?amNURGhOU29RdEpHZnhGZW1OcTZodGFPV3laR0F6N3ByOGl5czlMR1pKNC9v?=
 =?utf-8?B?OU1FeGZtSkF5c3J3NmQxS3pNKythSFVVRU1RWGptb0tHcVZVbU5ZQ3dOL3pp?=
 =?utf-8?B?N2dxY2ozQ3cvdUJqVTd3aWFhQi9xOCtubDRXdnN1c2R2bTlGOEwwVTlCRnBK?=
 =?utf-8?B?RHNyNXpEb3dEWFNVWXk3Y29RS05RQnl4VHgvMDN1SklnTEhmQVlncVR5UjU4?=
 =?utf-8?B?UTFnbUhkcUdaQkFIN3NCWGJYUkIzMW02akxQV3ZHNm9qeW9wYWJMWkRsZXZ5?=
 =?utf-8?B?REJkOUE0YTNlejQ1RHlqWjRMdkFZOVo4eDR1NXAzV1orSmlsb3VVaGo2KzV1?=
 =?utf-8?B?dkpLbitGTEJ0SjFpUWhESTVSbmkzaE1RMEhaWXRqZ3R2YUh6TG40MUdjVWpZ?=
 =?utf-8?B?bDd4bTVkTkVaTnc2NjROSXpJdnZ0eEdIdmxpZkZxTkFBTGp6OTJITGk0a3dB?=
 =?utf-8?B?TEdlRktsRWVNZnRva25sSzZ6T0w4L2tkWllFS2RVTnFQNmtyTjJjQUlEdUlt?=
 =?utf-8?B?ak9veUFzSjFmTjA2RnBtZk5XeFdIVWtmd0lUR29WbWEveXJZVXI0Mkd5N0xk?=
 =?utf-8?B?ZmZ4NWpUL0cxQnpPQmZJZG9aU1Y2Qi9vTEJHa3hrdlJJWjAvUDlENEEyY2tp?=
 =?utf-8?B?T2VzSUhtWVA5NkNBVFpJckJRK1RNQktOWVV3OHlrVC9uUFI3NWt1RkZGd203?=
 =?utf-8?B?eWRIVFVpdElCZGRaQ21vWlN3VzI4OU5yd1QrQmF5WHpSWWNhdlNEYk51d1dU?=
 =?utf-8?B?a3JQZjlPV25DMm94TmlBQklnS3dHZmtFK0FMaEtJVWc4SzFrU0l4di9IWVhT?=
 =?utf-8?B?K1o3bWtsSEtkSmRLVENkbG9lb3hZWElqWlY1NE9vSEZOVmZoKzFRbTZGNXZo?=
 =?utf-8?B?a0d5MjJyQUNXcFN0Y2Z3VkJaQUVnSitaZXFpUmlHbHBmZkVWYjRZdlptckZy?=
 =?utf-8?B?MmtPQWNJMzF5THdpdUR6ZmNuRzlYNHFyb1A4YTlMMDdtRmtid3dmdlhpY0Yx?=
 =?utf-8?B?R3JWcUZGVG85Z3Vta1g3YUpKNkJ4S1BUVHBMYUdWTWVnVTltUExRMXBIZkV2?=
 =?utf-8?B?MCtSOGQzRHpVSWsyQXljQ3ZHODNRRUtaK0IyMzA4b1NSYzFkdFE2SUNDUTNt?=
 =?utf-8?B?bDlLS3JyYUo1SGVVYVQxWUl2WStCRStIaUZLczRkdDF3NFdmYjdEbm44bkc2?=
 =?utf-8?B?eHo2UWMxcjVhc0dJd3ZDRGZMYjV1OFBsa2hwdy9UQnphZGdmc2c4djl4a2ZO?=
 =?utf-8?B?d3phYm03cHRLR21sTlJVeUQycHJSMnhvY285eXNpbVdMc1JsbjUvOW9vMVI4?=
 =?utf-8?B?RkxMbjB5ZGViMFVLOWZzNFdYUnpyYUhuQTlvbllFRE9aZDhseXNmaGhpVmRZ?=
 =?utf-8?B?Q3RveHg4Z2NLVWlwTFBRb3JMVVpsOHNSU1RNSjJGVU9HZ2xYUTVaY2N5bTgx?=
 =?utf-8?B?QWEvUmM0ekd0WVB2c2RiY05iNVkvS2Jmc0o1bEVoVk1RQ3o1UXUvbVh0Q0Fn?=
 =?utf-8?B?ejBjeklnYXRkdmtJV0NnRUhDc0k2WUlFMVlNSGhlTXpqbjZVb1RZWkwyZjF4?=
 =?utf-8?B?WmdiR1NxTE15WEhDVEQzNExNMVRYcmRxWnl5UWk3bmRIREx6TXpuRUNxZllC?=
 =?utf-8?B?emVib2V2NUk4ZFZZZGI0QjVtMFR6QnhLb2ZBbFFraFhudWg5Mm5ENG10QStk?=
 =?utf-8?B?bGd4ZGl0OWd5dlMwUzZMdWRZNWpBY0QvQWlLeFpTL1RBU1dkN1JUbS9MUys1?=
 =?utf-8?B?ZncwMCtBemY5Ujd0ZTEzTXpuNWk4dzhoeEFVTE5XbHhtNnExVXh6d01BOVVM?=
 =?utf-8?B?d1hlemR2OXBGWnlQSVVFUGJIMlk0Z3ZNeVZBZlZ4alpFQXNkZFdZb2h5b0JT?=
 =?utf-8?B?eE1LOG1FNTdPL2I0MTZHS2dJM1FsamNwM3JEcWhiem9YdUtTVkN2bEl0U2Y1?=
 =?utf-8?B?QSt0WWpwNVVIWDJOcWwxQkJnOEk1SWdJYzR2bjZwQkUyQTRjdFdmeXQyRklD?=
 =?utf-8?B?ajlXcFVIdTdSZkdzbWpPelk3MUJpOEtxcWVETEUycWlTVUdQQkc4bjZUR2pr?=
 =?utf-8?B?eWRkUnZiVE5XMmNIS0xmNlo1VWxuLzdSTjZpclN6V2xwZlRXRy9EUzlpcFpr?=
 =?utf-8?B?ay9vMEl4RzJNQUtTN2RBQlpCT1F3PT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61da9ea2-0024-4cfe-75a0-08ddfbc0f9c4
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 23:20:40.0858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDZlEJOmlRd6anXLMVDjs8/58G0TGz2kl0qbKThfu+gdiTcbmzCEuiPd3C8Ilh8FNAa/R9fLHf6Sn9LzkCwW5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9553
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

On Wednesday, September 24, 2025 7:24=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D1=81=D1=80, 24 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 07:47 Mi=
kko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> >
> > On Tuesday, September 23, 2025 3:50=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > =D0=B2=D1=82, 23 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09:1=
1 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > > > =D0=B2=D1=82, 23 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 09=
:04 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > >
> > > > > On Monday, September 22, 2025 4:36=E2=80=AFPM Svyatoslav Ryhel wr=
ote:
> > > > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=
=BE 10:27 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > > > > >
> > > > > > > On Monday, September 22, 2025 3:30=E2=80=AFPM Svyatoslav Ryhe=
l wrote:
> > > > > > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =
=D0=BE 09:23 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=
=B5:
> > > > > > > > >
> > > > > > > > > On Monday, September 22, 2025 2:13=E2=80=AFPM Svyatoslav =
Ryhel wrote:
> > > > > > > > > > =D0=BF=D0=BD, 22 =D0=B2=D0=B5=D1=80. 2025=E2=80=AF=D1=
=80. =D0=BE 07:44 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=
=88=D0=B5:
> > > > > > > > > > >
> > > > > > > > > > > On Saturday, September 6, 2025 10:53=E2=80=AFPM Svyat=
oslav Ryhel wrote:
> > > > > > > > > > > > Simplify format align calculations by slightly modi=
fying supported formats
> > > > > > > > > > > > structure.
> > > > > > > > > > > >
> > > > > > > > > > > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com=
>
> > > > > > > > > > > > ---
> > > > > > > > > > > >  drivers/staging/media/tegra-video/tegra20.c | 41 +=
+++++++-------------
> > > > > > > > > > > >  1 file changed, 16 insertions(+), 25 deletions(-)
> > > > > > > > > > > >
> > > > > > > > > > > > diff --git a/drivers/staging/media/tegra-video/tegr=
a20.c b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > > > > index 6e0b3b728623..781c4e8ec856 100644
> > > > > > > > > > > > --- a/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > > > > +++ b/drivers/staging/media/tegra-video/tegra20.c
> > > > > > > > > > > > @@ -280,20 +280,8 @@ static void tegra20_fmt_align(=
struct v4l2_pix_format *pix, unsigned int bpp)
> > > > > > > > > > > >       pix->width  =3D clamp(pix->width,  TEGRA20_MI=
N_WIDTH,  TEGRA20_MAX_WIDTH);
> > > > > > > > > > > >       pix->height =3D clamp(pix->height, TEGRA20_MI=
N_HEIGHT, TEGRA20_MAX_HEIGHT);
> > > > > > > > > > > >
> > > > > > > > > > > > -     switch (pix->pixelformat) {
> > > > > > > > > > > > -     case V4L2_PIX_FMT_UYVY:
> > > > > > > > > > > > -     case V4L2_PIX_FMT_VYUY:
> > > > > > > > > > > > -     case V4L2_PIX_FMT_YUYV:
> > > > > > > > > > > > -     case V4L2_PIX_FMT_YVYU:
> > > > > > > > > > > > -             pix->bytesperline =3D roundup(pix->wi=
dth, 2) * 2;
> > > > > > > > > > > > -             pix->sizeimage =3D roundup(pix->width=
, 2) * 2 * pix->height;
> > > > > > > > > > > > -             break;
> > > > > > > > > > > > -     case V4L2_PIX_FMT_YUV420:
> > > > > > > > > > > > -     case V4L2_PIX_FMT_YVU420:
> > > > > > > > > > > > -             pix->bytesperline =3D roundup(pix->wi=
dth, 8);
> > > > > > > > > > > > -             pix->sizeimage =3D roundup(pix->width=
, 8) * pix->height * 3 / 2;
> > > > > > > > > > > > -             break;
> > > > > > > > > > > > -     }
> > > > > > > > > > > > +     pix->bytesperline =3D DIV_ROUND_UP(pix->width=
 * bpp, 8);
> > > > > > > > > > >
> > > > > > > > > > > Assuming the bpp is coming from the format table belo=
w, this changes the value of bytesperline for planar formats. With this it'=
ll be (width * 12) / 8 i.e. width * 3/2, which doesn't sound right.
> > > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Downstream uses soc_mbus_bytes_per_line for this calcul=
ation which was
> > > > > > > > > > deprecated some time ago, here is a fragment
> > > > > > > > > >
> > > > > > > > > > s32 soc_mbus_bytes_per_line(u32 width, const struct soc=
_mbus_pixelfmt *mf)
> > > > > > > > > > {
> > > > > > > > > >  if (mf->fourcc =3D=3D V4L2_PIX_FMT_JPEG)
> > > > > > > > > >  return 0;
> > > > > > > > > >
> > > > > > > > > >  if (mf->layout !=3D SOC_MBUS_LAYOUT_PACKED)
> > > > > > > > > >  return width * mf->bits_per_sample / 8;
> > > > > > > > > >
> > > > > > > > > >  switch (mf->packing) {
> > > > > > > > > >  case SOC_MBUS_PACKING_NONE:
> > > > > > > > > >   return width * mf->bits_per_sample / 8;
> > > > > > > > > >  case SOC_MBUS_PACKING_2X8_PADHI:
> > > > > > > > > >  case SOC_MBUS_PACKING_2X8_PADLO:
> > > > > > > > > >  case SOC_MBUS_PACKING_EXTEND16:
> > > > > > > > > >   return width * 2;
> > > > > > > > > >  case SOC_MBUS_PACKING_1_5X8:
> > > > > > > > > >   return width * 3 / 2;
> > > > > > > > > >  case SOC_MBUS_PACKING_VARIABLE:
> > > > > > > > > >   return 0;
> > > > > > > > > >  }
> > > > > > > > > >    return -EINVAL;
> > > > > > > > > > }
> > > > > > > > > >
> > > > > > > > > > V4L2_PIX_FMT_YUV420 and V4L2_PIX_FMT_YVU420 are classif=
ied as
> > > > > > > > > > SOC_MBUS_PACKING_1_5X8 hence we get width * 3/2
> > > > > > > > >
> > > > > > > > > Googling this brings up the entry
> > > > > > > > >
> > > > > > > > > {
> > > > > > > > >         .code =3D V4L2_MBUS_FMT_YUYV8_1_5X8,
> > > > > > > > >         .fmt =3D {
> > > > > > > > >                 .fourcc                 =3D V4L2_PIX_FMT_=
YUV420,
> > > > > > > > >                 .name                   =3D "YUYV 4:2:0",
> > > > > > > > >                 .bits_per_sample                =3D 8,
> > > > > > > > >                 .packing                        =3D SOC_M=
BUS_PACKING_1_5X8,
> > > > > > > > >                 .order                  =3D SOC_MBUS_ORDE=
R_LE,
> > > > > > > > >                 .layout                 =3D SOC_MBUS_LAYO=
UT_PACKED,
> > > > > > > > >         },
> > > > > > > > > }
> > > > > > > > >
> > > > > > > > > which matches that you're describing. It doesn't make sen=
se to me, since it at the same time specifies PIX_FMT_YUV420 (which is plan=
ar with 3 planes, as documented by include/uapi/linux/videodev2.h), and LAY=
OUT_PACKED
> > > > > > > > >
> > > > > > > > > /**
> > > > > > > > >  * enum soc_mbus_layout - planes layout in memory
> > > > > > > > >  * @SOC_MBUS_LAYOUT_PACKED:             color components =
packed
> > > > > > > > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_U_V:      YUV components st=
ored in 3 planes (4:2:2)
> > > > > > > > >  * @SOC_MBUS_LAYOUT_PLANAR_2Y_C:        YUV components st=
ored in a luma and a
> > > > > > > > >  *                                      chroma plane (C p=
lane is half the size
> > > > > > > > >  *                                      of Y plane)
> > > > > > > > >  * @SOC_MBUS_LAYOUT_PLANAR_Y_C:         YUV components st=
ored in a luma and a
> > > > > > > > >  *                                      chroma plane (C p=
lane is the same size
> > > > > > > > >  *                                      as Y plane)
> > > > > > > > >  */
> > > > > > > > > enum soc_mbus_layout {
> > > > > > > > >         SOC_MBUS_LAYOUT_PACKED =3D 0,
> > > > > > > > >         SOC_MBUS_LAYOUT_PLANAR_2Y_U_V,
> > > > > > > > >         SOC_MBUS_LAYOUT_PLANAR_2Y_C,
> > > > > > > > >         SOC_MBUS_LAYOUT_PLANAR_Y_C,
> > > > > > > > > };
> > > > > > > > >
> > > > > > > > > i.e. non-planar. The code in the driver is handling it as=
 three planes as well, with addresses VB0_BASE_ADDRESS/VB0_BASE_ADDRESS_U/V=
B0_BASE_ADDRESS_V. Since the planes are separate, there should be no need t=
o have more than 'width' samples per line.
> > > > > > > > >
> > > > > > > >
> > > > > > > > I did not invent this, I have just simplified this calculat=
ion from
> > > > > > > > downstream, output values remain same. I have no cameras wh=
ich can
> > > > > > > > output V4L2_PIX_FMT_YUV420 or V4L2_PIX_FMT_YVU420 so I cann=
ot test if
> > > > > > > > this works either. Other YUV and RAW formats were tested on=
 real HW
> > > > > > > > and work perfectly fine.
> > > > > > >
> > > > > > > My understanding from the code was, that the MEDIA_BUS_FMT_ f=
ormats listed in the video format table refer to the input formats from the=
 camera, and the V4L2_PIX_FMT_ formats to output formats from VI. Hence VI =
could input UYVY8_2X8 and write to memory in YUV420. The code dealing with =
V4L2_PIX_FMT_ values seems to be related to the output to memory. Is it pos=
sible to test this (your camera -> VI converts to YUV420) or am I mistaken?
> > > > > > >
> > > > > >
> > > > > > Camera I am testing with has no YUV420 options available and fr=
om what
> > > > > > I can tell there is no way to force VI to output in YUV420 unle=
ss
> > > > > > camera supports it. Any format manipulations should requite hoo=
king up
> > > > > > ISP, or am I missing smth?
> > > > >
> > > > > From a quick look at the spec it looks to me like for YUV422 pack=
ed input formats specifically, VI should be able to convert to YUV420. If t=
hat were not the case, e.g. 'TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12,=
 YUV420),' would not make sense anyway as it's talking about both YUV422 pa=
cked input data and then also YUV420.
> > > > >
> > > >
> > > > After additional checking you are correct, VI should be able to
> > > > perform YUV442 to YUV440. One of the reasons why VI is not exposing
> > > > YUV440 may be video-centric nature of the driver, so that it expose=
s
> > > > only formats supported by camera and VI. I will double check which
> > > > formats video device exposes. What should I test exactly?
> > > >
> >
> > If you are able to test, I would like to see the following (with YUV422=
 input camera, VI set to output YUV420)
> > (1) Output image is correct
> > (2) Check output image bytes per line (e.g. with a hex editor)
> > (3) If output image bytes per line is 3/2 * width, try changing it to 1=
 * width and repeating test
> >
>=20
> 1 * width is enough, 3/2 * width has just end of memory dump filled
> with zeroes. I assume downstream is wrong in this aspect. Additionally
> I was able to address YUV422 > YUV420 conversion. Existing YUV entries
> have YUV 2X8 media bus formats which are not used by my camera, my
> camera uses only YUV 1X16 media bus formats. So by adding those YU12
> format appeared.

Excellent! I suppose we have a better driver than downstream now :)

>=20
> >
> > > Alternatively, since code that I propose matches in output with one
> > > that was before, changes can be applied and revised once there will b=
e
> > > such need. Especially, since YUV422 and RAW8/10 work fine and were
> > > tested. I am not sure there will be many use cases which deliberately
> > > target YUV420.
> > >
> >
> > Yeah, since it's a pre-existing issue, that makes sense. However, I'd s=
till add a comment to the bytes per line calculation with a reference to th=
e downstream code it's based on, and that it produces an unexpected 3/2 * w=
idth for YUV420.
> >
>=20
> I assume since I am applying expected and correct value, no additional
> comments would be required within code, but I will add a note to
> commit description.

Indeed.

Thanks!
Mikko

>=20
> > Mikko
> >
> > > > > >
> > > > > > > It's certainly possible that the current code is functional -=
- if bytesperline is set to a too large value and that information flows to=
 userspace, it could still read the buffer. It would just waste memory.
> > > > > > >
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > > +     pix->sizeimage =3D pix->bytesperline * pix->h=
eight;
> > > > > > > > > > > >  }
> > > > > > > > > > > >
> > > > > > > > > > > >  /*
> > > > > > > > > > > > @@ -576,20 +564,23 @@ static const struct tegra_vi_=
ops tegra20_vi_ops =3D {
> > > > > > > > > > > >       .vi_stop_streaming =3D tegra20_vi_stop_stream=
ing,
> > > > > > > > > > > >  };
> > > > > > > > > > > >
> > > > > > > > > > > > -#define TEGRA20_VIDEO_FMT(MBUS_CODE, BPP, FOURCC) =
   \
> > > > > > > > > > > > -{                                                 =
   \
> > > > > > > > > > > > -     .code    =3D MEDIA_BUS_FMT_##MBUS_CODE,      =
     \
> > > > > > > > > > > > -     .bpp     =3D BPP,                            =
     \
> > > > > > > > > > > > -     .fourcc  =3D V4L2_PIX_FMT_##FOURCC,          =
     \
> > > > > > > > > > > > +#define TEGRA20_VIDEO_FMT(DATA_TYPE, BIT_WIDTH, MB=
US_CODE, BPP, FOURCC)      \
> > > > > > > > > > > > +{                                                 =
                   \
> > > > > > > > > > > > +     .img_dt         =3D TEGRA_IMAGE_DT_##DATA_TYP=
E,                   \
> > > > > > > > > > > > +     .bit_width      =3D BIT_WIDTH,               =
                     \
> > > > > > > > > > > > +     .code           =3D MEDIA_BUS_FMT_##MBUS_CODE=
,                    \
> > > > > > > > > > > > +     .bpp            =3D BPP,                     =
                     \
> > > > > > > > > > > > +     .fourcc         =3D V4L2_PIX_FMT_##FOURCC,   =
                     \
> > > > > > > > > > > >  }
> > > > > > > > > > > >
> > > > > > > > > > > >  static const struct tegra_video_format tegra20_vid=
eo_formats[] =3D {
> > > > > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 2, UYVY),
> > > > > > > > > > > > -     TEGRA20_VIDEO_FMT(VYUY8_2X8, 2, VYUY),
> > > > > > > > > > > > -     TEGRA20_VIDEO_FMT(YUYV8_2X8, 2, YUYV),
> > > > > > > > > > > > -     TEGRA20_VIDEO_FMT(YVYU8_2X8, 2, YVYU),
> > > > > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YUV420),
> > > > > > > > > > > > -     TEGRA20_VIDEO_FMT(UYVY8_2X8, 1, YVU420),
> > > > > > > > > > > > +     /* YUV422 */
> > > > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 16=
, UYVY),
> > > > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, VYUY8_2X8, 16=
, VYUY),
> > > > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YUYV8_2X8, 16=
, YUYV),
> > > > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, YVYU8_2X8, 16=
, YVYU),
> > > > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12=
, YUV420),
> > > > > > > > > > > > +     TEGRA20_VIDEO_FMT(YUV422_8, 16, UYVY8_2X8, 12=
, YVU420),
> > > > > > > > > > > >  };
> > > > > > > > > > > >
> > > > > > > > > > > >  const struct tegra_vi_soc tegra20_vi_soc =3D {
> > > > > > > > > > > >




