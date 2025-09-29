Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD466BA8552
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 09:55:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5106110E222;
	Mon, 29 Sep 2025 07:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="a2MlVNzv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010070.outbound.protection.outlook.com [52.101.84.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EFF10E222;
 Mon, 29 Sep 2025 07:55:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y8pnEL55wpT87hIqkxPiAJc4V3q3SxF5OWTytgPvBVojpu9k6vXdIeBGfWLW9o87rRRH3aYQNih2zuwK/l8LwEwR3EOWgMCwddtQmaB1NenVifMlXgSFw5EL29AsJUgHNSq5siMH9KuViUkXY9d90oO5nx9GpHi1WoGeHA783nksT4WcAcjK5hDEwzTu+z2GCzv1AkAaaQMq5OKaVhRGx9EaWZKen0fn6eQSTiZn2nUydgOLjGlr7DDJj7x5bCfKXXBnzoOs/fK/mTxJ4ozDdcqlEofJNu59RyrCMnhrgoeU04pj964AdAHeFSleazkSC1nKN2z2lBBEoe6e1sWTOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGpN2YKLA3WqQLAnfjAzEIn1Q5947fDktnHF27+sjWo=;
 b=AqBEXUHeOapekEkDXwV8UlnKXfqEmsf1O/GyvXJxqS5AzqLrByHhoXnfbWzG409vU1C0RWMbr/grvMqIDibVKT/cvFvQGRy5Nozewl08PflOao4+L1XjYeLQMOpdUi3gW2UZySacwYGLs1jzVOTCDQhlfW1rSQ4nXH2rlQYoDz7NOPokDP1Oz5Wu1g1qN+3yDtuD36KlTymfeiEPb/9DrGO5dvvbZvD1i9ffTwDtyAcCB9HyCkdw5wdu9ig2hpYIiR7S/+rnorbnIj6NESxjf784JlwrwKazYtvUgFA+HN5hYWSFbJBe3T0mEU6zPmuHeUSn+qTqo/n8IyKNifM3bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGpN2YKLA3WqQLAnfjAzEIn1Q5947fDktnHF27+sjWo=;
 b=a2MlVNzvFhIWDalBGYrJlO7733smUPcLJ3P9bIVf8MVhFyVftAiCkWcp9Dhi3/2gl6MQSndx4K4cVdowOP9Ye7VOLooMNtlMU1ON7QrT54FVZFhMdQve8Spw2/O83q6PAf5sYnRTc+SmiYcqQ2Ki6Lfd5Kqeu1MJkML7Mnv/CkBNmkQKwvEQYM6qWaIWfJlc3h0hIc7F4a5pPfDNDWkxxa1zm2YZRHUSoM06FUn/lNDY7nkXffgyDD/psuRQ7us+S8cFN9gi8ohC8uZVwI8t9BiuHGYmHAeAzzmf82Elj+qCwgZAc+MQCQ64PBDm3pzIc2v15TCe+LlSiZCUtfBHog==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB11419.eurprd04.prod.outlook.com (2603:10a6:20b:6c4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.10; Mon, 29 Sep
 2025 07:55:04 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 07:55:03 +0000
Message-ID: <a7f0ced8-d704-4a59-bcc7-e0bd4db113fd@nxp.com>
Date: Mon, 29 Sep 2025 15:56:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] drm/bridge: ite-it6263: handle unsupported
 InfoFrames
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-sunxi@lists.linux.dev
References: <20250928-limit-infoframes-2-v2-0-6f8f5fd04214@oss.qualcomm.com>
 <20250928-limit-infoframes-2-v2-3-6f8f5fd04214@oss.qualcomm.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250928-limit-infoframes-2-v2-3-6f8f5fd04214@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:194::22) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB11419:EE_
