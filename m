Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFE0B8EE35
	for <lists+dri-devel@lfdr.de>; Mon, 22 Sep 2025 05:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2587110E02D;
	Mon, 22 Sep 2025 03:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="HrJ0ZWUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010043.outbound.protection.outlook.com [52.101.69.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8229510E02D
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Sep 2025 03:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vkbrz6zZvqLVMNPO+smOk3V+3Wj+8Lm55a4LdWAOgmdJPTE2OuPlCw8ZWspMham+Icy7JwtbOz/UtsbgSflOoJmaLd6uEQp0YrGpNoUEGg9Zwwc7N/LJTBtsO0c7A12F0FfAmA6CgKAHJ1MuIkW0RkVRgH/V7U6bETVbhexsR55Bsa2upaKeREmCF1rNfl6OYv99Ac5KqSHa0b8WA360Ylm2PrAcGbMqORSNmcjisvdwh0XVgpnlRXSiL1a9FRa7M9stpf+omKbkHe9grDZ+tnDmDuneV7AldQU43o9eY0xgvEDPy8iTb0v7arRPQNL3hE0StRzjgZGrwqYbFpj0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tS8px9pQrlsdgPwgmQqjcIGCzU/WcprpHaIfCSQUfI=;
 b=kSZs9hb/JCNpv+rrkZR8EmdImnY+jCkUXYTb9S1n2b9I+sNLytvX8ESxLj7dOxae21DnKypuZrSLjjhlauAOpEc23I341lJ7B3AZl1Pj7zFFvQwRekaWZcbG6OqSgdC7kZkv0uLk9bRVJRqvc1vFWRkSatmz5IHV/Gi21VhIp7hgOmFye8UHpyBmX2SOBvzipbHO+gCCjxbigGOvfsEV82wI5QWJgsRAsheQm4+HtcIgdLrmC8dT3axZHC4qknQmTzk/z4HpP3l8QnJAfD0IKmmbzaLTzP+WqJ+Pg3Gdntolv5Zw3n9FTP8bysfMYjWREEKjHQmZgfCf5Tm/HfJO1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tS8px9pQrlsdgPwgmQqjcIGCzU/WcprpHaIfCSQUfI=;
 b=HrJ0ZWUhzwZ1i8Iky6oreNp96qljEadU4Rzo65obHfb+Q9KO0Qqv9VFE1ZdjF9kmEFJzX4OE7VDWL2Px7JjAFOBQVn7tmfNeV8SJBWlc8OkbV6vPH8skdF0f+84UBE4V65O4B4cVeggd0uhj1XBgxskPYTwwOaV4KcJP6wC7I9coAipm2qAoVGq+tyhcqidk5UFR8SOBMXp1ZgKhBsCROjAkYn26SZJyeo2A/Ek2VrMabWV6ewU2WziBNyqS87e1kicprG/n9HYts4p/E4WtPMT23hRBylAqoqwRvVvbACRfSjxfuw5nioQa4AS+v50FNxaeKsW+hUEGCogCbG4oQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VE1PR04MB7246.eurprd04.prod.outlook.com (2603:10a6:800:1ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.8; Mon, 22 Sep
 2025 03:54:06 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::4609:64af:8a4b:fd64%6]) with mapi id 15.20.9160.008; Mon, 22 Sep 2025
 03:54:06 +0000
Message-ID: <cab0b98e-89fe-4ead-ba10-c399250013c3@nxp.com>
Date: Mon, 22 Sep 2025 11:55:37 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/14] drm/imx: dc: Use prefetch engine
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
 <20250704-imx8-dc-prefetch-v1-14-784c03fd645f@nxp.com>
 <aM15xwZvPRw8WOCD@lizhi-Precision-Tower-5810>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <aM15xwZvPRw8WOCD@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::20) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VE1PR04MB7246:EE_
