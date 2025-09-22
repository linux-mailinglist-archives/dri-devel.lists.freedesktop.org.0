Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA700B8EE08
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 05:47:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A020410E39D;
	Mon, 22 Sep 2025 03:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gTIyApyd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013003.outbound.protection.outlook.com [40.107.159.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A516410E39D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 03:47:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5IMdyXGmdkMVtd84M1CRHmb+dv5lkzWzoGzPUuUy3EUS92ATqFHGS+veJfSuGtuMytgjHM8ncTzeqNpkjPWl7Toy1d7A7splDDkX6fpNuBxEDz1rLbxJlcXZJX88drdaRiaYp4OtbmA0l9VjdIyWYcweFTMoi44KtaBJD5N7gC917ECfxwy+FNrxNSAJjbFKwo8OnH7VLQYhL1uAFdSk+ESYtyZISG7CjRMZZOC+q5lG94fMj4nLtoES3GRJUYk9m5e5OMpdiw6Qg3GV9VcaPrSnDzIp2R0xKVKz3TOz03EPtRqqIUQAUVJ4rSd5s14VeQeK/oo5JEX87AjsIxNQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kV4Hnlm9obszAR1yDEOeXScgJ8nx1zOyZ1Y8iy1IhfQ=;
 b=oMIoLE1S8GchsQbXL9tmlSDJHpHU0uVFDM9aKcwHsi3C/MAWX6oFUTROixEVgm72Bhu0M5cTAB/43jnk3ltXEf18ppGGSRTb1fEacvRE5x2NGFbuxfXeR2mziDqY5o/dSXJ3v327Ss24w93R8G6C+nPNPDpFt9BbiCDpu3MN9X4c3N1ikbwC4bvdbXbLMU1x4ZyBV8JGR9JqKIeBzg02vpfCpdA9c2byLhGrDZeMUQNjvT1UefnE1vNFiJl3ClEWJNNL6LEIn5O7PE7Vg/CqkcNIVuW1FrTzwVMpaDp/Xtt9z7/MwWDyc7GvS19/ziUJZaZXWiMPiVSj6b13mFPW9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kV4Hnlm9obszAR1yDEOeXScgJ8nx1zOyZ1Y8iy1IhfQ=;
 b=gTIyApyd2wg4PUsRvm6kLbM445W2HicK6gMCZhRUCY/T1j+PZVJ/lr8y1DSRNUa9LfulFxipL89OEdHmFtkm4t1mQ9JfLB+XeCmz1F64jBAuOlHncruBTXPJRaNpVSLsRnBH8eJ9QuKWi1k2DSi0znEOs1wP84oUWNlJiSXIAGVdKPMrur4DTQSlOhaC7QxYXtPix+xIYBmOhXpkA6IPaYNsVv8S2vFPtw3MmSkj904gzQJWn7qIT95SNf+5Wc5Vy559DmOHCMyjMl7igfenMVdrBx8ZEMHo05BryZwA3p3lesseD39/e6g7ZqU6QDtREa/6wEMlswLu8wAwFUCl6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7246.eurprd04.prod.outlook.com (2603:10a6:800:1ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.8; Mon, 22 Sep
 2025 03:46:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 03:46:56 +0000
Message-ID: <a4a75e87-ffe4-4660-a1a9-19ab06521a6e@nxp.com>
Date: Mon, 22 Sep 2025 11:48:26 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/14] drm/imx: dc: Use TCON operation mode
To: Frank Li <Frank.li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250704-imx8-dc-prefetch-v1-0-784c03fd645f@nxp.com>
 <20250704-imx8-dc-prefetch-v1-8-784c03fd645f@nxp.com>
 <aM11kCDCGaAFO7cv@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <aM11kCDCGaAFO7cv@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2P153CA0034.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::21)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: fe2e4abb-5833-4a16-939a-08ddf98aad01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|19092799006; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmY4bk1BRmpuOVNCTVRwRXFta3htenVEcDdrMTRVMzVsYzZyK1FVSHhHZitH?=
 =?utf-8?B?anNqUzJrTEZwaVpHNlBYZTFKUkxyR0JTTVZ5QVNyY0c4V3BXTzJwbS9zbm9r?=
 =?utf-8?B?TUJ0cSswajZmQXl2WGNBSmRFenlIcjJZZnUyQzRYY0tRZWR3Vm5qME1xT3Nm?=
 =?utf-8?B?TVdvWXNrVVJQTmhUeWFURFc3OS9UMWM4SnUzdXNXNEhNZ04rOWlNbnIydmF3?=
 =?utf-8?B?emkwLzF1T3p3Sk8vT00wSXZaK2pOdE80MnpzbWhwRkVFTTlrY0YybkI4QnVz?=
 =?utf-8?B?Z1dlb2dyMkxMUmVWOXpabEtsc2d5b0k0ZHBIUDJ1TGcrNCtZK2t1MW1jVk1h?=
 =?utf-8?B?RG5EL2xxWlZaZUtLd2RWbDlhS0dNSndGbjRrRVBrcC9UbGhsSlMrakF0VFA4?=
 =?utf-8?B?MXhWL3gwWEJjTHY2ZE5xQWpqdVhRd29TaHB6WWlQbjRGaVdJN1ZFRTFTUGV0?=
 =?utf-8?B?M3hidERxYWFDT0xjYmpvZEV4elRSSEZ3a0hoT1NYUFlTV2o3aUw1Yk5EMDlF?=
 =?utf-8?B?d0gyZFpXZmNoRjcxZ0tmWFlLOE1NZDR5WDFuQitMNHlpck1KUTZvcWRwa2g3?=
 =?utf-8?B?SWFaRm1JeDZvSksyRzdFcTA4bmtEUzBsbkFFczdwTkRQTUVhUmgrenh1ekgz?=
 =?utf-8?B?QU5YVW9zdHljeVIrTHdBZkhMaTBRVnlUQ3BTdGZPcDVNSmh3RWE3alNlc2sx?=
 =?utf-8?B?NTdzQzlVdzlPcEU3eDNUOFBiclMwRlVLS0VuYUh6SGdqYjlWMXBVczQvVzBr?=
 =?utf-8?B?dGZaWFRNZEw2dWplaDIrVWd2ODE5SldHRmJwaThEaTliY3MwT2xCL2ttdEhK?=
 =?utf-8?B?dWYzQTNmRUoyUjVlOS9DRm1jZWUwTWlySkJuYitCaWhET1QzSXVyU2pWRjJZ?=
 =?utf-8?B?Z1p0SUJpbk1LVU0yUHhHN0ZaemJYZWwzQUhMSHNMWG4zb01lRForT3YrK3JE?=
 =?utf-8?B?T2N3aGk4alpoOHcrbWQ2ZjljcVVsOEFubjRlRjFjTUMrM2FXekJVVTZwUGZa?=
 =?utf-8?B?bDRhLzhpc0tLWGM3Y25MT1lhUFNoNythOFpxOUZ5NndsYlhwZGlSTktsMjNU?=
 =?utf-8?B?L0VTamIyRGpNclJ0TmZPQnlBQ01mbnZnWWdraWhCWmY4UVF6SDJhZFhVUk9M?=
 =?utf-8?B?UDZzM0g1VjhmV3hjd2ZoNFlUeGl2VnZYdC9HdEQ3amwzaTc0cER0by9EN2tq?=
 =?utf-8?B?bW56Tko0YzFoRExyY1pwZE53WE5GV2dHb1NFN1hYMlNiYjM4aXpzVWczaVpF?=
 =?utf-8?B?S1V4WUxGMDZEeFd3bU1venpZYUR2aS9lN00wOUlQeCs3eVNCNHpORS9PcmZ1?=
 =?utf-8?B?ZG5rMDltMjlhR3NWcWcwYjBKYldkSkVjUTZ0WWdYbXlzMGhDeHYrejlvYUdr?=
 =?utf-8?B?QmlZMXJyL0NuYmhzMnBNTmQyRGhDV080T2JiRXVvYlNENmxLd3ZQeStNUnVi?=
 =?utf-8?B?bnQwWll0Zm02M0V6b2hJUWREMHB1SE41OXRKNG5la21VbUtjUUlYTi95S2RX?=
 =?utf-8?B?ZDllUHdGMlQvT1lidGJOMDNHK252NTFMZ2Mra1QrdzZXSzA5YUR1WGlQZjdu?=
 =?utf-8?B?OGpNVUFhVUNSR0cwaGQwUGplRlFiVDNwczF0NXh4SzYvbGYrMXAvU0JDbXNx?=
 =?utf-8?B?Q2ZXT0xJMjI2NkpFVVF6ZlorbFJKZFNOaWg4dHMvakFZNGJrUEJvNlJrM1BX?=
 =?utf-8?B?eHBmNGpWbE1iLytsSEU5SkE5UFo2N25MbEVIblpRK2poZ2FxemdKcTVOVTZj?=
 =?utf-8?B?eHREVmVCTm51NTdHUzNsWEFwY3BUSkdXWUxlOVl4YUh4cHBUT3F4LzNLeHBz?=
 =?utf-8?B?TmRXNmxPOXplbTVIWGlsb0VXYlFYSGUxdU5rWkIyNFZyYTFDU3VtSzhTQmJx?=
 =?utf-8?B?Z29lNTkwQkNKQyt5akRveXNLUEpEQmZuakVUMlFycUgzRmlHejI2TU42SjNK?=
 =?utf-8?Q?61zlpjIOj38=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWZqK3RTbTh0QVBuU2phVVZuYVVHdjRmTjNGQUpvbWRpVm00dy96cFU3MGNq?=
 =?utf-8?B?WDRJNFZyM3dCSWtMdjR3UnBzcWZMaCtxWkxNU01wZjFPL1pVNXdYVUI1RkIy?=
 =?utf-8?B?R3lScGR6SmgwblN4NmIyWGZIK1BQRW1Ma1ZUekFPVjB2YTFiYkRvTVpGVWs4?=
 =?utf-8?B?SkNaVk15T2tSeC9BOEwxSzczK28zUE9XaVJsWWFmYzFUTEhGL3F6RjU2Qisw?=
 =?utf-8?B?L2ZDQklYVjRMVWdkVlBBMXZZK3V6TDk4NW00WmZvQ0dEL05Eam81R2doREdr?=
 =?utf-8?B?TlppZktDeXBCNVpNWkVBSDZ1blpnbEQrYVJNUldIWjBhUlRBNkU3SXhtd0VD?=
 =?utf-8?B?ZGNvems4Zkc4aVdvR2M0dm85VjVkT1J3RUJaSVE3VmlWWmtJRmxmR29kSHJR?=
 =?utf-8?B?UmJxNmNZckRYYnRJUnZvUGxCNkxJVUxTQk9BZ3JFQmtGM05MMkp2RmZsd29q?=
 =?utf-8?B?MjJYUVVnTWNCeldxcXcvSHFGWHdqVDJGQkVweDVZMGdzMDR2ekRqZ0llUFhF?=
 =?utf-8?B?SFFKeE1CMVl4VDhiRE5YNzR0dFVnbE9QVjNGV0dsUUpLNXBYd0JsRmhYUjUy?=
 =?utf-8?B?MERrWjg4Qy9GWHpHTHF1dU5WTXhCWHQ3ekdoMDU4NmhGeG04WU02Vm94Z2R6?=
 =?utf-8?B?VDAzanVjOVVQVTV2eFVBZDE1Y1ZyMmRFbVpkUmZveW15bXQybmZWcGhqQ1hH?=
 =?utf-8?B?TmcyUkhqYzJibDBrV1hzRjVDRlZkZUYxWEVVQk1zR0Zka0lKenltUkNkUFlh?=
 =?utf-8?B?Wk5RRFF4QW1aRGlkdVEreUZsNWZmTlBXcTNhR21QKy90NkE3WXhJd3ZhRUxD?=
 =?utf-8?B?RzMvZkxUcUFvU1F1enBoMkFSQXhNWnJGa3N1Q3M5RjViOHBHZFZZOG5WUmxl?=
 =?utf-8?B?d3V2VE8xUEluTUlERlVLaml2bnpOUFlDRGVhZWxPSlg2ekhrMlBZa3NScFpL?=
 =?utf-8?B?N09rRExNMERsWTNXcTN3YmZkUGR4NENyZnpybTJ6akI0dVVIN0cxbTZqZFBR?=
 =?utf-8?B?dDJVSEk2VC96T2s4L1REQmp3OHpSQXU1MUM3MmZ2RkcrN3EvUFpOVjR5L01x?=
 =?utf-8?B?SkRvMFR4Z0JDNnQ1dTFRc3Q1YTZKZDVmV1lqYXdid05KdTV2L2Z3UG9Hb2ta?=
 =?utf-8?B?alpNV29vZzR6YzFWRG8rQUlQWXNyNkIwU29ybG81R3RTWmpYeEJQYTdqZGpT?=
 =?utf-8?B?NzROMGtwL2dCY2FjaEErbHI5d2ZiVDhYL0VBWWN3L0RNVWY4Ylh4MVNDS0tv?=
 =?utf-8?B?eFJPcTNlaDBwQUx0RmNiWjNQajdGUk1NZHNDWGtoRmhxVDc5UUg3SC9LeTRY?=
 =?utf-8?B?S1U5YmdYN1EvNkJjZHBrd2c5cllCTkd6Y2ZDaVAvZVZ5VEkxWTd3NUJjT2px?=
 =?utf-8?B?cVl1VFdVa2tveSsyZ0hFekNEZ2dMMTZKMTFoNWNzSUFnRE1DQ0JMYjlGZ0lX?=
 =?utf-8?B?T0NGZ0c5Y0oyZGpCMFJsUHpyQk5iU0lhRlIyN3hielJERDhyNXRSVlAwZ0N1?=
 =?utf-8?B?aVAwNjlCZjkwVlprcy94ZlpZRGZoUExvR1h6TFhCZXNQM2ZLVHBFcVZzSDZp?=
 =?utf-8?B?aW1aZUlPV0RLZ1V5OXpqVzRMRDJUMmYvc0FDNStRREEwbWF0UU8xLzVZcHkw?=
 =?utf-8?B?Z0ZvWHpBOURZbnpzdlVvc3ZTVHY4eWZKa0xac0VmZzNPY0tuaUoybG9PY2pa?=
 =?utf-8?B?by8xMnNQKzA5Snk0bkJ3dGtINkZHZ09lRG1yMWZJclVNb2NRb3Jma2VUeGc1?=
 =?utf-8?B?VzN3THZxeExmNjBUdWNGYkQySUo2bzBDcjNqMlBQNWZmNHBJSnExYzhrMEl3?=
 =?utf-8?B?Uk5kR1BFa0k5OTRIZXVud2d0NWVNeFpHK3B5SnYrU1JEb1VTQ0NkU05ZcFRp?=
 =?utf-8?B?MG1sU0xTRWpjRGVZNlRmVS9EVDFzQUdMa3EvRTNYbFR4ci9DaGFIUVZORG50?=
 =?utf-8?B?WmdVUXJoNGlKamJhLzdVRXhpTENwTE05TjdMU3VUU2FMVUQ1UjlEN0hGZ2lM?=
 =?utf-8?B?b0VjL3RIUUFTV1pzb1IxazRuWS8xZURSQ1hCUmkydG5RZUtxdEhnUDZGNGdu?=
 =?utf-8?B?Vnd4R2FwZ3d2QVNySExyczBwQnZvSWViUCtwQk1CMUdaVWp6cjRYRVVYbUJO?=
 =?utf-8?Q?ki6CJvD2tchU7m6iPdRYIwwWD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe2e4abb-5833-4a16-939a-08ddf98aad01
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 03:46:56.3985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hYnwPNaUotwWKOYK5TS1CVZOSxPCQsXpdJJ1e8wAU5U9Oi/1M6TualLPh21Ab5B0Hc2zWcAYuEaw825Xw/q/5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7246
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

