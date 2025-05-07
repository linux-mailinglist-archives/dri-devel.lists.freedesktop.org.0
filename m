Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59E8DAAD315
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 04:09:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DF610E086;
	Wed,  7 May 2025 02:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ezU5YX80";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DU2PR03CU002.outbound.protection.outlook.com
 (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6583110E008;
 Wed,  7 May 2025 02:09:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qvpct39xItn2Fl0mg069IL9drsU0KnozqaudfpQaWfA7BQSYKCBNUJq/F7qODfxKe8IBTj94c7K7UtJpSqiWXLNZHU0/7wx6OiiEb0psYPvuVkLmeeUYnmUue0IChc1jMxHdAeLolIGWtWfzNTP6tiSrgWXx66HtpJ5YkVnK/9IX3LdIk0IJ2h30MZMzVxAuKFKQVH5gH0xBwFhVtMgV2llvbFHEzHp6OI5if83hbfkRHaYTipbCdUPiWGDzoIee9BNk+76gKuDZmYET05Kwbv4fpGDTeXRtomVpONHELKlkD63SSrkVrvFker/nrNwa5AVXVOowEhmXMUBtDjNMVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oPZDP7TEfq1v3QC18bv8n5+lCOSiLnfRAk3Eyz89Ps=;
 b=s66lJlCAxAujtbMgPXhTET960mXnJe+jXPzWx1VkSNc8yNlVFDDSO3kdCBXUX4hzv9pBCef5OLY74dRs9uXfgNGdD7XGQYwQ7RbSA30zx+2OpNCBdp6r0Us3UjdWPvV7qghdQHq9lBWXkSZFc75RmBZeE3c8kAGPvx+tvH1YNIjVDEWDjL5shB71qI+ImAjCTjQAVAyQpqARb0XHokwthfxQzMiW5eXSbUbOlEQJyJMYG2qU2gk3lpopvzD37m4vqV2lgGk4hgaoZ3w3Edd7kWqdaXRFcqBZ5e9mGhNLCfp5HsI5l07YThHDU1Qxi/bRWwg7suVJvQMMkW60/kgVsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oPZDP7TEfq1v3QC18bv8n5+lCOSiLnfRAk3Eyz89Ps=;
 b=ezU5YX80JIBw+rxgN/zmmd5LD2B03AE1+/oNXNgWO96I8Vre/dqNkQQnpm9N/aVcQ++14iwO0FePlxhOO1uMq3ZbsWbatjUYIs5zepRbmX5l2a1joEvJ7TaIx6EneCoSNsBfTm+wy6nRaayr4t+2NfePiHAfpmLGBkMbEIJttAusj9KGx4UWw8G9en/vJ0186FKlE4OW8EewFQ5rijpWAqhO9eGEx/E4ictfW6g5tuIiCTLsDCdBCKycRVO8EB9IITi//EPqE06e6hYyvZUbwOWUT5q2lgg8GNjwiLsdC3A7EnTpUPy0FEui8KCaEgcJzUisUyrYk1/QgSL9MYTe0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DUZPR04MB9871.eurprd04.prod.outlook.com (2603:10a6:10:4b1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 02:09:26 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 02:09:26 +0000
Message-ID: <a1abf31a-7a4a-4f8d-bf48-6b826aa01197@nxp.com>
Date: Wed, 7 May 2025 10:10:53 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/34] drm/bridge: imx8qxp-pixel-combiner: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Douglas Anderson
 <dianders@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa
 <asrivats@redhat.com>, Paul Kocialkowski <paulk@sys-base.io>,
 Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-30-8f91a404d86b@bootlin.com>
 <553d62ed-976a-4e17-9678-cdc3d40ce4a7@nxp.com>
 <20250430112944.1b39caab@booty>
 <f71d18d2-4271-4bb9-b54f-0e5a585778f3@nxp.com>
 <20250506224720.5cbcf3e1@booty>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250506224720.5cbcf3e1@booty>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR02CA0003.apcprd02.prod.outlook.com
 (2603:1096:4:194::13) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|DUZPR04MB9871:EE_
