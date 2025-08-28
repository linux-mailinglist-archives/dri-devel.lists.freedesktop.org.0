Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C480B3967F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Aug 2025 10:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4289010E83E;
	Thu, 28 Aug 2025 08:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="krGevMH+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7863310E83E
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Aug 2025 08:13:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GnPYvQjLKyz462aMSLpNHapKQixMJ2+TMYwCF0quYnhWHlaP8ABROwxxWsQAnDTUPToIwD7Y4/TdEfEMW+t+lTvA06EQ+5wpV8bQI/6nePwBZYBUfAQahDh9YAOxD5tFZD4MRRsK8iWqyLNgIlVx1cIixyfiW0fUIozHXYRehTcHA8E1GfJboXSL9S/fRbrf4AknJC170Z9NgfZ7NcCSo8ahuveiZVYQeRG0lYSPEMo2Uo9ZLeIwdaXNRG09fG8E/68nuy2+ntOlt2Va7SecxOaPbIWtffmCZ2kUHVRzXD0JedzPtqcMHsLTV6HTCEOISZEP/5aM15J/8doAxM94zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GkDcyyb39tqBuQBSS5VcQK846GjQqUxQuFa8BIaE3Dg=;
 b=yKfJ2EQzPTbHsyOUuQtRNcid6J34/9N5vYFJGDFMnFtXVC+YNR46DXzUoFdzVDvfb/n16577/f5k5AAoSpttKQSGY+BfbcTw+Wr3u8OGNgxMt6p617/cFxb+twQEhwRJkH9jDF+ktppEgUOdyyRdKVvylVWvzBAMLJUiwutteasDf6lxvwWZpencGubt4fNCTBPgUkjugJAhPtgJXHx4Kurzm0Nn7+SWTDKPV+YiDXNo11/9pqc0+q2jHfRRPd9zleYhLgy56Nb0bLBpVbVZpAsybvBbgrITm1MFtktyCwvjMF8QLKpKROhfpi6ADTaUr0GZHtpJoe/yCrS4s1Y8oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GkDcyyb39tqBuQBSS5VcQK846GjQqUxQuFa8BIaE3Dg=;
 b=krGevMH+QhmY5nKqER+sNwJd/iCZY5pTHcguNNiswLf+1J3MiPTn6qPrygiTQ2xHZ3Vrb7cenxT940wlZs/l/XvgM4LApCBX7Dso8OZ18nb3P5CrYWQvk7uhsgKbkTrD0RmAn3MVqidKU955CsitZDC2bKQfGhT7mYZ5J35k252roCllxzDYOcpnis8kIAmU9s+rzYWnb72cwK0WpDNOmfGpVejCWePQdBYcpx6hDp56OPRKySa2v8ecM1UHAja2d6+O8TWJSuaci6HwB/9SRR/ISHDhS8bF5Ca22/WQZ5uT9SxkF4EF5Ae3iFBnNS1lYLMMQw7+FVauvRJOVSS8iA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM4PR12MB6494.namprd12.prod.outlook.com (2603:10b6:8:ba::19) by
 IA1PR12MB6604.namprd12.prod.outlook.com (2603:10b6:208:3a0::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.21; Thu, 28 Aug 2025 08:13:26 +0000
Received: from DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11]) by DM4PR12MB6494.namprd12.prod.outlook.com
 ([fe80::346b:2daf:d648:2e11%6]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 08:13:25 +0000
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
 Conor Dooley <conor+dt@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>, linux-media@vger.kernel.org,
 linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 01/19] clk: tegra: init CSUS clock for Tegra20 and
 Tegra30
