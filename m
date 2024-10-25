Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622D99B025E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 14:30:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C21610EA7D;
	Fri, 25 Oct 2024 12:30:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="CeuYyWmk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2064.outbound.protection.outlook.com [40.107.20.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5086110EA7D
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 12:30:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkIJ7vRkBGrjbZ8dFTnkvGm+pVT9pv9UKv/liBsBsHyVldPUJIxehd+rayS9jp9rZo/9oRuy6iTj9K4+/5o/bBOuvrl+PO2Ho+eGsC/62Cn2TSuUT0D+g/+LLos9CBthKkSpZRSMF8jvmLwnnumxs4BtbjrJLiGSdahfG3VcWcgnGt0xfphhyPfp7c6YhbuLsHkCwQvCNye/7pVgTQDRk7ZqZmzzpn83Dow3up1zl3nBCyxVE+QPBLYQj9163oNSMlrx00jxl90Z9Fe0Q0eey74p3q481bPYD4BGw7Iv7pUa95pxWtXNcAO19BgRxgfROJkeu6L1iFX1hxwuI6Hl3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ScM8J/XGewaVm2VspwtOIXBu1nXYHT2W4TncsA3xlQ=;
 b=re0cRoP+gFiuEDXvQmx2rYbyR0fn+TgNrVjmle8xN/mEJWNI6AY6lmhr1vZqPZRNWJIk5HTUj6MIiVs+yBmFwpB/MbsL3OpCUlzHQJKJKpmi48tajexgGozWY4EWLNf+MT8hvbB1IhcZLJ4MilB+n2S33M8khOzELCoUFlYh4UQNi3swgVPWEQsezMgqHSh/F3q3vgwESxZEuAf+wtLQT2BlEI7xUHOt4/gOve6yzxw5xVNhqHpFQR+ndXr3bL5s+ZSSIoAjW6s1J+MPeu6AmqFXcHVfyH3V2wTzuwTEfl7lkkckm9ilex1LSDv3XBZ50SoRbyiRVDX/zzOwI9RTWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ScM8J/XGewaVm2VspwtOIXBu1nXYHT2W4TncsA3xlQ=;
 b=CeuYyWmk9Bza+vhSL7s2pTn1e7wV/Ym7qWkAeJz5yuLMI6MxLo88q0vEWfq8A1fYgHdDwwJ50m2PtWprfLhri99VjAYci8JXLM5o3uuApV9envQcbrVklGruBIu0lT5sJTF5904yU5W94obZDMp7ZiHUciqEJF3zg37NciqVqN438EIZSUwCLukNB0zQ9A8IIn6qOYlXhyBaif1BWR0cQGgMl4TbcvPJ1xiGjKSjSdsuJeat7/HTctXn0ZxcgNZd2xp2cUkbpAWzHW3J3a1WgV5aPZekT4WCRY+OQQbss1K7ukoDBDtSlwG2W8yP7Ycl4EGN7HuiMY+8V4hykanA9g==
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com (2603:10a6:10:367::13)
 by DB9PR04MB9233.eurprd04.prod.outlook.com (2603:10a6:10:361::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Fri, 25 Oct
 2024 12:30:11 +0000
Received: from DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4c69:3f0c:6701:a1cd]) by DB9PR04MB9452.eurprd04.prod.outlook.com
 ([fe80::4c69:3f0c:6701:a1cd%4]) with mapi id 15.20.8093.014; Fri, 25 Oct 2024
 12:30:11 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
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
Subject: RE: [EXT] Re: [PATCH v17 3/8] dt-bindings: display: bridge: Add
 Cadence MHDP8501
Thread-Topic: [EXT] Re: [PATCH v17 3/8] dt-bindings: display: bridge: Add
 Cadence MHDP8501