X-MS-Office365-Filtering-Correlation-Id: f7d10060-12c8-4876-c928-08dd8d0c311f
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OURvVytqemkvWkZ3dlVuYUFCeDM1bDliSFlqR1dvekM3bXZwNG4wanhjQXBY?=
 =?utf-8?B?UTBQeVAwWWMzb1c5ZHJnWUgwWndJaDJPQXNqVHA0YzFRNi9ydEg4UUU5bWV2?=
 =?utf-8?B?R0lWNFdtWjIrMlh3TTNqM0RpUEl1UC9IdDkxMXJrWnMwNmwwRzB3ZzdNOGQy?=
 =?utf-8?B?OVg5bThQcktqSW1EbDNsVWdRdm1FenhuM2E1bTQ3MXZzaTBnZXlub0FvK0tN?=
 =?utf-8?B?MXBFOXJPcy8rZjhRU09paHJURzlZQVQ4aVo1dFl2cXpGZ2grdk1PUmVmZlRP?=
 =?utf-8?B?YzVpVlBhcHJwQUhvU3puT3VKMFQ4ZEdHTzVMZ0ZzQlFxV01tTXdaVkZxeE9D?=
 =?utf-8?B?QnMxTnI4QXJuOVFidXl2T3RPcHRsQ2hob2oxRTJycHJXT2t2emZ6eHdYWWdO?=
 =?utf-8?B?Y3JnTCtrWVZwRGhlTVJjVFdGTEJXeUwvY3ZQek5XTEExUmwxM1loVk9jMXB6?=
 =?utf-8?B?dDhTc2I4QUVKbjFoM3ZwcDkzWThhN2lmNmZhNm1HbngzUzZlMnF4Z290M3F5?=
 =?utf-8?B?K3hzZjQxMDV5S0R2Q2ExaHd2SUJNT3JJeHFtRVd5ZUhaS2RVRXRkRnhYeVE5?=
 =?utf-8?B?VGZ1cm1aTHpUdFFVekIwL2xuT0hwbmEzUUlzVHlvK1NXLzdScyt1NnpvSi90?=
 =?utf-8?B?eVBCQmpDeEt4VEVGOGlZcFlyWFF6SGgxWkk0dklPYkp6MC9veERnalk0OTdi?=
 =?utf-8?B?OW9PM1NBWUFoS3lEVCt2d3dMekYrekV0S2grazdLS0pBYVFGWERxM2lLU2V6?=
 =?utf-8?B?RTR2K2RLazN3d1VmR1FYWGZ3VUs5L0NsZkRzRHp2MmNzaUpycVRnaFpMY3Ji?=
 =?utf-8?B?SUVMMkgwUkV4V3lMVDduOVI5UWZydWRUWHNPOEQ3RkdUOWNla3J1WDNUVXI2?=
 =?utf-8?B?bjUwVVJRMk8zdDNTcndYUzdOVlRIaHpCSS9uYmMxd1d6c1ZDY1pwVFlXR3pS?=
 =?utf-8?B?UERmeEVQOVJyQlBvaGNwckdhTk5IS0hqMXlaOXhRSnZ6ZzZ3TmtZWVZiN09E?=
 =?utf-8?B?SHhxSFRoRExUOHgvbWN6YW90aDhZWHZpdThQNjNZT3lsQ2lYaUFpVFdsMTYx?=
 =?utf-8?B?cWgwNVo3Mk55djEzZVVJVmxqVEdGMTNlR3MyQmJ5dEdOMjlsUmRuVDcrdGdP?=
 =?utf-8?B?OU9sZml0REhmdTU3ancxL3NoYTF6a0RJa0YxUm8yN0RDTVE5MEZlZ3FZOGlP?=
 =?utf-8?B?VG90ZUg3M3BScGRaWTltckNBYTlNUmRXYUIxOWdwRVdWM2UybmNkOGlWVWZl?=
 =?utf-8?B?UUNlaVFMcUFIdDF2M1A0NnduS2wvMkptMDU0QVVjelZqaHBTZTRORHdhWlFm?=
 =?utf-8?B?OWsvQm1QU2NEeHpWby9NbVk5dTRGYm5aS1RhdVk1cDczVDRNYVMxdW9aN1Bi?=
 =?utf-8?B?R0VUZ0tYdzRMVE1zcmhZZ3RPUURqdWZDQm9XVHF3c1lwbGRUMjRUaHlJM21I?=
 =?utf-8?B?YTc1bTJ5aFREMFRsK0xUTHJmRFZCMUpsc21BMjhGbzFDeEtWZ0JQTFhPTDV4?=
 =?utf-8?B?aFZEdEZTbHRqbG1ycnEvNTEzbklDTVZyaEhSVHNDVjZEWGptL3hRM2pyL2xr?=
 =?utf-8?B?WGlReSt4NW9IbnJjTnZPVFMrNk1Camt3VjdSMnQ0RldzZmQwQ2FGL0pHcnlw?=
 =?utf-8?B?NHFnMnV1Q1lLVlZvdVFrSEJOWXNQMlBxN3hGOWU1ZUR3d3NNVjNtRmlOVll2?=
 =?utf-8?B?M1hWbXQ5c0ViU3VEUXMwRHZwWWhpQVE1SndCVjFRTmpVdGEwY3U2aHhBeUxs?=
 =?utf-8?B?VGZHcXAwbzV4Z0RCYWwrdVBwRXVtV0huektMQVBnYmp3Y1VRNCsyWmhvMFNh?=
 =?utf-8?B?M3hnWWJrSlM0QTgxRGp0cUlFdUJZWi9lL0xCaHVXNGFwOXZtUUhPZVZIbWRQ?=
 =?utf-8?B?OXpySmd2dk1xTURmbTBEb0Fwem1FSHh2OFpwRW1mUFZFb1RmTUhiQWptdUxS?=
 =?utf-8?Q?zEHK4LgEj8I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2NqZmozMjdtVnBvZVBFQlAyeTVOUFJZemlndHc0MlcydDg2VmthOTBiYlAv?=
 =?utf-8?B?SFpwdjRNMld6eXhOUk5MODhrSnRYd1Ewc1Q2dnR2dUxiSUFSamJha3U5Zy9u?=
 =?utf-8?B?UHB2K01jYUR4S3AzOFJ5MDFwMVhDbWthQ1ZjdE8yd21LYzhod2NCYnd4dHpU?=
 =?utf-8?B?ZUtBN0VwU0l5WWZFTUJHc0Z1UDB4YzNmNStuL0hkdFlXam1VMkNFaDBsSEJu?=
 =?utf-8?B?aTFYNG5UUWN1NWptRUY1NjQvdlRaL2xML0I1ZklqUmpEMWkrNzBjRDArbzlo?=
 =?utf-8?B?Q09JbnZ1cWN4R2NBREFJU1hCY0dJeFU0b2pyZC8xVTNwTnljYUlQZFliWk9I?=
 =?utf-8?B?OXlpYUJNaUw4Uk5TbXpMWG0yb09LSktWa0s4clFDT3d1TVBEdDRLWTZ1SzBD?=
 =?utf-8?B?ZjNUY0tNdEFsTE1XL2FUemV5YWswbVpsK0daaytpZFdpQlNYVHJiWVE3ZTZl?=
 =?utf-8?B?SkJIenV1UjdxV2lVdGo3UmhkaWhYekMvcjFRaDNidFpMQ0gyUWRzTTN3YTZj?=
 =?utf-8?B?RlJMUnBQMzA1T2JNaVNmVXhGT21WL3FUM0NRbldwNkNPNzdPd1VBaE1GQU11?=
 =?utf-8?B?c0NtQSsxZDYwclYvUWg0a09SZHJlQnNXWlZ3RjZ5ZmsyUVdxVmtOanFJUE1S?=
 =?utf-8?B?YlFPdVcrcVZ3clFrT2p5NUR1Q0c3VnRzODFOTGgrczZ6UzZ2NXIwbS82cmdJ?=
 =?utf-8?B?TnlraFBjc3NmckVlVmVkaEhBODYrcjBIaTJqSEcrYXUyQVN1QmhqdndEbWFZ?=
 =?utf-8?B?ZE9YUmVZWFFMaFI4cUozK3B4Ym5hcm5pcFRMVGZoQ0gxRXhsR1dHSFF4UWRo?=
 =?utf-8?B?VmhnUnQ1cnNMb2JPVm41S3lzRFp1R1RDcXNINWFSSTdmdDlDVVM1Q2lXeVhO?=
 =?utf-8?B?WjFScjlTVUhsOStpOTY1UjNoSi9xMFFHSEs3RUpoSFRNdGxoRjZuNG9FM1Na?=
 =?utf-8?B?bUVtSnJtbG40NE5HSEx2WTdmWkhJck93TDFFNytXcmNjcTlPa041ZEtXbXYw?=
 =?utf-8?B?TlREQi92Sys1a2g3MVF0SExteGNrZDJPVS9sb2tsQWsyWFJOTVhDeThlVkpl?=
 =?utf-8?B?QU9TOVFqYkhTekE2STZsUkJIeEJqWVM3aWVOOWNudENXU1R1VUxzU2R3NmR2?=
 =?utf-8?B?dFBnT1dXUWlqVHVkNXg2VmZWS2hkbzhRdlpuMlU0b09PV1lZNll5V2FhSFdz?=
 =?utf-8?B?RUg4Ukh1WG5JSXdjMlZ1SE5aVllzdzljazRNRnFOS2RuaGJuR3MzWExIWitT?=
 =?utf-8?B?bm1iOUtuTnRmbkxYUlIxV1BzMVBYOU1uVnRIUUdkbGRNR0NTOWl2R0xvMWZV?=
 =?utf-8?B?dW5LZGJEOTJybG5QSEo4KzFEcVBNV2N0aWdVRHloUkU5R0xPM1h1ZjJxckYv?=
 =?utf-8?B?R1NNUDRKTTdLZ1NpeTUxZDdZQTBYRzVmeUp3V2JyUUxmNmN5YlUxVUhGcnRZ?=
 =?utf-8?B?NTRMUlJlcmxJNzVLaXdKWmhPZVFqOXpqVEJKeHhmRWd3b25SeDd1TzBxN3p3?=
 =?utf-8?B?aTY1d0RBTDdtL1dtNWlXOUt1V2ZOZjJUczB6STN6cUdwUXhVMlRNaXB3cEll?=
 =?utf-8?B?T2x1aXVxY09wT3l1RTJ2cUw4Yk1OOUxaamkwcm9sd3pqL1RrRlpEQmV1TmxR?=
 =?utf-8?B?bGxsaEs3TE1iNEdtc0NvRlhTZ1JESlArcmpIMHJ2QnBILzA1dkhpdWZ3U1pJ?=
 =?utf-8?B?VFhMeU0yK1BmWEhIRDF3SXh3cXFKTlUvcmMwaUJyc3AvMVBtQjBzZnlkNkNi?=
 =?utf-8?B?VlBRSkN1Q0Vrdm9STzdXc21SMXN5VkRLb0JPNDd5M1V4N2N5TU4yb2dPRW5F?=
 =?utf-8?B?Zzl6VjRRdWJJZlJLMjRVbWZzcmZXWDJ5aWFFclpLRElHK01OaFo2c2FJSjBM?=
 =?utf-8?B?OHZjU1RKUHIrZ1p5ZTM2MndJT2pFTHFTM2VlK0N0NVpqWXlrVXNWclBidU5y?=
 =?utf-8?B?UGRodnRtaGVBSHBjdFF1amhGZlN0dkpMYjI2a3lselFWZHpMWWMxOXVIRlVo?=
 =?utf-8?B?eW1CYmhxaklucFdlbVljLzJOaHU1dHRIS3hRK1pJRENPVGlkNmFROGU4UDBE?=
 =?utf-8?B?L05TZjZFZ2IrNFFHcjREK1VYalFkNkc3MTVkcHgrNDRXTHFuZ0lBVFF0MlpT?=
 =?utf-8?Q?xWijsSiQRplhPTw3v4LGwYjwb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7d10060-12c8-4876-c928-08dd8d0c311f
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 02:09:26.1872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jW1yPPGdkKuB0qZoM53x1eWti5AAqMOfcwX+wpUSHs6taltSTO8DoNMC4HDEaWXVAR8uRUY8pB7XoSoK0QD+zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9871
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

