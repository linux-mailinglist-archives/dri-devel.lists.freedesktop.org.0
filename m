Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6CAA9FF9E
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 04:18:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B9410E1C6;
	Tue, 29 Apr 2025 02:18:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="EhtWCUwM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2082.outbound.protection.outlook.com [40.107.22.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D309310E1A8;
 Tue, 29 Apr 2025 02:18:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FScjYO+WbVv8GRE1PdEzYd7ZNY79iKFKpSyfoi125wAKXHa3v9oC5mRCiuzBCv8P6I9lXLgpxTKGBA0IlDoAkBsE4xBYLxCQK7kpJOSEWr1QRjrqCD8aZ6GX07+RGo0EMMJNUZmu3eijRW0evLJpAnFr0L/XxEUWxGF/swpLd0X/PgGxZK3aQxyXBurguxxAm6YufA0VKIkfmMj7LMi4RqRK121aja+u4Ru+9XfIN2HWoo7832JuvAvt8IW8YyaiaCfJkc1CEpWM0sMzNZHPl4+s22RLuxsY+fLa+CDCXZWZOVU/7XfwsjYd9FQ3q7RydT+BXtdyw7AJUlq9I+iQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RVUXW1AB3ZXHci+L450P3dukJamRcw8Bdt70UkTw4IQ=;
 b=oZlsnQNuA0rndgUEj9wBfyd1TqX2q7vd/ZcF9VuCoIuheSRYierIO84A/0fr4awtD67DfAOkuNvXJWErO7IbstDP7jZMOB6Qzj4yxcAxXwYY3ChOSwfLsEhVJRMvStnwaZRJaaSN7iB5D2jhlNu/e0iwpXR7VO/Mna7eIv9iQ1r1ZRKqHnuwzv6ZaOHd/FcSYrI2nGTd/V5uuvuNpxQ1AEMiXsFoPRBukYcczoohvWmjgdC/bK1bqrP9CMldcfp50MYgSl0v4EqvEj4y8Po7GkRvC7Kby60PXjVdvY3irdcvFxAcham3LfghG6JNiyZU5zB1ToJ7/65l40FCjurtFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RVUXW1AB3ZXHci+L450P3dukJamRcw8Bdt70UkTw4IQ=;
 b=EhtWCUwMQ8kkhwStRCllsVzXV/0+wcNqPZk5yjSYblHOTHoA4rHvLxXSU75hzrd1Zv7S+gOjxcYxOi/XLM2GZy9iN+RYq3prn83wdQpLP4qVLP96FHAibE4qsLmqqAS0JCEftZkig6bDKKE/+w6o4bROJlnH5JCOwKG0cnJJxs78xmKUPnIgpFJikmVvUbb8NNKOiesqAguBqswC5IqEkmajqpmDx41tKTM4dIr+aQMUWM3UnlnbKdnb2YAP3PcWCqE448EbT3OzbBPO3DqzVayrQCNCmnIYD5WGadEwJxTB4sUDJF1NkbQo6+k5DYHBtluCf/NnHHHvVgxEA9gYHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10758.eurprd04.prod.outlook.com (2603:10a6:800:25c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 02:18:11 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 02:18:11 +0000
Message-ID: <810dc089-4789-4efb-a88f-4ab8da1519d4@nxp.com>
Date: Tue, 29 Apr 2025 10:19:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/34] drm: convert many bridge drivers from
 devm_kzalloc() to devm_drm_bridge_alloc() API
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
 freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com,
 Adam Ford <aford173@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>,
 Aleksandr Mishin <amishin@t-argos.ru>, Andy Yan <andy.yan@rock-chips.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benson Leung <bleung@chromium.org>, Biju Das <biju.das.jz@bp.renesas.com>,
 Christoph Fritz <chf.fritz@googlemail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Guenter Roeck <groeck@chromium.org>, Heiko Stuebner <heiko@sntech.de>,
 Jani Nikula <jani.nikula@intel.com>, Janne Grunau <j@jannau.net>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Phong LE <ple@baylibre.com>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>,
 Sugar Zhang <sugar.zhang@rock-chips.com>,
 Sui Jingfeng <sui.jingfeng@linux.dev>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Vitalii Mordan <mordan@ispras.ru>
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-1-8f91a404d86b@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30)
 To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: b783f059-68bc-4290-3335-08dd86c416bc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmhQWDVmb0tSR3dBREFGOWJxcGlTcFIvcDE5TVdxQVl4a1VyamFlUjVqNWtT?=
 =?utf-8?B?cWFlSzZIaXJXQWRZMjdIQ2pOM2xoVFdsVmFFcGFxRzBGbGVUR05BeXJBYk5X?=
 =?utf-8?B?TWx1RTIwOGxJYWVpZFhMbCs1TG0xL3lleEJRZGpmakVhdHZwUVNOL1ZLWWU5?=
 =?utf-8?B?ZWlpUm95S3lOM0c4R2dSZmRQdDFNbXQvUVRMdm4zUmttL1gwUUhvQ3pnTWJI?=
 =?utf-8?B?WWtncmU5TWdSVHgrRkR2RnYxS0FNcGNWQ0pibDFkRFBBY3pGL0hIbVhEczFZ?=
 =?utf-8?B?Nk8wKzNqR3ZTQXlibnp2dGZyZmVrVTNOM0EzSEpQM1ltSkJNNWxBem5id3kr?=
 =?utf-8?B?NUduL2cybzlZZWlxK1hmenduVWlrT0RpRW9JajVoelE2Nyt6WjA0UWFMdjFB?=
 =?utf-8?B?VFk0UlMyYWozT045b2hCQWZZbnFTY3JiRG9peFgxZm96ZnJEMHdrYlZwWWds?=
 =?utf-8?B?WXhKMWt4Qm1UUkVpQ053NmdtVHg1c2RZV2dLU283aVhOS2V4ZzZOdllUN2dD?=
 =?utf-8?B?UE0zcWNLQmdrL0IrdE50c3NuRUdJV3RaUEpzMHR3VEYxMmhKREVDd25acHlS?=
 =?utf-8?B?ZUFZdXNJZUhYV3RSekpEZllnR0hIQ0NCMUtmTHJSUHAxSlp3SGxOVFFqbnlB?=
 =?utf-8?B?TFo1aGplblFKM0puNjhUZ3RCT29IcWRyUFJzekpxZXk0a1dUYjNad2RSbGZP?=
 =?utf-8?B?aDU2a0tWOEJuU2c1Z05iSHQrTnR0U0dvUHZ5SktxMlZLMUE3RWdySTZYNS9a?=
 =?utf-8?B?ZHlFdU5mQ0lJWVFIckdTVDZjYklQK3AvbFNiV3hBVzcvRFF2RlNMcUNXNnZZ?=
 =?utf-8?B?a2JKUUFtcmIza1ZrM1pCelpZamNJOGJXVjBWUGhVSVNjci93eU5JTk1SclVV?=
 =?utf-8?B?NW5WQ3BVbUwySmR2RWlYcUFpRlN3ZDlGVDdBWENsSFlrbHlZc3FGY3ZtZitp?=
 =?utf-8?B?OFFIazZZeWxIWjJNNy85ckQ0Rnp4YTFjaldNczJlbUJLN2pkajh3WjFDUkZU?=
 =?utf-8?B?dTFtSHdZYzQzOGlZTCtzVlVhWHM3c0tTUy9FKzJPNGUwUUtnc0kwdDdSYmpT?=
 =?utf-8?B?cXMvRXFwc3FIVWFXbWJRTXdzV3hHL0dZL3JiRlh6dTUzUk9laXkvVWRhQ24y?=
 =?utf-8?B?WE9vSUFscTdYWTE1NzkwYVlwVGRhWTZsbW9hdmxITUxyWFNhN3luU3dHVkV5?=
 =?utf-8?B?Q0VLNHd1Ty9UeVppVytVV3hwY3krNU9QOUoyL2UzZjBYMXhJZ1VwSUF5amE5?=
 =?utf-8?B?dFkwMXNRYmhteHBuWWJIZDhxZDNZTE9SL1RFQXZXOU4xL1NzRnRPaWpNeUpR?=
 =?utf-8?B?MlA1bnMzdTJwcHZheHhkOHVIQ2NPMEp6RDF6SDRmVTZtbnBURHJFRFBITEdu?=
 =?utf-8?B?WmlncFVxdnF5VEhaeW0yL2lrdXRSeFIxYkpYNm1IYlZsTEtaNmlZaUtYWFpW?=
 =?utf-8?B?ZHo5SXBqL00xR0o3OHFLZFM1bEQ2Z1JlaDZad2RQc24vZ3FNSUMrdm84bTd0?=
 =?utf-8?B?TGMyckh3N1hGRXNRMXhXNEpSQk5zTEZPLzNpU25LdWh1dkJ0SFZMMWk3WEtl?=
 =?utf-8?B?U0Qwa0Y2c3Y5T3VvTGFpbDY0aG1IbHZrYW1wZnpyc2gwa0hjV0JhOFF0STB6?=
 =?utf-8?B?aExLS1gyekUrUllMV3RLSklzb1FDU1M2QVRmUHpnT3VhMHRUM1JEdUlISUpR?=
 =?utf-8?B?dWxUZSt2RnM1MHdqaHIyT0JoMzltajJmQktWYUhaLzZicnVpM1pQdGl2SUlX?=
 =?utf-8?B?SDUrU3hpaEpPakc0RkhucFdCblF2eGZkeTYwRmZBTzZWK25TTjJuMUk0Y0xP?=
 =?utf-8?B?L2hWT1c0UW1GVStDN2RIK0Z5aXBldEdzZHM4SmV1TUp5ZWhSdFBKS1g1bFd3?=
 =?utf-8?B?NldjMFY1VlI4a3RValp2SjhJTFpWVVdMR2pIVEVyeDBHaDFKajlMSmpJV1JU?=
 =?utf-8?B?eHZralM5SDJuTWJlWUpack9pM2ttb1hyaWcvNE5lNE1GMDRFV3ZoYVF5NnJ2?=
 =?utf-8?B?Z1A5REZFN1pBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzlEc1h2WmkxTW1obFpWWWZRSDVwdXlobnI4bmZGWHZ4aHRiSm1UVEpIUmJC?=
 =?utf-8?B?RG5sUkZjdWZKT0hwV0xDeTBXSkVWeG1PdjIyZS9iV3h5MHNISnBGQWh5c0Fl?=
 =?utf-8?B?MUdsR2JGZzlrN21PUnZ1U2RCbnpzNGRpdm1mTTBPZHliRFYybWdrTENRSC83?=
 =?utf-8?B?TnlacmdkbzB4aGVwa213RFVIV2c0VlFNM0xlR2xWck8xRjVpMXQzSVAxSlVV?=
 =?utf-8?B?NUtiUVd6bnllY3hETm0xeUVuMGN6Z2ZBd21TbHB5RC9YbVlUMk90RU5EUUVV?=
 =?utf-8?B?MWJyZHorYmxSZnNzSTRITU9UTTVod3RObFBqZ0NjQktKRmZmRFZPaVpYVDdJ?=
 =?utf-8?B?bGNod1Q2aWh5Z2xkWTkwN0pMV242NFgrYy9HRGJYeVFEYmRVSy9wdjBBYm5N?=
 =?utf-8?B?QVZIR3NJd2dobDRoQWZBQXRWdktBdGwzcWRVdjIzVWg0ZW9oSGxOcmFYV0xC?=
 =?utf-8?B?bDlka1VPazhEZmZnTFluQWpmYlhBalVsV1JjTXJEMnpDUW5LcW9BL1NQeG9H?=
 =?utf-8?B?QXBVSXJnWjc1b2QybkhoN0U0azNxZmpEU0doczV4Tk1UWFQ2dHVacmdjOUVy?=
 =?utf-8?B?K0tOYjJQLzNHbm1EUHI3YnRVa3lFbFVyRGVvOHBzcXJGbTJWS01YR1J5RXE2?=
 =?utf-8?B?cS8zc3FnZG1EeURUdVhIc3hGS01jcUZLVXVGd3E2RFpuQ2tUV1F6d05Pa2dt?=
 =?utf-8?B?ZFNlVjZwS2s2dVZGUEw2Tkt5dDFhb0pPS1FkdFRlZlllMld3SUo2NUhBMGln?=
 =?utf-8?B?VjVvaDFpYm9FVzhpMVdyaGNadE94L3dSWlJMZSs2WUJLUncrZEJzR1dtUWoz?=
 =?utf-8?B?V1MyeCtaZDl0d093WjdBYUtPemswYmRvVm8xM2ZnTE9WeHA2RjZxaE9WREtX?=
 =?utf-8?B?bDI2aVpwd2lvMnVPVU9XMmw5Q3NYdHJKb0p2Y3BBZjdEVlNjbDF2Ry92Y3py?=
 =?utf-8?B?OVZGbUFiT3lqRjVUYXBXaC84NVVEME50RkZWYWRqUzc4NTc2bk1lWTdlOVdR?=
 =?utf-8?B?azEwV1ZzME52cjBYVE5Jb25sbTZFeVVLOFVTbFA5SjMvNmtUdndSMEN0NXYy?=
 =?utf-8?B?dnhQaHBEYkE4Zy9ZbXdtWlJ2NGFwWGZhQzlsMXAvcVR0TzdreVUzSnB6M0Nh?=
 =?utf-8?B?SzFvckFpYy9QYWVPQXRTUStqTnZ1K2VUNk94eFY2UE1KUjJTYUhUUU55bVJy?=
 =?utf-8?B?c0o5L1BSc0p3YnFEL2lKMkZIdHVOcFFldjhxOTFzcjFSUVNxL3J2dVBwVTZB?=
 =?utf-8?B?M012dmlaMVFDOVh1R0p3N3U5blBrM2d1KzkwRWNKOE9SbUdxcEthN3hWMzFm?=
 =?utf-8?B?SFRDTkVnbDFmY2xJTHpCWTY1WFh4Q1k1dHcyN3BveGV0SGsyOUdXTUpSY3Bj?=
 =?utf-8?B?cXRGcXI2bzFhNDh1QVQwbktMdzJGcWNmeHh0K2VMcEpMMDJ1bTI5UkJuN2gx?=
 =?utf-8?B?VFZ3OHp0eFUrWFc3QjVENDRqWHdXczdsT1hFNTFvUlZqcTNyZUdER1hWWjNO?=
 =?utf-8?B?OUJlbDM4RHBDdncxbUl3a0JDSVQ4a054ZXQybXpqdFpvU01MaTExYVZRTmlG?=
 =?utf-8?B?RGEvNlcxWFRwWEdFVzdJa3JzNnFSNXVKUjk5RXppeHVwOTVKOXErNW5qY0tp?=
 =?utf-8?B?N2YyaUF0b2NWdFhkeFhSL3RSVk5jMUVUVHlsV3dROUp1dUFVbithNlZkVWhZ?=
 =?utf-8?B?SXplMENoQyt0K1ZodlpzalhiRldKYUF2K0V5aGc4d2RhdFJxR1FuWm92ZmtY?=
 =?utf-8?B?VEttenUveHhNdkNHeW5DdEp5RHdmckorWWdvYXBybXovVzNoZ1VpajZxOWVT?=
 =?utf-8?B?WWN6YkV3YTBqaG9FNktVZ2FaN3dIWjNMcmFYRCtoakV4aFlMTlBUT20yR054?=
 =?utf-8?B?Y2ZaRkVRdWcxSHEzc1ZDczdPV1JEbGNpUXFnclZpNWNyUmRYZldYU2RLSVNI?=
 =?utf-8?B?NWttU201UWJybU9ZZU5iYnRYbzhBY1czZzZibzZoNTNFdmkvNHEvRmFLRnM1?=
 =?utf-8?B?T0J6NW16cDR2TlpBSFFoaW9QU0FNeUJ5WjE3cnJnazVSVVZkMVkzaVNNakxO?=
 =?utf-8?B?dENtQVpXK3cvTmdFMjV3MldrMlU4YVdjbnZaUjVGQ0xJQUpqVjd3bW4zRkt4?=
 =?utf-8?Q?2gJW/xE0D+1lzeW0oDEFHDAIJ?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b783f059-68bc-4290-3335-08dd86c416bc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 02:18:11.1092 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HOfL+yKbTC3CSXgt/c1AoU8+j82MySAGkhscZf7I4ovxNbemzti32Dn9P47tq4Eae3jbcyjMMhm2y9bfcePdhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10758
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

