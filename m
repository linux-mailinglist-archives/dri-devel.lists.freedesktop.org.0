Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAD89D9043
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 03:08:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F187610E75F;
	Tue, 26 Nov 2024 02:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="J9xY8UhT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2089.outbound.protection.outlook.com [40.107.241.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA8910E75F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 02:07:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QG7TWSGcQeM35GJ/tEEWKZQIkLUcsGGb73lVnb4tzIlgZXt2DQFFla+xgLncc/DNub3tO/wkCBhA9L55R9NK/mfxkoZ6F16v64UXmOifYDyqJ+vBOxoNzB2DXB4FDVufRYbjfR1ru2+ApQ66liL3qotHfzxf+ZySiP3+UXVnUwO8npHY+IVRs/oBE+WwjiDQXzFSi4MO9RyyKIhupYsKdnEVP/dsTMiEth9aDXj3oWbcu5WPGsxLbJRl5Re7TnAN5fWkh2FE1lFEUQUNVTYO4Gq6asWQr6ZOl8YG11Z5MztOAzqq53rYit8xXaOR0iFsukuPGZxgKQGQZZoIM4zFeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KebFnjOJMJc8P5/rNVIRSAp0dniFgF6l//UI3DooA1A=;
 b=rwljOEGxffLp4h5vbyts89Zdqj2gILFIXPM+nlZBewRpzt7yMzfTKlcC+nbjrs0cO4XCqQowO5/xB62accu1W0DcoCs6EHr/kIMxuuvzLhhF1rEHXAM1gB3pj62SPY9fdSODpylBD985/wRnLlB63HqJ0Gms0S9ciMYOJ5wYTbXJ5P7MiqnulUxla7Pc46loaGgM1AOyNQhi+/k/cuDV6tigJ6BXhdDP8o3j228XbYYp07vFUIz/LWB1kZNYElU/niFghGcV2TOfOGHCdxBL54XpOPcNZkxtXFNNi2EywhpMSbh2W6g7MMQTl814Ds4J49QAwnYbvQ0QoMwf9hcgyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KebFnjOJMJc8P5/rNVIRSAp0dniFgF6l//UI3DooA1A=;
 b=J9xY8UhT2BKGaMsbDWNBOcpBva2gpf/Y4vlfNptoWwwPNWpHHiEm8PLd68KJqukRetCm2RcndDR6ylQ3WPA5ZI6V0zLhL08cY76MZE3pgmpU/xWLXk/or4vXBPZHH4ZlXfvwoG78J47jYpEr7pHQbjlvbbXGA/EkCXSzXzYt0lGCxtDw7ioSJhRivwaNtEga76ZajtX0ijbayzP9cWY2yXZpERqBRjLE4tTQrDQAibhw3juQah/54MUozZNGuV91+AsLBL6HUa0bm9yVYuwslt9SGW9zNsmwjPvraEr/KfS18l++xrAmDV2BgO7aAJPNepkwUCcgpGLW6pq5RtcBtg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AS8PR04MB7543.eurprd04.prod.outlook.com (2603:10a6:20b:29b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.18; Tue, 26 Nov
 2024 02:07:54 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 02:07:54 +0000
Message-ID: <d004dfe7-d019-4f53-8373-c8c4e031748c@nxp.com>
Date: Tue, 26 Nov 2024 10:08:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [DO NOT MERGE PATCH v4 16/19] arm64: dts: imx8qxp: Add display
 controller subsystem
To: Francesco Dolcini <francesco@dolcini.it>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, glx@linutronix.de, vkoul@kernel.org, kishon@kernel.org,
 aisheng.dong@nxp.com, agx@sigxcpu.org, frank.li@nxp.com,
 dmitry.baryshkov@linaro.org
References: <20241125093316.2357162-1-victor.liu@nxp.com>
 <20241125093316.2357162-17-victor.liu@nxp.com>
 <Z0RXCYZ_7fBvpcvd@gaggiata.pivistrello.it>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <Z0RXCYZ_7fBvpcvd@gaggiata.pivistrello.it>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0010.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::12) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AS8PR04MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 8027a880-7900-4a1c-8efd-08dd0dbf2355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bENOR1BEYy81aXBLaGZEZ0VZK3J4QnJNTDh5dzRYV1JNTHVSZG8wazFZMUFz?=
 =?utf-8?B?UVV1YjBWT29mNTlrZmUxQnJOa2g2K0FSK2oyby8rWm45OG8xVWlSWU1JKzRq?=
 =?utf-8?B?QXNnVGliVmNGbDVQMnAwOEw4Ukw3ZUtibXdyNTJWVWdPK1hYMlpIRTJNVUcr?=
 =?utf-8?B?U3l2UFNmWXFTU2RUeFBpdXJzbVZJbVNXKzJMcDhoR3ZVa0RkZ2cxSVFIbHA2?=
 =?utf-8?B?eUpBeWhQa3ZVZ3BpRkVVNitnOW5OTjFZc212Zi9uYkdHVEFMMGd2UnNkT05N?=
 =?utf-8?B?cjJpLzFJenR1LzZUYzVKQmkydkhHOE5IRlN3SklsMkc3a3BUaHhnQjJJMUJy?=
 =?utf-8?B?SmswZFQwbjR6dXdGdGxyaTQyNjBTMUh4cG5zc3V3SzFqak40UUNWbFFvelQx?=
 =?utf-8?B?aVFJZiszQ1doUnEveEwrcWxIQm9INnZ1ckNHd2Z6MUhtRWZ1ZlR5SkloN3ZC?=
 =?utf-8?B?YXliRm9Ja3Y1NzZuY28xakhhbTRtcDIxaHMzdnlLTkVoYk5nVkxPVXZvZjJU?=
 =?utf-8?B?Y1dVemFpK250cjYyTWxJRkhlVkNpSytIeFU1TEZSWTY3Z2UyYWp6bzNUZU52?=
 =?utf-8?B?NW5mOXcyY1B5aEdSY1M2RC9FVkw0YmJ6eXBrWjdacWs2VkliQmtKV1dvSG5s?=
 =?utf-8?B?MXY2OVE5T3hGT2ZlMThUU0E0NWVNNGc5SUNMNDlocksvOE1BVDNGbTBua1A0?=
 =?utf-8?B?c1dPdWZ2blFBOHdtbXo5WFhIZG92WiszbEdKTU5HOXdNKzBTL1JNZEFROEYv?=
 =?utf-8?B?bERXVm16R2ZrR29wZ2JtNURXMEJMamNYSDdLWlhmcU80am81Q0RKcWJHVDZT?=
 =?utf-8?B?SWxiNmYyZUNXRWY3Q3BVV1VLSWtJRHhTUHBITE01eEZUb1c3ZE51SXBycGlu?=
 =?utf-8?B?ZnRuM1R3NGVGWW5MT0dVYVNxK29KRGt6WFYvTFNmWkRzYWpzS0hNWmhWNDNS?=
 =?utf-8?B?U0JiWEtucG93WmZ2cEFQZTdBNXQ4bVIxZWlvY0VTcklxZlR3a1pMd1c5K0wy?=
 =?utf-8?B?TTJLcWpkNlhFWlpkWjl4b2ZtVXZONjI2bTBTdk5sR2dXOUJpYnpWdVkyUUJJ?=
 =?utf-8?B?MmRwcFVZaFVhejEwdjFVeUYyd0ovNGYzcTVOWVBBUDhydmloN1hTTnZnQXMz?=
 =?utf-8?B?TGsxZUFrZXNQTjBXSjBqY01ORmh3V3NyUXhZUUw1K3o4YjhvUDRxaUFvam4z?=
 =?utf-8?B?aXFIL1paWENybGxkNFdsSGk1c3NBK1EvanA4bFVrRFczRFRHa3NFcHkwcnlR?=
 =?utf-8?B?OXpiemlDN3NoYVpNZEJONkZ3LzY5ckIySVFTWmtyd0c4ZWp3UVd3QlpveVVN?=
 =?utf-8?B?UmtwSHFUcDYxNW5VTUdXZHlvZko2YnA2U0ljV25jaXRjRU5yUHlKMmw5N1ZY?=
 =?utf-8?B?d3ZoNEJ3UHhraEFNelptdU9icmdtRmZDS05CaExmd2dpYmM1a3IwelV2bHox?=
 =?utf-8?B?ZWZzM1NPZCtLZk95SFpVZFFsbHl0cXlQZHRaR0hRL1ZCVkc1ZDdzcFJoc3Ay?=
 =?utf-8?B?SnZxYU1XZUdxR0UyV2FrYVJnOTN5MlJwMEs2YVVHSTZ3MEN1elVhVWNRb0dV?=
 =?utf-8?B?Mm9DUklGVEhyMzdQNEtXT2doZWM1ZC9Uc1ZNRjBtb2FSeGk0NUswZmpIelVN?=
 =?utf-8?B?SmpROHNxaE50bFRYZm80aDNrb1BrTGdLRU1uOGZyUFZPc0duTG9Da1p1MGhv?=
 =?utf-8?B?Qy8wVnFPbE1xNlNJVXQwY2N4aEVvNmJqTnB5N2ZwTEkyQXhtdVRCcURhM0po?=
 =?utf-8?B?ZUdZVS85V3RlYVArbHpQV24xTTRSYnNOenhjbXhRZmhNNmM3OXZZdGxtTGps?=
 =?utf-8?B?M0tiME45WXJIaWVDdlU5UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dG9Hdlg5aGp6YnNDTk9ISXhCdkNuZkorSDZoZ0kreDA2eVV0TWVkaW5qNTUy?=
 =?utf-8?B?Sk84dVNGSndWejIvdTlhM2NwNmpQKzNqVXV5aW44czJ5U3lBTHhtL2xSN3hp?=
 =?utf-8?B?ejJvd3UvdkgyVzA3eFFiazBRMFpwSzgyRER4Zmg4cGswMjEwWXJMOTVPSzkz?=
 =?utf-8?B?QUZza3ZxVVJPazEwTGpuMXoxZ2JlV3lJSHpwRll2VjkvQzByUGZGcmxpQWM2?=
 =?utf-8?B?Y0FXTjZQaGZNLzY4QmNXRExkeHo0SE9XU3dROG1GdTRSUkNsUDJSL05SSm1s?=
 =?utf-8?B?Tmtia2FreDdiY3E1SytpQ0MrMUNpUHFXWjN2dGdHaWxnL3ZiUEFHUUFPTnY1?=
 =?utf-8?B?VEdvQy94Q0JaZjhsMURIdTl5UDVvV0RvMVphamM5b0YrSS9rSWJMYW5yWnlp?=
 =?utf-8?B?MWtFaE43cWE2VTFWOEhyZG9tSWRUQlFVYjhQdTlscEd3ZWlIeGpTcTFYUmE2?=
 =?utf-8?B?MmhQcXFxdVF6STlWL0ozSnB1NjhRZTFPcnFFZENXcmhIcmtjbXREdEc5Q2F2?=
 =?utf-8?B?czJENy9zOGtUUjJqQWh4RVUyYzZ6STRPZzZnc0hYVUswTDhBdmNNdmRnRS9m?=
 =?utf-8?B?aVRsdy9PQ1NaellEbVV0UTdWdVAvcjJzTUFFWlR5dmVzalZiZXVrK3Q3Q1ZN?=
 =?utf-8?B?TDJGekhwUXJIWHQ3R290TGpaNER6d1dsU3JTeDVZUzBiMVJFT2pUZzIveGwz?=
 =?utf-8?B?cldYcGh0T3FqcUJud05nS3dUb0VhNStGR2xWMkdvMENqd0l1eVJWbzIrVGJh?=
 =?utf-8?B?SWNFaHBHNXl6OUlJYWx3TFdIa3VTUnRadU9lODVmR3pHOUVIaHBMR2JYMFNY?=
 =?utf-8?B?MnI2cG1PZ3FGZUowd0R3eXgwcUlXL2Q5em02MVhPTFVRS3Zxa2Zia3o0U09a?=
 =?utf-8?B?ZFNhdUVXdHVLUFFWTitPZUlZVlAyQVlOb29ld0NCRFZidzZhNkZFeUVoaXRq?=
 =?utf-8?B?ektCekMzWmNxMHRXRkdwVkJSWkhxcUhvR1lQaGpTOXJHNGdyN3liVmFobXNM?=
 =?utf-8?B?WHZVdHplWHdGVENaQ09RaVhKTGswQnMwWmtwdlRtbEllMUFhN2xubjRqK2JX?=
 =?utf-8?B?eXlBVDFvWldHK3VRM2U1WFRrN3RzN2t3SnRya25VZ2RBdmVPQ2Q2T0VlMm84?=
 =?utf-8?B?cHJxZWlDMGlReFlqVE1HRjFYUGxNOXlaUVhzSXFtbDBPbHlZckE4SllMUGdI?=
 =?utf-8?B?SS9rMG9VTHJyNE5WTTBYenNVVDJEenNKTlZtL1FxMHgvMjZTK1NzSmUvZkJh?=
 =?utf-8?B?UCsyRWd5cmdhN0pvSjQ1ZC9OTmFTWHRqelhSNVlvYzdCRS9nTjlUNWhQMUJl?=
 =?utf-8?B?bG9QdUR5V1ZEOFBxckVQN25LVUhpM3FOU3RzaTdlU2NPWTV4RUdsMTlQWmNh?=
 =?utf-8?B?dnA5R0FuQ0dNQmI4SUlwNjRVS2MzRjZha050VThOZEpEcUh6RHd6WUp4WUxz?=
 =?utf-8?B?ekREREdYbzhVb0RvbWtMa0hsY0F6L1JWQTc1c3VjN05kQUZLbzYxTENuY0w2?=
 =?utf-8?B?TS8rYytBanFHSzg0Z3dRTEhraERudUNOT2wyck9obi9Gb0JXNUg4cTBHQnU3?=
 =?utf-8?B?aDJhbGVpYUUvNUdVUVZRbm02Z2F1QVlhOUNBK0Q1Y2pzRkIzSElrUjlOS25K?=
 =?utf-8?B?S0R1TEsrRmdtR2VzRlpzdW9aeUdRZXBVMlpoRUpqR2RJT1dYZ3J4YWZKYzFu?=
 =?utf-8?B?SmhyU3A1UVJpbkwzNWZDYlFCWCtzRGMvZTZobjN3dWx4aGpIcDVZbjQ1eXA5?=
 =?utf-8?B?bVV0dlMvN2w5SmpsdkRsZ0I3OGRKajk2Nnh2dXZDVGE3MTNpN0M4ZmZ6ZXI1?=
 =?utf-8?B?OHh2ZEFrdU5uWkpkaEV5NG95YlY4L21IcS9WcWVubzRqaEphSExscFMvcXBa?=
 =?utf-8?B?Q2lhR09pd2NZOStMZSsrdEpxQm95aXlPWVhGOThLU2NWYjlhM3cvMmtlNU1K?=
 =?utf-8?B?TU1ldnZJc0ttVHd3T3o0clQrQXNsSUJNa2U5aUp5VUxjQTk0R0hSRDJUQUZk?=
 =?utf-8?B?SkxjVmNPZzB5OE9saGlCeDZzYkVGTURkTDdhRStaYU9lSytsWStoVUdxdW5q?=
 =?utf-8?B?OUw3M2cvYklpT3h3REJRTEJqb2Z3SnNnSnN1VmdDVVA5VHlWMkp1TGhxVzVh?=
 =?utf-8?Q?eWJaCy8PGOgc0UBA+xbKYADaD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8027a880-7900-4a1c-8efd-08dd0dbf2355
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 02:07:54.2501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qleyUW2jgv/rfJbWb1iyzUZ49VQSszO+zemZM/d/qwR32jbi0mhIuaOsAJxvYGtxox/QPtVKPVRHGwLBcxgA7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7543
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

