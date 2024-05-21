Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC9E8CB394
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 20:37:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A98910ED8E;
	Tue, 21 May 2024 18:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5XWZEw0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2048.outbound.protection.outlook.com [40.107.101.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B564010F01B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 18:37:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XdiH6pmzqWbxzWMQFHJ0I13489aNsiM/Mx5HtNaziHCxVZ2/+7U2OunXL+Vd7tBYAjf/VbVfDM/Cc6RNjK95r3Cg4UElJMpIZCeI07hzA6Xq8C5cC4pBgTDvUiUFTMx/fFdxlTiVQsUdLpnPuhLeGE3+82hj36oEqoc9qAmUQK5RZVYehTmOkuGuPpjScVPKOTYyhXkQ5F8fFAWDkudMU5hiOYUetB5bzsgnW3A4xi+JjBX5NKNMAuYXowexbq9LAj8GM5VdeSDnJ46HDE9lHtqlh1lkTyxseyQ4V1haKKVnFBxOmizknCPMDh53wwzHvtw3br5HUbmUOQZyUZWiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6/mx6bGHrUqhXAtKRG94+c9S8aT9dbM498RzyImKPY=;
 b=QkFarlsQstNX0+bSEycqCUjPXW3oioWQCSpdkABoK546cS8qUvfgKT3XgSAJPBjbn4BG2gyknZ/YHoYW6/Cu/oqVcUXsh1zWaP+BZ13xtif3hf0QW+4NIZbYKnMx9wRfj9OfCi7FIPAuztnCwFqwQWPUT9ue9YHTbs/A5G0AW5QyW0vKftOLpyIaDyERvePZXUwSccg/FLDcKBe70Q8Iewm3Rk5AE0G4YbDbIBCqofqJCTf1hiB8fNdbzKKXJ0Ymelean4X9m0M/pmLpFxa4gUXt05X8mWHP3CbJCOj51wbwIkQLzjpgbSw+y7aoiXPUukqFgxJTOshpkjQ2I1EaMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6/mx6bGHrUqhXAtKRG94+c9S8aT9dbM498RzyImKPY=;
 b=5XWZEw0w0ftX9MfHAuehzQ2UmqDf/kqo/6vS9Q3Zwg7VR6bUnFsM4/RQN8701MI6rSmVQP95969yuBXBJUOQaljAApJ7HYssH2o9y0Q+Hgb1YXFGvI5OczHdPB0FXV3yspo4+QPlJwHJWPRTtGPeUhN+TF0HvHbakXNFcWl4Z3Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 21 May
 2024 18:37:06 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7587.030; Tue, 21 May 2024
 18:37:06 +0000
Message-ID: <cef8f87d-edab-41d8-8b95-f3fc39ad7f74@amd.com>
Date: Tue, 21 May 2024 20:36:55 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/9] scatterlist: Add a flag for the restricted memory
To: =?UTF-8?B?WW9uZyBXdSAo5ZC05YuHKQ==?= <Yong.Wu@mediatek.com>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "jstultz@google.com" <jstultz@google.com>,
 =?UTF-8?B?SmlhbmppYW8gWmVuZyAo5pu+5YGl5aejKQ==?=
 <Jianjiao.Zeng@mediatek.com>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "quic_vjitta@quicinc.com" <quic_vjitta@quicinc.com>,
 "willy@infradead.org" <willy@infradead.org>,
 =?UTF-8?B?S3VvaG9uZyBXYW5nICjnjovlnIvptLsp?= <kuohong.wang@mediatek.com>,
 "pavel@ucw.cz" <pavel@ucw.cz>, "robin.murphy@arm.com"
 <robin.murphy@arm.com>, "contact@emersion.fr" <contact@emersion.fr>,
 "logang@deltatee.com" <logang@deltatee.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "jkardatzke@google.com" <jkardatzke@google.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "Brian.Starkey@arm.com" <Brian.Starkey@arm.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "tjmercier@google.com" <tjmercier@google.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "joakim.bech@linaro.org" <joakim.bech@linaro.org>,
 "ppaalanen@gmail.com" <ppaalanen@gmail.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?WW91bGluIFBlaSAo6KO05Y+L5p6XKQ==?= <youlin.pei@mediatek.com>
