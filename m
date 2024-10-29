Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 230589B42F0
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 08:17:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8358310E5B8;
	Tue, 29 Oct 2024 07:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="JOUdgOiY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2069.outbound.protection.outlook.com [40.107.20.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F11010E5B8
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 07:17:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tw6m7DjTvG5PSxXjJbNy3phQkAfDyjucbvN164aE6cM+zcMDCVla/QDkxInIQvxhY1sT+R9MxGCajYNX7r40LzfzWgROYXaCC7JcoKeTdPaIjGmXR0cNCo1heMrdTaMbo/ZEoZ2WTDCXi9EYOJsvVQ+vsGNACEtOXf/AqENafwbi9mtyakzlTl/6fZVYa7kb5IrJBeQ5pFfb/El0cib65KwjIELdVc2N58+ekAmqsd1ZqCwzU0aQYc7ez52/onRo3jodobc1pgIUXmXOJISF5aefCdKJoe22JyTRrEfU2liM1b5VS3oQlmlw0MCi7NDQZRl3bcs4g1SjsJGCwtyOgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WHnJ6+sZzRHAoBAR/+g9yY9STCau9buh11Lf5E9bWHc=;
 b=Ik70jdBXgyHgz483NBDxN9snoAKzUuuo/CCLCRJH/+JYQk6udhsLOJMeL7Coo/C9JD3SwC0jw8i3QgsZKum30zXU6bvlIhLqvQZc8IISfPwAvPV9vzCT3CcSUPtCpp1RcEBsBn1QRaeHPrcTSDSjMNDmm87afKYe/2RSyMBXyjMrjEL+fWjBmzoEhTfWt+YPpGQMTLYPdvEsttcwgnNMZvgJfy2wJoVclDlikqeuIWa9Gis6vyYclTGLnsyAggQx0Kcp4da4tpEPeEk6PcrEYCpPsfCbEct8n3iyqJ2+AD9sL9yGCZAhAGx+TLBNKIAAt79Hs4u6q56BnwSQGF+WzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WHnJ6+sZzRHAoBAR/+g9yY9STCau9buh11Lf5E9bWHc=;
 b=JOUdgOiYNAfw/YYkoNhWXlp3qvTrqMqGOlgopjDyxnSPnwsa/2JE1U7n2/TfKSXNr7Nj7AZ/dbjxFOjtEbpzHY3yJYL23VY5PdYqDQvgU7Zbv38ZLR5ELaQChx3m6Y7mRxdSQShIJRIqh8i6MmtTFpEd6Nehd3Pa1Ym4ZDB+EKZ3/QoDEqZPunNubdW3Cvy6AxX3OWFePtbFuk/ejG8lMDqry/XrtbIrz6kjNV0xdrxMEDFgWTiEYDL+O1yLEVfYVYJ3xpTfcGLXFdWuXVh8aWkOB4P/PtsxhFWOZibwsn3hIJWKT0bPZqI/INmpO2PTLp0k6aqqIVo5uB5cVPEhXw==
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PA1PR04MB10770.eurprd04.prod.outlook.com (2603:10a6:102:492::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 07:17:25 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%6]) with mapi id 15.20.8093.018; Tue, 29 Oct 2024
 07:17:25 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: RE: [EXT] Re: [PATCH v18 3/8] dt-bindings: display: bridge: Add
 Cadence MHDP8501
Thread-Topic: [EXT] Re: [PATCH v18 3/8] dt-bindings: display: bridge: Add
 Cadence MHDP8501
Thread-Index: AQHbKchysDeMCVHJNEu0yEsxBchosLKdTAIAgAACD7A=
Date: Tue, 29 Oct 2024 07:17:25 +0000
Message-ID: <PAXPR04MB9448D20D5EDE86DEF060222CF44B2@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <e11ba0cf836d6f27935f58b7987e792026ab0233.1730172244.git.Sandor.yu@nxp.com>
 <c664wq5wzzvivvkpedkicz6ku55epoa75oyycm3hohoms46yi5@myn542dqlpmu>