Thread-Index: AQHbEhhyLpZFpmXKlUec4pLwCRhlG7JwLYCAgCXwduA=
Date: Fri, 25 Oct 2024 12:30:11 +0000
Message-ID: <DB9PR04MB94528A53E03BE5A6A9E336E5F44F2@DB9PR04MB9452.eurprd04.prod.outlook.com>
References: <cover.1727159906.git.Sandor.yu@nxp.com>
 <b2e1d26f964a03163ec7a1ba6ac8d7c88d6cb111.1727159906.git.Sandor.yu@nxp.com>
 <wfdanj6ibwybx2puqvi6xjy6h5t4yagnb2mod7ln3zca4dl5wz@4mvbe6wjavb6>
 <DB9PR04MB94529379E1947D66848B7BE2F4752@DB9PR04MB9452.eurprd04.prod.outlook.com>
 <e235f275-b9ef-40b8-929d-faddd58c17aa@linaro.org>
In-Reply-To: <e235f275-b9ef-40b8-929d-faddd58c17aa@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB9PR04MB9452:EE_|DB9PR04MB9233:EE_
x-ms-office365-filtering-correlation-id: faf3ca28-d416-47d8-3365-08dcf4f0c528
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|38070700018; 
x-microsoft-antispam-message-info: =?gb2312?B?ZUQ2NlRQZVE4QTFWSjZ4UVVrWGVtMlBYd1VpaFZBbVUvQnBCTHNhZWExWHF1?=
 =?gb2312?B?N2tGT0oyMC9VYXZLcDNrRTc0bUViWjNuc05Nc2F6bTNmYmNnYW5xOEJRaXVR?=
 =?gb2312?B?cExoWjZSMjdJQUtSb2RBMGUvOHRuY3RpNDByTk9udFU5cUo2NEVHazlOSWE4?=
 =?gb2312?B?ZHhpc3hqZUpsWHF5YlIxcFFvUnRyZStiRiszSTUvSmEzZm5TQ25DakVJREdR?=
 =?gb2312?B?OHhvVzJYVHdWczNhTm1BYjNxZnd2b2lsNGkzUVpSUmxEdUdzZ0pVeFZTVjFD?=
 =?gb2312?B?TUYzQy9iMlcrdHM3SUVyUlZRSGlXMlVXVVNnOS9TNTl5VkZkYStVVU9iU1hD?=
 =?gb2312?B?RGdZc2pwbXc5c0x1S2hNNGY4dlcyYVlrcE5TQllrdjJpY1VnMDU5dmsvcjZ3?=
 =?gb2312?B?Y21NT09HRUNTcVg3TThzcFRzL0ZHRk12MWgzM1FUeEZCMzJtb0I4M2tPL3BH?=
 =?gb2312?B?RUxTRStkVE02V0FlT2tFaDhSMGNSK1BHK0dqdUpYZDJjM1lxYVRmSU1GNm1k?=
 =?gb2312?B?bFhIYnpFMWlZZW5jVXJITUFZc0d4ZWtveFZ3eEFScEFvY1B3SEdoZG1MWmpq?=
 =?gb2312?B?VGx3RG0xTDRFNW9XV3M0ZkIrdm9aQmpOVmdkQ0lZQUltbTJHOXBCTDVQY3NB?=
 =?gb2312?B?MFhsUzBRVHBFYlJMcGh3Z2wxa28vYnRoT1R4ZmxuQytsdlh5TTZWcUJDd3FM?=
 =?gb2312?B?em1iQ09kZlhLLzExMjNpMmdtZUoxZ2o0dnFXSVpIbkxZRUZESHZGVTB6Q2VT?=
 =?gb2312?B?czlrZUo3UURqc1g0Vmw3Yld6RVk0cGpzMWZSeml4OS9lb2ZpQU1YMGxvZWVE?=
 =?gb2312?B?aEE2U0tWUGE5amdqTHhiUzFSaWtvd0diTk1VL3JHYThGOVNvUG04S2pKZDZJ?=
 =?gb2312?B?T1VENWUxaWhEdmJiT2ZVbkpCdEorYitBWVA2Snk3dFlsQ1NBRTB0R2RDZ01X?=
 =?gb2312?B?WHltNUp2eEwzS29aODlTcElidy8yK3loL0EzQVNkUEs3Yk5YYW5GYzB1UHp6?=
 =?gb2312?B?Qzl1SE9CWWRaT3EzRmI5dzZNMmErVDMwZWpodlhmdHltZmczSjhmc2NzenRM?=
 =?gb2312?B?UE50REVZcjM1U2hRemdiTmM3RlVDVmdtRXQ3RnordUJaenZlV01ZZ3ZIVktP?=
 =?gb2312?B?ZXhqVHU3UXVzRjdBMUt0YTNPUC9PSC9PUDc5YzU1REpoUHVHWjBRUThIU3FO?=
 =?gb2312?B?UUEwY1RqdWw0dmx5SkQ1Slo5Q0dNZ3dVWU1HVG8yTmJ3WHV0K01RdWdtWVVP?=
 =?gb2312?B?bHdrb1hiZDFIS01vNG5kWDhYVGRlaGRvWU5vL0RkRHBwbVhvNTJOc2RQd2xu?=
 =?gb2312?B?U3dEQXpvMXhwK1JqRWNPQ3BaY0xtZmUwUXlkYnlzQUZJZHFaWFZSM0tWOWN0?=
 =?gb2312?B?bFNlbHF1NENNS2dVU3ZIeW5ZUXVzVmRIb0FvSVRqcXp4U0RMKytVNlpqb3FC?=
 =?gb2312?B?U1c3ZUdkaUlvd3BVWTV2Qmo2bUsxa0NuNTU0Mm5mcG1IU3FidnZlUHpGdUFp?=
 =?gb2312?B?bTJGZGpOQ3k0NGp6T3M4SVVFcEhYYXV5RFdYMFZZN2pCTG85d2VRaHBDQVM0?=
 =?gb2312?B?U0VudDRkeU5YaXdFbHFLbC9SNE93NC90QlV6bDJuazZVaGNpZTVyaTA0aml6?=
 =?gb2312?B?NG10T2QvN3o2Q3UzUDRTdTNvUU1TKzhFeEJOUFU2eTY4bW9DVE9BWHZ6N00w?=
 =?gb2312?B?eDd6LzRPcHhhU2xxUCthdkc3RnQ4b3lqak1wQmtGelVCeUw2L2RNcVNqSWlQ?=
 =?gb2312?B?VkRxU0EwS1NtWWQ2eTJFb08vQnpRSGM4WGdLZSt6eUpzd2ZQUGJ6QXE1Sm91?=
 =?gb2312?Q?GNjyRTmSwMRZ7tKmdSQOik+Sq51/FhHcI0arw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:DB9PR04MB9452.eurprd04.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?RW1qMXhiZkhpT1F0Ylc5WXV0ZzV3Rk00S2MvTXBUT0NCRE11ZTVpZWppdnp1?=
 =?gb2312?B?enJSOEFHQjZ2eDNmWTZPUnZMSnRKNitzWnVLcFdBMjhtOW9wekNWTmR4ZkV2?=
 =?gb2312?B?aGZXSFhWald6U2Z1SXgxMW5aV0pMSnlxQnc2L1AwZmZpMXNldU9nZEQ0MDEr?=
 =?gb2312?B?NW04NjFjdThBZFBmNTRHa2J4MjRMK2lPaW4rdTJWWWU3RlN3MFBTUDdwQjBH?=
 =?gb2312?B?Q0tvVklKRXNPdDEwdGwxSldDelU2NUtwS3luc2VCSXhKNGorOTVocC9oK0tN?=
 =?gb2312?B?aGh1VFE3MExvU0lQaFV4M3RSbWxxU3RDVDNucmNxeUtCTzBsRFAwenlacjFQ?=
 =?gb2312?B?aDEyQU5zUER5QndIYU5xdlhVRU95ZEJWK29QaC9BZllsckF5U1NHMXZuOE9t?=
 =?gb2312?B?ZUYyVW5mYkFsM1dUVjF3TWM2ejl5TzkwSG9Qci9ZV3JBWTJHa0dSNjdsNnpJ?=
 =?gb2312?B?WmJodHQ3ajZ3OWU0VTRlSlNjRTNGNHNNSlNIK0Q3YVpsTEVDYnRTNzBJWFJM?=
 =?gb2312?B?TU9OU0JaVDdFUGQvMG9Peitla3R5UGU1bVdrYzFSdFhKcGcvOUtJMWpaODkw?=
 =?gb2312?B?ZEFjWUd5Kzd1dURZemxmQ2Y2Nmo3UVZLdEJ3RndWUUFtSFdRK3luUUNndG1j?=
 =?gb2312?B?STQvdzBaRFg3dkg1ZzNnSlozQWdxVWJlbGxiMmFhaXlZZUFNM0pMS2tYdlFP?=
 =?gb2312?B?L3ZPMXRMeTBLK1dENWIzTkpuWU9KNWJ5NnpDUmp6TVV5VEtsM1hiQTVUWjhC?=
 =?gb2312?B?bW00WTJXU1NZcXozUHlwU2FJQjJ3YW5xTWxYQTVjVHdia3d4b3NLa3A4U1Fy?=
 =?gb2312?B?T2VxTlZKREIzNVFDbk1HaWRCbEJ5SXhpbWJKNWxlWXlsVjJLL1RHbXlPdCtE?=
 =?gb2312?B?WElQQVNGVUtlQ25MSW42UjNDQ1I4R2pwcTFjUlE0Tk5nL1lQRHFKSzgxakR0?=
 =?gb2312?B?b0hvdU85ZEpjNmpGV1Ewak4vQU83YjFhejFDc3dRTG9XcFhUS1R2UXNsWkhF?=
 =?gb2312?B?VVY0RGpVdlQ2THJoTVdINFBnRnBpZHpQVmx5VjV3cGZVMHAvcVNMWHhNRTJR?=
 =?gb2312?B?RmJiT0dSVDU2dEZGTVVzM3hKM1lMeEVwcHEzT2wxQklVWGVYRUNEZ1FBbURK?=
 =?gb2312?B?d2xXcFdXeUhab25XTHI3dzU0TmxPRnhMUUFMOUR1MXNadzVQUlp5c0pYL2J3?=
 =?gb2312?B?T1g2WUxITjVLc1dCbTJrc3pKb1U5bmxsckc4UFBTSTZmUEpIeVlXRDBMQ3FX?=
 =?gb2312?B?VFcvbnI3RkV2YWJ5dksyUFdMQ2tHajBXTElSNWJBK0ZEcCtTTTBZSWU5RnpK?=
 =?gb2312?B?ODJ0K1RTK043VHlRZ1JFRHU1Y1dGdkZwT0pHQk4yZnNDM2xiTkxDZG90Mlp1?=
 =?gb2312?B?ZVYrd2lpUjJPOHBva215MmJBcUNmMitDWm5vd3o2dFIxRm50SjBXdzdvN3p4?=
 =?gb2312?B?WXNDUzBJTEhqWTVNSDRYWElGWm5lT1BjZ0NaQ01IVy9Udi83RmhGUUZqQ2xZ?=
 =?gb2312?B?YmpiU2cxQ3Y2c21zK1VwNVByYlhwMlNHMFBCMkJlUVZMM3JYNlZPUlYybEtZ?=
 =?gb2312?B?Z1hvQVozYnhwTkJmdWJ6dlRLM2ZjeGdtQkc4SXJHeWxIT3JuSVFCbHplVG1O?=
 =?gb2312?B?VUJOQnBPbmM0R3FKVmtKZUdGdldUTnFmWU1ISCswdVNPb3czc2xYZjlwWHdK?=
 =?gb2312?B?bmJDM2dVR29qdGIvK3I0YkZCc3VnQnQrelBxcmtpaEczNjFxUU5lc3V3M2Zy?=
 =?gb2312?B?NzZ0RUJ6V3ZVa29aL0kyN2N3ekxZbUVsMTc4TnJZU05nWkE4KzZ2bktQSmIx?=
 =?gb2312?B?dW96bmZLQXNpWlZZZThNRjZoMUtZRm0vbjhOMlZjaHVIcnB6bUNlUVFjTGZa?=
 =?gb2312?B?dlRUaXdRQUpyalVYYjg0RHloV0NLb2NVTHJBaDRXZlVOT1labVg2dCtpTHpD?=
 =?gb2312?B?RFBtc3pXUi9Cdys3RkV2UlNZc1JWc0lpTlg1SzNFZkpIU0hLQ2VqdHBOeWlY?=
 =?gb2312?B?ZkJsb3FQMHgwdUhPTVVxSi92aXhZaEpmRFRRTHhURTJZWko3cTBUanBhYVpI?=
 =?gb2312?B?bFRyZUp1NDhhTEU2aUE0R0pIYTdZeWFyMFFvS3pCY0V6ZUxtSXdRNTYzMW1Y?=
 =?gb2312?Q?krd8=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9452.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faf3ca28-d416-47d8-3365-08dcf4f0c528
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2024 12:30:11.6284 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uLER9bkQYjRaflaSPt6jch2pTsGaUyi+/M/zCN1R33Fk9s00mtxg72pqSScpGlcZNksF97kWcaJbmSPn2QtqIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9233
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

