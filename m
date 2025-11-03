Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EB6C2CC1E
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:32:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5FC810E42B;
	Mon,  3 Nov 2025 15:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="JxGOjv1I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazon11010022.outbound.protection.outlook.com [52.101.84.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A8110E42B
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:32:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hGuXyHjJ7MYvs7zB7f9mylVPLXm2TG+LVwRz8c/mBZVAneRV3Wlc6PnuKQU9SKM5MOMCK2qMDEi6ArqSB0347dA7gY+KJlDLUDx0kpYxZ64RwnyeKIg/afey1yc1BK3nRCutAKmepVAlHg1g/pSiCVuMpmCjaE+TF4AGWPVQsJ97/TrUjkWHg5zyplLzZmg+ukqP1WRz3rkekLp6ylY0Y4ApOUK/7esbIsZR1mi7X4WaZgLf8pDHiNolg0OLZB1vrW52O/CVxy2FiatUiRvMchvV8ZvzlY4up4Xhxiy80Q4MpPtJyu34X5qn+cVSgvHD80F+t8fxyzPri2xvfUvJtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1t1MPpU4c0NThNtsOWMYS2juC+Nx+a+3da+ILeo3Sqw=;
 b=ZIEbC7g8lOSHh5MyQ2MZmQJO876Qp/vUECAcxOaWqQpUx4dZQnQAgQ4fIc5lqH9CQhzx778wEzM5Joma35xHcQOU6ivXLgW7IH4rYinACwpFSBwnuEnm2Y8dHPFmzQybpprW4PHChBptD8nOi/w1YPWpJ2STSVrGjtUjvzZDE4+yaHv60n18n+cz4HQrpWCSpU5gVQUtskK7qq8h1GM2bJFAiIGLqQNaGh543GPQnZjKyOtsryRQIq/Jlw6Z9J8bKYtVFarv9W8b+U/SScFpdxHlEAhGDfVUBnY2B1eGiuzZqs4q5n1pPERq3H7I0vyY1ySV88uRv9jZlM10N2hlmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1t1MPpU4c0NThNtsOWMYS2juC+Nx+a+3da+ILeo3Sqw=;
 b=JxGOjv1ITAbL29lAjw27/Ui7ubt8kDdBUv+97NE3DaNlHT+WPvTROPpfdIAIzKEGD72nbYq06g/W/xdTAxTco7CZxAB1T66JFLw/h+eq3zG8g/hnMWfYE1lHrtVV63Moao2guNpSWMe6b8uNoEAzQL9EpiNjx1KrXlxDnONEGCoBD4V2qO2gHUZNq9jOBN2Cwqk2q9dFhA0BgdL9+lVugPP+774cW0JjNVvrwFElKy1kp5EcOGrEacgnEdyqzJNZftTp3nPooQLC+e3gtzcqbtulk5XecUKLgUHrWNyZmAvDrxWdCST3ICfWzmagv45Ae5RA0PyaSM3OoHcRJffQ+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DU4PR04MB10500.eurprd04.prod.outlook.com (2603:10a6:10:55e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:32:52 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%7]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 15:32:52 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 8/9] arm64: dts: imx943-evk: Add display support using
 IT6263
