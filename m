Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25FDB58140
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 17:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BD410E4F3;
	Mon, 15 Sep 2025 15:51:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="b4wdhx9s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazon11011042.outbound.protection.outlook.com
 [40.107.130.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E519310E4F3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 15:51:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=schoTgq/UredTl3xKNfQuDa+em3noIis/Ic4hX1biYjOuh85WUKZei8FjJV9KoWIccY74TM3K21RQfC2xW80exob0TR0pj2bwU4d+vTb5oZL5PspeZ4oAaHxDFbVFEnNnAbBYvjIQz1BVd4jm4U6zK579ZuAADcyAr5iXfr0Slq/tfM5YNOpbzL9OXXinqCiyhjgrzDzoeCROwmh4pAwqLsTXmrU6HTp2m+IWTmYePGJnsCncCbHxZn5/2ZLOfwiAG368F0f79dodFzFqJHqyK3JWer5+fc12BWUEFUPfbot2wNny6j30iA3Qn6+hXnDCen0HHk5Yb7IqnqNbDJzow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLA1HSDhDTNI5zGlm+oV8Lz414pHFtp980ccHUjK9Xk=;
 b=tPnoJE8OF+4Zd28W7SnLdWrp14X9f9C//ORZPT8mHRE9rFp4MwPVIswFwYZuOBscW4npwvqkrrzRGzhuhSeidtHlCPYdo5Amcd8shXgu1iMNeW7kn3PzcAV01AVz8JXImj/qj5sJ/WdkFWo8XBBif8E0UD4uuabtmomDukDCQEJmDKX2NQX1U5HufHXxrMRvNsuKOUknmzyf1wIO4wesg6pjmlwVhpAN8nXK7NdYFdoBGKCCaC/3ecCoxYFUqQJ0Ma6/ukDEzF6/EBG9l0FXPMAiaQWKcBTcyl6TlWqCrsyqLvbaYfihkrlHVTs4O6keEViisUv0Qj4qkIi1e7Lk6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLA1HSDhDTNI5zGlm+oV8Lz414pHFtp980ccHUjK9Xk=;
 b=b4wdhx9sPlqjq7tt+PpMqJCtbo53tKSasSMHO7WMzFv7wAtMlcDPbHWa18K1Zee4F2x2L+6Rf9VXY5OynVMZmRrYC/tQ/kMAHP66bFNkLUNZf6YaoSzLRfZyfNhSmf1lCQbSzUkDQu23pIGehZpc8VGX0aATuCVwcPvcaN1H92eciuqbNoF9I2Z+ikrpiqmiVNUiBxcSTLg5/Du343bIh99t3N8GxusQmRX6PmhSBKUfEA9HyHWourEVK253XzmAvzMvMupmwJYcPsQgch2aj0QvRxOEw38NLyOJq79u6sLFY1hvEE6Y3KP1o/etF59e3SwLpDJPzifFGU8kaWAc4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 by VI2PR04MB11217.eurprd04.prod.outlook.com (2603:10a6:800:29a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Mon, 15 Sep
 2025 15:51:43 +0000
Received: from AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e]) by AS4PR04MB9621.eurprd04.prod.outlook.com
 ([fe80::a84d:82bf:a9ff:171e%4]) with mapi id 15.20.9137.010; Mon, 15 Sep 2025
 15:51:43 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), linux-kernel@vger.kernel.org (open list)
Cc: imx@lists.linux.dev
Subject: [PATCH v2 1/1] dt-bindings: display: simple: Add innolux,
 n133hse-ea1 and nlt, nl12880bc20-spwg-24
