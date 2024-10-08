Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DC19959A3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 00:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E184010E268;
	Tue,  8 Oct 2024 22:01:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="cM83+OPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010062.outbound.protection.outlook.com [52.101.69.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D71F10E18B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 22:01:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CkJC3gTZ7/4niRJC7CVA2B+o5PkM8KVqamxsR/I2sSjOpADaNLUp05K+6aAnlhtRpnbs+a+ZRbXn4vphq5MXD14ibKxdl4KbQ9JHV9xAHn/JU08aL4qzekdcizzGiwi5C+Zr5fTlSHJPJFjbNdeQvM40buxF39dzVLzqgPZ7gwFjY02tWbXuwsLBoYvIQPE5hrDoE3VIpFlTOJgJqWTIM9betuT2F82TcYqd9ezqiXGkrk8LQzgIu3idWO7x0c/B2z+kTT8VJQZxEkzvIYqHQKT0HQlQfBW4KTppYzND3adzToth51IRzfy1nhVM0Ww+kbsmHW4zntcZqvmCE5K4Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0mLjUpnTHourQOW35EfylFe0DI2J4B/Use5EXhyWfHo=;
 b=v4/ggjorgtMU/9Wue2axUwBfMMyQMA/RYcFGOkL3W/ocGYe2Os5AjwtljT5VdfHA/bbNs8ZhkzZg+WXed6vlOzw+rw26DqmI/g7qs/nDznV5O6M2QSm/P9mebHGLBzoPoU1RcN4otK81RqQEA0rJ2PlftpwANvLW5zsw5qGzdVYhwmpCRVTkzx8scHlCFQR3ExOFkrNeviAZYHCiU+bB5vQiP21wTk8lqMgW/7b6jBl/gFo8OjImCeKX0ufH4g8Qs1HtsqWJi4ck3/0RvB8+UyGbFZJWhgb3vInm9dk1SsMrbuMw+MaR4ZYLYbEIpuIM9uCu6YpSLz/aQ8B57GvKZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0mLjUpnTHourQOW35EfylFe0DI2J4B/Use5EXhyWfHo=;
 b=cM83+OPGJpkIkmIIc7VP+t9324EZpbiuiL6HPvbi+R86vMh5cAobdakTz/xkI44euyxTXHYA4XlzMYVffNuQjccZeOnEyhR4Wel343PqNZT/biYD30qYSSTnVso9EXsNPX8F5TA6g34ovhu0WuQNUwHTBQaN+XSx8NiH9pyq3baOgwcyeKRR3mKufTkHjWYZSO45uHch+NKjVGzEaArO2Ci9aMQ+pXqW/wEbaDq1T461h9JzxDLuxj8zjWf3vSKSp6dYoLZgFp1YzVyNfCp2/sAWPHcmab6FnIDU4sWfbErme1GSURZ8arbUWfXewSlXL1qIihc1VQ5pRJNdpEJUwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by PAXPR04MB9667.eurprd04.prod.outlook.com (2603:10a6:102:242::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Tue, 8 Oct
 2024 22:01:41 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%4]) with mapi id 15.20.8048.013; Tue, 8 Oct 2024
 22:01:41 +0000
From: Frank Li <Frank.Li@nxp.com>
Date: Tue, 08 Oct 2024 18:01:00 -0400
Subject: [PATCH 4/5] dt-bindings: watchdog: convert zii,rave-sp-wdt.txt to
 yaml format
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-zii_yaml-v1-4-d06ba7e26225@nxp.com>
References: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
In-Reply-To: <20241008-zii_yaml-v1-0-d06ba7e26225@nxp.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-leds@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.13-dev-e586c
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728424880; l=3328;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=axT5IK5BGFlKISBilwdAGBwOVEQ0x5GPYstK601z4RY=;
 b=TsO9lh7z+wvt94dFUoES4aa1WJfygfLCUvpD8ckX7FVRpanfcMJ7Cu7MIbE9OWR7svGnWjdey
 3CT6JPSbbAoA6EoG5jGe7nSZ/RPpyqsAvJibrSH2UjHnCoic8Gz/ToL
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: BY3PR10CA0017.namprd10.prod.outlook.com
 (2603:10b6:a03:255::22) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|PAXPR04MB9667:EE_
