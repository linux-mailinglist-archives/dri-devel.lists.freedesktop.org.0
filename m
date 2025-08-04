Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68468B19A96
	for <lists+dri-devel@lfdr.de>; Mon,  4 Aug 2025 06:01:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24A110E0EE;
	Mon,  4 Aug 2025 04:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="EsHWpPnu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010000.outbound.protection.outlook.com [52.101.69.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B333910E0EE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Aug 2025 04:01:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rIrswn6FZ4oc9ftzQYDLQJ+2cWLsB+uu340k6XlJpFIWECN23qgvA/QdI+xH1sEPzpCj55Bdpbp8q+8MdkGJtIOgRn9g3VsMEzQeamlL0TMP3DmpuJ/w0aRkIxRC3MgYYjSULJ7PcgzXIvR44M9CMbE1pSzhfhpnrkGEb+0E1ruuhP+lI2jXufjfoxfUZI4Ho81URJ1vfXIo/VZJHq++OqeEFTMd6d7u3r9Xa344LCKW7zOzf+s7ZzbcmYf81JwpkKg7vI5AEnc6VE6GoW4TuyyifYeyow3BsxJuoncmmOZyAXVpNsf71IcH4MvwDAIeGZplMyf7NGr8JdTA0VH1uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThhxGNcauYpTTugKEGlEdQWKNh3bYYG+tMmIulvju/U=;
 b=nfVfP5fd8suy/fuYGwiaIVa6YuVZwsaEOEb0OeorbJqey5yIBHFu8MJd3vpWV4Q22qB6p+30irB7F5rH3h6pLGvflArk6IqG3r0YWm46mAdRuMjeE+BBC3s+8AO6XYR5egsztGy2B+Kt1qrVAW5KZq/XjagwouqZh3EOvogymadF3cwp437EiifTrF3n7Zx3KpR/EosrunDBQN4pxfiyEyMlqi1u3pe1FFLxAKh3yQYiNMd78dhPnLEfj0NnQYry3Kqm9Rxqh01BoQUa2uLC+dptoLe/oRK2VdrbMMVe7i1zt7ykq2yKLDVHyt8Ksk1fH8/IY8l7SQfIUCCrpJqWhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThhxGNcauYpTTugKEGlEdQWKNh3bYYG+tMmIulvju/U=;
 b=EsHWpPnuF2toH0i34S+ylYbFZ4EMSO04P9ZdDV10JGbWpZTdhqnA6HIigM/58Gpon9K+2GTmCiMERN6sTPACIV0ewRrjDkNxaEM8v7M3n11wq8ern7txug4IawPjl80gHyn+Nq67kVvzBQitNeFTpJOIhEkEC/wwgpcDQ0BiP2mOFTSy0V4XO6tGPTbutOcgoWmG3oCC6BFRYlw4KNqhFz1vV9Ne+7rMFZOz2f1HBIEVleHfRifxgD8Qv0IUKnP8ARk6DbIiQ20sHEU/5JaBxqYLoHSmyiNQiuz2rdfWdr7eKW5UI/l3R/k17TopZh0cGqHMjtDJoPtbzsEGdF6Ahg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU4PR04MB10481.eurprd04.prod.outlook.com (2603:10a6:10:561::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Mon, 4 Aug
 2025 04:01:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%5]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 04:01:21 +0000
