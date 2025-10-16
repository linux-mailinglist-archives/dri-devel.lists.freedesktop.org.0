Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB662BE13BA
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 04:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D7F10E2BE;
	Thu, 16 Oct 2025 02:27:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="msdXfy+E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazon11011063.outbound.protection.outlook.com [52.101.70.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3AA10E2BE
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 02:27:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yJjXPWX2nFE2f9dn1P1T7yOKCQaMRMdvtKHnwfoQTiQHcyVBbRYQXRUE4ovVPXb3d2kXn/dy02HZewqkGdanyceEdqknn/kvS7IBUFZpNRw76yknLxqr0N/9bUtmL3nalb8quqFJQgE5aHm9KGs4NIa4A6ZX94CZPhMqBT/EajHHZXu61vPooOAOglR4FzUMO/7euIpLesl9lR6Kl31FWYtEMWvC7ElLV9id77LB0dLNXlo17AMn5StG/QcFATC8kLFtwQtpdT0UCxEzUTc4ndix52qleSuFWrw6w86U832ljVABaqVQtGNe7gx2a5BRcsFpbVRefhgUhqF0ncAo6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j2Whk+/NjyAjQStInE1j/PzsTAhufFsXx6nD7f9u3/s=;
 b=eP0T+0Aus9FZx9dkxZex51a5i1dI9OurpwMzVnyI8gDjQQT01cOd8sTWQPium8llEbhgRdh7NXhusvOyjxHLqtYux0PvToJak0WBb7y/yGOisBcrUHMUG/yBN25wrnApwdTzTL36TwYs5NqT6TeIFnHtUf27KRNJOY3N+3EWKf49BbPzgr3nJOqQW37WqYTT5msqD0DuAVlwBA2nEe2u9tVGp5ZqVXsjlfqIcYz1a+VqU8GjRvVn+0zFbrQM4EROJagS88Prn2etCdnCufthdbCAvQnjnlsMZDVzeOa9lGc8L0aL2gVmb9GIr/Kf3MjZX30Rz0oUG7H2G88YFGfWRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j2Whk+/NjyAjQStInE1j/PzsTAhufFsXx6nD7f9u3/s=;
 b=msdXfy+EO+c60bspELBz5sU4Zt8xMJtSKBRCCl4DolsOuJ2wgfW7DvmHwr5o6Y1tae7WDBEybwqyL59mogPyzj7sS0P8cOAFAFe6gfu/MNNx3oLX8GxGzN2B4y3fU5zN57ew1kY1k30nVDiANQmZdq53roknHmT27u6g7ElUIztEtvBGfAUIXKWFMgFbVR/WFuc5Xt2dZaOhEswp8uBUfJrmP0vM3XibNC5VNE/uuAWor1xHxuE2w1VRiAYI4ri0qAsK1sFbn+Amds+rTPcEXyrTxXspS8opPUvGy5qTcys9mgGRiUAmLdtG9nJ/k6E49QamPj/243CDQ2dOu+VqqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI1PR04MB9955.eurprd04.prod.outlook.com (2603:10a6:800:1e1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 02:27:49 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9228.012; Thu, 16 Oct 2025
 02:27:48 +0000
Message-ID: <a9a9867c-2653-45f0-89a2-39132335aac9@nxp.com>
Date: Thu, 16 Oct 2025 10:28:08 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/39] dt-bindings: display: imx: Document i.MX95 Display
 Controller processing units
