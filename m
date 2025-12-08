Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B419CCAC3D6
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 07:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DF610E0DD;
	Mon,  8 Dec 2025 06:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="izN5FLKz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013004.outbound.protection.outlook.com [40.107.159.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797D810E0DD
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Dec 2025 06:57:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VmMopdUSwQS416vijBpQtTq3tJHJqZnkVG7YaePSNJ02hoREjQsB3X+StWnD8yh73m5v6yurOQnRy2p4ncEYmO68Ee0mYWMekcpg2QSaW1EI9ciLsO4Qmro0pK5f+zEVMuYWBZZLymk5xlw+j9ZM23dPK4gDeaqllqMWh3UKRl8hos2//8N8LPN6R4jYMytVpsCbC8vzU7kAFiatAzbyV7Hi+0SCxPTTHrqjTG5YZVH/OelFhXT/Y26teDg1iRJ0kgkMH3Xpe2//tVEeya02priohI3xLUqyqyPm84ldV9w0X8huHz5h5vEm2Q0F88nLagF5FI/Lrd5qguX4fS4Y7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKTMs7vjL0bvmmoecSBZrlPZiTNVZC8DnZiOE/wU3pE=;
 b=BpIlh7z0HW+AXsyLcUmGO49fPrkqhalKrTjetzLMNvu3OfKAfTLnbHnj9GgOvKo+XToht5Od2UBgRIUpVMoiQEfjeqMmvS2ZosuvSympuyVIgJPHqDzR8rCNhP5Ma8k4CrycLA6aSTPg/zGraPDgjKr70sWzCr+KXjbbNmdZ849bN9yEg6WQMtR0UU3TkKF3lsU8nNoQYZMPI6CrGZGIniSHXkAyj5deMwoZ4FTu+k9Sspn/dGNRmmooqyB2Twy/yN8lFF3bMeAkRfysAjdQZIhWI18DlY4+pRaD8OkfuvpKpeWL9ttgulcO5euM25kcCLurdlhUonFcTJ9vpmU5Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKTMs7vjL0bvmmoecSBZrlPZiTNVZC8DnZiOE/wU3pE=;
 b=izN5FLKzsALzFVQlvQrO/OSGAq3zA4l2jOVB8tYGc+lwgIK+KaHUER/c5DKDv6oqsjZlSFydD4ilzszMkJ3ovg3SswknqHy8ld3VD9qWo1wvlNjQ12AH+4+i3HB8aQRJjn0DhNsMmwNupgGMyT8+In6Fay9tKX6TPupSR6l/PWCUPMOlacrUl6tbzW6sCEgBAgTISi7kc70ZrFp1LXs+A/1/oqlmT52OKLCcJBGXQnUl2dKkLsI8bui6bqJSTJJKfHF02R9QtxIrzylGNqftHxNMbcNjSKZTe6J58/WzFOtr657FarSHRZQaMvrusQTdJbh/EHC3tf/078RCnt+rzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS5PR04MB9731.eurprd04.prod.outlook.com (2603:10a6:20b:654::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 06:57:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 06:57:03 +0000
Message-ID: <f53be351-e059-4a71-bbbd-7a893e954169@nxp.com>
Date: Mon, 8 Dec 2025 14:57:34 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] drm/bridge: imx: Add i.MX93 parallel display
 format configuration support
