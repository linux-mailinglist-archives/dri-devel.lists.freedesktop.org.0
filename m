Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9FD78BCC8
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 04:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79AE410E054;
	Tue, 29 Aug 2023 02:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2082.outbound.protection.outlook.com [40.107.8.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 834ED10E054
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 02:28:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGUP1Aozm8DmMD4HH4GVAO/YO2ftG2V9O9rolQIBGVeeoKseZQfLGI0Nle5hw1lDvmt51GpOEAiFbAUNagedxmjA/q2iA61tcOU8QYCBYuekcFO9FCNVhqwwoBPJZFZrxBC94+AVSn9v56e2zt6qGtopnE98o/dk1ciOCkxGVaRQ3/TDg1AzrBVHcqdkazj21fgu0tkgQ4w4ukhFvdEH0lxfRa4gHcVPVQZgyWXChQKEt/3SDKS69XmdsYLVrcUkdYnLPzcsWPjvnAzU1SMc3Cw1aLj2/dGCEfzJ9RHPGkFF80MMhyJgYIR5XswGlvJS5vxU0yEddC09CsAz+1UyBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pwwZO6HNuS9MK0oX7q4PyITdo6fu723NFrHJ/96bJM4=;
 b=PnGX+h8TfCYJX2QE/QNLDYPDzl4Yub5K/UrQoFTAytccznVmsw0DzMA56iMC31X05rsnjgnZ7/Wz78xO0hj2CB8o01NGKKu/7J5ai0TMqquAFcpCfdObCqcM0WjpWOX588HnyD7iYJ65Qc8+JBF7jhp3P0N5XJkv6Yqls5oxGmbCMLhWvMu1MH8eiUAxIx4fb8cc/i6nI2R5XN2EllpZvEvgamO6yzf2fS0pK0XpInc09BSyHN3TTnCwn+5xTb8SClYiEY5vWuP8uC8ndoQa7GgBJRv8bFjva43CUtK0+/HsENhi+c+UdKFZH02WHPxSojpdrQ4brIv4kLum+nGU5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pwwZO6HNuS9MK0oX7q4PyITdo6fu723NFrHJ/96bJM4=;
 b=OoP0NLD22lashUeaqxFaRq10py4skbYASBX60Ij5lGnXILwX/qfwEBwYVY+ydklITh+wtlaYiu8IfBTs01jHFp2ktUGWmt8jeN5v/84MkKjKqfsET61fTBCUIqH/dXbt+G+G10c9OeVrPlo9B9vEMFvlLmtcq3kd1BwUhpjLZ+I=
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com (2603:10a6:10:fd::20)
 by DBAPR04MB7255.eurprd04.prod.outlook.com (2603:10a6:10:1a9::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Tue, 29 Aug
 2023 02:28:18 +0000
Received: from DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::6f5f:4224:1dc1:731a]) by DB8PR04MB7051.eurprd04.prod.outlook.com
 ([fe80::6f5f:4224:1dc1:731a%4]) with mapi id 15.20.6699.022; Tue, 29 Aug 2023
 02:28:18 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Zhang Shurong
 <zhang_shurong@foxmail.com>
Subject: RE: [PATCH] drm/bridge: imx: fix potential NULL pointer dereference
 in imx8qxp_ldb_parse_dt_companion()
Thread-Topic: [PATCH] drm/bridge: imx: fix potential NULL pointer dereference
 in imx8qxp_ldb_parse_dt_companion()
Thread-Index: AQHZ2dB2yseXwbC5IUGnH79SWVfzF6//9nUAgAAJPICAAAoqAIAAguFg
Date: Tue, 29 Aug 2023 02:28:18 +0000
Message-ID: <DB8PR04MB7051D36F516D2E44B4DA611598E7A@DB8PR04MB7051.eurprd04.prod.outlook.com>
References: <tencent_026E4B04ACDCE341411EF54862F8C6AB1605@qq.com>
 <20230828172822.GE14596@pendragon.ideasonboard.com>
 <tencent_2E893742B5115B5260081E410A34A89E1208@qq.com>
 <20230828183748.GK14596@pendragon.ideasonboard.com>
