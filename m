Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44672AADC51
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 12:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5856710E00C;
	Wed,  7 May 2025 10:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="K4HsFJ55";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2054.outbound.protection.outlook.com [40.107.105.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74D6310E00C;
 Wed,  7 May 2025 10:15:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PKMfry3Q/ax629yNHP0dEQIUXvpYeGe1Dc3CltBIuH4kgkslsNqSSVLQ/+maEhEIBDGfDJz13O2EMudNo/E+5pj9EbS2/HcPmrzNGjlbymM/DWWlSzVCw+82sZ1K9soE3CVao4t0Q3LYlDFj+w7iVyaNo3YH4zA4WkU4tEmmSgj0j0BBjqgSmVzSwA8YHbM8zsIkuDXpSznArAiCbHKlCgPEh/ijb+4N619TSMorHcqoJVSM5ilsQ4jvEjPT+nEm5i6HMqWjoUpyaaTEPnloVmD7Cyd0l+no0xm9LdWieoQogHK4D3hGRSgMHCVoLNMa9XmnMTZkJXPiiZRs1Tdc/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RycThhcPl47BOso6w6PXZNCz38cRrbsQKA/1KF2WhAI=;
 b=ebwi+n1GE4crR2mhNVVGny+CnakhRUbhqrEHOk+MV6EeknSFSD959LG+eCo5363k50eEgWUC9jR4hY/YWCKWSgnfSACq0ijXp/cQsCSMErlpFRtHPZbH0SRP8PfjiQJrtNjgTOerSdPVXl5wqfj5RFj9GwI3F+h85CVHlBp9SXDOCjyBydr2pDrnTbRvHesHt+kCuFIHFAfRvaD1KqEdDhx+kGMyNMaPtnWPGQCizdpHsK+hqyCT53Se6xVeIMyAOnlfa+D+x/3DN/e1WhbqEPRApGT/V792L9K3e+e9qTVf7V9yI8LHnzwrMPW2jNOPFq/4NgHYIc4Xdp55dcuLLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RycThhcPl47BOso6w6PXZNCz38cRrbsQKA/1KF2WhAI=;
 b=K4HsFJ55zIJYoChsi6ALUf9sGxcozqiqPQ2ia4sQAySmuzi/vhOYqAgnRYGjtUbWV0KI9OezC5HpB/iv0EcxL5I6v7ixMl59Gn1A9urpXD0g7DASrlGDGSxGfNRiMFWfy6VntEKu/g2VgjHLUYy/lMfLpfCNgNicL8hU3EhAIMuitAYVlECgcLUuX5kiZilgUZF5sTv2QDILV5fLfawsU0ehElRWzjOa3cl4RnWV5CyKwDU9SQhTDLTkQT7iV/pMDtQrmLQmJky2SusCBoaMLUOfeNhSVRQHicX05EBdKDqrqIGHX4eJaUFnhGGNIRPl5+8+h0l2rHmZqL3fPeJvQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM9PR04MB7634.eurprd04.prod.outlook.com (2603:10a6:20b:2d5::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 10:15:03 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 10:15:03 +0000
Message-ID: <430d497d-45a1-436d-91fd-635854f80c9f@nxp.com>
Date: Wed, 7 May 2025 18:16:28 +0800
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
 <a1abf31a-7a4a-4f8d-bf48-6b826aa01197@nxp.com>
 <20250507091244.32865a71@booty>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250507091244.32865a71@booty>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SG2PR04CA0201.apcprd04.prod.outlook.com
 (2603:1096:4:187::23) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM9PR04MB7634:EE_
X-MS-Office365-Filtering-Correlation-Id: 74ae9de8-a71c-4d3a-b33c-08dd8d500822
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cXJ2S0lpa01Ucy9VVVlWMVo4TlpDcTRaazF1emV6VkljU25MUVFiS2lIbHRr?=
 =?utf-8?B?V3R3REo4d01WRkVHYWhMZ0h1WHRRRHFQdW80M3FlVkV3SG9pbWNvZlVKVC9B?=
 =?utf-8?B?b0VzOW9iNWpiUkljNVRtWWNJSkt3aCtoNTJ3bHFRWDl0N2doQ2hod2JnQmRE?=
 =?utf-8?B?Z0lnaXk1QUEvK2N6YU93bUFBZUJVemhOL0tqeFpmMm5ESThpU1JwbVh5NXl1?=
 =?utf-8?B?MEIzVkRrSVY1VFRaL2wrcTcrQ2llMVNGempnanNsem51MWRPbzExN2hKZ1pu?=
 =?utf-8?B?Q3l6bDRXanRJMlBGRlYzQTNsQ2tYWmg4dEhJTDIxVHdVbzZ2TUtwTi9GMVR6?=
 =?utf-8?B?Ukt5Z1MxR1lFYjBCQ2piNXpnL0txRFlyK2lEVlBxVWFJZ0pyNHhOU0JleUl5?=
 =?utf-8?B?WlRzZjVxWkRMRHNNclpvUVZDdm13WitsZHRwYU9OSTVkUlpwWklFNFB5d05l?=
 =?utf-8?B?cmR5VWZ4RzR4eThWRnl5Q3VpeVVIOFNqY05GNVVkM25pcCsyZ01uV21DUGx5?=
 =?utf-8?B?TG11a2haeVlNVTNLNlVVUXUvaWFrdGJ0aklOek5jcGNxNlVyVVhxdmxCdDBX?=
 =?utf-8?B?d3JCS00rUWRObzZDUmJENEcrdDNKL1NTVGF5SytvS21yc3MwRVV4UnRxbHo3?=
 =?utf-8?B?R2x4R2tMTDlySURwR3hmQTlvUXVuRmNWMFZDendETURkWjVkcE5SSEhRckIx?=
 =?utf-8?B?ZlVQNDluWWZOR2paaUxjam9RS2dZTUNmTklsWitZb0hFbDFPdDNGM0pncHht?=
 =?utf-8?B?YVJlNExVbldWRHE1OXJjZmtwNTBPY1g5S3IxZDZCYmNZTUhxTVhzSExuT1VH?=
 =?utf-8?B?VHo2NlVCM3Boc29qdmp0RlQ3VjBoRnBHd0tiZlZocHdDMTJ0dVU2blRRK2dR?=
 =?utf-8?B?a3YwVXdJVDgvdWQ5cUFrRjRLR1RiOVZYbVM5TEZwWlhoUUVudHgzeEljaWxT?=
 =?utf-8?B?YjdKdnAvb1RKWWZzZGpkTDdEUW9oRjBuU2l2ei8vR3R5ZURyQzdRcnNFNzkr?=
 =?utf-8?B?cHlnMU90WkdOeC9GTFRFZ0lZbW4yN0tyQzFoUkZTcUxKMllNdGhFY0tYSDR5?=
 =?utf-8?B?MC9kSVJ6MDc5RDdmWUVZeHloYzh1NHA1QXNGQnYrcjdpSitRK1Z0dU1vbHo1?=
 =?utf-8?B?cGxmNnMzU3FYYUxJRUJpdFZNRnQ0Z3czcjQvRUNUSUhBVUN1YVBabkcvRno1?=
 =?utf-8?B?UVFtSmFFM0NBeUNyRTYxdHNMOXRrdUZpMjN4ajByZVFGVm5FalAvZ1E2VVJS?=
 =?utf-8?B?aFJVNlR1dytRNy9XRDFkNERlSkE3UEZNYkJrWEZhZ2NBZHlMUTVucFNXSkVJ?=
 =?utf-8?B?YnhKM1VrdElaRHVkVGpzYVE0OTRkZWNDSXNTTnBUN1piaVVQZFhOS2RtNWw0?=
 =?utf-8?B?T0lHNFBtbUlSRVBzRUZDcEY3QlkzUlpyNmw3dUJXNE1LU1pGZkJxZEl1Q25E?=
 =?utf-8?B?aEF3enYxUEU4RlhKYWJ2RHd3U2dNTVlKdVhlYXdXczNyUXZuTXdxTDNRbU93?=
 =?utf-8?B?T3U1azhRT09XamhqeUp2QktNbkFMdTZPMkdZVFRmaWFvMWZHS0IzaURtemp4?=
 =?utf-8?B?WEVUaUZsbHVPTFBoMG9OTmRldTNmbFBXci9lRTZMeURvbXhNT0M3WVV2UzVm?=
 =?utf-8?B?b2Vrckg2aldSYi9yRENOaGQ1MWp2STVCSi9mREpDek9meG05ZDUydkpETjlK?=
 =?utf-8?B?NFQyaXdGQlNzbHFUNCtNQVA4SHE5V2k3RVNtVkRMdjZ1ZG9GSC9tdEhCZGpn?=
 =?utf-8?B?VUU4M0dhMHYyaDhZbXY4NTlmd2I3OVBwQXJMb3dsVWhHRi91TXhpSnQ0Sk9x?=
 =?utf-8?B?TGJVN3dBOUxRbkRVeEo3R3FPTTlNaEhyMWdKcUt1NFJJQWJQY29mWjlaaktH?=
 =?utf-8?B?anBkRWE2Nit3QVYrcmQrcWdtREtPbk5EVTJSSGc4NUU0dFVtVnVqL1h6SUM4?=
 =?utf-8?Q?VzrlEBak8XY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnJaYy85dWNOTTdEU1NyT0U4aEJOV0pCaVZoa0hJQmwyOWlZSzB0N0dCcVZJ?=
 =?utf-8?B?SGdVNVpvT3pCVngzTTRqMXIwdlVHZGxmb3BZZy9UekdsbUF6UXc4TTMzVnRP?=
 =?utf-8?B?SVJoSzhzamdYLy9paHZuOTZncjQxSjBDL2tLNGJSeWJYT29pTWsyRk1VTURa?=
 =?utf-8?B?N2RNVmxXSzRYd0Exek9nd2ZYMk92MnRYMWpMWkhBUmJtU1gzS3Y3WWhoRkU5?=
 =?utf-8?B?ampIdWlNZGNMS0FZNmdHa2hWSnBZaFpUa1hBd3ErMlJwSlpmd0JsRnBIODVr?=
 =?utf-8?B?eko2ZGxlNmlGMWk4cEtBNnJ3SUpZcG54UjV0S0k3YXlMWFdTQjNkNTdXZHhI?=
 =?utf-8?B?b3dtNlpUQnVHb3NDVW9JTW5ENGFaQnlHdnU5WjRSZ0J6ckV2MkdaTDRyNUpr?=
 =?utf-8?B?N0k0MHhlcWd0ZTJ6N1JxbkFGV2dVMXA0QkVkWkFXMnMzV1VTbDNnTkpSM1Az?=
 =?utf-8?B?cUg3bHJDVDhKWDIrQUljVDRXSERFUitPRTFxbDVDTUowVDVoTmJRL09jQ0NP?=
 =?utf-8?B?TlYrQXN4aTN6Z0xHeDB1ZHdJUy85emh6dTRTZzRJRkRhUTdxWmxVNmhNN0xm?=
 =?utf-8?B?OTNmVkwwUlJVcThnT0Y0MU1mRDZ4WnpyUGtXbEJTNFl0YzlLTnVMaGdkZ0NL?=
 =?utf-8?B?U1NNOHpqTDRPS3VRQWxwRWhjSEx0a2dWdUg4cEdhQUNkK0Q5SVpJYS9SUDAw?=
 =?utf-8?B?WEJ0S2l4eElpMTNpZ2w0MWh2RDdrd04vajZzbHAyU09EWEhPVGs1bjJPQWVt?=
 =?utf-8?B?OWdXajVIaG1vc05paUFNYzJuWlBCUGhNNEFGaEFqYnhlSmNiam5ZS0xzeith?=
 =?utf-8?B?eXlqYTBwRVRMQTBFbVZ0cmpOeEFybzVWUFoxMWo2Tk1qWThFOFFqeTN0ZDlQ?=
 =?utf-8?B?ZlhpSnJ3WkpjZlVUNDc3YXlzY0JUc2EvTWxqcldubzVIZkloNTR3NnFCSWNE?=
 =?utf-8?B?THhyWFdaL3VWdUY5bnVqcU5xbUl6ZDBXcGNucG9PN3VvY1pVZUhrSkNTa0to?=
 =?utf-8?B?V2R6UzE5WXFrMllsT1VvSG5iZzRZZE1qQU9sbXFzVU9yVW9TNUNhdXRmYjN2?=
 =?utf-8?B?M0o1NkU4YlJNK0J5YU5PVDVsNnQ3ditQY1laeVp4bTZKeGdLTjF3eVR2RW5S?=
 =?utf-8?B?NUNpblQ1QktLcy9TeWFiOElPVWJkWDR5UE5hMzhmbW1qdzhUOEY2SC9pLzA1?=
 =?utf-8?B?VTYzeFI3VzNDZ2JqdFptYkI0UzNlTlhPUkR0M3NjakxEM0xmWjZFNEVCZ3lQ?=
 =?utf-8?B?SXNaR1ZhTy94cHFKdHc1VVB4SFB2ZGFXZG1ZdU16TnFremdjZVE2SkR5Rngv?=
 =?utf-8?B?N2NRYWx4MzdnOXQ1aDZGQW4wRk1hVGxUTGcza2VDeGlFYlZDa3B2cVBLK3Bp?=
 =?utf-8?B?L0NldTd0NnNBQkVOWkw3OWYzSWkxRURBSU5hRUhrWUdiK1VZMllGeDg1b0Zh?=
 =?utf-8?B?bm9wYmJuSjRsRmhRSllwWmhvRFBYSk82UGRuWHEyNkJJK1FrY3pueldLYjVh?=
 =?utf-8?B?cTNnbFVJNUg4aWlKa1F1dXVCaWQrS3poYzR1QldFY3c5T1poTVYzSkRqUUxH?=
 =?utf-8?B?ekFrcEhyME1yUVNKREYwWC95UTIwY3o5TXVBUXFrSmJNRk5NM2xRbWhjM0NQ?=
 =?utf-8?B?MTlzS2VaRDJpTWZQNXZLejIyQllxaGJlSDZ6TlFpUGk3aU1CcHhWWk5QT0ly?=
 =?utf-8?B?RlM3Nk5WdHRPeHZxUXY0TGNjWlp2T0tNb1pNSTF0WHN3L1duRzd3b0xsN3pq?=
 =?utf-8?B?WDllVFNqWlZFTmRHQ3JyQ0N5dTBwYldXcmlwZXhPWUIrRy90T0d5d1o4a28r?=
 =?utf-8?B?WW9FM3V2bDRoWFZId0Q2Ujl5d3pDMlA5NytjQ3VQdmJKV09DS0RtaDVMQmZG?=
 =?utf-8?B?cFJKcmF6cjdGa1VTaWJtQk5kVVAwMWJQQmRMRTI4NEJzeCtGQU1qa3lEeHdV?=
 =?utf-8?B?UTJSN0FHaU9PRWJMYUhHbExiZ2pWVyt3M3JrajA3Ym1tMUpwbUVVSHpjQm5z?=
 =?utf-8?B?cEsveHhUc2I0ejlZS3FOa2I0eVpXaXI2UXU2N1dScXJpMXVoNjFtS1lmU0dv?=
 =?utf-8?B?bU9Yd0h5UlRJTER3QmxSR1kyc0k3cnIzcERFWkJhLzdBYnJDWmVlNXVlZmpE?=
 =?utf-8?Q?tfYRDqTgbHFH6oHV2i2OKZ8Q1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74ae9de8-a71c-4d3a-b33c-08dd8d500822
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 10:15:03.2451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMBpLlcOwGcOcHLKRTQ9EsUf9nAB5gzqsPm6Hb3XTxt1/8ZCrJpGm7iOR2XMbKjSCsAYIhSJ4OtscFf0VCKVhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7634
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
> 
> On Wed, 7 May 2025 10:10:53 +0800
> Liu Ying <victor.liu@nxp.com> wrote:
> 
>> On 05/07/2025, Luca Ceresoli wrote:
>>> Hello Liu,  
>>
>> Hi Luca,
>>
>>>
>>> thanks for your further feedback.
>>>
>>> On Tue, 6 May 2025 10:24:18 +0800
>>> Liu Ying <victor.liu@nxp.com> wrote:
>>>   
>>>> On 04/30/2025, Luca Ceresoli wrote:  
>>>>> Hello Liu,    
>>>>
>>>> Hi Luca,
>>>>  
>>>>>
>>>>> On Tue, 29 Apr 2025 10:10:55 +0800
>>>>> Liu Ying <victor.liu@nxp.com> wrote:
>>>>>     
>>>>>> Hi,
>>>>>>
>>>>>> On 04/25/2025, Luca Ceresoli wrote:    
>>>>>>> This is the new API for allocating DRM bridges.
>>>>>>>
>>>>>>> This driver embeds an array of channels in the main struct, and each
>>>>>>> channel embeds a drm_bridge. This prevents dynamic, refcount-based
>>>>>>> deallocation of the bridges.
>>>>>>>
>>>>>>> To make the new, dynamic bridge allocation possible:
>>>>>>>
>>>>>>>  * change the array of channels into an array of channel pointers
>>>>>>>  * allocate each channel using devm_drm_bridge_alloc()
>>>>>>>  * adapt the code wherever using the channels
>>>>>>>
>>>>>>> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>    
>>>>>
>>>>> [...]
>>>>>     
>>>>>>> @@ -345,8 +351,8 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>>>>>>>  free_child:
>>>>>>>  	of_node_put(child);
>>>>>>>  
>>>>>>> -	if (i == 1 && pc->ch[0].next_bridge)
>>>>>>> -		drm_bridge_remove(&pc->ch[0].bridge);
>>>>>>> +	if (i == 1 && pc->ch[0]->next_bridge)      
>>>>>>
>>>>>> Since this patch makes pc->ch[0] and pc->ch[1] be allocated separately,
>>>>>> pc->ch[0] could be NULL if channel0 is not available, hence a NULL pointer
>>>>>> dereference here...    
>>>>>
>>>>> See below for this.
>>>>>     
>>>>>>> +		drm_bridge_remove(&pc->ch[0]->bridge);
>>>>>>>  
>>>>>>>  	pm_runtime_disable(dev);
>>>>>>>  	return ret;
>>>>>>> @@ -359,7 +365,7 @@ static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
>>>>>>>  	int i;
>>>>>>>  
>>>>>>>  	for (i = 0; i < 2; i++) {
>>>>>>> -		ch = &pc->ch[i];
>>>>>>> +		ch = pc->ch[i];
>>>>>>>  
>>>>>>>  		if (!ch->is_available)      
>>>>>>
>>>>>> ...and here too.    
>>>>>
>>>>> This is indeed a bug, I should have checked the pointer for being
>>>>> non-NULL.
>>>>>
>>>>> Looking at that more closely, I think the is_available flag can be
>>>>> entirely removed now. The allocation itself (ch != NULL) now is
>>>>> equivalent. Do you think my reasoning is correct?
>>>>>
>>>>> Ouch! After writing the previous paragraph I realized you proposed this
>>>>> a few lines below! OK, removing is_available. :)
>>>>>
>>>>> [...]
>>>>>     
>>>>>> On top of this patch series, this issue doesn't happen if I apply the below
>>>>>> change:    
>>>>>
>>>>> [...]
>>>>>     
>>>>>> @@ -351,7 +349,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>>>>>>  free_child:
>>>>>>         of_node_put(child);
>>>>>>  
>>>>>> -       if (i == 1 && pc->ch[0]->next_bridge)
>>>>>> +       if (i == 1 && pc->ch[0])
>>>>>>                 drm_bridge_remove(&pc->ch[0]->bridge);    
>>>>>
>>>>> Unrelated to this patch, but as I looked at it more in depth now, I'm
>>>>> not sure this whole logic is robust, even in the original code.
>>>>>
>>>>> The 'i == 1' check here seems to mean "if some error happened when
>>>>> handling channel@1, that means channel@0 was successfully initialized,
>>>>> so let's clean up channel 0".
>>>>>
>>>>> However my understanding of the bindings is that device tree is allowed
>>>>> to have the channel@1 node before the channel@0 node (or even channel@1
>>>>> without channel@0, but that's less problematic here).
>>>>>
>>>>> In such case (channel@1 before channel@0), this would happen:
>>>>>
>>>>>  1. alloc and init ch[1], all OK
>>>>>  2. alloc and init ch[0], an error happens
>>>>>     (e.g. of_graph_get_remote_node() fails)
>>>>>
>>>>> So we'd reach the free_child: label, and we should call
>>>>> drm_bridge_remove() for ch[1]->bridge, but there's no code to do that.
>>>>>
>>>>> To be robust in such a case, I think both channels need to be checked
>>>>> independently, as the status of one does not imply the status of the
>>>>> other. E.g.:
>>>>>
>>>>>   for (i = 0; i < 2; i++)
>>>>>       if (pc->ch[i] && pc->ch[i]->next_bridge)
>>>>>           drm_bridge_remove(&pc->ch[i]->bridge);
>>>>>
>>>>> (which is similar to what .remove() does after the changes discussed in
>>>>> this thread, and which I have queued for v3)
>>>>>
>>>>> What's your opinion? Do you think I missed anything?    
>>>>
>>>> The pixel combiner DT node would be added in imx8-ss-dc{0,1}.dtsi, please
>>>> see the case for imx8-ss-dc0.dtsi introduced by an in-flight patch[1].  As
>>>> channel@{0,1} child nodes always exist(DT overlay cannot effectively delete
>>>> any of them) and channel@0 always comes first, there is no problematic case.  
>>>
>>> I'm not questioning what existing and future dts files (will) contain,
>>> and surely I don't see a good reason someone would write channel@1
>>> before channel@0.
>>>
>>> My point is:
>>>
>>>  - the bindings _allow_ channel1 before channel@0
>>>  - the error management code after the free_child label won't work
>>>    correctly if channel1 is before channel@0 in the device tree
>>>
>>> IOW the driver is not robust against all legal device tree descriptions,
>>> and it could be easily made robust using the example code in my
>>> previous e-mail (quoted a few lines above).
>>>
>>> If you agree about this I'll be happy to send a patch doing that change.
>>> If you think I'm wrong, I won't fight a battle. This topic is
>>> orthogonal to the change I'm introducing in this patch, and I can
>>> continue the conversion independently from this discussion.  
>>
>> I don't think it is necessary to do that change for now.  When someone
>> really comes across this issue, we may make the error management code
>> robust.
>>
>>>   
>>>>> Thanks for taking the time to dig into this!    
>>>>
>>>> After looking into this patch and patch 31(though I've already provided my A-b)
>>>> more closely, I think the imx8qxp_pc and imx8{qm,qxp}_ldb main structures
>>>> should have the same life time with the embedded DRM bridges, because for
>>>> example the clk_apb clock in struct imx8qxp_pc would be accessed by the
>>>> imx8qxp_pc_bridge_mode_set DRM bridge callback.  But, IIUC, your patches extend
>>>> the life time for the embedded channel/bridge structures only, but not for the
>>>> main structures.  What do you think ?  
>>>
>>> I see you concern, but I'm sure the change I'm introducing is not
>>> creating the problem you are concerned about.
>>>
>>> The key aspect is that my patch is merely changing the lifetime of the
>>> _allocation_ of the drm_bridge, not its usage. On drm_bridge_remove()
>>> the bridge is removed from its encoder chain and it is completely not
>>> reachable, both before and after my patch. With my patch it is not
>>> freed immediately, but it's just a piece of "wasted" memory that is
>>> still allocated until elsewhere in the kernel there are pointers to it,
>>> to avoid use-after-free.
>>>
>>> With this explanation, do you think my patch is correct (after fixing
>>> the bug we already discussed of course)?  
>>
>> I tend to say your patch is not correct because we'll eventually make sure
>> that removing a bridge module is safe when doing atomic commit,
> 
> I think your sentence can be rephrased as "your patch is correct with
> the current code base where bridges are not (yet) removable, but there
> will be a problem when they start to actually be removable".
> 
> Is my understanding correct? If it is, I agree on that sentence.

Nope, I meant your patch should align the life times of the main structures
and the DRM bridges, for the sake of the kinda long term goal - remove bridge
driver module safely when doing atomic commit.

> 
> The work to have removable bridges is massive and non-trivial, so it
> will need to be tackled in steps. The grand plan [0] is:
> 
>  1. add refcounting to DRM bridges (struct drm_bridge)
>  2. handle gracefully atomic updates during bridge removal
>  3. avoid DSI host drivers to have dangling pointers to DSI devices 
>  4. finish the hotplug bridge work, removing the "always-disconnected"
>     connector, moving code to the core and potentially removing the
>     hotplug-bridge itself (this needs to be clarified as points 1-3 are
>     developed)

I'm busy with internal things these days and cannot look into the grand
plan and steps closely, sorry about that.

> 
> I am at step 1 right now. Removal during atomic updates is step 2,
> ideas about how to implement that are already being discussed [1],
> there's a practical plan proposed by Maxime with the goal of reaching
> removable bridges without breaking things along the path.
> 
> [0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/
> [1] https://lore.kernel.org/all/20250106-vigorous-talented-viper-fa49d9@houat/
> 
>> which means
>> the main structures should have the same life time with the DRM bridges.
> 
> The word "lifetime" mean two things for bridges:
> 
>  * the time span during which memory is allocated for a struct
>    drm_bridge (along with the embedding struct)

Note that with your patch set the imx8*-ldb drivers and this bridge driver
won't allocate the DRM bridge along with the embedding struct. This makes
me worry, because maybe these drivers are the only "special" ones in this
patch set and I don't want them to be "special" after your patch set is
applied.

>  * the time span during which a DRM bridge is active/used/usable as
>    part of a card
>    - i.e. when it is part of an encoder chain
>    - i.e. when drm_bridge_funcs callbacks can be called
>    - i.e. from drm_bridge_add() to drm_bridge_remove()
> 
> These two lifetimes used to be nearly the same. Now the "memory
> allocation lifetime" is extended, but the "bridge existence" is
> unchanged: drm_bridge_add() to drm_bridge_remove() are called in the
> same place and do the same things, so the bridge will stop being in any
> encoder chain at the exact same time. now we are just keeping a piece of
> memory allocated for a longer time.
> 
> Seen in another way, the events used to be:
> 
>  * probe:
>    - allocate bridge
>    - drm_bridge_add()
> 
>  * remove
>    - drm_bridge_remove()
>    - now the bridge is not used, it's just some dead memory [*]
>    - kfree bridge (either in .remove() or just after by devm)
> 
> Now it becomes:
> 
>  * probe:
>    - allocate bridge
>    - drm_bridge_add()
> 
>  * remove
>    - drm_bridge_remove()
>    - now the bridge is not used, it's just some dead memory [*]
>    - maybe some more time, possibly long, until the last put [*]
>    - kfree bridge (by devm)
> 
> The duration of the [*] steps changes, but it's harmless because the
> bridge is not used at all. No change except for memory allocation.
> 
> Luca
> 

-- 
Regards,
Liu Ying