In-Reply-To: <c664wq5wzzvivvkpedkicz6ku55epoa75oyycm3hohoms46yi5@myn542dqlpmu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|PA1PR04MB10770:EE_
x-ms-office365-filtering-correlation-id: dd6c471c-96a4-475a-8e16-08dcf7e9bd1f
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?ZUhNSUhwMDg5ZTZJUDVlcXFyOW84VG5uSDBwVDBiMkRHdVgySmVlN09BZS9U?=
 =?utf-8?B?dHFwVVhsL2p6RjlyTEswS01IUGM3N3VLVGFLdFJjaEtEUVl2RFFtaEZWZkFp?=
 =?utf-8?B?S1gzL0gxeWlKcVlqM21yMUtZQzB1UTRzcUFVZVlWcnFWcTVhdFJ6b3dESVlk?=
 =?utf-8?B?SXZkME5iY3dNVElhU3U2enFGbnphdXpMMEFOR2pqN2IydG5xaGhOZGdvR0VB?=
 =?utf-8?B?bUQveFc1TXBNWmtCSlV5T1RrTHBzVDZKK1F3YTBUbnljZmZnZ0FzdXFjRE5l?=
 =?utf-8?B?QXVNMjlCTDY3NFhLRitwWTByRURhVlM1bXJHRE1pUGpYRGZtZ3Z1OXpQWkZ2?=
 =?utf-8?B?YlgxZGwvMTFOeEN1cXpIWVhaOG9RclVJSFIvY3BrQ0NzMWdYczB4bE81WERJ?=
 =?utf-8?B?UStwQUlUbGlEVkpRaUdWTzltQ2kwM0xlSXJZRUNlaTM1OHlwTFBtc2VaaUtI?=
 =?utf-8?B?WW5aMG9iMFo1dDdFdEFlUTdtc0RPZ05oODQ1c0c1cElPaEc4WUk3YmhzTUg2?=
 =?utf-8?B?dXlnMUV0b29CWVZwRVgrWlEzZ0h6eS9LZzRFZnRkUStsTXo5V2E3VDlUVlRV?=
 =?utf-8?B?dDJqR3o5bExYOVVnVDJwa05oMDN6bVBQRVZWQnY1ajlsOE1uZUd5Q241VFNP?=
 =?utf-8?B?Z1psZVJmQ3l0WElUc2EvRHhRMTFHMDhvUGcvUkxvekhwbFpQYlNoNEZMMDdG?=
 =?utf-8?B?SVdlVlNjQ1pQeUtLSk5zeHdES3FBdDJCNVFPQ1ZhK05NVWUvbXNnL2F5TlNv?=
 =?utf-8?B?Y1JMMTc2TUtlQ2xTUFRlTVF4cDRmT0FLTG80RDE2MWYybDJiSEdmamZSVFJO?=
 =?utf-8?B?M1FFZjVQY0pwZGtMRXk2OUszeWREVVh4WllOWlJWT3dLa2Z2RXJzcDJzcEpq?=
 =?utf-8?B?TzZMRE1PUVdDTUlDLzB2NDlRSW1rRGhxVkVrd3NFa2NNNXovM3RHZUdMaU4v?=
 =?utf-8?B?NUU2SUVEUVBZUVJOakxaQkMzR2dzWlo5aERkbERhdks3NE13bzJjUndoaHhU?=
 =?utf-8?B?elRodlgyMGZOcVlGK0MvUXFybDhLcnIxVXkvRU9mOVh1SURIMmZ2RDJUT0lo?=
 =?utf-8?B?dW9NRlpJc1ZUK3U0eFRRTFFGbCt6blNZRVAwZzZqdHhkNTB0NEgxYmdGM2FE?=
 =?utf-8?B?dVdrVVlnUE94VTUyS0hVZG8zYWVndnd3V2w2TldqbitZWHkwcHJmTEx4dWpH?=
 =?utf-8?B?a0QzWGtLb09qVllOS1RyQkZrRzhyblYwOERteXhiQVBiMGh3WStkbXFzaGNi?=
 =?utf-8?B?bDhROUNhT0RicWZ4R1ZUL29uTUtpbElMMzRtRnFJMS9OSjJKUUp3RFFES3l3?=
 =?utf-8?B?SytPOW90WWF0bWtJTUV1bDQvTjBobXdGaW8wVlozY01iYUtXbkpheDMzYWdk?=
 =?utf-8?B?dFZ0RzBLYWtpUW03dTFyT1NKbmtGU2VZK0RiRGZHL0owVS9aRTZRUk1URHhP?=
 =?utf-8?B?RkhxNGhhQWVFd25XV2VnUjhsNHlzc0tWWEpIS3FCaVJNTTlCeFZTVEhaSmE4?=
 =?utf-8?B?VnlJSjZNQ3ViU2ZmODV4dUczYmZvbTczNGx2OHpYYUlRSSt0a1ZOcnl1UXZX?=
 =?utf-8?B?Q3ZPYnhOK3pWRU1wSU1MQzA1enNld1VlcjFISE44L05EQUNEQ0FLdUNJanNX?=
 =?utf-8?B?Y1ZNOGVYazFUa0djc2NDczZHOWpWM3ZGVDdHNFMvYjhsVm05L0tKWGl4d3NN?=
 =?utf-8?B?aUxEMjVlU0ZHdXFtZmQwcjZqcjllYU0ra0lYQmtQWEpvU2RRZHlIREVMNUhV?=
 =?utf-8?B?Zm9qeE9GQTZlUzlCS2l5aEZGUnVPN0Zwd3MyNnF1NG9iNVlnL1Q4RXk1RmNt?=
 =?utf-8?Q?V7OgyaF6yN0Mv6Dlh6v4Q5BzEv8mfjSZEx2lc=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGRZYnV2YWM2bXcvRWZDSW0vRGk3ZFRrM2Q5Umx0VUx1OVFQV3F1M0w1V2hj?=
 =?utf-8?B?WHdjRC8zV2t6WTRWRXJZWTFLOVFTdVc4Q2htV2JWMVdxS3FIZ1hlK0p2L0wr?=
 =?utf-8?B?NENBOVlBeEQ1QlpZbEJ2UUNlK0RCbXY3MWhlZnRnazIxUzRhSnlaNjR4OHpu?=
 =?utf-8?B?MG9haHlrbUVXR01PdGxBdkVxay9kVkcxdkhkdnZhTUxicGxLMzBRVExDMlcx?=
 =?utf-8?B?ME4vakhPQk91QXNraVVENUtCUlhlWkE4UitjWWQwMXBzeVVVaDNaM1dKcVJP?=
 =?utf-8?B?Vlg4cVJ3aGlpdTdIMFdtYWh3ekIrMW1vTjRvNUE2ZGYyaFdISFdxamNiQVlY?=
 =?utf-8?B?UVpsTzQycnAyUXVTZWVxNnZnRVV5WjJpcldNNzN4WjhETzIyMEs3eitsY3k4?=
 =?utf-8?B?WC9EYU1WVXozVWlEV0RrMUUyeWJmbEVnSlBiYjV4YXdYUVdkYWdvWGNMeTZz?=
 =?utf-8?B?OEhxUWN0ZGJ4TzF6MEdYU3lZMmV2cW5ma041TXI5WUNiVkxXSU4zY1Y4VE9z?=
 =?utf-8?B?TDh5bUVjelNQQkJ6N0xzTm16aTM5NlZWekErdjl6MytBZXRWMEZnbjdnbTNt?=
 =?utf-8?B?RnVoM2tEczh4ZUZaZmE4VmtPdmpwbmZMUzJ2Z3RSWHJNRWcrdDRNalJMeTlh?=
 =?utf-8?B?RU1TMFhLR0l4eFNLTmpxSFc3N0o3WWNsMGdzY1FhalcvZnRwWXU1OCt3Q3hs?=
 =?utf-8?B?YU9YSm9Nd1hwanpVZkZBZTNPT212Rzd6TDFPNDNzeXBkakZ6c3I4Z1dnYlUv?=
 =?utf-8?B?WFo2NUJVUEs4YTcwbmljbDhaMXNhNEk4Z2d3MzRGRUxERjVRSXBTaUM4TXZM?=
 =?utf-8?B?bWJnZUNEMXppVHE3SWxLRE0wRGVpRWk4SVRRY3RvRE9oR01jVmE4Myt3U0JS?=
 =?utf-8?B?YngybzJ1M1A2ZDFkQ1JLMjdGWnNsTmZSYU44SmVRWndkZHVyam1rTUo2bElO?=
 =?utf-8?B?dzFkZS9DZTNTVFpTbStPMjlVK1VTcUdOZUJMelRkTlZZL2tXUzlFN250aGY1?=
 =?utf-8?B?RnEwaFptQVNXZnIrRW04QnFPZmlSMS85M24wTnp2RzYyeVR0N2laUEVkYUFH?=
 =?utf-8?B?WjVkQVRqWGxGL1d1RnVzMTdESDB2d0l0TU5lTzJiSlJtTmZSRVhFYm93bnpG?=
 =?utf-8?B?eHB0UklMZkhUQlRxSm03NUwrN3R3S2t5TlNQL0RrVSt2bzkxa2lzL1ZyYVVh?=
 =?utf-8?B?c2lvNll3QUdvc1lTdEhnYnpYVzJtdmJxN0k1MHRLYkZkdEF1eEV6b3o3K2s0?=
 =?utf-8?B?cWJPTmlwcEJ0dFBnem44aXFseXp2QjZLUjQxWVcyK0dCdmN4UmpIRnAyVEtD?=
 =?utf-8?B?bE5xOXphZlIxZjhSYmdPc1QwVHQ2VU9qUW9mQzhTcGFGU3pXTTc2MGxkZnhh?=
 =?utf-8?B?YlpIN0ppL2lFR3VlN2dmempJazJaM1NqcENwbzFoOHFYM0V5YmdpSUt4UDU1?=
 =?utf-8?B?aS9rSjZESWx4eDM4K0NDaDRrYzQxeXAzd0JiaUtsSTZJRDdScnRPYmZ3Z2w5?=
 =?utf-8?B?NS9YOVc3TE5WMThTczRpUmNpQmdDaXNreDBGQkdYMG1SNFdIVDR6dXFUVXNN?=
 =?utf-8?B?TnBNVERwdGxheUEvVzFhTTA3Nzl3Y0gwNXFjWXptNEVHa05XSW9ac3pjdTd4?=
 =?utf-8?B?V05tUjVIdk8yVE94UDRBTlJ4ZVZOVzJ1TjBmUmUyK09CNytvanBhM0J2bVRD?=
 =?utf-8?B?VnN6NjlZMC9UeTR4YTlDbUlhU3FUZXpqOUlubUF4U3Z1KzljN2xMRnllTTEx?=
 =?utf-8?B?SW1PdElDdUhsRFFSSXpWNE4yakFWcnpzSU5GWkw5MFUvdk9BQmVRVDVidWZ1?=
 =?utf-8?B?K3R2T2Irb2FUbGhPc3k1aFZHdDEzd1J5NFViM0hqblZ2d1V1RWpKSjVROFYy?=
 =?utf-8?B?WTk1S09Pa2g1WmZhTDEyNXJqcFZYeGRLUERqM1RZMXQ4VFpjay9RZXBST0xW?=
 =?utf-8?B?T2VzQjhxekJGYWYvOW5mcktJZEtDL25XOEJHUnorMkphZzVWOXlLd29PcWFK?=
 =?utf-8?B?cHNBOTdQUXlnbE5xM1pXRkp2YThrb2g4bWp0MkhYUEJzYzZjblZXalhHeERn?=
 =?utf-8?B?WnlYNFlwRHUzYWZxdGZ4dWh4NTliNDZOVFdQVEMvSi9ZMW9ibkd2QXVrcDNI?=
 =?utf-8?Q?dmI4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd6c471c-96a4-475a-8e16-08dcf7e9bd1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2024 07:17:25.1838 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CA4t748qB4BOxubm8yiqVgwCi5rNaQUFKibwEWhY9KTsqsZdHjs1FfRa1154SCcYIocAc/eVRPqhgZr9UFliLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR04MB10770
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