In-Reply-To: <20230828183748.GK14596@pendragon.ideasonboard.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB8PR04MB7051:EE_|DBAPR04MB7255:EE_
x-ms-office365-filtering-correlation-id: 06a2c764-d3d6-4c20-5d81-08dba8379b0f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BCxAs/Gb37zxbWxrCAtrzQ+7EIbH4rYyKGwWOBmG6SgnlVAbmad3pDjtMnuTlBqrSNRyfSB5QsckHrbnBE/H7ulPnQeXO6wTWmLkEFQGQH/owszhxJQ6VTbLOl8ZYRuj4n27GUbFjNMKKnm2GirotJEkMRTdL4rgJfdtiZtE2XIeGiPSon/Jw9/XD4PNqcP4rUl8Pk50siGAcSJeyStOIkKor28fFjTe3MfkdociCal6nt3EBMLKULuZeUpae1MuudFiVykm2YaTuMystRpP8xiINmLgsVgYRRgara/fCLykZd4vpIuJIyq/dhljvP4LDd8vMKLLHsYEbeaNdxity+5nqRlYLwu+N94iVqMvl3oJJmk8WF5+INiBBD/hCqDIFbOhWLFUFq5/Pj6Yp7IN4BoXnl/juWc/PXarwYt04KR9S/VfYtWCvBWJRajc0KMarM9McjtrOkprSYfVEA78t1htaoo9TV5LOTGWq74nRhwu3NJuxsupNvG+6XD0Ezp5Lz9NNIUOQfgExg4dI3UffB63Il7WHmJpX9tDGYIpTdmSe4FjMc8ND3Nv8vbuzDCtJ6X+zr3YW6CpvRpXM0fKzwbbWIhxusg0COFP8can3JC2hfiYbQljCXdSnroXcMjn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB8PR04MB7051.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(1800799009)(451199024)(186009)(9686003)(38100700002)(38070700005)(316002)(41300700001)(4326008)(7416002)(33656002)(2906002)(83380400001)(86362001)(52536014)(26005)(5660300002)(8676002)(55016003)(8936002)(71200400001)(7696005)(6506007)(64756008)(66556008)(66476007)(66446008)(54906003)(53546011)(110136005)(76116006)(122000001)(66946007)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MElHK2N0UzhZYjVZQWxaN2tIZ1liMW9udmloNk42UHkxb1pQZzhvSXRlbTk3?=
 =?utf-8?B?WEJzbjB3ZVFGSEs2d3FkbzVWc3U4UHVGb0lnLzY1MUM1Tkk4K1ZaV1VGLy9N?=
 =?utf-8?B?MjdGUDhCL3lGczhEMFBoV1BITkl5MmhZRjlocDQ4RlpLaHdUMGFJa3Y3azVC?=
 =?utf-8?B?YUVJTmNRVFdXSC91NHN4TmpGQjBKQkY1N3VOZVU2ZDJSZXkxT3JwVmRrcHZC?=
 =?utf-8?B?Z3RwSi9jQmN6bmJyaDJUaUwrclpVWkdBTnhxZGdzbE9tVWp1ZTdsY2s0OFRM?=
 =?utf-8?B?U1dWRGJWajVIcitXZHFUREN6VldjcDFoVXhXU2JUN0dNbmxhUkV3THFFQzhI?=
 =?utf-8?B?dFhWclI1NWcybzZtSHVVOFlBSUNzMlI4aWU3ZWEwd3I2L1NzRHVuZHlyeTAv?=
 =?utf-8?B?TUpERzhmQmlqMi81cmZTL3AwMWRma1ljd09jR1I0blFlaTc0aE5VUENtU0s0?=
 =?utf-8?B?L3hTTmRmVU85VWFrV044a0NvdzNWOTVsclNML3NNZWdnVGVhRzdoZlRUQ0RR?=
 =?utf-8?B?bHNMMVlWZlNpZE93YWhKcDk0aWRGa2JKZFcvZTBYSEFtNVhJUjNvdUVIbWdS?=
 =?utf-8?B?K3JONUVQbWRhdXY1YzJZcXhYd1Q2bXlYeHFPTEhyZWp6ckRuMlJxNGlDUTdG?=
 =?utf-8?B?UWVZU1dYVy80aXZWZ2ZhaVNDRHdyYWMwdVRVb256MUdkUVgwb01EeEJtVjhO?=
 =?utf-8?B?QU9WR2tVM1VRSy90NVBxOXA5ZWpidTdoeUg3T0VjeTFuK3BKS1pkVlpUYkwr?=
 =?utf-8?B?d2E0d2pOOEpLaXFudGhiSU1nWWkzcEw2UnZpNUp4T3NQdXpEelkyb0RXTTZx?=
 =?utf-8?B?Z212VmVMeUUwbzRqKzRmdnlnZ0FFb2g4Y1NOM1RIaWtpYWxGS0xrbWwvbFRz?=
 =?utf-8?B?MGRKWEVSdWdaaGE3QzNYTUNzYURsRWlpakd0MTRVNnc1RVg2aStUZjUxMkxM?=
 =?utf-8?B?dzhlUGpsb0x6R2ZDYmxjKzZBRG5zNDdtc3lhUWxKdE9qeHhhejhMWC84a2FX?=
 =?utf-8?B?di8vU0NES3lIWFZkZGFNSUJ0R1NDK1JkUTM5dDZrTXNhSC9aUDZPSU50V05D?=
 =?utf-8?B?QXQycVdwTTJVRUgwVC80VmY1S3I2UUNVOXFlK29HaWN6ZWMwcGdjdGdSS3Rp?=
 =?utf-8?B?akx0bklTRXdQL1A1bm50VTlqTGpscWJJSXFNOWxJZW1lSXNwTmJkbTl0SVFm?=
 =?utf-8?B?ckI2VnhBejluMVdvTyttMHo1c0Jxa2cxTzlJRmxXUGp4UVZXNVVwTHBIWjFz?=
 =?utf-8?B?WlhMVlpXMzVsclk4UTF0bmM2U1BoYVg3aWdzZEkvL1dTOHk1Yy9LbHRnek1p?=
 =?utf-8?B?M2wyS211RWhVUFIxNzczcnhaYlo0dlhFUlpZRnpYaUkvNloyU1cvRURPalZI?=
 =?utf-8?B?d1AvR1hBTG5lUzkxZ2JreGYwN0VLUTRPTFhlalZxQkxpeTZHSHpSMC9QUWlh?=
 =?utf-8?B?TnVHYUx1NVNCTHA2c3FxSndLQjF0RFZrTmJxdVF2U1A1WUNtclY2YnFXWE5L?=
 =?utf-8?B?b0h0RWhUQ1VMSTNPamdlQU9kbDlBSXlvQkhNQ3Q4cW9ZaEoyMXVheXpyNHph?=
 =?utf-8?B?TUU0RGhyTE92RXZvYmJ2enFsL3Z4VmIzR3Y0TWZsWTg4SWFlZDg5RkU3MmVs?=
 =?utf-8?B?WHlEOGQyRFBwMFU5bDROajR3RHdYUmNzNmJoS054aitPWUxoK1FVVjNsM0Fm?=
 =?utf-8?B?MnlJeHBNNjdQbG94dWJtUEp4RU9wWEcyemU0SXhUanl4NENCQk0vbDFLSmQx?=
 =?utf-8?B?YUNhUnZjMUZHYnE4ajAvenpJNGYrRzgrQ05TWkNaQUl0eDNwVHR5d05KUm5P?=
 =?utf-8?B?bDZad3V2UWRXeWRwRU9kcWFWWmRCNktSb2VmcUNtejllVkpsUFIwcGphbUxn?=
 =?utf-8?B?blRDcXlSTkVEYWc5MzlicktLQXM3TzZkVU5IWndTck55Q2ZybFRkYTBKY2RV?=
 =?utf-8?B?ci9ucVY1dCs4eXFjZVhWMFVEOCtOcFBHNnB0bVFTMzVPaWp6THdwVmZiRU9s?=
 =?utf-8?B?cG5tbUpReGRWVGxxd2s0eGlzSDFKeXVYMFlsWU9ON0E4VWxlUHA1WlUxV2RC?=
 =?utf-8?B?NzRLUFJTWVV2UG5GVVJWcnFpMWRzaW5rdEYzZUErTlgzbVZOdFpJRER6aDlX?=
 =?utf-8?Q?ahSc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR04MB7051.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06a2c764-d3d6-4c20-5d81-08dba8379b0f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 02:28:18.1089 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QC42XUZYIyYwMDwNMSHGjwqi7yhElXIboo30sY6pP6d8CQkSbTMx6Le71eCbq/6no9iIH9/EAttjwyw8LGiIoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7255
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 dl-linux-imx <linux-imx@nxp.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlc2RheSwgQXVndXN0IDI5LCAyMDIzIDI6MzggQU0gTGF1cmVudCBQaW5jaGFydCA8bGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPiB3cm90ZToNCj4gT24gVHVlLCBBdWcgMjks
IDIwMjMgYXQgMDI6MDE6MjVBTSArMDgwMCwgWmhhbmcgU2h1cm9uZyB3cm90ZToNCj4gPiDlnKgg
MjAyM+W5tDjmnIgyOeaXpeaYn+acn+S6jCBDU1Qg5LiK5Y2IMToyODoyMu+8jExhdXJlbnQgUGlu
Y2hhcnQg5YaZ6YGT77yaDQo+ID4gPiBIaSBaaGFuZywNCj4gPiA+DQo+ID4gPiBUaGFuayB5b3Ug
Zm9yIHRoZSBwYXRjaC4NCj4gPiA+DQo+ID4gPiBPbiBUdWUsIEF1ZyAyOSwgMjAyMyBhdCAxMjo1
NTowMUFNICswODAwLCBaaGFuZyBTaHVyb25nIHdyb3RlOg0KPiA+ID4gPiBvZl9tYXRjaF9kZXZp
Y2UoKSBtYXkgZmFpbCBhbmQgcmV0dXJucyBhIE5VTEwgcG9pbnRlci4NCj4gPiA+DQo+ID4gPiBI
b3cgY2FuIGl0IHJldHVybiBhIE5VTEwgcG9pbnRlciBoZXJlID8NCj4gPiA+DQo+ID4gPiA+IEZp
eCB0aGlzIGJ5IGNoZWNraW5nIHRoZSByZXR1cm4gdmFsdWUgb2Ygb2ZfbWF0Y2hfZGV2aWNlKCku
DQo+ID4gPiA+DQo+ID4gPiA+IEZpeGVzOiAzODE4NzE1ZjYyYjQgKCJkcm0vYnJpZGdlOiBpbXg6
IEFkZCBMREIgc3VwcG9ydCBmb3IgaS5NWDhxeHAiKQ0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBa
aGFuZyBTaHVyb25nIDx6aGFuZ19zaHVyb25nQGZveG1haWwuY29tPg0KPiA+ID4gPiAtLS0NCj4g
PiA+ID4NCj4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvaW14L2lteDhxeHAtbGRiLmMg
fCAyICsrDQo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4gPiA+
DQo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lteC9pbXg4cXhw
LWxkYi5jDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbXgvaW14OHF4cC1sZGIu
YyBpbmRleA0KPiA+ID4gPiA3OTg0ZGE5YzBhMzUuLmQyNzJmMzVjOGVhYyAxMDA2NDQNCj4gPiA+
ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9pbXgvaW14OHF4cC1sZGIuYw0KPiA+ID4g
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2lteC9pbXg4cXhwLWxkYi5jDQo+ID4gPiA+
IEBAIC00ODgsNiArNDg4LDggQEAgc3RhdGljIGludA0KPiBpbXg4cXhwX2xkYl9wYXJzZV9kdF9j
b21wYW5pb24oc3RydWN0IGlteDhxeHBfbGRiICppbXg4cXhwX2xkYikNCj4gPiA+ID4gIAkgKiBz
dHJpbmcuDQo+ID4gPiA+ICAJICovDQo+ID4gPiA+ICAJbWF0Y2ggPSBvZl9tYXRjaF9kZXZpY2Uo
ZGV2LT5kcml2ZXItPm9mX21hdGNoX3RhYmxlLCBkZXYpOw0KPiA+ID4gPiArCWlmICghbWF0Y2gp
DQo+ID4gPiA+ICsJCXJldHVybiAtRU5PREVWOw0KPiA+ID4gPiAgCWlmICghb2ZfZGV2aWNlX2lz
X2NvbXBhdGlibGUoY29tcGFuaW9uLCBtYXRjaC0+Y29tcGF0aWJsZSkpIHsNCj4gPiA+ID4gIAkJ
RFJNX0RFVl9FUlJPUihkZXYsICJjb21wYW5pb24gTERCIGlzIGluY29tcGF0aWJsZVxuIik7DQo+
ID4gPiA+ICAJCXJldCA9IC1FTlhJTzsNCj4gPg0KPiA+IEkgdGhpbmsgd2UgY2FuIG1ha2UgaXQg
aGFwcGVuIGJ5IGRlc2lnbmluZyB0aGUgcGxhdGZvcm0gZGV2aWNlIGluIGEgd2F5DQo+IHRoYXQN
Cj4gPiBpdHMgbmFtZSBhbGlnbnMgd2l0aCB0aGF0IG9mIHRoZSBkcml2ZXIuIEluIHN1Y2ggYSBz
Y2VuYXJpbywgd2hlbiB0aGUgZHJpdmVyDQo+ID4gaXMgcHJvYmVkLCB0aGUgb2ZfbWF0Y2hfZGV2
aWNlIGZ1bmN0aW9uIHdpbGwgcmV0dXJuIG51bGwuIFlvdSBjYW4gdmVyaWZ5IHRoaXMNCj4gPiBm
dW5jdGlvbmFsaXR5IGJ5IHJldmlld2luZyB0aGUgZm9sbG93aW5nIGZ1bmN0aW9uOg0KPiA+DQo+
ID4gc3RhdGljIGludCBwbGF0Zm9ybV9tYXRjaChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBk
ZXZpY2VfZHJpdmVyICpkcnYpDQo+IA0KPiBUaGlzIHBhcnRpY3VsYXIgZGV2aWNlIGlzIGZvdW5k
IGluIE9GLWJhc2VkIHN5c3RlbXMgb25seSwgYW5kIG9ubHkNCj4gaW5zdGFudGlhdGVkIHRocm91
Z2ggRFQuIFlvdSBjYW4gY3JlYXRlIGEgcGxhdGZvcm1fZGV2aWNlIG1hbnVhbGx5IHRoYXQNCj4g
bWF5IG1hdGNoIHRoaXMgZHJpdmVyLCBidXQgdGhhdCB3b3VsZCBiZSBhIG1hZGUtdXAgc2l0dWF0
aW9uLCBub3QNCj4gc29tZXRoaW5nIHRoYXQgY2FuIGhhcHBlbiBpbiBwcmFjdGljZS4NCj4gDQoN
CkkgYWdyZWUgd2l0aCBMYXVyZW50Lg0KDQpSZWdhcmRzLA0KTGl1IFlpbmcNCg==
