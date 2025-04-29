Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE7FA9FF70
	for <lists+dri-devel@lfdr.de>; Tue, 29 Apr 2025 04:09:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E740110E1B6;
	Tue, 29 Apr 2025 02:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="ZnUvsBd2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2074.outbound.protection.outlook.com [40.107.21.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C54B10E1A8;
 Tue, 29 Apr 2025 02:09:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLSHIygM3kWsbCpxGqIThnPsERLr5GlZXV2kJfB/o399WW6VujhhP+xYKJQFLdDUJbzJW705L5unqwDr5Enx2ogWK2mFngKT0FJYf16DcBDCTbDfpSJ4S+AI6G8Uj4krjcVGRUr3T/HtS+Q15pcjsMp1WbtYzD8n7RLQl61XdfkFMGCM7Sbyn1MaBtV6RzKpAqDtYW9j4RHJZIJOrBt/m5SnfC2ApA3ayTj7jzlLczQPXE9AdGO6Z/9U3vLm2cIPnKbYqhvk55D67BQzT19XJaU7qKqnLQuTCZP0BIqkj4pgiNJQEo8m5jd10ZSB8qWsoMZXU8l6FKAzfxgN+tjdUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SlheCeywAKjXfEiJ1KKSKueJqRKG5WyDFXULljb+aPs=;
 b=TW8ca7RCFs4uEPJLZQ8YezwXn8pkvGSNozKsgIHGrUw/harKH0awrlj4bov4Po9Go7G3u58r8rzUl9Lclhue2PrZhRAewaU1RpfapA2tV6ZP1QrmknsnKleh5j0eqrojaMhwuaKwBG124USyU26Q9cVzSdd1dKXuTy1uz/LBxjo3cybHr32j7ak/SHo9PQiunCxyfZirp+CFZ3oTOIhPoAjvS/c5x486Yoizwht1rsX0NRdKU+gAsokPk2Hya/7hdwy2PpHgoSbWIaXOuZls+otmy64IVTTRqRqDoEPozaWdl9UcHxXLSbR7lWxFe5bXFL0SFghmgKBMf3dxQWaQaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SlheCeywAKjXfEiJ1KKSKueJqRKG5WyDFXULljb+aPs=;
 b=ZnUvsBd2PjqacBtQugYruInXbun5lyY5LKHToLc7KGwVECuhMg9T+P0JA3b6pmXqfgM2jN7DkKn15lpyYibWz3aaAIPZU5BRRVYFCbAwfmNtb/FReVQpw+VsuApmmZMwgsOpgeJ3+s7cJ027POP3+AQitwzg4PuOxHGNNZsKafMAguTuw7nLwgfyLt7Evr/nooTC2ZmPmplZrVZaQzRR6t0pS5CUbfUd7tj91LlO4lH3CdhZmNgmlQoRvhFNX1q4dOSUs6lS5oeakHS4yQN6vgow8Rebfcz5qfYe5GJCFw/0pJyRlLwTtMa8KJH+Lz8ooMME09JGb8jcOkwaD2NBEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by VI0PR04MB10758.eurprd04.prod.outlook.com (2603:10a6:800:25c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 02:09:32 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%3]) with mapi id 15.20.8678.028; Tue, 29 Apr 2025
 02:09:31 +0000
