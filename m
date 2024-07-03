Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B45DD926523
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 17:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1954B10E998;
	Wed,  3 Jul 2024 15:43:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="YT0uExhJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2072.outbound.protection.outlook.com [40.107.21.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A29510E998
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jul 2024 15:43:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cQxd0tNkp2OE0ot4owSPGYgRQl49mdj+moTCziHEb3c2mw+KXrfL7023QEvpeiaf5vNyvWaIxRCgj9OKs6gtQVVKhVZFz9EFBQjc19FWb7CZthaCkpatRrtl5d1DwIl/F63FVH/FYU6Csr9vqw8p7CKx3oyYh3ORFIzbTrjIi0KlYm0bPnZi//L6FHYnHeajHiA6bNtUqwYYiSHvlZfKc/bZ6VgZwESk3hjm5c230dVxCFwSRoRYWcwXVT6rX9do78rszPBXCmDOH6KdjBAk6X0U3Ll/cw9ohy241YtN9fTqQXctpTIXUtO6ab5Bn81xNl/XXZ9Ay0DynOBlIYqJ/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=saChtbHvqWbwZFzOisJjSZ/MQ6Cpkn0NQjBpYI5DG6c=;
 b=SBQwoJQMuEu8VkjMi0oAWOLxaxfFOQj36zd3VOki63rtPuKKMaouS22o7JN67Xh+8oGQGLLIMAgu3LA/kupoh8EiQS55h3rUf3DLOkftc4PPc5OlpJs/y3qdKAuvU29jjiI/XvvF2933AAIg+4Hf8+s1NEUJqXOa4onO7AKL1X9ZqoS7AhQBhABdYTcPOvyG1Ft6Ezpni0pnSB/ff7i4JfRxd5MYZ5lLA9MmtwnoMiJgZaQzLAG6ZNwojOD/+yuATLikpk/cRE8UMCXPK73FnKPdH3D+4rVybOrsws+M5jU/3P2x1dt1dglEBTUVwbESXjngTWHjWMzQx57dtmVshw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=saChtbHvqWbwZFzOisJjSZ/MQ6Cpkn0NQjBpYI5DG6c=;
 b=YT0uExhJsMA120TocJojhdGM7AFHBxSZmWhLn7CEP9cZ7mavSkQIvhavmT23rt9foEOMRurOZUt1AcLLC+rsnMCSptLXhI3M0Gkaz1VlWIDhhtLkiYANp0/YET054zCqXTiQh068Xm01Bclx6UMl7g9yJi2bXznr/3M2Jp1dJ/E=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PA2PR04MB10374.eurprd04.prod.outlook.com (2603:10a6:102:41e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Wed, 3 Jul
 2024 15:43:39 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.7741.017; Wed, 3 Jul 2024
 15:43:39 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Maxime Ripard <mripard@kernel.org>
CC: Alexander Stein <alexander.stein@ew.tq-group.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert
 Foss <rfoss@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel
 Vetter <daniel@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux@ew.tq-group.com"
 <linux@ew.tq-group.com>
Subject: Re: [PATCH v15 4/8] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Thread-Topic: [PATCH v15 4/8] drm: bridge: Cadence: Add MHDP8501 DP/HDMI driver
Thread-Index: AQHazV/GwC5/t/Izo0OUSiONPZsfPQ==
Date: Wed, 3 Jul 2024 15:43:39 +0000
Message-ID: <PAXPR04MB944842A62DC21FC3F2530AF9F4DD2@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <20240306101625.795732-1-alexander.stein@ew.tq-group.com>
 <20240306101625.795732-5-alexander.stein@ew.tq-group.com>
 <20240306-mysterious-hoatzin-of-faith-49aec0@houat>
 <PAXPR04MB9448829F4BA8F8AF18F371F3F4DC2@PAXPR04MB9448.eurprd04.prod.outlook.com>
 <20240702-seahorse-of-unreal-brotherhood-dce5d0@houat>
In-Reply-To: <20240702-seahorse-of-unreal-brotherhood-dce5d0@houat>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|PA2PR04MB10374:EE_
x-ms-office365-filtering-correlation-id: 11a439c1-c9de-4d3c-3910-08dc9b76e8df
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?gb2312?B?YWZwemJIRHNoNkEweGwxalVXYWt1SmZmZDYzV0k1Q01rYjdzTnVBMVB5SWE1?=
 =?gb2312?B?ZSt5S2hvS25MOFBRYW9rOE1TUk1rN1lRWHZrdXI4ZUF2NUkrajBmeWVPVjdE?=
 =?gb2312?B?MFFUYURLVnN3ZFZJSUVRdyt5ZTloSFJoMXZQMWgvK2JwTDJ2bXZSUjNZc09L?=
 =?gb2312?B?YUF6eDZXd0Z0NEJFTW8reUN0MXpINTN6YnRzeG1iTmdGZWVNUytwSTZNbVJy?=
 =?gb2312?B?dHVSZnF0c1FvSHU2TVRwUXVqOVFqL1FreHdRWklIY2EvTVlkQldyMGdzZjds?=
 =?gb2312?B?RUlrZTRUMmh5a3ZyTStYczk4c09aTzc3SXprUWdSYllmUGJyNlRYWGIrR3h1?=
 =?gb2312?B?cm9KSVJLYmhoNm13UllHdnNnMWxLK0hlOW9uNWJVUUdKam1LVWczK09iYnpq?=
 =?gb2312?B?eDgya2FRajIzeTdONkJoVjhKVEF6ekU3eGdPUmVZYmhaUGU2a2JxZngzL2g5?=
 =?gb2312?B?ZXNWYTIzOGl6STVkZnE4YUY2K2x6dFFlMDZjNDZSOCtEVEhZV0lLWWdNZGdo?=
 =?gb2312?B?aVlUVG5SSjZObDI5RWREZXpOQTNzUnduVVZQVHk0WHhiZXVZbVE3QS81TVQ4?=
 =?gb2312?B?c25wd2ovMm0vR2U4RkJuU0lPTm9MK0kyUEcvc2xQRDFCbFNYMVdEeEl3S1pL?=
 =?gb2312?B?YVFHRGI5R1ZHVXp2QXVtRFFNZDFLNTlvQ0Q2VlAyVEFidWJGaUVKb2lCMzBh?=
 =?gb2312?B?QUh6ZlB0OG41eTNmNlE4c0NxdSt3bDNTQUpZcTZxa2kyUWNraDVicDh4Y20z?=
 =?gb2312?B?NkY1MWltUWxjbUdtMmIrcUU0QUs4d3QraENmbGdlcndnYm1XeVdNZkJpalpD?=
 =?gb2312?B?TnBFUCtOVXJiYVlrVGx2UU1GVWwrUlQ3ZXRjQ1lzZUU0TkF2L3c1UlFBSGsv?=
 =?gb2312?B?eHIzMk1mTWc1cC9CRzU5azhxTFFudTZCajV3WWpNeHQwaVdlaytPMnB3RS9X?=
 =?gb2312?B?c1U3dkRDS1JYaW1GcURpM29wcDJzTHZjeDJiRUdBT1ZhTEJJcDZZUmFlRHdC?=
 =?gb2312?B?RFlTRTZKaHdqRjR2SkRnYzUyNXU0ZUsrdVAxTW16aFdPQzZ2NlNCR3pqd2tu?=
 =?gb2312?B?eXI5amdQSzU5T3RMVG1JRG44MVN2TXdlQWhSc2Q2bGdCT2pyTTJVNEJ6amtB?=
 =?gb2312?B?UGRMbFhCbm52eUtwbXJXT1ppTmFxdzIwa2xES29MSytyNy9hdDM0Qzl2VDJp?=
 =?gb2312?B?YTNZZU5ONU0wUnlRbkJmSWRzZ2dDR0RJbFBlbWhUa3ZqYW54OTdSL0Fpb2JD?=
 =?gb2312?B?bzFYRG81RHY5REFpTzA0M3ZrRXhkTXVuSEdBUFVaTHBLMzdmSDNKTDl1cjNn?=
 =?gb2312?B?Mzl6UzRaTkJHdS93WVlXNnNPWkVCUUlHYTBVeXE4ZmZ6V1lWblFQSkVrc29R?=
 =?gb2312?B?NmxHNnYvU2F3bndZUTlkU01iV0ExZHpCQVBOdnlaM2w3eTJHaHhDTG91YW9L?=
 =?gb2312?B?UlRCSnJITzUwUEhzRlVCSkg3UVNhdG9EMllCNWpyUk9xSG1BT1JXZVRPdStV?=
 =?gb2312?B?T0w2emRnY1Y2UWpJSm1QZGxXMDVpYmsrRElVWUlYTEtxVWpYazl2Szk0dkxs?=
 =?gb2312?B?K2Y4R1FjaktmUmthV1dSbmgxUGhNdENkdW44bzFNWnRUOVpzdk9YQzlBdGpx?=
 =?gb2312?B?anQ0blJaS2psSVZKSjB1aTRURUtyMktlRmpuQkJOM1FYaUN2VzBIUTRxNWJS?=
 =?gb2312?B?REhUaVRXbm9HbnUzdUlYeUcwR2ZRRkZUalZmNFNsdlViQmJiN2ZqRnZEQ0FI?=
 =?gb2312?B?ZitOMXc1UEYzS3dxdnU0ZFV1dmwzMFZFcng3UmFNNFE4NjN2enBpY1pGT1FP?=
 =?gb2312?B?UU9Gb1hRR3kwQTNSNjZjNGNKbTB2NDN3M2hiWUNjQlVnUEVVOVdJS1NNRlpx?=
 =?gb2312?B?R0d3Y3lHTW0vVVpRanBoT2JKUE9VR3FsTERoMHM5UVNNTHc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:zh-cn; SCL:1;
 SRV:; IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:;
 CAT:NONE; SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?bWV1emh2b2plL2xtMWNQNGlFL21GVlY3QlJZMnBGbHcyd3ZUWDhGNmIzMlpu?=
 =?gb2312?B?WG5jKzRBT0xyUUQyL0RqWEpKQTQ5dmVGZURaYzQyZWJvVWVjbkd5U21pSW9j?=
 =?gb2312?B?Y3owbjhITmhxMk5MTzd3VWswaW9sNHJ6R2QwTHdKcHNndmE5U2ZtNVAyNVdI?=
 =?gb2312?B?VjlXOExHNUloOEhpbkdzYkRGSUlnTEIzVXFTbnd5Q2hSRFhPMW1QN3dyTjU5?=
 =?gb2312?B?eVMzNDE4V05BZmtEdi9LR0VjeUNoVGowZkVNUXp0OHdtZ1ZiVnZnRk9TZzhO?=
 =?gb2312?B?bzNXZERoR0VRYjdQUkhwQ0ZnQWdUaDhFRDFRbkhiYWxicjB4Yk5SOE5kYnps?=
 =?gb2312?B?V2xFUVIyNHVjb3VCMTJmSFd1TS9zU1ZJcVFLeUM3cnk0VDdWNDJ5a2pFM3M3?=
 =?gb2312?B?R1lDYk9PeUlXd29vUnRkMysrdzVoWkdMZU11RndlL0hqN210YUUrT2oxU3hw?=
 =?gb2312?B?VXRURmd2QXRJTVdqZFlGdDhudXJpK0NhOGZPWFErS2dMMUllR1ZGWGlOVExR?=
 =?gb2312?B?cWpTSVVHc3ZQTUt3RDZyZFZjQ3l1N2FLUSt3VWhrRHFSNGVoc2xNY3AwR3Iz?=
 =?gb2312?B?YXVvNnBhOVZLT0VnQVBqSk1EUW42eUVWdGNqcWFCb2NvNzZzZmdkQWpZOU5k?=
 =?gb2312?B?VjU1dys4eENLOFFTai9zaWZLV21PRFdWQmU5ZVFrdjdSR21OdWxsMUFzcE9m?=
 =?gb2312?B?eDFQMy9STW5kb1VsT1ZwV3JBVGJqZFlsWE1waHZWRVQvKzVRSS9xam9PZnp6?=
 =?gb2312?B?N0FIeUVLYTVhRWlNaExTc09hbkp3Ynk1b1lpb3FRUXVTWUs3Qnh0QnlLT1or?=
 =?gb2312?B?bnhrSERudUZMRGtZV3RyUXQ5MmFWdUxEZUltVE9nWG4wNHBpa2o0MmJ3VjQ3?=
 =?gb2312?B?bXpuRURsZFBtUmJZbEcwdWhIMHhJdzB6NUJ3RDVwYXFBTU1JeWpWMkRrdmpu?=
 =?gb2312?B?ZTdUZjQ5ZnF2TTJjZk1NbkZNWkJlUkYweVQ0ZU9YTkhMTjArR3cwa21odXJW?=
 =?gb2312?B?TW41cUtRd2dDSmZHb3Z5Q3YvOHIzTUo1RUJDTTRPdE1VVGw2TVNjdWU4RGtM?=
 =?gb2312?B?eXZDWTZqUkNsazlpd2IxTU1UMzN5RkNVL21IUE9EVFJWbjJMRldkY2x5WU1l?=
 =?gb2312?B?UlBrY29MZ05OUmxCMU04Ty9zcUhzYUFINEZBMHNKQ2RFakE1aHNWeU9aYmRj?=
 =?gb2312?B?Y2RpZ3Q4NVhzbWxOTzVXN2p0YkdEN3IwWEZjb0FKU0xjMjQrMzhDN1NjbENZ?=
 =?gb2312?B?emdaT24wT0g4Y3p3bmJvZU9Sa3RKR3VGekRuTGQ1QVIwdm1qTU5OY2VOS1Ez?=
 =?gb2312?B?Z2lHQTd4SExlL3JFRVRXdVBTZ1liU3FBR1NQN0RveG5yQ1Q0RzdnNGJha3VB?=
 =?gb2312?B?Wm9RQkg0SmZ2NUs4ZFhsT1YwVlA0ZXNDWnJmOVkwT1cxU1h1WnFWZG1qOVNG?=
 =?gb2312?B?L0htYUtKWkkrUzRHTkVzMkV2NUpWeTFxMExxMzZ2UnB2UkpvZjE5SzhTS0dW?=
 =?gb2312?B?WHVWZDJJa1RXZDYvUkVoNzhSOG5GRTdNS0FYSnhQY2tURzRDK0VsV1FjblRq?=
 =?gb2312?B?TEl2QzIwWis3cmhBYWRPZ1l4b1FERm5LdURKTDQ2d2x3Z0ZPUk0zWmlKWnhv?=
 =?gb2312?B?Uml6a2NMT3F0bUp3aVh4YmhhRmRLdnZKamlJSE9YTG0wbis1T1ZqTDdYbmh0?=
 =?gb2312?B?cEEvbkZ3STBJRk0xV1JTdy9GeUwvVFlnc01IelFZamNSUjdJNHdtSURmcWNZ?=
 =?gb2312?B?VXJaeDAxTGcweCsraHozL0VTWWpvSW1qYmJSQjN0RXVHQ1VhbFJZbXZNSmJX?=
 =?gb2312?B?K3orQWVFSGh0emdPZFVZSGJyZEJ4VnhiYndEc0RlYlRhRmQ4Sk9hQTR1ZUkw?=
 =?gb2312?B?ZitCQ0N3cXZWWWkyNVlmRC96eTVCZC9OS2QveXo5dEg4WUx0dlBVQXVOMHQw?=
 =?gb2312?B?dGlTSTVnQmlaaVFKaERXMWRFUEFTd0QxSFNDVDFnRkhVUWMrTUlIQmFlclVQ?=
 =?gb2312?B?WGQ4aWlCYWlweWYvY000MTViSTBFUjBJQTVNM3JmSGhoSkxwdDFBOWtVZFVQ?=
 =?gb2312?B?Y3lRT3dlUVBEY3NwV2FVWUYwSVVkRTM0R2R6dTFqc3pVdWNPbStXYWFVZU83?=
 =?gb2312?Q?+KA0=3D?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a439c1-c9de-4d3c-3910-08dc9b76e8df
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2024 15:43:39.4622 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s3hiSWLG3RAdYKYvXinkABHP/mPQ1/KCoHLZqwlowXAeV4n1KZdrZgb9eT9Yhl3nsXQvetMCN/tOUks1WIcO7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10374
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

SGkgTWF4aW1lLA0KDQpUaGFua3MgZm9yIHlvdXIgZGV0YWlsIGV4cGxhaW4sIGl0IGlzIG1ha2Ug
c2Vuc2UgdG8gcmVzZXQgdGhlIEhETUkgbGluay4NCkkgd2lsbCBpbXBsZW1lbnQgaXQgbGF0ZXIu
DQoNCkIuUg0KU2FuZG9yDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTog
TWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPg0KPiBTZW50OiAyMDI0xOo31MIyyNUg
MjA6NDANCj4gVG86IFNhbmRvciBZdSA8c2FuZG9yLnl1QG54cC5jb20+DQo+IENjOiBBbGV4YW5k
ZXIgU3RlaW4gPGFsZXhhbmRlci5zdGVpbkBldy50cS1ncm91cC5jb20+OyBBbmRyemVqIEhhamRh
DQo+IDxhbmRyemVqLmhhamRhQGludGVsLmNvbT47IE5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0
cm9uZ0BsaW5hcm8ub3JnPjsNCj4gUm9iZXJ0IEZvc3MgPHJmb3NzQGtlcm5lbC5vcmc+OyBMYXVy
ZW50IFBpbmNoYXJ0DQo+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+OyBKb25h
cyBLYXJsbWFuIDxqb25hc0Brd2lib28uc2U+Ow0KPiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNr
cmFiZWNAZ21haWwuY29tPjsgRGF2aWQgQWlybGllDQo+IDxhaXJsaWVkQGdtYWlsLmNvbT47IERh
bmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD47IE1hYXJ0ZW4gTGFua2hvcnN0DQo+IDxtYWFy
dGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+OyBUaG9tYXMgWmltbWVybWFubg0KPiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT47IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+OyBLcnp5c3p0
b2YNCj4gS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBDb25v
ciBEb29sZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBWaW5vZCBLb3VsIDx2a291bEBrZXJu
ZWwub3JnPjsgS2lzaG9uIFZpamF5DQo+IEFicmFoYW0gSSA8a2lzaG9uQGtlcm5lbC5vcmc+OyBT
aGF3biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBTYXNjaGENCj4gSGF1ZXIgPHMuaGF1ZXJA
cGVuZ3V0cm9uaXguZGU+OyBQZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1
dHJvbml4LmRlPjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsNCj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXBoeUBsaXN0cy5pbmZyYWRlYWQu
b3JnOw0KPiBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJh
ZGVhZC5vcmc7DQo+IGxpbnV4QGV3LnRxLWdyb3VwLmNvbQ0KPiBTdWJqZWN0OiBbRVhUXSBSZTog
W1BBVENIIHYxNSA0LzhdIGRybTogYnJpZGdlOiBDYWRlbmNlOiBBZGQgTUhEUDg1MDENCj4gRFAv
SERNSSBkcml2ZXINCj4gDQo+IEhpLA0KPiANCj4gT24gVHVlLCBKdWwgMDIsIDIwMjQgYXQgMTI6
MTM6MTZQTSBHTVQsIFNhbmRvciBZdSB3cm90ZToNCj4gPiA+IFN1YmplY3Q6IFtFWFRdIFJlOiBb
UEFUQ0ggdjE1IDQvOF0gZHJtOiBicmlkZ2U6IENhZGVuY2U6IEFkZA0KPiA+ID4gTUhEUDg1MDEg
RFAvSERNSSBkcml2ZXINCj4gPiA+DQo+ID4gPiBIaSwNCj4gPiA+DQo+ID4gPiBPbiBXZWQsIE1h
ciAwNiwgMjAyNCBhdCAxMToxNjoyMUFNICswMTAwLCBBbGV4YW5kZXIgU3RlaW4gd3JvdGU6DQo+
ID4gPiA+ICtzdGF0aWMgaW50IGNkbnNfbWhkcDg1MDFfcmVhZF9ocGQoc3RydWN0IGNkbnNfbWhk
cDg1MDFfZGV2aWNlDQo+ID4gPiAqbWhkcCkNCj4gPiA+ID4gK3sNCj4gPiA+ID4gKwl1OCBzdGF0
dXM7DQo+ID4gPiA+ICsJaW50IHJldDsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCW11dGV4X2xvY2so
Jm1oZHAtPm1ib3hfbXV0ZXgpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcmV0ID0gY2Ruc19taGRw
X21haWxib3hfc2VuZCgmbWhkcC0+YmFzZSwNCj4gPiA+IE1CX01PRFVMRV9JRF9HRU5FUkFMLA0K
PiA+ID4gPiArCQkJCSAgICAgR0VORVJBTF9HRVRfSFBEX1NUQVRFLCAwLCBOVUxMKTsNCj4gPiA+
ID4gKwlpZiAocmV0KQ0KPiA+ID4gPiArCQlnb3RvIGVycl9nZXRfaHBkOw0KPiA+ID4gPiArDQo+
ID4gPiA+ICsJcmV0ID0gY2Ruc19taGRwX21haWxib3hfcmVjdl9oZWFkZXIoJm1oZHAtPmJhc2Us
DQo+ID4gPiBNQl9NT0RVTEVfSURfR0VORVJBTCwNCj4gPiA+ID4gKwkJCQkJICAgIEdFTkVSQUxf
R0VUX0hQRF9TVEFURSwNCj4gPiA+ID4gKwkJCQkJICAgIHNpemVvZihzdGF0dXMpKTsNCj4gPiA+
ID4gKwlpZiAocmV0KQ0KPiA+ID4gPiArCQlnb3RvIGVycl9nZXRfaHBkOw0KPiA+ID4gPiArDQo+
ID4gPiA+ICsJcmV0ID0gY2Ruc19taGRwX21haWxib3hfcmVjdl9kYXRhKCZtaGRwLT5iYXNlLCAm
c3RhdHVzLA0KPiA+ID4gc2l6ZW9mKHN0YXR1cykpOw0KPiA+ID4gPiArCWlmIChyZXQpDQo+ID4g
PiA+ICsJCWdvdG8gZXJyX2dldF9ocGQ7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwltdXRleF91bmxv
Y2soJm1oZHAtPm1ib3hfbXV0ZXgpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcmV0dXJuIHN0YXR1
czsNCj4gPiA+ID4gKw0KPiA+ID4gPiArZXJyX2dldF9ocGQ6DQo+ID4gPiA+ICsJZGV2X2Vyciht
aGRwLT5kZXYsICJyZWFkIGhwZCAgZmFpbGVkOiAlZFxuIiwgcmV0KTsNCj4gPiA+ID4gKwltdXRl
eF91bmxvY2soJm1oZHAtPm1ib3hfbXV0ZXgpOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJcmV0dXJu
IHJldDsNCj4gPiA+ID4gK30NCj4gPiA+ID4gKw0KPiA+ID4gPiArZW51bSBkcm1fY29ubmVjdG9y
X3N0YXR1cyBjZG5zX21oZHA4NTAxX2RldGVjdChzdHJ1Y3QNCj4gPiA+ID4gK2NkbnNfbWhkcDg1
MDFfZGV2aWNlICptaGRwKSB7DQo+ID4gPiA+ICsJdTggaHBkID0gMHhmOw0KPiA+ID4gPiArDQo+
ID4gPiA+ICsJaHBkID0gY2Ruc19taGRwODUwMV9yZWFkX2hwZChtaGRwKTsNCj4gPiA+ID4gKwlp
ZiAoaHBkID09IDEpDQo+ID4gPiA+ICsJCXJldHVybiBjb25uZWN0b3Jfc3RhdHVzX2Nvbm5lY3Rl
ZDsNCj4gPiA+ID4gKwllbHNlIGlmIChocGQgPT0gMCkNCj4gPiA+ID4gKwkJcmV0dXJuIGNvbm5l
Y3Rvcl9zdGF0dXNfZGlzY29ubmVjdGVkOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJZGV2X3dhcm4o
bWhkcC0+ZGV2LCAiVW5rbm93biBjYWJsZSBzdGF0dXMsIGhkcD0ldVxuIiwgaHBkKTsNCj4gPiA+
ID4gKwlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c191bmtub3duOyB9DQo+ID4gPiA+ICsNCj4gPiA+
ID4gK3N0YXRpYyB2b2lkIGhvdHBsdWdfd29ya19mdW5jKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29y
aykgew0KPiA+ID4gPiArCXN0cnVjdCBjZG5zX21oZHA4NTAxX2RldmljZSAqbWhkcCA9IGNvbnRh
aW5lcl9vZih3b3JrLA0KPiA+ID4gPiArCQkJCQkJICAgICBzdHJ1Y3QgY2Ruc19taGRwODUwMV9k
ZXZpY2UsDQo+ID4gPiA+ICsJCQkJCQkgICAgIGhvdHBsdWdfd29yay53b3JrKTsNCj4gPiA+ID4g
KwllbnVtIGRybV9jb25uZWN0b3Jfc3RhdHVzIHN0YXR1cyA9DQo+IGNkbnNfbWhkcDg1MDFfZGV0
ZWN0KG1oZHApOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJZHJtX2JyaWRnZV9ocGRfbm90aWZ5KCZt
aGRwLT5icmlkZ2UsIHN0YXR1cyk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwlpZiAoc3RhdHVzID09
IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkKSB7DQo+ID4gPiA+ICsJCS8qIENhYmxlIGNvbm5l
Y3RlZCAgKi8NCj4gPiA+ID4gKwkJRFJNX0lORk8oIkhETUkvRFAgQ2FibGUgUGx1ZyBJblxuIik7
DQo+ID4gPiA+ICsJCWVuYWJsZV9pcnEobWhkcC0+aXJxW0lSUV9PVVRdKTsNCj4gPiA+ID4gKwl9
IGVsc2UgaWYgKHN0YXR1cyA9PSBjb25uZWN0b3Jfc3RhdHVzX2Rpc2Nvbm5lY3RlZCkgew0KPiA+
ID4gPiArCQkvKiBDYWJsZSBEaXNjb25uZWN0ZWQgICovDQo+ID4gPiA+ICsJCURSTV9JTkZPKCJI
RE1JL0RQIENhYmxlIFBsdWcgT3V0XG4iKTsNCj4gPiA+ID4gKwkJZW5hYmxlX2lycShtaGRwLT5p
cnFbSVJRX0lOXSk7DQo+ID4gPiA+ICsJfQ0KPiA+ID4gPiArfQ0KPiA+ID4gPiArDQo+ID4gPiA+
ICtzdGF0aWMgaXJxcmV0dXJuX3QgY2Ruc19taGRwODUwMV9pcnFfdGhyZWFkKGludCBpcnEsIHZv
aWQgKmRhdGEpIHsNCj4gPiA+ID4gKwlzdHJ1Y3QgY2Ruc19taGRwODUwMV9kZXZpY2UgKm1oZHAg
PSBkYXRhOw0KPiA+ID4gPiArDQo+ID4gPiA+ICsJZGlzYWJsZV9pcnFfbm9zeW5jKGlycSk7DQo+
ID4gPiA+ICsNCj4gPiA+ID4gKwltb2RfZGVsYXllZF93b3JrKHN5c3RlbV93cSwgJm1oZHAtPmhv
dHBsdWdfd29yaywNCj4gPiA+ID4gKwkJCSBtc2Vjc190b19qaWZmaWVzKEhPVFBMVUdfREVCT1VO
Q0VfTVMpKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArCXJldHVybiBJUlFfSEFORExFRDsNCj4gPiA+
ID4gK30NCj4gPiA+DQo+ID4gPiBBRkFJQ1QgZnJvbSB0aGUgcmVzdCBvZiB0aGUgZHJpdmVyLCB5
b3Ugc3VwcG9ydCBIRE1JIG1vZGVzIHdpdGggYQ0KPiA+ID4gY2hhcmFjdGVyIHJhdGUgPiAzNDBN
Y2hhci9zLCBhbmQgdGh1cyB5b3UgbmVlZCB0byBlbmFibGUgdGhlIHNjcmFtYmxlci4NCj4gPiA+
DQo+ID4gPiBJZiB5b3UgdW5wbHVnL3JlcGx1ZyBhIG1vbml0b3Igd2l0aCB0aGUgc2NyYW1ibGVy
IGVuYWJsZWQgdGhvdWdoLA0KPiA+ID4gYW5kIGlmIHRoZXJlJ3Mgbm8gdXNlcnNwYWNlIGNvbXBv
bmVudCB0byByZWFjdCB0byB0aGUgdXNlcnNwYWNlDQo+ID4gPiBldmVudCwgdGhlIGNvZGUgeW91
IGhhdmUgaGVyZSB3b24ndCBlbmFibGUgdGhlIHNjcmFtYmxlciBhZ2Fpbi4NCj4gPiA+DQo+ID4g
PiBZb3UgY2FuIHRlc3QgdGhhdCBieSB1c2luZyBtb2RldGVzdCB3aXRoIGEgNGtANjBIeiBtb2Rl
IG9yDQo+ID4gPiBzb21ldGhpbmcsIGFuZCB0aGVuIGRpc2Nvbm5lY3RpbmcgLyByZWNvbm5lY3Rp
bmcgdGhlIG1vbml0b3IuDQo+ID4gPg0KPiA+ID4gV2UgYWRkcmVzc2VkIGl0IGluIHZjNCBpbiBj
b21taXQgNmJlZDJlYTNjYjM4ICgiZHJtL3ZjNDogaGRtaTogUmVzZXQNCj4gPiA+IGxpbmsgb24g
aG90cGx1ZyIpLg0KPiA+ID4NCj4gPiA+IEFyZ3VhYmx5LCB0aGUgd2hvbGUgaGFuZGxpbmcgb2Yg
dGhlIEhETUkgc2NyYW1ibGluZyBzZXR1cCBzaG91bGQgYmUNCj4gPiA+IHR1cm5lZCBpbnRvIGEg
aGVscGVyLCBhbmQgSSB3YW50ZWQgdG8gZXh0ZW5kIHRoZSB3b3JrIEkndmUgYmVlbg0KPiA+ID4g
ZG9pbmcgYXJvdW5kIHRoZSBIRE1JIGluZnJhIHRvIHN1cHBvcnQgdGhlIHNjcmFtYmxlciBzZXR1
cCBvbmNlIGl0DQo+IGxhbmRlZC4NCj4gPiA+DQo+ID4NCj4gPiBZZXMsIGZvciB1c2Vyc3BhY2Ug
Y29tcG9uZW50cyB0aGF0IGRvIG5vdCBoYW5kbGUgSFBEIGV2ZW50cyAoc3VjaCBhcw0KPiA+IG1v
ZGV0ZXN0KSwgaWYgdGhleSBhcmUgY29ubmVjdGVkIHRvIGEgNEsgZGlzcGxheSBhbmQgZW5hYmxl
IHNjcmFtYmxlDQo+ID4gdGhlbiB0aGUgY2FibGUgaXMgdW5wbHVnZ2VkL3BsdWdnZWQsIEhETUkg
d2lsbCBub3Qgd29yay4gSG93ZXZlciwgdGhpcw0KPiA+IGlzIGEgdXNlcnNwYWNlIGNvbXBvbmVu
dCBsaW1pdGF0aW9uLg0KPiANCj4gTm8sIGl0J3Mgbm90Lg0KPiANCj4gSSBtZWFuLCB5ZXMsIGl0
J3Mgc29tZXRoaW5nIHRoZSB1c2Vyc3BhY2UgKmNvdWxkKiBkby4gQnV0IGl0IGRvZXNuJ3QgaGF2
ZSB0bywNCj4gYW5kIHRoZSBleHBlY3RhdGlvbiBpcyB2ZXJ5IG11Y2ggdGhhdCB0aGUgZGlzcGxh
eSBrZWVwcyB3b3JraW5nLg0KPiANCj4gPiBmYmRldiBhbmQgd2VzdG9uIGNvdWxkIHdvcmsgd2Vs
bCBmb3IgdGhpcyBjYXNlLg0KPiANCj4gWWVhaCwgdGhleSBjb3VsZCB3b3JrIHdlbGwuIFdlIGRv
bid0IHdhbnQgdGhlbSB0byBwb3NzaWJseSB3b3JrLCB3ZSB3YW50DQo+IHRoZW0gdG8gd29yaywg
cGVyaW9kLiBUaGF0J3Mgd2h5IGFtZGdwdSwgaTkxNSBhbmQgdmM0IGFsbCBoYXZlIHRoYXQgY29k
ZS4NCj4gDQo+ID4gVGhlIHBhdGNoIGZvciB2YzQgaW4gY29tbWl0IDZiZWQyZWEzY2IzOCAoImRy
bS92YzQ6IGhkbWk6IFJlc2V0IGxpbmsNCj4gPiBvbiBob3RwbHVnIikgYXNzdW1lcyB1bnBsdWcv
cmVwbHVnIHRoZSBzYW1lIG1vbml0b3IgYXMgc3RhdGVkIGluIGl0cw0KPiA+IGNvbW1pdCBsb2cu
DQo+IA0KPiBJbmRlZWQuDQo+IA0KPiA+IEl0IGRvZXMgbm90IHN1cHBvcnQgdGhlIGNhc2Ugd2hl
cmUgdW5wbHVnL3BsdWcgdG8gZGlmZmVyZW50IGRpc3BsYXlzLg0KPiA+IEZvciBleGFtcGxlLCBp
ZiB0aGUgY2FibGUgaXMgdW5wbHVnZ2VkIGZyb20gYSA0SyBtb25pdG9yIGFuZCB0aGVuDQo+ID4g
cGx1Z2dlZCBpbnRvIGEgMTA4MHAgbW9uaXRvciwgNEsgdmlkZW8gbW9kZSB3aWxsIGJlIG91dHB1
dCB0byB0aGUgMTA4MHANCj4gbW9uaXRvciBiZWNhdXNlIHRoaXMgdXNlcnNwYWNlIGNvbXBvbmVu
dCBjYW5ub3QgcmVzcG9uZCB0byB0aGUgbW9uaXRvcg0KPiBjaGFuZ2UuDQo+ID4gVGhlcmVmb3Jl
LCBmb3IgdXNlcnNwYWNlIGNvbXBvbmVudHMgdGhhdCBkbyBub3QgaGFuZGxlIEhQRCBldmVudHMN
Cj4gPiAoc3VjaCBhcyBtb2RldGVzdCksIHRoaXMgcGF0Y2ggY2FuIG9ubHkgcGFydGlhbGx5IHNv
bHZlIHRoZSBsaW1pdGF0aW9uLCBidXQgaXQNCj4gaXMgbm90IGEgcGVyZmVjdCBzb2x1dGlvbi4N
Cj4gDQo+IFlvdSdyZSBsb29raW5nIGF0IGl0IGZyb20gdGhlIHdyb25nIFBvVi4gV2hhdCBtYXR0
ZXJzIGlzIHRoZSBiZWhhdmlvdXIgd2UNCj4gb2ZmZXIgZnJvbSB1c2Vyc3BhY2UuIFVzZXJzcGFj
ZSBpcyBpbiBjaGFyZ2Ugb2Ygc2V0dGluZyB0aGUgbW9kZSwgYW5kIGl0J3MNCj4gZXhwZWN0YXRp
b24gaXMgdGhhdCB0aGUgbW9kZSBpcyBnb2luZyB0byBiZSBvdXRwdXQgdW50aWwgaXQgZWl0aGVy
IGNoYW5nZXMgdGhlDQo+IG1vZGUgb3IgZGlzYWJsZXMgdGhlIGRpc3BsYXkuDQo+IA0KPiBSZWVu
YWJsaW5nIHRoZSBzY3JhbWJsZXIgd2hlbiBhIGRpc3BsYXkgaXMgZGlzY29ubmVjdGVkIGFuZCBy
ZWNvbm5lY3RlZA0KPiBtYXRjaGVzIHRoYXQgZXhwZWN0YXRpb24uIElmIHdlIGlnbm9yZSB0aGUg
Y2FzZSB3aGVyZSB0aGUgZGlzcGxheSBoYXMNCj4gY2hhbmdlZCwgd2Ugc3RpbGwgbWF0Y2ggdGhh
dCBleHBlY3RhdGlvbjogdGhlIHVzZXJzcGFjZSBpcyBpbiBjb250cm9sIG9mIHRoZQ0KPiBtb2Rl
Lg0KPiANCj4gSWYgaXQgd2FudHMgdG8gcmVhY3QgdG8gbW9uaXRvcnMgYmVpbmcgdW5wbHVnZ2Vk
LCBpdCBjYW4uIEJ1dCBpdCBkb2Vzbid0IGhhdmUgdG8sDQo+IGFuZCBpdCBzaG91bGQga2VlcCB3
b3JraW5nIGFzIGxvbmcgYXMgeW91IGRvbid0IGNoYW5nZSB0aGUgbW9uaXRlciAvIHBhbmVsLg0K
PiANCj4gQW5kIHlvdSdyZSBhbHNvIGNvbXBsZXRlbHkgaWdub3JpbmcgdGhpbmdzIGxpa2UgQVYg
YW1wbGlmaWVycyB0aGF0IHJlYWxseSBsaWtlDQo+IHRvIGRvIHRob3NlIGtpbmQgb2Ygc2hvcnQg
SFBEIHB1bHNlcy4NCj4gDQo+ID4gSWYgaGVscGVyIGZ1bmN0aW9ucyBhcmUgdXNlZCB0byByZXN0
b3JlIHRoZSBIRE1JIHNjcmFtYmxlIGJpdCBhZnRlcg0KPiA+IGhvdHBsdWcsIEkgd291bGQgbGlr
ZSB0byB1c2UgaXQuDQo+IA0KPiBUaG9zZSBoZWxwZXJzIGRvbid0IGV4aXN0IHlldCwgc28gZmVl
bCBmcmVlIHRvIHdvcmsgb24gdGhlbS4NCj4gDQo+IE1heGltZQ0K