X-MS-Office365-Filtering-Correlation-Id: faca5ae4-18b1-4717-1d0e-08ddf98badbd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|19092799006; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXdjd1FoUFRlL0pwOWRndmM3N1RZZEVhNHptaUhxNVR0MXliRlMreU82SWZ1?=
 =?utf-8?B?WFFvakJmRkNVYjMvTllPSHg1dGNWek8zeXluM2QybTYyWTIvTnNNeVc5M0dZ?=
 =?utf-8?B?TS9tYndZdzJKZmR5aHF3ZzJIK3VUblArRUpjRXZ5NVdIcmhVL0hRWXBmTGFs?=
 =?utf-8?B?R1VCTFE1b1hTOStONDdsdjB1bnJmWkl4d0ZnVWExZFdsRnpNV3pGaVFMUjV4?=
 =?utf-8?B?OVROSndOK09KSEc2bUJqbVNTcnpNaHlZVFluaDFuTjE1WVk3d2ZYNlBVcEtw?=
 =?utf-8?B?bUVqUEkyWVVSQ1VPL1lQRWk1K1lmcVR6ajRhclRxMVN5ZDNvb2cvRTFxUXRV?=
 =?utf-8?B?VkdqcWFyNVpPQ285V3MvOFAwWDNtZHlJdW9TcHhuTXlvTkFsaGl2MDk4MDJS?=
 =?utf-8?B?NFNwMm5CVzVmbS90RFlaNXp3VTV4VzhtRlc0V215L21jRVphYW16aEhDWnlY?=
 =?utf-8?B?OFRxdzQvSnovTithZE5aYXRCUkEzaVZqamVyMTZLNEJPUXFYVWpLV0IxSmVM?=
 =?utf-8?B?YXVzWlJSb0JDNWZmbkZKZnhlUlZWajVncFZTRDdQSUN6dXNsTXAxdzhoeWtZ?=
 =?utf-8?B?Qk54ZDViaWdSSGttdmhMdWMwVGxKSFcxZGtCS0hJS09wYWVrWWUvMEZuQTRo?=
 =?utf-8?B?bER3MUE4KzVBVThJYUkyUWtGSDl2V011akNwalZOMXcvbjJvOU1tbzYvZmpQ?=
 =?utf-8?B?SWd3OHdIeFFSNWlLK2M2RWZsbkU5TUlxR0ZDYjBwN0lvV0RKTGdHank2V0N1?=
 =?utf-8?B?clFrcit6WmFBTzh6bTVOaDFlTVdCMGpTRkVpc0hIRDlsQWhxSTY1MjVUV1NB?=
 =?utf-8?B?Q1FyNnFJODNINXhSWXlpQks5NDhXQ0didjliRFp0NThvck95Nk9OcGpqWW1u?=
 =?utf-8?B?cUxna040UkxKd09NdEZMbDZKbit2ejRPRmJEMXFmMlJJc3o3RDN1TGsxLzZu?=
 =?utf-8?B?eXB6NmRsV095SW9hQjhoSmU4aVFXZ2gvZzFzSWlGblNlbWNmTFI3UjBLcGo5?=
 =?utf-8?B?bzNUa2gveU10dytRTnhBRGVONTRQUmNuRzNZVjFRaWU5UTZkaVh2RXpEZ0NO?=
 =?utf-8?B?eTdvRVRXdVU3dE5kUUt5U01wd09BNGlnZ2RUdGhqZzljNVhJZk5aNzNicHlP?=
 =?utf-8?B?YS8ySmhHYlJ0OUpFNEFBdStDSHZiMURJOWI5eHptWVBVbEpjbVhtUTg2LzVr?=
 =?utf-8?B?R2EyL3RCZXZJMjM4eFNVQ2lIN2hVR1BJZkxlbFBBMFJUZUJINDlTeUo5Ymhn?=
 =?utf-8?B?M2FVNzRGaktySlJjcFcvaXhxTVJNeDBGUkRHZHE1SWlFVURhOElnY0l4dGYx?=
 =?utf-8?B?SC9td2p1NmhUL2tnYlUrVWFJak92K0dWVkdNVURpMVgzSjN5YnA5N3Y4N2xW?=
 =?utf-8?B?dlkxQ1AwVmhxTzhDWndFNmZHYjNmVEQrcTJaSEd2OFVSRXBUbGg3M1JMVVoy?=
 =?utf-8?B?QlVqQjl6SlpjVmFCYzF1bFhPakZaNjkyTHJzVU90b2MyRGlQUkNOVTlxa1NC?=
 =?utf-8?B?RkZ0S3loNUJtQmlNaS9za0lSVEUyZU1QQ0VJbEZWOVN0NjNtS2E2b1NhSkpZ?=
 =?utf-8?B?ZThhMXYvN1orK1RqK2JPNjhlTVcvRXUvR3ZRdC9mNGREUkUxWTdwN3R6QWFS?=
 =?utf-8?B?UXJiS0RJT21CY0FrQldPK2pTMXh4eUIvT0NDTDdlWngvb0FCWHBjTm9BWFBG?=
 =?utf-8?B?c3A1ZHRNTkVSNDUwUlhqaUxXMkdJejJ4NjhadktnWXlMQVA2N1MrQ0lxSFRK?=
 =?utf-8?B?OFdEa3JVSzhXbm4rTnlVZUN4VE1lZTdvTkZmeHZ1MExEZDd0clgrYVFQaUNH?=
 =?utf-8?B?SzJDOHpMWVF5MisxK05WaUl5OGRJSVBxcDduQm96a05CdUFOUUpPZWJHMjVC?=
 =?utf-8?B?WWtYTTlsRmRhZWV1bnoyNWZ3aVZac2ZsNStWazlNaXZUblN6OXJpYVkrK2dF?=
 =?utf-8?Q?oVO7Bf+oCzA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(19092799006); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TkR2SkUzazZCeHE4aCtEWm5NK3JTNjhURC9XVG5ralRyTlljbVFMT0Y2L1o1?=
 =?utf-8?B?YjN0MXU2V0M4cldma3pGK05hYjJLUVpGZnc1QlBOSDZhei9nelB3Nlo0aHJC?=
 =?utf-8?B?SDNNdTBtL3VaOVhSdElDUjcvMHBoRHRHZmFHdlRKTVRKU1VvQWRpVGRsTTlW?=
 =?utf-8?B?UUhuZ2dTbG5nb3NYRlp6SGNybElGbGZmbkk5OTdJTGtIZmNlYW1wVFg3K1BO?=
 =?utf-8?B?MTVEMzVRREtqYjdMSkJERVA3UGJoNUxyRDFXbWpuaTlwcldHbitrbCszOTEv?=
 =?utf-8?B?bmw1OStxZGVVcXJUcW1pSTRpaHpobXV5emFqakFkYjEycHovUDhlTCtnN00x?=
 =?utf-8?B?eE9zc2Qvdk9NUWczYjFnQWZ1QmpsNmNNSzJZdXlsdXBtWHZuRmVrdmZvbDh3?=
 =?utf-8?B?aEtlNjFWWUZjcUpVcVkyTjRSWWtaUTJFQmhtWGxDRzNONEtYNlljNTltdUZh?=
 =?utf-8?B?aVNaQjN4SDB1RzR5UTNENUlRMGl0Q3VDU3BpcFhENnIrTEhUbGVzMTRkeFda?=
 =?utf-8?B?dVdHcGdsOVhpK05uM2FITjNMV1ZhVWhTR21hT0JpeUlzR2pYNEZrcld5SHpW?=
 =?utf-8?B?dW40WEdCT3EwNmk5bkpkYndESGR5bVg4KzV3dkxhM294bjNMWDRLOHVDTS9Q?=
 =?utf-8?B?dHZ1bm1hZ2pwck1aTXdIeFFBMFlybmFURWFBeHVnMG5PcE5JdlJDYUJodFdG?=
 =?utf-8?B?c1RQVndRR0NRS3U4enBMamRKL2tJK1pzcy9MNmExUDJUNWVac1VOWWN2OWpV?=
 =?utf-8?B?VFd4ZDE2UzRDL0t4UFRMV0MwMHlXbUtHaXN5MVduY25ISjJTMjluUXZTMnhr?=
 =?utf-8?B?UXBRcHdRTGJXaFFtclFyUzh6QmF3Tk9sZWFVNitUZ0orNzU0aFFmUmhaS2ly?=
 =?utf-8?B?eVRwczh0c0ZWajVyQmMxNENSeFQwOHJQN0pyenYrejRzb2d5UHZmSEdOR0VK?=
 =?utf-8?B?ZXk5Nk9IeTZadlFKWjF4M1FCK3ZXWnVjZjkwT01rYUtZWnZ5SmZteTZ6YW5h?=
 =?utf-8?B?UGtSZXpHMXQ3SVZXendrWUI5QjhsZm9RY09ORnZkTjJEcGNsYzB4UlloMTBQ?=
 =?utf-8?B?MEx0aSt1emphZVYvYXFhWTBiL0NwK0JmbzdPTXQwTzVJdks5WlROS3AzV05v?=
 =?utf-8?B?bGNwVHBZNk1jYzh1ZjJuQmNCQi8wR05aZThKSThldmUzMGRkemoxVTNuRU13?=
 =?utf-8?B?NVZTNk9COGNkakdQcitEbnl1dFYxZ3VLbTJBM1RIcWh2Yk9UQ0ppK3JtQjJ4?=
 =?utf-8?B?QVhwKzZLM290MndEMitwN280NHdvV1IzeHRaNkpjbzhyWWl3V3Q4U3pxcVJ1?=
 =?utf-8?B?Uk9rYkVqYWFwbHp1UHBVN2YrWHVsS0RTcmoxVWp6R3FvQ1hHU2k5SDFieDN0?=
 =?utf-8?B?VE9QaVVsN0RacHQ4aC9xMU5UL3JGbW1pazhENy9jdzR4L0dmUUNJcUdMTUZO?=
 =?utf-8?B?UzVtV2VsZjVkcFNPdVY2ZElLTTd6NkJjNDl2a0YzenF6UldobDBNaXhsVE4w?=
 =?utf-8?B?dXgxOUNvWkltQlVIMTNNMTJna2x2OUtlTWZQalQ2eUswSW5MV0RNVWtDL3d1?=
 =?utf-8?B?blRmemQyY3BsRGFmL0VicGtwVzI3TTVFUU1EOElPOHAyR3FLZzBzenFCSURx?=
 =?utf-8?B?TGQwbmE4cTBhMEpCMk9icXNYM1NIckZ1ZHVsYmlEZ0E2Mk03QjFRcG84aEFu?=
 =?utf-8?B?S3dSeUo4SFYrU3hHOTR4a0NwNnhTUDAxc1pLTE43SmVJZ296dGpySVRMeFZ2?=
 =?utf-8?B?S0l3ZnhFaVk5NmdjelN4NHlLSWdhQUFXc1Q0eUNndFNUd2dMaWxXUUdxMFZG?=
 =?utf-8?B?RWtSQWlzUUJPSlNkL2RsMnZQR0d4L2FibFVGVS8xc1ViOWIwZktwOE5ZZzN6?=
 =?utf-8?B?Q09hQ05GcUlGbXVKUFkxbExtTzh2YXk5RVloaE9xZWxmY3Z0eDRQOWpnNklw?=
 =?utf-8?B?RHc1aUR6NUEyNHloUWhJV3M5NHRxNVJaK1c1OUkxMmJPS3M1UURkWWh0cXBK?=
 =?utf-8?B?N3dxQlJDZ3A3OVNCWDNEMk1HcWYxRkJ4VmowSmM3T1V0b3g0ZXhlOFRhT0Ex?=
 =?utf-8?B?L09EN1FoNThyVzFCK204NUxkK2hlT3hzbzVPVTFLdEVWU3dmQ005UEhVZmo2?=
 =?utf-8?Q?PYSpY4oXCTT9SWx2lD77wKOEA?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faca5ae4-18b1-4717-1d0e-08ddf98badbd
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 03:54:06.8265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QwTKhrQCvWnBXX+7lOZn0mi9vKHC56NajmHGFj9l7hey45ko0kPe4YTgYTne04d2mp9mWZ+Rm65G5ThRIFbx0g==
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
> On Fri, Jul 04, 2025 at 05:04:01PM +0800, Liu Ying wrote:
>> One prefetch engine consists of one DPR channel and one or two PRGs.
>> Each PRG handles one planar in a pixel format.  Every FetchUnit used
>> by KMS may attach to a PRG and hence use a prefetch engine.  So, to
>> simplify driver code, always use prefetch engines for FetchUnits in
>> KMS driver and avoid supporting bypassing them.  Aside from configuring
>> and disabling a prefetch engine along with a FetchUnit for atomic
>> commits, properly disable the prefetch engine at boot and adapt burst
>> size/stride fixup requirements from PRG in FetchUnit driver.
>>
>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>> ---
>>  drivers/gpu/drm/imx/dc/dc-crtc.c  | 139 +++++++++++++++++++++++++++++++++++---
>>  drivers/gpu/drm/imx/dc/dc-fu.c    |  27 +++++++-
>>  drivers/gpu/drm/imx/dc/dc-fu.h    |   2 +-
>>  drivers/gpu/drm/imx/dc/dc-kms.h   |   5 ++
>>  drivers/gpu/drm/imx/dc/dc-plane.c |  46 +++++++++++--
>>  5 files changed, 197 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/imx/dc/dc-crtc.c b/drivers/gpu/drm/imx/dc/dc-crtc.c
>> index 9e9e86cd5202bcb0bb4d5627dbcefcc3f4e2ead0..4c7aab360616cb1c84c31c83f16df703b1c2c6d7 100644
>> --- a/drivers/gpu/drm/imx/dc/dc-crtc.c
>> +++ b/drivers/gpu/drm/imx/dc/dc-crtc.c
>> @@ -25,6 +25,7 @@
>>  #include <drm/drm_vblank.h>
>>
>>  #include "dc-de.h"
>> +#include "dc-dprc.h"
>>  #include "dc-drv.h"
>>  #include "dc-kms.h"
>>  #include "dc-pe.h"
>> @@ -204,7 +205,13 @@ dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
>>  				drm_atomic_get_old_crtc_state(state, crtc);
>>  	struct drm_crtc_state *new_crtc_state =
>>  				drm_atomic_get_new_crtc_state(state, crtc);
>> +	struct drm_plane_state *old_plane_state =
>> +			drm_atomic_get_old_plane_state(state, crtc->primary);
>> +	struct drm_plane_state *new_plane_state =
>> +			drm_atomic_get_new_plane_state(state, crtc->primary);
>> +	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
>>  	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>> +	bool disabling_plane;
>>  	int idx;
>>
>>  	if (drm_atomic_crtc_needs_modeset(new_crtc_state) ||
>> @@ -216,13 +223,40 @@ dc_crtc_atomic_flush(struct drm_crtc *crtc, struct drm_atomic_state *state)
>>
>>  	enable_irq(dc_crtc->irq_ed_cont_shdload);
>>
>> -	/* flush plane update out to display */
>> -	dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
>> +	disabling_plane = drm_atomic_plane_disabling(old_plane_state,
>> +						     new_plane_state);
>> +
>> +	if (disabling_plane) {
>> +		unsigned long flags;
>> +
>> +		dc_crtc_dbg(crtc, "disabling plane\n");
>> +
>> +		/*
>> +		 * Don't relinquish CPU until DPRC REPEAT_EN is disabled and
>> +		 * sync is triggered.
>> +		 */
>> +		local_irq_save(flags);
>> +		preempt_disable();
>> +
>> +		DC_CRTC_WAIT_FOR_FRAMEGEN_FRAME_INDEX_MOVING(dc_crtc->fg);
>> +		dc_dprc_disable_repeat_en(dc_plane->fu->dprc);
>> +		/* flush plane update out to display */
>> +		dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
>> +
>> +		local_irq_restore(flags);
>> +		preempt_enable();
> 
> preempt_enable();
> local_irq_restore(flags);

Like I replied to your comment on patch 8, see
__raw_spin_lock_irqsave() and __raw_spin_unlock_irqrestore().

> 
> look symmetry() with enter this sections.

Sorry, I don't understand your point here.
Function symmetry()?  Where is it defined?

> 
>> +	} else {
>> +		/* flush plane update out to display */
>> +		dc_ed_pec_sync_trigger(dc_crtc->ed_cont);
>> +	}
>>
>>  	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(ed_cont_shdload_done);
>>
>>  	disable_irq(dc_crtc->irq_ed_cont_shdload);
>>
>> +	if (disabling_plane)
>> +		dc_dprc_disable(dc_plane->fu->dprc);
>> +
>>  	DC_CRTC_CHECK_FRAMEGEN_FIFO(dc_crtc->fg);
>>
>>  	drm_dev_exit(idx);
>> @@ -320,14 +354,33 @@ dc_crtc_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>>  	dc_crtc_queue_state_event(new_crtc_state);
>>  }
>>
> 
> ...
> 
>> +	struct drm_crtc_state *old_crtc_state =
>> +				drm_atomic_get_old_crtc_state(state, crtc);
>>  	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
>> +	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
>>  	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>>  	int idx, ret;
>>
>>  	if (!drm_dev_enter(crtc->dev, &idx))
>>  		goto out;
>>
>> -	__dc_crtc_disable_fg(crtc);
>> +	enable_irq(dc_crtc->irq_dec_seqcomplete);
>> +
>> +	if (old_crtc_state->plane_mask)
>> +		__dc_crtc_disable_fg_along_with_dprc_repeat_en(crtc);
>> +	else
>> +		dc_fg_disable(dc_crtc->fg);
>> +
>> +	DC_CRTC_WAIT_FOR_COMPLETION_TIMEOUT(dec_seqcomplete_done);
>> +	disable_irq(dc_crtc->irq_dec_seqcomplete);
> 
> Are you sure irq is disabled when call this function?