Message-ID: <553d62ed-976a-4e17-9678-cdc3d40ce4a7@nxp.com>
Date: Tue, 29 Apr 2025 10:10:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 30/34] drm/bridge: imx8qxp-pixel-combiner: convert to
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
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-30-8f91a404d86b@bootlin.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-30-8f91a404d86b@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0180.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::36) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|VI0PR04MB10758:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c14d6a-38ca-4982-1839-08dd86c2e0fc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U3F0OEdWazhpL003UGdUK3Q2RGxRbTB2QTdaQktqTDNYTHZNZzhGT0tGNnhu?=
 =?utf-8?B?eko1eTBKb1l1eFpHSm1KWTFMQ0J1MnBiT3lkNkhyS2QwQjBOdjgvanFKRXFw?=
 =?utf-8?B?a01tRVF6cEpTRkZ4QTczZ2dGSEJ1QlhCTUd0Y0YzZWJZNmM4VktKaE5WUk5k?=
 =?utf-8?B?VjNJL3Fob1BEUVR5L01WTlF6bFdVNGRFeXEySU43eVJCNVpTV3FyRUozT014?=
 =?utf-8?B?VnpsTDJETk12NjVMNkJGMFBLYnorMi96cmJoam1hRWxNWUhOYjFaZG9MdUpN?=
 =?utf-8?B?ODdFcGhRUjV2SDVhWjZ4c0hBNFVnWnhjR2VMYThBVmMraUtCSW9CYm9EUTBS?=
 =?utf-8?B?R1pBZEFteThQdGhnTmUyL3BOcStMN0VCa3lWcEtJRVZ5NytWd08zR1gzZkRT?=
 =?utf-8?B?cXhoOUJjbHhqRzVta1dxdmx0Unh1bGs0NEx4QlJSbVpod0RsOUV5Skk1SDdY?=
 =?utf-8?B?NFdkbWNRQzFLWS9kOGFCKzR6RGVJZGcyQk9iYmlTUzFqVEFiczdUTGorL2hy?=
 =?utf-8?B?aWIzN3VEN29LMjdITkVjbWpaQTlXeGgxRnJQNWRibkx2RzVSZ3g1NHlhU3Ux?=
 =?utf-8?B?SlRIME41bHFtSEJHY0dWMlNXODJsWnF1T09xNHlxZGFhZzJzSUlQN1orMkhR?=
 =?utf-8?B?YzQ2YjJZMmZQYmdQVXo3U05DbWYrdllqZWoxeGJQZE8yVVhheGFkc3drd1cx?=
 =?utf-8?B?bEZQSTVMYzlKRE5oUmJDSERLaFRFZ3hYSFYrSWRjSHRYK3dvbkNXQkdpTzEz?=
 =?utf-8?B?MDVsWW9LYkJEdkludjlFb2FVTlZ0cVdWdlQyMmloMmNrQUVwdzdUNDBhdmhU?=
 =?utf-8?B?YU9ocVQ5OHRMeFJtRW1WZHpKNVdUcDZMNm41TWZBOG94OUJzRndleWpQcW9U?=
 =?utf-8?B?blJCQk5pV2hySTlXVzI3dVp3SE9ZdjNjbkJiZmhVZUpYZ0xMVnV1RFZWeU92?=
 =?utf-8?B?U3FKTmt4ckJIV3hobk03by9ad1VjVzkyYjBtUjBZcjdXV1JVMFB5OVBNWlJI?=
 =?utf-8?B?UjRWZmRTbWQ3REtva0tlUkEzbjh2ZEs3aFhZZ0l1REY1azFEc3dvOVJxUjM1?=
 =?utf-8?B?ODFhYS9KWnJvbzZEM0JKNVZXSXFncG9sczBRN1FYdXJPY243bWhVc2FhdlMv?=
 =?utf-8?B?REI3YjhucXlHK3ExVEwrc1pNVy9ROHFHZEFrQzRmZkdONGFtaW9xTmlnVGta?=
 =?utf-8?B?S3oyVkRHTkNWRkxPQ3ZtbmRQbFMvbHJRRkhYSFhCMlNTVFNDN0d1N3B2NklR?=
 =?utf-8?B?cXg3UXRJUEJXWDRLbkdTbFcvRVZOR3A1VlhiSUdPSUhPdjJPRGd6UnRubFdK?=
 =?utf-8?B?UCtQc1hCVWQzd2VTYzJTQ2FXcG1zUmt3VmVWZ29ONUpZdVFueWlNT1o2Sklx?=
 =?utf-8?B?Y1V2dFRLNE8yM0J4VXAycDJJYkRLVXkvbjAwNHFMNW0vUk9LN3c3dWpOQjdF?=
 =?utf-8?B?TXk1ZlJzRkowYUE3cFZpVU9wbFJLNnJCTExuaGlicWp4MVI4c2tza1JLemZH?=
 =?utf-8?B?WlArME5weXh5cnJDTzl5Z3U2UGNDMDJnSDNwVXVFMmJQeTl5NU5oYnArdVZQ?=
 =?utf-8?B?R0paQ0hyNVhyVFYxRXZHazdFYXhoMVJDNENDNXVaRjkxVk5vRTVqaWdWRTE4?=
 =?utf-8?B?aVVOSC9EV3BQVnhTQlVxaEhsSmlPcWNvWW51STBjaFF3UjlzSWJ6aFI4RUE2?=
 =?utf-8?B?V2kwdm9xSXFsRkxaV3hyeHZ1NmVJNTdYcXdEVGdFY0NBcG93UXdydS9MTDla?=
 =?utf-8?B?QXQwVjNaZy9jVlN6b3BBcVlNdzRMbzZsNGVEVWorWm12eGNpeXpLZURCdnRS?=
 =?utf-8?B?aTduMURXK3JsTGZGeENwZDUxb2dMOXBRdDRzOVVCZkxlWjZoUGNEb0dySStP?=
 =?utf-8?B?eDIwazYyN296anNMSzFnMi9VRDZFKzZyOXR1cU00MW91bGN3NWNyaThka0Nv?=
 =?utf-8?B?Q0t5cFpaUUNwYkw0UnMrMXI2ZlJsU0ZWMWRTSlBWNGcwY0had09SbG1COU1i?=
 =?utf-8?B?MFdUZVlOTzd3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXR4TWc0QUo3ME1QZk1GWjlZeHlZVzZuWjBTYkFJU2JESUVvYXFrRUVmNDR0?=
 =?utf-8?B?UmNDT1IvNVpNNGM1Vm4vQjhZampsY0FTZFV3OHhuYm1rRnljR3Q1Z3pUVHE2?=
 =?utf-8?B?dDBzeDR1TFA3NFgzME9BRTJWeXBhZHpYK2FhRVNVOXR2YU9lQ2tmOVFpbERF?=
 =?utf-8?B?U05wSmtGWjA0TVdHTEhreXRWVVpueERDUGhseHg3dlBSWHBVOTU2VGpJVU9v?=
 =?utf-8?B?elEySnk5dS9jaVI2WnhoOEMxOGdnZWVSU0tUa0ZZcy9VMDNzNk9jdk9PQWwy?=
 =?utf-8?B?MmtucC9uVVhiUFQ5NlBnSGpOa2s3S3FDUEJlVDNCeXVlMlFVeThSblhHMk1r?=
 =?utf-8?B?Rmtaa1BaMlFacXVhd25oaHRWMFJkUXdDV1RtcjhuM0RIMmFiM3NrNStkTTA1?=
 =?utf-8?B?cUZ0U2VCc0kzMjBmTkZSSFFkVzlHQXBzR1FGbFdJSFpvMzJmMThSNGtWRzdR?=
 =?utf-8?B?QVA0WlExZHExaTBFT205UlNWSnlRUlgxb245ZEVLMTZGRXZMcS9OSXp3SXF4?=
 =?utf-8?B?RHYzWjQ2anNzcmE0T2JHTXRyazVoeUFSR0JpaWE0TVBTZm5JNlNUZEQ3U3JH?=
 =?utf-8?B?WUZFN0g3K3YxZjFObkhPaEQwOXh2TGwwazdLSkpMaUN2czVnUmx2M3E3bGhJ?=
 =?utf-8?B?dlY2cnBIY2JtTi9OZERjb2g0cVJlOTF0U2xadFBPdlFUb3JJTnVvYUgzNlFL?=
 =?utf-8?B?SjdZSmQ1b2hudkJlV1drUFdqVmRSNXYvMXhWZjJiWFpRb0NVQlU1cFRGME1H?=
 =?utf-8?B?S21FSnB1M1N4bEVITDY2a3QzOGRHT0YwQSt0Q0NPK1h1WVk1bHZvTHhUalRI?=
 =?utf-8?B?U3BOckdweExsMWRuTTM4MkNvZkxBcGdkUWRyK2NaUXZKdVdncGxKNUlyL3hp?=
 =?utf-8?B?QjNtV1daN0d0NmJOaituYTFXSVBER0ZVUDF5QytxbEQ3Z01tKzc0ckhWNFBo?=
 =?utf-8?B?dGRVRnBXbHBEd2I5S01vWSszU1lHZFozbGdocEdzd3VvbmNWYVk5K245d3lT?=
 =?utf-8?B?UGdWNm5BcUkwNGtaQmpHUzNRT3YrQVVaSUYrV0pLK1FKeDFhN01xN0pYaE5Q?=
 =?utf-8?B?L1pLbnlzQThoOXlZR3pqRE9NVjZZdHVDTkdaeDRJQ0tuTDRBU0hmRVNNNWd2?=
 =?utf-8?B?bVQxcjhhNWlyaXJCY01kNnhZc0kyR2ZEd3JraWZwUkRIQ3JISVE5SlZBek12?=
 =?utf-8?B?Q2g4VU5kUVBWQzhTT0FBZXFCTlRpL0xTVS80WkJMVzQ2TUNtV1FIc2MwSGJt?=
 =?utf-8?B?REF0YmtlZEJqVXlqaDNLeWgyclU1VGpobzZDUWdTaFVab1o4VVIvNUMyOVh1?=
 =?utf-8?B?UjNiaGdkV1BjY2FDa0RFK2pKcjVzajVzQjV2Y2dyd2RhN2s2RytROWRzbE50?=
 =?utf-8?B?SW82djQxVTBJb2hQUG5rSkwvZWV3WmR1Y21RV3Y0b1pFcDc1RjBKci9ac0hU?=
 =?utf-8?B?aU13ZUNaKzRab3lTR0xQeWF2WTlrUmg1Zjg4Myt5aUx3ZVp5T3prZW00SERq?=
 =?utf-8?B?TW9RNFBGQUhpWHZNanZiL3ZpcXFCdWt1WnhXZkdGK1EwUEsxTU1ZQzcvR0Jr?=
 =?utf-8?B?NnRwYk9vQUJIUEVLaFBuWlZ4Ym1jUTYyZzRTclpMSnppbTJTYk5QMy9YZ3B2?=
 =?utf-8?B?SU5jRzlJZ1B5bko4NHFLaklBUHIxS0NpNjNscER0MEhkUHJ3a2tyZnlYTU5P?=
 =?utf-8?B?U0s2eVIxLy9rMHpPYldienExQ0I0V3NyaEhPZ1doRysvYlIyU0RiOHRqK1Ja?=
 =?utf-8?B?QmNGVTBnaFZMUlZvT2lTWUhNdGJlbThPTmV4WTVFcHZkUHZEQWVrNW0yblMz?=
 =?utf-8?B?T2dUNzNhcnZLYWtIQmpRTUtBRkpMZ1FLTmJ1RU5zZnBMTnBwQzY4QzdzQ0dY?=
 =?utf-8?B?S0dlb0YzaFNnYzRhOTYvS3V2MjdUVFBhclBQYUVGQUQ5cXdYMTIwQTVqODNp?=
 =?utf-8?B?MW9SYnNyK0JFaC9ITGhyMndrNWs0L0h2VFRFYkVDZUtzbmhQbm1qQ3NHRmFN?=
 =?utf-8?B?dFZTdDJLZTdRQXFac2NwK0dxb0hvU2RVU1d4UTN6N2g2YXhKWHpmd3N3T3Fp?=
 =?utf-8?B?N00rZWM1WEdUd3JoUWVGS05aN0REak9LY24rTEtyNlArKzhYMDAxSDIwNzEr?=
 =?utf-8?Q?5OlYPiZSKRM4Rjo7rWeBAIFtl?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c14d6a-38ca-4982-1839-08dd86c2e0fc
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 02:09:31.5706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 21zRut4BZRLW7DIBZaiv3SRJxgwJ9gAez9ohxtYMfNNza1DjOMnUrs4btDIAv83VJO/dSFeNw6QpKhBxYzCGQg==
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
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> Cc: Liu Ying <victor.liu@nxp.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> index 1f6fd488e7039e943351006d3373009f0c15cb08..40a8a5a53a781137e722309ff91692cf90d881da 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
> @@ -68,7 +68,7 @@ struct imx8qxp_pc_channel {
>  
>  struct imx8qxp_pc {
>  	struct device *dev;
> -	struct imx8qxp_pc_channel ch[2];
> +	struct imx8qxp_pc_channel *ch[2];
>  	struct clk *clk_apb;
>  	void __iomem *base;
>  };
> @@ -307,7 +307,14 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>  			goto free_child;
>  		}
>  
> -		ch = &pc->ch[i];
> +		ch = devm_drm_bridge_alloc(dev, struct imx8qxp_pc_channel, bridge,
> +					   &imx8qxp_pc_bridge_funcs);
> +		if (IS_ERR(ch)) {
> +			ret = PTR_ERR(ch);
> +			goto free_child;
> +		}
> +
> +		pc->ch[i] = ch;
>  		ch->pc = pc;
>  		ch->stream_id = i;
>  
> @@ -333,7 +340,6 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>  		of_node_put(remote);
>  
>  		ch->bridge.driver_private = ch;
> -		ch->bridge.funcs = &imx8qxp_pc_bridge_funcs;
>  		ch->bridge.of_node = child;
>  		ch->is_available = true;
>  
> @@ -345,8 +351,8 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
>  free_child:
>  	of_node_put(child);
>  
> -	if (i == 1 && pc->ch[0].next_bridge)
> -		drm_bridge_remove(&pc->ch[0].bridge);
> +	if (i == 1 && pc->ch[0]->next_bridge)