To: Marek Vasut <marek.vasut@mailbox.org>, Frank Li <Frank.li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
 <20251011170213.128907-4-marek.vasut@mailbox.org>
 <aO0tmUWA5H0J80Ov@lizhi-Precision-Tower-5810>
 <260b4db1-c02a-48a0-baf8-5e217c729824@mailbox.org>
 <e3ab9421-61a5-4ab6-8c72-6b0ab340f3a8@nxp.com>
 <ae9d1289-c0f9-47b9-b6be-e39d170425a2@mailbox.org>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <ae9d1289-c0f9-47b9-b6be-e39d170425a2@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0134.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::14) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI1PR04MB9955:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c27723a-f644-40e3-bd20-08de0c5b9711
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|19092799006|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGpWSDNLM3REMjF0cHIrWE9abHpjeGlOZWtFYkZoTWJ1UlNVK3VVUGFRSCtM?=
 =?utf-8?B?MDkySVN3Z3lTM0I1QVZwMXIwbGZnTkhLM3gwNFV2VXBUSU1abTVpekkwc0cz?=
 =?utf-8?B?anVwSGdyelVKYTF2azJ6cG9aSHZtT2VxL2oxSTZ5K3lDbGg1TlRHVWdTNTBB?=
 =?utf-8?B?NzhTTmhrWkFJUDRhSlc4V3NnVlEzN1MvczFzRnc2OFRWdkFCM0FJTW5PYlJL?=
 =?utf-8?B?TVBCSVp4TEtCSkE2elovUjM1MUtrcjFxUTRqbzNiMXg4ZExyRTEzdUdwQ1Iv?=
 =?utf-8?B?Sno4VmozeUtYdEdRNGNacUVwNnpFRXdGSTZEZkVVM240aUgxOTlSVVpuQjFC?=
 =?utf-8?B?andEa0gyb1k4Z0ZKSVl6UXZoNVBmZTdHbFVKQ3ZVYTBUS0JCb3ZtUVBGSEVv?=
 =?utf-8?B?cGIzdm51TlZKMlBEYUZDWkEvRzRFZ1BEWFNUWEwwTFZnV1d5WnYyTk5FSStO?=
 =?utf-8?B?UDVwL1JHZVdHeEt1dVA2eHVGeTM5Q1lFY05xR0l0b2d1WUJCNVdOaGRJaVhL?=
 =?utf-8?B?M0FvZEx4WFdqbXoxQVpFREVCWnlJT2dNNzZPdDgwS1Rud0U4YkM2bXpnOHNZ?=
 =?utf-8?B?MUxlZkZRam5yTFFSaGpCN2JZWmw1MWl1QmYwN2VFWlZvb0IxZit1T3g2cUJ5?=
 =?utf-8?B?R2xZWTlKSVF5akhQYWd1cnJvbkoxc252UnFWY2NyU2FBbUE4a1UxUWNWRzdO?=
 =?utf-8?B?Ym9UOEU0YXdFUnUydFYxdVV0WWRqWFFuTjJJTzBTRlJpOEovby9FQU54WFhP?=
 =?utf-8?B?R1c5elJNaVNGT0RzZHFPV012bWNkeGRSVjNsWVFvTyt5Zmt6MzhUQWlwSFFK?=
 =?utf-8?B?VGhHSlVUbWdTNmZZV0cxRXl1VmM5NmZHMXF6Q25EaXloQzEyV0RSbnA2ekJM?=
 =?utf-8?B?VWM2czFTdW1uRHlEb0tqNy9FdDJTRFByMXN1WGlIRTZOMzI2VXNZR1F0MkM3?=
 =?utf-8?B?OVRaa1RxcW1yRG9JaThOOHhiZlNjTldmeGZ4TjRySGZlenkzRzlvWnE5Ynkr?=
 =?utf-8?B?dndjcVQ3ZC9BSWl2bEM3dTNOVWFrTUdaWk90QVNqOEt1MjdnM2Jqd05LZk1Q?=
 =?utf-8?B?cW5MdEhPUG80LzFUcElIdHI4R2JJZnB1NmdjR2xyWXVSVysvM1F4Wi9aMzRB?=
 =?utf-8?B?Q1N5VTRkMGlkYkxqQ2pwWG1GV2ljMWh5Z0ZucERmdHp2cjhmWnVxaFlGc0hp?=
 =?utf-8?B?WVBhTW9XVVVucnFkd00wT2RCK2FJYXd5K2RPTUgxRDJRekNUU0grMnFVMmoz?=
 =?utf-8?B?TVUxT0orRTRRQjdLMVc3VWorMzQ2VHZEZStIWWUyYzBDTFdkVjd3VjNlb1JQ?=
 =?utf-8?B?Y2dyS05NZTduaDlxS2JDcDdxZzhxZFRzZHc2ajc4cHBzdVZBUEg5U01Gd05t?=
 =?utf-8?B?Rmo2c1RBVlVNbUI2WTFpT3Q4RnhUcy8xY052dFZobm5pVXE4Qjl6MUUyYkVk?=
 =?utf-8?B?c090TkV1dk9leWs5NFdSbCszVDNZRHArczVyMm5JQ3dmVnFVcG9MUUc4Z3I1?=
 =?utf-8?B?SjFoclhnZWFnSTFyVERUOWZIREdiWW9iWjVNZUFkUE1ZSHhkZlVSeTdDWVRw?=
 =?utf-8?B?Z05pam9aeGcrSlg2aFhUNUFibGx3WUxUSGlwVVBHMUkvTjZCNi9IRXo5R3Fo?=
 =?utf-8?B?cDNIdWR1a1V6cjJTR2xpTzMzOUFPOS9QR0FXZDI3TlV4V0VIWlVUQm9PRk1r?=
 =?utf-8?B?bVJsdkJnaFJMS05WQjJ4N2UxT09CY29OUnRFdmI5NS9CYyttTnhTUzNGZGp0?=
 =?utf-8?B?TE9PV0FuSEdiYnNGc1Rva2FtaCtXdWl2R1g1WHY2NnRNOW1UTXBIWEVnUzc0?=
 =?utf-8?B?dHI0TXNUUmNETzNyUUFVVTdlVllxVlR3Z1c0Ni9DKzc2R2ZDeTFEOTgvZkt4?=
 =?utf-8?B?SlMrcWg5UmNsSUJBUmovbVovd25CdjlGU2NHa3gwUEZRempRUEIzOUtFTU9r?=
 =?utf-8?Q?z6C1HzCkBUr5KTgSr75avULIst87ZkSt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODh3cGRRdkVoU2tBeFJrNzhNWC8wcHdySkZCZFJvaTJYT1BpNDJnclVTSGtr?=
 =?utf-8?B?bHdBelVQRzc5dFE0dEVWdXVtWmh2YkhhOCs3b3grSWozdHhhV3FNRXFpalN6?=
 =?utf-8?B?UStMMjVBdWJIU1dOZ2U5Z29Yd1g0VnlUbUNPWCs1SExTdXQ2NkNZU0MzNHpq?=
 =?utf-8?B?MDNGQVZ6Q21Id1NsUU9xR1I0SG9UN1BHdWVlSzlVSXk0Sk9rVy95Skp3emEv?=
 =?utf-8?B?RVBaOUM5aTNKMG90cVg0ejRKK3FCS0tZQmUwNGtjUzhwOHkrZHdpSXgyV3lB?=
 =?utf-8?B?NkFhdElJZmZZR0VHTnZwbCtPT3lPQVZLaDZ4WVdITFZrWGY2TXZzZUtKVnBn?=
 =?utf-8?B?ZnkvSGJ5c3duaVVPYk1RRlY5QVdrN2ZOT0pDc2ttZmhRNXhLQkRud2kySnNB?=
 =?utf-8?B?UmZ2MGoyaWxjbGVJY3IwRGhZSGhWTEdXVndPTDUzNXE3bmwzekVSUTZ5TStS?=
 =?utf-8?B?R1dZWmswMjRhOENacHV4NW8yMGpuajQrQkZURG43Z1lFbFU5b2hPRy9zcDQx?=
 =?utf-8?B?alRGYlhCaEdQQTRUelJjYkR4Q1VMMURyTWhZbXArVFVYV1ozcEorY0l1VVVn?=
 =?utf-8?B?bUk5d2k5QUU1M3paUldyUDhJM2dmY1JMM25YRkNkS01pWFp6WnRzb0dHSTlF?=
 =?utf-8?B?VG43cDNNSXhmeEk1WG56Sko4dG9SaU94TWtjTXVSajhoeTlaK3k5TEdIYXdM?=
 =?utf-8?B?bGp0ZXpjTmRMcm1LMng3MXVBRDVSQjZlS2FYZmhGRmg1ZnpQTk9ZdEZGdnBQ?=
 =?utf-8?B?RFQvemxmVktrSG9RM0FOcXFIQWJHbFZuNXNOM3U0aVpqZmdpSXVUZEw5a1k3?=
 =?utf-8?B?bjFXektPVVRKVTRQeWltdDdEMFNKcDVrTzhwSnFZZ2tWTlkyc2hkQnJsNjRQ?=
 =?utf-8?B?WWd3VUVIcWV5NHdvYU1ESWJqNFFhdVNVc3FSY0VtOEdhNEh2bmxvTk1jcjJ2?=
 =?utf-8?B?MmRMbnRMUUJTQ0o4bUpFS256c0lYaFVRRW9XalhqeG8zY2NRZm9CZ25uMnBB?=
 =?utf-8?B?T1N6ellaWEtHSEJDNmFoMW8xQlExUHJDRGtWYjc5RHhoWWZSS01zNi93eGJ3?=
 =?utf-8?B?Z09QMVEzN3h5MVI2dnBGdExjTDZIVVJYbTk0OWNFZEFKK2NZZm1rTmZGV1lE?=
 =?utf-8?B?RnFjQ29ZSVRaV0V6Q1cyZkdTL1M2dDFRVHZaSjN1VVBMSWVCRXd4MXJ6dUtn?=
 =?utf-8?B?VHNGc3J0N0ZPQUp4OSsycHlhSGpCUkMrTTB2eUY0Qm5ETFV0SDRVdlQvalBn?=
 =?utf-8?B?Y0hDYzV4REdPYnNyYkVCMnFxVi9vczd1MHJ5ZnRCeTRnMnJONmFjNmNsclZL?=
 =?utf-8?B?WFpxdzlLYmlHVHpXWnovTzVOK2NLaHplZEZlbkVHQUZjbFh1NXVCY0F1a1h2?=
 =?utf-8?B?RytpS0xkeTluaXEyOC9UTExQd3FTMkUxY1JNeDNCZ3RkUDVMQ01mZ2FLeUc3?=
 =?utf-8?B?dGNMcVZrUXVkUnE4NWR6TzdJYy9jdnhwSm1ZVU5lNWZzai9mV25pbzh3S1Qr?=
 =?utf-8?B?V3AwQi9vRjZDOEt3clBBR05tRllsWU5aK0R6Z0U5TkpWOFp6dmlid1JBN2k0?=
 =?utf-8?B?aTZNLysySjFOdGhyeUdFOVpRVEtYalpnaHM0T0pjcG9IRVgySGk5K1J4ZkNp?=
 =?utf-8?B?VVZndWY5N3h6MUdKNlhqZVRkVFcyNEgwUGZBRUhMWG02Y2hPQ2JJSENia3hr?=
 =?utf-8?B?QjBCV3RtM2ROQ3pFWmQ2djdTQzdzUFFJRGFXazNoNVZhTmswdHova1JpWW1V?=
 =?utf-8?B?SUh5a21UditZMzl1SGZCYUd0Z1dORENKOVRINVNrLzBkc3pkWlE4NGtMTm1q?=
 =?utf-8?B?d3R5R2w1Sit3c0w4NFJ3SDU2bUIweWJ4blg0bHRibTc4cU9vNlBycDl0VmZj?=
 =?utf-8?B?MVVBYmpqZ2M0dEJYMmRERDJ1eHhEc0hoV0RoaWhMUVY2YjBqR0NWT3EyR0dz?=
 =?utf-8?B?OWdTYW1xbnpjak0vZ1hqTEY0SDMwT3pCc0dmd2J5ZDJ1UjVISVR1U2x1cCs2?=
 =?utf-8?B?aWdKVnpraVo5SWt4QWNXVHVhRUl4VFFtVWY3a3pKMkJwVmQvcmVTTkJuakR2?=
 =?utf-8?B?Wll2anRHUnRuYmFYWC9PZUIwZ25teVpNTmM2aW1mNEEzY3lCQksyd1pXQ3lN?=
 =?utf-8?Q?3oV+SWHcsw1CWMAk2LO6J/Nni?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c27723a-f644-40e3-bd20-08de0c5b9711
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 02:27:48.6690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zvC0hUnsVp/fZ4IrEKLelxApfsX0FfAIRFbBSjZl0mV5SytkTpj/bsKyOtpqbE50pTbpUCiDaAZMbaZaOKgw9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9955
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