On 11/25/2024, Francesco Dolcini wrote:
> On Mon, Nov 25, 2024 at 05:33:13PM +0800, Liu Ying wrote:
>> Add display controller subsystem in i.MX8qxp SoC.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> 
> ...
> 
>> diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
>> index 05138326f0a5..35cc82cbbcd1 100644
>> --- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
>> +++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
>> @@ -20,6 +20,27 @@ / {
>>  	#size-cells = <2>;
>>  
>>  	aliases {
>> +		dc0 = &dc0;
>> +		dc0-constframe0 = &dc0_constframe0;
>> +		dc0-constframe1 = &dc0_constframe1;
>> +		dc0-constframe4 = &dc0_constframe4;
>> +		dc0-constframe5 = &dc0_constframe5;
>> +		dc0-display-engine0 = &dc0_display_engine0;
>> +		dc0-display-engine1 = &dc0_display_engine1;
>> +		dc0-extdst0 = &dc0_extdst0;
>> +		dc0-extdst1 = &dc0_extdst1;
>> +		dc0-extdst4 = &dc0_extdst4;
>> +		dc0-extdst5 = &dc0_extdst5;
>> +		dc0-fetchlayer0 = &dc0_fetchlayer0;
>> +		dc0-fetchwarp2 = &dc0_fetchwarp2;
>> +		dc0-framegen0 = &dc0_framegen0;
>> +		dc0-framegen1 = &dc0_framegen1;
>> +		dc0-layerblend0 = &dc0_layerblend0;
>> +		dc0-layerblend1 = &dc0_layerblend1;
>> +		dc0-layerblend2 = &dc0_layerblend2;
>> +		dc0-layerblend3 = &dc0_layerblend3;
>> +		dc0-tcon0 = &dc0_tcon0;
>> +		dc0-tcon1 = &dc0_tcon1;
> 
> what would you use those aliases for?

They are used to get the instance numbers of display controller
and display controller's internal processing units from display
driver, e.g., patch 9 & 10 get instance numbers of some display
controller's internal processing units.

BTW, i.MX8QM SoC embeds two display controller subsystems while
i.MX8QXP SoC embeds only one. So, for i.MX8QM, there would be
dc0 and dc1 in aliases node.

> 
> Francesco
> 

-- 
Regards,
Liu Ying

