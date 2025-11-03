Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B7CC2CC09
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 16:32:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B266210E427;
	Mon,  3 Nov 2025 15:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="yE3zMocx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013015.outbound.protection.outlook.com [40.107.159.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A93BB10E428
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Nov 2025 15:32:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kBy1E3BQgW2LbRwe1iLVDk6Vz+k91CYYSe74OQnXhYBSTTDtcOy5X7wc0RW/imW3nD9azqTyO4PaQD7Dn5QbOGCV3MDcScYQc0l5vXPcyg0r2aOU3F0fab9pxlzOLRZh5GPP6Ts9yVjhec3hfFIsPsPG1N6fmAPu9+FhRrOh6Z+INwIm7IZcDhOKynpP/vPWBF2PB0Ugqon2bZzhRGyQKqFuakaNmlOkE9AVgRBw8BJm0b0kw8igzJPWACS6/MxoGMvvtAfft75rXaxOCQzo2lcmLmwIRaTMMV1UMYYOlu7tKxd+XeoxyL4zRnESf4yBegOtuRwSe7HiGFoih9/HEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BjzY2aL4+nfh0OLp5zefSQTeTTudRyi5ib1aUqHzLw=;
 b=DT8PavINy+/u9OubNWanajOmI8ClP1WCTTSYypWSbtwhytE5keoeK6XuK3d7zgXO0ZnZi3/GBS+OXbpmEG8fp0OBiX1b6jl7ZIqstUaNDrH1qFz0SrsX/yDCz9ifagGMcVdRSfsz1/gqA4ibmEaHfbI19olc3ntyyGI7Asnqf8g4MNCWQktArS8/Hkaus0zXLVXett9ewfF7QpzD0P/kl4ZKjn0TKlvWZdgH2TsqQ2Vj3Yr5eCsYUiFJSkKdamiY+WrmjNQ7x5fuw2pU9Jp6RITgdK3z/FhXv7MLdfc3Yq/ZHeRsIkXoPB9XnncQ2ZcvUse2rLRRf8Mzyg0eyh2+tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BjzY2aL4+nfh0OLp5zefSQTeTTudRyi5ib1aUqHzLw=;
 b=yE3zMocx4Vh/SSmVMowtpRf7T752axn0a9/1s8+vluoeRR3nDZgmxV2zY+EU+gLQGYZXrSu3iLoNDICC8YCEdhY4/r9GlxgbzoMDSBpIAh80UewLVjsveb/9Ck5ngQ9+ZNJAe9xlIAapiXvmaDRa3zjnggPcvt11SrglaeXIT15pZEOF+YaAwPr8lgpBj4NOVOtXKefgjWFPOAR9OMdvb5RvXxgAxb5V3O7DOUoe2IqDLu9x+/V2CaRBF4Qw4lgCs1aUjUfS/e5YSq8Xy8aKSuRzK0ZWy4MHPMy8LX2I7D8RC3I+AmMMXXNgQx4rhDACgs1MPNTq3L6p8ti3TnixWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com (2603:10a6:150:26::19)
 by DU4PR04MB10500.eurprd04.prod.outlook.com (2603:10a6:10:55e::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 15:32:34 +0000
Received: from GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442]) by GV1PR04MB9135.eurprd04.prod.outlook.com
 ([fe80::b1f6:475e:de5d:8442%7]) with mapi id 15.20.9275.015; Mon, 3 Nov 2025
 15:32:34 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Frank Li <Frank.Li@nxp.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/9] drm/bridge: fsl-ldb: Add support for i.MX94
