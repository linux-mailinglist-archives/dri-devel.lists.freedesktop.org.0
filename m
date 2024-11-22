Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 512D49D589B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 04:39:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8A710E03C;
	Fri, 22 Nov 2024 03:39:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="gtEPbTCR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061.outbound.protection.outlook.com [40.107.20.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6004F10E03C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 03:39:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLYSPo1tL3IkY1y+0jxRiBEmehERF+DRZvICTU8Wxmg84XGGYTmq3MYa5S7mCo+zn+xl9zXJcOhcnTH8/+15ecS3eiA9Y+aQNgSppe5rcK57y5Zn0VTeNQ1X/nTCr7K0uMsf1X1D7sSeQw1ImivMnJYGqide287LVXu8n8PEt6GVi7Yb7Ms+soqESZCZf5wz3hyQgQ3oxQWiYce0i6h0aRA5RvDhVKStfhJHd9Fnfrb+L1EB5b28ZtWfZJ+2dSlcmHD8Nuz3RfN3ffy/PBvabvtOfDYkET4JFgVOjJAMcKM0Xj3vQq6ti2u/sWLHu75GaDlZ4KQr2uJkf/Mbo0o4VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rq4m6jnHAWnJyJz4mix475ap18mjRoMzqvbPFRJkSv8=;
 b=adPoWS+gZA8sMUWBYya6i8ndGCt4D0WTAHHL7fAlWGSdfyUFHPcYlWezlA/pcQtzLSQFiGSBLimo7PM6ZglVMtA5L768zttkUmmHHi5qpHtNwDVZhO1IEG8WnN3q0wApTYundbk54yELV+ZH1n88RzhnofEQ0ZsgmpFU8/bT0FdNc3dTQ3uutHZ9sVzkJ343Dfl/ZV96i78dLc0ypEQzKW7xRBVxHOQyW0YAqEGuRiqXpWa9QRO1hvMQVuJrs4/0ZhT9jnwWUtc9VdjupB2zf80VKa8qdjmufUwzAtneT8g9m4p6sXSMu4clZc6YApbNoiFxjRUBhvkh89V6zb6CeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rq4m6jnHAWnJyJz4mix475ap18mjRoMzqvbPFRJkSv8=;
 b=gtEPbTCRtsHApxyZNziCzrMLJEDI3LFmTLFP1FUxUw5SoVq3gf0xkU/ZVxKMRJJ1dzdeYeGaCeVzXfjd4i3FZNZx/lHBjfznbhw+Hu1SAUumgQ/GIa/EozT977qe26ONIQ1zmFY2j5IwDv1RucN1tVMCXZvGYgvQOy9hrQ9XCMuTBU73RXK1UmvofQ4QdgrrUc3meHST56KDksQjRXMC+TvcmsoZwdPWE8Vb0sn9tUPaGxsJVJgOPj5SJYJWD14NWnxSz9CvOtjCeRfNVc8NYDDzgrId6GW3xjZYpOH6wMCsbG0dzqK4Oz0v/vTs4d/yDciEedMwqoWwgyTkSK6zDA==
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by PR3PR04MB7227.eurprd04.prod.outlook.com (2603:10a6:102:82::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.17; Fri, 22 Nov
 2024 03:39:05 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%6]) with mapi id 15.20.8158.017; Fri, 22 Nov 2024
 03:39:05 +0000
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
Thread-Index: AQHbNmKO+PHF1Z/Vm0OxVRcdedNQObK4R9AAgAQX1dCAAXQEAIAAYy+AgAD0WACAAFJ44IABlI6AgAGRudA=
Date: Fri, 22 Nov 2024 03:39:05 +0000
Message-ID: <AM7PR04MB7046D404841394382324DE7198232@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20241114065759.3341908-1-victor.liu@nxp.com>
 <20241114065759.3341908-3-victor.liu@nxp.com>
 <df6ebdde-65f8-4aad-93c7-b1df695bd2ef@denx.de>
 <AM7PR04MB7046546A882A8D48E135D84698272@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <8a4fd234-4c7b-4a04-990d-3222aaa5172d@denx.de>
 <AM7PR04MB7046E282FD702ACE5E288F8998202@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <83be0a27-6b6c-4ba6-b9dc-f914a10abace@denx.de>
 <AM7PR04MB7046587167BF790549B8560F98212@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <c5ab63da-21ec-4c0d-8ecc-3745943d806f@denx.de>