On 05/07/2025, Luca Ceresoli wrote:
> Hello Liu,

Hi Luca,

> 
> thanks for your further feedback.
> 
> On Tue, 6 May 2025 10:24:18 +0800
> Liu Ying <victor.liu@nxp.com> wrote:
> 
>> On 04/30/2025, Luca Ceresoli wrote:
>>> Hello Liu,  
>>
>> Hi Luca,
>>
>>>
>>> On Tue, 29 Apr 2025 10:10:55 +0800
>>> Liu Ying <victor.liu@nxp.com> wrote:
>>>   
>>>> Hi,
>>>>
>>>> On 04/25/2025, Luca Ceresoli wrote:  
>>>>> This is the new API for allocating DRM bridges.
>>>>>
>>>>> This driver embeds an array of channels in the main struct, and each
>>>>> channel embeds a drm_bridge. This prevents dynamic, refcount-based
>>>>> deallocation of the bridges.
>>>>>
>>>>> To make the new, dynamic bridge allocation possible:
>>>>>
>>>>>  * change the array of channels into an array of channel pointers
>>>>>  * allocate each channel using devm_drm_bridge_alloc()
>>>>>  * adapt the code wherever using the channels
>>>>>
>>>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>  
>>>
>>> [...]
>>>   
>>>>> @@ -345,8 +351,8 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>>>>>  free_child:
>>>>>  	of_node_put(child);
>>>>>  
>>>>> -	if (i == 1 && pc->ch[0].next_bridge)
>>>>> -		drm_bridge_remove(&pc->ch[0].bridge);
>>>>> +	if (i == 1 && pc->ch[0]->next_bridge)    
>>>>
>>>> Since this patch makes pc->ch[0] and pc->ch[1] be allocated separately,
>>>> pc->ch[0] could be NULL if channel0 is not available, hence a NULL pointer
>>>> dereference here...  
>>>
>>> See below for this.
>>>   
>>>>> +		drm_bridge_remove(&pc->ch[0]->bridge);
>>>>>  
>>>>>  	pm_runtime_disable(dev);
>>>>>  	return ret;
>>>>> @@ -359,7 +365,7 @@ static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
>>>>>  	int i;
>>>>>  
>>>>>  	for (i = 0; i < 2; i++) {
>>>>> -		ch = &pc->ch[i];
>>>>> +		ch = pc->ch[i];
>>>>>  
>>>>>  		if (!ch->is_available)    
>>>>
>>>> ...and here too.  
>>>
>>> This is indeed a bug, I should have checked the pointer for being
>>> non-NULL.
>>>
>>> Looking at that more closely, I think the is_available flag can be
>>> entirely removed now. The allocation itself (ch != NULL) now is
>>> equivalent. Do you think my reasoning is correct?
>>>
>>> Ouch! After writing the previous paragraph I realized you proposed this
>>> a few lines below! OK, removing is_available. :)
>>>
>>> [...]
>>>   
>>>> On top of this patch series, this issue doesn't happen if I apply the below
>>>> change:  
>>>
>>> [...]
>>>   
>>>> @@ -351,7 +349,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>>>>  free_child:
>>>>         of_node_put(child);
>>>>  
>>>> -       if (i == 1 && pc->ch[0]->next_bridge)
>>>> +       if (i == 1 && pc->ch[0])
>>>>                 drm_bridge_remove(&pc->ch[0]->bridge);  
>>>
>>> Unrelated to this patch, but as I looked at it more in depth now, I'm
>>> not sure this whole logic is robust, even in the original code.
>>>
>>> The 'i == 1' check here seems to mean "if some error happened when
>>> handling channel@1, that means channel@0 was successfully initialized,
>>> so let's clean up channel 0".
>>>
>>> However my understanding of the bindings is that device tree is allowed
>>> to have the channel@1 node before the channel@0 node (or even channel@1
>>> without channel@0, but that's less problematic here).
>>>
>>> In such case (channel@1 before channel@0), this would happen:
>>>
>>>  1. alloc and init ch[1], all OK
>>>  2. alloc and init ch[0], an error happens
>>>     (e.g. of_graph_get_remote_node() fails)
>>>
>>> So we'd reach the free_child: label, and we should call
>>> drm_bridge_remove() for ch[1]->bridge, but there's no code to do that.
>>>
>>> To be robust in such a case, I think both channels need to be checked
>>> independently, as the status of one does not imply the status of the
>>> other. E.g.:
>>>
>>>   for (i = 0; i < 2; i++)
>>>       if (pc->ch[i] && pc->ch[i]->next_bridge)
>>>           drm_bridge_remove(&pc->ch[i]->bridge);
>>>
>>> (which is similar to what .remove() does after the changes discussed in
>>> this thread, and which I have queued for v3)
>>>
>>> What's your opinion? Do you think I missed anything?  
>>
>> The pixel combiner DT node would be added in imx8-ss-dc{0,1}.dtsi, please
>> see the case for imx8-ss-dc0.dtsi introduced by an in-flight patch[1].  As
>> channel@{0,1} child nodes always exist(DT overlay cannot effectively delete
>> any of them) and channel@0 always comes first, there is no problematic case.
> 
> I'm not questioning what existing and future dts files (will) contain,
> and surely I don't see a good reason someone would write channel@1
> before channel@0.
> 
> My point is:
> 
>  - the bindings _allow_ channel1 before channel@0
>  - the error management code after the free_child label won't work
>    correctly if channel1 is before channel@0 in the device tree
> 
> IOW the driver is not robust against all legal device tree descriptions,
> and it could be easily made robust using the example code in my
> previous e-mail (quoted a few lines above).
> 
> If you agree about this I'll be happy to send a patch doing that change.
> If you think I'm wrong, I won't fight a battle. This topic is
> orthogonal to the change I'm introducing in this patch, and I can
> continue the conversion independently from this discussion.

I don't think it is necessary to do that change for now.  When someone
really comes across this issue, we may make the error management code
robust.

> 
>>> Thanks for taking the time to dig into this!  
>>
>> After looking into this patch and patch 31(though I've already provided my A-b)
>> more closely, I think the imx8qxp_pc and imx8{qm,qxp}_ldb main structures
>> should have the same life time with the embedded DRM bridges, because for
>> example the clk_apb clock in struct imx8qxp_pc would be accessed by the
>> imx8qxp_pc_bridge_mode_set DRM bridge callback.  But, IIUC, your patches extend
>> the life time for the embedded channel/bridge structures only, but not for the
>> main structures.  What do you think ?
> 
> I see you concern, but I'm sure the change I'm introducing is not
> creating the problem you are concerned about.
> 
> The key aspect is that my patch is merely changing the lifetime of the
> _allocation_ of the drm_bridge, not its usage. On drm_bridge_remove()
> the bridge is removed from its encoder chain and it is completely not
> reachable, both before and after my patch. With my patch it is not
> freed immediately, but it's just a piece of "wasted" memory that is
> still allocated until elsewhere in the kernel there are pointers to it,
> to avoid use-after-free.
> 
> With this explanation, do you think my patch is correct (after fixing
> the bug we already discussed of course)?

I tend to say your patch is not correct because we'll eventually make sure
that removing a bridge module is safe when doing atomic commit, which means
the main structures should have the same life time with the DRM bridges.

> 
> Best regards,
> Luca
> 

-- 
Regards,
Liu Ying