Hi,

On 04/25/2025, Luca Ceresoli wrote:
> devm_drm_bridge_alloc() is the new API to be used for allocating (and
> partially initializing) a private driver struct embedding a struct
> drm_bridge.
> 
> For many drivers having a simple code flow in the probe function, this
> commit does a mass conversion automatically with the following semantic
> patch. The changes have been reviewed manually for correctness as well as
> to find any false positives.
> 
>   @@
>   type T;
>   identifier C;
>   identifier BR;
>   expression DEV;
>   expression FUNCS;
>   @@
>   -T *C;
>   +T *C;
>    ...
>   (
>   -C = devm_kzalloc(DEV, ...);
>   -if (!C)
>   -    return -ENOMEM;
>   +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>   +if (IS_ERR(C))
>   +     return PTR_ERR(C);
>   |
>   -C = devm_kzalloc(DEV, ...);
>   -if (!C)
>   -    return ERR_PTR(-ENOMEM);
>   +C = devm_drm_bridge_alloc(DEV, T, BR, FUNCS);
>   +if (IS_ERR(C))
>   +     return PTR_ERR(C);
>   )
>    ...
>   -C->BR.funcs = FUNCS;
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Adrien Grassein <adrien.grassein@gmail.com>
> Cc: Aleksandr Mishin <amishin@t-argos.ru>
> Cc: Andy Yan <andy.yan@rock-chips.com>
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: Benson Leung <bleung@chromium.org>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Christoph Fritz <chf.fritz@googlemail.com>
> Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> Cc: Detlev Casanova <detlev.casanova@collabora.com>
> Cc: Dharma Balasubiramani <dharma.b@microchip.com>
> Cc: Guenter Roeck <groeck@chromium.org>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Janne Grunau <j@jannau.net>
> Cc: Jerome Brunet <jbrunet@baylibre.com>
> Cc: Jesse Van Gavere <jesseevg@gmail.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Liu Ying <victor.liu@nxp.com>
> Cc: Manikandan Muralidharan <manikandan.m@microchip.com>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Phong LE <ple@baylibre.com>
> Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>
> Cc: Sugar Zhang <sugar.zhang@rock-chips.com>
> Cc: Sui Jingfeng <sui.jingfeng@linux.dev>
> Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> Cc: Vitalii Mordan <mordan@ispras.ru>
> 
> Changed in v2:
> - added missing PTR_ERR() in the second spatch alternative
> ---
>  drivers/gpu/drm/adp/adp-mipi.c                      |  8 ++++----
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c        |  9 ++++-----
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c  |  9 ++++-----
>  drivers/gpu/drm/bridge/aux-bridge.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/aux-hpd-bridge.c             |  9 +++++----
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c |  8 ++++----
>  drivers/gpu/drm/bridge/chipone-icn6211.c            |  9 ++++-----
>  drivers/gpu/drm/bridge/chrontel-ch7033.c            |  8 ++++----
>  drivers/gpu/drm/bridge/cros-ec-anx7688.c            |  9 ++++-----
>  drivers/gpu/drm/bridge/fsl-ldb.c                    |  7 +++----
>  drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c      |  9 ++++-----
>  drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c        | 10 ++++------
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-link.c     |  8 ++++----
>  drivers/gpu/drm/bridge/imx/imx8qxp-pxl2dpi.c        |  8 ++++----
>  drivers/gpu/drm/bridge/ite-it6263.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/ite-it6505.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/ite-it66121.c                |  9 ++++-----
>  drivers/gpu/drm/bridge/lontium-lt8912b.c            |  9 ++++-----
>  drivers/gpu/drm/bridge/lontium-lt9211.c             |  8 +++-----
>  drivers/gpu/drm/bridge/lontium-lt9611.c             |  9 ++++-----
>  drivers/gpu/drm/bridge/lvds-codec.c                 |  9 ++++-----
>  drivers/gpu/drm/bridge/microchip-lvds.c             |  8 ++++----
>  drivers/gpu/drm/bridge/nwl-dsi.c                    |  8 ++++----
>  drivers/gpu/drm/bridge/parade-ps8622.c              |  9 ++++-----
>  drivers/gpu/drm/bridge/parade-ps8640.c              |  9 ++++-----
>  drivers/gpu/drm/bridge/sii9234.c                    |  9 ++++-----
>  drivers/gpu/drm/bridge/sil-sii8620.c                |  9 ++++-----
>  drivers/gpu/drm/bridge/simple-bridge.c              | 10 ++++------
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c        |  8 ++++----
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c       |  8 ++++----
>  drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c      |  8 ++++----
>  drivers/gpu/drm/bridge/tc358762.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/tc358764.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/tc358768.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/tc358775.c                   |  9 ++++-----
>  drivers/gpu/drm/bridge/thc63lvd1024.c               |  8 ++++----
>  drivers/gpu/drm/bridge/ti-dlpc3433.c                |  9 ++++-----
>  drivers/gpu/drm/bridge/ti-tdp158.c                  |  8 ++++----
>  drivers/gpu/drm/bridge/ti-tfp410.c                  |  9 ++++-----
>  drivers/gpu/drm/bridge/ti-tpd12s015.c               |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_dp.c                   |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_dpi.c                  |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_dsi.c                  |  9 ++++-----
>  drivers/gpu/drm/mediatek/mtk_hdmi.c                 |  9 ++++-----
>  drivers/gpu/drm/meson/meson_encoder_cvbs.c          | 12 ++++++------
>  drivers/gpu/drm/meson/meson_encoder_dsi.c           | 12 ++++++------
>  drivers/gpu/drm/meson/meson_encoder_hdmi.c          | 12 ++++++------
>  drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c         |  9 ++++-----
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c      | 10 ++++------
>  49 files changed, 201 insertions(+), 237 deletions(-)