PiANCj4gT24gVHVlLCBPY3QgMjksIDIwMjQgYXQgMDI6MDI6MTFQTSArMDgwMCwgU2FuZG9yIFl1
IHdyb3RlOg0KPiA+ICsgIGludGVycnVwdHM6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAg
LSBkZXNjcmlwdGlvbjogSG90cGx1ZyBjYWJsZSBwbHVnaW4uDQo+ID4gKyAgICAgIC0gZGVzY3Jp
cHRpb246IEhvdHBsdWcgY2FibGUgcGx1Z291dC4NCj4gPiArDQo+ID4gKyAgaW50ZXJydXB0LW5h
bWVzOg0KPiA+ICsgICAgaXRlbXM6DQo+ID4gKyAgICAgIC0gY29uc3Q6IHBsdWdfaW4NCj4gPiAr
ICAgICAgLSBjb25zdDogcGx1Z19vdXQNCj4gPiArDQo+ID4gKyAgZGF0YS1sYW5lczoNCj4gPiAr
ICAgICRyZWY6IC9zY2hlbWFzL21lZGlhL3ZpZGVvLWludGVyZmFjZXMueWFtbCMvcHJvcGVydGll
cy9kYXRhLWxhbmVzDQo+ID4gKyAgICBtaW5JdGVtczogNA0KPiA+ICsgICAgbWF4SXRlbXM6IDQN
Cj4gPiArICAgIGRlc2NyaXB0aW9uOiBMYW5lIHJlb3JkZXJpbmcgZm9yIEhETUkgb3IgRGlzcGxh
eVBvcnQgaW50ZXJmYWNlLg0KPiANCj4gUGxlYXNlIGxvb2sgaG93IGV4aXN0aW5nIGJpbmRpbmdz
IGRvIGl0LiBkYXRhLWxhbmVzIGlzIGEgcHJvcGVydHkgb2YgcG9ydC4NCj4gT3RoZXJ3aXNlIHdo
eSB3b3VsZCB5b3UgbGlrZSB0aGlzIHRvIGJlIGFwcGxpZWQgdG8gdGhlIGlucHV0Pw0KDQonbGFu
ZSByZW9yZGVyaW5nJyBpcyBhIGZlYXR1cmUgb2YgdGhlIE1IRFAgSVAsIGFuZCBkaWZmZXJlbnQg
Ym9hcmRzIGhhdmUgZGlmZmVyZW50IG1hcHBpbmdzLiANCg0KQmVuamFtaW4gY29tbWVudHMgaW4g
djE2LCB0aGUgaW14OG1xLXppaS11bHRyYSBib2FyZCdzIGxhbmUgbWFwcGluZyBkaWZmZXJzIGZy
b20gdGhlIGRlZmF1bHQgaW4gbXkgZHJpdmVyLCANCnNvIHdlIG5lZWQgdG8gdHJlYXQgaXQgYXMg
YW4gaW5wdXQuDQoNCkFzIGRhdGEtbGFuZXMgaXMgYSBwcm9wZXJ0eSBvZiBwb3J0LCBzbyB0aGVy
ZSBpcyBubyBleGlzdCBwcm9wZXJ0eSBjb3VsZCBiZSByZXVzZWQsDQpIb3cgYWJvdXQgcmV2ZXJ0
ICdkYXRhLWxhbmVzJyBiYWNrIHRvIG15IHByZXZpb3VzIGltcGxlbWVudGF0aW9uIG9mICdsYW5l
LW1hcHBpbmcnPw0KDQpCLlINClNhbmRvcg0KDQo+IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlz
enRvZg0KDQo=
