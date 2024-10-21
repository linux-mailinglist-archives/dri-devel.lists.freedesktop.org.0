Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC22F9A5E83
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 10:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3667210E437;
	Mon, 21 Oct 2024 08:22:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="iZUJ4lwK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E672010E437
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 08:22:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jBsCI2fi5Pa9lL9ICiy5dkj4AybDSHaGDip6+naAlVFeNITZMLI8M9ht9LphffXGw5KMNzrS5BlE8dVcL5zcUpQrYltZCad4R+8B5rxNgCUdDb67UUEhYtFbZxBO6xNM5BqMtfJiSEWdFMk1ZYnUG7AeRUQwrY31SwsoCEQzQu34F9BnLexprH5c+cShRfCQlGjlzHCg7XaCab3Zls/t7p/tuMgRqJKvWalJ3RwXvhDC92HsVRVd7e76ipG0njUajWHttu17BhDFPfX0R/Y3wDw4mXGDGeBrkdFXY7TBEJS5erI9EOU83zqKEefsjyLwnZz4c5zGvHfIRotkWMZdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lyEYxUQvnKPjeOnjPnuX1CAwA7yMBp+T5kNhvt03h2I=;
 b=Ozx9JHhGLLzbp52PXMzj1khlWeQkPzqRSBrPqHQGYgyFvv9nBo++N2AWATwnFN64jBy6nKCZ8SPuqMB4U09AGO8OxzxfwHfvNCt4ZR6DlVpOxSZSAG8il+cevwX152+TQn26Y7hpcIOORxy4CCH1WWgvc20qdyaYd2aOAGdD1rj0d6XQ5pFQg1y2EevdjydXPLUb2QH73ZWxySUBefEtlBp0lZeckg25itwDNR6V8e+RZfBLV/zVOJOIyRv8eEZfpJFSfQaeNLWCLNGXM9PTUNm1a3dp+Gjw0yqGdNmi/hku8Yh8oTJjacQcWxxBuG+j5NN5PIw7dHJVxUJcepW/0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lyEYxUQvnKPjeOnjPnuX1CAwA7yMBp+T5kNhvt03h2I=;
 b=iZUJ4lwK8kozmhmc4RwtaT39B9uNeqhzP54eloa1fmL3qOc5XuNuXtry84sOnQPlR1TT8OvKqZ2Hs2KEhWrzvfEvD9QA822YLu3kKJzOqVhRldixqIefiule//tRrjhFTE7+5GP17S4tmzCoHS/khxFDbONe4HZLv6WqGhcJ+m+L290OWwu1C3aaPcFkeMOIOD+K2fyIo/H88dk6yZ6FY+9KyEKlJG344RdhaMaExKcqRaS45Tf262cObdN8gNpca72LlBBuEmkLcOefASCoPmXVQvtsZNIoNuYq+x+daiNdT476XC9CxQKdoacLVLt8fRz7lZUqBLCHnY9BzY67cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB10774.eurprd04.prod.outlook.com (2603:10a6:150:205::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 08:22:50 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 08:22:50 +0000
Message-ID: <2a183b49-c13a-4213-8c16-bcfd7d3bf39b@nxp.com>
Date: Mon, 21 Oct 2024 16:23:10 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/15] dt-bindings: display:
 panel-simple-lvds-dual-ports: Reference lvds-dual-ports.yaml
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quic_jesszhan@quicinc.com, mchehab@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 catalin.marinas@arm.com, will@kernel.org, sakari.ailus@linux.intel.com,
 hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com,
 quic_bjorande@quicinc.com, geert+renesas@glider.be,
 dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
 thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 sam@ravnborg.org, marex@denx.de, biju.das.jz@bp.renesas.com