On 09/19/2025, Frank Li wrote:
> On Fri, Jul 04, 2025 at 05:03:55PM +0800, Liu Ying wrote:
>> In TCON operation mode, sync signals from FrameGen are ignored, but
>> a much more customized output timing can be generated by the TCON
>> module.  By using TCON operaton mode, generate KACHUNK signal along
>> with HSYNC/VSYNC/data enable signals.  The KACHUNK signal is used as
>> a synchronization signal inside the prefetch engine(DPRC + PRG(s),
>> attached to FetchUnit(s)).  Carefully switch TCON bypass mode to TCON
>> operation mode when CRTC is being enabled so that the prefetch engine
>> may evade the first dumb frame generated by the display controller.
>>
>> Since TCON BYPASS bit is controlled by KMS driver when doing atomic
>> commits, drop the bit setting when initializing TCON.  This also
>> avoids accidentally initializing TCON BYPASS bit to 1 when driver
>> module removing and re-installing where an upcoming patch would
>> disable a CRTC at boot in TCON operation mode if needed.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  drivers/gpu/drm/imx/dc/dc-crtc.c |  28 ++++++++++
>>  drivers/gpu/drm/imx/dc/dc-de.h   |   2 +
>>  drivers/gpu/drm/imx/dc/dc-kms.h  |   2 +
>>  drivers/gpu/drm/imx/dc/dc-tc.c   | 114 +++++++++++++++++++++++++++++++++++++--
>>  4 files changed, 142 insertions(+), 4 deletions(-)
>>
> ...
>> @@ -249,6 +260,7 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>>  	enable_irq(dc_crtc->irq_ed_safe_shdload);
>>
>>  	dc_fg_cfg_videomode(dc_crtc->fg, adj);
>> +	dc_tc_cfg_videomode(dc_crtc->tc, adj);
>>
>>  	dc_cf_framedimensions(dc_crtc->cf_cont,
>>  			      adj->crtc_hdisplay, adj->crtc_vdisplay);
>> @@ -273,7 +285,22 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>>  	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
>>  	dc_ed_pec_sync_trigger(dc_crtc->ed_safe);
>>  	dc_fg_shdtokgen(dc_crtc->fg);
>> +
>> +	/* Don't relinquish CPU until TCON is set to operation mode. */
>> +	local_irq_save(flags);
>> +	preempt_disable();
>> +
>>  	dc_fg_enable(dc_crtc->fg);
>> +	/*
>> +	 * Turn TCON into operation mode as soon as the first dumb
>> +	 * frame is generated by DC(we don't relinquish CPU to ensure
>> +	 * this).  This makes DPR/PRG be able to evade the frame.
>> +	 */
>> +	DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
>> +	dc_tc_set_operation_mode(dc_crtc->tc);
>> +
>> +	local_irq_restore(flags);
>> +	preempt_enable();
> 
> Does it need reverised order?