To: Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20251202-v6-18-topic-imx93-parallel-display-v7-0-2cce31d64608@pengutronix.de>
 <20251202-v6-18-topic-imx93-parallel-display-v7-2-2cce31d64608@pengutronix.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20251202-v6-18-topic-imx93-parallel-display-v7-2-2cce31d64608@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR03CA0104.apcprd03.prod.outlook.com
 (2603:1096:4:7c::32) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS5PR04MB9731:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dcc6619-e695-412a-124e-08de3626fdd6
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|19092799006|376014|7416014|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UExZcUFGUmxhT2NCZ3RjbDIxSkh4a01majVQeC90NmE5aFhrWXFwK2FPWG4r?=
 =?utf-8?B?eDJ6ZHhQMGpNSkRZNmFZSjdSR2FZNmpwelNieGszQ2RGVTV5TktZTWpMZ0ZF?=
 =?utf-8?B?Yk5vcVlqZzZNZXdYdzdpS256MCtNUGpzaXBFU1NIZWZsd1k4dDhaVUdEMU92?=
 =?utf-8?B?cTViYkhlOU1JM1Q4a1R6aXNUMlhWd0xvVkhZRjA1dVk2dnNNUEMyMGYxZWs2?=
 =?utf-8?B?aWV4cTY5UVdiMVI2bWFpZVUyWXlaRGRkSUtaWGVKWGh4ZFVtRnI2dEl4ODhB?=
 =?utf-8?B?YXFPVlVRenBIdTVxdXczT2tsUy9lSlZ2N2dMRzVPVTZsYTdYdzZNOFZvOFp2?=
 =?utf-8?B?VExYaU4zNlNndmtsUUtBZWJlWkxtN2duR29jR1JsTEp0Nm93bkxDRi9xUU9q?=
 =?utf-8?B?ZnorNXh3Wi93czRzNEczS1U2TDB3bjREUDR0Unl4SXBLVTNnUzlhcldETVpD?=
 =?utf-8?B?UDNrVGFsVkZSWmQrMytpRW84aWJLZ3NmejltNHhON2tvSGI2VDAwakQ3WDFr?=
 =?utf-8?B?SkR0UEw3d2d1YVBZdW9MS3hFMUZrN0lvdjd0OTVCWGpPYVBJaXp0d1pyNkM5?=
 =?utf-8?B?b3Q3NS9GOXJPTE1OMml4Z3NXaWlvTGlvSVdJVW9wc0YzNzFrQ204a1d5SU4z?=
 =?utf-8?B?TjVqM25tOGdSMXZhMnVHMjREMCs1ZE9yeGJpNGQwTGRvVGs3UnNIdmZqWU82?=
 =?utf-8?B?TUp6ZnVvcU9DVmRMcE9peGpJb0J6b29DMjRKYmJ5dXZmOVJpT0U5YVVtSHQ2?=
 =?utf-8?B?L08rQ0VtQXg1cVJtait4Y1BxZmRwMjNTQ2RZb1JEelRpdGl4QjBYRW1POWQw?=
 =?utf-8?B?bmhUS0svZWx3SGluc1VVVDIrODFZSHJGT0hpQnZZSTh4cWlXbFIvcXVHSTlZ?=
 =?utf-8?B?TFV1UmRYc0pMWDRHZ0NiZ0VpMDcxalIxTHlVT01Kb3l0Y0NnaFhzZ241ZzBX?=
 =?utf-8?B?RWFtN0lBSlUyb0dVOEtCNjRwRm5seGxjUDU0ckhpR1dWSmd4T3g5M2JLVVMr?=
 =?utf-8?B?RjM2RU8rYzZqR1FVTjluS1VHTWRMbm9JL3BUVkJ6Q2M5aHUrK0gvVDhXc3BO?=
 =?utf-8?B?RDZ4R2dLa2FnWlRnNTNKZmRCV1dlb09RNGg3bUZ3K3hiN1pZdE9wNmNJUk9i?=
 =?utf-8?B?ZnhCWkpJZitNUVlEZi9NNndEVkE1K1hIdm1RbnlNRVN3Y0J3aE5ra09nRHRY?=
 =?utf-8?B?OHJiVjJ3aDE5YmZaS1JJYzVpYzQzRUZWZEl3WkJYelpUaFRIYm9kRFR5MkpP?=
 =?utf-8?B?d2hvWWVZT3RSTEl0djhBOUdVK0ZHQnliUDdyZzJwY2FzNXVIVGdDSHlQeEFQ?=
 =?utf-8?B?NzBHWnVzcm1PZVMwd3owOE5PS1FZMEJrYU5vZGxkWEZnbGhUQWlYTlhZMUkz?=
 =?utf-8?B?Uk02YTZxbWkyWktkRVhraVNVakdoSkZrdXlEZllRMGZ3eWtIWHBRcHBJOWhT?=
 =?utf-8?B?SlNOTU9uaFNCbVZKK010NS85QnBsQnhYQmlEYXVQaHQrN3V5dmpFN2RqSTds?=
 =?utf-8?B?QkpaaFVNcVdsemdWLzFJVDg4dW9jUFdIMyt3Tjh0S3pZOWF4UWdVOE9UYllZ?=
 =?utf-8?B?bFdSc0RZUVV6M2tZSGIyRmhEVnYreHdTdUsxcGwrdmN4bWlzVGNtUjVBazdE?=
 =?utf-8?B?cVRld3VyRk5WdDRoWlNtZ3JQOWgyWXNKWHhYVFE4VjZFU0NBNlZ6RnR6elFv?=
 =?utf-8?B?dzVVRHRoOGVUWWJqdk5PZWtJOGVObjQxM0UvNmQrYVpEY0RmcE9WMi9zdHF1?=
 =?utf-8?B?UDc3K3l1MEpkTXRna1JPMnNKTkVPeDdjdEt4dXVlZEEwWDR1cll4aVN1M3J3?=
 =?utf-8?B?NEFXa0MyTW4ycktLRS9YU0Rya1NodHRpVG9SendhSDRGcWxhTHZPaWtaMSt0?=
 =?utf-8?B?VTdKTWVOQ3lwaFBIMUpRbmpRVmRxbld0R2lnOE9GY01GZkZldW15WG5tc2RY?=
 =?utf-8?B?WTk0ZWN1MytqZWRLNUM3dVNFdThONEliV1plVHE0NmIyYWg2NjM1ZEEvSUEz?=
 =?utf-8?Q?jIJVvH43yELBZ4XoMqEdTq+f/gWmKg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU5hclVLa0puL29LTGpaVnhTN2ZVeDQyMXFyUEVvc2VWclF0NWJZZVpVQ1VB?=
 =?utf-8?B?SEN4eWtiS3AzVWFWcjJYa3RRelJweDYwMWJkQnVkTU44UEQ3R1ArMWVFN2p3?=
 =?utf-8?B?Tkc4VEpXQkp3N0Z5b1M2MEdHMW8xWjVtN1FkZy9COXpxL01SSTZzWXYxNWhi?=
 =?utf-8?B?MnFBb1IydHNwdjljc0owS2g4MmI4cnVGSTd6Y0pVOVppRVhFRGNYSFl5VTRU?=
 =?utf-8?B?V2E0NS9tTGFuQ1VEN2JxVFh3cENWZ2NmK21VQk1kUlN6NzlORHN4cW5CbUtl?=
 =?utf-8?B?OTBNZXVNUG5oYnRnMmMySG1nZUdtb1l2eVg3S0FjVmd0Y2RHR0pITzJPRVpI?=
 =?utf-8?B?VTY1eGFrK085Q1J5RXVPZUQ2TXVwc2gyY0NLN2pob09pZVdaM1ZOcUhVTUxH?=
 =?utf-8?B?NlRkVkUrZTkrMElkczFZeUJZUEtpa2xaWHFyRkl2c21LcEliSm9WNDNaZFlT?=
 =?utf-8?B?UlhBVkN6NHlQSitzYU5BVUVET0xNWUFQNW80Rlg2c3pQdmJKU2dQTWs0ZmhC?=
 =?utf-8?B?aTNlUzhCV1dDd3FjdktYais2dEdXMmlTdXk0d2ZaWUNZd1A3SzhIMWZRbEE5?=
 =?utf-8?B?dVRYTjhycGJnU3NqVnNWbjBJZHd1bGltenFhdVBKdDF5UlZsU1NGM05TdkFp?=
 =?utf-8?B?QTl4UWZRN1duV3BSSU1FMjRVSlVML0w3S2ZQYTdHSStyTktxdHEySERjMTdQ?=
 =?utf-8?B?c0FiZFZlNEdvM1p0TE04WGNYd3pyVDRRSlp2NGQvNlFVWkQzcXZUa0lLY3Ny?=
 =?utf-8?B?cEx3K3FINC82bWxTSlkvMFlwQUNxOGU1YXY4TkFLbEpOQ1pRZTJiaHNNSWVN?=
 =?utf-8?B?WUV5QVRjQkFCVVZZSGE1UVkvTCt3NThnSjg0VGN1dC9EQUN2MGp3ZkZES1ZZ?=
 =?utf-8?B?OXhMQ3RiQll3dDNQSDNJb3kxNjNtLzdHMVBqRlU1OVhQZ2Q0Sm9yL0V0N1BT?=
 =?utf-8?B?WXh6ekxDcjgxN00xb2VkeW40UFNLcFVDaUQ4VlhKbjQ1S1JBbFZSSnp0dGRz?=
 =?utf-8?B?a3pqa01wakErTXd1MVAwcklGeFVKT3ZvTyttazdjVXN2M21Tc2tjbDZVMm04?=
 =?utf-8?B?azFRUmFsRWtoZGl5RTRlNlh3SHdqMEVaTXk5TXRXb1YrT1ZBbDFGbjI0bzRw?=
 =?utf-8?B?SWZML1ZnOVFJem4zUHI2cFJEa0c0VFZpZUw3RmdyVlJDZmVCeDhUQWlPbXl5?=
 =?utf-8?B?VDhYV0ZLR2xYWUYrZ1R6NjM3N2pKTXk4cjVyRDdubVZ3UFowejlxTit6TjNL?=
 =?utf-8?B?VGFtdjEyT1ZiTS9SaXdvTEpBTEdUV2IyMzFYY0FEb1ZxNlB0OVBVN0pmc2hX?=
 =?utf-8?B?dmhOZWJEdFlWSWx4azRDZ0o5OC8zQjl4Y3cwMGhRck5PcTZoTENhbjhsTlFu?=
 =?utf-8?B?VDc4ay9rMTdtVGk2RlJQelJSUzhFcGVmZVNHRWhLYVIrU1F2dGRHL3padlYx?=
 =?utf-8?B?anhiaHRaTHcwUkNreDlmclJyUFNYOWNzL0FjT2tlajQ2OUpMYkVIQXRPN0RW?=
 =?utf-8?B?OWlhNWpWQytvLytqVFlNQ1BOWWFaNTRoUjc3SURMOVF4MU5kb2lZSVVLT0xt?=
 =?utf-8?B?ckZZdnlUVW41dGtnamVaaEJLTlVzY1hndU9tWCtxaDlmK2JYY2NWa2JVL25a?=
 =?utf-8?B?VnRJMFRnNStHaUt5SDk4akpWYnFoL201Ky9Iby9pbXR0d2JhclpmV1hzQ2Z3?=
 =?utf-8?B?azB1QitLSG9aUFdmdWdJZGFQSWFhZEdXamVITmIwSnMxUGRkbk5wU1cxRERy?=
 =?utf-8?B?Y0tpQWkxN1dGcHJUMWNxUTZ6UmFTNXpPM0RsRHYyZC9IcU5NQ2Z6L3RHNmVP?=
 =?utf-8?B?aTBRaXp0Qlp5Wi9EMTVKY3hEQnpsN1lRNjAya0dqalR5K213b1AwMUwvOTBr?=
 =?utf-8?B?aWl4MTJqRm05Mkg5UkFKbjFHOCtqN0RjKzRycjE1WnBpR05NY1NNQ01lNlV0?=
 =?utf-8?B?UUtCZ25GWDBBR2lVQUtCYjR1b3RsMlBXTFZQQVRHWGY0K3IxL2NNMklQNkl5?=
 =?utf-8?B?bDBDcGxHaTJhZXFmNFdpdmorK251VWdVMlF5NkpnK2ZwSERQRDhsRkxybWZq?=
 =?utf-8?B?NHFNV3hkNmxEcENtUGprLzNTZmxEZ3hIUEVncGN0VWFLaUZSeEtSYjI1MUww?=
 =?utf-8?Q?bRSkcmFpnOaO8WEE+ictVVvjK?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dcc6619-e695-412a-124e-08de3626fdd6
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 06:57:03.0087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qpj17IELDuS1wfP0dZAZrKdsZ5mQxYcCR/y6RQezZq1pT157RwAsjvGdHqRPr2qlQEajlcFf+UCY0EHlUKZV8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9731
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