In-Reply-To: <c5ab63da-21ec-4c0d-8ecc-3745943d806f@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|PR3PR04MB7227:EE_
x-ms-office365-filtering-correlation-id: cccedab5-f4d3-4e88-2b81-08dd0aa736fd
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?bmhEL0paUTRqeWxRUGYxUThHcGlmZGpneE1DblBmaXByUlhPSTN3cE02c1BR?=
 =?utf-8?B?a0o4TGV6ZVhGUlYwc2toT0l3Y3R4MzBXTzgrY3BDMjNwTzkvOWtzaXN3aXVQ?=
 =?utf-8?B?SGx0RlJYSGw2UW1zNm1lTSthZkJKalNkY1Q1cGh1bUFvQnJ1TzlJMWJrcmVS?=
 =?utf-8?B?eUFYK2RGV2JxTy9wZk0rYVphM0JJNTIxbXU3TlcvV2hpRzlZaHJqblJzK2p0?=
 =?utf-8?B?eFNTdHRCYXoyRWx2clBqbXY2MGdDYklSTFg4MHorNjltZTYrNDdrQ2o4bDJi?=
 =?utf-8?B?ZVRqcFFsM3JCam0ybGRpTis1VTI1MGNJdEpvVnJrV1BOemRyb29mK1lPUDNR?=
 =?utf-8?B?VjZCRDZjRXRkb2RVNVduT3hpQjRxQ3gwUlprUVQyY04xdTE5WWZGUGRZMnpl?=
 =?utf-8?B?WVFQR3N4aWpLQ1RFVWRCZHNaWnpNYzMwckZuVVdKeHVlbk53cWhESWJjd2ZU?=
 =?utf-8?B?TzRQUnMzZ0szSERudWRQZ05MKzRNNXVnTjhzSlZrakk5dWNJVmhJV0VxMTgx?=
 =?utf-8?B?eUFlRUFTTlJhOHYrZktmNWxvVS9CL09vdVRYdDdGU3A0NnBEMmtvRXN0ZTNr?=
 =?utf-8?B?ajkveVdOdWZiMjlZKzR2NEgvNXRmR1psbTUyYXlJUXZFYjN4ZmVNbnZjUk1T?=
 =?utf-8?B?TDhuV0FSYi9IZEE4L3FQdzFPUThsTVhBdUVnQ0VwS2wxMDFPR2U2WDhYL3NS?=
 =?utf-8?B?OHBJcmVXOHBIYWlTdHkrbk00NHJhUXFtNGZSMEhqVUVJQ2NldVl5czFYdVBu?=
 =?utf-8?B?UlY2K01jLzlMdms4alRIZnZQWk55dStMaFQ1cS81Y2pIT1NXbHpyYTlOSlBF?=
 =?utf-8?B?cUlkaUsvRHJpbSs3c2IyU1B3amtpL0tHTlRsUXRNMjNYRkZ5SEl6eFJ3NlVG?=
 =?utf-8?B?SzFmeDN1R1VDM2JWclBZaW1VbGRBL3BSYlJkQURpcFZjNGd1bFJrZVFDb1dq?=
 =?utf-8?B?K0JhZ3ZGOXVxc0lscmlhcHBHZzJWZ2NFZEIrS0tXK1lnUmpZZFZxYVJKN0x6?=
 =?utf-8?B?UFpPK2JTV3Bsb3BjUFhacEFuTUZwazZTOXZBZWxuMDg5TEdHeFQ1SU9wemdo?=
 =?utf-8?B?U0hMWmxab0JmMUhLWTBjcVdsNjAyZlF0Qlg4OUJRcW1HemVoWnhoeWNVSG1J?=
 =?utf-8?B?MUM1eHBQS0s0bVZQNzN0Wm5WVzd0VXI4MytONHR3NGZmZ2I2djFDdHpnaU52?=
 =?utf-8?B?YmpWbU4yNW0yODBYMHJJVkJicVJCUU5sOEhmektGV0MybStmODdITnhyYkZr?=
 =?utf-8?B?ZGw5UGNOeTBpTWpUenZBOHR0NzRRLzRsVmRSeURhTk1RZ3BpdFJ2YlZzR0lY?=
 =?utf-8?B?c0VBN0RpWHo4ckI0QXB3L2djY3lHWFpkWmh6M0lwbFlsUThqZk1aU0d5SXFB?=
 =?utf-8?B?ek96YTRvWSswc0pHdkY4MFhHYzBTMHBRYVcyRXBBR2tlMFZubmkwbXVOQzRE?=
 =?utf-8?B?ZFJYVWlRa1UxOU44WFgrTFZKY09jK09HYkZnaGdWYW5uZzNta01zcHZCL1dG?=
 =?utf-8?B?MVVuc3hFK21GUmJNTGo2NXBNaURPbDNuMTZOcmJzRW9EZTRCbkZObFRscElm?=
 =?utf-8?B?UDBNZWQ2NEJyem1OL0djZ2w5QXRqKzFSTjBvZ1JEbExJakdtTnRXdythN2Fh?=
 =?utf-8?B?RjhZRjF4RWF1cVM3VEhDNGZzUUJQd1RudkhTR2RPbnN6S3dtWW1ERUt0R3B5?=
 =?utf-8?B?THV5aEtHcEFaajM1YzhicVpCUDhYY0RnenQ4b09ONlhQYjBHUlE5TXJnQnVq?=
 =?utf-8?B?UjlaWDlET1h0cjIwcGN4b0p5MTZLMTZzREpKMU5UcTNXbHVFYjk4akRZRjVO?=
 =?utf-8?B?S3RQKzhGem8wUW0zRDRlOFdxdGZPYzdWWi92UUoweEpsSVBCNEwvek8vbmxl?=
 =?utf-8?B?UkhjV0tUV0hwMjN0bEZYQjc0R1NUTlBUUnI4UjU0TEVsYWc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S3ppVDZTaVVUVDVQcUErRStaeEZGYTMvWThpbmxGa0N3cHhqZW1obXZTb3lK?=
 =?utf-8?B?WEZCUUlIS0FUT29LY1pBMHVhNmV3dW1kZ2hNWUxTSzE2VVdBVnRBRU5xRFFn?=
 =?utf-8?B?YjR5SHlZRVVnMHR0OWxDa0lIcEl5Q1RMV2YvK3pXNjdBQzFxUkJsZWZML3Fp?=
 =?utf-8?B?T0doWHdYOXowWVhtWVdlcVFHamZLUlp4bC9HeHVYR3gvVzE4dlI1Nmh3MXMx?=
 =?utf-8?B?N1hHQWJ1czRENWdsTFEyTEFMcW41YmVudTdNdTNlWEd1Skp5Q0cyMUFUUk5z?=
 =?utf-8?B?emVvTjhEeUZZcVNrTzJlNldNNDlBL0RsOW5FWXY3TzVVR04zWDlwL3hiQ2g4?=
 =?utf-8?B?R2ZJRnR1NUdiSnppWHZNaDdycGlmaC9VdEVLbERieWFReG9TNUVCdit6RE14?=
 =?utf-8?B?ZUM1cDYzM0l6RWZJUjF1R29uTnduNWZYVEt2V1pRNmJaK0U4Z2ZhYkJMTy9V?=
 =?utf-8?B?QThORVZCMUxFL0R3WitCVmhsTzU2U0tFQURzVnJ4NEphd2lhRFNUNk9zVTRl?=
 =?utf-8?B?Q1JaM21la1BYRXIrYUFnd1VnS1lNWTVwWFRvUkxzQWVpNW9LeWpUS3llLyt0?=
 =?utf-8?B?bEtyTHhuMkNOM2QwVEs2bi90eXVhcmVTdHJsZDZiMUoyMnJkTHRINzUvT3VR?=
 =?utf-8?B?aEYzRjU4SSs0WXlOTHBPNjZIQzhZbGZnb2lxN3J3Q0FxVjMxYmpURjJYWGJk?=
 =?utf-8?B?NExsaEU2UGJSWHR2OWZILzNVZVU0cFpLNHkxbllqdGtqVjZjRGNjMXBzc09R?=
 =?utf-8?B?YVZQUzNFR3lDd252YXkvNk5DRW1uY24xVUE1ZzJCVTlHQXNGVTBSY3NNRVVh?=
 =?utf-8?B?NWZRcHBqcFdTNzVRckoweHhVQ0Z1bmdVVDJ2SWhaakM5eElqTkdRWnVBcU1t?=
 =?utf-8?B?bDY3bXYvVzBidXlBK0treDR6dXE4VFIydjZmazJTczR4ZkIvRXlxRWlrMktP?=
 =?utf-8?B?a2QrYU1WNFUrWkFvWGdjNGROTjNTQ2NOa1hyYjBtUE5hUFRQSFJadWFNM00v?=
 =?utf-8?B?VTVSd2RxNFdMY1h3a3dQclVYeGswdEh5Z2VYMEl3VjluajJwWVNqamdnbTlU?=
 =?utf-8?B?UHdjQWpnYWV4WG03aGlGeHFTMS9FcWJUYWhWbzhuOGhVY3piU0V6VW5ua3N1?=
 =?utf-8?B?NmRMdFNZSGZ1VFZzWk1rYkpQRk9tQy9xZWdQWEtNOGdIMXhXTXhsVjhZZy8v?=
 =?utf-8?B?bUc0NlFmOUxSMWg4RU55YTc2YTFJMFJlbFNIWFEvTnJBbENLMHExN2pnaGhh?=
 =?utf-8?B?T2JKV3VuanZOakFCNkZXRm9PMExObjh4T0p6bUsrWFBLZmk1dUhJREpJWWVW?=
 =?utf-8?B?WWNXM2NXbXRmbDNPT3hTclRjMkw0NHFNVG1ENWxpandMVEt3bkN1RWxXQUQ5?=
 =?utf-8?B?OC8zK250bkl0dVZqUmozTFBicEZvajJyZDczeG1uWGs5NjRGZ014alBNaTlZ?=
 =?utf-8?B?OXBZZFZtZDkrN0FTUUZBTnV1MnhlVnBPbzFVVVQwWkpPckFJby95a0FBbS9t?=
 =?utf-8?B?dEllUVNHU0NwTkZ3MDdvZnkra0NMS3VRVzVaOU05NnRTRWhGeE9qUnBmY0Zl?=
 =?utf-8?B?emFySmQ3V3Uydmt3dFR0R3luOTBFdnNIdHlCdEJoTzh3WDlESFZYcTFndlo5?=
 =?utf-8?B?MFRneXJacGtCZlA0L3RmRFNhNkJ1bTdUcVZIaTRpaG52S05MOVVQckUyc3c0?=
 =?utf-8?B?ZW9PVmhhN3J0aWpQN2lUZFZWbHhOWTZsK2dpQ3orbkFkdEZLbm1yWEUvbmU5?=
 =?utf-8?B?clhPWXNlUXFXd3p2NUNMQmNPdFZNZ3VSc3NUVERyNEIrdlFyTUVlcklxTmcz?=
 =?utf-8?B?Um9LN0xRRExybHBQelVIUHdPTDBsWHdkOVZMUm5YcXVDelp4YVkzSXUyOW9o?=
 =?utf-8?B?ZU5rbVY2b3dneGlJZFEzNko5b1FwRVo4aytJRndOazIwYytFYk43OTNrWjJ3?=
 =?utf-8?B?dmVxN1hBcXdYc1VQVlR0bFluTzhNM0tqMEY2Y3o5YkhHU3lWaTlxcTdlKzRq?=
 =?utf-8?B?ZFI0NVBrR1BxeTd2T05xemlDcHduVmY4cmhNeG1MZG5QUlBrTy80ZHAwamZt?=
 =?utf-8?B?dHo2NFZCVlc3ZkxUVE1wcC9qOCtCVTBSV051WVE0VVU3cnR5bzhOdzRuZDZk?=
 =?utf-8?Q?IfUw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cccedab5-f4d3-4e88-2b81-08dd0aa736fd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2024 03:39:05.4746 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: eGvjSacd4hK9kxBivB7iJ2ENBOv6afGIRdi+jOkR97rvGGO3ruEL4IVQf+d5bvCHIE/9cJzza9DvaGBUggJbog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7227
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

