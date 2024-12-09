Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB559E8D1E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 09:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8087B10E4A0;
	Mon,  9 Dec 2024 08:16:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="b3/FEq0J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2077.outbound.protection.outlook.com [40.107.104.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6381B10E4A0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 08:16:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDW/ek3K5ok2DkLflEBjDCc2VXVeHoqpM/6/s0R8yPGogymMwm/5yKcTRgSBxjhp3Fb98AsGsJID8AgC/xOtcquoJNo9buye/E4wdBiPYDO1XKPai3zP05dk8lpF/rT/Qgz4Y27VAfd/O2ey06QizW8XoJ1MDk4mLthGR+4Si++nzBQczVTbX5SPzET8IIM5ZVJ6Dzd1Ebme87p51p1QxCPmhgGLFZwAK8nGA+wWfvGvDARhgNEBvb9uI1SSsLE4FxoxsTI2shs4DmLS+paQc8TDRTAi5XFvVTmWMickRyecu23WIDu27CD8IIq2YqXe812T8ysc6i4fpbQY+Z7SMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=phJTcnEyx3CTj70kkfSOGsdLwPY83ql0Q7C7j0XGFQc=;
 b=gyiYkIQ+Vo+f/0AzkpJLmdoNPMLFUr5cOpaoRXXIonyxL/73R/KgmJFEadVv5z8f1B2xa2uqUs4OnsL3Sq4dpqud5kUh5zwAx8OLNd42EUpCkHRp1XOvx4bRZeGs0WDjaJ9/JM2xtJZP3h0V1N7JlNJdWtBFf/1TXl1wyzbruU3Q0JgSPRrMPiKnOS+qw1nZI9xLkdH4ziM3imYJ6BJIwG4jOqBPceug1JCvWWFnNJUaiAlix4oHEq58lolc3loOb2f/+edh6JAEywkzZQbvfC5/KVDJf50GcfC27pZkXKIZWCnr1uniznau0GELvVG21v0q9nAkKEP7tW968Sw62g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=phJTcnEyx3CTj70kkfSOGsdLwPY83ql0Q7C7j0XGFQc=;
 b=b3/FEq0JaZ/Yjog8UhcpxUnQMinvlvekiCz1+LrZ5NUMi8k33iM0Z9Ou/oKLQJc0iPtiA6rWjeKEXcCRFSJst4hdfFgOUoPQllSBHLMHEmH6GOMGGh2gtNypBZSoVj5sfC1lQ/0RF3G3VfZh13Y7CDfodc+aSD1Hu/mNJPECXSLM4FabImAWNJ4l0FrHCmGxOPi8t/PaWa2MZm4pdealpadfTM03q3+L4BnstpA9jLrDJmm+MXkENfioVvRK+OIb3pKGFCxlS1VdxWoraIkRcdUwxkqbr7m/gZXK6o0HMZf6IYJ/s9tEtaySqW5t3g4D8DSSWttcsp3pjxQPri8VeQ==
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM7PR04MB6856.eurprd04.prod.outlook.com (2603:10a6:20b:108::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Mon, 9 Dec
 2024 08:16:48 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8230.016; Mon, 9 Dec 2024
 08:16:48 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
 <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "mripard@kernel.org" <mripard@kernel.org>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>, dl-linux-imx
 <linux-imx@nxp.com>, Oliver Brown <oliver.brown@nxp.com>,
 "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Subject: RE: [EXT] Re: [PATCH v18 6/8] phy: freescale: Add DisplayPort/HDMI
 Combo-PHY driver for i.MX8MQ
Thread-Topic: [EXT] Re: [PATCH v18 6/8] phy: freescale: Add DisplayPort/HDMI
 Combo-PHY driver for i.MX8MQ
Thread-Index: AQHbL4vSjpxHitZMykWL4MsQcCKA6LKr1usAgB3IEmCABgXugIAODVTw
Date: Mon, 9 Dec 2024 08:16:48 +0000
Message-ID: <PAXPR04MB94488E0A549E519CEB8AA40EF43C2@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <411e42c70e71dce33a80059f663fb6c58fb2ac8c.1730172244.git.Sandor.yu@nxp.com>
 <efciuvoptv7qxwauswfseb6zlt5w4fmjdbm3huxfsn63a6bm7u@kfgkkvqoz5x4>
 <PAXPR04MB9448F638D47B5495CF78007AF4522@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <z6p6bewmykmufsghdojr4lvziurmmfpnrr5m4w3pfjlqzobpwr@zq2d2ukjvtac>
 <PAXPR04MB9448D68A5CA9755036E9B23DF42F2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <foi2sizfkppmunq4yqt4pex47alsvsjyqi3rk32fwyz4f5xepn@zdsx74bzzda4>
In-Reply-To: <foi2sizfkppmunq4yqt4pex47alsvsjyqi3rk32fwyz4f5xepn@zdsx74bzzda4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AM7PR04MB6856:EE_
x-ms-office365-filtering-correlation-id: 6b967260-1aee-484d-c5a1-08dd1829d3d7
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?gb2312?B?MU9ld1ZQVDljQzVPbHFOY3RmQVFURXJkVmFoOHBmY0hmTVZ3L0lKYUlFTnlC?=
 =?gb2312?B?RkFxOFd4QjQ1QlVSc082TEwxZGJ0dVdjSlpCTytoVVBwTmNyNlVXVHlNT2ZJ?=
 =?gb2312?B?eGVwMExRT28rWXJnWUk2Z0RMem44TjhnN2MzMU83LzIyNHh2eVQ0N1VGZ2dO?=
 =?gb2312?B?M1NJWk1zUVhBVTZYaW85QmRnbUthNjFudWwvTWE3UjdTT1JrK0tZSFJrT2hK?=
 =?gb2312?B?eWRpV3ExYUtLYWg0eVg2OEJIU1Jib0pTVEtvM1BLTW0rWHg1YkRVSlFOaklB?=
 =?gb2312?B?d0lRbVhHcStnTDNQVTJRd0hsWWRSNjB6c2w4R2RkWHc0VnV3dHVXM2NBTjZ1?=
 =?gb2312?B?UytMQVVkZDBjWU5vTkdnbSswZmlpVGlHWEhYV1h5N2NYWndSZkN5K3AwT1Y2?=
 =?gb2312?B?ekxnQzRCZW1WZ0VGdXNQWnZQSDJaR01ZQVlKQTFRNG1zd1g0RXhlQjhuRkM2?=
 =?gb2312?B?ODcySTBFTDBJVWl6UkU0SzNzMXkydE1mV2JpcFgySVVUSTNIOFZFT3ppR211?=
 =?gb2312?B?SlNlM29RRkJKR1pXTEg4a0VST2RkWitRV3ZTNUk4aTBoVHBmelJGRE00L3Ny?=
 =?gb2312?B?Lzk1QUd2K1lZUGc2bm9jWjg3Mk1OV0cvUXE3THV0bEw0VFBSenBJcjlNWnFB?=
 =?gb2312?B?T0tnVG9JR3JjQ2h0Q25UWktOZmtaeWJ1VVkrZHVRRm9XKzlIejkvSDU0SHNT?=
 =?gb2312?B?c3l1RkVFdzJnRW1SdXZBMWFTMUtDd1ZnaWU3Z05KS2swNnJqa0VlYmdURFJh?=
 =?gb2312?B?bXEwek85NVlqRFQ4RFBud3VTcjVmR2J6TGJQUDZzcmJleUFocGU5dElJZTlo?=
 =?gb2312?B?OVdVQ2RDcnVwREJrOWZMTWVFa1cwdTdmL0ROd284NzYydG5zZDJOMlBuODI1?=
 =?gb2312?B?eC9jMVgzTUVqUFllSG5NaC9PZTRvRFU2MCtQUWkweEh1aEwzZE54cW9SMC9a?=
 =?gb2312?B?V21tSld5NXR0WUlSWHFCc3lJMm5yWTUvdzZiWFJkby9QeDU4RUlHNHY1eVpM?=
 =?gb2312?B?V1d0RS83VHBBSzZpSkhXU0xrOXpkZDNSbm12TnpkaGl5SGZzOHVJV0RFTStX?=
 =?gb2312?B?V2ZGZVkraU5VRlhiVmVya0UzOERhWWZHeSs4eUxWdTBKUlhKWE9IbWIyYjds?=
 =?gb2312?B?ZFlqQ2pLMTg0Qy9Rd3A4dWN6VU80c2w0THF5QUlzRXVqN3dWNEZla2hucUsw?=
 =?gb2312?B?WTVUOXhHSkFXSkdaejdlTnB5a0M5TGtIcmV1S1E2eXRUQ2FacWtzYllqMk1x?=
 =?gb2312?B?WjJGVHFiRUNZenRONm01dFhCSXA4elhWRUVsY0owZFB2RWV5SzRHcCtJeE5k?=
 =?gb2312?B?SVcreFZmZ1YxL0hYVDJHLzFMa3Y5eDgzZEF4Zmw1ZDZ1WndEcTFLdEp3RVRV?=
 =?gb2312?B?S1ZaT09DNzQ0aGxNZENxUVIvL3Y4dFBJaUVxSjlGUW1oS1RMaHlDQWpMZCtJ?=
 =?gb2312?B?dDRldThwUzhqZHQvcjFuanU1NG1UbmtyM0ZHNXFnNHdHRzlOK3BDQm5HRWJx?=
 =?gb2312?B?cDJFeW5xekthMExYRjhJSXdXOXZHOTBTS2pYNFVyN0xMdHl2VSt6V1BBbTRw?=
 =?gb2312?B?d3EyTFNCd0Qyc2R6SGdudTZrbnhXZDVXaDQ3cWNzM3lHWm5UTWhUZ21ia3BU?=
 =?gb2312?B?MVpWL1ZmVjhYbnpKbUMxZlN4Zy82bkU0bnJJSlV3Z3VkT3lIbVM0WGdSZThQ?=
 =?gb2312?B?VWFOckpMWEdCcktaTFBpaTlSV1BmWFR4VXVJTzFiWjBOeFhVa1E2Sy9ZTDZr?=
 =?gb2312?B?d3FGOTZvMmFHeG9vU045eTVvdWJpN0F6OWJPaEQ5Y3FzMHdzdllIOFE4VW5r?=
 =?gb2312?B?L3JmUGd5U1BibTdQVGI1dlJMcDNKaGNQcDdFWFI2L1Jza0RXdGc5M0FkUjEz?=
 =?gb2312?B?bWFpVFRRU2dZZkJOdVE5ZEluV2Y5UmNqd21ZdWFuUzUrNHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?Uk9xSmc5Um0yV2xnbXd1TGZRbUxsN3VLRFQ1VVNmVlBDY0h1Zkxad1hQcEEv?=
 =?gb2312?B?bGEybCsxeWlqb1pmRlgvVVJWampyYnJ1K0JHaWczcWNtZTBUNFAyTEJaWnkx?=
 =?gb2312?B?MDdKbjJWZ0x5Q3hKL2tMdHkrQXhGRzJFTVQxQTREWHdES0NDZjZJK0lmQmpN?=
 =?gb2312?B?Qm5GS1NvRmpUaUpIalB2cVNFTjVFWDFscmhWemY0dFd5UEtvWWl1UFVnbUow?=
 =?gb2312?B?dENPTm9FNXhwcnBINGdBOFBySmh2cGs1THZpbEhTZVcxYzdtcGRaVXFJZ3pU?=
 =?gb2312?B?WHVHOUM5eEdCMndWUGlyemk3NnhHK08yMmJPOWtMZmM4SEVFK2ozZUhTeXUy?=
 =?gb2312?B?TURkOWlRMjkybjRqT2gwcjRnRGk0UmpybnlZaFlvaEs3UEI1N3htSkU5ZFk1?=
 =?gb2312?B?bzljRTdnc0Ria0MrODJsZllVUXI5OXdtL0p1M1JjUXN1YXVidVJ5bzBFOFFV?=
 =?gb2312?B?VGlKc3hBd3F2MkluUkhJL3R1MU5nUkxvQjRTamZ0NVB2dGY0RmpJc2FLeGVq?=
 =?gb2312?B?R3M4d3d5WmlSeDhEdG9sNWR4TnhqNzhrTndFa2I5Wnh2NkpLVXEwaDlKRmJw?=
 =?gb2312?B?MGxKZHVQek9RNGdMZGZCTGJtcFlGK0VKWTlrdlNKU1AyN2t2MVk5TjQ5akZm?=
 =?gb2312?B?aisrRWpDUTFuV09iMHJsZ3RGZkYrcHRyWDBrczBXTFp6RnZZWE0ySVB3RWZG?=
 =?gb2312?B?T1pmMEdCY3NQRWhJdG1oNlN2SmdXRjhoei8rQlBwOEI2RHpoV3BGU3ZCckUv?=
 =?gb2312?B?THQ2VGZzVDVMcU05NElkdnZrazNPTTRBVXVaZ1R0OWliOTA3SWJwSllQTll3?=
 =?gb2312?B?OGU1d0VZbTc5bHkzalFTS2duTW1sNGNTbThRR2VMMHFtWnNKb1RDbGNTcUg4?=
 =?gb2312?B?Vng2OENVaHRGWWdjUnMyRTB1R3g2bm9kTjNla0Y4TVpUOTNPSklCczFUeGlv?=
 =?gb2312?B?djZwYnlKTmxpTmZBa2lxTXNBaFlGMVZsU1g1MHh0OTB1M09wYWZoamJVRzV0?=
 =?gb2312?B?RDkyZXI1UU40Qm83bHo3ZENQMUhmMmQ5UWhZVmhwVEtHdU4zTVU1cXhSbTgr?=
 =?gb2312?B?TW1MNTZrRGNNTTFXSUd0RHJ5NjBGNkF0Tmg3eXZrS1haMlJnc3NJemlhWDlC?=
 =?gb2312?B?bU1lQS95UEtXNDUrOEJqR0JvTW5RcUpLRnRKbzU0TFdzc3R5WkVXcVMvejZY?=
 =?gb2312?B?UWJVWVN3dGlPY0FYTGZ4a3I4UnFBaVZxc3o3Q09oN3lyTkFWdEtQbUphMC9n?=
 =?gb2312?B?NmJhVGw3bThERi9QYnhOVVdVeHg5cm80a1JvNnl0MSszMTE4dEY2U1orKy9E?=
 =?gb2312?B?NEw1ZHFrcVdLR0lOQytGUUhiVHpVaGIyYlAyR3pGTWlNbUlkS1E3Y3VqckF1?=
 =?gb2312?B?cCtLSU5RWkp4ZzQybkViRHNoM3l0eWhtQUptT1V2ay80UzlZelpvenJMY2o3?=
 =?gb2312?B?aEYwTy9QdnZoQ0VKSUx5S0pDd2RuNFFJK2c5eWdweFE5SHN3bzJlaDlWS2k5?=
 =?gb2312?B?Yit5NG80SytWcWlwSEpsc3ZjREdjUmkzandGV3hCZlRqL0tPVjU1b2g0bXRR?=
 =?gb2312?B?cHlRSXlCbE9ra0pXdVVNbFZoWW14cUVYd3p1cS9QK3hrSEZabEpzQ1pVRzhk?=
 =?gb2312?B?bXhRaUdIMEl3ZENqbGl0NUxIK1pJWWZkWVdzakU5OVlvOUd1S3lHcC9UR3FW?=
 =?gb2312?B?TWZoZEJ6R21iSy9oU1duRXF5QlJsK1RpS1FUSVMreUVZMzAyMnhGczE3YmND?=
 =?gb2312?B?V25oY2V6bVZGbUF4K0d4LzZSc0xIRFpXWlBwdW9vUGJETmlKb2E4dmhrZlRE?=
 =?gb2312?B?clg5Wm9GQjZUUDN0ZFh5QmRhOEFLWkNVVUM4OEZtZ2FFcWt2TVJmZzVKS09o?=
 =?gb2312?B?eldzdGxGSVBZZFkxdmM1N2VlUWMvKzZISWIvTTVURlM0UGxKVFA5R1gyU3Qw?=
 =?gb2312?B?M3VtYkxJcU9taU5rMkZ2aW9hMGVjMjhJNWtSTCsrWHNvYXpYdW1lUmhPQlJQ?=
 =?gb2312?B?M01LMEdtWTVaME9KSzFmaUxpN08wV3UrYnU3NU85VXRUYTFQeEU0cDBGdHh5?=
 =?gb2312?B?c2xoaTFqdmY4YkNDY25nVVAzS05rUFVoUjhJRE00V0JDY0k5UjhhY2QvMk9P?=
 =?gb2312?Q?Mjww=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b967260-1aee-484d-c5a1-08dd1829d3d7
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Dec 2024 08:16:48.2771 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Xmyz9FuGCRYzkPBvWuIQOKXQhw2MOsCWSMcPArS1nOHuVlWQtg+Rz7I5Pwji/o5sNXa+dpmtnVgAW7x38pN2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6856
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRG1pdHJ5IEJhcnlzaGtv
diA8ZG1pdHJ5LmJhcnlzaGtvdkBsaW5hcm8ub3JnPg0KPiBTZW50OiAyMDI0xOoxMdTCMzDI1SAx
NjozMA0KPiBUbzogU2FuZG9yIFl1IDxzYW5kb3IueXVAbnhwLmNvbT4NCj4gQ2M6IGFuZHJ6ZWou
aGFqZGFAaW50ZWwuY29tOyBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnOyBMYXVyZW50IFBpbmNo
YXJ0DQo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+OyBqb25hc0Brd2lib28u
c2U7DQo+IGplcm5lai5za3JhYmVjQGdtYWlsLmNvbTsgYWlybGllZEBnbWFpbC5jb207IGRhbmll
bEBmZndsbC5jaDsNCj4gcm9iaCtkdEBrZXJuZWwub3JnOyBrcnp5c3p0b2Yua296bG93c2tpK2R0
QGxpbmFyby5vcmc7DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1ZXJAcGVuZ3V0cm9uaXgu
ZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsNCj4gdmtvdWxAa2VybmVsLm9yZzsgZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4
LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmc7DQo+IG1yaXBhcmRAa2VybmVs
Lm9yZzsga2VybmVsQHBlbmd1dHJvbml4LmRlOyBkbC1saW51eC1pbXgNCj4gPGxpbnV4LWlteEBu
eHAuY29tPjsgT2xpdmVyIEJyb3duIDxvbGl2ZXIuYnJvd25AbnhwLmNvbT47DQo+IGFsZXhhbmRl
ci5zdGVpbkBldy50cS1ncm91cC5jb207IHNhbUByYXZuYm9yZy5vcmcNCj4gU3ViamVjdDogUmU6
IFtFWFRdIFJlOiBbUEFUQ0ggdjE4IDYvOF0gcGh5OiBmcmVlc2NhbGU6IEFkZCBEaXNwbGF5UG9y
dC9IRE1JDQo+IENvbWJvLVBIWSBkcml2ZXIgZm9yIGkuTVg4TVENCj4gDQo+IENhdXRpb246IFRo
aXMgaXMgYW4gZXh0ZXJuYWwgZW1haWwuIFBsZWFzZSB0YWtlIGNhcmUgd2hlbiBjbGlja2luZyBs
aW5rcyBvcg0KPiBvcGVuaW5nIGF0dGFjaG1lbnRzLiBXaGVuIGluIGRvdWJ0LCByZXBvcnQgdGhl
IG1lc3NhZ2UgdXNpbmcgdGhlICdSZXBvcnQNCj4gdGhpcyBlbWFpbCcgYnV0dG9uDQo+IA0KPiAN
Cj4gT24gVHVlLCBOb3YgMjYsIDIwMjQgYXQgMDI6MTI6MTlQTSArMDAwMCwgU2FuZG9yIFl1IHdy
b3RlOg0KPiA+DQo+ID4gPg0KPiA+ID4gT24gVHVlLCBOb3YgMDUsIDIwMjQgYXQgMDI6MDU6NTFQ
TSArMDAwMCwgU2FuZG9yIFl1IHdyb3RlOg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gT24gVHVlLCBP
Y3QgMjksIDIwMjQgYXQgMDI6MDI6MTRQTSArMDgwMCwgU2FuZG9yIFl1IHdyb3RlOg0KPiA+ID4g
PiA+ID4gQWRkIENhZGVuY2UgSERQLVRYIERpc3BsYXlQb3J0IGFuZCBIRE1JIFBIWSBkcml2ZXIg
Zm9yDQo+IGkuTVg4TVEuDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gQ2FkZW5jZSBIRFAtVFgg
UEhZIGNvdWxkIGJlIHB1dCBpbiBlaXRoZXIgRFAgbW9kZSBvciBIRE1JIG1vZGUNCj4gPiA+ID4g
PiA+IGJhc2Ugb24gdGhlIGNvbmZpZ3VyYXRpb24gY2hvc2VuLg0KPiA+ID4gPiA+ID4gRGlzcGxh
eVBvcnQgb3IgSERNSSBQSFkgbW9kZSBpcyBjb25maWd1cmVkIGluIHRoZSBkcml2ZXIuDQo+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogU2FuZG9yIFl1IDxTYW5kb3IueXVA
bnhwLmNvbT4NCj4gPiA+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdGVpbg0KPiA+
ID4gPiA+ID4gPGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+DQo+ID4gPiA+ID4gPiAt
LS0NCj4gPiA+ID4gPiA+IHYxNy0+djE4Og0KPiA+ID4gPiA+ID4gLSBmaXggYnVpbGQgZXJyb3Ig
YXMgY29kZSByZWJhc2UgdG8gbGF0ZXN0IGtlcm5lbCB2ZXJzaW9uLg0KPiA+ID4gPiA+ID4NCj4g
PiA+ID4gPiA+ICBkcml2ZXJzL3BoeS9mcmVlc2NhbGUvS2NvbmZpZyAgICAgICAgICAgICAgICB8
ICAgMTAgKw0KPiA+ID4gPiA+ID4gIGRyaXZlcnMvcGh5L2ZyZWVzY2FsZS9NYWtlZmlsZSAgICAg
ICAgICAgICAgIHwgICAgMSArDQo+ID4gPiA+ID4gPiAgZHJpdmVycy9waHkvZnJlZXNjYWxlL3Bo
eS1mc2wtaW14OG1xLWhkcHR4LmMgfCAxMzM3DQo+ID4gPiA+ID4gKysrKysrKysrKysrKysrKysr
DQo+ID4gPiA+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAxMzQ4IGluc2VydGlvbnMoKykgIGNyZWF0
ZSBtb2RlIDEwMDY0NA0KPiA+ID4gPiA+ID4gZHJpdmVycy9waHkvZnJlZXNjYWxlL3BoeS1mc2wt
aW14OG1xLWhkcHR4LmMNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9waHkvZnJlZXNjYWxlL0tjb25maWcNCj4gPiA+ID4gPiA+IGIvZHJpdmVycy9waHkvZnJl
ZXNjYWxlL0tjb25maWcgaW5kZXgNCj4gPiA+ID4gPiA+IGRjZDlhY2ZmNmQwMWEuLjJiMTIxMDM2
N2IzMWMNCj4gPiA+ID4gPiA+IDEwMDY0NA0KPiA+ID4gPiA+ID4gLS0tIGEvZHJpdmVycy9waHkv
ZnJlZXNjYWxlL0tjb25maWcNCj4gPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvcGh5L2ZyZWVzY2Fs
ZS9LY29uZmlnDQo+ID4gPg0KPiA+ID4gWy4uLl0NCj4gPiA+DQo+ID4gPiBJJ20gc29ycnksIG15
IGVtYWlsIGNsaWVudCBjdXQgdGhlIGVtYWlsLg0KPiA+ID4NCj4gPiA+ID4gPiA+ICtzdGF0aWMg
aW50IGNkbnNfaGRwdHhfZHBfY29uZmlndXJlKHN0cnVjdCBwaHkgKnBoeSwNCj4gPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuaW9uIHBoeV9jb25maWd1cmVfb3B0
cw0KPiA+ID4gKm9wdHMpIHsNCj4gPiA+ID4gPiA+ICsgICAgIHN0cnVjdCBjZG5zX2hkcHR4X3Bo
eSAqY2Ruc19waHkgPSBwaHlfZ2V0X2RydmRhdGEocGh5KTsNCj4gPiA+ID4gPiA+ICsNCj4gPiA+
ID4gPiA+ICsgICAgIGNkbnNfcGh5LT5kcC5saW5rX3JhdGUgPSBvcHRzLT5kcC5saW5rX3JhdGU7
DQo+ID4gPiA+ID4gPiArICAgICBjZG5zX3BoeS0+ZHAubGFuZXMgPSBvcHRzLT5kcC5sYW5lczsN
Cj4gPiA+ID4gPg0KPiA+ID4gPiA+IFNob3VsZG4ndCB0aGlzIGJlIGNvbmRpdGlvbmFsIG9uIHNl
dF9yYXRlIC8gc2V0X2xhbmVzID8NCj4gPiA+ID4NCj4gPiA+ID4gUEhZIGRvIG5vdCBzdXBwb3J0
IHJlY29uZmlndXJlIGxpbmsgcmF0ZSBhbmQgbGFuZSBjb3VudC4NCj4gPiA+DQo+ID4gPiBTbywg
eW91IGRvbid0IHN1cHBvcnQgcmVjb25maWd1cmluZyB0aGUgcmF0ZSAvIGNvdW50LCBidXQgeW91
IHN0aWxsDQo+ID4gPiBjb3B5IHRoZSBuZXcgcmF0ZSBhbmQgbGFuZXMgaW50byB5b3VyIGRyaXZl
ciBkYXRhLiBUaGF0IHNvdW5kcyBzdHJhbmdlLg0KPiA+DQo+ID4gVGhlIFBIWSB3aWxsIHVzZSBs
aW5rIHJhdGUgYW5kIGxhbmUgY291bnQgdG8gY29uZmlndXJlIGl0cyByZWdpc3RlcnMNCj4gDQo+
IEknbSBub3Qgc3VyZSBpZiBJIGZvbGxvdyBpdC4gRG8geW91IG1lYW4gdGhhdCByYXRlIC8gY291
bnQgY29uZmlndXJhdGlvbiBpcyBzdGF0aWM/DQoNCkluIERQIGNvbnRyb2xsZXIgZHJpdmVyLCBy
YXRlIGFuZCBsYW5lIGNvdW50IGFyZSBkZXRlcm1pbmVkIGR1cmluZyBsaW5rIHRyYWluaW5nLiAN
ClRoZXNlIHR3byBwYXJhbWV0ZXJzIGFyZSBmaXhlZCBpbiB0aGUgRFAgUEhZIGRyaXZlciBhbmQg
Y2Fubm90IGJlIG1vZGlmaWVkLg0KDQpTYW5kb3INCg0KPiANCj4gLS0NCj4gV2l0aCBiZXN0IHdp
c2hlcw0KPiBEbWl0cnkNCg==