Date: Mon,  3 Nov 2025 15:30:52 +0000
Message-ID: <20251103-dcif-upstreaming-v6-8-76fcecfda919@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
References: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0038.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::21) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DU4PR04MB10500:EE_
X-MS-Office365-Filtering-Correlation-Id: a609a813-238c-4554-881d-08de1aee4093
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cnFMbVRrdVNxVEttV1B5UjFnR3ovN1lJSHpTS2NSN1Yyc3NDQkdiYVliUEZE?=
 =?utf-8?B?bE9zZ3pkbFk1d0xHb0xZSjRxL1VTdGdleWpJQlZ2bWNZMVVYTXJZQVZ0WWpG?=
 =?utf-8?B?TmpBSm80M01zT08zOEo1bVZacmFlUDN4NnljVStya2VobFcySFR0cFVUT3FB?=
 =?utf-8?B?RXB4dXNDT0E4QjB1b2I5Y1dhaGxEVk5HOTZaajB6YUtDcmxMYnFjek5hSGlT?=
 =?utf-8?B?TTFyQWFRdThhUnpJOFVXUlVJN1FSZ0Q3ckp5OTlzbUZ0RlR3dTdpc1FxaEEv?=
 =?utf-8?B?c3VrWHhYeC96TFpQdC9RVDNMa0hCWnMreklvZFVBNTcwMnhOTzJkWTRIK1Zz?=
 =?utf-8?B?UzNEeDJyQnUwbU55R2MySW9wTy9XeEVmR2JlNEJmNkdhT0dUbmx4ZHlreXVO?=
 =?utf-8?B?SEFqd3lObmxYNGU5Z1pOOXk3UGIxR01jYXFUKzMwcHJxL1FTLys4cytKM0pW?=
 =?utf-8?B?ZjcrK2VUNDY3eUYrSVpDcXlmNXVaeFVvSmcwd1I1VEhBbkpoU3hHQnlSYm04?=
 =?utf-8?B?dVdqdEYwRlhkSHlWc2ZoMXJBWVRwZFRRNWNITGlFV3hxM0NzWEdEZHNPNUh2?=
 =?utf-8?B?bnRzVDRzU0N3cTFwN003bWgyUjNXRy8xS0FjVElGTFZxOWVOU2RGSzRBU2RH?=
 =?utf-8?B?Ly9MQnM5alRhZGlXeUtJSXMzdmlLY21yYXZ2TDFGUnJ5S0NGb1Z6aE1yREZW?=
 =?utf-8?B?ck5qK1p0NHdFemU2c3IvdXZJNDA4UDN0OEY0YzFONFljeGtSd1l5TzRTdmdr?=
 =?utf-8?B?QXk0Qm9GT2FTUUYxSkxrbmNheW9YSnQ1aXlybWJwNVpUMkdUS0c4blhwMXpY?=
 =?utf-8?B?eDM4ZEJPUU5QZENKMjNTQ0lBYkM0M0NXOHBHM1NlU0dmOURoS0JUWHNFbGZp?=
 =?utf-8?B?dmJYMmZBN1Btc242MUQzM0ZvaHhielhUM3kweXJucjZYWGZKKzFubzZwZ1BO?=
 =?utf-8?B?TlhRRE9CMXJBL1o4bTRFc24vK01lbUxtT3dGZWNaVTZ4amxBY0d1TStSQkdi?=
 =?utf-8?B?blMvWHFiVGR2YW15dHJjUWJOdTI4T28va3IwbEpQWWVtaG1Mb2x6c3NRczRy?=
 =?utf-8?B?L1hEdnl5eHBXQVl4eDVGakFGS09aZ0I2VTBGSTYwRnVwSHp3UTA1ZzdGdjly?=
 =?utf-8?B?emZ1ZG5WLzZ5bEE0RHU2dmx6VnpLL0NpczE2QmVhVUR2U2FtWEtQc2hqT29i?=
 =?utf-8?B?dFI5TC9xd3hxWTYvOEFVVjkwN3o3RWxQZ0l3bTUzK0dZaG9sZ1Q4N3ZZVWZ3?=
 =?utf-8?B?ajZuMXpUeGl1bm4yRFpBWjdVcFFqYml2S0Y3bGJ3TWhlSXE1RW5tOXFScy9j?=
 =?utf-8?B?MXh1dDVFMksvaWlVL0pSanRWVFFYZHIzQzdtN1FGdFRZOW0zbldGWTV0Y0dN?=
 =?utf-8?B?ZzBEdzZYSXErVy95Ung4bGNVdHI5R2hSU0lqQ3pCYjNZL1Nua1d2TENld3FU?=
 =?utf-8?B?emJuc2llZ0kyOHFwSTBWSkZZOTA3d1RaeFdNZldyU3llNjZWRWUvZ0lOTU55?=
 =?utf-8?B?aEhNSkRrYlJhMDRoTG15ZjgyZXRxWE16UWdlNnh0NHByek5tWkZBQjBZV2g0?=
 =?utf-8?B?bjMvYTVpL3Naajl2Lys1RnVsMFRHL25Bd0hjQTI5ZThYSmJQTjVQUDFpY2h0?=
 =?utf-8?B?MElmR3NIc3h5dE53aFpVTjlaYjA5TlVjdlppTUwzcDVsVHRHcmlEK2RIVEdM?=
 =?utf-8?B?RENYS3ZPNmhNbWYwaEUxbEtydVV5TTVWSUwxQ0xGd0dBSC9MbVc2clkrTkFh?=
 =?utf-8?B?TGNrKzZNSklaODJER1dQWGo2MWRtd3JEeXpoNXlOUmU1VTh1UVkydk9HV1Zq?=
 =?utf-8?B?ekVGWjh0dk5DTk1yVUpMUkVxMEsyaXJGT0N0dmN3NVpodUJ1NElxMVk0bktR?=
 =?utf-8?B?TUVMNXlKaU9BdmV1Uld0eTVtZzY2UWswOEZ2VzJNRDZlK0VWMVZuVFJ2U2Nk?=
 =?utf-8?Q?nNgXeE9adpM4hq+9yjyqJXYVArH6U3gZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFM0M1M3MkthRHhOOUE5S0FpMGhqMDhIYVZmRzlBeEdYcWJHeGplQTVzait4?=
 =?utf-8?B?ZkRUS2ExNzk5aXpPNklEMzFvcDhXMFVPaG5wNUREZzc5QjJtT3VDSkxIRSta?=
 =?utf-8?B?U0NaODRPTDE1cjdQbk5YaGg1RU9vemtNS3YvRlVJK3Y1SFhrTVZSV3ZwVFJW?=
 =?utf-8?B?ZUVOQ1dnZkYrVXVvNlV0b1FQUWdaanFWcDE1eW9NVy9FZzFDbHdVWHBtcnlS?=
 =?utf-8?B?TUZWemt3ajhKRjlsTGZRdEZPbUlGZmZ0UDJSVjd6dGFNeFRqVzZabVk0ZUJx?=
 =?utf-8?B?bXh1STZLRmNaeVdPNUpLRnk1TTFscTFTbFhDSDRRSDZ1TmNJalVhWmdkZnQ0?=
 =?utf-8?B?RHZjWmY2OGVWcXBoK0M3cWpOendGRzdVd2txN1FBbzI1K3pjRy9tYnBURWN0?=
 =?utf-8?B?YlN3Mkdad1dkNFNNYWVPdEhQdmtIaXN5UzZJclF5cjVIZHFGRDk3YUNRSFpq?=
 =?utf-8?B?Zk83ME9YK1ZHT0k0azdTSGZOVU1scU5tSmpkTUtTeUorakl3czNxZThhYTBE?=
 =?utf-8?B?L0x6SGQ3QU9wV0ZYZUhTc3BBOUhqUDNEdzRvMm9PY1NHcG52eDNjQ1U5ekxv?=
 =?utf-8?B?NUJpWVZUczc2L1k1T0JSaHdaYlhHWWJtdlJ2eWtZZ3lrTnAwOXBnUmtaajN6?=
 =?utf-8?B?dk53aFZMWGQvR3ZqTlhFb1F1R0MvSXIvMEtDTUFvMTNOMThaMHJqcmNqRm1S?=
 =?utf-8?B?aUZWRVVZdzNVd2pObDRobm42VEhvQjByaC9TRUpBOXJIam92eGRiT1BLSmtT?=
 =?utf-8?B?N240bmgvYmNVdXJteU9qY0tRNFpYRU11SkMySnYxT00wOXdvOEZyekppUk5S?=
 =?utf-8?B?VmErUjVyeHVqWElLL3BrNUZvUGgxQWdlYWdUQW96Y1liR1lFOXk0MXRpUFpJ?=
 =?utf-8?B?RkFVY2NGWHZ3aUxYUUY0VjZCS3Y4eUd6c050M0hWd2hENXpJUWNCNGh4dk1L?=
 =?utf-8?B?M05EUU9zMmRpK0hPUnpXT1VEZG95Z0JyL2xHUjFQY1RpS3lUZS9Ca0F5c1hH?=
 =?utf-8?B?WUYyT1Ric1ZDZDVCN2t5V1NrWk83dVpFZG82UHJ2VFVWQXZmOVlyRnl5b053?=
 =?utf-8?B?djJhcHB6bmdpM2VKZ0ZTWFQrK0JGYlpBekdYend4YTdjOFAwQjhmd2Q3Y0Jl?=
 =?utf-8?B?SlNsWm9WdVZRK2d4aWMxQUF0M0NTN1BOalptM2k0Vnl6cEVGRVRaQWhRYnNn?=
 =?utf-8?B?bGI5c3BWNnptVmQ5cDRrSURtc3NqdWswTUFjUUFETjg3b05OcDVtNWJRbE9U?=
 =?utf-8?B?ai9LQzFUNzRaTVZ4ODVCRCtyMFI5clJpZU5TNGI4SVhjYTQwczNvK2dJZ2pk?=
 =?utf-8?B?cDRpWko1UDlNeCt6eFF4dmtGeDM4UDczVjI5ckZ0WS9taTJmOHg0MjdqekVo?=
 =?utf-8?B?WTRlRWFCVmlXQTlVZDJyek5vTWVkOVNSTlM0QUhrVmZtZVZwaWFuZERoU2Zz?=
 =?utf-8?B?TjFNK0FpU084YWlkWFBQTTdYWTl1WXRtQmllWFZOa24vR1U1S0lWUlhSVFJC?=
 =?utf-8?B?ZEYzSk5CWEFrdHBXdllHVWRKaEI1K3V5TEpxb2pPWE9DL01lQTFzaE9Qa2hO?=
 =?utf-8?B?TXJUWEMzSDdrQk5PdGl4N3dydFd2MThZWjhmaFUzbE1ramZpUGpUalM3aEVI?=
 =?utf-8?B?QjZhUURWUk0yVC96T2ZNcmorTW1yU0NJQU9nV0tybVhlM2c4d3VKVVVzcUJX?=
 =?utf-8?B?M1kxOTYvaWpMRjVOSno5OEdEM3VEeU9CUGF1NC8zMjRJYTNyL3ZZUGtyb0Mz?=
 =?utf-8?B?UnZMSEE0YlBVblp4YjZhenZyQ3owYVlMWTd0bVliMFBWRWRZRHgzWk1PS1hN?=
 =?utf-8?B?Vnl4Vmk2RXczakxlWEhkWjBydW1ma2VKWlpIaTEvNDQzTG02cFQ1TDl6Q1pC?=
 =?utf-8?B?QUxBK09NVm1lTGFUekFUZ3krTHU0eHdiR3hNNVFEbmpYUXZyMDNKeVM2SzJk?=
 =?utf-8?B?RzlEZ1ZoaDdlVCt6MmxtRUJGN0NFU1VCRkZ6UFpSWG9qcm9NYmNPUkNPbVZr?=
 =?utf-8?B?cDFsYS92NElTbGp2YkJha2t6c1hQRTA0VS9XMHJ3RDBuaTNtdWgxb0thTG5n?=
 =?utf-8?B?d2lNUWNkb012NVd2ODJ6V2NDUE4xMWo0dHd6aWQyT3ZLZHFPOGdla2o5NUZo?=
 =?utf-8?B?OFZmT3VvSFdHU2c0cGFRNnFQQkFUa0xuRlZCV1h3L2lJcGJFNndBZ3ZGekZ0?=
 =?utf-8?B?eFE9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a609a813-238c-4554-881d-08de1aee4093
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:32:52.4261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jSe3VjYDrIDa4bHm5kMZ7GXB57L8E+/C55Es9kvR5E4qwYF0dRJkBVy1483tBG0xBdT3wAx919GT6pKaQ6SKUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10500
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