Date: Thu, 28 Aug 2025 17:13:22 +0900
Message-ID: <1797126.QkHrqEjB74@senjougahara>
In-Reply-To: <CAPVz0n0kCBAh7W0R766A_dXbcM3E=EoSXemuc0_rOm+Qch-a+Q@mail.gmail.com>
References: <20250819121631.84280-1-clamor95@gmail.com>
 <14287352.RDIVbhacDa@senjougahara>
 <CAPVz0n0kCBAh7W0R766A_dXbcM3E=EoSXemuc0_rOm+Qch-a+Q@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ClientProxiedBy: TYCP286CA0070.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::14) To DM4PR12MB6494.namprd12.prod.outlook.com
 (2603:10b6:8:ba::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6494:EE_|IA1PR12MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: 248a41c4-328d-4a12-fcbe-08dde60ac338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|10070799003|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajJNdkFIUGF6WjZPeWRJcVVQT1hoaFhDcVVOdDRwQll4Umo3dmg0RTJDUTJF?=
 =?utf-8?B?YXNNVzRpQXFzV2hjdy9sTWhPTjRHNkRYOVkvaGRUbUZ5eE5takZYd2QvWGVl?=
 =?utf-8?B?bDM2eXJMbWtiRHFvVHNibnB0dytKMlVnTm44TEFBaWFJVnE4UUk0WTl6VFRw?=
 =?utf-8?B?WlM2L3FoOU9TM2VvUFM3eUJqWTZLNkdZLzRwSmg3UC9VcmRrbU02dkRXb1Fn?=
 =?utf-8?B?b0owL1ljdExmRCt6dzU4TXhSTFh1WitIYklKRVEvUzlyams1RWN2SlltaWs5?=
 =?utf-8?B?b1lKdW9kRFdydXRweGpNY2ZhbFE1MmNYNGtaUnUvbzZiNHpFNnF2aGxnR1V3?=
 =?utf-8?B?NGl3dU9ybkZOU3E1VWt4UXRiWkxPNC9sekpUd0gvUlVoVGxJRk1NNmNhY1lV?=
 =?utf-8?B?bFpjR2t6T3RXdk04aUk3YVgyMzRiTld4S2lZVVJJSXZxZ29MZ28zbUlUZk5m?=
 =?utf-8?B?dHM5bVlYQTdOV3hhejdLMWFhNlo2bW1mQTQ3U25IczN3K0dCeHZtVS9OZG9S?=
 =?utf-8?B?NTVHVmJXQzZaN1d2UEd2N3BjTEN6Qk1qTUYxa1o1cFYyUXdqcDEza2hCRG1u?=
 =?utf-8?B?VnZiZDE5aGpIUmkvVk5RK1pmSk02LzBQUklUUnljaU83eDVvbG5zcVRYTGJa?=
 =?utf-8?B?c3loWmJIQklteStpN1VNck05MU1xVmp6Z2tkUU9zd3F1SlJYRUtodWNvc0py?=
 =?utf-8?B?MkxDeEpSdFVmaGNsckFCSDl5ckpEaEd3V1RxMnFBcWVJRkVmeklIdXdKZldJ?=
 =?utf-8?B?enM2WmM2WGgrb3hyZ2pxVXNBaWNaVTdlVzNCaVV4Ri9UckZDNUxxUmUvaU9a?=
 =?utf-8?B?YzBGRmRnd3BjeTlocVhSQ1NPZXVvV0dqYnluVVE2NC9URjg4WHNQK1RIMG5r?=
 =?utf-8?B?TWE0ODB3UFB4eldqQXJBbjRQVWtZcHF4ZEJqanF1ZTVpOTA1Ty9YU1FFc0pi?=
 =?utf-8?B?WElIT3k4NEF1RXVUK1ZzUXpocjIvdzFJdDdTeFRQb09pbjN0MkJLRW9DcSto?=
 =?utf-8?B?blFpOHM2UjRqQ0lwdmsvQ3NBaDRRMVY3WWVZNmF4cDVkQTBnQzdiQ0lsVVJy?=
 =?utf-8?B?aDFKejlXa1ErWnRnWWRDZVB0YUVlUkh1eXN2Q2ZjUFlJeHF0OC9aY1R0S1JO?=
 =?utf-8?B?NS9DMnVuWjlLcnVhWmJvN2pCdTJvT09PRnBKYmlSeWprc0RUMVNqaHR2ZHpQ?=
 =?utf-8?B?U0VWZXVzSXdhWXMwVzFxbnR3bEZRQ3c5N3VZd2djLytqNDJCc3VpVXNOaGYy?=
 =?utf-8?B?WVVTUUdkZmJCclFSbnpPZlFWZy80V0NDdTdIY21yV2ltVDlySmZmRDNIeUpz?=
 =?utf-8?B?VXR3amJxay9idWplVmFYbDRWZFR0R2llRlhtck5uUDNKWFRYQ21tbEgyVlFW?=
 =?utf-8?B?bXQ3eTIyWjZsWVp3R1g3WWdwdEk0dDYwYTAzTWVlT05CZUxhYW1xWTFnVXNC?=
 =?utf-8?B?aUtyU3hUQ1c0N2phbjhxbjN6SmV2VzBMVUs5a1dsTjFSVFF4TE9jaE0ySkR6?=
 =?utf-8?B?OFNSRkpnR0RTd2dMK01CVUJ6T01vcnBpRUptZWJYcTVtY1kyUW4zU0x1RzBG?=
 =?utf-8?B?RVZTUkkyVUp3OXZYSWVYN0VPSTZydDFZWmZiWVFnZFdVNVN0NzVzeDk2aWlj?=
 =?utf-8?B?WlJ2SUUrY09nMEh2dlRrNFdKQkZKcEdUVS9WbjZLd0JlY1dIVHoweEJsWXli?=
 =?utf-8?B?Z2pFaUpxaUl6ZGV4OEhrVDZLb2JockhxQ3FyQXlzS3dpR2lBZVhjZDE1UlFk?=
 =?utf-8?B?dURYVXZseERqM3RuOHF1MkNGQ3lWVzU4cWZNQzF0d0xQZG1za0RSV2JGYkJW?=
 =?utf-8?B?ZTVoYW12SG90MWRKL3lucVhVSldseWJKRWlpcW50Zkt5VzdWY29BejQ2Zjcz?=
 =?utf-8?B?Q1pEUi9DbytNbjl0YmE4R3FqdGI5NmpHOTYzV3JCK1lQSys1elNsZ0FFVk85?=
 =?utf-8?Q?XhL/Ptwm5gE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6494.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(10070799003)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnJkR2RKbktkb0NkZkpDV2hENlBLdkw2b3RrN1U4WHJXeDFWM25tL0ZnUStv?=
 =?utf-8?B?bHR2a05kYWJuTWVwelF2clAyR3RwRE9PLyt3aVFIVytLaTQ2Vnd3bDdJS2xD?=
 =?utf-8?B?ZFl2bzZlR3pYZnVZdUo1cWlUcnE2Wk5zTE1qN2w1TE1GWWc3UTdibWxSZTM0?=
 =?utf-8?B?ZlNKSG0xbWlvWTRkdkdwV29lVzVxTWszY2xBUXZPSVRqd0xTdVB6ek1RMFRm?=
 =?utf-8?B?bjJCWlVCMDFwZnBETW1ycG81ZCtZeDNzSWhEOWJYVHNyZ1UvU3dGa29JL0py?=
 =?utf-8?B?dGplMWQ1ZmVsTDFVZm9ZN0xlS0pZeGljYVZjYXRUSmNOSlhKdU90cmwzTnNB?=
 =?utf-8?B?QVorZzF2TDJjV1dDMnp0WHZaSEtIT0loa21HaC9kYStKYW4vS0l3dU1RN3FD?=
 =?utf-8?B?TjhTa2RpczdaYmdscURrcXZHSUFXMEN0NU9xUlFNdEJnQWFWenQrdW1tT05S?=
 =?utf-8?B?QkV1VXYwMWR6emRTakh4N1RXWStZWUxVTGdiSExrS1BFY0x4eSthNU9ZcWl4?=
 =?utf-8?B?L1lFWFFQYm13TU9QajFsNkhEV3haYVByVVFBM0NLS0x4V2dRa1J5T0lhblU4?=
 =?utf-8?B?b3dGMFpVclVnQ3J5WDFBeENZM0NNUVZ1anl2WHE1Zmk0ZVlCTWZaaG1oMEsr?=
 =?utf-8?B?dnZmKzhGRTd3WnhtZVhSaWVsZ2N5UHFOWFI5QjlTSndvajROS2ZIYlRMUFZE?=
 =?utf-8?B?ZGE4dVhaVlJ2TnBKbDJvd2F0bDZOTHVxdVVkNEJ2S1ppUzlabDV4MXFubE1R?=
 =?utf-8?B?ZlFVQVpDRUg0NmQyNk1NTlllUU9ZNyt5RWJjMUZXUklESmN2YzlwandYZWNK?=
 =?utf-8?B?VkJvSEU1VHJBcHA5MjJIQnVXUHJIV3J5WlhpcHNzeUFPYWhJRUpEbkUxZ09o?=
 =?utf-8?B?bFJaL0lLNnhtWDl0L0lKM042dVNkV201RTVOaVAydTZJcVRFV0hwQ1NTMjlu?=
 =?utf-8?B?dnpKMzVYaXk1ZG9zYU1heDRnQmRLdXdtSXlkSXlzTXdMY051cG9sSkEySitT?=
 =?utf-8?B?bmdLMVp5eUFUbHFHOStuOGFVVHBtN2pldW1yNGs1STlpVVcwa0o3dHY4Z3Vj?=
 =?utf-8?B?MEtDaXJZdmNyNE9uaGlIVmVSR3Z5WElja0FDdllzVDJkRk5Tb0dTUG1FaXRF?=
 =?utf-8?B?YkdIODg4MnR3UHNMMUF0VDIycmFSWFB0LzkwcFJmK09vdll1d3F2WlN3NkRJ?=
 =?utf-8?B?K1VTSDB3M28xSTBzWFlRbDVsWjdaeEVCbWlaeWVmNmM3WUJta2RVeEF3cUpi?=
 =?utf-8?B?WFlqZEk4bGNuOUZiNWYxbkcxMHRuVUduOFpUTkpGeGVWaVF3Q0x3Kyt3WGZ6?=
 =?utf-8?B?ayt1SmxTZm40UHc1bUp2YVBwZGR4RFIxNXI1RHJRenBMUllkWkN3TUlnL1Qw?=
 =?utf-8?B?SEh6YmpidjR3Nm9NQ3hFVlhRU1A3Z2dlalVTSG84MXFkcmVPRUZyc3VsRXdq?=
 =?utf-8?B?elZoU2tzRVYvYWtVRm4xdnQvdkc5UWNuMDBkQ2c5cFhYeUZBaFZGaktEbTQ5?=
 =?utf-8?B?aCtXWVFGV3REMzlOOWpYNFR2TFM4Qll1Z1ZRcFprVU9TTWlaYlEwTXdPUXdk?=
 =?utf-8?B?NVhMYkR2WW5BUnRBUWErWGtJYytnZXNwa3ZvaTRGZ2dQK3lrcWV5Witqb1FC?=
 =?utf-8?B?Z3Fwd1VUNHRCREg3aVhHd3BmWGx0RVcrbGdWbVgyYXRHNjIrRTkxdEZRcjNh?=
 =?utf-8?B?Um1VT2FQaEQ2NmNuVXF3aUFvWnlaWTF0NUxublk3NVlxak9HNWd5YXVpUjNl?=
 =?utf-8?B?cGJzRHh3L2FmSUg5dW8wMGhvaFgvSFFxc0JCb3k2MjZBb2N6eFpkd0wrd1pT?=
 =?utf-8?B?b2ZESG1FQmwvemNoQ2JyemJwazU3OU8zZ3VEUEoycDRldVhvVDZLWHZoVG1B?=
 =?utf-8?B?QnVvSDBEeDVOMUhvbDJ6RmRUNG9QeEJSQUpJMXRzUFpKOS9vSm03V0FPcnhJ?=
 =?utf-8?B?aExpUjJJR2JkTDlRK0F4OXVRamxRdWxaZUQ3ZzBBRkdZNmlBREg1V3BXdmpl?=
 =?utf-8?B?RERlYlBaOTQrYmZwYi9GYXQ1YzVVcCtTMXJnams5emxRbkFXWkdWNUZzdHpU?=
 =?utf-8?B?YTlPTWMydzhOWWpGMGVlUCtUS2xmY3FRMDI0a1Z6Q3RRV0xLeWdScElXSmk3?=
 =?utf-8?B?b2VlbWY2WFIyd05mSHRCYno3aTNOTXBEU0NCdklzN1BJSzZJL3ljeDcrK0hG?=
 =?utf-8?B?NFVyY2NMa2t4YzI1aXNNZTQ5b2Mwc1EweU1iZW8wL1QrWkw3aUQwa2pESWZp?=
 =?utf-8?B?TnJJeHBzMVg3V0xSNGY4VGZHUDdnPT0=?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 248a41c4-328d-4a12-fcbe-08dde60ac338
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6494.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 08:13:25.8433 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cfTljlGZhcNcN+go+bhYLlRcYAnuFCMlYff87eIGWYOH+WPftf9m1jpceExb+las7EuEdlDS8zqghaNBxg7g7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6604
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

On Wednesday, August 27, 2025 7:45=E2=80=AFPM Svyatoslav Ryhel wrote:
> =D1=81=D1=80, 27 =D1=81=D0=B5=D1=80=D0=BF. 2025=E2=80=AF=D1=80. =D0=BE 13=
:36 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > On Wednesday, August 27, 2025 1:32=E2=80=AFPM Svyatoslav wrote:
> > > 27 =D1=81=D0=B5=D1=80=D0=BF=D0=BD=D1=8F 2025=E2=80=AF=D1=80. 07:09:45=
 GMT+03:00, Mikko Perttunen
> >=20
> > <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >On Tuesday, August 19, 2025 9:16=E2=80=AFPM Svyatoslav Ryhel wrote:
> > > >> CSUS clock is required to be enabled on camera device configuratio=
n
> > > >> or
> > > >> else camera module refuses to initiate properly.
> > > >>=20
> > > >> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > >> ---
> > > >>=20
> > > >>  drivers/clk/tegra/clk-tegra20.c | 1 +
> > > >>  drivers/clk/tegra/clk-tegra30.c | 1 +
> > > >>  2 files changed, 2 insertions(+)
> > > >>=20
> > > >> diff --git a/drivers/clk/tegra/clk-tegra20.c
> > > >> b/drivers/clk/tegra/clk-tegra20.c index 551ef0cf0c9a..42f8150c6110
> > > >> 100644
> > > >> --- a/drivers/clk/tegra/clk-tegra20.c
> > > >> +++ b/drivers/clk/tegra/clk-tegra20.c
> > > >> @@ -1043,6 +1043,7 @@ static struct tegra_clk_init_table init_tabl=
e[]
> > > >> =3D {
> > > >>=20
> > > >>    { TEGRA20_CLK_GR3D, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > > >>    { TEGRA20_CLK_VDE, TEGRA20_CLK_PLL_C, 300000000, 0 },
> > > >>    { TEGRA20_CLK_PWM, TEGRA20_CLK_PLL_P, 48000000, 0 },
> > > >>=20
> > > >> +  { TEGRA20_CLK_CSUS, TEGRA20_CLK_CLK_MAX, 6000000, 1 },
> > > >>=20
> > > >>    /* must be the last entry */
> > > >>    { TEGRA20_CLK_CLK_MAX, TEGRA20_CLK_CLK_MAX, 0, 0 },
> > > >> =20
> > > >>  };
> > > >>=20
> > > >> diff --git a/drivers/clk/tegra/clk-tegra30.c
> > > >> b/drivers/clk/tegra/clk-tegra30.c index 82a8cb9545eb..70e85e2949e0
> > > >> 100644
> > > >> --- a/drivers/clk/tegra/clk-tegra30.c
> > > >> +++ b/drivers/clk/tegra/clk-tegra30.c
> > > >> @@ -1237,6 +1237,7 @@ static struct tegra_clk_init_table init_tabl=
e[]
> > > >> =3D {
> > > >>=20
> > > >>    { TEGRA30_CLK_HDA, TEGRA30_CLK_PLL_P, 102000000, 0 },
> > > >>    { TEGRA30_CLK_HDA2CODEC_2X, TEGRA30_CLK_PLL_P, 48000000, 0 },
> > > >>    { TEGRA30_CLK_PWM, TEGRA30_CLK_PLL_P, 48000000, 0 },
> > > >>=20
> > > >> +  { TEGRA30_CLK_CSUS, TEGRA30_CLK_CLK_MAX, 6000000, 1 },
> > > >>=20
> > > >>    /* must be the last entry */
> > > >>    { TEGRA30_CLK_CLK_MAX, TEGRA30_CLK_CLK_MAX, 0, 0 },
> > > >> =20
> > > >>  };
> > > >
> > > >I looked into what this clock does and it seems to be a gate for the
> > > >CSUS
> > > >pin, which provides an output clock for camera sensors (VI MCLK).
> > > >Default
> > > >source seems to be PLLC_OUT1. It would be good to note that on the
> > > >commit
> > > >message, as I can't find any documentation about the CSUS clock
> > > >elsewhere.
> > > >
> > > >What is the 6MHz rate based on?
> > >=20
> > > 6mhz is the statistic value which I was not able to alter while testi=
ng.
> > > I
> > > have tried 12mhz and 24mhz too but it remained 6mhz, so I left it 6mh=
z.
> > >=20
> > > >Since this seems to be a clock consumed by the sensor, it seems to m=
e
> > > >that
> > > >rather than making it always on, we could point to it in the sensor'=
s
> > > >device tree entry.
> > >=20
> > > Sensor device tree uses vi_sensor as clocks source and sensor drivers
> > > don't
> > > support multiple linked clocks.
> >=20
> > AIUI vi_sensor is an internal clock so the sensor cannot be receiving i=
t
> > directly. Perhaps the sensor is actually connected to csus, and the rea=
son
> > we need to enable it is to allow the vi_sensor clock to pass through th=
e
> > csus gate?
> >=20
> > That leaves the question of why the csus pad would be muxed to vi_senso=
r
> > by
> > default, but perhaps there's an explanation for that.
>=20
> From downstream T30 sources csus and vi_sensor are always called in
> pair (6MHz csus and 24MHz for vi_sensor), naturally I assumed that
> latter is used as camera reference clock since most sensors has
> reference clock around 24 MHz

It's possible that the csus pad is still outputting 24MHz. The pinmux optio=
ns=20
for the csus pad are various clocks, so it would seem logical that the cloc=
k=20
source for the pad is one of those clocks. However, on the clock framework=
=20
side, the csus clock is just a gate. What I'm confused about is that since =
on=20
the clock framework side the parent of csus is currently set to clk_m, I do=
n't=20
know why setting the rate of csus would affect the output of the pad, given=
=20
clk_m is not one of the options for the pinmux.

It's be good to verify the register value for the csus pinmux to see where =
it=20
thinks the clock is coming from, and then check how that matches with what =
we=20
are seeing.

>=20
> > > >Cheers,
> > > >Mikko




