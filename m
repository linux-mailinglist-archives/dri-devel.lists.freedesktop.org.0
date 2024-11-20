Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B289D33B0
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 07:38:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 976EF10E6B7;
	Wed, 20 Nov 2024 06:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="h1gUc/on";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2087.outbound.protection.outlook.com [40.107.105.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BCB10E6B7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 06:38:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bYWw9MIZsO7MstxUY7VxG6HWmtnEhGLuMM+x/WBkJjaQ/Gg3YIrieIzYI6GGM2Kyh3MJKVRUT8669d0p2oF+SIy9buJFoGNUqI4c/EIkPzv6LMxLO1p1qgYbRlcgzsLy2cIRGXIvrTnRykwCfc/awJfANjZP30RDJz+FusI7vyhxqFfLY2yr/CYyDs5S63//iIESl2nWqAxmvuzdQWI6708WPjFUFqMwWS/SKzAp9ORRg6jsXe+1VM1vlv8RP/gkdchJTBEoP0aVLFxMDjNsHOkp1p/VTwFJE/4gOYF4rGIM8yxNTpufGDBO0fpiOUmZz3REEsIH0EBFQLUw+0XDgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JxPrH5ghtZ2Nvs4SIvWIbexOq32Y//Ml0GrDQr/tDQ=;
 b=ujBTQNquVLVD6QO2QrJmbtRUxn1ORCDyYRmQ2GrV909VYn0KtohH/r7R/X/6zoavAPWvP5pnXDAKQ5lWNPWLQAWaoZEKrh6EdKPJgGHQ21YvWD76K7R+KOyW1ZLSqJvHmC56cuAJMdjT78z+NL/NnkQGP2Vx/TG/UHyI9cjvNULBmoSi/mTJJwA3G/OPfocYwE4SU2Pm6NqzlC8kfL1HcP6xJU4ekmfkIdcAMQAYLpSIPb6N81cQjEabopYZCKNwxP0hr5tUiZUdpPAEHCbLqBVnMjwi9FNLMPMHlISQ2Rq2NSgno3bEj7o63sozGVzrWZAP++gurdlufWTy+21AOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JxPrH5ghtZ2Nvs4SIvWIbexOq32Y//Ml0GrDQr/tDQ=;
 b=h1gUc/onTlNuBBmDRJWknSOiVeHToOPh7zdftmMmOx+AuFBByMJMiHg+jmCRwx3lDvzo6Uq4YqTgw1SOuh4YEcVURmGjQXfOQ+kIN3K2V5Sm88y+pG6PlBK4WExe6iQGUaNySELpbGcn/UXnpb8mq8iRUeh+T8q8htx1sisZLGSqBb03oRRxhw/smkP+FZdMEfc5R+hAcy+LIckjEnTWITOj6AW+w8HddVeoDMK9zqCtour7Iy2kGKDZkaKrYLe4BLf55Gmki3rIt/TNo5juC/sSCipSvSPMr+m1JFHd0yPtbbTsebzU+elD9WRUH89L4VUnHu3wKs6lPNPGOcvRCg==
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DB9PR04MB9555.eurprd04.prod.outlook.com (2603:10a6:10:303::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.20; Wed, 20 Nov
 2024 06:38:14 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8158.017; Wed, 20 Nov 2024
 06:38:14 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Marek Vasut <marex@denx.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-clk@vger.kernel.org"
 <linux-clk@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
CC: "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "robh@kernel.org"
 <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "catalin.marinas@arm.com"
 <catalin.marinas@arm.com>, "will@kernel.org" <will@kernel.org>,
 "abelvesa@kernel.org" <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, "rfoss@kernel.org"
 <rfoss@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "nfraprado@collabora.com" <nfraprado@collabora.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>
Subject: RE: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
Thread-Topic: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp
 pixel clock reconfigure parent rate"
Thread-Index: AQHbNmKO+PHF1Z/Vm0OxVRcdedNQObK4R9AAgAQX1dCAAXQEAIAAYy+AgAD0WACAAFJ44A==
Date: Wed, 20 Nov 2024 06:38:14 +0000
Message-ID: <AM7PR04MB7046587167BF790549B8560F98212@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20241114065759.3341908-1-victor.liu@nxp.com>
 <20241114065759.3341908-3-victor.liu@nxp.com>
 <df6ebdde-65f8-4aad-93c7-b1df695bd2ef@denx.de>
 <AM7PR04MB7046546A882A8D48E135D84698272@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <8a4fd234-4c7b-4a04-990d-3222aaa5172d@denx.de>
 <AM7PR04MB7046E282FD702ACE5E288F8998202@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <83be0a27-6b6c-4ba6-b9dc-f914a10abace@denx.de>
In-Reply-To: <83be0a27-6b6c-4ba6-b9dc-f914a10abace@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|DB9PR04MB9555:EE_
x-ms-office365-filtering-correlation-id: eec7f7ac-1b34-4724-a45c-08dd092de8e5
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?Z09Kc01lczRwWmQ1VjFUV2RjSGNxTmUrNm9GTWQzK1lMaXVJNjhKZGtndkE1?=
 =?utf-8?B?YnZBRXNwRHRiMzRBNDVnSlZvWnpXWXhrQW1mYnQwUXVxWEFRdHU0TzZaS3RB?=
 =?utf-8?B?d1drVGttS1pVTVNibi9BWWdCU1Q0N0V5eDZFOGZIY0s2N25za0Y3ME9jUHRh?=
 =?utf-8?B?SStiUHh0bGxWckxtNEg1QU5ZZzQ3LzN0aW85ZHViUVc1NktZTFdiZ3hwbThs?=
 =?utf-8?B?Rm1Benl3cG5mb1RVZkF4VC9jOVVFdW5QL2VKSTd2NklZNERkbnJKTnVqUVgz?=
 =?utf-8?B?azh1SWdKa24zaUtlUFcrSXpvSk8wS0hJRVlsVjBia21EZ24xNDEyd1krUHBP?=
 =?utf-8?B?RmhreXBVV3NoVmUwODNoUUR1L3ZwcXkwTFVIZUJzakFWM3hNRWFxSWxsUlFn?=
 =?utf-8?B?a2p3a0EzNndFZ0V5Y3NDVzNqZnNId1IwTUtIQWE2UWRiWlBkQi9iSGdhK2pu?=
 =?utf-8?B?ZUtDT0FyNDEzVkswM2ZyNllseFk1aXdwVUNPUkxlSUlnTFluTUZkSVJzUWRp?=
 =?utf-8?B?TWVCZDBEa3d1blZUeFd4RjhGTHNhZ3VDUGdMUGs2dGE4OXNuRjIzMUkwYnFh?=
 =?utf-8?B?ZFZCa0ZlYWxsbnZGdFNMbFNiNm5FbjlIZTdJYkp0YkdUSER0ajVCRWdkNkgy?=
 =?utf-8?B?K2k3WDl0QUdDWFNSWDJKVktBcG90c3V6UnN4Sll0elQvY0dvYVR1WlN5cjR6?=
 =?utf-8?B?VWlsRkdPREtiWi9qSEZBTTlaNnlLR2tTaHBvZjdxc1BoODA1M0ZXRloxZnB1?=
 =?utf-8?B?ZE56WGllWXZLdVdzSE13TmJqM000WWkySVBLYXN6K051bmVkMFpsMW1zb0NR?=
 =?utf-8?B?QXMwZUx4R2JpR1dlVUlYdUxsK1Q5TlBkME82dXlCTGlKNFF1dTVxQmx1Y1A1?=
 =?utf-8?B?dDk2Y3hNTzQzajFDYWpIOGI3L0h0VGdhYjBzMTNmaWpOZWVoUFlwQUVSTlZq?=
 =?utf-8?B?UzFrZUJXNVNOU3dBMzlSL1dLTk9HemtCRVB0VjJnalFubXZiY0RwMWEwTUNV?=
 =?utf-8?B?MWxlRmprQUNzVEhqVlpWZ25qZ2tVRVVsbVY3anY3R2UzYVBpdmwvQU1xTnd0?=
 =?utf-8?B?bCsyOEFPZ2pLbUtvR1lzTHFNTmEyVGtpbmJ1VFFMY0xIajlVejY4NmhPdkY2?=
 =?utf-8?B?b3lnVFVCWjVaV1FYUk4ycXZKZkdZYk50aGpDelJDTlFlekM4d2N0SGRMZE9Y?=
 =?utf-8?B?dmRBT21aR0ZFS2YrcGVBZzgzbFpKRDBaSFhhdHQzT01IMGMrNGhndFhoZkZr?=
 =?utf-8?B?VCtsRURuTS9oQjBkemFvbzJETlh4K1c1VTc5OW1yY1NjTGNyR2h0WTJNNEQ1?=
 =?utf-8?B?VHdEQ1NXZzJhTTBHbXdYZ2dpVUFTRks2bFc3ekNNR2VtTzlnWFk2alJmZFZH?=
 =?utf-8?B?ZXYrRkFGWFF5WEh4YXZnRC85K1gvOUs5aXBsN0d2UWRMYU90OXVjN29IdmIr?=
 =?utf-8?B?QVNsSVRsOStLVWMwM20vcnBieG9HVVFjMytLMWlLV25HUVA3QnNOSEtpVWZ2?=
 =?utf-8?B?WnVzbGtYMDVTYUdveDdpOWlyUm9WTDVIUW5LLy80UEw5bDBHNFlRd3VGOTFX?=
 =?utf-8?B?UjhUdWNWVzBHR21aUDQ1ZGJybnp1VjJBYWwwOFk5WEdFWi8zelcwK3pMN0Qz?=
 =?utf-8?B?Q1hFaU04MGlOdGJWcHZoNklpZDNjWE5IWnFEd1BmT2dJcEV2ektoaWJUQWg5?=
 =?utf-8?B?S3dFa0VleHhGMGdUZlV1YnlEZzQ2QnRsMURHSVlRVVluenI2MUUzaXpMVWNZ?=
 =?utf-8?B?NGR1czNxcW9oc3BOMTB5QzZFY29VVU4wdFp6MmNzSkxzWjYzRW9ucGsyZ3Qr?=
 =?utf-8?Q?7wmteu0O1UNliOHUb8IkLT/YSiANKeKYDN3aU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bEFBUkl3ZXNNK2xiYzlIOHMxYXlNVEFHOFhzbmljY01EVFFnQ3lVRU90SnQy?=
 =?utf-8?B?Z1FGR3gzZWt3TVVTT1hhMHBhckEreFdxb1oxOXFBSXRBdExBNjJDVUJGSWRO?=
 =?utf-8?B?WkJIdVkwcVp1dGhIejFUcmRGS25Kemg3SVJ4b3NGQmY4cmFYcVBpZXAvU1hE?=
 =?utf-8?B?ZGg5ZUlxNUU1MmpvSUVuR1JaNTN4aGxuNHNJem5hejdKREk2VHdsYUk3WkNo?=
 =?utf-8?B?Y0djVXlmVFh2amFSMnoxQ0RnNUU3QjBTR3RWSGhxZDYvYUJIem14M2JqMldZ?=
 =?utf-8?B?VWI5MVpmYzIyaDUrUnF5S3ZLU2x4czI0bUE4WUE2a0R5ekxIQ3lFWGcxWXY2?=
 =?utf-8?B?NzBBT3hQWUxUdmV4MHd6TlQ5WVRKd0xRVTI2RGk1NGxCZXdIdDVFcmdNT096?=
 =?utf-8?B?TXg3MGN2b0dKWXZGbHQ2bGxIWFd6WVZjcjc3cjdGR0dhSzRlY05TeFg2SVZy?=
 =?utf-8?B?OG4xa1psdWdMZmtLcEdoUC9Da2lQaStYN3U1WmVTUkxRL29vc0ErL1RsN09Q?=
 =?utf-8?B?V0tlS0tnQWl0b043RGt0U2UvUkJDSTF6Mk1Uc0lBWGhZNEFMRjN6NE1FY1Ru?=
 =?utf-8?B?NzU2RUFCT1EyeDdCVUVLZi9NRFFtV2dEWVlxWHVidW4ra0txVlJPZmxEbjJK?=
 =?utf-8?B?RFhjMTIwSk1pN25uVmxyNE5mY1VjYzN6cHlMSjFhQUxZUzRtRE5DK1BoRTR3?=
 =?utf-8?B?c1o2cjhxNGIwSHBQTUtzdWlCZ3MzSC9CSFBhUnZkeEt4QnVKQTY2eWtqdjV3?=
 =?utf-8?B?eFNjc2x4a3VwK2VPVmx2ZjlDNWpjdXhNYmpSdG1lNnNROVJkci9IRTFtazZS?=
 =?utf-8?B?ZUhnV0dlUXo3cG5JNmpIOVJ5ZDh2Z01Xcll5Tkt2Q25uUjI4NCtINWRzTnFX?=
 =?utf-8?B?RXdjM2VuRFY5UTdseFgwRjJrU2ZzS25aOXh4dHEzYkZHYUxlTm1GNHlxTlZL?=
 =?utf-8?B?NFhiWGtXNkZiWlh1MHZZRjNyS01FN04zZlUzMGxyWEpGRG1KVDcwdE1LZXJZ?=
 =?utf-8?B?Q2QrVnozclIrNnN4UjgrNG9uWWxZZmp3d1hEK2l5S2lwYW9ENXlPZkdudGxD?=
 =?utf-8?B?aFlDRkxGK0FEd0U1bENmTFJiS1ZGMXdQNGNQN3BvNm9UVDhpc1A0L1ZYSDJM?=
 =?utf-8?B?THM5a29IczV3VUJ3RExWekdQZjFmKzJFTkhHZHJwWmVqZkJYT25kVEYyRHJW?=
 =?utf-8?B?Y0h4YnJJUnc5UjNHUWdXVzFCc0xwUWgwdlNHdmI0Y1Y3dDFLWUprTU1qUkhD?=
 =?utf-8?B?ZngzY3VncHcxdThZTnduczJsMjNNMUVZaUhQVlJQaXFEOHZuNFRRMGsyS2sz?=
 =?utf-8?B?OFpNR0pwd1ZwMWNTSWUrcFNyeFpvNXpnZFVJUHEzVENYaS9aQXZBazNLUFVn?=
 =?utf-8?B?cys1OUJpek9oYWtaK0RGRkU1RkFML3hEVGFJTmMyd1ZsWkRvbU8vZG9RTWpH?=
 =?utf-8?B?RE9HYVBkNTBMb0dPdkUxYThXVTRjUnpYQ0pEdEJ3YjVlMlFKUzlCLzJSVmdv?=
 =?utf-8?B?aTNBL2tadUpNUWxHQ2phakhCa3NLSmNlOUJrTWVKckI1Ym8zZ3RTWU5QbzJ4?=
 =?utf-8?B?cFN4WTdIQnF6TlhuOGJYZlM0REk4ekZpcFovTXF2N2xwVXJCV0VCL1dGaVgv?=
 =?utf-8?B?dHN3TzIzQlJWZUZWbEVQN01YYzJudVBqQk9INk02QitWSjJaNFgxZWhMQkw3?=
 =?utf-8?B?OFR4dURPanlCaFFBZHBuNTlqTy8ySVhacU1ZQlY1OVNOU0NaRXZhc2RBM0dm?=
 =?utf-8?B?MmxsT2RYcUxrVllYd0FIY25nZElGa0pDYjd3SGFzcU1GS3pkeFEzY1B2UGw4?=
 =?utf-8?B?UHpVMnRzNnExMXVKNVhldjRPRVFhVlNXSEdZNDMrNndoRVRoTFk4dVg5YkxL?=
 =?utf-8?B?NU5Ga0xTeE40MFlHU3pIK1ZVb3p4SHZsV0hmb0JMSVN4S2tWLzMxTFNhcHlL?=
 =?utf-8?B?dUE2cDlCRm9wMHBOdTQxV1d2YVpMamNhMWNOUzVoOWNub2RJeDhIOGR2ZEw2?=
 =?utf-8?B?S0JibTVhdVE1bXlYd2Fucm5odUxPZG9DQzBXK01hMDlLNzgvUHNDbWozejlC?=
 =?utf-8?B?NDBwQnVDRHU0VmpuR0hJRStTUU9xeWs3UUlCZC93ZDBSNGVkekdEV01Vc2Rj?=
 =?utf-8?Q?ZF5E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eec7f7ac-1b34-4724-a45c-08dd092de8e5
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2024 06:38:14.1962 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WtQqX1EX+AbZIF8Tt3a0UqQnGHDxJmrmjon6ZbwXsqF2JNPq3Q7bRu+pay+2YiTP5Gsh0Og0hwSqyEVr/Rn28w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9555
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

T24gMTEvMjAvMjQsIE1hcmVrIFZhc3V0IHdyb3RlOg0KPiBPbiAxMS8xOS8yNCA5OjE4IEFNLCBZ
aW5nIExpdSB3cm90ZToNCj4gDQo+IFsuLi5dDQo+IA0KPiA+PiBUaGUgVEM5NTk1IGNhbiBkcml2
ZSBhbiBEUCBvdXRwdXQsIGZvciB0aGF0IHRoZSBjbG9jayB3aGljaCBoYXZlIHRvIGJlDQo+ID4+
IHNldCBvbiB0aGUgTENESUYgY2Fubm90IGJlIHByZWRpY3RlZCwgYXMgdGhhdCBpbmZvcm1hdGlv
biBjb21lcyBmcm9tIHRoZQ0KPiA+PiBtb25pdG9yIEVESUQvRFBDRC4gVGhhdCBpcyB3aHkgdGhl
IExDRElGIGhhcyB0byBiZSBhYmxlIHRvIGNvbmZpZ3VyZSB0aGUNCj4gPj4gVmlkZW8gUExMMSBj
bG9jayB0byBhY2N1cmF0ZSBjbG9jayBmcmVxdWVuY3kuDQo+ID4+DQo+ID4+IEZvciB0aGUgTFZE
UyBMREIsIHRoZSB1c2UgY2FzZSBpcyB0aGUgb3RoZXIgd2F5IGFyb3VuZCAtLSB0aGUgcGl4ZWwN
Cj4gPj4gY2xvY2sgd2hpY2ggc2hvdWxkIGJlIGdlbmVyYXRlZCBieSBMQ0RJRiBhbmQgZmVkIHRv
IExEQiBhcmUga25vd24gZnJvbQ0KPiA+PiB0aGUgcGFuZWwgdHlwZSBsaXN0ZWQgaW4gRFQsIGJ1
dCB0aGV5IHNob3VsZCBzdGlsbCBiZSBhY2N1cmF0ZS4NCj4gPg0KPiA+IFRoYW5rcyBmb3IgdGhl
IGluZm9ybWF0aW9uLiAgSSB0aGluayB0aGUga2V5IHF1ZXN0aW9uIGlzIHdoZXRoZXIgdGhlDQo+
ID4gYWx0ZXJuYXRpdmUgc29sdXRpb24oKikgeW91IG1lbnRpb25lZCBiZWxvdyBzdGFuZHMgb3Ig
bm90LCBpbiBvdGhlciB3b3JkcywNCj4gPiB3aGV0aGVyIExDRElGMS9MQ0RJRjIvTERCIGRyaXZl
cnMga25vdyB0aGF0IHRoZXkgYXJlIHNoYXJpbmcgYSBQTEwNCj4gPiBvciBub3QuDQo+IA0KPiBJ
J2xsIGNvbnRpbnVlIGF0IHRoZSBlbmQgLi4uDQo+IA0KPiA+Pj4gWW91IHN0aWxsIG1heSBhc3Np
Z24gYW4gYWNjdXJhdGUgUExMIHJhdGUgaW4gRFQuDQo+ID4+PiBUaGlzIHBhdGNoIG9ubHkgbWFr
ZXMgdGhlIFBMTCByYXRlIGJlIHVuY2hhbmdlYWJsZSBkeW5hbWljYWxseSBpbg0KPiA+Pj4gcnVu
dGltZS4gIFRoYXQgbWVhbnMgdGhlIGV4aXN0aW5nIGlteDhtLWRoY29tLXNvbS5kdHNpIHdvdWxk
IHVzZQ0KPiA+Pj4gSU1YOE1QX1ZJREVPX1BMTDFfT1VUKHJ1bm5pbmcgYXQgMS4wMzk1R0h6KSBh
cyB0aGUgcGFyZW50IGNsb2NrDQo+ID4+PiBvZiBJTVg4TVBfQ0xLX01FRElBX0RJU1AxX1BJWCAo
Zm9yIExDRElGMS9EU0kpLCBzaW5jZSBpdCBpbmNsdWRlcw0KPiA+Pj4gaW14OG1wLmRzdGkuICBJ
IGFzc3VtZSBpdCBzaG91bGQgYmUgYWJsZSB0byBzdXBwb3J0IHR5cGljYWwgdmlkZW8gbW9kZXMN
Cj4gPj4+IGxpa2UgMTA4MHA2MCB2aWRlbyBtb2RlIHdpdGggMTQ4LjVNSHogcGl4ZWwgY2xvY2sg
YXQgbGVhc3Qgd2l0aA0KPiAxLjAzOTVHSHoNCj4gPj4+IFBMTCByYXRlLg0KPiA+Pg0KPiA+PiBU
aGlzIHdpbGwgYnJlYWsgbXVsdGlwbGUgRFAgbW9uaXRvcnMgSSB0ZXN0ZWQgc28gZmFyIEknbSBh
ZnJhaWQuIEFuZCBJDQo+ID4+IHNwZW50IGEgTE9UIG9mIHRpbWUgd3Jlc3RsaW5nIHdpdGggdGhl
IFRDOTU5NSBicmlkZ2UgdG8gbWFrZSBzdXJlIGl0DQo+ID4+IGFjdHVhbGx5IGRvZXMgd29yayB3
ZWxsLg0KPiA+DQo+ID4gSWYgdGhlIERQIG1vbml0b3JzIHN1cHBvcnQgdHlwaWNhbCB2aWRlbyBt
b2RlcyBsaWtlIDEwODBwNjAgd2l0aA0KPiA+IDE0OC41TUh6IHBpeGVsIGNsb2NrIHJhdGUsIEkg
YXNzdW1lIHRoZXNlIHR5cGljYWwgdmlkZW8gbW9kZXMgd29yaw0KPiA+IHN0aWxsIG9rIHdpdGgg
dGhpcyBwYXRjaCBhdCBsZWFzdC4gIFBsZWFzZSBoZWxwIGNvbmZpcm0gdGhpcywgc2luY2UgaWYg
dGhlDQo+ID4gYWx0ZXJuYXRpdmUgc29sdXRpb24oKikgZG9lc24ndCBzdGFuZCwgd2Ugd291bGQg
a25vdyB0aG9zZSB2aWRlbw0KPiA+IG1vZGVzIHN0aWxsIHdvcmsgb2sgd2l0aCBteSBzb2x1dGlv
bihmaXhlZCBQTEwgcmF0ZSkuDQo+IA0KPiBUaGV5IGRvIG5vdCB3b3JrIHdpdGggdGhlIGZpeGVk
IFBMTCBzZXR0aW5nLg0KDQpXaHk/ICBEaWQgeW91IGFzc2lnbiBhIHNlbnNpYmxlIGZpeGVkIFBM
TCByYXRlIGluIERUPw0KQ2FuIHlvdSBwbGVhc2UgY29tcGFyZSBjbGtfc3VtbWFyeSBvdXRwdXQg
Zm9yIHRoZSBmYWlsaW5nIGNhc2VzDQpiZWZvcmUgYW5kIGFmdGVyIHRoaXMgcGF0Y2ggaXMgYXBw
bGllZD8gSSBhc3N1bWUgdGhhdCBpZiB5b3UgdXNlDQp0aGUgZml4ZWQgUExMIHJhdGUgc2FtZSB0
byB0aGUgcmF0ZSB3aGljaCB3b3JrcyBiZWZvcmUgdGhpcyBwYXRjaCBpcw0KYXBwbGllZCwgdGhl
IHR5cGljYWwgdmlkZW8gbW9kZXMgc3RpbGwganVzdCB3b3JrIGFmdGVyIHRoaXMgcGF0Y2ggaXMN
CmFwcGxpZWQuDQoNCj4gDQo+ID4+PiBHcmFudGVkIHRoYXQgbGVzcyB2aWRlbyBtb2RlcyByZWFk
IGZyb20gRFAgbW9uaXRvciB3b3VsZA0KPiA+Pj4gYmUgc3VwcG9ydGVkIHdpdGhvdXQgZHluYW1p
Y2FsbHkgY2hhbmdlYWJsZSBQTEwgcmF0ZXMsIHRoaXMgaXMNCj4gc29tZXRoaW5nDQo+ID4+PiB3
ZSBoYXZlIHRvIGFjY2VwdCBiZWNhdXNlIHNvbWUgaS5NWDhNUCBwbGF0Zm9ybXMobGlrZSBpLk1Y
OE1QIEVWSykNCj4gPj4+IGhhdmUgdG8gc2hhcmUgSU1YOE1QX1ZJREVPX1BMTDFfT1VUIGJldHdl
ZW4gTFZEUyBhbmQgTUlQSSBEU0kNCj4gPj4+IGRpc3BsYXkgcGlwZWxpbmVzLg0KPiA+Pg0KPiA+
PiBXaGF0IEkgbmVlZCBpcyB0aGUgdXNlIG9mIHR3byBmdWxsIFBMTDE0NDN4IChsaWtlIFZpZGVv
IFBMTCBhbmQgQXVkaW8NCj4gPj4gUExMMS8yKSAsIG9uZSBmb3IgZWFjaCBkaXNwbGF5IG91dHB1
dCwgYW5kIHRob3NlIFBMTHMgaGF2ZSB0byBiZSBmdWxseQ0KPiA+PiBjb25maWd1cmFibGUgdG8g
cHJvZHVjZSBhY2N1cmF0ZSBwaXhlbCBjbG9jayBmb3IgZWFjaCBjb25uZWN0ZWQgcGFuZWwuDQo+
ID4+IE90aGVyd2lzZSBJIGNhbm5vdCBtYWtlIHByb3BlciB1c2Ugb2YgdGhlIHZpZGVvIG91dHB1
dCBjYXBhYmlsaXRpZXMgb2YNCj4gPj4gdGhlIE1YOE1QIFNvQy4NCj4gPg0KPiA+IFllYWgsIEkg
dW5kZXJzdGFuZCB5b3VyIHJlcXVpcmVtZW50cy4gIEhvd2V2ZXIsIGl0IHN0aWxsIGRlcGVuZHMg
b24NCj4gPiB3aGV0aGVyIHRoZSBhbHRlcm5hdGl2ZSBzb2x1dGlvbigqKSBzdGFuZHMgb3Igbm90
Lg0KPiANCj4gSSdsbCBjb250aW51ZSBhdCB0aGUgZW5kIC4uLg0KPiANCj4gPj4+IFRoZSBtaXNz
aW5nIHBhcnQgaXMgdGhhdCB3ZSBuZWVkIHRvIGRvIG1vZGUgdmFsaWRhdGlvbg0KPiA+Pj4gZm9y
IHRoZSBNSVBJIERTSSBkaXNwbGF5IHBpcGVsaW5lIGVpdGhlciBpbiBzYW1zdW5nLWRzaW0uYyBv
ciBsY2RpZl9rbXMuYw0KPiA+Pj4gdG8gZmlsdGVyIHVuc3VwcG9ydGVkIHZpZGVvIG1vZGUgb3V0
LiAgSXMgdGhpcyBtaXNzaW5nIG1vZGUgdmFsaWRhdGlvbg0KPiA+Pj4gdGhlIGNhdXNlIG9mIHlv
dXIgZmFpbHVyZSBjYXNlPw0KPiA+Pg0KPiA+PiBJIGRvIHdhbnQgdG8gc3VwcG9ydCB0aGUgdmFy
aW91cyBtb2RlcywgSSBkbyBub3Qgd2FudCB0byBmaWx0ZXIgdGhlbQ0KPiA+PiBvdXQuIFRoZXkg
Y2FuIGJlIHN1cHBvcnRlZCwgdGhlIG9ubHkgInByb2JsZW0iIGlzIHRoZSBzaGFyZWQgVmlkZW8g
UExMDQo+ID4+IHdoaWNoIGlzIG5vdCByZWFsbHkgYW4gYWN0dWFsIHByb2JsZW0gaW4gbXkgY2Fz
ZSwgYmVjYXVzZSBJIGRvIG5vdCB1c2UNCj4gPj4gc2hhcmVkIFZpZGVvIFBMTCwgSSB1c2UgdHdv
IHNlcGFyYXRlIFBMTHMuDQo+ID4+DQo+ID4+IEkgdGhpbmsgd2hhdCBpcyBuZWVkZWQgaXMgZm9y
IHRoZSBMQ0RJRjEvTENESUYyL0xEQiB0byBmaWd1cmUgb3V0DQo+ID4+IHdoZXRoZXIgdGhleSBz
aGFyZSB0aGUgVmlkZW8gUExMIGF0IGFsbCAoeW91IGFscmVhZHkgc3VnZ2VzdGVkIHRoZSBjbG9j
aw0KPiA+PiBzdWJzeXN0ZW0gY2FuIHByb3ZpZGUgdGhhdCBpbmZvcm1hdGlvbiksIGFuZCB0aGVu
IGlmOg0KPiA+DQo+ID4gQnV0LCBob3cgdG8gbGV0IExDRElGMS9MQ0RJRjIvTERCIGRyaXZlcnMg
dG8gZmlndXJlIG91dCB0aGF0Pw0KPiA+DQo+ID4gSSBkaWRuJ3Qgc3VnZ2VzdCB0aGF0IHRoZSBj
bG9jayBzdWJzeXN0ZW0gY2FuIHByb3ZpZGUgdGhhdCBpbmZvcm1hdGlvbi4NCj4gDQo+IC4uLiBi
eSBlbmQgSSBtZWFuIGhlcmUuDQo+IA0KPiBPbmUgcmVhbGx5IG5hc3R5IHdheSBJIGNhbiB0aGlu
ayBvZiBpcyAtLSB1c2UgZmluZF9ub2RlX2J5X2NvbXBhdGlibGUoKSwNCj4gbG9vayB1cCBhbGwg
dGhlIHJlbGV2YW50IERUIG5vZGVzLCBwYXJzZSB0aGVpciBjbG9jayBwcm9wZXJ0aWVzLCBhbmQN
Cj4gY2hlY2sgd2hldGhlciB0aGV5IGFsbCBwb2ludCB0byB0aGUgVmlkZW8gUExMIG9yIG5vdC4N
Cg0KVGhhdCdzIG5hc3R5LiAgSXQgbG9va3MgZXZlbiBtb3JlIG5hc3R5IHdoZW4gY29uc2lkZXJp
bmcgdGhlIGZhY3QgdGhhdA0KaS5NWDkzIExDRElGIGlzIGFsc28gZHJpdmVuIGJ5IGlteC1sY2Rp
ZiBEUk0gd2hpbGUgb25seSBpLk1YOE1QIExDRElGDQpuZWVkcyB0aGUgbmFzdHkgY2hlY2ssIGJl
Y2F1c2UgaS5NWDkzIFNvQyBlbWJlZHMgb25seSBvbmUgTENESUYuDQoNCj4gDQo+IE1heWJlIHRo
ZSBjbG9jayBzdWJzeXN0ZW0gaGFzIGEgYmV0dGVyIHdheSwgbGlrZSBsaXN0ICJuZWlnaGJvciIN
Cj4gY29uc3VtZXJzIG9mIHNvbWUgc3BlY2lmaWMgcGFyZW50IGNsb2NrIG9yIHNvbWV0aGluZyBs
aWtlIHRoYXQuDQoNCldoYXQgd2lsbCBpbXgtbGNkaWYgRFJNIGxvb2sgbGlrZSBieSB1c2luZyB0
aGlzIHdheT8gR2V0IHRoZSBhbmNlc3RvciBQTEwNCmNsb2NrIG9mIHBpeGVsIGNsb2NrKG1lZGlh
X2Rpc3B7MSwyfV9waXhfcm9vdF9jbGspLCBsaXN0IGFsbCBjaGlsZCBjbG9ja3MNCihtZWRpYV9k
aXNwMV9waXggYW5kL29yIG1lZGlhX2Rpc3AyX3BpeCArIG90aGVyIHBvc3NpYmxlIGNsb2Nrcykg
b2YgdGhlDQpQTEwgY2xvY2sgaW4gYSBzdHJpbmcgYXJyYXkgYW5kIGZpbmQgbWVkaWFfZGlzcDFf
cGl4ICsgbWVkaWFfZGlzcDJfcGl4DQppbiBpdD8NCg0KRG9lc24ndCBsb29rIG5pY2UsIGVpdGhl
ci4NCg0KPiANCj4gWy4uLl0NCj4gDQo+ID4+IENhbiBzb21ldGhpbmcgbGlrZSAoKikgYWJvdmUg
YmUgaW1wbGVtZW50ZWQgaW5zdGVhZCwgc28gYm90aCBTaGFyZWQNCj4gYW5kDQo+ID4+IHNlcGFy
YXRlIFBMTHMgd291bGQgYmUgc3VwcG9ydGVkID8gVGhhdCBzaG91bGQgc29sdmUgYm90aCBvZiBv
dXIgdXNlDQo+ID4+IGNhc2VzLCByaWdodCA/DQo+ID4NCj4gPiBJIGRvbid0IHNlZSBhbnkgY2xl
YXIgd2F5IHRvIGltcGxlbWVudCBzb21ldGhpbmcgbGlrZSgqKS4NCj4gPg0KPiA+IFRha2UgdGhl
IDMgaS5NWDhNUCBMQ0RJRnMgYXMgb25lIGdyYXBoaWMgY2FyZCBkcml2ZW4gYnkgb25lIGlteC1s
Y2RpZg0KPiA+IERSTSBpbnN0YW5jZT8gIFdvdWxkIGl0IGJlIHRvbyBpbnRydXNpdmU/DQo+IA0K
PiBZZXMsIGFuZCBJIHRoaW5rIHVubmVjZXNzYXJ5LCBvbmUgY2FuIHNpbXBseSB0cmF2ZXJzZSBh
bmQgcGFyc2UgdGhlIERUDQo+IHRvIGRldGVybWluZSB0aGUgY2xvY2sgYXNzaWdubWVudD8NCg0K
WWVzLCBwZW9wbGUgY2FuIHRyYXZlcnNlIGFuZCBwYXJzZSBEVCwgYnV0IGl0J3MgbmFzdHkuDQoN
CkluIGFkZGl0aW9uLCBvbmUgbWF5IGFyZ3VlIHRoYXQgbm93IHRoYXQgQ0xLX1NFVF9SQVRFX1BB
UkVOVCBmbGFnDQppcyBzZXQgZm9yIHRoZSBwaXhlbCBjbG9ja3MsIGFsbCBwb3RlbnRpYWwgdmlk
ZW8gbW9kZXMgcmVhZCBmcm9tIEVESUQNCnNob3VsZCBiZSBzdXBwb3J0ZWQgd2hlbiBvbmx5IGVp
dGhlciBMVkRTIGRpc3BsYXkgcGlwZWxpbmUgb3IgTUlQSSBEU0kNCmRpc3BsYXkgcGlwZWxpbmUg
aXMgYWN0aXZlIGluIHRoZSBzaGFyZWQgUExMIGNhc2UuICBUaGlzIHJlcXVpcmVzIG9uZQ0Kc2lu
Z2xlIERSTSBpbnN0YW5jZSB0byBkZXRlY3Qgc2luZ2xlIG9yIGR1YWwgYWN0aXZlIGRpc3BsYXkg
cGlwZWxpbmVzDQpkeW5hbWljYWxseSwgaGVuY2UgdGhpcyBzaW5nbGUgRFJNIGluc3RhbmNlIGJl
Y29tZXMgbmVjZXNzYXJ5Lg0KDQo+IA0KPiA+IFVzZSBjbGtfZ2V0X3BhcmVudCgpIHRvIGRldGVy
bWluZSBpZiB0aGUgcGl4ZWwgY2xvY2tzIG9mIExDRElGMSYyIGFyZQ0KPiA+IHNoYXJpbmcgUExM
KG5vdGUgY2xrX2dldF9wYXJlbnQoKSBpbXBsZW1lbnRhdGlvbiBjb250YWlucyBhIFRPRE86DQo+
ID4gQ3JlYXRlIGEgcGVyLXVzZXIgY2xrLik/DQo+IA0KPiBNYXliZSBub3QgbmVjZXNzYXJ5IGZv
ciB0aGlzIGNhc2UuDQo+IA0KPiA+IEhvdyB0byBkbyBtb2RlIHZhbGlkYXRpb24gZm9yIHRoZSBz
aGFyZWQgUExMIGNhc2Uobm90ZSBtb2RlX3ZhbGlkKCkNCj4gPiBjYWxsYmFjayBpcyBzdXBwb3Nl
ZCB0byBsb29rIGF0IG5vdGhpbmcgbW9yZSB0aGFuIHBhc3NlZC1pbiBtb2RlKT8NCj4gPiBVc2Ug
Y2xrX3NldF9yYXRlX3JhbmdlKCkgdG8gZml4IHRoZSBQTEwgcmF0ZShtaW4gPT0gbWF4KT8NCj4g
DQo+IFRoaXMgaXMgYSBnb29kIHF1ZXN0aW9uIC0tIHdlIGNhbiB1c2UgZml4ZWQgZnJlcXVlbmN5
IHNldCBpbiBEVCBmb3IgdGhlDQo+IFBMTCBpbiBjYXNlIGl0IGlzIHNoYXJlZCwgYW5kIHNldCB3
aGF0ZXZlciBvcHRpbWFsIGZyZXF1ZW5jeSBpZiB0aGUgUExMDQo+IGlzIG5vdCBzaGFyZWQuIFRo
YXQgd291bGQgYmUgYSBnb29kIGZpcnN0IHN0ZXAgSSB0aGluayAoKiopLg0KDQpUaGUgYWJvdmUg
cmVxdWlyZW1lbnQgb2YgZHluYW1pY2FsIGFjdGl2ZSBkaXNwbGF5IHBpcGVsaW5lIG51bWJlcg0K
ZGV0ZWN0aW9uIGRlZmVhdHMgdGhlIGZpeGVkIFBMTCByYXRlIGZvciBpbiB0aGUgc2hhcmVkIFBM
TCBjYXNlLiANCkFuZCwgaXQgbWFrZXMgbW9kZSB2YWxpZGF0aW9uIGtpbmQgb2YgdW5kb2FibGUs
IGJlY2F1c2UgbW9kZV92YWxpZCgpDQppcyBub3Qgc3VwcG9zZWQgdG8ga25vdyB0aGF0IGFjdGl2
ZSBudW1iZXIuDQoNCj4gDQo+IFRoZSBuZXh0IHN0ZXAgd291bGQgYmUgdG8gZmluZCBhIHdheSB0
byBuZWdvdGlhdGUgYWNjZXB0YWJsZSBQTEwNCj4gZnJlcXVlbmN5IGJldHdlZW4gTENESUYxL0xD
RElGMi9MREIgaW4gY2FzZSB0aGUgUExMIGlzIHNoYXJlZCwgYnV0IEkgZG8NCj4gYWdyZWUgdGhp
cyBpcyBub24tdHJpdmlhbCwgaGVuY2UgbmV4dCBzdGVwLg0KPiANCj4gPj4+IEkgaG9wZSB0aGF0
IHdlIGNhbiBhZ3JlZSBvbiB0aGlzIHNvbHV0aW9uIGZpcnN0IGJlZm9yZSBzcHJlYWRpbmcNCj4g
Pj4+IGRpc2N1c3Npb25zIGFjcm9zcyBkaWZmZXJlbnQgdGhyZWFkcyBhbmQgZXZlbnR1YWxseSB0
aGUgTkFLIGNhbiBiZQ0KPiA+Pj4gdGFrZW4gYmFjay4NCj4gPj4NCj4gPj4gSSBjYW5ub3QgcmVh
bGx5IGFncmVlIG9uIGEgc29sdXRpb24gd2hpY2ggYnJlYWtzIG9uZSBvZiBteSB1c2UgY2FzZXMs
DQo+ID4+IGJ1dCBtYXliZSB0aGVyZSBpcyBhbiBhbHRlcm5hdGl2ZSBob3cgdG8gc3VwcG9ydCBi
b3RoIG9wdGlvbnMsIHNlZSAoKikNCj4gPj4gYWJvdmUgPw0KPiA+DQo+ID4gSSB0ZW5kIHRvIHNh
eSB0aGVyZSBpcyBubyBhbnkgYWx0ZXJuYXRpdmUgc29sdXRpb24gdG8gc2F0aXNmeSBib3RoDQo+
ID4gc2VwYXJhdGUgUExMcyBhbmQgc2hhcmVkIFBMTCB1c2UgY2FzZXMsIG9yIGV2ZW4gaWYgdGhl
cmUgaXMgb25lLCBpdCB3b24ndA0KPiA+IGJlIGVhc3kgdG8gaW1wbGVtZW50LiAgSWYgeW91IGtu
b3cgb25lLCBwbGVhc2Ugc2hvdXQgaXQgb3V0Lg0KPiBNYXliZSAoKikgd2l0aCBmaXJzdCBzdGVw
ICgqKikgd291bGQgYmUgZG9hYmxlID8NCg0KTWF5YmUgaXQncyBub3QgZG9hYmxlIGlmIHRoZSBh
Ym92ZSByZXF1aXJlbWVudCBvZiBkeW5hbWljYWwgYWN0aXZlIGRpc3BsYXkNCnBpcGVsaW5lIG51
bWJlciBkZXRlY3Rpb24gbmVlZHMgdG8gYmUgc3VwcG9ydGVkLg0KDQpDb25zaWRlcmluZyAxKSB0
aGUgd2F5IG9mIGdldHRpbmcgc2VwYXJhdGUvc2hhcmVkIFBMTCBpbmZvcm1hdGlvbiBhbmQNCjIp
IG1vZGUgdmFsaWRhdGlvbiwgSSBkb24ndCB0aGluayB5b3VyIG92ZXJhbGwgYWx0ZXJuYXRpdmUg
c29sdXRpb24gaXMgZ29vZC4NCg0KUmVnYXJkcywNCkxpdSBZaW5nDQo=