X-MS-Office365-Filtering-Correlation-Id: 047abfc9-0ec4-4413-370a-08dce7e4ca7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|7416014|38350700014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3ovd0U2UmVQSTBzcFRqaE5uNDBvbitQRkFzTkVzdXFnNm8vdERXejhlWWxM?=
 =?utf-8?B?c2VPUThIQThkNDcrT3FnS1dmQ2t5azErbXNJdW83a1pPLzVDbEt3TXh4ZDdZ?=
 =?utf-8?B?TzB3blpWN0NFZFhkWlBZb0pHME9vRTlyLzZBQms3OFJ1Z2ZKeVpUR0J4VFBD?=
 =?utf-8?B?NjBoTHAxZ1VucFZLQmNOeFZxOHJnWk5oeWk1ZitYVm1KMFB6SnVVMzNBalE2?=
 =?utf-8?B?dkJBU2UyYnRLRmtZR1ZzZS9ydVl1Vit5WitVeWlydlVYckd5T0trY1Qyb1RH?=
 =?utf-8?B?cnBXV0xHWlZGclY0V1BkaHpBRUVUTWtvcEJxLzNqWGhCS1FyWE1weG41OEZT?=
 =?utf-8?B?VE9CYm5oVkt5SFk3akZHVXZydnllU05qeGV5eDFKSmwxQU1UeGVHZUNpNk90?=
 =?utf-8?B?MGRMejc3N1p0MkNFcDJlR3ZWYjUweWVpZU05QzFBODlFc0VvSEZkL2YxcEpT?=
 =?utf-8?B?c09FUGQ4blpWckt3eWlBUjUyVk1zQmw1UkpqQXVGYkhRZkZJajZxb05rVE9W?=
 =?utf-8?B?dW5ZKzdTNUxCRjZreWY3WExKTWhoamJzNHdNa3ZMSFoyaTBnbjRzS1FmL2tC?=
 =?utf-8?B?aGZ1UXBjTUtQMXoxcDZjbjltUnFkWHFncnptelVHRzJ0WkIzOFd6MUoySVRv?=
 =?utf-8?B?NVBRSW1JY08zaGlrMGlGWlpoZjZSWnlIc2pGVGxPbFVMVDI1YVVzUVcwY21V?=
 =?utf-8?B?R2FCWit5L3IwVHFaTUdjREFLU3VoV2ZQdXhneFd3bnJYdlBNVDZpUGMyNUFU?=
 =?utf-8?B?ak5yWGE2TUlHTGUzekRZV2NCbTV5blNURGtNWVBtdDgyNVhZb290WUM1R3pw?=
 =?utf-8?B?YVRIT0hodm5pQmM5V1g4eFlKcmpzSmdvTjVsbGxtR21IWnh1VUJ5S2dRd1JB?=
 =?utf-8?B?YmFhSUN5S2F6THFtYmZxeFl5Rmd6OWlhV1R2WGwrNmlVNnZONjhhUTFmallz?=
 =?utf-8?B?Tk51MXc2Y1YrZERvdXhNd0dDamgrWEkxVUJISHk1V0xZZ2ZxQ0laMVdkSnRP?=
 =?utf-8?B?eGFIL0RvdWJOYitDMWg1cGJSZ1huZGRqN3kvSmtJdlVidWJOSFlRQkFoMDVs?=
 =?utf-8?B?MTNGVkpRZlZuYlU3cEFDc29jbTBGY3FzdXFDOFRuU2htVXBwdlRKNWFUUmZL?=
 =?utf-8?B?eDBHVXN5dkFsRW1NdlF3UkpmWjExKzhmNkp1anlxWm1zOTV2Y1ZZaG40MldM?=
 =?utf-8?B?UmdjZTc2NExUZURaZWJGWmpWbTgrYTMyUlE5NVZ1TUlJYmtuWFdCbjBnNmxv?=
 =?utf-8?B?MHRpMnJodUY2Y0pSL3BMWU9BNzM3Nm1pVjJ3ZjZEbmVpYVhxZWZ0THdmWDdz?=
 =?utf-8?B?N2w4Tk8yNXZ2MG1wb1ErdEdGZUdxZUlvMHduRFdYMnJZL2JlRGp2d0FvMnFa?=
 =?utf-8?B?c0dJbG5RSzcrTjc0aGFRS3hxRStlT2x6OSthdU1IczZFb2h2T1VqSW45cS9o?=
 =?utf-8?B?WHVFUGJJZDU5Wk9OZm5ubXBFbnhxRVhXMHAxa2syVjg1c1hzS2dpRGt1cW1Q?=
 =?utf-8?B?aGFmY1prNnlrbWtoQitnZWUxai8zaEFpL0dMRnFhc25maTNBZUxxSzZxU3ZT?=
 =?utf-8?B?dTEyWUZ5d3VUVWtzMXJ1K3pwZHhHWWhpOGE1dzhHQm5Qa1prQStuMkJDZEJF?=
 =?utf-8?B?a3p3T3ZpRWs2a2hJQlJZZGJyTEJwbG5ESjBxbEpFaXZJYlY0N2lBY1hkbm40?=
 =?utf-8?B?M3BUUFFvMVJLSFF3S1dxZGVPYkNwbU5Gelc0WlF3RnlYWGZNR2dYdWZuS0Zj?=
 =?utf-8?B?RzRTRndhTWlnVytuK0FweVpXeUxLZjhQZndmd2o5T0ZEWVRKbVordGY5bmx5?=
 =?utf-8?Q?Jpf7LrWcQKwD/Jb9LwfAG6L4raqH8gaYBR80U=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9642.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2VETi9vZG16bnI1Ukl3VHVSWllxc3pDa1laTjBDc1ZscFpxb3Q3a0V1OG1I?=
 =?utf-8?B?aFZxZTA4TW9HMXhQOUdYM1RyR1E5clliczBFQlhYVGl3QzlHRTlHa0k1d0sx?=
 =?utf-8?B?L3l1eFBnbEp5U3RwbFB0Rk15elQyMzBZSDdtSUVmZzJmSm5YZy9VaEFTMkJD?=
 =?utf-8?B?dHZNR1hRVGsxYzgrWDhjTWNaR1dSOExaWldDZmxObmZUZ0FMTTFIZHd0amVE?=
 =?utf-8?B?RVVIRWhLZ0VPRTZrSWxsbHNmNlhKSWpGMkpxVzV1OWJXOUgrajJPWW13K09M?=
 =?utf-8?B?UHpGaG5DNnQ0dXVQVWcvd3VKMFRRdUczM0tTUkpoOUN6WWRuQ05HYXRhYXNX?=
 =?utf-8?B?Wkc5WVMxSHozb1oyN1NydGxvS1ZkZk9KTFpPQjgxTDVrYitscmEwOFVkblp5?=
 =?utf-8?B?RlcvWUJ3ZlluSWREb01mc1llc3VrUURpeEJiem1PSnozRFcyZGs0c2t5em5K?=
 =?utf-8?B?c1RFM083WjhTT2NZYjAyWU9xUHpCUExtZzJvWitrWEFzK0Z0VGs1UStWbEVT?=
 =?utf-8?B?K1cxUE0xaWtnTjc3SGxmdTh1TE1Xc3RFZmVwV3EzcEN4a0sxTnNHWWxZaFdq?=
 =?utf-8?B?cXd2dWFPZ1RlZ3pIRUU3MnhIaGhpWitSVkpRSjdiMG90RFplUWoxNkpJZk54?=
 =?utf-8?B?TjZqVTdxeEpoZjV5cTkySXM2alZMU0FuTjlUekU2WUpHa2kvMUI3cndNZHhW?=
 =?utf-8?B?R2MvSVhxOFU0UlZkVVFSL01ETmtWUTA0cmF0MjVnV3N2ekYwZG5TYnE3dC8y?=
 =?utf-8?B?TmVtUGJrcHI3Z01qa2J6Wk5KbGtaZjBIN1ArR2FWb0JFek1qZjF0WjJld2lo?=
 =?utf-8?B?RVVzRWF1S21SZzhGNnUrVEs5VmhnbkdTeVE0SjNLZzgvemtWUjdyZEZqVjRm?=
 =?utf-8?B?L3V1dEdWTkV2UkZIR2d5YlBXK0NUWVZRamZxTTRucURzMlFJVUVVeVNxOWFZ?=
 =?utf-8?B?RExVakxsb2R4K2UvMGdtcldQR1JkUWxDcGZxMUZOdkhSOGE3UVJJOWtUd1Zk?=
 =?utf-8?B?eGV4SVVEOE0rQTNMaVJFVndZTGc3dmVNdEpzVWZmcGkzaGx2dDFZREdXWnZL?=
 =?utf-8?B?UG5QMTV3Q3NoZGRMVzNCeC82cGx1dDRnekMyOTN4aWVnS05aR0ZJakJzOCtF?=
 =?utf-8?B?WmFHalRLSHQ3QTlVZ1NERmJyZUpGMUN5NnlIU0lFZVRMQVRPdXllelhNOFgr?=
 =?utf-8?B?cTVUZFlnVWFrSlhCU0EvRUZnWnR2WnJyeW9nN1JhV3VjcEFrbkdTeFpONDlL?=
 =?utf-8?B?RFN5aytuRXJRMXFESWViU09yYWlzRTJ4byswNFZrYjFya1RWeG9zYlcyVkd4?=
 =?utf-8?B?RGMwVnR2SVJuWGZYVkFYdWR2MWNIVjc1VkJ2MmpDS2czS3dKejZMWXRUSTI2?=
 =?utf-8?B?SmVhSFhnMkZQUEQ1b2s5Q2J6ZC8yK24zc01CcXNCSjFMTWdnOWtMRmNaWm11?=
 =?utf-8?B?cGE1akh1Nkdoa1AwNHd2N0FsRjVmME5VaHZuQnZ5MlhyU3hlZlhpWkpVQjVv?=
 =?utf-8?B?UnhRdHBLQVBlSjhZQWEyYWhaRUZpVUVuSCswYm4rTFhITXpzbjVkS1JkUkZu?=
 =?utf-8?B?MlZ4YTNCZU5rNjJJc3UzUjlvUjFKTnJ0RytYY25jczV1OVAwcXMwOUpKYVBE?=
 =?utf-8?B?N2ZxbUZTdHZlQzA4ZlI5YVZHUnA0MzJVcFpXL2VMVDJuQmo2OUJZRUZvM0pu?=
 =?utf-8?B?c2E0a3JUbUQzZzluZDRQcTU2Ukh3UGJBU21vTVJLeDlaM0lYczV4V2hqa0Jl?=
 =?utf-8?B?ZndYQUtnWjEzTytpdU5YU2xOeUdwOFZEMEVuTTVTK0FMUE4yZUVqMkovVExN?=
 =?utf-8?B?eUhYaElzQXcxcUFwakVHcGtlSk52VzRvNGtNcTc0cDErTFBFRWJGcUNTaXpl?=
 =?utf-8?B?VEJITXo5YVdFaENucGcySlJEdkp6ai81ckI1M1pNeHV5SyszZmJESE5iQ3do?=
 =?utf-8?B?a2dVZFZLQWJsS2YzQ1dmR25SL25QT0xhNGNjRmRlWUR5emRaakdydWU4bjA2?=
 =?utf-8?B?WFZpYTNkblgwb3FibEtJWmZuUTBnby9YMXk0UW1aUVdHNE1BR0hhRitwaFk4?=
 =?utf-8?B?eHVhTW1BYjRxeUR3RHdhb3VBRU5Xa1Vxc3ptcktXVUx0SnRpNUplbEdPU0JH?=
 =?utf-8?Q?tlBQ=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 047abfc9-0ec4-4413-370a-08dce7e4ca7e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 22:01:41.6331 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWKhkrlK+L6Es6lU07+3d/ggR3LVuzMhdfD0L/xExAAHSFmYKC8S+sQZ+5CoT1oYO+ePG1V6cRtBFfMnzs5XYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9667
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

