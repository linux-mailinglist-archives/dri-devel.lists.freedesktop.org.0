Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C6BB1AEAB
	for <lists+dri-devel@lfdr.de>; Tue,  5 Aug 2025 08:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B90EB10E5E6;
	Tue,  5 Aug 2025 06:47:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="RJUmxIJU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PA4PR04CU001.outbound.protection.outlook.com
 (mail-francecentralazon11013066.outbound.protection.outlook.com
 [40.107.162.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6BF10E5DD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Aug 2025 06:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=os4Txqr9GMopzrnSzHfsUkOr3nld6bdsCPDkvWFcI3zdk7knTb3Lm9n0y/FceHWBn7uqQ9fZmJrupU1Zfwk2y4VdkfcJyWAOYb7pHl17kTy4OOr7lXjXOOg5b0aCDnf37JoUH8LFpmBCuotmnwsZirSERz5vh5ILKl13h5VfKGtcjeSXcSCXKVgkH8hhlfxG2w6VadaXxoStPsiNN/L5rBffCOlncBtMGx6FIe4hbnAzhWsrK+IC1AwsqDmCI35BhXGA7/i/o8rJtTKdg641tMs4jZcQ6BDeqm1wpb8XjvLqene/ojpebO+7ZHQ17DsGyUwBaeRn7aios/5NnV/FLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTxmcvvM7mCYksJSV04BJFJ6ROli2MnuRJAahI6sT4Q=;
 b=d6mv0KIvrdz2eRi9+GsUyX3loipQyTLOywoh7vh6aJp6RAtN3MevQrsIgj0sDn2aF5m8PA19onzqTdHMpuvsrauqzMWO7vaP6QrQDvbGahHDpkkFONwt6KsogvSwK8cvo2DQpuYfcp3un10kP0JCYhJ3OiVg4B/dElPPiB/2lDXbiOY/TZonzU9K2URiMdr77R2DKIASFH/W8Socd4yHpKwwG9FFi0u8qAzshZe8wORb7OZQQ7InUxjAv7QvJKPh6+mjNAY6N9lME40HKsWSfw9eVglU78xOBPUqIqfYo/J0tQnTuTGb7kUT/6/puebzzNN4o5dDHXc2l5R1ZEJH+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fTxmcvvM7mCYksJSV04BJFJ6ROli2MnuRJAahI6sT4Q=;
 b=RJUmxIJUkKa3rxrEdEuPsT6i3xZB9CSIz6Dp6YeZWY64m2KnxCe4o879nYIZ5300DTmJRo4BY7No8iJ1stQzLLA+Iu4vBu69CCIUrhoaPqgH9ntVl4yv4cl36V2DUvPjl2JazkzpI9bUgN0b8n6b+sUouXcEPE1S295J+LqaRgwWJQ3l+a0o3lCOrl3XY7jO5XG46ppVpyR+t1+2Frm6LAEYj8mmHntdKRcRd7+cIxEPhPqNEuVsa/duZC7ZYA7vwLKJy3yJHVhirU37ysd9rN+OSgeSqRsS2MOoqKQHtU5JmOGGNJowppK7kYlxgvvt+qqHG1FGK6YdOs/usw28Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB9668.eurprd04.prod.outlook.com (2603:10a6:102:243::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.14; Tue, 5 Aug
 2025 06:47:07 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 06:47:07 +0000
Message-ID: <3dac97e9-d8c8-46f4-8894-52c1e506b347@nxp.com>
Date: Tue, 5 Aug 2025 14:48:36 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: display: panel: Add waveshare DPI
 panel support
To: Krzysztof Kozlowski <krzk@kernel.org>, Joseph Guo <qijian.guo@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250804-waveshare-v2-0-0a1b3ce92a95@nxp.com>
 <20250804-waveshare-v2-2-0a1b3ce92a95@nxp.com>
 <bb6dfd46-90a7-4ebf-b0f7-ad8a67b0837a@kernel.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <bb6dfd46-90a7-4ebf-b0f7-ad8a67b0837a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB9668:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a6ea30-44ca-4f78-3dc2-08ddd3ebe4da
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|19092799006|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U1NUYWhXSzNNTzNkVjl6YXM4UjFjV1g3ci9keUpMV0ZCRGRDTjNvUzEzOFZO?=
 =?utf-8?B?ZXBXclRPQ0dSeis0SFdDTGRVVEJnYkF4dFhQZFVUWGlWUE1Ec3BSaFhTYjZl?=
 =?utf-8?B?cTBxR2RUaVlkR2Mvank1NnlKWFNOZk0wdUJhaDFrMEtUZEJ4czQ5cG5hQk16?=
 =?utf-8?B?Wm1abkRFNGNreXhkd3RWbUpXVTBiQTkxMGhuUWNscy9Gd3cweVZxVXd0S21p?=
 =?utf-8?B?d1RUYk9jU0xkYkE1azBlOXFoWmxWSFl5blozeEIzQ3pzdWVGVmd2UDFNZGN2?=
 =?utf-8?B?Tm1CcWlzTktJUDl1bGZ5eGxZR2oxYzhPV0NkcjJvQ3BjSEFxc2lpeHc1bVo0?=
 =?utf-8?B?NndURVAzUDZuazFhMEpTc1RmQVR5bG9qazdFcnNxcXJCQXhhaytrcXhRMitS?=
 =?utf-8?B?TUhoUDkwRXE3OUpVNXczaWNQdHVKbFNGdUNmNlJtZnVRU3RDV0RzbU9yakVM?=
 =?utf-8?B?emd1bytESEdPK2E1RE9ldWhzUEQ5bHRmcWh0UkljU2U5QnBoZyt1YnRocnVN?=
 =?utf-8?B?cUd3cUg5WFY0RFR1d1BIaUVwR1EvYUdWdmNxc1o3Ri9GNFVwZk45NlcyQXZL?=
 =?utf-8?B?V0JseVFMM05LQWNkUm9zWDlEUnZzeVppK1h1VUd2Nm1qcVFEaEFrWmdLTWlB?=
 =?utf-8?B?bldUQmhXZDkzaG1vdE1lVnBPTFZlcnJtaEZSeXNwS1FaVlJNRVRWY3Yxekhz?=
 =?utf-8?B?Q2VGTE9tb1hCVjJBR3lrMEwwUHRNalRuSXFnYnFicjd4d0FtNFlwb25lb3lS?=
 =?utf-8?B?MGkwZlo5bmJrRnVpazVoOWdRZHpmdDVjR2VJL09Jclo4NkdwQ01lMmZaNFZv?=
 =?utf-8?B?cE1EV0FRK2pkRUdQNE14R0NBbG9lYmtLQW4xSGs4YUQ2eU1QQXdYYUgwakJn?=
 =?utf-8?B?ZXVPVUZBY3ZZOGp5NmRPMU5mMVJBR1lWN3B1dUtNSFNKaThyOEJzYWFmU2F0?=
 =?utf-8?B?dmR2aUZrSG5CZmhWcWdHdzRuY3dVK0VOdXByb0JseHNnRUxmQllKZ3FYYUs5?=
 =?utf-8?B?azg4NUY3UkFJK3JoYVZjRDVtbjd3NE9uTGozREI0clpKditnOExiVXo4WWF6?=
 =?utf-8?B?bnlKTkJUOGlkLzBrTVhqREpDdElnM1NhV0tCYWdRZU5iRUtVU1o4Q2dIU2Rr?=
 =?utf-8?B?RXlBeFlsbjBYZDBEdUZiVjF2anFSNlhQWGgzNlZuSUJXSy9uOWVQSlpUcEZQ?=
 =?utf-8?B?Vkw3Qmd6cUd6SG5VK2RuY1hXWnd0SFBHUEJWRExQcDhhRGZSRmxIRFdQbGUz?=
 =?utf-8?B?SlJoV2dSeUR0MFpuVFdxczVkbVY1ZGVvT0RJY0EwMngyYjRsQ3ZuR1FtWFZH?=
 =?utf-8?B?RlZyVDd1aEVKNHJkYzR1UG5aQlVGWU5oS3RIaFUvMmhuRHBuZnRDd25WRENY?=
 =?utf-8?B?QVBSWm9ockd1SFp4MGVwTmlGdXpkY0ttd3BlTVZHVG8rbGdGTlFQRExwckNw?=
 =?utf-8?B?SDU4UVp6OFYrSmlMQVZVRTh4blBsYWpQbEorb3JXYWJVbGtYeWNuYzh1VDZH?=
 =?utf-8?B?NWQ0SUNDOUhjcjdXVDI2cXo2T0ZOZDE0czB1UlNIb0VFUzF4T3BtcEgra3VZ?=
 =?utf-8?B?N2ExWXhZWk1lM0FsUkgrQmVDY1JpWXZBTmxaR2QyYk5iY0tEOWR3clZhOVBt?=
 =?utf-8?B?aWhadFE0QzNQclU4OE9IbURJOHI0d0g2ZUxzY202aStiMjQ3QTVyRXlYYUFo?=
 =?utf-8?B?bUljZ0FqSW1KMHh2TTcvY0xpNlY1NHllYy9UQllLSVJBVzBBdW1PVG1jdWI1?=
 =?utf-8?B?akl4SkNPSnkxMjBlSU9ubUV5RktWN3N2blIxaUFmLytadXpsYjZINkp1a1Fp?=
 =?utf-8?B?VUpwUUEzeGZhWFZTS1F1dUFTS05tWXF2eDNEWU5KOFlBMUM4Qk90R29yRXBM?=
 =?utf-8?B?TlhKSEYvak0vMWJmRGhDZWc0UTdDNTRBb2d2RVoxb1dqSDQ0MHZuWDdmTkFu?=
 =?utf-8?Q?LHvruz47uHo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(19092799006)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk5uOVBoalE5OGM1L29zYm53dkFOekVjMnNzaVRxaE1xSWJIVlZOUTZMVFZY?=
 =?utf-8?B?OEs4emlJQVY1VlFXK0pFQ1dlODFITVNPM3ZSSU9JbkJySTMvWFpkaXlUQ1Vl?=
 =?utf-8?B?eDRlUDdxeHRtdzFIOWhkaXpmSFg5Mm0xU3R6RVR4VmtJaUpqOUM4d2UyNm9m?=
 =?utf-8?B?Y0ZCN2F0QmpjWE9WeCtPYUNsR0ZOc0dXUGViZFZnblkrdi9UZmRlNlJoL2VJ?=
 =?utf-8?B?R21XMUwrQkhOSndYdWdEbHh2OXNjQmlvUGQ4VmdZc1Vuc3ZGNkpmNnpabFdD?=
 =?utf-8?B?Z2pJNFNSWDFpa25RWnR0dFJvSkV4NnAzbWY0azBBazZFRUJCcjZ0OCs0Uk5N?=
 =?utf-8?B?SGdQTzZ2ZzFQM05WekM0Qk1HSlVhT3dnbGdIMHphcUJpRW9KeFVrTlFmNXdM?=
 =?utf-8?B?ZWdTM1JGa1VaeXhYSDFlN3UweE41WWVZSnEzS1llVEREUW1nWkI3cy93NEdG?=
 =?utf-8?B?dmZpUzJVZ0VreVVwTmdiOVdYL3Fkb05aRWlmWTk5Qk9wbGNqci94bjczL2I5?=
 =?utf-8?B?QWtRZ3JyZFFQell2eXVjQ3oyalo2aERVVkVoencxMXJJVDU5UTNZLzQvcUFQ?=
 =?utf-8?B?Mm5iOVlWWEhSQ1VESEdrMlVhSmRlL1MzdXpNbnlxZDBpQ3ZaWjBNZmRub2ZU?=
 =?utf-8?B?ZzJZanppSWxRTnlhT29XWE8zWXQzYkptdWtXYy9NM2pOelNlWWloRDAvbHEy?=
 =?utf-8?B?Yy9oSkxaYmwzTDVKR3pxb2c0dGIrVzFZOTVtck1UTjA2UE5iMVBvSUxML2FQ?=
 =?utf-8?B?cWJRMEVYc3lBaFpqenQreFo3V1BzOHZwWmt5dHFTNE9uNXNmNnVWc0puWG94?=
 =?utf-8?B?RnRzb3V4MlZkRWQ5NkNPdVNMSXZ6NzBPbGRxT2tnYjJjendoTVptSXJIUVN4?=
 =?utf-8?B?ajlVc2Q2Q1BqOEp1dWpkdGhXUS8rTHhNczZxVlUxOGU3WVoyem52N0tWVUJo?=
 =?utf-8?B?UDJ3YTgvZDdqSVVuS0NYTUY2dnpPc1ByZmlnb0poYlpDUzBTOC9sbDlDcmM1?=
 =?utf-8?B?ME1tL2VaVzBoU2l5dXp4enRiMzhyUlNQLytTZ0FwK3NndjNpRkZaSy9Fazdq?=
 =?utf-8?B?ZGRpbEFNVGErRnIxakxNYW1TSGY0a0tYbjEwdzk0cTAyL3BrTDVYODVtQldO?=
 =?utf-8?B?bjNGREZuRXNxUitVZGxTRlQ3TjdTL25rUVdXMzFydGVtanVobXRPTis3VDQz?=
 =?utf-8?B?aEZVYTRoQU9YWHFHSlloZTU1bXlTaXZiYTZMQ3RsSnJ4SklQNTA0RFVySWNN?=
 =?utf-8?B?VWtZTk9sQlgxS0xERklYUnhzbEdBakIxWVUrZHhRWEhnVEN1ODVWYjhUbzRa?=
 =?utf-8?B?eWVuYzdTNU4zYVFWMkhNdmxVT2MxOERZQnBXTFUreTJvZzdXRnNobDBKRDZM?=
 =?utf-8?B?UnpCUEpIY3FTeXhuQUg4bkJpUDFCQWRTL1Q5MGk3aGkydXpHcnFjWjV3bDNV?=
 =?utf-8?B?L1Z2UlBJQTB3ZUE2OWY5b0J3eSsxdlIxS1pTb01nSGV1TXN4dVRzQ3hUN1Ra?=
 =?utf-8?B?YjI0Qi9pZWMxQUVucEErNktlKzRXNlBkdTMrUExXYmFOM29mRlg2UXlzcitw?=
 =?utf-8?B?RU4vR0Y1dXJWQTN3dmtOVmtvWFN0cDRvek5EakZpaFJpMW1md0RzbkRkdVVK?=
 =?utf-8?B?V2RtTm81VHUxVzErOTh6Y25JUlhoWUY3U3RiVWhodE5iSitOdk9KcWlzUmVa?=
 =?utf-8?B?Q0syUTRpanhpSW9zdHl4T2hnMjQvTkJPK3ZhYmFweSt2VVYwYm9LRENlYTBn?=
 =?utf-8?B?MWhrMjA4cFZKaHI3bS9nMFhIUG9jK29sSlZteUZEOGNZOXpNaW16NWdTQ0lM?=
 =?utf-8?B?UXNwK1NqMkhYR3lrWDVPcis4SEh5TUk5UU0wQlc4ME9XSWxubWxNUXdQdVlz?=
 =?utf-8?B?dks2dXFxSWMxTUN2NmZGSk10ZDZHNkphWTRqTzRPeVdoZGRCZ082WXI1aE9o?=
 =?utf-8?B?N2VGSEl4RmNQR3pPdjV5VzV2bVNxYldjQjZnWFV4UG5wN2lOYmViU3ZhL1lQ?=
 =?utf-8?B?OWg1c1ZOS1ArcHFNTUs4ays2TmxjbUVuRGdsSHFPc2FzUlRJdVRKd1FpMHVh?=
 =?utf-8?B?R3FtRHhCMkkxeXJ1Z1ZocTM4emo2alRDV1J3MVBITW16TTNnQkJXNloxWDVl?=
 =?utf-8?Q?PJcGXB4s78MKK/83CKXSPbplb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a6ea30-44ca-4f78-3dc2-08ddd3ebe4da
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 06:47:06.9739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XtUaE2eRjpw8zULg47g2IaJrU0YEM+vVfoXXiY2DbJet9XtWtHeH7RiD1qoY2THQlio2/eD5HaSx+bUnRI6HuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9668
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

On 08/05/2025, Krzysztof Kozlowski wrote:
> On 04/08/2025 04:07, Joseph Guo wrote:
>> Add dt-binding documentation for waveshare DPI panel
>>
>> Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> 
> 
> That's not true. Please point me to lore discussion proving you received
> such tag.

Joseph, that tag should be A-b instead of R-b.  You may use b4 or patchwork.
They should collect tags for you.

https://lore.kernel.org/all/175305199815.3017932.12028214384187991932.robh@kernel.org/#t

> 
> 
> Best regards,
> Krzysztof


-- 
Regards,
Liu Ying