Date: Mon,  3 Nov 2025 15:30:47 +0000
Message-ID: <20251103-dcif-upstreaming-v6-3-76fcecfda919@oss.nxp.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
References: <20251103-dcif-upstreaming-v6-0-76fcecfda919@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P190CA0043.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d1::14) To GV1PR04MB9135.eurprd04.prod.outlook.com
 (2603:10a6:150:26::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9135:EE_|DU4PR04MB10500:EE_
X-MS-Office365-Filtering-Correlation-Id: 56b5ae76-9483-4103-f61a-08de1aee35f5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|7416014|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WDBSSE9KMGU5VEJJZzE0ekVmR1QxUkhCYzVISlEzUTJnTGtzSlk3OThubU92?=
 =?utf-8?B?Y0dCNlZ2YmZJZEx0YlUwdGtwMitRdXhXWGRoMW1ZbmM3WkdBdEJLWWFjdldF?=
 =?utf-8?B?NHlSeFN2VkFEVVhtcEFZSDhXWmFNQ1lwZ3I5NmdaWm9DZDF1UzQ1bklYRTA2?=
 =?utf-8?B?Y2JrTENmLzdiL3B0N0JZcmdWTFVYZ294MWpScC9aMEhybzFpaU9FYnFFYTlJ?=
 =?utf-8?B?bHdKTEZsTjJTc1ZXMkUzVHdObDRLdEpYcDUwQXFXY1VHYStoUFFYOFZXVkdG?=
 =?utf-8?B?c0FYNnVUZjRSR3ZTUnM3R2hmaXhKQUlVTy94clpsOUVNTVJpWEV6b1Bld2Mx?=
 =?utf-8?B?Z0pyWEtKQVZkWHdzWm1SME8wOG4xUXBYQ0Fya2RUVFNYb1lWc2hUQitSd25m?=
 =?utf-8?B?VEpzc0IydzVuNWxORjdocXQvMWJyWVExSDQ2SXg0S0xGY2xUM3B3VWZjSFNX?=
 =?utf-8?B?MUFJQzRpT2drZzlWVlJQL2ZsbDg0MDF3QnhGWE12VUJnRkZNdWcrdncxTSsw?=
 =?utf-8?B?SjZJdHJ4K1k4STZ3QXlFT3FNMXVuSDJib3hSTkkweWZub3U1L0hXaEorQjhw?=
 =?utf-8?B?d2pKVmRoaCsvclVYbkdHZWdUV2RoNFcyYnZ6NDN3Mkdub3BDSWVKa1BsVVFz?=
 =?utf-8?B?bzE3b1dwbDZSZVl3V2tTWWE3ajBLcE5PYzQ4WURkM1VCMURCTTZqcmpDL1Qw?=
 =?utf-8?B?NzgvSmNnWE8rSHRYcFVENjQrVE5ReWJnRFBNcC8zZm1IVi9oeGRJK1hTZy8r?=
 =?utf-8?B?UDVCaWg3VFhUUnRZUWZ0TW9XM3AxWmVpNXhPZEQ4NDBDbnJOMEJpQjROOTJa?=
 =?utf-8?B?NEdMRWQreU4yeHVnTitCTisxaVdKTlp2MXlLN2kzY3o3SFN4TmI4Wlo1cW5S?=
 =?utf-8?B?QmVVclJvaElldmJUc2ZkUGQ4V1ZOQ3oxU0xmb1EwU2NSaHRES2N5a1RDV0Zi?=
 =?utf-8?B?T1BwUTZxVXFRTjg3UEpNazJXUHBhVkN3cHJXZ3NncjI1K3NVcEY0aGt6MUMw?=
 =?utf-8?B?U2M1ZlZhcDVqZnNZOXpkU1RGZkQ4SFBEbWYzSnhUTHNOM2RmRHI3RzdhUFlW?=
 =?utf-8?B?Zk5obEZHcHI1UnppMVJmR1V5WDRWZFBWaE5ZNkRxRlVEU2pocGxiVTlrSUdI?=
 =?utf-8?B?d2Q5b3QzSVkxRVVGY2N2eVVZV00vNHdCQnREWCt0UjhST1pKQUhteDd5TG94?=
 =?utf-8?B?NTRUelp5NFdVSkNnVFRDTTFWdExyQ05ZTVZudCtrU0ErN0taVEJvaVViWkVQ?=
 =?utf-8?B?MVFnYkxIZCtpUElyWEJqdHZ2YXhEdUJrK21YLzJhOGZFVkxBU3NQUW5Zczlu?=
 =?utf-8?B?ZXcrZ0x5aUxldVBkRW9ZMkN1eThqamxrQ0ZnQnNkTXY0YTJqaE9BcXlNQ2o4?=
 =?utf-8?B?TFg3TlZ4NURWMWM1QUt2YzFiK2JGK2E0ZDVVeFFzbUhzY3VPaExzdkZrdkFG?=
 =?utf-8?B?R29DbkdDL0srbnFBM3VIQnB5OFhnYzIrVnUxL2dlRkswKzIxZmlFL2hkYjNn?=
 =?utf-8?B?eWtXWHZuOGtwcHBSVE45dVkrUUJFcmxqMHFVdnoyYVB0SHlRQkU4aXhiaEhE?=
 =?utf-8?B?VFA4SSt1VjR5WmFMVUt3UDdIZU1SZnM4V2hBRS9sNld6VmI2NnVaUEZsZnJp?=
 =?utf-8?B?Y2E4bDBvRy8wdDRsWW53WWFWMmthanVRVjR5Q1ZVRG9tM2NJK29ycU56ekRu?=
 =?utf-8?B?dkFRNk1lT2dqVWRDK3ZaVkRaK0szMGZNYk9pc3pWaEtWdWJ4c283OGgrN3lk?=
 =?utf-8?B?MkhDR2FxNDNmRXE3SDlKTUJVaXFCUWJnUEttaDVsK2wwTko1RlFLVkhiQVhX?=
 =?utf-8?B?NWRFM2R0b0pxK1lGWnpHZUJJMzRqWmVEY0J2b1hHMDlyWHRxZGVzdjNRcXZs?=
 =?utf-8?B?bEJDS0VmRGE1M1pLamxFRHRyRXkwWkgzYWxKRGhMa08wcUQ3Z3FUMTVXQ051?=
 =?utf-8?B?RU1JazhrZUpndGxvTW1NMjdaVDd3NTFiWlRhTmM4WTNlUzk0MjU4Q2F5blVr?=
 =?utf-8?Q?+p0ri2PDD5bm9lXZIJMh/w+WbW1+Ro=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:GV1PR04MB9135.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(7416014)(376014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R05KZDBienU5VVBjcXdQcUxCM3AxbWlUT25DNUlEaVAvWmdhKzhtVGI4bzRB?=
 =?utf-8?B?Vk9jY01la3JEakRFdlhxdk1WdG1EYmpCYXNPckF4b2ZOYlpLLy9wMmcyK3hM?=
 =?utf-8?B?TUFVKzFZVEpQa0EwWCsrUGNoeEtSOU9ld2J2UXFZT1FyTDhmeVZtU3dmb2My?=
 =?utf-8?B?TGZ3RzdYdndQcXFOQlp3eG1zUXQ4bkY4QWxxKzVqSFlzSW1sV1BhNGlZalhk?=
 =?utf-8?B?VEc0dnM2OXUwamJyL0gwblNEWEoySGhYR2hJVzRUTit2TlA3b05SUGx3aTdI?=
 =?utf-8?B?czB4WC9nQ0cyeU5CSjRDSXAwUWhIbjE1cnR4RTEvUHFZRURxMzRXSkFCanFj?=
 =?utf-8?B?WnFyU3RJYmJpQnpmYzZ2bHBRNTk3VmxTUE5rQzhjTW5iM1RhTTJRMlRGN3g4?=
 =?utf-8?B?ZFFhNjk3dys1S1pZSlNBUHFpMXVNcitBdEdpVFcyMHhjTmt0SWVvbEdkdXJ4?=
 =?utf-8?B?TTNubEhuczZXMHVtcTR5WTlyOHFwcFhkL3Y5SmMrRmtmTGF2MXJWaGdXSWs3?=
 =?utf-8?B?YThNV1QzNmhpNDdmOEJacTNHMEdwakp5a3JSTS9aajZMcFdoNWo5RVVLdEZJ?=
 =?utf-8?B?T0lNSTJpYlRiNXB3TXl5TE9USGE0MWM1Rnp2RTRoNXVjeGFyNlJTTkRKOHlO?=
 =?utf-8?B?ZmZmWkVweGtBakd3QUtNRGp1V2ZHZGorRjVsUGM2alRLaVg3eWNObnZ5bEVs?=
 =?utf-8?B?U3ZIZVVEcHRZM01nSFphV2JGTC9YYTZWa0JER2htbEQrcEhabzJKZlAyVnUz?=
 =?utf-8?B?YlVPV1lRNVpuVXFZam15YTRuOU5aYkE2aWFHbkR6WW9naXZHZ2NhbjE4b2sz?=
 =?utf-8?B?STVyRm1zWHFSNElIWXowS1pFQzFpUGhBUnpSS3NWbEorQXRJd2Jya0xUZzdz?=
 =?utf-8?B?ZlJXTnNRWGM5ZlRwUGdhT1ZaZnZTZG5YLzVYM2FnOEE0bkd3RXpNN1FPczk4?=
 =?utf-8?B?clVkR1RZNnhaN0kxTWRISloxSC9rc2UxWVBZclhKMUhzUEJyY2ZNczdyTXRz?=
 =?utf-8?B?cS8vMG5iclJTTTI3TTNmaFd4NWpKc2FKMjVKa2taRisrSldiVzVpTWNjQmEx?=
 =?utf-8?B?RWRkUDVycWdIY29idXEra1IrcFRiVWVselZXTTJkQkp4SHNHWHNYa3p0U1pH?=
 =?utf-8?B?SS9DVTR3N1lYTkdmUjZKSVN0eG5POWc3d2ZzZm96TDdIRldtV1pqTERxQkhM?=
 =?utf-8?B?aUhPVEJqemdjTmlWZ0lPOVk3c1hBTzg0ZGVKc2k5emdwdnF0RDNxaklFTDFI?=
 =?utf-8?B?cFc1M2RNenM4S2ozbEpNTkU5eFNsZlNiZC80ZDBlTStybWFvdTNHMS85ekJx?=
 =?utf-8?B?SUo1dXh6VFoxdW9xcWVKU2dpRUlMTWgvOEpsZjNtVnlsOEpoWE1qTnZsNE9s?=
 =?utf-8?B?R1V5dUtPQ3QvVlBpOE1mR2VvTEpBcGE3dTFMRUhCSEtuTXhob3pqMlA4WGRC?=
 =?utf-8?B?Unh5UDV5dFRqcjdPUWJsRUJMMTdlMGNneUtkTG1kWmpUUWRZNG56RFprZEtw?=
 =?utf-8?B?WEpYT2QvUVpsZkVhbU5RT1NudnQwMGpLOHd4d0hUQ0cwWU1mdmRNVGxyWFl1?=
 =?utf-8?B?eHg1NmMzSEJuY3dQbkNSRjB1b0hBYkJLZmxYTDRnb3JJQXdKVjJtRHNGMEhY?=
 =?utf-8?B?SmJPSnB2MTRrcGVERzM1Wm5JbWJlbEljR05haXdST0FoclNzZVV5RlFHeVJl?=
 =?utf-8?B?M3dLS0JZU1VxQ2ZwUjBiSi9iZGhMdk9uVzUrL2hETXN0NmtaRVpwNWw1Z2Qy?=
 =?utf-8?B?WW1XazR3VmRMQk5ueTNxRHVxSUQ3R2kwQ0E3K1Mvb2F6OFZpTzZzZkhkd2I4?=
 =?utf-8?B?b0FZOFhtbHQxSUZ5eVFNMVlCOXFYK3N2S2NHcDlSVjAyRWJLREhscmtIMkgy?=
 =?utf-8?B?bnMxbElyQmRHT05IcDRESFNKOXJmNk9rY0NQME9qcngvR2VXSXhVQVBNWDR6?=
 =?utf-8?B?cXo0M3RWTTRQUXV5dXZFRExad3plV3k1MWx3RHQ0WXFlREQwdUVwOFc4Smpm?=
 =?utf-8?B?SXYwVnhHb3ljOWpFR3MyNXFmVG9ScGZpL1RsZElhOWNEQ0NTbnpnTy9rc0Zs?=
 =?utf-8?B?WndQemtvUTcweEJ2S2RoVnJrUjc2ZmV1YWZJaGRsVEd2UkVpYWVEekRoKysr?=
 =?utf-8?B?QzJSbjJzajliVG51Smwra3JyeW5hakhpL2FOVmIzWDB5N3R4Z0dSYmpaTS9o?=
 =?utf-8?B?N1E9PQ==?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56b5ae76-9483-4103-f61a-08de1aee35f5
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9135.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 15:32:34.5936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ui1dxBK0VSVhS9XfSCpDxAitjni4NEXlhl6qdXN4MUd4hNEfdzkKECu2sSjL0QOYnGi9Kb2Mdy24FVTsOQAIkw==
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

i.MX94 series LDB controller shares the same LDB and LVDS control
registers as i.MX8MP and i.MX93 but supports a higher maximum clock
frequency.

Add a 'max_clk_khz' member to the fsl_ldb_devdata structure in order to
be able to set different max frequencies for other platforms.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/gpu/drm/bridge/fsl-ldb.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
index 665053d0cb79d2b4f50e69c397863ab024553867..96065a83898666fd789cde5fa1008ac2c841b815 100644
--- a/drivers/gpu/drm/bridge/fsl-ldb.c
+++ b/drivers/gpu/drm/bridge/fsl-ldb.c
@@ -57,6 +57,7 @@ enum fsl_ldb_devtype {
 	IMX6SX_LDB,
 	IMX8MP_LDB,
 	IMX93_LDB,
+	IMX94_LDB,
 };
 
 struct fsl_ldb_devdata {
@@ -64,21 +65,31 @@ struct fsl_ldb_devdata {
 	u32 lvds_ctrl;
 	bool lvds_en_bit;
 	bool single_ctrl_reg;
+	u32 max_clk_khz;
 };
 
 static const struct fsl_ldb_devdata fsl_ldb_devdata[] = {
 	[IMX6SX_LDB] = {
 		.ldb_ctrl = 0x18,
 		.single_ctrl_reg = true,
+		.max_clk_khz = 80000,
 	},
 	[IMX8MP_LDB] = {
 		.ldb_ctrl = 0x5c,
 		.lvds_ctrl = 0x128,
+		.max_clk_khz = 80000,
 	},
 	[IMX93_LDB] = {
 		.ldb_ctrl = 0x20,
 		.lvds_ctrl = 0x24,
 		.lvds_en_bit = true,
+		.max_clk_khz = 80000,
+	},
+	[IMX94_LDB] = {
+		.ldb_ctrl = 0x04,
+		.lvds_ctrl = 0x08,
+		.lvds_en_bit = true,
+		.max_clk_khz = 165000,
 	},
 };
 
@@ -271,7 +282,7 @@ fsl_ldb_mode_valid(struct drm_bridge *bridge,
 {
 	struct fsl_ldb *fsl_ldb = to_fsl_ldb(bridge);
 
-	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 160000 : 80000))
+	if (mode->clock > (fsl_ldb_is_dual(fsl_ldb) ? 2 : 1) * fsl_ldb->devdata->max_clk_khz)
 		return MODE_CLOCK_HIGH;
 
 	return MODE_OK;
@@ -377,6 +388,8 @@ static const struct of_device_id fsl_ldb_match[] = {
 	  .data = &fsl_ldb_devdata[IMX8MP_LDB], },
 	{ .compatible = "fsl,imx93-ldb",
 	  .data = &fsl_ldb_devdata[IMX93_LDB], },
+	{ .compatible = "fsl,imx94-ldb",
+	  .data = &fsl_ldb_devdata[IMX94_LDB], },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, fsl_ldb_match);

-- 
2.49.0