Hi Marco,

On 12/02/2025, Marco Felsch wrote:
> From: Liu Ying <victor.liu@nxp.com>
> 
> NXP i.MX93 mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Add a DRM bridge driver to support the display format configuration.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v6.18-rc1]
> [m.felsch@pengutronix.de: add review feedback (Alexander)]
> [m.felsch@pengutronix.de: fix to short Kconfig description (checkpath)]
> [m.felsch@pengutronix.de: use "GPL" instead of "GPL v2" (checkpatch)]
> [m.felsch@pengutronix.de: make use of reg property]
> [m.felsch@pengutronix.de: add bus-width support]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  drivers/gpu/drm/bridge/imx/Kconfig      |  11 ++
>  drivers/gpu/drm/bridge/imx/Makefile     |   1 +
>  drivers/gpu/drm/bridge/imx/imx93-pdfc.c | 227 ++++++++++++++++++++++++++++++++
>  3 files changed, 239 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/Kconfig b/drivers/gpu/drm/bridge/imx/Kconfig
> index 9a480c6abb856276df9b71d23b39a43b3a9c542d..28fd7a00473a0ec50bf0ffb5d50972abc209ceec 100644
> --- a/drivers/gpu/drm/bridge/imx/Kconfig
> +++ b/drivers/gpu/drm/bridge/imx/Kconfig
> @@ -88,4 +88,15 @@ config DRM_IMX93_MIPI_DSI
>  	  Choose this to enable MIPI DSI controller found in Freescale i.MX93
>  	  processor.
>  
> +config DRM_IMX93_PARALLEL_DISP_FMT_CONFIG
> +	tristate "NXP i.MX91/i.MX93 parallel display format configuration"
> +	depends on OF
> +	select DRM_KMS_HELPER
> +	help
> +	  On i.MX93 and i.MX91 SoCs the parallel display format output is
> +	  controlled via the MEDIAMIX BLK-CTRL DISPLAY_MUX.
> +
> +	  Say 'Y' or 'M' if you use the parallel display output path on a
> +	  i.MX93 or i.MX91 SoC.
> +
>  endif # ARCH_MXC || COMPILE_TEST
> diff --git a/drivers/gpu/drm/bridge/imx/Makefile b/drivers/gpu/drm/bridge/imx/Makefile
> index dd5d4858480663bade98bd58039d1cb6f8aa18da..f4ccc5cbef72a576443d5fecf666b76dfba8aa94 100644
> --- a/drivers/gpu/drm/bridge/imx/Makefile
> +++ b/drivers/gpu/drm/bridge/imx/Makefile
> @@ -8,3 +8,4 @@ obj-$(CONFIG_DRM_IMX8QXP_PIXEL_COMBINER) += imx8qxp-pixel-combiner.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK) += imx8qxp-pixel-link.o
>  obj-$(CONFIG_DRM_IMX8QXP_PIXEL_LINK_TO_DPI) += imx8qxp-pxl2dpi.o
>  obj-$(CONFIG_DRM_IMX93_MIPI_DSI) += imx93-mipi-dsi.o
> +obj-$(CONFIG_DRM_IMX93_PARALLEL_DISP_FMT_CONFIG) += imx93-pdfc.o
> diff --git a/drivers/gpu/drm/bridge/imx/imx93-pdfc.c b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..624389def0ac3f24158edc64a8913375a4cc2f12
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/imx/imx93-pdfc.c
> @@ -0,0 +1,227 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +
> +/*
> + * Copyright 2022-2025 NXP
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/media-bus-format.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/of_graph.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_bridge.h>
> +#include <drm/drm_print.h>

Drop this header file if you won't use DRM_DEV_DEBUG_DRIVER() in v5.

> +
> +#define PARALLEL_DISP_FORMAT		GENMASK(10, 8)
> +#define FORMAT_RGB888_TO_RGB888		FIELD_PREP(PARALLEL_DISP_FORMAT, 0)
> +#define FORMAT_RGB888_TO_RGB666		FIELD_PREP(PARALLEL_DISP_FORMAT, 1)
> +#define FORMAT_RGB565_TO_RGB565		FIELD_PREP(PARALLEL_DISP_FORMAT, 2)
> +
> +struct imx93_pdfc {
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge;
> +	struct device *dev;
> +	struct regmap *regmap;
> +	u64 disp_mux_reg_off;
> +	u32 phy_bus_width;
> +};
> +
> +static int
> +imx93_pdfc_bridge_attach(struct drm_bridge *bridge, struct drm_encoder *encoder,
> +			 enum drm_bridge_attach_flags flags)
> +{
> +	struct imx93_pdfc *pdfc = bridge->driver_private;
> +
> +	return drm_bridge_attach(bridge->encoder, pdfc->next_bridge, bridge, flags);
> +}
> +
> +static void imx93_pdfc_bridge_atomic_enable(struct drm_bridge *bridge,
> +					    struct drm_atomic_state *state)
> +{
> +	struct imx93_pdfc *pdfc = bridge->driver_private;
> +	const struct drm_bridge_state *bridge_state;
> +	unsigned int mask = PARALLEL_DISP_FORMAT;
> +	unsigned int val;
> +
> +	bridge_state = drm_atomic_get_new_bridge_state(state, bridge);
> +
> +	switch (bridge_state->output_bus_cfg.format) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +		val = FORMAT_RGB888_TO_RGB888;
> +		if (pdfc->phy_bus_width == 18) {
> +			/*
> +			 * Can be valid if physical bus limitation exist,

s/exist/exists/

> +			 * therefore use dev_dbg().
> +			 */
> +			dev_dbg(pdfc->dev, "Truncate two LSBs from each color\n");
> +			val = FORMAT_RGB888_TO_RGB666;
> +		}
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +		val = FORMAT_RGB888_TO_RGB666;
> +		break;
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		val = FORMAT_RGB565_TO_RGB565;
> +		break;
> +	}
> +
> +	regmap_update_bits(pdfc->regmap, pdfc->disp_mux_reg_off, mask, val);
> +}
> +
> +static const u32 imx93_pdfc_bus_output_fmts[] = {
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +	MEDIA_BUS_FMT_RGB666_1X18,
> +	MEDIA_BUS_FMT_RGB565_1X16,
> +	MEDIA_BUS_FMT_FIXED
> +};
> +
> +static bool imx93_pdfc_bus_output_fmt_supported(u32 fmt)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(imx93_pdfc_bus_output_fmts); i++) {
> +		if (imx93_pdfc_bus_output_fmts[i] == fmt)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static u32 *
> +imx93_pdfc_bridge_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +					    struct drm_bridge_state *bridge_state,
> +					    struct drm_crtc_state *crtc_state,
> +					    struct drm_connector_state *conn_state,
> +					    u32 output_fmt,
> +					    unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	*num_input_fmts = 0;
> +
> +	if (!imx93_pdfc_bus_output_fmt_supported(output_fmt))
> +		return NULL;
> +
> +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	switch (output_fmt) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB565_1X16:
> +		input_fmts[0] = output_fmt;
> +		break;
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +	case MEDIA_BUS_FMT_FIXED:
> +		input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> +		break;
> +	}
> +
> +	*num_input_fmts = 1;
> +
> +	return input_fmts;
> +}
> +
> +static int imx93_pdfc_bridge_atomic_check(struct drm_bridge *bridge,
> +					  struct drm_bridge_state *bridge_state,
> +					  struct drm_crtc_state *crtc_state,
> +					  struct drm_connector_state *conn_state)
> +{
> +	struct imx93_pdfc *pdfc = bridge->driver_private;
> +
> +	switch (bridge_state->output_bus_cfg.format) {
> +	case MEDIA_BUS_FMT_RGB888_1X24:
> +	case MEDIA_BUS_FMT_RGB666_1X18:
> +	case MEDIA_BUS_FMT_RGB565_1X16:

The case MEDIA_BUS_FMT_FIXED is also valid.

> +		return 0;
> +	default:
> +		dev_warn(pdfc->dev, "Unsupported output bus format: 0x%x\n",
> +			 bridge_state->output_bus_cfg.format);
> +		return -EINVAL;
> +	}
> +}
> +
> +static const struct drm_bridge_funcs funcs = {
> +	.attach			= imx93_pdfc_bridge_attach,
> +	.atomic_enable		= imx93_pdfc_bridge_atomic_enable,
> +	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> +	.atomic_get_input_bus_fmts	= imx93_pdfc_bridge_atomic_get_input_bus_fmts,
> +	.atomic_check		= imx93_pdfc_bridge_atomic_check,
> +	.atomic_reset		= drm_atomic_helper_bridge_reset,
> +};
> +
> +static int imx93_pdfc_bridge_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct imx93_pdfc *pdfc;
> +	struct device_node *ep;
> +	int err;
> +
> +	pdfc = devm_drm_bridge_alloc(dev, struct imx93_pdfc, bridge, &funcs);
> +	if (IS_ERR(pdfc))
> +		return PTR_ERR(pdfc);
> +
> +	pdfc->regmap = syscon_node_to_regmap(dev->of_node->parent);
> +	if (IS_ERR(pdfc->regmap))
> +		return dev_err_probe(dev, PTR_ERR(pdfc->regmap),
> +				     "failed to get regmap\n");
> +
> +	err = of_property_read_reg(dev->of_node, 0, &pdfc->disp_mux_reg_off, NULL);
> +	if (err)
> +		return dev_err_probe(dev, err,
> +				     "failed to get display-mux reg\n");
> +
> +	/* No limits per default */
> +	pdfc->phy_bus_width = 24;
> +
> +	/* Get output ep (port1/endpoint0) */
> +	ep = of_graph_get_endpoint_by_regs(dev->of_node, 1, 0);