[...]

> diff --git a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
> index f072c6ed39ef183b10518b43bd6d979bc89e36f9..8069c4881e9058f5462f99116799b589bd52b19e 100644
> --- a/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
> +++ b/drivers/gpu/drm/bridge/imx/imx-legacy-bridge.c
> @@ -59,9 +59,10 @@ struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
>  	struct imx_legacy_bridge *imx_bridge;
>  	int ret;
>  
> -	imx_bridge = devm_kzalloc(dev, sizeof(*imx_bridge), GFP_KERNEL);
> -	if (!imx_bridge)
> -		return ERR_PTR(-ENOMEM);
> +	imx_bridge = devm_drm_bridge_alloc(dev, struct imx_legacy_bridge,
> +					   base, &imx_legacy_bridge_funcs);
> +	if (IS_ERR(imx_bridge))
> +		return PTR_ERR(imx_bridge);
>  
>  	ret = of_get_drm_display_mode(np,
>  				      &imx_bridge->mode,
> @@ -71,8 +72,6 @@ struct drm_bridge *devm_imx_drm_legacy_bridge(struct device *dev,
>  		return ERR_PTR(ret);
>  
>  	imx_bridge->mode.type |= DRM_MODE_TYPE_DRIVER;
> -

Nit: Can you please leave this blank line undeleted?  And I see similar
situations where lines are unnecessarily deleted by this patch, so this applies
to the entire patch.

> -	imx_bridge->base.funcs = &imx_legacy_bridge_funcs;
>  	imx_bridge->base.of_node = np;
>  	imx_bridge->base.ops = DRM_BRIDGE_OP_MODES;
>  	imx_bridge->base.type = type;

-- 
Regards,
Liu Ying