Since this patch makes pc->ch[0] and pc->ch[1] be allocated separately,
pc->ch[0] could be NULL if channel0 is not available, hence a NULL pointer
dereference here...

> +		drm_bridge_remove(&pc->ch[0]->bridge);
>  
>  	pm_runtime_disable(dev);
>  	return ret;
> @@ -359,7 +365,7 @@ static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
>  	int i;
>  
>  	for (i = 0; i < 2; i++) {
> -		ch = &pc->ch[i];
> +		ch = pc->ch[i];
>  
>  		if (!ch->is_available)

...and here too.

This is what I get when removing the imx8qxp_pixel_combiner module.
-8<-
Unable to handle kernel NULL pointer dereference at virtual address 0000000000000144
Mem abort info:
  ESR = 0x0000000096000004
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x04: level 0 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
user pgtable: 4k pages, 48-bit VAs, pgdp=000000089e613000
[0000000000000144] pgd=0000000000000000, p4d=0000000000000000
Internal error: Oops: 0000000096000004 [#1]  SMP
Modules linked in: mpl3115 isl29018 industrialio_triggered_buffer kfifo_buf cdns3 cdns_usb_common snd_soc_imx_audmix rtc_imx_sc imx_sc_wdt imx_sc_thermal imx_sc_key imx8qxp_pixel_link6
CPU: 1 UID: 0 PID: 528 Comm: modprobe Not tainted 6.15.0-rc3-next-20250424-00059-gee51752c256e #217 PREEMPT 
Hardware name: Freescale i.MX8QXP MEK (DT)
pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : imx8qxp_pc_bridge_remove+0x38/0x6c [imx8qxp_pixel_combiner]
lr : imx8qxp_pc_bridge_remove+0x30/0x6c [imx8qxp_pixel_combiner]
sp : ffff8000840f3c40
x29: ffff8000840f3c40 x28: ffff00081e75d780 x27: 0000000000000000
x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
x23: ffff0008100fc090 x22: ffff0008100fe490 x21: ffff00081e69de00
x20: 0000000000000000 x19: ffff0008100fe410 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 0000000000000013 x13: ffff000810049010 x12: 0000000000000000
x11: ffff0008182bc550 x10: ffff0008182bc490 x9 : ffff000810049010
x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : fefefeff6364626d
x5 : 8080808000000000 x4 : 0000000000000000 x3 : 0000000000000000
x2 : ffff00081e75d780 x1 : ffff00081e75d780 x0 : ffff80007af9bdc0
Call trace:
 imx8qxp_pc_bridge_remove+0x38/0x6c [imx8qxp_pixel_combiner] (P)
 platform_remove+0x28/0x44
 device_remove+0x4c/0x80
 device_release_driver_internal+0x1c8/0x224
 driver_detach+0x50/0x98
 bus_remove_driver+0x6c/0xbc
 driver_unregister+0x30/0x60
 platform_driver_unregister+0x14/0x20
 imx8qxp_pc_bridge_driver_exit+0x18/0x814 [imx8qxp_pixel_combiner]
 __arm64_sys_delete_module+0x184/0x264
 invoke_syscall+0x48/0x110
 el0_svc_common.constprop.0+0xc8/0xe8
 do_el0_svc+0x20/0x2c
 el0_svc+0x30/0xd0
 el0t_64_sync_handler+0x144/0x168
 el0t_64_sync+0x198/0x19c
Code: aa1503e0 97f547f8 390512bf f9400a94 (39451280) 
---[ end trace 0000000000000000 ]---
-8<-

On top of this patch series, this issue doesn't happen if I apply the below
change:
diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
index 40a8a5a53a78..2eb0ade65d89 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-pixel-combiner.c
@@ -63,7 +63,6 @@ struct imx8qxp_pc_channel {
        struct drm_bridge *next_bridge;
        struct imx8qxp_pc *pc;
        unsigned int stream_id;
-       bool is_available;
 };
 
 struct imx8qxp_pc {
@@ -341,7 +340,6 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 
                ch->bridge.driver_private = ch;
                ch->bridge.of_node = child;
-               ch->is_available = true;
 
                drm_bridge_add(&ch->bridge);
        }
@@ -351,7 +349,7 @@ static int imx8qxp_pc_bridge_probe(struct platform_device *pdev)
 free_child:
        of_node_put(child);
 
-       if (i == 1 && pc->ch[0]->next_bridge)
+       if (i == 1 && pc->ch[0])
                drm_bridge_remove(&pc->ch[0]->bridge);
 
        pm_runtime_disable(dev);
@@ -367,11 +365,8 @@ static void imx8qxp_pc_bridge_remove(struct platform_device *pdev)
        for (i = 0; i < 2; i++) {
                ch = pc->ch[i];
 
-               if (!ch->is_available)
-                       continue;
-
-               drm_bridge_remove(&ch->bridge);
-               ch->is_available = false;
+               if (ch)
+                       drm_bridge_remove(&ch->bridge);
        }
 
        pm_runtime_disable(&pdev->dev);

>  			continue;
> 

-- 
Regards,
Liu Ying