X-MS-Office365-Filtering-Correlation-Id: 601b5fae-8cba-4db1-c4e9-08ddff2d7f4c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|7416014|376014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1FsdjR4bVNDS0ZtbmtUWDRXVXFxN3VLaWdwdURpK09pTWMwdk51RjFTTHlF?=
 =?utf-8?B?QWE0MExnb0MrM0JuV29lcHRKZDhvVGlBcCtXT2JMOENZQ0Z0TWQwNXhzdTJE?=
 =?utf-8?B?ckNVNEwzRlVxeGlTRWtHOHFhTkkzMWx2eFFFV3ErWm52R0FtVmRJTkhlRHVt?=
 =?utf-8?B?dEk1a21JZmdyUjRRay9XSFFkNC9LdnpDVDB2TDdCc1NCUmpEeWN0MER3OG90?=
 =?utf-8?B?TWljc29aMVRoT0UvMnZiTkRpUGpoOUtQYisyb2xqOEtraGJLWlNLOHYrTTQ5?=
 =?utf-8?B?L3JnOHlielREWVFtdFVJMk05N0tQQmw5SlNHSnR1eUllQkVKU2FZVWxvZVo3?=
 =?utf-8?B?QzVpNWQ0bVd0QjJzOFVnUzA5RUxVZDVVd2VkOThETmQwbm53d041Z1dydFZ1?=
 =?utf-8?B?RU1vb0dEWm4yRDJDSExsYm15Z2xHVklVSzZKOVFFMm5PdEp2dldUcjZrZmpk?=
 =?utf-8?B?U1lUck8zTjhFcUpSaHZNMXQ5SXcxTUNwajF5K2dZU28zRFhDeEpaQjEvZjAy?=
 =?utf-8?B?Um9GMlZraHNvYUFHMExBMlpVTFYvVTBhY3B3TCtWL2k3a3pveXRKWW5EYkl4?=
 =?utf-8?B?NHpKRDloeFJCM1RkblJFRUlwV0JZSC8vMnQxaExHOTVMVDU2Y3JoUjBSN1Jj?=
 =?utf-8?B?ak5oU1pUYWlBOSs0RG5ISVlvN2RiT3JWV1NEdWh2d1FYZDJjWjAxcytYZEkz?=
 =?utf-8?B?UGtxUnd6US9QRytTQ3RJRmJVUGdDaUlPSlVmWkhGQjJkeGtQS2lQV3hvZndV?=
 =?utf-8?B?alRRVC81VS9jbUZuM0dTcFlBVzVka3gwTGNvVDczZ01sWFlwMzJ4ZXJURDJh?=
 =?utf-8?B?Si85Rmd4c1Q2Z2ZHUk9YTGN6RmVORjA5U2JVV0JINlg2RURlR3pKeStoZFNi?=
 =?utf-8?B?bm1TZm0xNGdobEdoQTd6SmVGRGtveU5MemNZVVlhNUFZWHdWdEdNZjBKL2li?=
 =?utf-8?B?Z1NoOFhVcGxDT2IxdlN6Z2NSbXFJczRkbGxrVlhVbDVNQUcydk9ZcldoclFP?=
 =?utf-8?B?NW9ESjMrZGtKSTkzL2M1SFh5SzNwYWYvMVc4ZUNRVmsyUnBmQ21nbGliMFF2?=
 =?utf-8?B?RHVmRUJEeWEwNWVFN0hnbjIwalI3bDkwMFg5ZTcrckxaWGlqK0dsck9wSTdi?=
 =?utf-8?B?bGRhTWN3cUUwQVd1UThOdm0xMGNWei9HbDE0NEp6ZGVBZnlPY2VkSVNZeHJN?=
 =?utf-8?B?aXU3ck84bndQZFp6VDkzRDRZZnVPZmR3SXBpWjlQK0xKL0dFNnZxZEYzeXFO?=
 =?utf-8?B?cElXNTc0QVpuTnVZUjBYQm4wREQ3NEorY3ZiMHYzalc1ZG8zWDE0OU8rcmNE?=
 =?utf-8?B?V2trQWszM2ZoQ0UxRmtiZ29Id2hPZGl4Y3BpcGo5WkUyMXh5T3ByVTMvTHov?=
 =?utf-8?B?VjZydU5KTzZOYXE1SlQwU1lkQlRocXNUZ05yZjFsaVV3T0dUZ2w2RkJNRDhH?=
 =?utf-8?B?dE5FY09HdmVLU1BFVGVHVllhTWt2U3FFSEErUEpLSVlJMDR6b3NJZXhWYitO?=
 =?utf-8?B?cmNITmRTMUwxUmQxMXBpMGE0YjNRUXA3dkRDWWtjOWhHaEw5M1ovdVBsSDBD?=
 =?utf-8?B?NlhFS1hDV3NmZjdyVDhmOGIrMlJGVTFLMlEvdDM0YkZQSUZZbVpBWWpSUXds?=
 =?utf-8?B?Z21nS05ZMzZuRk81ZGNWVHZmbXNQeTd3TzVZWm5yTGZEM1FzeExLS0hCOXNy?=
 =?utf-8?B?akVwWnY3czJWMUl6VTh1UXJtS2xUZ0Q3MkZ3Vkw4UkdJMFBmVWVtSWN6ZHVl?=
 =?utf-8?B?T2g1QmhzNzRmemJEcCtMdEsrcnpYOXd5Wk4xd3dLNWFtWFlmOU1VSW41bmdH?=
 =?utf-8?B?ZEdoaUtYNGRiSzRTZnRHYkNFYldIditwZDdvZHdFNEpDa0ZUOVg2aFl2Z1B0?=
 =?utf-8?B?TWVudDVlSjhuS1FtbVRTVU94T1h5TTRYMzNTeUY2OUE4VmZ4YUZDVTBwL2F6?=
 =?utf-8?B?RFZ3UlB4SHFtOFE0UGVSLzRGTUdEdUgvYUxCSExhcDhZMUpSZzZNbk9rcWxS?=
 =?utf-8?Q?ciV/foHmKKVXubfCJmfmrB46AIPss8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(7416014)(376014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVJEUXNFOXp6ajloc2dqK1BrSTQxOEJIVTJSNXBZUzA0NmNyRnpzSFJ6TElu?=
 =?utf-8?B?WHZZaXNyeXQzU1VqdEJoLytNLzU3V0ZpK1V4bGxXV25zcnlab3BrVmV2SVZH?=
 =?utf-8?B?RGdjaWJBem5qOEozS0JjVDV4K1FWeFdJOWZVTTZZYkVGRXgxSS8zYndkNk5L?=
 =?utf-8?B?eGxvem5LRW5MUmZabHBQZlh2b2JGSUJCNjlHazFqY3pQSkVEU3MvSWRja3Zw?=
 =?utf-8?B?b1pHZnhTTmVNOCs4Nk8vbithMkkwekx2WHVQTkwxQXJ6K2Vrcnlld3puUzM3?=
 =?utf-8?B?NU11bjlUcnBTMkJMZXpuOFI3MTE2UEo3VW9tNlB3RjdEa05NRE5TSzNSQXFM?=
 =?utf-8?B?NVozYkV4N3JyemlTdnlzakt2Zis3cVZDOXJNL21QN0V0T1l1b1RiSy9rdHhy?=
 =?utf-8?B?dXNicXhidnJJbW5OeThYZ01QRWZadHVHcmFLV21lTGV6ZFlQcGVDZWhYanBv?=
 =?utf-8?B?Z1dXTlo3NWhscVg5THFZUW5GWjJaYWpCRUY2a2FxOFE1Y2VQdEs0dnNReTE0?=
 =?utf-8?B?YnNRS25mRDc3WEtiOG1PaVEzR1Y1THpwWmFwS3dWZGRFWEx3bkRrT05pOGVQ?=
 =?utf-8?B?cm9NcVp0OFova0tzd1hkejdEaWFSWUdMbWpISnhEVjRldTNMV2NsNEhkZkxx?=
 =?utf-8?B?VVdUck8ycDlYTEg3SVhVUXlNSmkxWUl6akQ3Z1RhckdaN05sUCtaRjU0UW5R?=
 =?utf-8?B?R2RVM3hwbTJoN29jbXM5dWdwZWJzZjBrQ1hBZ3dnUEJ5d1dnQXh6bStSaWRh?=
 =?utf-8?B?UkFVdmFKRSs3YVFZQ1B4c29HSUhITk5YKzdUdUpmRjlKZGhSTWlXT3hXb2Fz?=
 =?utf-8?B?QkJoUHFWeC9wV1hYTWs3KzhKdDFpeXBNMW9IaGdGYXFlb2s5SXhma2NUYldS?=
 =?utf-8?B?dkdGa05DSmNYOFJzaUlUV1AwLzh5NHQyR0s1Q1ZSQXlQUjdxbDhvdDFWT3g0?=
 =?utf-8?B?VksrZmw5dkIxSFdLc0w0TkUvVDRvQXgvV2VjL1kwZDMwcGZQdUJpUlREd2tX?=
 =?utf-8?B?Qi94SytTOE5BUmsyWTJRUFlCWHB2SmpzZHRsc2s4VUVMY2Z1b2ZEZVNZbWhu?=
 =?utf-8?B?Qk5RMFJsVDQ5TTRudEVHZURhQmVKK3J2Q3c1NFBoQ1l2ODgrVUNSVU4yamRs?=
 =?utf-8?B?dFUxODFMSFdzOEFGVVlGbndsUXc5TjlQb2VWeEQvYnpRY1pWYXdBejRPN0Jp?=
 =?utf-8?B?ZkhMV2k1cUloeHAwNnJrdVFQNDljd3Y4UG5ac2MvWG5QS05tM3dva2tFL3dE?=
 =?utf-8?B?Ky96dGU5NmVZb2FMNldHWDQ1ZlVnVENWalpOdzZmdmpJb1U4Z3AyQXAzcXBD?=
 =?utf-8?B?dXhTaEwzcExWdTl4RWhSMWMrTWxJb3JTbHpYcldvbGNCbG9qeE1SdkR3SGdU?=
 =?utf-8?B?VkNCN2NKSGduZkxkaHVUZzZ4Q1ladld2c3FWRnhmN1JSZjQ5R0hialhhWFA1?=
 =?utf-8?B?MDNQbEVWeEJjZXJ0TDc1SWMxenAyVkJLU1NQeFozOWF5ZFNGb1hWWmxXZTZS?=
 =?utf-8?B?cFlZTTBqem5OYmY4Z3cwaFNQMUFmUXJwckI0V3pIbXVOVkpHNTA1OU9DVXI2?=
 =?utf-8?B?bXdORjNMWFd1dUNDRUh3Qi9qVjBqelhmdk1WUjk0WjkvSERsNE52aWwzVitR?=
 =?utf-8?B?ZTNoQnlsY3BKRkxWc2F2OTJwc3RQSUdpVXowZDc3V1JlaGV3MDdjL2tqQkJL?=
 =?utf-8?B?TEovYnBYZ3VhdWtxU1VuZHN0N2RiZFVLY2U0RzNEK2dYUTlXOTc3SzR5bW5H?=
 =?utf-8?B?bGZmVFc4N2c2UktsVlBIRm54OW9kdHU2L01INFV6Uzc3SnBVak5waHowV1ZN?=
 =?utf-8?B?YmpLTFlRZkk5QldLcUxKSExHajBGaEEvVUJZbWFnalRyZlB1WnBvOFlwbTJv?=
 =?utf-8?B?VWZIK2djS0dZaS9jTS9QM1VReGM3aktSOC91Y1Ezd3EwUFJCM0FudGdnL2Z5?=
 =?utf-8?B?N2dWVDZxVHBua0x0Rk9HSlRJNzFldFY1NDZsVGZESTlrWWJwL2NQMzVZRUF2?=
 =?utf-8?B?T3NscHBEZkpxRzJKWUcxRjc5cmlaTUtaNlkweXg2SHZNN3pWdVYyYU91aWl3?=
 =?utf-8?B?MG96NG5hbnN3MWZBZ2l5eWxZbStwOW96QmZhRVJpNTB3US9zaHBPWFVCSWFB?=
 =?utf-8?Q?WnxGfR+gJP/WwR6JO2EcxqCyh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 601b5fae-8cba-4db1-c4e9-08ddff2d7f4c
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 07:55:03.6288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y2k00bEZk84p0qmE31cSepeNrNS2duRRfs3sO2f46DHsBW+SiK33oAaRxde+sEfa1qVJfRXnLyxkUnMzW8BYUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB11419
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

On 09/28/2025, Dmitry Baryshkov wrote:
> Make hdmi_write_hdmi_infoframe() and hdmi_clear_infoframe() callbacks
> return -EOPNOTSUPP for unsupported InfoFrames and make sure that
> atomic_check() callback doesn't allow unsupported InfoFrames to be
> enabled.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/ite-it6263.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6263.c b/drivers/gpu/drm/bridge/ite-it6263.c
> index 2eb8fba7016cbf0dcb19aec4ca8849f1fffaa64c..cf3d76d748dde51e93b2b19cc2cbe023ca2629b8 100644
> --- a/drivers/gpu/drm/bridge/ite-it6263.c
> +++ b/drivers/gpu/drm/bridge/ite-it6263.c
> @@ -26,6 +26,7 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_print.h>
>  #include <drm/drm_probe_helper.h>
>  
>  /* -----------------------------------------------------------------------------
> @@ -772,7 +773,7 @@ static int it6263_hdmi_clear_infoframe(struct drm_bridge *bridge,
>  		regmap_write(it->hdmi_regmap, HDMI_REG_PKT_NULL_CTRL, 0);
>  		break;
>  	default:
> -		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
> +		return -EOPNOTSUPP;
>  	}
>  
>  	return 0;
> @@ -812,13 +813,35 @@ static int it6263_hdmi_write_infoframe(struct drm_bridge *bridge,
>  			     ENABLE_PKT | REPEAT_PKT);
>  		break;
>  	default:
> -		dev_dbg(it->dev, "unsupported HDMI infoframe 0x%x\n", type);
> +		return -EOPNOTSUPP;
>  	}
>  
>  	return 0;
>  }
>  
> +static int it6263_bridge_atomic_check(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *bridge_state,
> +				      struct drm_crtc_state *crtc_state,
> +				      struct drm_connector_state *conn_state)
> +{
> +	/* not supported by the driver */
> +	conn_state->hdmi.infoframes.spd.set = false;
> +
> +	/* should not happen, audio support not enabled */
> +	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
> +			     conn_state->connector->hdmi.infoframes.audio.set))

Maybe use drm_err_once() instead to provide the reason for the warning in
a string?

> +		return -EOPNOTSUPP;

As this check could return error, it should be moved before
'conn_state->hdmi.infoframes.spd.set = false;' to gain a little performance.

> +
> +	/* should not happen, HDR support not enabled */
> +	if (drm_WARN_ON_ONCE(bridge->encoder->dev,
> +			     conn_state->hdmi.infoframes.hdr_drm.set))
> +		return -EOPNOTSUPP;

I don't think IT6263 chip supports DRM infoframe.  The drm_WARN_ON_ONCE()
call could make driver readers think that DRM infoframe could be enabled
in the future as audio infoframe has the same warning and IT6263 chip does
support audio infoframe.  So, maybe:

/* IT6263 chip doesn't support DRM infoframe. */
conn_state->hdmi.infoframes.hdr_drm.set = false;

> +
> +	return 0;
> +}
> +
>  static const struct drm_bridge_funcs it6263_bridge_funcs = {
> +	.atomic_check = it6263_bridge_atomic_check,
>  	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>  	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
> 


-- 
Regards,
Liu Ying