I'm referring to __raw_spin_lock_irqsave() and __raw_spin_unlock_irqrestore()
to do this right, where local IRQ is saved/restored prior to preemption
disablement/enablement.  Am I missing anything?

> 
>>
>>  	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_safe_shdload_done);
>>  	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
>> @@ -561,6 +588,7 @@ int dc_crtc_init(struct dc_drm_device *dc_drm, int crtc_index)
>>  	dc_crtc->ed_cont = pe->ed_cont[crtc_index];
>>  	dc_crtc->ed_safe = pe->ed_safe[crtc_index];
>>  	dc_crtc->fg = de->fg;
>> +	dc_crtc->tc = de->tc;
>>
>>  	dc_crtc->irq_dec_framecomplete = de->irq_framecomplete;
>>  	dc_crtc->irq_dec_seqcomplete = de->irq_seqcomplete;
>> diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
>> index 211f3fcc1a9ad642617d3b22e35ea923f75e645b..c39f2ef5eea98c3eb6ae9b5392f9bf9f7e33e7c5 100644
>> --- a/drivers/gpu/drm/imx/dc/dc-de.h
>> +++ b/drivers/gpu/drm/imx/dc/dc-de.h
>> @@ -54,6 +54,8 @@ enum drm_mode_status dc_fg_check_clock(struct dc_fg *fg, int clk_khz);
>>  void dc_fg_init(struct dc_fg *fg);
>>
> ...
> 
>>
>> --
>> 2.34.1
>>


-- 
Regards,
Liu Ying