The ITE IT6263 based NXP LVDS to HDMI converter can be attached to the
i.MX943 EVK board LVDS port using the mini-SAS connector. Since this is
the default configuration for the EVK, add support for it here.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx943-evk.dts | 121 +++++++++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
index c8c3eff9df1a23c52e74bf2bc5d4ba543bb5a65b..5900ff355abc2afcb8334d9502c9ee6739ce36e3 100644
--- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
@@ -34,6 +34,18 @@ dmic: dmic {
 		#sound-dai-cells = <0>;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&it6263_out>;
+			};
+		};
+	};
+
 	reg_usdhc2_vmmc: regulator-usdhc2 {
 		compatible = "regulator-fixed";
 		off-on-delay-us = <12000>;
@@ -127,6 +139,115 @@ memory@80000000 {
 	};
 };
 
+&dcif {
+	status = "okay";
+};
+
+&ldb {
+	assigned-clocks = <&scmi_clk IMX94_CLK_LDBPLL_VCO>,
+			  <&scmi_clk IMX94_CLK_LDBPLL>;
+	assigned-clock-rates = <4158000000>, <1039500000>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds_out: endpoint {
+				remote-endpoint = <&it6263_in>;
+			};
+		};
+	};
+};
+
+&lpi2c3 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&pinctrl_lpi2c3>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	pca9548_i2c3: i2c-mux@77 {
+		compatible = "nxp,pca9548";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@2 {
+			reg = <2>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			lvds-to-hdmi-bridge@4c {
+				compatible = "ite,it6263";
+				reg = <0x4c>;
+				data-mapping = "jeida-24";
+				reset-gpios = <&pcal6416_i2c3_u171 8 GPIO_ACTIVE_HIGH>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						it6263_in: endpoint {
+							remote-endpoint = <&lvds_out>;
+						};
+					};
+
+					port@2 {
+						reg = <2>;
+
+						it6263_out: endpoint {
+							remote-endpoint = <&hdmi_connector_in>;
+						};
+					};
+				};
+			};
+		};
+
+		i2c@4 {
+			reg = <4>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@5 {
+			reg = <5>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@6 {
+			reg = <6>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
+		i2c@7 {
+			reg = <7>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+	};
+};
+
 &lpi2c3 {
 	clock-frequency = <400000>;
 	pinctrl-0 = <&pinctrl_lpi2c3>;

-- 
2.49.0