On 10/15/2025, Marek Vasut wrote:
> On 10/15/25 10:59 AM, Liu Ying wrote:
> 
> Hello Liu,

Hello,

> 
>>>>> @@ -90,13 +102,15 @@ patternProperties:
>>>>>          compatible:
>>>>>            const: fsl,imx8qxp-dc-signature
>>>>>
>>>>> -  "^tcon@[0-9a-f]+$":
>>>>> +  "^tcon(@[0-9a-f]+)?$":
>>>>
>>>> why here allow no address unit tcon?
>>> This might be something Liu can clarify too.
>>>
>>> TCON on iMX95 DPU does not seem to exist at all, or at least has no control registers. Hence no address.
>>
>> i.MX95 DC hasn't got TCON so it should not be documented for i.MX95 DC.
> 
> What DT node do I attach the pixel-mapper/pixel-interleaver to then ?

It's Dither unit which sits in the last position of an i.MX95 DC display stream.

BTW, i.MX8qxp/qm DCs haven't got any Dither unit.  The existing i.MX8qxp DC
DT bindings have already documented all units within i.MX8qxp DC(I hope I didn't
miss any unit). And TCON is the last one for i.MX8qxp/qm DC display stream.

Have you got i.MX95 DC IP spec?  If no, then it would be difficult for you to
write DT bindings for all i.MX95 DC units.  Note that this is something
necessary to do.

And, a bit more information about display pipelines in i.MX95 display domain:

Dither -> pixel interleaver -> pixel link loopback -> camera domain
                            -> pixel link -> MIPI DSI controller
                            -> pixel mapper(LDB)

Note that NXP downstream kernel wrongly adds pixel link between pixel
interleaver and pixel mapper due to ambiguous i.MX95 TRM.

-- 
Regards,
Liu Ying