Message-ID: <1ebad5ca-26f3-4a5f-a812-8211129c764a@nxp.com>
Date: Mon, 4 Aug 2025 12:02:48 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/9] drm/bridge: get/put the bridge returned by
 drm_bridge_get_next_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, Zijun Hu
 <quic_zijuhu@quicinc.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250801-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v2-0-888912b0be13@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::10)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DU4PR04MB10481:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b8d3e3-de80-402e-cc97-08ddd30b92ae
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|19092799006|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KzF2Tm1sbUFpUnVVZ3pCYTRGMFBpV3lJT2NEaDYvSFNDQ0x6bVNYSVJ1L3Z1?=
 =?utf-8?B?OGJwT1ovQ2Naczc5Q3RURTBNQXFwVHFoME4zc285a3ZRQVlDdUhNSjY2dUpj?=
 =?utf-8?B?Wmdjc3ZHbU8vaE0vVTFQc2Z0bDhJUXZHSTRZY04yTGpsZ01RVENvNzBxQnRh?=
 =?utf-8?B?eGVRNCtLTm9Wd3RUdGZLa2w0WEw1aERnTDZrZUhxb05FS0h0NzdkdW9QWWVL?=
 =?utf-8?B?Vm94UzMxMkZWRnZ5REhLV2EzR2Q2b1NhMHp3U0JRS2lUWXlNbGxZTnlzYWRL?=
 =?utf-8?B?TDRMQjZVWkh0ZkMycVgzMnp1WjdVT3M5WUJFd3N0ZEJreTlRbVI3U1FseGRP?=
 =?utf-8?B?dEVpTzRnVGNUTGJDc1BSVVlsdk93YjRYSTRpMUZSVmxQaFhwYWd1d0RFQXV5?=
 =?utf-8?B?a3FHTktBR3l1aVFHVEJSaHp0RHFyR2ttY3crTFpvNUdNdkNOUURWL3NCd2VG?=
 =?utf-8?B?OGo2dDlTeGx5UkZtd3Z5TzJFVTZNQndiNE51eXBHbTJjVUZ4ZHoxZzN1VHdB?=
 =?utf-8?B?dFl5enN4YlZWVzRxbGJFU0FCUFcxR1ptN3I4MnFpWmxkbS9PTWtXNkg4bUxr?=
 =?utf-8?B?NnJGSTdKTTVwbEhLNGJPMUk1enc1b1pURUxmU1FVRGhraVNUMjlNcU9uQkk2?=
 =?utf-8?B?eWpzamtyZHd1U2hwU3NNS29CVDQ3dUZIL2lRS1ZlNDRyWEx3eXd5MnhpR0ho?=
 =?utf-8?B?YkxUY1hYWFhpZWJHVmh5RjNMc041Vm95NjBkRXZqTzVHRENVcGI2QmhkOXNW?=
 =?utf-8?B?dm9BdXVIZjVFYXVHbnpJWkdnbDJLV3BmZWwra0JBTmlMb2o1V1VNQ1p2cjhS?=
 =?utf-8?B?MlU0QVJocGRidW44WlF4RklYVlhCZnZUS1FWcVMvRWhVd2NrQnFhSSsyTzJS?=
 =?utf-8?B?OURER0ZIRzdZYjZuZ1ZGRnN0ak1NRkhLUXkyVEQvZ2hqMzF2R3VaYmVQV05V?=
 =?utf-8?B?TE0zYitMVWRGd3NzRTNWZWtXR3FBYi9FRFh0ZElKTzlBbEJJTlluSllJeU9n?=
 =?utf-8?B?TlRyQUR5eVZTRks0NVNwR24yejdBQTQ1VUlaVEFPR2E2VFE2dXovaHZ6M3Q2?=
 =?utf-8?B?VVNPY3RTSGlIdUxac1JjQTNDSGVhYWtpeDhCUzdSb213cUlLVGhXSUhKUmJQ?=
 =?utf-8?B?MkROdDE3OGRsR3dkZXpEa1RYalRsUFIwNjZodWQrT0JVVGxiV2k0TUludHhm?=
 =?utf-8?B?ZjJQSG1lc2h5ZHdYTUt4d04zRHYrWVdnVEx0QnpSVVRIODczaEoxWFJvUGdu?=
 =?utf-8?B?L05IbXdQei8vdTc4UVMvbjFCY1hzN0ZUb2l2b1FLZGZManBoWUtsNUVrUnA4?=
 =?utf-8?B?c0tXNUIrUTFzZzQwNkJFN1RxNm5XMmFKWkxRSTAwSkNwWldmd2pUVzZHeUtR?=
 =?utf-8?B?MlZiU1dwdzdhK1VlbU1oZEZYdk41TUMxK21ObDRBQ2hVdDdLM3hVMmJNMEJ0?=
 =?utf-8?B?eDVocEdtOGJqcEg4SmtiNmgvVUFycW5TaFByWTBJaDVmK05SYk4yeTR4WDFx?=
 =?utf-8?B?bk9tQlAva21NSk1CV3JnQlZ0Z2pycTdLdjFUV0RyYzhzM3NSRUU2YVJTODZ5?=
 =?utf-8?B?SUw1NWdCdjdBNUNmRldKRndwdTRXR2hVYkxncHpxTG5pbHl3anhOK1ZoeFZ4?=
 =?utf-8?B?VUFvM0h6TkFoNG16RVJCc2FBeDFrSTNJYXV0R3FQcnRHNXc0d3QyWkdraGJR?=
 =?utf-8?B?MGF3M2lzUWJVbzRMU2QvTFZhSlVPeHhWWXF4SEVuNWtVUmt5NjdabGpzMCtP?=
 =?utf-8?B?Zk5QK1l0bXE5TGFxSkhoeERPS3JrK1NOWnQwdzFCTHIwbEVnREkzaGpybk50?=
 =?utf-8?B?RUhTNnNkelJZaDQyOHpqMlF4Sit3U095eDI3YXcvYkZtVThTWFJvcXBGTU5C?=
 =?utf-8?B?Qk1UWFIvSEdYNncwSnoyZUdMNVZHZmx0RHowTWdJdlZIamc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(19092799006)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWNJeEFtYmVJak1PajF0QkI2U09sa3hXWDRvdVlsaGd6Tjl4TUVKNlJtT1V5?=
 =?utf-8?B?WExqNXZEZENicU84WGFGUzk0cjlKQUk3SzJUdkFBS3BXcDJqYW1kVFlHUC84?=
 =?utf-8?B?ZlZKUWhONnhWTGIzSi9ET01leFgxc0Y0RWlTMGloNWlDVG9SMTE0VnJQQ3Q1?=
 =?utf-8?B?S2hjVHFvRVBwcldtMnJIU004TndKQmZiUVVob3JwS2xYLzZOY24vWEFTUTZw?=
 =?utf-8?B?QW9mTXpoZUFKT0oxdGk3NCtMYkF3disyWlA0NHdBYXlIU1pMN2JscWxubHgv?=
 =?utf-8?B?NVZvRGxGSmtGNFg2MEpvMk5jZmgrb09MdFV0S1NhcHBoOFFNc3VZdVhqK3M3?=
 =?utf-8?B?ZXBKQllHVHJ2eUJjcnN5SGFKdk56dy9GN0d6VHJxVlVDT3NpR0FhcUhuVlRh?=
 =?utf-8?B?SEZrVzYvTFBQaXRyYmplVGppOFJDdHh3YTFpaSsxcjk0M3JocmFBaWIyNFZo?=
 =?utf-8?B?ejZkdFBKaEdJTnN2UUJiTkhkTEVrNnc1YjZxVXpqYi9XSG5aNWFnamdYSEs1?=
 =?utf-8?B?aGhVblBTbzE3MVM4YW9mNWJzNVJma2wzaG5KZk9rRDAyUldpTEtlY0gzV3Vp?=
 =?utf-8?B?aExyMDNSZ0xLbGtTOTJNY2VqaGxTNTR5V0pNYzc1RDNFSkxkd252NzA1cFFh?=
 =?utf-8?B?TDJsbDkvaVdwaXN0MGNFQjBWZ1RpUmNqa0x5bnFZL3pkY0kzc2ExVVcyTlow?=
 =?utf-8?B?Q2JQb2dmMmtuTGFvb0l4dTg2Z2lvY2xPell3azBhVndBWUhpMDFreTFzdWhm?=
 =?utf-8?B?L2M1MFdFZlBGYi9nYkRZa3pOUTNuU1pab1pIeWROS1hScGF6UWgrd0lBa3ox?=
 =?utf-8?B?bnMrcmNDL1NHdXU2OStVQmozdnppMFY4SG9mTmlDQU4rYndGd2tVdWVVMmt2?=
 =?utf-8?B?bUhsVWlnUDYzaTYyczBRMklYT2szK1l0Zk1uaER3WUdkV1hKNXlqUjZPekdT?=
 =?utf-8?B?eXJIdTdEaGVEYzBTbzMrUnVvc3EwTmpxTjlUVVBIVVFzdWN0Sm5MWkVPazZp?=
 =?utf-8?B?QnhIRHN3NDNZYmFuUTNzTnZaSXNGOUVTQkVzQ1RwUmRTeHpGZXZWNVRINWds?=
 =?utf-8?B?WWRzYnN1VXBGaG1kVEMzOSsxZU9aamNRbC84VmJsUlRKcHppYWRiMCtrc3li?=
 =?utf-8?B?b3R1QWR2ZkVBY0xTQnB6OFhUOFFubXBPcGwxT0ZnbDRwNFdyWDRYTlB4R0hF?=
 =?utf-8?B?dnExWWJFL2dRYTR2ckFHNE9mbFkzUUlqZU0rb2hFTUNsUEhIZXNiSlhwdWN1?=
 =?utf-8?B?MHBqeUlCOWxXSk5GNG9sRlIwNVJGbE82VG5DZ3hkaTVNWFNIY2hQUi8zemg3?=
 =?utf-8?B?TTZaajJMc2VQeHR3dm0vL2lDSkJDQVhNRGNPSFdxWkRkUkFvQzkrZHAray9B?=
 =?utf-8?B?QWVuUCtydFVzS3NwVVlEdDhuVkwrdnFta0VwSmJoM2RYZi9oWHlheXBzc1FS?=
 =?utf-8?B?TFBGTTlwMCtJWlFOU21TL1RyRjRHaE1GcitNZ0xzZW1vdG5YaXlRakFmbWJU?=
 =?utf-8?B?ZXlpOENvUnh0NWNva3lZVW04ZitLeW84NHNGcW82bDcxKzJDVzRDZ3BaMVNM?=
 =?utf-8?B?SWVQbm8rSkFMZ2dwQmlKYmhzeE1aendYKzBKRG9PSEE3WmJRbVRQK2NDbEYz?=
 =?utf-8?B?OFZoOFlWMG5FMHN5QUllb01tUXdhUlI4Q0lQWU1sbzRMTnZhdUh2L2EvSzgx?=
 =?utf-8?B?VDhzUGJ3TlZxNUNMWVd4ODJ0b1VuRHlSbjhnd0RkbEpZMjlTcUpsQkFPd1Rq?=
 =?utf-8?B?QkNkWmdDMDg2eGRJcS9MbWNJZElFREtYTy9IVnIvTGtWY2x6NGJPQWs2cUZr?=
 =?utf-8?B?dHlmTWhHZ01HemNWUU1WNE1mQVdCN05pbkdQajZxTURZTjZIaWduV1dqa1JS?=
 =?utf-8?B?ZWRyY1o3V1BvTkx4eEVHTmJHVUd5VHhBNUFYWEhpSTVVZXRKQXB4OFU5ckhZ?=
 =?utf-8?B?d0pFL3RIb3FXVEgzeityV2F1blRwUG1yUktrdm5ZV1FJUlJiSzE0d3FONDdv?=
 =?utf-8?B?UTM3aWxwekdJdWxCazJJOFN5c2J0QnZBMWVsREg1ZlFjeHM1UHl2eVpFdWJI?=
 =?utf-8?B?NVpZZ2dqdmRZQy8yS0pGd3o1aWg3TWh3SkJDSnB3NWVTUXdJOTJJOVIrL1k1?=
 =?utf-8?Q?K9Hn7t6zFcm/cw3SsXlTUTWFS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b8d3e3-de80-402e-cc97-08ddd30b92ae
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 04:01:21.7197 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4FyrvTxhSipdjP6XPadPlDNXtrwq5UC59Vme0pF6C1yluQII3BwyYQMjyEYqO31UElKY2IawBfOcmjeRMIeSFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10481
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