Convert device binding doc zii,rave-sp-wdt.txt to yaml format.
Additional changes:
- Ref to watchdog.yaml.
- Remove mfd node in example.
- Remove eeprom part in example.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/watchdog/zii,rave-sp-wdt.txt          | 39 ------------------
 .../bindings/watchdog/zii,rave-sp-wdt.yaml         | 47 ++++++++++++++++++++++
 2 files changed, 47 insertions(+), 39 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.txt b/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.txt
deleted file mode 100644
index 3de96186e92e6..0000000000000
--- a/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Zodiac Inflight Innovations RAVE Supervisory Processor Watchdog Bindings
-
-RAVE SP watchdog device is a "MFD cell" device corresponding to
-watchdog functionality of RAVE Supervisory Processor. It is expected
-that its Device Tree node is specified as a child of the node
-corresponding to the parent RAVE SP device (as documented in
-Documentation/devicetree/bindings/mfd/zii,rave-sp.txt)
-
-Required properties:
-
-- compatible: Depending on wire protocol implemented by RAVE SP
-  firmware, should be one of:
-	- "zii,rave-sp-watchdog"
-	- "zii,rave-sp-watchdog-legacy"
-
-Optional properties:
-
-- wdt-timeout:	Two byte nvmem cell specified as per
-		Documentation/devicetree/bindings/nvmem/nvmem.txt
-
-Example:
-
-	rave-sp {
-		compatible = "zii,rave-sp-rdu1";
-		current-speed = <38400>;
-
-		eeprom {
-			wdt_timeout: wdt-timeout@8E {
-				reg = <0x8E 2>;
-			};
-		};
-
-		watchdog {
-			compatible = "zii,rave-sp-watchdog";
-			nvmem-cells = <&wdt_timeout>;
-			nvmem-cell-names = "wdt-timeout";
-		};
-	}
-
diff --git a/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.yaml b/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.yaml
new file mode 100644
index 0000000000000..930ef4bdc04e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/zii,rave-sp-wdt.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/zii,rave-sp-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Zodiac Inflight Innovations RAVE Supervisory Processor Watchdog
+
+maintainers:
+  - Wim Van Sebroeck <wim@linux-watchdog.org>
+
+description:
+  RAVE SP watchdog device is a "MFD cell" device corresponding to
+  watchdog functionality of RAVE Supervisory Processor. It is expected
+  that its Device Tree node is specified as a child of the node
+  corresponding to the parent RAVE SP device (as documented in
+  Documentation/devicetree/bindings/mfd/zii,rave-sp.yaml)
+
+properties:
+  compatible:
+    enum:
+      - zii,rave-sp-watchdog
+      - zii,rave-sp-watchdog-legacy
+
+  nvmem-cell-names:
+    items:
+      - const: wdt_timeout
+
+  nvmem-cells:
+    maxItems: 1
+
+required:
+  - compatible
+
+allOf:
+  - $ref: watchdog.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    watchdog {
+        compatible = "zii,rave-sp-watchdog";
+        nvmem-cells = <&wdt_timeout>;
+        nvmem-cell-names = "wdt_timeout";
+    };
+

-- 
2.34.1