Same here, I don't get your point/question.

If you mean IRQ dc_crtc->irq_dec_seqcomplete, then it's disabled after
calling this function.

> 
> Frank
>> +
>> +	if (old_crtc_state->plane_mask)
>> +		dc_dprc_disable(dc_plane->fu->dprc);
>> +
>>  	dc_fg_disable_clock(dc_crtc->fg);
>>
>>  	/* request pixel engine power-off as plane is off too */
>> @@ -373,7 +441,10 @@ dc_crtc_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
>>  void dc_crtc_disable_at_boot(struct drm_crtc *crtc)
>>  {
>>  	struct dc_drm_device *dc_drm = to_dc_drm_device(crtc->dev);
>> +	struct dc_plane *dc_plane = to_dc_plane(crtc->primary);
>>  	struct dc_crtc *dc_crtc = to_dc_crtc(crtc);
>> +	enum dc_link_id ed_src, lb_sec;
>> +	bool disable_dprc = false;
>>  	int ret;
>>
>>  	ret = pm_runtime_resume_and_get(dc_crtc->de->dev);
> ...
> 
>>  	fu_ops->set_src_buf_dimensions(fu, DC_FETCHUNIT_FRAC0, src_w, src_h);
>>  	fu_ops->set_fmt(fu, DC_FETCHUNIT_FRAC0, fb->format);
>>  	fu_ops->set_framedimensions(fu, src_w, src_h);
>> @@ -161,6 +190,9 @@ dc_plane_atomic_update(struct drm_plane *plane, struct drm_atomic_state *state)
>>
>>  	dc_plane_dbg(plane, "uses %s\n", fu_ops->get_name(fu));
>>
>> +	dc_dprc_configure(fu->dprc, new_state->crtc->index, src_w, src_h,
>> +			  fb->pitches[0], fb->format, baseaddr, prefetch_start);
>> +
>>  	dc_lb_pec_dynamic_prim_sel(lb, dc_cf_get_link_id(dplane->cf));
>>  	dc_lb_pec_dynamic_sec_sel(lb, fu_ops->get_link_id(fu));
>>  	dc_lb_mode(lb, LB_BLEND);
>>
>> --
>> 2.34.1
>>


-- 
Regards,
Liu Ying