References: <20240515112308.10171-1-yong.wu@mediatek.com>
 <20240515112308.10171-3-yong.wu@mediatek.com>
 <98721904-003d-4d0d-8cfe-1cecdd59ce01@amd.com>
 <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <779ce30a657754ff945ebd32b66e1c644635e84d.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: ced9a95c-6790-4313-df46-08dc79c503e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|7416005|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGNpQ2U5UHRVcHdJbDZEMytaOEZHU1gyWlZUejJ3NTR3Q1lvOG4yNlZRbzhy?=
 =?utf-8?B?TldlcTFhU0pJanpBS1R5c0V3Vmd3Nm8xeVFqT0JvVC9jMDZ2a0pSbUI0R2Z2?=
 =?utf-8?B?VHhLUDkrNTY1ZFVOMk5DYTlMT2lPZy8rWFFYL09BMVN0Y2FwK0wzSlFWQXRq?=
 =?utf-8?B?WE1UbGxxenZJSnBrVjNvQW96TElET0dqYmw4UDd4azNaTkxLZ2JnaHo0YlBq?=
 =?utf-8?B?ajlUSzZOc1hkczNnRXFINUN5L3NZUDl3M0J4OW1jZlJld25VazdJUVFKMVNY?=
 =?utf-8?B?VytUQk9YOWpXTFlTTTVJUUl5SDdubWJoMTB5N1NUWU9IclJKaGJzd05tb21s?=
 =?utf-8?B?NDlXMXBxMktJUTkxM0g1aVNhZmhjTkYxb00wVStTL1FsYUlWYW9oQXFUUEV5?=
 =?utf-8?B?dWRuMzhzQXQxdGpjMEJWYW9FNGlkbnZKYisrcnpUbi9Hem9INFZyOGpHejZE?=
 =?utf-8?B?dU1zN0kzc2dPQkVkUU9rU0VVU01ObVlRaC92bCtOY2phdWlCeHZyOERYdnd3?=
 =?utf-8?B?ajQ1NjQ2dWJJdmh6SEppa2U3b0F0cGRrNHFyKzhJSXRmcHFseWlnZk91bUlF?=
 =?utf-8?B?cGFLSnIrZmg1YmtWMnh3R0p3WGptZ0IwU3RxK21pTCsvRlloQjZObGlBVkZp?=
 =?utf-8?B?dnlNWG5mTGpBbkdjUXd3eHFFbTBUT05heUVZdjF1MnFra3FhWWNFUFZTWHd2?=
 =?utf-8?B?QzJmT0hZNVd2VnRoT1NML29Ebm5pbnhpdlNoT1dKa0VxbFNHTWlPRU1FVEVt?=
 =?utf-8?B?TjYrZ3h2RXlGandjZUxEZDAzaGhBZFlBbUhNR1hqbHNqZjJsQ1JVZjhrVi9R?=
 =?utf-8?B?aTRUb0svYmVDY25IY1FMUVVkMXZhREpGOW5OaURWd0sya1pQdHhpQjZseWxu?=
 =?utf-8?B?VnBRR2h6OUtFVHc3VG5ybm1kaFBZNmZpemE1RTE2Z0dvQkpWbURORDBvK2ZQ?=
 =?utf-8?B?MFo4S1RoZnBLKzhJb0FNUHpzMi9ZcmNNcy9HbEIxOU1zNU4wdG5uWk40cHBr?=
 =?utf-8?B?K2NKTXhHSGMzZ0hYYXpIV3BYSGx4elU2dFYvcHVOMjdZVEZDN0pLQzdCbE5O?=
 =?utf-8?B?S0luNTMwSnRCRjY1V2tYRXhxdVlBMHFRcFg2QUwzeXlyRS8ydUNsYlFkTnFV?=
 =?utf-8?B?Zmw2T3R4QnMzMFRYVUsrcit3TTlqT3NaSzE4S0NtZDBrUTI1OG5nSFdjN0hQ?=
 =?utf-8?B?Q2UvZFFmSXFGM3UxRDR5SUNRUGxGMXFEcWlVL2NpTjgwdDdQNWdLTStrNENv?=
 =?utf-8?B?M05aNi9obFk3cEdaL1hMemY5RjI0WnZpUDgycDBRQ1JPc3hTcHQvL01SaUxt?=
 =?utf-8?B?dWs3WlRmTjNzNEtML1NFK1RBSElEWnNwZHhnSHl6cnVjVWM2Z3Z5cnRhaGV2?=
 =?utf-8?B?TDFYRWZySWphaUhKL0V3dU9kUCtWblVtWXNodkZPcnhUdERuK0tnNWs1M0ZS?=
 =?utf-8?B?eHV6bGxpbTNVZnlZRDVxM1VQNmxIOWZaR1VhM0ZFK2lRZHNnckZseTRLQmg1?=
 =?utf-8?B?MlgyNG1mOVlrb3c1dzZoYmx5cVBlWlZKUEs5WFE0ZENneVZUSjJ4TUdKS2FT?=
 =?utf-8?B?T0FwVVc0M09FVkd2NGVmcklTUWdyRGQzenE5Y3U3L2F3cGUxSGsvVFA2ejFP?=
 =?utf-8?B?OHpUSWQ2aXFtK2s0VENjbzl3UlByV3BHYXdFYU4xMEY0VHVxNnd3Tnp4UXkx?=
 =?utf-8?B?ZndsRDJSL0g1NGhTR1ZoV2kwdlB0ZUJZSTRhSEZiK0xQekhvT01HTVZBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(7416005)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHEwZDFFdkZsMVc5anNDVElGdHNJcTlpMG10UGRJMHBCOXhtTkI3UC8vc3NY?=
 =?utf-8?B?Sm4zOHQwcjJ3NWpyajV2b1hQSGgzZEluc1diOFF6OEpjM2VaaTBzQTF5Ry94?=
 =?utf-8?B?dGRCMlhCYjgrZ0d2d1I0TWl5T2htczY4OVFHWW5qaVEvTE9remF4K2ZsZ21a?=
 =?utf-8?B?dEhyaHRFMFNvNzVXWDdxSFVkcXlwK0x2SENaN0RqUVF3NjE1bklzN1preWJR?=
 =?utf-8?B?MEkwaU1ZZE9ORkloUkxFS2htSWxHSVpEWU9OY29KSmsrUy8zbyt2c0l4WW1j?=
 =?utf-8?B?Mk81UEVYYmU1dHdXdUZsZUdJS0FKa1c1cVZxci95WHM1V3czQnREaFNUZk8z?=
 =?utf-8?B?SFVoZUdnMXVWK3VvblNyY2tvNkZnWkpMNTVFZklKSCt4ZWQrdVJydEdabjRT?=
 =?utf-8?B?WCtjT29FdkF2Qlp4N0xyNnpac1ErYlZ2ektMZk11Q3dQZGRBVzlZamxrcmo5?=
 =?utf-8?B?dTJMVWQzQm5yRytBSVIwR2RsWE1LWjJRN1pnWkZCcXF0MkN4TjFBdmRlWmVP?=
 =?utf-8?B?Y01NS2I4bzBXYU5jYTQ1MEVYcTBmaytaMW9aK3o5QXJIZWYybjZiYWNZMksz?=
 =?utf-8?B?czZpT2w4emxYWncvT3BHTG9VNmxFNWZYdzVIT3Y2a2IxMnZUZVhzblY0UTFh?=
 =?utf-8?B?LzVOSHhCcC9CUk8xaWdtdzNVOUJEY0ZwV3U3cUlZRERjQ0ttYUZIMlFNL2lT?=
 =?utf-8?B?c2hLdk8rKzhkaXdFTCthbjJaSWFIQnpmaGMydTBnRlF2a1lLUTZ0bDhRWDlD?=
 =?utf-8?B?eEZkSURvR25ZWWpXc3VIbWNQWlVOd0hoNzZsci96QnNvdFpPQWR1WFhwVXRM?=
 =?utf-8?B?TzdKclN3VHpnMTN6Y0wzbDl3UDdEUDFNK3ZGZnI2K3laejZFVXJTaEtDdkhx?=
 =?utf-8?B?WHRxMjZXSVUvM2ZaUmFEbXY2cnZYZXZqZ25nYkgzZWJUeVJWV0MzR3BSZUVR?=
 =?utf-8?B?L3ZrcTloTGdDcEd1d0YxRStwNk5HRDhaV1I2SDJYUUdlUWkwK3doeERWNjEw?=
 =?utf-8?B?dSsya0o5a3U3RTFYbGU5dWFscWtnRVRQdFhyd3lKK1prbE1JcklWVzg1WkVj?=
 =?utf-8?B?VDNEZnJVWThJUndTbTl6Mzc4VDRRT2ZuY1ZIWi95UmphdndMSVhGRllCTnNj?=
 =?utf-8?B?UlJWOGRCdVhaTVVYbFlRWTJhL25QTlJ1dllNYzFhU3dteStUVE1hUWpmcEJk?=
 =?utf-8?B?RmQyeUN6RitqaVRpYzdnS2RQeUQyYTYzVCs0ZFp5WlVwdXJTSUNlVUxIaFdW?=
 =?utf-8?B?T245QjN2RXZ4YWZlVDMvNG5JeHpUbEdtU0dCZ283bFJtM05BMTdUaXYwenBl?=
 =?utf-8?B?dHRNT3BIRVl3RTZ2K1FCQ3hrY0pqUmxldFRqOEplQVA4WE0yL3M1OVZCQTN1?=
 =?utf-8?B?SlVoV0VkL0dsS1hzQzZPUDNxbzhsTDdmNjU4YTZnVGJjV1hpd0oySS9tQ2w0?=
 =?utf-8?B?dlptRmp3R3dieE82QXNMTW1wYVVnUlllM3B3OTdXTnBUVzVHOXpIblA2dlI5?=
 =?utf-8?B?ZVVKZlBadmpxeWtmYXdtNlIwdUQ3L0ZpaWdvRWd2ZlVaU0ZPWVFHbllIeXU2?=
 =?utf-8?B?c3FaZDV4aEsxY3NhQS9TOFJOWjZnOUVSckxWRW05c0VyWmk1WFJGNDVkQ0tp?=
 =?utf-8?B?VjRLWnkzbkJCTlBrb29kUXdKNG45NE1QL2xPTkc4ZnVvbGN2ZTNObHFSK2Fy?=
 =?utf-8?B?TmNtRTZDZDhSZFJvMEVqbTRWanI1bFJnWnA2VVBibXE3NzBqMUpOT0NRaFJQ?=
 =?utf-8?B?Z3FOUGNTMWlybkd0SG1XblpuTnpwdm1DQ2hQbHFuMkxHUXFaQWNpRjlKVkJj?=
 =?utf-8?B?OEx2SWpiZSsvSHQvK3g0MS9NMEY5L3dnRDNOTk16c1p1cVJpRHY5M09QdmVW?=
 =?utf-8?B?ZHJuY3o1dmo0dCtzSjBpSFc2RkQ3Sys5NWNCM1FrRmdhN3dNT3BWNHJMdTJN?=
 =?utf-8?B?WWtLd2F2b3VteTU5SEZQeXBJVy9xVzRrc0JHS29FdmhzVUcrZnFJb2I3WFlN?=
 =?utf-8?B?a3VDWjN4SDJaYmh3d3JBR3ZOK0pFWEV0RU5SUW00aVI0Q3Y3RXcrNnk0d0ZP?=
 =?utf-8?B?cVdScmoxczlWNUtrc0VzL1JNUkhvZit6VFN4N3Q0U04vemU3ZVRmMVdJSE8v?=
 =?utf-8?Q?MAZqDYIm8kqIDrQSzDmSoXYJn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ced9a95c-6790-4313-df46-08dc79c503e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 18:37:06.1908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CK+Mws1giy/ArgtXpZMYsPN+MQjcmzNL+NFD5Eeyv9+No2enzGzwjQ23bZKC2QUY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042
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