Nit: DT binding just defines endpoint not endpoint0, so set the reg parameter
to -1.

> +	if (ep) {
> +		err = of_property_read_u32(ep, "bus-width", &pdfc->phy_bus_width);
> +		of_node_put(ep);
> +
> +		/* bus-width is optional but it must have valid data if present */
> +		if (err && err != -EINVAL)
> +			return dev_err_probe(dev, err,
> +					     "failed to query bus-width\n");
> +	}
> +
> +	pdfc->next_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
> +	if (IS_ERR(pdfc->next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(pdfc->next_bridge),
> +				     "failed to get next bridge\n");
> +
> +	pdfc->dev = dev;
> +	pdfc->bridge.driver_private = pdfc;
> +	pdfc->bridge.of_node = dev->of_node;
> +	pdfc->bridge.type = DRM_MODE_CONNECTOR_DPI;
> +
> +	return devm_drm_bridge_add(dev, &pdfc->bridge);
> +}
> +
> +static const struct of_device_id imx93_pdfc_dt_ids[] = {
> +	{ .compatible = "nxp,imx93-pdfc", },

The cover letter and Kconfig say that both i.MX91 and i.MX93 are supported,
so need an additional compatible string for i.MX91?

> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, imx93_pdfc_dt_ids);
> +
> +static struct platform_driver imx93_pdfc_bridge_driver = {
> +	.probe	= imx93_pdfc_bridge_probe,
> +	.driver	= {
> +		.of_match_table = imx93_pdfc_dt_ids,
> +		.name = "imx93_pdfc",
> +	},
> +};
> +module_platform_driver(imx93_pdfc_bridge_driver);
> +
> +MODULE_DESCRIPTION("NXP i.MX93 parallel display format configuration driver");
> +MODULE_AUTHOR("Liu Ying <victor.liu@nxp.com>");
> +MODULE_LICENSE("GPL");
> 


-- 
Regards,
Liu Ying
