Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B54AC4603
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 03:46:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D480F10E3B6;
	Tue, 27 May 2025 01:46:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="oUAG9zLd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2084.outbound.protection.outlook.com [40.107.104.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4324E10E3B6;
 Tue, 27 May 2025 01:46:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wCk9UEsZepgFprQTXi01RQ+dmal8umglamN9ZD6+420rkZIKxg78yxTXrq83OcE3hPEV27zBXPy/hRxvsve+JLAgxiLUJF6mM0knr5OD2JK5vLJb081n59JAwe7PrmNUVB72DaHTTjOGLFFNY9qbwluUOyrdfawBvn3nqZqGkWojygmEKHxPy0JVE6vMBbPFNOhU6HA6f5fLu0u6ct7h7reJAXJBkbEkXUevdE6FfphLTJESqfI5GaY5eMnZj1pb4aXVY3znGCSX+BkIEf5rfdI6wyeNl2+tmry+CwuUps0gwdnfvr4NX3kTgBX4GZ/REcQJocRzW4cD98Chc5sGVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+hSoPujqR2toonZR4+X0REpWkYjttlIo/q8wFVWp6w=;
 b=R8viHV/EiybUo1GM8/H7gDUeNqsGVLavnGxL8OLBsxQaYckinZe1yl7qepnT22L2heoMuZwSGWXOsx7FQsSmEEuqydz8ecNVlnFIL7whMtfY+WJmo8FkikcXFcdm1dwviBwI9xH9VWJCnKk/NTLT4HjVQwJMyLd1CWo6n6OWi4kBgEIM+p+cMCngWuj8XpZdm33y0IdjGuFVRMj0fC0atZONxgJNKanxafJ6bL57mDS3ho75YCzbffoyT6sXZzbMws407z6iYU5k16bOzfJnjh3BojJeWJpEDwIwI7dfki2TwuofZfK3aLuRG6xhBKO/rjU2bwQOijYptB9kOeCulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+hSoPujqR2toonZR4+X0REpWkYjttlIo/q8wFVWp6w=;
 b=oUAG9zLd5JZhB3XuFFsBEUm96nQ1CPQ91qmjUNhOhwuAoewToSX/QTDLy5pzF4+usE+dqfdPHSVVchv6BMc4BVSUF0dVtGxlx6KRaJ1xjox+K/wsB21dBt12mxUQh4uj39cSEv205pHpbE3ntfODWGYncx5Bj4d1FHUW7S5VcgsbUfIHrzxYF5Zy7JcRfszss0XxRZinOM50Il6oElHTH7qFQJWXhTN6rOifuymNxbWKe8Cd4DwX8/E3X7kcq8Hjmvw8Iz9CwMPlkit2+vvlPGDwNf61BdmEUvtzQy02Bf7VQgmwFw+JP0/72tzU25XDL8NUwUmBdtcjCvWomoLPDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PAXPR04MB8782.eurprd04.prod.outlook.com (2603:10a6:102:20d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.31; Tue, 27 May
 2025 01:46:40 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8769.025; Tue, 27 May 2025
 01:46:40 +0000
Message-ID: <f11206e5-4c59-411e-bb91-2d50befbe930@nxp.com>
Date: Tue, 27 May 2025 09:48:05 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/22] drm/bridge: imx8qxp-pixel-combiner: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anusha Srivatsa <asrivats@redhat.com>,
 Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, asahi@lists.linux.dev,
 linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com
References: <20250509-drm-bridge-convert-to-alloc-api-v3-0-b8bc1f16d7aa@bootlin.com>
 <20250509-drm-bridge-convert-to-alloc-api-v3-18-b8bc1f16d7aa@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250509-drm-bridge-convert-to-alloc-api-v3-18-b8bc1f16d7aa@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR06CA0002.apcprd06.prod.outlook.com
 (2603:1096:4:186::10) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|PAXPR04MB8782:EE_