T24gMTEvMjIvMjQsIE1hcmVrIFZhc3V0IHdyb3RlOiANCj4gT24gMTEvMjAvMjQgNzozOCBBTSwg
WWluZyBMaXUgd3JvdGU6DQo+IA0KPiBbLi4uXQ0KPiANCj4gPj4+IElmIHRoZSBEUCBtb25pdG9y
cyBzdXBwb3J0IHR5cGljYWwgdmlkZW8gbW9kZXMgbGlrZSAxMDgwcDYwIHdpdGgNCj4gPj4+IDE0
OC41TUh6IHBpeGVsIGNsb2NrIHJhdGUsIEkgYXNzdW1lIHRoZXNlIHR5cGljYWwgdmlkZW8gbW9k
ZXMgd29yaw0KPiA+Pj4gc3RpbGwgb2sgd2l0aCB0aGlzIHBhdGNoIGF0IGxlYXN0LiAgUGxlYXNl
IGhlbHAgY29uZmlybSB0aGlzLCBzaW5jZSBpZiB0aGUNCj4gPj4+IGFsdGVybmF0aXZlIHNvbHV0
aW9uKCopIGRvZXNuJ3Qgc3RhbmQsIHdlIHdvdWxkIGtub3cgdGhvc2UgdmlkZW8NCj4gPj4+IG1v
ZGVzIHN0aWxsIHdvcmsgb2sgd2l0aCBteSBzb2x1dGlvbihmaXhlZCBQTEwgcmF0ZSkuDQo+ID4+
DQo+ID4+IFRoZXkgZG8gbm90IHdvcmsgd2l0aCB0aGUgZml4ZWQgUExMIHNldHRpbmcuDQo+ID4N
Cj4gPiBXaHk/ICBEaWQgeW91IGFzc2lnbiBhIHNlbnNpYmxlIGZpeGVkIFBMTCByYXRlIGluIERU
Pw0KPiANCj4gV2hhdGV2ZXIgd2FzIGluIGlteDhtcC5kdHNpIGRvZXMgbm90IHJlYWxseSB3b3Jr
IGZvciBhbGwgdGhlIHBhbmVscy4NCj4gUGxlYXNlIGtlZXAgaW4gbWluZCB0aGF0IHRoZSB1c2Ug
Y2FzZSBJIGhhdmUgZG9lcyBub3QgaW5jbHVkZSBvbmx5DQo+IDE5MjB4MTA4MCAic3RhbmRhcmQi
IHBhbmVscywgYnV0IGFsc28gb3RoZXIgcmVzb2x1dGlvbnMuDQoNCkl0IGxvb2tzIGxpa2UgeW91
IGFyZSBzdGlsbCBzdGlja2luZyB0byB0aGUgaWRlYSBvZiBzdXBwb3J0aW5nIGFsbCBwb3RlbnRp
YWxseQ0KdmFsaWQgdmlkZW8gbW9kZXMgYnkgdHJ5aW5nIHRvIGZpbmQgYW4gImFsdGVybmF0aXZl
IiBzb2x1dGlvbiwgd2hpbGUNCm5lZ2xlY3RpbmcgdGhhdCB0aGUgc29sdXRpb24gKmNvdWxkIGJl
KiBuZXZlciB3b3JraW5nLiANCg0KPiANCj4gPiBDYW4geW91IHBsZWFzZSBjb21wYXJlIGNsa19z
dW1tYXJ5IG91dHB1dCBmb3IgdGhlIGZhaWxpbmcgY2FzZXMNCj4gPiBiZWZvcmUgYW5kIGFmdGVy
IHRoaXMgcGF0Y2ggaXMgYXBwbGllZD8gSSBhc3N1bWUgdGhhdCBpZiB5b3UgdXNlDQo+ID4gdGhl
IGZpeGVkIFBMTCByYXRlIHNhbWUgdG8gdGhlIHJhdGUgd2hpY2ggd29ya3MgYmVmb3JlIHRoaXMg
cGF0Y2ggaXMNCj4gPiBhcHBsaWVkLCB0aGUgdHlwaWNhbCB2aWRlbyBtb2RlcyBzdGlsbCBqdXN0
IHdvcmsgYWZ0ZXIgdGhpcyBwYXRjaCBpcw0KPiA+IGFwcGxpZWQuDQo+IA0KPiBJJ20gYWZyYWlk
IEkgZG8gbm90IG5lZWQgdG8gc3VwcG9ydCBvbmx5IHR5cGljYWwgdmlkZW8gbW9kZXMsIGJ1dCBh
bHNvDQo+IHRoZSBvdGhlciAiYXR5cGljYWwiIG1vZGVzLg0KDQpJZiB0aGUgImFsdGVybmF0aXZl
IiBzb2x1dGlvbiBkb2Vzbid0IHdvcmssIHdlJ2xsIGVuZCB1cCB1c2luZyB0aGUgImZpeGVkDQpQ
TEwgcmF0ZSIgc29sdXRpb24uICBJdCB0aGF0IGNhc2UsIHNvbWUgdmlkZW8gbW9kZXMgd291bGQg
YmUgZmlsdGVyZWQNCm91dCBhcyBhIHNhY3JpZmljZS4gDQoNCj4gDQo+IFsuLi5dDQo+IA0KPiA+
PiBPbmUgcmVhbGx5IG5hc3R5IHdheSBJIGNhbiB0aGluayBvZiBpcyAtLSB1c2UgZmluZF9ub2Rl
X2J5X2NvbXBhdGlibGUoKSwNCj4gPj4gbG9vayB1cCBhbGwgdGhlIHJlbGV2YW50IERUIG5vZGVz
LCBwYXJzZSB0aGVpciBjbG9jayBwcm9wZXJ0aWVzLCBhbmQNCj4gPj4gY2hlY2sgd2hldGhlciB0
aGV5IGFsbCBwb2ludCB0byB0aGUgVmlkZW8gUExMIG9yIG5vdC4NCj4gPg0KPiA+IFRoYXQncyBu
YXN0eS4gIEl0IGxvb2tzIGV2ZW4gbW9yZSBuYXN0eSB3aGVuIGNvbnNpZGVyaW5nIHRoZSBmYWN0
IHRoYXQNCj4gPiBpLk1YOTMgTENESUYgaXMgYWxzbyBkcml2ZW4gYnkgaW14LWxjZGlmIERSTSB3
aGlsZSBvbmx5IGkuTVg4TVAgTENESUYNCj4gPiBuZWVkcyB0aGUgbmFzdHkgY2hlY2ssIGJlY2F1
c2UgaS5NWDkzIFNvQyBlbWJlZHMgb25seSBvbmUgTENESUYuDQo+IA0KPiBUaGUgY2hlY2sgY2Fu
IGJlIHNraXBwZWQgYmFzZWQgb24gY29tcGF0aWJsZSBzdHJpbmcuDQo+IA0KPiBJIGFncmVlIGl0
IGlzIG5hc3R5LCBidXQgaXQgaXMgYSBzdGFydC4gQXJlIHRoZXJlIGJldHRlciBpZGVhcyA/DQoN
Ck5vIGdvb2QgaWRlYSBmcm9tIG1lLg0KDQo+IA0KPiA+PiBNYXliZSB0aGUgY2xvY2sgc3Vic3lz
dGVtIGhhcyBhIGJldHRlciB3YXksIGxpa2UgbGlzdCAibmVpZ2hib3IiDQo+ID4+IGNvbnN1bWVy
cyBvZiBzb21lIHNwZWNpZmljIHBhcmVudCBjbG9jayBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0K
PiA+DQo+ID4gV2hhdCB3aWxsIGlteC1sY2RpZiBEUk0gbG9vayBsaWtlIGJ5IHVzaW5nIHRoaXMg
d2F5PyBHZXQgdGhlIGFuY2VzdG9yIFBMTA0KPiA+IGNsb2NrIG9mIHBpeGVsIGNsb2NrKG1lZGlh
X2Rpc3B7MSwyfV9waXhfcm9vdF9jbGspLCBsaXN0IGFsbCBjaGlsZCBjbG9ja3MNCj4gPiAobWVk
aWFfZGlzcDFfcGl4IGFuZC9vciBtZWRpYV9kaXNwMl9waXggKyBvdGhlciBwb3NzaWJsZSBjbG9j
a3MpIG9mIHRoZQ0KPiA+IFBMTCBjbG9jayBpbiBhIHN0cmluZyBhcnJheSBhbmQgZmluZCBtZWRp
YV9kaXNwMV9waXggKyBtZWRpYV9kaXNwMl9waXgNCj4gPiBpbiBpdD8NCj4gPg0KPiA+IERvZXNu
J3QgbG9vayBuaWNlLCBlaXRoZXIuDQo+IA0KPiBPbmUgb3RoZXIgb3B0aW9uIGNhbWUgdG8gbXkg
bWluZCAtLSBwbGFjZSBhIHZpcnR1YWwgY2xvY2sgYmV0d2VlbiB0aGUNCj4gVmlkZW8gUExMIGFu
ZCBjb25zdW1lcnMgKExDRElGMS8yL0xEQiksIGFuZCB0aGVuIGhhdmUgdGhlIHZpcnR1YWwgY2xv
Y2sNCj4gZHJpdmVyIGRvIHRoZSBjbG9jayByYXRlIG5lZ290aWF0aW9uIGluIHNvbWUgLnJvdW5k
X3JhdGUgY2FsbGJhY2suIFRoYXQNCj4gaXMgYWxzbyBuYXN0eSwgYnV0IGl0IGlzIGFub3RoZXIg
aWRlYS4gSWYgdGhlcmUgaXMgYSBjbG9jayBzcGVjaWZpY2FsbHkNCj4gaW1wbGVtZW50ZWQgdG8g
bmVnb3RpYXRlIGJlc3QgdXBzdHJlYW0gY2xvY2sgcmF0ZSBmb3IgYWxsIG9mIGl0cw0KPiBjb25z
dW1lcnMsIGFuZCBpdCBpcyBhd2FyZSBvZiB0aGUgY29uc3VtZXIgYmVoYXZpb3IgZGV0YWlscyBh
bmQNCj4gcmVxdWlyZW1lbnRzLCBtYXliZSB0aGF0IGNvdWxkIHdvcmsgPw0KDQpBIG1pZ2h0eSB2
aXJ0dWFsIGNsb2NrPyAgSSdtIG5vdCBzdXJlIGlmIHRoYXQgd291bGQgd29yayBvciBub3QuDQoN
Cj4gDQo+ID4+IFsuLi5dDQo+ID4+DQo+ID4+Pj4gQ2FuIHNvbWV0aGluZyBsaWtlICgqKSBhYm92
ZSBiZSBpbXBsZW1lbnRlZCBpbnN0ZWFkLCBzbyBib3RoIFNoYXJlZA0KPiA+PiBhbmQNCj4gPj4+
PiBzZXBhcmF0ZSBQTExzIHdvdWxkIGJlIHN1cHBvcnRlZCA/IFRoYXQgc2hvdWxkIHNvbHZlIGJv
dGggb2Ygb3VyIHVzZQ0KPiA+Pj4+IGNhc2VzLCByaWdodCA/DQo+ID4+Pg0KPiA+Pj4gSSBkb24n
dCBzZWUgYW55IGNsZWFyIHdheSB0byBpbXBsZW1lbnQgc29tZXRoaW5nIGxpa2UoKikuDQo+ID4+
Pg0KPiA+Pj4gVGFrZSB0aGUgMyBpLk1YOE1QIExDRElGcyBhcyBvbmUgZ3JhcGhpYyBjYXJkIGRy
aXZlbiBieSBvbmUgaW14LWxjZGlmDQo+ID4+PiBEUk0gaW5zdGFuY2U/ICBXb3VsZCBpdCBiZSB0
b28gaW50cnVzaXZlPw0KPiA+Pg0KPiA+PiBZZXMsIGFuZCBJIHRoaW5rIHVubmVjZXNzYXJ5LCBv
bmUgY2FuIHNpbXBseSB0cmF2ZXJzZSBhbmQgcGFyc2UgdGhlIERUDQo+ID4+IHRvIGRldGVybWlu
ZSB0aGUgY2xvY2sgYXNzaWdubWVudD8NCj4gPg0KPiA+IFllcywgcGVvcGxlIGNhbiB0cmF2ZXJz
ZSBhbmQgcGFyc2UgRFQsIGJ1dCBpdCdzIG5hc3R5Lg0KPiA+DQo+ID4gSW4gYWRkaXRpb24sIG9u
ZSBtYXkgYXJndWUgdGhhdCBub3cgdGhhdCBDTEtfU0VUX1JBVEVfUEFSRU5UIGZsYWcNCj4gPiBp
cyBzZXQgZm9yIHRoZSBwaXhlbCBjbG9ja3MsIGFsbCBwb3RlbnRpYWwgdmlkZW8gbW9kZXMgcmVh
ZCBmcm9tIEVESUQNCj4gPiBzaG91bGQgYmUgc3VwcG9ydGVkIHdoZW4gb25seSBlaXRoZXIgTFZE
UyBkaXNwbGF5IHBpcGVsaW5lIG9yIE1JUEkgRFNJDQo+ID4gZGlzcGxheSBwaXBlbGluZSBpcyBh
Y3RpdmUgaW4gdGhlIHNoYXJlZCBQTEwgY2FzZS4gIFRoaXMgcmVxdWlyZXMgb25lDQo+ID4gc2lu
Z2xlIERSTSBpbnN0YW5jZSB0byBkZXRlY3Qgc2luZ2xlIG9yIGR1YWwgYWN0aXZlIGRpc3BsYXkg
cGlwZWxpbmVzDQo+ID4gZHluYW1pY2FsbHksIGhlbmNlIHRoaXMgc2luZ2xlIERSTSBpbnN0YW5j
ZSBiZWNvbWVzIG5lY2Vzc2FyeS4NCj4gDQo+IFdvdWxkIHNpbmdsZSB2aXJ0dWFsIGNsb2NrIHdo
aWNoIGRvIHRoZSBmcmVxdWVuY3kgbmVnb3RpYXRpb24gYmV0d2Vlbg0KPiBtdWx0aXBsZSBEUk0g
Y29uc3VtZXJzIHdvcmsgdG9vID8NCg0KTm90IHN1cmUgaWYgaXQgd291bGQgd29yayBvciBub3Qs
IGJ1dCBJJ20gc3VyZSB0aGF0IG9uZSBzaW5nbGUgRFJNIGluc3RhbmNlDQptZWFucyBhdG9taWMg
Y2hlY2svY29tbWl0IGZvciB0aGUgZGlzcGxheSBwaXBlbGluZXMgYXMgYSB3aG9sZSwgaGVuY2UN
CmF3YXJlbmVzcyBvZiBhY3RpdmUgZGlzcGxheSBwaXBlbGluZSBudW1iZXIgaW4gYW4gYXRvbWlj
IHdheS4NCg0KPiANCj4gSSBkbyBub3QgaGF2ZSBtdWNoIHRvIGFkZCB0byB0aGUgcG9pbnRzIGJl
bG93Lg0KDQpSZWdhcmRzLA0KTGl1IFlpbmcNCg==