Am 20.05.24 um 09:58 schrieb Yong Wu (吴勇):
> On Thu, 2024-05-16 at 10:17 +0200, Christian König wrote:
>>   	
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>   Am 15.05.24 um 13:23 schrieb Yong Wu:
>>> Introduce a FLAG for the restricted memory which means the memory
>> is
>>> protected by TEE or hypervisor, then it's inaccessiable for kernel.
>>>
>>> Currently we don't use sg_dma_unmark_restricted, thus this
>> interface
>>> has not been added.
>> Why should that be part of the scatterlist? It doesn't seem to
>> affect
>> any of it's functionality.
>>
>> As far as I can see the scatterlist shouldn't be the transport of
>> this
>> kind of information.
> Thanks for the review. I will remove this.
>
> In our user scenario, DRM will import these buffers and check if this
> is a restricted buffer. If yes, it will use secure GCE takes over.
>
> If this judgment is not suitable to be placed in scatterlist. I don't
> know if it is ok to limit this inside dma-buf. Adding such an
> interface:
>
> static bool dma_buf_is_restricted(struct dma_buf *dmabuf)
> {
> 	return !strncmp(dmabuf->exp_name, "restricted", 10);
> }

No, usually stuff like that doesn't belong into DMA buf either.

Question here really is who controls the security status of the memory 
backing the buffer?