X-MS-Office365-Filtering-Correlation-Id: 943ac38b-7450-4aee-fea4-08dd9cc05366
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N20vL2I4ZU1MWTFheExlMFVZR3l0TkZxeEtaR2syOXVxZ2tZM0doMUhLMER1?=
 =?utf-8?B?b09rVW1BZ010VVdZSG9uRHpOSlBiY2VjczExTkx1aUgvL3REQTN1bkM2Qkd2?=
 =?utf-8?B?V2dIanJPNTJSMWZhaFhsRFEraXR1dHBWV0p0OFlXZGNkSUhGY081VE8yOHVC?=
 =?utf-8?B?K2RZTkFWQzc0WHBKRW9QRjFIb3BacGhSdzVLSGQwVWoxSDVmWFZxM3pIRVl0?=
 =?utf-8?B?UHloQ3BJL0xDblJBNFFGTzUwOXZxandrZ1dDRERWU3ZNc3dDME01T3h4c1E3?=
 =?utf-8?B?MGVQc0hJL1doUFJVUC9nTzJWWFVUTUxYOTlDNEV5WktRaTVWVjF0UysxbFVD?=
 =?utf-8?B?T2FDbTZIZDc0eVlQNGN1NnBZdDJPYlU1MkNHKzljNDlVeXY5c1B2TlJNL1JP?=
 =?utf-8?B?U24wYzNwQXo1bC80WURsMFFKTDI2dnVhdm9lYmY0YXRUY1hUNnIyMEZoN1Rp?=
 =?utf-8?B?WS9ha3hTQ01DalJWVkVBQzVaTkxQVjZMN3hHRHU5cSs1M0VWUVNBLzZhNUlF?=
 =?utf-8?B?a2RaUkxnRE1rYllXTkdNemNocUpaZ1J4L2tBRnpKVFZLb0RHekovdGV5eFg2?=
 =?utf-8?B?Y3NvaGRCNGYwdGtVejQrdVVGbE5Tc2tLTGtSQk95YUZVVUdIc3IwemVCSEVz?=
 =?utf-8?B?a0JNclpKaG9zYWdJUDhIdDBiVHdVWExNQWZSUjRFeTNybmIyMWQ4ZVA0Y2hE?=
 =?utf-8?B?anhLNnJucnJMNm1nRlJJbnc5L29vWHY0T0F3V21MZDMyR09ncnlqdHF1V2dG?=
 =?utf-8?B?cnR3azNwV0tzYVVxSjVwMzhTOERjWXZjRWJySFJVWG9GbkdZYWpBc2hGRmU5?=
 =?utf-8?B?WmtDdTgwdzZkMVpYYzg0WUIzUDZmekg0Y203UzJ4MmhyenRlS2FBeWJOTWZD?=
 =?utf-8?B?ZWdBb1dUYkNFRFJGYXVGTlIzQ0JGR0s1eFNtWWJxOHVDZ0VFbTFjZUhhc3hE?=
 =?utf-8?B?ODBTaG1ueFpFRDVFVEI2TTFMVmhJWS9uRGJQaU1oY2JNdG9EY09Bbm1XdVk0?=
 =?utf-8?B?SHVDaWJtbm82OXgyZmxkU2VzR3FxdXowUk5BWk5WTUVCOTdDT21nT3pCVjFa?=
 =?utf-8?B?UCt5OGpyZEREMS9rb01wc0E0bHcxbUdCZWZpeEZXTVF3QlJnUWh2Z0pkOUxt?=
 =?utf-8?B?a3NXQXBvSDhrakY5aTNSeWx5NmZtbzkxSUxTdUErN2lLWnZTRWI3QUNMYjhG?=
 =?utf-8?B?QXhiV0Z1cWozZVI4KzJIc1B1VGdTcWF0RUFOaW1KemJ5Z1JDcTdaQ2pmZnF1?=
 =?utf-8?B?QXBPbnhZdHluRTNpUU1NckdBTWNQSlg2RnpwbWkvSTh2MjJrVU9IcGZtUXJr?=
 =?utf-8?B?WEZsaGxITlh4L25WS0hhMGJTUDBjVDJMMlRUWDJRQzEzTmlpdjZSRXl5M1JG?=
 =?utf-8?B?eDhTc2JSOHp2NVN1aFV1MlpJVTNuL2pnM1NWbWY5Vk5ET1hDYXZZN1A1UEZV?=
 =?utf-8?B?b2tvUXc3aFp1MWppSkNnYUR4M2NpNlZDS0hsN1FTUmxjbzYzWlJsVkdDMWU4?=
 =?utf-8?B?b0YrZTFmYjQzQWM3WWs2aCtCeHZYRzJ6Q291cUxwQUdtT2dlMGxBODZ5RzJQ?=
 =?utf-8?B?Z09MNU9nc0xQSVZNSTlaRVNwdHlOaWdTWW1pMkhIRStwcTVqQmRIVmhvSlBT?=
 =?utf-8?B?NFZIeUoxdDM0TmE3eWNKT0VVK3E3Vyt0dkt3QkRzUWJNTzU3RzV1dlVITi9o?=
 =?utf-8?B?K1Z1YVo2cGwxZ2xPOC85NTNxSC8vdEdCZ3dYRFhkejhBMFU5OWhEWGdNcEVY?=
 =?utf-8?B?bVU1UUxORVExdUtIOGwrdkM2ckdIU1ZwWnJxVGZuZUF2U2dRUmx2STFSV21B?=
 =?utf-8?B?QlkwQVV4bmcrMkx0N3N3ZCsvSlpJS0xlOW1CcXp5WHlzb1V5ckhTamgzRXZ1?=
 =?utf-8?B?bWN4MlhrT091ZkhvdEovNWNaQXZFZHpPajh6NE5BTVlabVNOaytueE5peW8y?=
 =?utf-8?B?em9aYkR4VVlqMDVJaFc4dWdyanhDSkdOc25aNk9kUC81WGQ2WmtUcVBZUXZU?=
 =?utf-8?B?N0dEMGlCK01RPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N3QzZ2M0TGNRcU9KVEgrN0hkMW50L3Jrb3hKS1c2OFU3Nm1wNlRkRll4TFE5?=
 =?utf-8?B?NHBsWkRiWTBlT2FTMFgyQkdnR3A3a2s5ZXhKcFMxWFZWU0QxdmRyQW5WTmFq?=
 =?utf-8?B?VzRCWThXVm11UXpMSE9lTkZiQ2NQYmx4L2dyMVBjbTdOUnJUdndJTmZwaEZW?=
 =?utf-8?B?SlZkampUem5kZDRNSTVxOExwSHFyckJHcEFwVFF2TGJRZ04wbVBJWW5PT3RM?=
 =?utf-8?B?TUVlRFVSQUhMcytLQTBDQW9IMmEwbEJxa1htTXA2a2ZNb2RpMmFEc1JYd1U0?=
 =?utf-8?B?aHFmOTgwVk5zTG9yZFpROHlFTUlzcThkcEUySGdpZ2FjTGJKdlBiejE5VnZ4?=
 =?utf-8?B?MzR5VzVmSGZuTksyZTNjTUFEVW1URithK2grYnV3UE1wL3NZR0dTTjJNU0xE?=
 =?utf-8?B?Umo5SmpySDNXQVZXMjNxWmNFblBNREJmMElMVlRGZ081dlRWd1doTTBUYzM0?=
 =?utf-8?B?a0NueUtIdVJPQTJtWlhPK2pZVHBudFk2Vnh5ZWNPMDV4WDlBbnBaU3FqTXNL?=
 =?utf-8?B?c2Q4blJwRlFDcm1CQlMrdVhWMDNsb1NuNE04ZG1Obm1PREhYSGN0TmNXb1JT?=
 =?utf-8?B?MWcrbE01Y2RBd2NwcFQ3Y3prQUN2TTlZWEd2QjdYWFVEaXh5YlhNdFEyWFhp?=
 =?utf-8?B?ZTl5ck9DcmtiSEd1dTk2c2o5ZzI1YVJqMnU3bzYzK0huY084eVFXYjNvaFIr?=
 =?utf-8?B?NzBOOWJwQUc0cXpFbkNGaitTREluTTBvNnFPOEFRVHRHLzNvclVlTFdSQ2k0?=
 =?utf-8?B?dDUxeWlUSXN4ZTFYVmFteW1EVGZ2TUFhSE1GVmJkQjZVNWQrQnRQTlhsZjRQ?=
 =?utf-8?B?Zys3UHdqRFI2ME9pYXFSYVpIZUxOZkN4TGdDK05iTXFQaGJZR3VkQU1idTM4?=
 =?utf-8?B?VHoxZGRwSk9OVUlSdHoyVFZNN0hJVnZSOXBiOStjaEVWRkZuS3J0Rmxxb3B6?=
 =?utf-8?B?aEphTkoxcFhZNFBMUHMrZmpURXBaVHRYYUk1NGVkZldGWDlHclFnTklsa1pR?=
 =?utf-8?B?bUdvaVR4eUN2NjdCZzF4VDBDdExhRDMvb1dKYy9ndE9hZ1djQXFuZmJwdEdC?=
 =?utf-8?B?ZnlpdzltT2d4MlQwOXhhWXk0YkpieG1nc0c2c2plL1laNE1qUm12UDBwaGxq?=
 =?utf-8?B?K3lESTQ0YVR1WDltN2FxSzE2eU5jc1NadnJGQVBYRkpscng3dWZkVlNxcGcv?=
 =?utf-8?B?VGFvRGY0akk5SGRCWGFrZ0FXcGpuNnZWMG5nZzBSVG44MkV6R0d5SEJDNGo1?=
 =?utf-8?B?eTAveWswM3Ewb1RFeW1JWjhhZ0g0TVJLY1NVU1RnUDVnUVlnZUhVV3orWVA3?=
 =?utf-8?B?enI4ZElFdzBCRkMzSDJqSm96V3hJbjJXTEZrMjdhT2pzTXpBc3dRcWlVRDhx?=
 =?utf-8?B?VldsdDdOZDkwc1BLOFQ4N0g4ejdOUUtpZDhvK0VCdGxmWXpDeFZDSXJMM200?=
 =?utf-8?B?WDVHbVowVnd6YUEvV0VsOUJaK0VnVWV1VnNQa3VmQy9OWTJwUEJjWlRlR0xx?=
 =?utf-8?B?SHNDcjhBL0t5ZzhsSW5mRHNIcUczd0tVMmtZMzkzb2ZyWVF6VE04NzBncDU3?=
 =?utf-8?B?YjZnUzFaT3JlMElWNzF1UllhdmJqODZyY1QybkVaR2MrNy9HbWFGL1BJZzZ6?=
 =?utf-8?B?bjFrZGpzVVNaQW44ZzVSV3IvU3FIcm1Wb0Z3UUJabFBMdWFMQ1QwT3QzWVFN?=
 =?utf-8?B?ZUVMYXlQRnlXQWk1NEFEdFpxNHR0S29iKzd5ejFXcGNNLzByREtJdjJDUnJ6?=
 =?utf-8?B?K1hkdTl0OTZWTnFOQjRhUUtzL2c2ZU5CYXJ6ckFlN0dYQkNVeXFTamNxRnQz?=
 =?utf-8?B?cUZpdDNQa3I5R2w1N3ZlZ1dFbm5waW9SVjNpMkJ5MXZEWEZZTVhGT0VpYTRU?=
 =?utf-8?B?OUoyaG5GR2FvMTlHMFVqQXdBUUFwUjM2TUcvb0o4NEVPT3lwdnR1Z0lqdEY1?=
 =?utf-8?B?Rjc3RnJOSkdvU3hxV1hSekkycHJTdzUyU1hlVjI5S0pGV043d2o3QnB3aXZ2?=
 =?utf-8?B?eGdqN0RyREN1UkRvQWZ1RGd3NTJvc3R3Z2lLd3JycDJDS0Ixdy82ZlNPeVBH?=
 =?utf-8?B?bFFCNTNxalNCM1pkTDFiZCtKWXNBZFFQNWxMKy9yY3dvQjFhWUZ3d0pmY2dU?=
 =?utf-8?Q?UyyqqrTrpBMq4FGriPec39wLg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943ac38b-7450-4aee-fea4-08dd9cc05366
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 01:46:40.5242 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DYS0P5cixG48xB+iuXeKB/k6S9OBz5/3z2cfGbO3jrPemcNwejo9LGXIVtg0B3fDi5AhzSqEGmr16349JkEcQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8782
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

On 05/09/2025, Luca Ceresoli wrote:
> This is the new API for allocating DRM bridges.
> 
> This driver embeds an array of channels in the main struct, and each
> channel embeds a drm_bridge. This prevents dynamic, refcount-based
> deallocation of the bridges.
> 
> To make the new, dynamic bridge allocation possible:
> 
>  * change the array of channels into an array of channel pointers
>  * allocate each channel using devm_drm_bridge_alloc()
>  * adapt the code wherever using the channels
>  * remove the is_available flag, now "ch != NULL" is equivalent
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Liu Ying <victor.liu@nxp.com>
> 
> Changes in v3:
> - fix NULL pointer deref in .remove and remove is_available bool
> 
> Changes in v2: none
> ---
>  .../gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c    | 27 +++++++++++-----------
>  1 file changed, 14 insertions(+), 13 deletions(-)

Reviewed-by: Liu Ying <victor.liu@nxp.com>
