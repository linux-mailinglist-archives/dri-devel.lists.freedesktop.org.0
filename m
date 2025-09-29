Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2151BA7D44
	for <lists+dri-devel@lfdr.de>; Mon, 29 Sep 2025 04:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551E210E205;
	Mon, 29 Sep 2025 02:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Fjl+1/68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013017.outbound.protection.outlook.com [40.107.159.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DC310E204
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Sep 2025 02:41:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NnwSMc6PNypuhyirswio8nZtPDmOSTK1PtTxFRgGBzzcPYxANc5/okXNNRWObb3DJmT2lEvbZfE97vEzAZaaBh1f2FhSmD2St7NtMeRbdnZ02XBi3YqecUf6KjUdj+j+2qYTU4byGlsvhZzvrkuIv45yJIv3R/i5xmc9dD0WXOqox4AIa3cjh19Lc8dZA1e0P5bmbSbgT8HcOZfVku9FDF7w5XaBeG/mb3Ro6ALIKBqSRa6nSkSQuYyl7a95zTECtr0m6atVBt4FwSvSJTCOTvBzFlpO9SzudaCiBLkXA370h4US6V5ZDhxSZVA5Hqdaj7fqvFIcBE86FbWhdDCUrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c7QLXbjuk6fNa2kO2V+f8b86lDisD70Yao7aPtQS8Co=;
 b=nk79rge4JH1zqSdjVQsYYPc2jHvIAAMcqEYs0KnKLCieLbi1lBrgcV/9ZPN5pQSljnY6pJtnWoC48Uy+D0TFWaSdguKnRnV7qwXuREJB1YWL8kJPszKMdAQzSTpI1C6SK8s+5VbIPEtpFgxshTf48GYRHvWWRtOADK+FBjjrIZB4/9bR5HvmiV9gLTDyhSY8RJDAG/zifiP/UXcsuMuueSsaWfsaKvVZmwVksKpNhV/tVv3zIOp7qMdTv1iWAnfTO59AeONrGDcF5hwxlhLxSHYYa85ZuiRmJj62xqUXaS+5AqkQnTl8ZCObKQ4oNPsCbRz97GgXWD/dlUtL5Jc+eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c7QLXbjuk6fNa2kO2V+f8b86lDisD70Yao7aPtQS8Co=;
 b=Fjl+1/689gzNIvMB6+pSic4GL6F4h37LNkBGZYRO8xF+hCsyi8h28xB6namFaCcB791ri04oPGktp59zlBB/rgUj1ZnsN2AlFjoSYEL20z/yAFuKMDRTG05iNeU7B2Z7ktxh9wrKHTWv5BvRN3MlxTBwnCTCfHoN/lip4KjG8YdIFC88c9r6CvcssRXaai89fiJ/ZfnsmEyngEQlzj2vgR1oQ+Rh/Ce/DcUCJtUhHUJ3ErE+Qf6rsJs+pjWjw0l6zklN5lnXEVo2bLmei7ur0ybfS0Sysn5JmB+OJS7vkSi+hke+72gwrfNibJLQphJr06ygnNdArpjYKKRPJy601Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB11722.eurprd04.prod.outlook.com (2603:10a6:800:2ed::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.11; Mon, 29 Sep
 2025 02:41:43 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 02:41:43 +0000
From: Liu Ying <victor.liu@nxp.com>
Date: Mon, 29 Sep 2025 10:41:48 +0800
Subject: [PATCH v3 13/14] drm/imx: dc-fu: Get DPR channel
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250929-imx8-dc-prefetch-v3-13-c01d0608add2@nxp.com>
References: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
In-Reply-To: <20250929-imx8-dc-prefetch-v3-0-c01d0608add2@nxp.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Liu Ying <victor.liu@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR04CA0212.apcprd04.prod.outlook.com
 (2603:1096:4:187::8) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB11722:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d8e7a62-b65e-423c-b926-08ddff01b9de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|19092799006|376014|7416014|38350700014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?LzlEMElidCtUNzZRZE5tZTByZEVBb0xuRUk0SjVQL25ud0JTTXlSYnVGR3Jz?=
 =?utf-8?B?TU1jUk93VGx1dXpFaDE3MHVlbkJ4Z0FCMklrWEdnNkFnOGc1VncxbXRqRlla?=
 =?utf-8?B?MUdONGNiVVRHUVo5OEpzZ3RkUFVVRExFWGI0dS8yRHdqcDdLd2hhSjJCWWlU?=
 =?utf-8?B?R3JhbkNLaldpOUI5QWpFTUdEdFRzZnc4V2p0MTZoWURzbGwwc3BCekVoZGhS?=
 =?utf-8?B?enFkNmRXZWcxTTZ3RW9TOXB0MFBzc1JsZzA5SEJhNU5SSEsxa3oyT0tOU2ho?=
 =?utf-8?B?K0M0dTkxNGdjRm9GQ3F2cU9vUHRFaVVwZlBaKytUSE9LUHRON3UwNzVUQ0sw?=
 =?utf-8?B?VkwwczdhQVRsSmV4V3owODZpZXJ3cTEvMjdrYS8zbUVWOFhGQy92eDJTYXNs?=
 =?utf-8?B?QVdKR1AvNUJ1dkNsTUFLektLUC90NTlKWlVFZkREMm5XU1MrUGxlTldpUTlt?=
 =?utf-8?B?bWJPcjNtdFIwem5MOG5sbmViTzVieWJrQks2TlFPLzFvS2x2eFI1TEtuUTk2?=
 =?utf-8?B?TzRVcHB2OHdzQkhwVTdSRFVnRmI2ek1GRzZFLzBFcDNlY0xQelV3RFBHYnBo?=
 =?utf-8?B?Q0FIcFJ3bXpvVWdFTGljV0w0R2ZweUM2Y0FOb3VsREpHcjIyZVN5cUxDL251?=
 =?utf-8?B?aXd6R0l4UDZ1RkNvdmk1TnJpTzdOaWZaS0hjamsxL3o1V0R4TS9uSU13Z3dJ?=
 =?utf-8?B?OE5VNkpnaUtkcmprR3VIY3BIdG1HeEVKNUsxWjV0bTVPdithK25aeWpMeXdD?=
 =?utf-8?B?VHJHVXN1VlpKVVNQanNCVEhNVWptV3VIVkd5dm5HYVJQYmRLS3lyUDNYQzQy?=
 =?utf-8?B?bS9yQXBiUDROQWRHZXg2OUVUdTBTb0FmcDlyWkZuZm5LK0pYd0xmNFpPa2Jj?=
 =?utf-8?B?c2RvY3RYNjVqbFBPTjhNODB6K201bjBzN2xuY2o4UVpyS1R1aFcvZGRwbVVy?=
 =?utf-8?B?N0dsZEh3eENWNVY0NGRjRDBIc3pNYUpZZnhQWHVYVmxycThNcHZLcDNKZDRj?=
 =?utf-8?B?S1FHUngyeTNOamhtek42Wlo0bm9QNk1VN1QxVzAvL3NONWlYMmRHQ3REQlZo?=
 =?utf-8?B?WUt3QTVDSDZBVjRuYVh3ViszWklCeDg0MTN1Q3FSM21xVS96TjRKSlZrS2NP?=
 =?utf-8?B?TDczTTlNS2h1dzV6UHVraklGSlEwaGJJbmhTOUE4OFYvL1VxaXo3aENDUUMw?=
 =?utf-8?B?a0NPZmk1cVhZcm1id3cyT2ZtRGQ5L00rSmdCVnpTeWF4cWlnY2J2ZmhiL01D?=
 =?utf-8?B?T0YrUkpvc2NCZ0hxY2lqRDhUNFdNaFVuSXNkZDlFbFI1ZUowcUhBQnMvL3ZM?=
 =?utf-8?B?R2lPakZWbkx0Q1RqUjBySlBycUUzRE9DeFNkVk5sZ2RCTEk2Q201RWFMSnJ4?=
 =?utf-8?B?SmFGTEM3UW1CUmprYmpraTgxVU9IdWh0dG13QkRYRDg1b2p6OTE2WnlRRUxR?=
 =?utf-8?B?VlMvZnVmR3d5amxhTzZzYVpTZkdHM2kwcFMvYTlVWldsSy9Sa1kzdDk1SUtW?=
 =?utf-8?B?YkVSYW41Vzl0R1hCRWNjWnFjSjkwUDlNVUxzR2pHMHM0dXVmQlpveVR6c28v?=
 =?utf-8?B?bHB5d1JUaklyU0pGczFsd05VTFhkanYrVnpndDNlREZkWTMyTHVOa1BUMW9M?=
 =?utf-8?B?Z2MzT2tyQmpHU3YrbGJzRTBseTBCY1ZON1lxQ0RFanlSUEJ0N3I2Yk5YYVQ4?=
 =?utf-8?B?M0ZWS0N5d0JhUFBvOC9uWXBzQy9MZ1picUJtUGoyM3krNm00L0N5OWs3OGdk?=
 =?utf-8?B?aWh1Y1U5L2x6Y0FOcjE4Zkx6dXhHMjZCTkJGdHlpb2djOCtjajNqN0lkUDd0?=
 =?utf-8?B?SXBNaEdha2pVUFBKbVdJaElsL3NEckc1WUdFZnRhYXVUWER6WU43d29uM1lG?=
 =?utf-8?B?SlhHZEErZ3k5TUd2YXlTdkExcHdjcjRPdUxwZ01oRkZodkNLUGk4QUtLSThF?=
 =?utf-8?B?ZDI4bXN5VSsraVNKQm9lblFmTWNscFVZekNPNmdYeTBqU2RpblUrNVg3Mjd4?=
 =?utf-8?B?ckIxQ2hqVXE2QmF3SUpNaVdwdWRtZGJyZ2lLZjJZdElXZnhBNUdWUDhZQ056?=
 =?utf-8?B?WGpyV29FS0xZanJUdEpXVGxZUVdwdVdXUWE1Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(19092799006)(376014)(7416014)(38350700014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVpMVUI1eDJaWGpmRE8wWmJleE1sK1F3bUxhbzlmTUJnRFhwWUtZdkpYVFZl?=
 =?utf-8?B?NmVDNWE2VHAxcit3d0VLeVRZSXdtUjVOOVJXUm5vdjhZVVI3WlhFbnVEK0FC?=
 =?utf-8?B?NkI0TkxXOWpvSXZaVUVTbk5GeThOMnkvQVE1bEN6Ni9GakRZSnV2Q1VtMUxk?=
 =?utf-8?B?Qkt6by9PbFZLckxHMVJLbittTkJTemZGczdtblZHQmNYM3lhUFh6U0thbzJj?=
 =?utf-8?B?WHZsSFRMa1lkcnlBdUxoZkFETkt0SWhlbDdXWXc4UlVNQXFXemF2eUF2K1Iw?=
 =?utf-8?B?SzM1UkxOcDYwZFF5RU5uaDlOTjBDK3FhSFpvR21KSDNoaWtNVGZCR1l5aSt6?=
 =?utf-8?B?VDcxZVFoSnpIbG03OVNHc0tZRzRWZGw1ZFZMM0h2VU5kaHdid2N1b2dDUDJm?=
 =?utf-8?B?Y0h5dTU2M1F0azN4RU9FZjhreHZrVFFHVlJacUZFUFV3Y1h1aGlQaXpTam9q?=
 =?utf-8?B?MzhRWkhhUDVIZ2pZazhPWkhEMkJMMDBHcGYyZnE3TTVNRmY3eVF0MUhQcUtw?=
 =?utf-8?B?SzdRN1ZVbGNWZVRlR2FkWml2RmFUOER6aDkzSTd4blZNVDJLeFJma0hsWUNZ?=
 =?utf-8?B?a252YUIrY0xuYkowV216bno1bUVXVkhaU1RNWUVjZ0tlaCtmL3dDUXZMVnhE?=
 =?utf-8?B?OG94SEZiWjg4TkM1Z245ZEVGWjJyMFhwWTdvRGJIZHVZN3E5M2RVWXFocWVP?=
 =?utf-8?B?eS9uZWJNSmpqODZhN1V3Nk8wOU5ucXNVek9IdCtGK01pbkhnV0RWV2tSaU41?=
 =?utf-8?B?b3NXamhmVGI0Y3g3dGh4WjVZaGZYdGtHcmRNckRkWVRTVGV0NzNLQ3ZYMUxI?=
 =?utf-8?B?WlJKcm5CT3hBTkU3bWhYVHNWTG52VjlLdWxlbzZKNll0aENldTlmbkhxWmY4?=
 =?utf-8?B?UzBUdzh0d25zS1VuQ3JxdEE1cTZ1Sm1FbjBFVGpuQklaQmhOdkFQT2REK1V4?=
 =?utf-8?B?R2RtbDRESXpXMmc4UjhIa2VpbTg3TTI3T2tJSHA0Wkc2b1ZWekp0QzltSW1u?=
 =?utf-8?B?am9kWXFjdmtzMW5WMmNtdE9Lc1lKYXNDZXF4cVVPZEtncUFML2lZd0k3K2Vk?=
 =?utf-8?B?WE5kRTFrYXBQdFFDSUwrZXpySEZIVGczS3RubDE5VHVzQWxJY2loalhxT0Ur?=
 =?utf-8?B?ckJHRlQ2eU96d1RoM3E1RmVVelhoSVBvT2Q5Q1pybUYzSG9KcjAwUFBSNHBx?=
 =?utf-8?B?RDQzeU5zMHUvUzBPa1lOcTFsZUZCMjVKS2Jac05QMld3dTUzRUZNK1JjQlo2?=
 =?utf-8?B?Vmk0VkJiN3dnWjl2MklsaHEyd0F1eXJBVDI4Vmd2L0VCMStrbmFTQUtkQ1hW?=
 =?utf-8?B?djdWdWpOUjlxWEU0aWNqQUNVWHkzbjVVSFI3UXEyNzQ1ckttSkNzcnErcWg1?=
 =?utf-8?B?SlFnSFVCWmk1RzdRTVZyd1ZjYWdoMVBBUE1MVzBycXVVQmdLRmFoYTllRisr?=
 =?utf-8?B?a1BSY1MyWnVNZnlLN08zRmJiR0xiSHdqSnBndUVpanljK0RXRjRKVWNEQ0dY?=
 =?utf-8?B?dytFY3VSU0IvZlZYZUFSanNyUXFlcmtJN1gvMmdIRHpFZTlaTWZYMVJoUVVx?=
 =?utf-8?B?aVhSV2tGM1ZTdlEvTHNqMXpuMmdxWFNyRnJFcm5JcDVlZk5Zd0lLWFVEek5F?=
 =?utf-8?B?RXhnQTVCaDEyZ0UwSXVhKzBTUkZnMTZIRDFnT0ZGS1NrbllrZGIxLzZQNXNI?=
 =?utf-8?B?MDFKZFFGSng3ZkhKc2trcER0M0QxUy9yTmJCNUpQcWhwTEdQOWtFRjVWaGw4?=
 =?utf-8?B?Ylg4OC9Fa2orT2lSZ2ZJT3ZybUgzOUEvOFhLQWtqa29EWjV1d0kyKy9kTDc4?=
 =?utf-8?B?OGFjK2FlZ3hQeGM4UkplWXBtb3VvZHEwOUhKVWRHSXNrZkk3ZWdpckp4OWc3?=
 =?utf-8?B?dDcyL295UHJkOVo1OWV6SlIvNDFraVkxZEtnMUhSc01ubzBLUGphczBRc2lh?=
 =?utf-8?B?VnNvaGgyQ3o3Y1JBZ3VpenluU0o0TG93V1JMZzhuLzJkeFZzbnAxbzRTL1g5?=
 =?utf-8?B?SXFsTmU3d0lMKytOUkwzMVJjVms4SXlkeEtUZjlQZUVTK1dzZ2lXSXhteUI3?=
 =?utf-8?B?S2ZvVGpvYlJ1MlBtK0g4Qm5rdXVNeGlkYzVBTWFNZU5oRitTbWxLZ25FWHlq?=
 =?utf-8?Q?b0TIuVe3mNjRY9uPjsy1uQPN0?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8e7a62-b65e-423c-b926-08ddff01b9de
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 02:41:43.6288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3jj9UlTuE3qSWVVCVCmE5FZpgcmRXyeQOhF2bSVFDOM0HRwBdL6pt+adTv2xTeWvBhjCVMD1QoYA6GDRtzJLWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11722
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

Add a helper dc_fu_get_dprc() to get DPR channel for FetchUnit.
And, call it from dc_{fl,fw)_bind() to get DPR channels for
FetchLayer and FetchWarp.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Liu Ying <victor.liu@nxp.com>
---
v2:
- Collect Frank's R-b tag.
---
 drivers/gpu/drm/imx/dc/dc-fl.c |  7 ++++++-
 drivers/gpu/drm/imx/dc/dc-fu.c | 18 ++++++++++++++++++
 drivers/gpu/drm/imx/dc/dc-fu.h |  5 +++++
 drivers/gpu/drm/imx/dc/dc-fw.c |  7 ++++++-
 4 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-fl.c b/drivers/gpu/drm/imx/dc/dc-fl.c
index 3ce24c72aa13e8aa150c0152a5a1ea3d0fa90b7e..a1835f43da0dc5cf0c83d93f16658b485011e285 100644
--- a/drivers/gpu/drm/imx/dc/dc-fl.c
+++ b/drivers/gpu/drm/imx/dc/dc-fl.c
@@ -101,13 +101,18 @@ static int dc_fl_bind(struct device *dev, struct device *master, void *data)
 	void __iomem *base_cfg;
 	struct dc_fl *fl;
 	struct dc_fu *fu;
-	int i, id;
+	int ret, i, id;
 
 	fl = devm_kzalloc(dev, sizeof(*fl), GFP_KERNEL);
 	if (!fl)
 		return -ENOMEM;
 
 	fu = &fl->fu;
+	fu->dev = dev;
+
+	ret = dc_fu_get_dprc(fu);
+	if (ret)
+		return ret;
 
 	res_pec = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.c b/drivers/gpu/drm/imx/dc/dc-fu.c
index b36d3034b8d5962eaab212b6b65ebbb5c29f978c..47d436abb65157de7cab74565e44b199be76de52 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.c
+++ b/drivers/gpu/drm/imx/dc/dc-fu.c
@@ -10,6 +10,7 @@
 
 #include "dc-fu.h"
 #include "dc-pe.h"
+#include "dc-prg.h"
 
 /* STATICCONTROL */
 #define SHDLDREQSTICKY_MASK		GENMASK(31, 24)
@@ -256,3 +257,20 @@ void dc_fu_common_hw_init(struct dc_fu *fu)
 		dc_fu_set_pixel_blend_mode(fu, i);
 	}
 }
+
+int dc_fu_get_dprc(struct dc_fu *fu)
+{
+	struct dc_prg *prg;
+
+	prg = dc_prg_lookup_by_phandle(fu->dev, "fsl,prg", 0);
+	if (!prg)
+		return dev_err_probe(fu->dev, -EPROBE_DEFER,
+				     "failed to lookup PRG\n");
+
+	fu->dprc = dc_prg_get_dprc(prg);
+	if (!fu->dprc)
+		return dev_err_probe(fu->dev, -EPROBE_DEFER,
+				     "failed to get DPR channel\n");
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/imx/dc/dc-fu.h b/drivers/gpu/drm/imx/dc/dc-fu.h
index 518d1af49f5ae9d4f67da5e6c2e80abd7e962120..44b9497e53580589a05bcb180eb2312ea4449da4 100644
--- a/drivers/gpu/drm/imx/dc/dc-fu.h
+++ b/drivers/gpu/drm/imx/dc/dc-fu.h
@@ -8,11 +8,13 @@
 
 #include <linux/bitfield.h>
 #include <linux/bits.h>
+#include <linux/device.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
 
 #include <drm/drm_fourcc.h>
 
+#include "dc-dprc.h"
 #include "dc-pe.h"
 
 #define FRAC_OFFSET			0x28
@@ -99,6 +101,7 @@ struct dc_fu_ops {
 };
 
 struct dc_fu {
+	struct device *dev;
 	struct regmap *reg_pec;
 	struct regmap *reg_cfg;
 	char name[21];
@@ -114,6 +117,7 @@ struct dc_fu {
 	enum dc_link_id link_id;
 	struct dc_fu_ops ops;
 	struct dc_lb *lb;
+	struct dc_dprc *dprc;
 };
 
 extern const struct dc_fu_ops dc_fu_common_ops;
@@ -123,6 +127,7 @@ void dc_fu_get_pixel_format_shifts(struct dc_fu *fu, u32 format, u32 *shifts);
 void dc_fu_shdldreq_sticky(struct dc_fu *fu, u8 layer_mask);
 void dc_fu_set_src_bpp(struct dc_fu *fu, enum dc_fu_frac frac, unsigned int bpp);
 void dc_fu_common_hw_init(struct dc_fu *fu);
+int dc_fu_get_dprc(struct dc_fu *fu);
 
 const struct dc_fu_ops *dc_fu_get_ops(struct dc_fu *fu);
 
diff --git a/drivers/gpu/drm/imx/dc/dc-fw.c b/drivers/gpu/drm/imx/dc/dc-fw.c
index acb2d4d9e2ecd6d36dbab050f25b560d9ec9aba5..c2e60741bc871c6976ead53f132b60f19352aab3 100644
--- a/drivers/gpu/drm/imx/dc/dc-fw.c
+++ b/drivers/gpu/drm/imx/dc/dc-fw.c
@@ -131,13 +131,18 @@ static int dc_fw_bind(struct device *dev, struct device *master, void *data)
 	void __iomem *base_cfg;
 	struct dc_fw *fw;
 	struct dc_fu *fu;
-	int i, id;
+	int ret, i, id;
 
 	fw = devm_kzalloc(dev, sizeof(*fw), GFP_KERNEL);
 	if (!fw)
 		return -ENOMEM;
 
 	fu = &fw->fu;
+	fu->dev = dev;
+
+	ret = dc_fu_get_dprc(fu);
+	if (ret)
+		return ret;
 
 	base_pec = devm_platform_get_and_ioremap_resource(pdev, 0, &res_pec);
 	if (IS_ERR(base_pec))

-- 
2.34.1