Hi Luca,

On 08/01/2025, Luca Ceresoli wrote:
> Note: the cover in v1 was mentioning by mistake
> drm_bridge_get_last_bridge() instead of drm_bridge_get_next_bridge().
>                ^^^^
> 
> This series adds drm_bridge_get/put() calls for DRM bridges returned by
> drm_bridge_get_next_bridge().
> 
> This is part of the work towards removal of bridges from a still existing
> DRM pipeline without use-after-free. The grand plan was discussed in [1].
> Here's the work breakdown (➜ marks the current series):
> 
>  1. ➜ add refcounting to DRM bridges (struct drm_bridge)
>     (based on devm_drm_bridge_alloc() [0])
>     A. ✔ add new alloc API and refcounting (in v6.16-rc1)
>     B. ✔ convert all bridge drivers to new API (now in drm-misc-next)
>     C. ✔ kunit tests (now in drm-misc-next)
>     D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
>          and warn on old allocation pattern (now in drm-misc-next)
>     E. ➜ add get/put on drm_bridge accessors
>        1. ✔ drm_bridge_chain_get_first_bridge() + add a cleanup action
>        2. ✔ drm_bridge_get_prev_bridge()
>        3. ➜ drm_bridge_get_next_bridge()
>        4. … drm_for_each_bridge_in_chain()
>        5. drm_bridge_connector_init
>        6. of_drm_find_bridge
>        7. drm_of_find_panel_or_bridge, *_of_get_bridge
>     F. debugfs improvements
>  2. handle gracefully atomic updates during bridge removal
>  3. … avoid DSI host drivers to have dangling pointers to DSI devices
>  4. finish the hotplug bridge work, removing the "always-disconnected"
>     connector, moving code to the core and potentially removing the
>     hotplug-bridge itself (this needs to be clarified as points 1-3 are
>     developed)
> 
> There are various users of drm_bridge_get_next_bridge() which cannot be
> converted easily. Luckily they are not really looking for the next bridge,
> but for something else, such as getting the last bridge in the encoder
> chain or checking whether a bridge is the last in the encoder chain. So
> introduce better functions for those users and use them instead of
> drm_bridge_get_next_bridge(), making the code cleaner at the same time.
> 
> Finally add a drm_bridge_get() to drm_bridge_get_next_bridge() and
> drm_bridge_put() to the remaining, and legitimate, calls.
> 
> [0] https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/0cc6aadd7fc1e629b715ea3d1ba537ef2da95eec
> [1] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/t/#u
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Changes in v2:
> - Use cleanup action in patches 4, 8 and 9
> - Fix: replace get_last -> get_next in cover
> - Link to v1: https://lore.kernel.org/r/20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com
> 
> ---
> Luca Ceresoli (9):
>       list: add list_last_entry_or_null()
>       drm/bridge: add drm_bridge_chain_get_last_bridge()
>       drm/bridge: imx93-mipi-dsi: use drm_bridge_chain_get_last_bridge()
>       drm/omapdrm: use drm_bridge_chain_get_last_bridge()
>       drm/bridge: add drm_bridge_is_last()
>       drm/display: bridge_connector: use drm_bridge_is_last()
>       drm/bridge: get the bridge returned by drm_bridge_get_next_bridge()
>       drm/bridge: put the bridge returned by drm_bridge_get_next_bridge()
>       drm/imx: parallel-display: put the bridge returned by drm_bridge_get_next_bridge()
> 
>  drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c    | 12 ++++------
>  drivers/gpu/drm/display/drm_bridge_connector.c |  5 ++--
>  drivers/gpu/drm/drm_bridge.c                   |  3 +--
>  drivers/gpu/drm/imx/ipuv3/parallel-display.c   |  4 ++--
>  drivers/gpu/drm/omapdrm/omap_drv.c             |  6 ++---
>  include/drm/drm_bridge.h                       | 32 +++++++++++++++++++++++++-
>  include/linux/list.h                           | 14 +++++++++++
>  7 files changed, 57 insertions(+), 19 deletions(-)

Looks like this one needs to be handled by this patch series?

drivers/gpu/drm/omapdrm/omap_encoder.c:101:
bridge = drm_bridge_get_next_bridge(bridge)) {

> ---
> base-commit: b13c47e0f6f5a7be56ed93d596f80eb9d8e12c77
> change-id: 20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-1df6aaf62136
> 
> Best regards,


-- 
Regards,
Liu Ying