Date: Mon, 15 Sep 2025 11:51:23 -0400
Message-Id: <20250915155123.3250823-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0106.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::21) To AS4PR04MB9621.eurprd04.prod.outlook.com
 (2603:10a6:20b:4ff::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9621:EE_|VI2PR04MB11217:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e0037e3-125b-4d12-e649-08ddf46fc48b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|19092799006|52116014|7416014|376014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QldFV0xaWXJNWUNJbmpVWXJkNXJuRytvV0R6bWJ1WU1VQlZSc3BKY1BhdmFK?=
 =?utf-8?B?MUM3R05SSS9QUVV3dUpmNzVjU2swVVI5MVVHbnJxZlZTSVlGT05SMmNIUnZZ?=
 =?utf-8?B?S0pUeTFrcVNtN285bzRuRFhoV1FYQkFJNVkxNEpRTXZyYXRjSGZ3MTNzMy9E?=
 =?utf-8?B?QUU3VDIxck83TFk3UTJ6aGU3ZkEwUTNPb3lIVGRyN0RSeDMyWTh4aGl0TzQ1?=
 =?utf-8?B?Q1dOSnkxOXc5dmExZ1ArTDFQUlg0Y1YyYzYrM3lOUWUxWkR3OWpmTC9DcUxH?=
 =?utf-8?B?TGRIeWd3QzNyaDJOWXVHMU12aVJJOXp3ekplYk5RRnYwSVB3U2d5NkJTNVM5?=
 =?utf-8?B?ZmlMNzlNWmc2MTEwY1EvYUdVL05kOW9Lc0VyeGlCQmNQVUhaUXllSStZeWQw?=
 =?utf-8?B?TjRlTWdDR3FrNDM4VndsNWtKOS9KaG95QlFTem5Td3NmYkRnMEVQYTdNNSs0?=
 =?utf-8?B?ZFlMSU1LZThla0ZCdjlqSTNDS2cxT2wwakNMMDVjQUV5Q0V4Z2d0bDlrNHdI?=
 =?utf-8?B?a3RuSXZuQmQvc1VOMWlyOG9UMjdHVlBDOW5GRnRhUTV6ckk3UjFLaDViOXY0?=
 =?utf-8?B?MXVhemhLSFBwUG9hRjJDY0NXU0tTckZ4VGQyTmIxRnp3MnlBV2FwTHBsSXRz?=
 =?utf-8?B?cDhhODVLMHdTUHV0c1VBaUNRYVlmMFIyeFdodFRjcjM4dXlsdTRyYnQ5Q29J?=
 =?utf-8?B?RzV1TEZUNVNEU0VqWWNEcmlhekZTSXQ2NWx5L0hrZkJPUWJaQjZMV0RZa0FV?=
 =?utf-8?B?R0NBNmE4bkNyREhmenV0ZEMrT2RzL3ZqUGNYblJhWHphamUrbldYZHByUnJN?=
 =?utf-8?B?eVhhbng0TnJnSVdjQUFacm5LR0YxV0Jab2x6M1VxQXNqMEF5S3lSSnh4b1pj?=
 =?utf-8?B?d3ZXSnRkQW5DeXN5N1FGeTN1N28yRG1lMFVTaXB3T3VnSitTa1lZMWh4c3Nv?=
 =?utf-8?B?Tk9ZVGFhYlh3eXAvSzg4UlhWd1piN0dsVzlOYW5vbVZmeWtGWThSTzNucDZB?=
 =?utf-8?B?c1psRmc2Nncva2s0VitxSVd4dC9wSmNzN3IxclRHSG9sczFBWFV0UzNoOWtv?=
 =?utf-8?B?dnlDaWZWWnYzbk5tYU9KaEFTamE0MTJ6RG1OVURtcTd1bjZwVnJWb1BPdHVL?=
 =?utf-8?B?b1dicHJOOFd1ZWtCTzRSQlUybTVqaUFRakYvK2IyekE2d3F2VGhFWlkwSnh0?=
 =?utf-8?B?T3pjNi8wZ1lkUHlIZy9qYXRnZURMeVVralh5UVVuc2RVbWtlZzF3OTdtdzFx?=
 =?utf-8?B?N0p2bi9kUE0zeTRlKyt1NDQ4MjVqc1NoM1VPbitQb1U4aHpLWXNhWjFHWGNQ?=
 =?utf-8?B?NUZhQStQUDBtY0FmZk92TFBQNFZ4TStSSk0vdFVDdU84Rkl2bzNXaFllbmxY?=
 =?utf-8?B?ZGcrdEM3S1h0Q3I1azRmVm5nUnhQRy9hSzQvblg1M2Q2S05CbnJwZDZHRTVo?=
 =?utf-8?B?R2UzczJ5ZlVQZ25UNnNuZjUzQkRHWXdyaTZPYjQxTkRyaHFSK0dOZDRQUXhh?=
 =?utf-8?B?QXZpVG80a3RZNUJydTMrTXl4MGZaMUNuNlFGTFd5djFqZitYcElVUkEzRWEz?=
 =?utf-8?B?Ykd6R1JkaUl4Y0FOTU00V1k5VTBoeGV6NlpEc1dScmZTVlFBTUlHS3Vyd0Rs?=
 =?utf-8?B?b05jQm9FSlFIQVlQQUlXVjM4ZnVQUWVRRnFmQldUQjZXa3J4OEhlUFRlVk5x?=
 =?utf-8?B?a1oxV2pYVWxlSzJhMzNLb1pjclVTVHF1bG8xdFVnTlZvWXd2KzZjL2dTdXpK?=
 =?utf-8?B?TVBPT29YaXZCdkUrVUpiZmpWSmkwRlMvd2FsQVBzNDk2WnFJUENxNTV6aXZI?=
 =?utf-8?B?QUh4eVcxSk1ua2llMVNDVkI5MEI0VzAwY0RvM05GbE1vd0ZrTTdWZll2d2N6?=
 =?utf-8?B?cHVNVnYxRGQ4MmxRKzFJb0VSRUJ6elNGaEs0ckpnWnh4eGpxSldFTGVWUGdv?=
 =?utf-8?B?K25ibnV4WnFHSnJGVmVnUUd0VTluSGdIMFRjbng5cTFwNk1hYmVOWUQ4U2Zj?=
 =?utf-8?Q?Lng4Z8dCvCRzGZtx3iV7PTnspllTR4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9621.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(19092799006)(52116014)(7416014)(376014)(1800799024)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHNaY1YvNEJFMHl6eWZyNUdMcDVaTm9udU53cmtEVWRsM1NENmhVZFZzYnA3?=
 =?utf-8?B?TWVUc0lja0s4QnRpYW80UFpueE5Td2xwbmZRS2JxaGFleTA3S3I3NUExajV4?=
 =?utf-8?B?M3VwZlRFaUVQbGFFRUhWR1c2d09xMGE2UU1yVjl0bWlPclNudEh4S1ZiaThX?=
 =?utf-8?B?dWw0L1I1NUxHMDZReC9ueVJBVmxSNlN2VHB3QlBoaHpyZUFYaXhHdy9sWGRT?=
 =?utf-8?B?SHIxSzZmcUpLVEpGeHpTOXNKWE1VMFNIQWRSVzdQdytCY1Y1STlaUnl1YlJH?=
 =?utf-8?B?NHY5Q0JySFU4Z3pzTkhXZFpZRkwraytVQUFpTld1Q3BIZmdXODdENG1pUkUz?=
 =?utf-8?B?ZWtVZHVOd0FhSStDWUhGZzd6UGw2ZEE1Y0tHaUZveUU2VFpVY2NCY1dDbE1i?=
 =?utf-8?B?UkVPaTN3cTk1RmRxeXEzN2o5TlorK04wbXpySEorYld2S1FOYXhLLyt6UmlD?=
 =?utf-8?B?RnZ5dysrTmhXQ0E2WFk2aWh5dnVsQUlJMXdYYnBBcWhEcXJSaWxKbW1qVmFC?=
 =?utf-8?B?QldNWHRWWDJVT3RJYWdZOWVLc0h6Y1lsdmZsMzVscDZnSytxKzZkRGZHUTNV?=
 =?utf-8?B?OGFvNmFtNHNQRXI2cER3QnN4SjNBQ0hHTGNyb0pobW93QjgxUjdEeUY4M1Qr?=
 =?utf-8?B?cUFxbjRWazNETU80TlRIdk1CMktmTHRPUVpyYlkzbFZZMTA3QjdmSGJZb1JE?=
 =?utf-8?B?dzQ1L013SGxCS08wNHAzSS96RGJWaERzRGpyVFdUditvbWhoUmJLSlJhbUtj?=
 =?utf-8?B?QnJLRzdSRXEzWVRhSFpkeVJ6dTJHaC9wa1VRMFFTaU9jU1RHK3hoRmtHbXlu?=
 =?utf-8?B?S3pNYmRMRzRMaWFsa2xIeU81Qjk3N1BVVGdzR1Y4c1hVNG5DY0Z2bHl4bmNJ?=
 =?utf-8?B?aXVQZ01sN21ic3pGdkxxVDFxS2MwRWUrWk5mZkdlQVp0NXZWOFloc0tSVVd6?=
 =?utf-8?B?NTd3d3ovWTQxVjluNEN3NUNUcXVqeTE3TEdOSktqSkl0NkpVUDdvSi9zeFZ2?=
 =?utf-8?B?VlU1SVN4SXNsUUVmaTRUNDFwZGE3YzY3czdROWlTTnlIT1E0SEpsWFgxSm5T?=
 =?utf-8?B?MlNHZm9QYzR1T3BFYzVTOTIxTU84dnExWHgvVUNqY3hvYmZwTVlyVzZKckhh?=
 =?utf-8?B?WEw0ay9OV29JaHdSK3pzMjd0VktrV29qYWE0L3BTWkdFbUE4bHk2WXNXRmY4?=
 =?utf-8?B?ekZzWUpZdnE0MkMvc3Q2OU1VaEUxazBqcjJBV0tFSHY0eTVXT3ZQeWxoQTFP?=
 =?utf-8?B?WmZYejdnWHA0dFEyRFI4a2lndG1LeDlMaExsZzZvdENyVE9ldVpZaW9YMXhE?=
 =?utf-8?B?NFhHZ1RrNWQ5czlDU0k4TmpZRm9JY1lnTHVkc1ExY0hGdTNydlhzdXFCb0V4?=
 =?utf-8?B?RWlDdUxXM3o3WEp0RlJVR3lKQ3pRb0JhSE9FaEZadFhKMEdPdmJzOUdKOTdY?=
 =?utf-8?B?cXM5MVQ0bUxxVXpyTUJBRHg1Y3lpR1c5TXlFbmlqSG1xR2FJcnZkV3MvNGJz?=
 =?utf-8?B?NlExNlZ4UTM5OGVKRW1EWm9IcWJxd092dGU1VVFqcTcySlpUd1dseHVQVmEy?=
 =?utf-8?B?WWZvSFBGZnpaWVc0a2xOc3ZhSHd6S2ViVVI3dGRKUEpveS80dzVhclh0UzN5?=
 =?utf-8?B?bEVPZFAyL1BabFRrbXM3dlRDaGcrQmJ3MUJFN2pXMFZZbENjYmVEZmpLL1JF?=
 =?utf-8?B?UzdlNHVQVU9pQ3gva3BsWHVWS0lQUFdlM3NVOFRZMHpnT2RhOVowSEdvczNE?=
 =?utf-8?B?V0JxcXdkaUsyck1FMEdjTkdRSTM4amR1NCs4TGoxZS94bEl1R1g3MUIxOFJR?=
 =?utf-8?B?Q0RscExRS2c5VGlrWEtkdzRSSVYxOHpwWXJmc3NBREFwdnY5MHAwRFZEaEtv?=
 =?utf-8?B?MGd4UUtHNG5pcXR4RURvWldTb3E1Y2p3Y2ZmbnpWRXlkcnpKZ0pXS21RUzJv?=
 =?utf-8?B?aHJPbFZjRzlyZFVkRk4xVXVPYmIzN0NMbXRxaVJZeDBRLzNTRlNiNWhVbURN?=
 =?utf-8?B?UmgzNDhsQlYvTm1SL2ZkL0IzS1RhaXJHOXlTeHE1N1BSQ2Y1aFMxdk9YN0I5?=
 =?utf-8?B?L29MSkZxb2E0SHNPNDR6VXEwcmJtM1RDbzUvRGRDODlOOU9FYms2SVdxeE5s?=
 =?utf-8?Q?ZlOMemsqTFFi+bjd9B2uNnQJS?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e0037e3-125b-4d12-e649-08ddf46fc48b
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9621.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 15:51:43.5401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4eJ+BYl2D0HwZEfK07zfsnZocB6N/eK1orDfZbZIDvvkXfOAuNSdoynjirDuhXcsC1CZAtVvcjLBdpd8nVPkyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11217
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

Add innolux,n133hse-ea1 13.3" TFT LCD panel and nlt,nl12880bc20-spwg-24
12.1" WXGA (1280 x 800) LVDS TFT LCD panel.

Fix below CHECK_DTBS warnings:
arch/arm/boot/dts/nxp/imx/imx6q-novena.dtb: /panel: failed to match any schema with compatible: ['innolux,n133hse-ea1']
arch/arm/boot/dts/nxp/imx/imx6dl-tx6u-811x.dtb: /lvds0-panel: failed to match any schema with compatible: ['nlt,nl12880bc20-spwg-24']

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
change in v2
- update commit message to show fix CHECK_DTBS warnings.
---
 .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 48344ce74a6e7..77a5d20a8b0d9 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -180,6 +180,8 @@ properties:
       - innolux,g121xce-l01
         # InnoLux 15.6" FHD (1920x1080) TFT LCD panel
       - innolux,g156hce-l01
+        # InnoLux 13.3" FHD (1920x1080) TFT LCD panel
+      - innolux,n133hse-ea1
         # InnoLux 15.6" WXGA TFT LCD panel
       - innolux,n156bge-l21
         # Innolux Corporation 7.0" WSVGA (1024x600) TFT LCD panel
@@ -230,6 +232,8 @@ properties:
       - netron-dy,e231732
         # Newhaven Display International 480 x 272 TFT LCD panel
       - newhaven,nhd-4.3-480272ef-atxl
+        # NLT Technologies, Ltd. 12.1" WXGA (1280 x 800) LVDS TFT LCD panel
+      - nlt,nl12880bc20-spwg-24
         # NLT Technologies, Ltd. 15.6" WXGA (1366×768) LVDS TFT LCD panel
       - nlt,nl13676bc25-03f
         # New Vision Display 7.0" 800 RGB x 480 TFT LCD panel
-- 
2.34.1

