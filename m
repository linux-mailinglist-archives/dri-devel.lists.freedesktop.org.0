Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5056897E818
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 11:04:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34BF10E3B8;
	Mon, 23 Sep 2024 09:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="bJqFD4Yi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011045.outbound.protection.outlook.com [52.101.70.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAC4B10E23B
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 09:04:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ddo4Vuf4MkDJZXn3MgbppjT7bgtKW5fQi9/M8IOw2zRD+2xtRnMSOWDF+AsU2RYOQ6AJFk/NpUEfN9fo4QPl6n8WmcmqjBT4/wniuI60aKWfJWPFf7utJfdqZHz07t/HzRmmB9UrFamseuAmTtvUBtpyXlrRf3ufYLbpH7JE7sr+bkEYbLwS/0Lms0EoOK1TV/BGAJ/Z8yXHtBi1/5BQVX1IPAJnAajwgNUt8o6daCF8693SM1zk3SlDAuTmpKKtD8IKPPPlwxMSazQVZeaPziQHmMLORJn8CVmzGyJKfhtpEMnVuyBjORwMbgM3H6ljiNw49KRdIw55/bQSvSGtsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=THwpEHUeTLJeFj5bxj5OWeTCUvvphuiVYq8zsHiDEP8=;
 b=aSwawWVXga2M/VMc1aWquesENUWehoxXQCca+xvd9sXdnWcFG/rUI7gZpHNcX/xc3hanymLUHYhbj7U7HzQI7e/sO8BAV1MZAaoUVZ18QsehsoG/2+fiMWfKTPGVx3Rv/8EbPaGNlUwpLcpMhduFRan7xWfOGF7BO9ZbIFGJWfT4uxUxy9IiVWCEWZtn+8HNmoljs7STuIgG6HuJ+3CAmXTKO/qIKa+SSR0V/Er0XeSf4LrAjUu6+PDgdKX3jcuOQglfvO+tcKuT5gpXrmmg3BvyOODzI3aNYsPq6sFYVQgcjcf3YFih6nTjlAHJiJs9y7PRvBfm5Os3SwpxbUurDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=THwpEHUeTLJeFj5bxj5OWeTCUvvphuiVYq8zsHiDEP8=;
 b=bJqFD4Yi2eqr9lbLpSSa4jWy1mUS3vpVjseHRzI6RqoAGHHBYpNX1ZEdGm4X5dzzmcCgAu66FaZkURu/ydFdDHbpzO1+rNq0tjLtiWxYL7YYaDJBt+2hH5bwQbs8QQLTMFK8I2iJMgssBNXOT9Vxu4/Ao58RP0LnhVS471imYItywJ+OoBG933eDlBSWvKzN+R1ab/sxdh0okTj/ySJkF5UlOCnd7/w6OH9bobsMZp/Jhv7q1tWwk/VyjyVxcawDDSygr9FLmWb8fzySenIX5rKQrLZ/oAc3a2X8CjzI2ZvTpPHgDYfjjC5Ccm+wqf3Zk0vFiiSI/1Fw2j7uyTkMKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by GV1PR04MB9197.eurprd04.prod.outlook.com (2603:10a6:150:28::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26; Mon, 23 Sep
 2024 09:04:21 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.7982.022; Mon, 23 Sep 2024
 09:04:20 +0000
Message-ID: <ed3164cd-8a47-4e64-9ee0-60530c12c7a3@nxp.com>
Date: Mon, 23 Sep 2024 17:04:51 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/bridge: imx: Use of_node_put(remote) call only once
 in imx8qxp_pc_bridge_probe()
To: Markus Elfring <Markus.Elfring@web.de>, imx@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 kernel@pengutronix.de, Andrzej Hajda <andrzej.hajda@intel.com>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <492f8027-f657-4def-b677-34d3f47d8de4@web.de>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <492f8027-f657-4def-b677-34d3f47d8de4@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|GV1PR04MB9197:EE_
X-MS-Office365-Filtering-Correlation-Id: 87eba3b5-6adf-4f59-a437-08dcdbaeb5ec
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N21Zc2lsSFF6UlpxblVRWmJCR09GZHBaT3ZMcFh0enpZVmpzeDgrUitMTjEv?=
 =?utf-8?B?RUR3N091blpmUWM4ajlOY0ZvSDVwRGRjeXRyVzNLNVUwUVRpaUlRVGRCUmFV?=
 =?utf-8?B?SEczMEJldUdsQzVIZTBlQzMxdGNaQ1o4T1lQeGRZLzZKcmR6TXJsZ2RCdlVW?=
 =?utf-8?B?MnVtT29tNXdNV2hxM2I4UHh2NUJXOVNGUFBHc0wzaHZjQVA5TXNvMlU1UDNH?=
 =?utf-8?B?VWlXWjkranpacGhwNzdjUHdtQnIvUGZBMWVPVzVVYXVhZS92VTJXUHNvVlFt?=
 =?utf-8?B?bTAwTS9hVWRSWUNrU1M1Nm8zS1ZwWG4zVjVoMjZOUmc0Nm9lNFlXTVRNVmt2?=
 =?utf-8?B?WE9rcXRyaDlJVUdLYTBvNlA4L09PdDZETmpPT0V2ckpsTEtUSXNPT0xDK3Jx?=
 =?utf-8?B?MkE0WHNpL3VMNUZnOW5iMmNIOGhDazU1NTRYcUkxT3ZVTTZVZzFjb0hFNVlQ?=
 =?utf-8?B?VUw2dWNWWmJMR0pGZURxMC9lSWp4NVVVamVyUUZqczVYUjBnRzlsV3RMRjBN?=
 =?utf-8?B?T09wRVlMamhPZm00Z1NVd1VKS2t4dFIwZk1raldRT1R6ZlZyZmhMVGhDMlR4?=
 =?utf-8?B?TnFJSmxyT1BodTcwWVVUSGVkVDRCZkV5eGhCWkZtKy9xSjY4eGJNOXBHQnUx?=
 =?utf-8?B?VTlMRlJ2d0lMTlNCTDgvdVU5ckxqNHAxckZ0QW5WYXZjcEtLY0dQSXZ2UFJJ?=
 =?utf-8?B?dWJkZjJKTHN3M3N1aE5oRU52dUZqUVFkbXRoZUFQa05jMHhQeEd6bER0N3dn?=
 =?utf-8?B?U29oeXJRcHlZRm1BSXVpQ0QxNC9oZmllYU5tUktOVVRMUDJ0N0JQQzFzVWJI?=
 =?utf-8?B?OUJxWWJ0MEx2eTdrZUtTMXhtL0ZHSXlhODN3cTFObnBtK0k1ekgyZk85c3JE?=
 =?utf-8?B?SDNROUR4a0IvT0FidlkwcEY5RFNsWFA1YkFqNFM4ZmV4K1RidWJTeG02Z0lD?=
 =?utf-8?B?NS91aXJxeitaU00ycUdnbTA0cmpGckZuWnRmRURyLzhBZEVjb3RjL3lZQmVj?=
 =?utf-8?B?MGpTM3dJQlZDSy9RRDdRTU5kWTJCOUFmZUV1ZVljcHBmQXhWcldpNE9sajF6?=
 =?utf-8?B?cFBZcFRIa1ZiRzRYRGhrMGFDWVZJY0Qrb1QvalhvRkNoSGZQUk9IZHpOZHZk?=
 =?utf-8?B?SzZaVnR5eTVocnBUcStIYXEwb3ZzWnQvMDhtKy9nL3diQldhWEMxSXZWeFRX?=
 =?utf-8?B?b3YvQjJJUEUzNVBCZ3F4Qi9mcmJQWGJtaWo2MDlUb0w2OG8xSlRKSlNEVEp0?=
 =?utf-8?B?b21TSXprTE92d0d5bXpMRmQ2ZWhrNksxT1BtWEd0cWZQcW9JOGFySE4wNEox?=
 =?utf-8?B?YUE1Vm9aakZXdktCSHBMQ29QTWo2dThEWFNSdFkxcklHd0M0a2pXMmJEL09m?=
 =?utf-8?B?ZmhwVGpab0o3Sy91eHZCOG1VYlo1eU5qVm12RkozNlFPT1ZIWEVJMU14b1hP?=
 =?utf-8?B?RDA1UVVPV3lOekZNZkpkdkZ5YjY5U3U2TXNRQjhlclhUV3FFRmtLK0hFRlpD?=
 =?utf-8?B?QjcrQk9CVktZUC9TZlBERTMvTVdQamFCM3c3cFU5TXJWRHdxNmlXMnFtemxT?=
 =?utf-8?B?b1VQTk9Cekl0UGd5R25JMGliZy9ZSkl5NEJKYXNzSHZhL1FLckVMVG1xSXBv?=
 =?utf-8?B?d3BDRUV2VUszazdpQmZzSDdVUEVVOWpSTlZuSVRnUS8zUWI4WWZhZklhVHd5?=
 =?utf-8?B?Y1hBVWdiSUtyTVAyc3N4ZFh0NFd4K0RESURsRXN4bC9oVkU5RkljcVFNZHF0?=
 =?utf-8?B?enVxOFJIR2oybFRvd2JrQ2JMMEJ4cnJrUm85bUd4WkZBbWhGbldLZkl0azBL?=
 =?utf-8?B?RjBXN1d3dVdzaHNjb1cxVkFrc2hOR2NML04ybVo0RU0wc2U1U0QxQzFTdGdB?=
 =?utf-8?Q?Pwm9XDYisvt8f?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2x0a2Q4MGZ1K2s4cmNOSXFlQVBXd3pmbVQ4ZzY4R0VhRm9HdUZaM3grVWJP?=
 =?utf-8?B?M2t5dXFDSitEQW1GSUo0dVhEZEhBMFYvMXc5R1MydXdDeWdCaTNOUzlNZFlD?=
 =?utf-8?B?Qmk4ekVxamQ0ck5FWHJZZjdEUE0wZFV4R2FucFdPUjk3K1pIS3FRUjMySFdz?=
 =?utf-8?B?eVZMTTB1cFNWV1V5WTdIdWxZbi9pYkViRXVxTUlsa1IzUmpjcG1tM3h0b3B5?=
 =?utf-8?B?QTZPeU15eFlvT01Ic0xINWgwMHhXWll0UG9pWTliWlI1Z2loaTRtSkdReC9N?=
 =?utf-8?B?MWJlQkwxKzlVVFduby8vOWErRkNqV0pOTUh3bXA2Sks3MGFVYTkzK2RFdkg2?=
 =?utf-8?B?SzJMOTg4blVMY0NRelIwYlJ3UUQrbGRrZUV3K1BsTlpNcjJEdUhFckVtQ0Fy?=
 =?utf-8?B?Z3V0R2F0aERNQlRBcDdTYVo0cUw3NGFhM2dVakNaelY1emI0VnRpZVpzbEdC?=
 =?utf-8?B?R1BMRWk5WHd6eFpFU0haTk5vMGwvRkx2NGpjblVtVjhUaEJ0M1JjV2QvV053?=
 =?utf-8?B?UzUvUUpKSUU5K21wMzJzSDFoazZlMHdIVVNDYXJPc1RzUjExbEs3c0dDN3I3?=
 =?utf-8?B?TzRtaTV1MnpxQlU5NUF4RFkrWUlMSWh2cUw5OWZhQkdROEFFMHY4R0xZNU9s?=
 =?utf-8?B?K2JHaEVLWHE2U0hNaWFSRm1IaUVtYXQ5OUtkd3o2WjExcFhPcnM1Z1hSdmhG?=
 =?utf-8?B?SnVlWmxsSlhSK1JLeEF0VFJCc05IV04wbTM5eDJyMUNuTUxTUW5mS3RIQnhR?=
 =?utf-8?B?Nk9XbGYzQ21CQXRaVG5sTy9lWFBLM0Mzc0huYlZucmQ5eTk3c3F6V3BNTk9T?=
 =?utf-8?B?MWViaDB1OVlZeXZjTGZ2TkdjMXVFbTlkbkxiVTUxSVEwVStFVnVrMngzMXJI?=
 =?utf-8?B?Y0diUHFXQktXWUd1SUlPVUpLa0lEMnFJeFpVZWEvbU1BU3ZsQkxHa0J2eExH?=
 =?utf-8?B?TWJwN2pZTForc0VWZHc2UkM3UGRDYjUxVGNYcXVaZkhUZGFFY1Erb1UycCtt?=
 =?utf-8?B?Y3J1aXZSbm5uNFNIdU9aeDJ1SEl4R3lzcjcyWUVhcm9zRkEvUnd5MUs1Ykd1?=
 =?utf-8?B?K1JCV3BvZDh0MlhFRWtGRlRyWVdRaUFUeFczWlNBMkc1RWo5L0U3TlBncE9N?=
 =?utf-8?B?cGY2eGNwd0NIdWJOY2ljVHZNbEl3V2FsZ0FaVnVjdnY3YmxQMElKRlIwWXYy?=
 =?utf-8?B?YVVZbU5iZDRPUmpPaTJoZWxOUTNHR2dKZGRRWHVFMHdzajhNZUdxcFJxeHp3?=
 =?utf-8?B?R0FMczRkWjhWT21uNVh6dDNuRVhoZUJPVHdUZ2lnTXBFS2k4ci9hbzVkNVlj?=
 =?utf-8?B?WW1HUGJVT1RGbEY2cXRMUkxIOFJSRWh3cyt1cHNvV0h4NEQ0SEtOTzN5TC9B?=
 =?utf-8?B?Y3I2TnpQc2NQcy9FNkcrbUpaV29jakdRWWdCUEdQSHZnVHcxaEg4L3I5Wllm?=
 =?utf-8?B?cEw5TFg0MjFrb1RiRkt4dHZlMHV4VWhQRWxSRG9ZRzZCUFVSYUQ1b1dEMlB0?=
 =?utf-8?B?MjVqNk1LWmZnZlNLSm5IR1lUQWlrK2lxV3BTWFNHZEpUVkZhemFaN1BBK0Ev?=
 =?utf-8?B?cnFDeW45b0ZzS2UwYWtha3Y1enl5VUpLSW95Sjlzc1hLVWZvZ1ZFZURuV3VT?=
 =?utf-8?B?SE1EOW5wMEJ6OTIvYVY4WXZmRFdra24rL2p2bU5rcXMySUtZQ2cxcU0vM0xk?=
 =?utf-8?B?MXQwQ2cyK1NlREk2bFB3QmZPeTlPUzRIajFqR3d6Q2Z1ai9TSlpEYmtpMkgr?=
 =?utf-8?B?dlhoWDEydEpwSWNrU3Vxc3czNXB1bWQ1THBRWmRmaG12YkRWRGQ5ZjJrVlZ3?=
 =?utf-8?B?aXAvWk4ydERjUlNydVFQUHZacGlleW5nK0RUOWRYZU9jU2ROY1hybDZoaVF0?=
 =?utf-8?B?UjNuS1BTZ0YwU0QwOFByNHVQR0R5dDdaOEs3VVcvdmlYeHU3TlhSczJ3c3NI?=
 =?utf-8?B?U0E3am5Qc0VKYlVYNXU3K0JOWDM5SmJHUC9VcE5FT0VJNkQwL09pQm9yV2Qx?=
 =?utf-8?B?YkQ3VjQxWHlWRFNtaGswd1NuUGJIRktFUEZ5RTNiemRmUVhpNmI2TkxqbGFo?=
 =?utf-8?B?cnhIRkRJL0IzZmFsdFVucVI1WS9nODhqeGhoT0hIeXhmcDRRTHBYN1J0SHZt?=
 =?utf-8?Q?Je6ucMQpknfgbYs9DBrPcC+mL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87eba3b5-6adf-4f59-a437-08dcdbaeb5ec
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 09:04:20.6627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCQzp47tB0Tmnh9tsD9It1mqbrohkn/y9STu82AA37GXpfBon53Y3+SZX1WUQVcsXq72i05rUOVQnSjMVptHpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9197
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

On 09/17/2024, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Tue, 17 Sep 2024 16:40:18 +0200
> 
> A of_node_put(remote) call was immediately used after a null pointer check
> for the data structure member “next_bridge” in this
> function implementation.
> Thus use such a function call only once instead directly before the check.
> 
> This issue was transformed by using the Coccinelle software.
> 
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

The patch subject should be something like

drm/bridge: imx8qxp-pixel-combiner: Call of_node_put(remote) only once in probe function

so that the prefixes may tell the driver the patch touches,
just like some other previous patches did for this driver
shown by 'git log'.

Not sure if it is worth a v2 just for that.
Maybe, a patch committer can fix it before pushing.

With the patch subject fixed:
Reviewed-by: Liu Ying <victor.liu@nxp.com>

> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> index e6dbbdc87ce2..0064d37ad8f6 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> @@ -321,8 +321,8 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>  		}
> 
>  		ch->next_bridge = of_drm_find_bridge(remote);
> +		of_node_put(remote);
>  		if (!ch->next_bridge) {
> -			of_node_put(remote);
>  			ret = -EPROBE_DEFER;
>  			DRM_DEV_DEBUG_DRIVER(dev,
>  					     "channel%u failed to find next bridge: %d\n",
> @@ -330,8 +330,6 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>  			goto free_child;
>  		}
> 
> -		of_node_put(remote);
> -
>  		ch->bridge.driver_private = ch;
>  		ch->bridge.funcs = &imx8qxp_pc_bridge_funcs;
>  		ch->bridge.of_node = child;
> --
> 2.46.0
> 

-- 
Regards,
Liu Ying