References: <20241021064446.263619-1-victor.liu@nxp.com>
 <20241021064446.263619-10-victor.liu@nxp.com>
 <3qrtknxsgxzyhwivd7d4eqqg7v6twgtczxotg7rhkdumjkl3p7@u2fso5hexiu4>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <3qrtknxsgxzyhwivd7d4eqqg7v6twgtczxotg7rhkdumjkl3p7@u2fso5hexiu4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0005.apcprd06.prod.outlook.com
 (2603:1096:4:186::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB10774:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c05b373-7aa4-4f27-ff08-08dcf1a98d07
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VnRoM3BHb0w1eFBCV09IWDcvdDB1VmZBU2Vuc3oxNDVJNjgyZWRUSWsrU04z?=
 =?utf-8?B?NkJWcWZqQkIxeDdIMDcyblVhWHg1Ym9zZ2VLQ0ZmNlBuczE4NnJLZS9pdnRG?=
 =?utf-8?B?elplbjVEUEZ3OEJ4SWxCR04wU0xPNWpPb2FpaWdnY2tlUFRTQkJ0cUJlcE4w?=
 =?utf-8?B?U2ZBaUtteHNkYXZPa1l5akRTT0dFVjdES3JRZUZMQWJkOTJ1WGJoY2s1c1Yr?=
 =?utf-8?B?RnA5WGNwZ3ExV1c2bS81cE5hL1pvb09MaGlwR0daS3BCNHJIZ1FOMVZRWEk0?=
 =?utf-8?B?MkcwUEpiU21XVzU4c1h5SGRWT2lEY2JmdjFWUUFGdTNKUURXR0ltNEJoU3Jh?=
 =?utf-8?B?b1M2RFd2Q1NXQzB4Z1ZwVWU4RDhPaVJyY3ZYSDd5T0UyNGNWbmdtT3ZWS3ZM?=
 =?utf-8?B?M0tWVFdEMVJmMHg5UlBpZUtHQW1TeGwxQVFnQU51c3B1dW9jUDJ2ajFEazZq?=
 =?utf-8?B?eXp3TU5tVUk1M3g3emprbkQ1eFFQZ3hlRnQzZEtjTE51Ym9zMG1xbXJQQ1hk?=
 =?utf-8?B?R1hhWWwrbENFSkM0SGhZbDdiMUJOVmYxL2RkRlA5cTZzT1E3SEJxMDVRbC9E?=
 =?utf-8?B?ZTdFdXBQTlNrR0I0KzhpQjNFbFozTDBxMGtFWnpoTXBYbGpZRjFmNHQyanJk?=
 =?utf-8?B?ZFFoMjFxWnhHOSs5YS9BUkR1YWlvejE0eXVibDlHUTJxeXlDZWdZdjhidGZo?=
 =?utf-8?B?elVpbFowS2lWWHlrL2VlTi83emxyLzlaN00rci9hbjhlaXNNMGgzSWYwVjNP?=
 =?utf-8?B?VVpjNmM3U2I2T3RqWjg3Mlh6cEJIa2Q0RW1JcUJyUEh2RnVPa1pkYXR6R2ty?=
 =?utf-8?B?YW9hSUo0dGJLejBBckx4Tk5zYzBCNkZxeUJzRi9SVDhtaTNBZE9iZlgyekM5?=
 =?utf-8?B?Q3NHczFxbWxCSnhuaG5Xb0dGREl6dU5adVZIYndxSjRrb0U3YXpodnRIVDN2?=
 =?utf-8?B?bHdQZkdZVG9uNHc0cS9PdkQ3QUFYT0JBcml6cnpma0IyMEZMczQ1SnArT3dF?=
 =?utf-8?B?NmoxUG45Yk42VGJScmRyOTdCMlhrQUpocG45L3dTMjQ4dThTWDNDWTNMQ1BN?=
 =?utf-8?B?VTB1ZU9lbnFIbnE3THhIOGpVVjI5eGV5RDBDZUpDa21rQnNUNW5oVit1Zit5?=
 =?utf-8?B?SW81WVkzOVNtdVdlUEl1aU5lWlovemMxRFhpVml4R1N4M2hBSmY5RWNTa2Y3?=
 =?utf-8?B?Zm9ERjI4SWNyYitNMlJEOWdZMVdERE1OVkNzVzVwOSsxV3ZTV2VYVTc1VlJC?=
 =?utf-8?B?MTE5Uk16b1JWNy8rc01sZ25rc1p2eEh3YUE0TnBwU3ZUeERSdjg4Y3I0c1p4?=
 =?utf-8?B?eDlsL3NEK0ZXQXVsUXBIOE9Dd0g0T0dGdnVxbUMrOGttQk5HcXBGS216Mmgr?=
 =?utf-8?B?VnNxb054YzBlNXNTamRHV1o5eXRhWHNoSGNtN1BWakpqZG9CSW5qT1VFY3ZY?=
 =?utf-8?B?cnNKNE1YM3pvT0lIUFRiN01KdVhCaW41cHM4cFBaeWtlZmxvTEJCTENZbS9z?=
 =?utf-8?B?Y2hGNDRpUk80eENRWDRYZ2tJSEY3bllZZ09ZQTFJQ29HUVhHdTRoNEJaRmpN?=
 =?utf-8?B?OHNTbUV3dmxnaHdGbTQ3WGdzY3VlVkQ2aU56VFdFTElKL0kyWGZWbHZ0Wlhr?=
 =?utf-8?B?eVVKeisxdUN6dlNscDM5c2RJbU9jL2h6Kzk5VGNPWjZHRW9HYW9pUllwKzFs?=
 =?utf-8?B?N3E5VkFkMkFiajRqQTE0OWNEOWVhK3FHNWlFZ2VGMFpWcWR0K1VwTG1BN0FG?=
 =?utf-8?Q?pHm2F4CJdR9EqtSsCY1aghBSAAwkXpxJ+HPoP2L?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFpIYldJTWdzUWxuMHB5STF2ZkdSemNLZDBWK1JudVpxK080M3diZGp3NUh4?=
 =?utf-8?B?dW9CNUdHNVgvTGl4WEVxTWJPTHBmQUhRUExYY0pDemFuZXQwOE5uZXJ1RUZ5?=
 =?utf-8?B?OFlhdW90bERGckFEOXpDZWQ2Sm54M3RWbXVRZ3NMbFByblBoY3p4K3dXQmxz?=
 =?utf-8?B?QnllWS8zQ051Zk5ZZFE3aGVFY1h3dWQrckh6ZEJWR0tUQTJiMy9KeEZqWmZ6?=
 =?utf-8?B?YjhlQ0N6YlpVanU4eVVoK254bzFXRWlmeGNxcVBPaUVmL0o4N1UxeEdkNy9m?=
 =?utf-8?B?T0VCTVRUVkdTRCtlRStMT2lWOVBhK1o4LzJZQ2JrL3J2bThYa3hFVUE1aWR3?=
 =?utf-8?B?REcwWFRaRjR3RFRoOEdXV3FRWEJvcVMrdFlRWHU4L2Z3U0s0c2JLM2YxOGMv?=
 =?utf-8?B?dWt3V1UzcXhUdTVQUGhScVdONDNvS0drZ2xONHYzVUJ6RGJwbzkwNmhycS8x?=
 =?utf-8?B?NVh1MzJkeEJBTlpvVEZ2eldGQityWWp1TDZJbSs3TmlxZHluT1lFbXlrNmlB?=
 =?utf-8?B?RkdzVXhvR3ZkeHRsM2NLUlJvV0xvYi83QUVNaVZ1aGRxMVoveXpnTnJrTU01?=
 =?utf-8?B?eWV6TjVqUnFhWFdjTGttdVhDVXo0QzY3cWI0UmhISHVDWEtGWk4rNDJKTmhW?=
 =?utf-8?B?djJxOE9jYVlLcW11Y0hxbE1TTFovL2hqbDBxRjdOZnBKYmRFZ0gzYkhpUnh4?=
 =?utf-8?B?bDgxY1FxSlk2MWNUTlkvd0cxMENneXhib0l3dWhwRDJtbzl3V3JDdUhEUDJT?=
 =?utf-8?B?c1RLR0VtbC9DcGthMTFmaDZLYkR6MGVzOXEveHk1Y1JqemlOTkQ5blJpRTFa?=
 =?utf-8?B?dnFscUVGSWpOMmpUMngxYW90MldKMVJzVlpVY3I5cTNvWk5USTVBTWZxZFk5?=
 =?utf-8?B?WHl5eDBxaENsTFBjQTBFRjhjTXcrNjhmM0dqdTNhOWg0bERIMGtLS28xSTQy?=
 =?utf-8?B?VkFUS0t3aUpPOGYrbUlKa1lTKytNS2xsNXdXdXFNQ29hRVA1em42V1hzYWNi?=
 =?utf-8?B?N1pQT0swdVZKelFsVVJld20vOUdpbjFaL1ZrdlV0Y3JXZEtNNWw0THk5cmI4?=
 =?utf-8?B?QkQ4Tmtjc0g0Q3FGU2xRMlIxN3VIRWJsY2Y4eWZSNk1adW1tZmhTLzNhU3R5?=
 =?utf-8?B?dk5MNXBobFBFOU9Ic2prQUVzS2pQOTVURGZxSGY0RzZOMjlXMlVWMWJOQy9w?=
 =?utf-8?B?RUt6T3kxQS9LdkVkYkxRNVptL1FxZzdKSHU4MTB1VFNpSWptaStFWElpUXJG?=
 =?utf-8?B?VHZadHphVzZ0SlJZVE9mMmtyeGJxT1llRTJmTjVLNjZRSTRQcWQ0ZmpLamI5?=
 =?utf-8?B?V3ZMSHdjRS80RGZrQ20xdEpHY1c1NHgvV1dvOE50OCs5Y0tRTGdrZnM1ZjNw?=
 =?utf-8?B?am1zUXl5WmZ1MEJBQVhRaVEwY1NTZUlUbGdpRzN3MmdOWUp5eXcyM3NwUmZx?=
 =?utf-8?B?VkJrZUJQbDUrZGt3OUFwc2tsUFN6a0NKdGtoSFJWT0s4T3FGc1JTMWRYRmZD?=
 =?utf-8?B?YlNBRHlhMmZ2UFZLSkcyQjlhTXdNSHIxR2F1M2I2eER4MTh5VjNEcnFHUUVL?=
 =?utf-8?B?V0FjSkhhNG1wd1NWK2t0SlhCb3hsUXV0dnNSREhzZElzSHJrUnc1T0FuQllq?=
 =?utf-8?B?NDVlUW53R0w1TU5iaHpnTlVsSmtwK0Y5Z3l2RDg4UTlkamZQT3pIaFZrZlJP?=
 =?utf-8?B?MFVzRUErS0VrbVRVR2c3M1h4c0JlUHlVT29DUEJBOHd1Y0hzcVc0SU1SRkZW?=
 =?utf-8?B?TnVsUEV0Q1VlcmpWNUYrZ3BaeVFTOERrdmdhWkRTR0JOdzloSitxaDAvVkxQ?=
 =?utf-8?B?WWlOQSt0U2RuWEFzZ0JZZkRIL2oxeHZQY2xndktFQWxubFhrNm9PN0RaaXp4?=
 =?utf-8?B?OTc3SmRlM1JpSzJTTGs1dWRXSGtlOWVSVGtHalpRbldLVUZtcjRrZ2FoYmc5?=
 =?utf-8?B?SkpwUDBULy9tTGRmSm9sVGVrUWVGUVZlRThkM2JVNis3S1NGcGV6cnA4cWp0?=
 =?utf-8?B?UjQrZ3dnTGVlOW1IZDdKZHhjbDhkYmplQmhETzFzZTg3Ni9vcW41WThmVlZX?=
 =?utf-8?B?TnpnZG1jcnpoamlqSmJGNUhpV2xvNEFaQXZoTDhUaVhuWkZVb3c1K2lHSDRh?=
 =?utf-8?Q?9OBsnzSgpLy0hscNzxHBkSngw?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c05b373-7aa4-4f27-ff08-08dcf1a98d07
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 08:22:50.0206 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kiatX9kX1fhVFeDnJWjx1yB5dWKm9I7ZUUQokuT3rGSmG+HzBwFtI0mF+7SIN8KDXtEPZZjluXdM09pYhi27XA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10774
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

On 10/21/2024, Krzysztof Kozlowski wrote:
> On Mon, Oct 21, 2024 at 02:44:40PM +0800, Liu Ying wrote:
>> This schema documents LVDS panels with dual links.  lvds-dual-ports.yaml
>> documents dual-link LVDS display common properties.  Reference the ports
>> property defined in lvds-dual-ports.yaml to save lines.
>>
>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>> v3:
>> * New patch.  (Dmitry)
>>
>>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +------------------
>>  1 file changed, 1 insertion(+), 19 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>> index 10ed4b57232b..e80fc7006984 100644
>> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-lvds-dual-ports.yaml
>> @@ -22,6 +22,7 @@ description: |
>>    If the panel is more advanced a dedicated binding file is required.
>>  
>>  allOf:
>> +  - $ref: /schemas/display/lvds-dual-ports.yaml#
>>    - $ref: panel-common.yaml#
> 
> So dual link panels common binding does not fit here? sorry, this is
> just introducing mess and confusion.

That should also fit here, but lvds-dual-ports.yaml fits better, because
it references lvds.yaml, which means data-mapping and data-mirror are
allowed.

> 
> Best regards,
> Krzysztof
> 

-- 
Regards,
Liu Ying