IA0KPiANCj4gT24gMjkvMDkvMjAyNCAwNDozNiwgU2FuZG9yIFl1IHdyb3RlOg0KPiA+IEhpIEty
enlzenRvZqOsDQo+ID4NCj4gPiBUaGFua3MgZm9yIHlvdXIgY29tbWVudHMsDQo+ID4NCj4gPj4N
Cj4gPj4NCj4gPj4gT24gVHVlLCBTZXAgMjQsIDIwMjQgYXQgMDM6MzY6NDhQTSArMDgwMCwgU2Fu
ZG9yIFl1IHdyb3RlOg0KPiA+Pj4gQWRkIGJpbmRpbmdzIGZvciBDYWRlbmNlIE1IRFA4NTAxIERp
c3BsYXlQb3J0L0hETUkgYnJpZGdlLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFNhbmRv
ciBZdSA8U2FuZG9yLnl1QG54cC5jb20+DQo+ID4+PiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIEtv
emxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiA+Pg0KPiA+PiBEcm9w
DQo+ID4gT0ssIEkgd2lsbCByZW1vdmUgaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4NCj4gPg0KPiA+
Pg0KPiA+Pj4gLS0tDQo+ID4+PiB2MTYtPnYxNzoNCj4gPj4+IC0gQWRkIGxhbmUtbWFwcGluZyBw
cm9wZXJ0eQ0KPiA+Pg0KPiA+PiBUaGF0J3MgYSBzaWduaWZpY2FudCBjaGFuZ2UuDQo+ID4gT0su
DQo+ID4NCj4gPj4NCj4gPj4+DQo+ID4+PiB2OS0+djE2Og0KPiA+Pj4gICpObyBjaGFuZ2UNCj4g
Pj4+DQo+ID4+PiAuLi4vZGlzcGxheS9icmlkZ2UvY2RucyxtaGRwODUwMS55YW1sICAgICAgICAg
fCAxMDkNCj4gPj4gKysrKysrKysrKysrKysrKysrDQo+ID4+PiAgMSBmaWxlIGNoYW5nZWQsIDEw
OSBpbnNlcnRpb25zKCspDQo+ID4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4+PiBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvY2RucyxtaGRwODUwMS55
YW1sDQo+ID4+Pg0KPiA+Pj4gZGlmZiAtLWdpdA0KPiA+Pj4NCj4gYS9Eb2N1bWVudGF0aW9uL2Rl
dmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9icmlkZ2UvY2RucyxtaGRwODUwMS55YW0NCj4gPj4+
IGwNCj4gPj4+DQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkv
YnJpZGdlL2NkbnMsbWhkcDg1MDEueWFtDQo+ID4+PiBsDQo+ID4+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NA0KPiA+Pj4gaW5kZXggMDAwMDAwMDAwMDAwMC4uM2Y3OWYzMjhjNzQyNQ0KPiA+Pj4gLS0t
IC9kZXYvbnVsbA0KPiA+Pj4gKysrDQo+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvYnJpZGdlL2NkbnMsbWhkcDg1MDENCj4gPj4+ICsrKyAueQ0KPiA+Pj4gKysr
IGFtbA0KPiA+Pg0KPiA+Pj4gQEAgLTAsMCArMSwxMDkgQEANCj4gPj4+ICsjIFNQRFgtTGljZW5z
ZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+Pj4g
Ky0tLQ0KPiA+Pj4gKyRpZDoNCj4gPj4+DQo+ICtodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90
ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cCUzQSUyRiUyRmRlDQo+ID4+Pg0KPiArdmklMkYm
ZGF0YT0wNSU3QzAyJTdDc2FuZG9yLnl1JTQwbnhwLmNvbSU3QzNjNmJmZTA3YzIzOTQ1YTEwNTIN
Cj4gNjA4ZGMNCj4gPj4+DQo+ICtlMTNmZmRlNyU3QzY4NmVhMWQzYmMyYjRjNmZhOTJjZDk5YzVj
MzAxNjM1JTdDMCU3QzAlN0M2Mzg2MzI5DQo+IDEyMTkxOA0KPiA+Pj4NCj4gKzY1MTM5JTdDVW5r
bm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMg0KPiBsdU16
SWlMDQo+ID4+Pg0KPiArQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MwJTdDJTdDJTdD
JnNkYXRhPXlyRyUyRkpzR0s1DQo+IGN6RGVSd2YNCj4gPj4+ICtBOGU2JTJGNXIwVWk1djk1dWlD
NE9sSzdESjVRWSUzRCZyZXNlcnZlZD0wDQo+ID4+Pg0KPiA+Pg0KPiArY2V0cmVlLm9yZyUyRnNj
aGVtYXMlMkZkaXNwbGF5JTJGYnJpZGdlJTJGY2RucyUyQ21oZHA4NTAxLnlhbWwlDQo+IDINCj4g
Pj4gMyZkYXQNCj4gPj4+DQo+ID4+DQo+ICthPTA1JTdDMDIlN0NTYW5kb3IueXUlNDBueHAuY29t
JTdDNDBhNmJkNGZmMWNkNGQ5MzRkYTAwOGRjZGM3Mg0KPiA+PiA5ZmQwJTdDDQo+ID4+Pg0KPiA+
Pg0KPiArNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzODYyNzYz
MjA3OTk4NjYwDQo+ID4+IDglN0NVbmtubw0KPiA+Pj4NCj4gPj4NCj4gK3duJTdDVFdGcGJHWnNi
M2Q4ZXlKV0lqb2lNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazENCj4gaA0K
PiA+PiBhV3dpDQo+ID4+Pg0KPiA+Pg0KPiArTENKWFZDSTZNbjAlM0QlN0MwJTdDJTdDJTdDJnNk
YXRhPVV3JTJGUVEwUWczNlk4UTZ3RlBDN1oNCj4gZw0KPiA+PiBMekxIdk9qOEdqSDENCj4gPj4+
ICtrOE1jZ2NqcnFJJTNEJnJlc2VydmVkPTANCj4gPj4+ICskc2NoZW1hOg0KPiA+Pj4NCj4gK2h0
dHBzOi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNB
JTJGJTJGZGUNCj4gPj4+DQo+ICt2aSUyRiZkYXRhPTA1JTdDMDIlN0NzYW5kb3IueXUlNDBueHAu
Y29tJTdDM2M2YmZlMDdjMjM5NDVhMTA1Mg0KPiA2MDhkYw0KPiA+Pj4NCj4gK2UxM2ZmZGU3JTdD
Njg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdDMCU3QzYzODYzMjkNCj4gMTIx
OTE4DQo+ID4+Pg0KPiArOTU2MzAlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lNQzR3
TGpBd01EQWlMQ0pRSWpvaVYyDQo+IGx1TXpJaUwNCj4gPj4+DQo+ICtDSkJUaUk2SWsxaGFXd2lM
Q0pYVkNJNk1uMCUzRCU3QzAlN0MlN0MlN0Mmc2RhdGE9JTJCS2NjVk14DQo+IG5mNW9Vd1pnZg0K
PiA+Pj4gK3NtUFhpS04yVnljbkxDZERLeDZGWkZCQkFKTSUzRCZyZXNlcnZlZD0wDQo+ID4+Pg0K
PiA+Pg0KPiArY2V0cmVlLm9yZyUyRm1ldGEtc2NoZW1hcyUyRmNvcmUueWFtbCUyMyZkYXRhPTA1
JTdDMDIlN0NTYW5kb3IuDQo+IHkNCj4gPj4gdSU0MG4NCj4gPj4+DQo+ID4+DQo+ICt4cC5jb20l
N0M0MGE2YmQ0ZmYxY2Q0ZDkzNGRhMDA4ZGNkYzcyOWZkMCU3QzY4NmVhMWQzYmMyYjRjNmZhOQ0K
PiAyDQo+ID4+IGNkOTljNQ0KPiA+Pj4NCj4gPj4NCj4gK2MzMDE2MzUlN0MwJTdDMCU3QzYzODYy
NzYzMjA4MDAzMTEyNCU3Q1Vua25vd24lN0NUV0ZwYkdacw0KPiA+PiBiM2Q4ZXlKV0lqb2kNCj4g
Pj4+DQo+ID4+DQo+ICtNQzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3
aUxDSlhWQ0k2TW4wJTNEJTdDMA0KPiAlDQo+ID4+IDdDJTdDJQ0KPiA+Pj4NCj4gPj4NCj4gKzdD
JnNkYXRhPUlHOUVtM0FXT3d6bHBSMVdrMFZ3JTJGRjE2MVljT3h1TUhiQTRZJTJGemZ0Z1lBJTMN
Cj4gRA0KPiA+PiAmcmVzZXJ2ZWQ9DQo+ID4+PiArMA0KPiA+Pj4gKw0KPiA+Pj4gK3RpdGxlOiBD
YWRlbmNlIE1IRFA4NTAxIERQL0hETUkgYnJpZGdlDQo+ID4+PiArDQo+ID4+PiArbWFpbnRhaW5l
cnM6DQo+ID4+PiArICAtIFNhbmRvciBZdSA8U2FuZG9yLnl1QG54cC5jb20+DQo+ID4+PiArDQo+
ID4+PiArZGVzY3JpcHRpb246DQo+ID4+PiArICBDYWRlbmNlIE1IRFA4NTAxIERpc3BsYXlQb3J0
L0hETUkgaW50ZXJmYWNlLg0KPiA+Pj4gKw0KPiA+Pj4gK3Byb3BlcnRpZXM6DQo+ID4+PiArICBj
b21wYXRpYmxlOg0KPiA+Pj4gKyAgICBlbnVtOg0KPiA+Pj4gKyAgICAgIC0gZnNsLGlteDhtcS1t
aGRwODUwMQ0KPiA+Pj4gKw0KPiA+Pj4gKyAgcmVnOg0KPiA+Pj4gKyAgICBtYXhJdGVtczogMQ0K
PiA+Pj4gKw0KPiA+Pj4gKyAgY2xvY2tzOg0KPiA+Pj4gKyAgICBtYXhJdGVtczogMQ0KPiA+Pj4g
KyAgICBkZXNjcmlwdGlvbjogTUhEUDg1MDEgRFAvSERNSSBBUEIgY2xvY2suDQo+ID4+PiArDQo+
ID4+PiArICBwaHlzOg0KPiA+Pj4gKyAgICBtYXhJdGVtczogMQ0KPiA+Pj4gKyAgICBkZXNjcmlw
dGlvbjoNCj4gPj4+ICsgICAgICBwaGFuZGxlIHRvIHRoZSBEUC9IRE1JIFBIWQ0KPiA+Pj4gKw0K
PiA+Pj4gKyAgaW50ZXJydXB0czoNCj4gPj4+ICsgICAgaXRlbXM6DQo+ID4+PiArICAgICAgLSBk
ZXNjcmlwdGlvbjogSG90cGx1ZyBjYWJsZSBwbHVnaW4uDQo+ID4+PiArICAgICAgLSBkZXNjcmlw
dGlvbjogSG90cGx1ZyBjYWJsZSBwbHVnb3V0Lg0KPiA+Pj4gKw0KPiA+Pj4gKyAgaW50ZXJydXB0
LW5hbWVzOg0KPiA+Pj4gKyAgICBpdGVtczoNCj4gPj4+ICsgICAgICAtIGNvbnN0OiBwbHVnX2lu
DQo+ID4+PiArICAgICAgLSBjb25zdDogcGx1Z19vdXQNCj4gPj4+ICsNCj4gPj4+ICsgIGxhbmUt
bWFwcGluZzoNCj4gPj4+ICsgICAgZGVzY3JpcHRpb246IGxhbmUgbWFwcGluZyBmb3IgSERNSSBv
ciBEaXNwbGF5UG9ydCBpbnRlcmZhY2UuDQo+ID4+DQo+ID4+IFdoZXJlIGlzIHRoZSBkZWZpbml0
aW9uIG9mIHRoaXMgcHJvcGVydHk/IEkgZG8gbm90IHNlZSBhbnkgJHJlZiBoZXJlLA0KPiA+PiBz
byBkaWQgeW91IGFkZCBpdCB0byBkdHNjaGVtYT8NCj4gPg0KPiA+IE15IGFwb2xvZ2llcywgdGhl
ICRyZWYgaXMgbWlzc2luZywgd2lsbCBhZGQgaXQgaW4gdGhlIG5leHQgdmVyc2lvbi4uDQo+IA0K
PiBBbmQgdGhhdCdzIGRpZmZlcmVudCB0aGFuIGV4aXN0aW5nIHByb3BlcnRpZXMsIGUuZy4gZGF0
YS1sYW5lcyBvciBsYW5lLXBvbGFyaXRpZXM/DQo+IFRoZXJlIGlzIG5vIGRlc2NyaXB0aW9uIGhl
cmUgZXhjZXB0IGNvcHlpbmcgcHJvcGVydHkgbmFtZSwgd2hpY2ggaXMgbm90DQo+IHVzZWZ1bCBh
dCBhbGwuDQo+IA0KPiBDb21lIHdpdGggc29sdXRpb24gbWF0Y2hpbmcgb3RoZXIgYnJpZGdlcyBh
bmQgbWVkaWEgZGV2aWNlcy4NCg0KVGhlIGRhdGEtbGFuZXMgcHJvcGVydHkgaW4gbWVkaWEvdmlk
ZW8taW50ZXJmYWNlcy55YW1sIHN1cHBvcnRzIGxhbmUgcmVvcmRlcmluZywgDQp3aGljaCBpcyB3
aGF0IEkgZXhwZWN0ZWQuIEknbGwgdXNlIGRhdGEtbGFuZXMgdG8gcmVwbGFjZSBsYW5lLW1hcHBp
bmcgaW4gdGhlIG5leHQgdmVyc2lvbi4NCg0KVGhhbmtzDQpTYW5kb3INCg0KPiANCj4gQmVzdCBy
ZWdhcmRzLA0KPiBLcnp5c3p0b2YNCg0K