In other words who tells the exporter that it should allocate and fill a 
buffer with encrypted data?

If that is userspace then that is part of the format information and it 
is also userspace who should tell the importer that it needs to work 
with encrypted data.

The kernel is intentionally not involved in stuff like that.

Regards,
Christian.


>
> Thanks.
>
>> Regards,
>> Christian.
>>
>>> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
>>> ---
>>>    include/linux/scatterlist.h | 34
>> ++++++++++++++++++++++++++++++++++
>>>    1 file changed, 34 insertions(+)
>>>
>>> diff --git a/include/linux/scatterlist.h
>> b/include/linux/scatterlist.h
>>> index 77df3d7b18a6..a6ad9018eca0 100644
>>> --- a/include/linux/scatterlist.h
>>> +++ b/include/linux/scatterlist.h
>>> @@ -282,6 +282,7 @@ static inline void sg_unmark_end(struct
>> scatterlist *sg)
>>>    
>>>    #define SG_DMA_BUS_ADDRESS(1 << 0)
>>>    #define SG_DMA_SWIOTLB(1 << 1)
>>> +#define SG_DMA_RESTRICTED(2 << 1)
>>>    
>>>    /**
>>>     * sg_dma_is_bus_address - Return whether a given segment was
>> marked
>>> @@ -352,6 +353,31 @@ static inline void sg_dma_mark_swiotlb(struct
>> scatterlist *sg)
>>>    sg->dma_flags |= SG_DMA_SWIOTLB;
>>>    }
>>>    
>>> +/**
>>> + * sg_dma_mark_restricted - Mark the scatterlist for restricted
>> buffer.
>>> + * @sg:SG entry
>>> + *
>>> + * Description:
>>> + *   Marks a a scatterlist for the restricted buffer that may be
>> inaccessiable
>>> + *   in kernel if it is protected.
>>> + */
>>> +static inline void sg_dma_mark_restricted(struct scatterlist *sg)
>>> +{
>>> +sg->dma_flags |= SG_DMA_RESTRICTED;
>>> +}
>>> +
>>> +/**
>>> + * sg_dma_is_restricted - Return whether the scatterlist was
>> marked as restricted
>>> + *                        buffer.
>>> + * @sg:SG entry
>>> + *
>>> + * Description:
>>> + *   Returns true if the scatterlist was marked as restricted
>> buffer.
>>> + */
>>> +static inline bool sg_dma_is_restricted(struct scatterlist *sg)
>>> +{
>>> +return sg->dma_flags & SG_DMA_RESTRICTED;
>>> +}
>>>    #else
>>>    
>>>    static inline bool sg_dma_is_bus_address(struct scatterlist *sg)
>>> @@ -372,6 +398,14 @@ static inline void sg_dma_mark_swiotlb(struct
>> scatterlist *sg)
>>>    {
>>>    }
>>>    
>>> +static inline bool sg_dma_is_restricted(struct scatterlist *sg)
>>> +{
>>> +return false;
>>> +}
>>> +
>>> +static inline void sg_dma_mark_restrited(struct scatterlist *sg)
>>> +{
>>> +}
>>>    #endif/* CONFIG_NEED_SG_DMA_FLAGS */
>>>    
>>>    /**
>>

