Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 713E84F79B3
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6684810E57E;
	Thu,  7 Apr 2022 08:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6273C10E57E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:30:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FOR0GbgQOfKoOz1J4xK6sQsv8PW5dXCwdpXSwQUGcWlLN41jURCjPMuzpe5CmXBS/3OKgv4Cl0zX9F+zxbqEzDzRg8RIiD8WEXbI8nyH2dj8FsFPdwc0JuE9vSS6e7AWRapeW+IiRSZ/HoDqT33iDT//rzoBV5ZwVkClNZarRNKnSE5+1+dslfy5SwiCnVMPuk7x+n6HZ6iko713C8TlQMTw9q8zco8jtjwrrz8Bh8nmWxIdWNMNZ1jir9GvXz90pbqDv8kQ7v1vIkR1lM2ERS6zIMhl2eowAKlnrR0i1EF3WfiwXfD3oyBp9UCrSHoa9T9AcBsvTdSz4ClRRyEADw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvooU2lqHWLLqnkj/suaxfM3Tm0kJVx3BG9SMMatbYc=;
 b=W0enlwJiU8MSLlKb4SUworLb05KftGiINAHT7kb1ZHx14IJGIZPywn3cxDTm/Xfv0QC8J3rj1NinOe2EwOndmjCdxfIrDmrIuCBAxKvsL3L9wmUQFMTEHQfbr06KMvMl2vJjDTGHKH/wJ8yMIcjW3TsSTZgmP2aboPaAq3/1MilTakKntLs6okeBiI6/MQTYuzfrUqITQq9Y/MXiMEJXXNzHNpZ+Q1WTyBI7yHXT+16pFyFxwwYXdHmj83KXhd9nln2FP1tt6q2mWrC8LRtY3QsAWV9dxHTCw3vAGFtxrPh05ZMAJoG+HM8THnHsKTaPdYPjY5Ecgk5Efi9vz/PQAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvooU2lqHWLLqnkj/suaxfM3Tm0kJVx3BG9SMMatbYc=;
 b=ik8sZGUf9ZLt8FZPCq/RqMZ9wfI4P0UrOZqiOBF/ThPEVKGdvSufrG6lVy06wdIYOQayX11IrOFSa2qk3jogaVX2XfF39vPVpgSKw7Y/AjuNsgGuh7//3ucipPQ6pR1VrHqLeKwAjH1Y1Dyd66uM8xHLp4TDWoDpBM3DUiFvx3g=
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by VE1PR04MB6717.eurprd04.prod.outlook.com (2603:10a6:803:129::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Thu, 7 Apr
 2022 08:30:46 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::dcb:d345:1503:d921]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::dcb:d345:1503:d921%7]) with mapi id 15.20.5144.022; Thu, 7 Apr 2022
 08:30:46 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>, "robert.foss@linaro.org"
 <robert.foss@linaro.org>, "Laurent.pinchart@ideasonboard.com"
 <Laurent.pinchart@ideasonboard.com>, "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>
Subject: RE: [EXT] Re: [PATCH v1 2/5] drm: bridge: dw_hdmi: enable overflow
 workaround for v2.13a
Thread-Topic: [EXT] Re: [PATCH v1 2/5] drm: bridge: dw_hdmi: enable overflow
 workaround for v2.13a
Thread-Index: AQHYSYkTLG5AmcMLrUORyFfBxdkMxqzimy+AgAF5iRA=
Date: Thu, 7 Apr 2022 08:30:46 +0000
Message-ID: <DB7PR04MB5450ABCC4E1CAA262DCCA7C4F4E69@DB7PR04MB5450.eurprd04.prod.outlook.com>
References: <cover.1649230434.git.Sandor.yu@nxp.com>
 <5339589121b05c0db7ee4befdc48c7e4ab4f1653.1649230434.git.Sandor.yu@nxp.com>
 <45668d73-a9fb-b23a-fb32-2e50eb4982aa@baylibre.com>
In-Reply-To: <45668d73-a9fb-b23a-fb32-2e50eb4982aa@baylibre.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e7444182-e50a-41f5-32c1-08da1870e9c0
x-ms-traffictypediagnostic: VE1PR04MB6717:EE_
x-microsoft-antispam-prvs: <VE1PR04MB67179FFCA40EC41185BFC87BF4E69@VE1PR04MB6717.eurprd04.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BPLoj10SKpVOuUIv5gwJNatoRD1dOQn2papIuwtyjImWB8Wn2O03wkm6ChiqSV3yvw1Cj8+98MEODYqXjU4BcnheUUiFCIFDsXgXf8V9lSb1Sdk2/NqVrKBvqgA4DJnVYpEtAmieWX1jrJOtdMsV5OpBixlQZ9H2qhgr6lZER94xa/tx5lZLnrzWjyTa5ZlQjbzS03RNWsqxxGVcF4c1MCCFACVyGXF/3HTQXq8SjInt1Uvdq4zg+4K4LnT7QW5djphTdbk7BWo34JkHvXiX1LW6Fee1E12avyX5lpAH/ob9AjAkNi86S1lVrz2cwlkd64iNNyliIhOl1z5vCkCbhqTg5LcbF3Ve0bcriGPWfeIu5nMUa2P7bZ8e4DmEL1Yc9uhN4VJkVp0q/bT80vKqe0i8kLBphmG1HM2Tmx4/9Q6BSmRpp4hP8N0XSj7K9XyqzCBnG2nsc+ILgLd3Rt41Alye4fvq6oakPRizB+kDDIOonAlOh5dwZ+jVGrkEUf7o+eoloXOV44lvPb8JW4+uTCokRHMvHeDJ/hxNFBAJy5TbWjBmgxoAgH1xIKiLiLddoGIO+pX1l+BM0HP1vWeD77IoI/l92cmyAnik5lk7TR2uIakT5q99qebxIEu709l89Zl4bjEi9vt3Ld/CloN5gEUShEx1VkT87Bd+VekPwn6bRXS+wSsGP8c/BGj5jyebq95TapxVu01TLI7LxoPQ3A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(8676002)(4326008)(83380400001)(64756008)(76116006)(66446008)(66476007)(53546011)(5660300002)(66946007)(66556008)(55016003)(33656002)(86362001)(38070700005)(8936002)(7416002)(9686003)(6506007)(71200400001)(44832011)(52536014)(7696005)(316002)(110136005)(38100700002)(508600001)(122000001)(186003)(54906003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YjRrNU5Vb0JPaEZYVDhqeEh4djQwci9vaGJxMVp1RENiQ2EwTGIxY05sWEhh?=
 =?utf-8?B?UFVlNldhUGtnUmt3MllZYlo1Nkg2bTFpSmtYY0FKQzMvckRsNFRnK0VCNDRY?=
 =?utf-8?B?aGpFQ2VHZk1RdTlVaTBZZllLL1hRYzc0eUZQOTREalZoSU9EVUJ0U2dwVkN0?=
 =?utf-8?B?TFMxbmFBbVZta2pMcVE4MlRuaG5OQ2pQRVc2VzkxbzZGWEdKQTdlbDY4WWp3?=
 =?utf-8?B?S2cySGtPbU00Zi90RldxcStSREx4LzlsdjNxL0R3ZlcrZGtoVUZnWUJtTnYv?=
 =?utf-8?B?NVBGYUpPdjJoUU9teklRS0FBSlU5cXI1Q25RMHFLeXBIcjdJTVNLY0Rmcmpi?=
 =?utf-8?B?WGR0TTAyb0NSaW1IRHpJTzJ5VzFsNWVCbWdmYll2MWVJUFQvWEdFU1c0SXFK?=
 =?utf-8?B?Z29MY2czY1JodGRESHZFbVRuYXNhVi9FeHRyemN2c0p2V2NCWTVQN2drQU1a?=
 =?utf-8?B?WHY3Q2RnWFRXNWpRMXJIQTVMbzZyNENYY1hXUHlnQjd0bHRGaUJPU3NKVHlm?=
 =?utf-8?B?aDRydXVQNkRibHZ0R0g4Q0kycm56TGlyTDVjT0VtQWtEVVhsWE42SzllaUha?=
 =?utf-8?B?bkE3T1A2eWNZUnVKQ2NSSEs2WEU4U2IvTHg1SUxlNVNVQTN0N2pCWlVsclJP?=
 =?utf-8?B?aERqQTU3bmlxVnVlSE5jeThjckhjeUpaTi80TVFUY0hKRFYraUtJcGJHUFZL?=
 =?utf-8?B?UGU2OG0vTVlSYlMyZkFOK1BUcXFlU3pzK214VEtxQWxaT1IrQ3BCUjBKdUJi?=
 =?utf-8?B?Zit3YUk3WDJBMS9ocFJhbEQyUnBVeVljclhVMGlhYmFuZHJxbVhkWUNKenEw?=
 =?utf-8?B?SjE1enVGMm9iV3JFSFVCbkpqVjNjakR1UHVzYzNyd2JoUnhGY0pySHdqZG1T?=
 =?utf-8?B?RU5mRmlNRUxpaXR5Qk0xbTl2cDRXS3lLL3Z1eS9BRFZRcWhzb1o5ZzNtUzFT?=
 =?utf-8?B?WUxWYjlTSVJZaU5SN3dqbzIzc1BiQVByazVlK09NR243dG5kV0pHcWNJcmFo?=
 =?utf-8?B?NFpqSlArRG1NV05vZmU1VmZIR2ZUMGlFS0tNN2hNVFUrZ09rM0JYb3VWOTZO?=
 =?utf-8?B?Z1ZYcmh2QTRnR3pUUWxWejdkdTJZckl6aEgyVUMvQ2JTeDBnZ0JhdUl6ejQ1?=
 =?utf-8?B?SWZ4RWFwMGp6NlRIUmQ4OGNIL3FWV3Y0TGRFRlVVNkZyVnQvZCtmVFlXanhN?=
 =?utf-8?B?T3Jncy9rYzVRQU9qeDJDbGNxWjljZXprV0NNK0hKamF4RzIvamprVGhVWGZo?=
 =?utf-8?B?MDlYclAvdUtDVEQ0OXlIaU9WT2VrN0hZVTY4Qlo1RTdSb2JvQ082L24zNUFQ?=
 =?utf-8?B?ZXJCOFdubnREOE1SRUoxN0ZCbGVENXhqMXdJRWMyMy9ZbUlXUThtbDVzcHF1?=
 =?utf-8?B?ZTlHTm1kOGlxZ0djZDh3MDRvek9ERU04SkxudWpGcmFuMFp2ZndjWE9RSmNB?=
 =?utf-8?B?WmdoQ0pLMGMxREh5NHgxOFRkWCtJU1RZUnBzQUEwRlFVY0pkMTZRSnA4T3U2?=
 =?utf-8?B?ZjVnSTkwNnF4UElPeDZnRmJwZU5pTEhWUUxxU21pNHI1SE5SWWNWUm5jT3po?=
 =?utf-8?B?dkZtRElvdXRnWWkrbWd4MmUvVm5GU1FsNDRVdmpMV2Fjb2FHbTZ6MXpvY0lE?=
 =?utf-8?B?c2RsQlRqM1BsS09CSWtxVGU4Q01sdW9vQnBPZWpQMVdXQnMzQ05Rd2tDQmtN?=
 =?utf-8?B?SzFuc3czL2ROaVBjSVQ0NnRHdXVUcnhvRWNGem5LdjBONVpIajVtZkRTcGYw?=
 =?utf-8?B?bE9UMERwYU1VZUJmTlYybWNEdzdPRWlOWXcxSVZ5QXpEeGJuWmxnVktRcUV5?=
 =?utf-8?B?ajl5djZhRlVnMkZac3NwZVNSc0p1emlHemhyVTA3ZGFNMG84bS9TNDJTRmVU?=
 =?utf-8?B?NlFuaGxSSG1rMXI3TjA5dyt4YndqZmR3aEtsZFQ1RHZjTm1qSWl4ckxDa29o?=
 =?utf-8?B?RFNmdVJDY2NwNnNDR05oNmdLa3RRdlBuMlNMeUx4UGVKaGptNytFSzRxcVVm?=
 =?utf-8?B?WVViNXUwaUlZdUZJL3BwMGVSVFRDY0FEeVprbHp6NnNiZUJLZWtkN3BMTExM?=
 =?utf-8?B?U29qUFFmR0VkaEVKd1lENWJLenRpdHhQYzE4TzJNV2d0TmJGQk9oTTVjVi9y?=
 =?utf-8?B?dVRlR1RyWTJhWnQydlpSR2lTZHVjQU5XZUNaSXN6TzRHWk03Sm9VZHc4WEdy?=
 =?utf-8?B?YWNSZTZmOFpzNkZUcXY5L2hpYURGSHk3MC9VaCtsdE1OaGVWSmd6NVVRZDZU?=
 =?utf-8?B?U3o4UFgwL1dJVlRIR0V5dzBqTCtmVlF5a0NML1lrWG83MkZoZDA1L0o5NlV1?=
 =?utf-8?B?QjRMa0ZYeE85QXNQbldRb29tT3F6ZzlxMFdiVTJscGxiTkV3Q2Nqdz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7444182-e50a-41f5-32c1-08da1870e9c0
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Apr 2022 08:30:46.2500 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: diwlxTwtPph4pu5cqgHZP5WJqx+sGh8i+HqeAH9HpV8Ny3SeI+pqWhDJTNIWhftV2mj1SYq59D/Qm9xetIq+Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6717
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
Cc: "S.J. Wang" <shengjiu.wang@nxp.com>,
 "amuel@sholland.org" <amuel@sholland.org>,
 "cai.huoqing@linux.dev" <cai.huoqing@linux.dev>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTmVpbCBBcm1zdHJv
bmcgPG5hcm1zdHJvbmdAYmF5bGlicmUuY29tPg0KPiBTZW50OiAyMDIy5bm0NOaciDbml6UgMTc6
MTcNCj4gVG86IFNhbmRvciBZdSA8c2FuZG9yLnl1QG54cC5jb20+OyBkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBhbmRyemVq
LmhhamRhQGludGVsLmNvbTsNCj4gcm9iZXJ0LmZvc3NAbGluYXJvLm9yZzsgTGF1cmVudC5waW5j
aGFydEBpZGVhc29uYm9hcmQuY29tOw0KPiBqb25hc0Brd2lib28uc2U7IGplcm5lai5za3JhYmVj
QGdtYWlsLmNvbQ0KPiBDYzogUy5KLiBXYW5nIDxzaGVuZ2ppdS53YW5nQG54cC5jb20+OyBjYWku
aHVvcWluZ0BsaW51eC5kZXY7DQo+IG1heGltZUBjZXJuby50ZWNoOyBoYXJyeS53ZW50bGFuZEBh
bWQuY29tOyBodmVya3VpbC1jaXNjb0B4czRhbGwubmw7DQo+IGFtdWVsQHNob2xsYW5kLm9yZw0K
PiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIIHYxIDIvNV0gZHJtOiBicmlkZ2U6IGR3X2hkbWk6
IGVuYWJsZSBvdmVyZmxvdw0KPiB3b3JrYXJvdW5kIGZvciB2Mi4xM2ENCj4gDQo+IENhdXRpb246
IEVYVCBFbWFpbA0KPiANCj4gSGksDQo+IA0KPiBPbiAwNi8wNC8yMDIyIDEwOjQ4LCBTYW5kb3Iu
eXVAbnhwLmNvbSB3cm90ZToNCj4gPiBGcm9tOiBTYW5kb3IgWXUgPFNhbmRvci55dUBueHAuY29t
Pg0KPiA+DQo+ID4gaU1YODY1IEhETUkgKHYyLjEzYSkgaGF2ZSBiZWVuIGlkZW50aWZpZWQgYXMg
bmVlZGluZyB0aGUgd29ya2Fyb3VuZC4NCj4gPiBUZXN0cyBzaG93IHRoYXQgb25lIGl0ZXJhdGlv
biBpcyBlbm91Z2guDQo+ID4NCj4gPiBXaXRob3V0IHRoZSB3b3JrYXJvdW5kLCBpTVg4NjUgSERN
SSBhdWRpbyBtYXkgbm90IHdvcmsgYWZ0ZXIgY2FibGUNCj4gPiBwbHVnb3V0L2luLCBiZWNhdXNl
IEhETUkgbW9kZSBpcyBub3QgcmVhbGx5IHNldCBpbiByZWdpc3Rlcg0KPiA+IEhETUlfRkNfSU5W
SURDT05GLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FuZG9yIFl1IDxTYW5kb3IueXVAbnhw
LmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHct
aGRtaS5jIHwgNyArKysrLS0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5
bm9wc3lzL2R3LWhkbWkuYw0KPiA+IGluZGV4IDRiZWZjMTA0ZDIyMC4uYjExNTc3ZGU0ODM2IDEw
MDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc3lub3BzeXMvZHctaGRtaS5j
DQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1oZG1pLmMNCj4g
PiBAQCAtMjA4Nyw5ICsyMDg3LDkgQEAgc3RhdGljIHZvaWQgZHdfaGRtaV9jbGVhcl9vdmVyZmxv
dyhzdHJ1Y3QNCj4gZHdfaGRtaSAqaGRtaSkNCj4gPiAgICAgICAgKg0KPiA+ICAgICAgICAqIFRo
ZSBudW1iZXIgb2YgaXRlcmF0aW9ucyBtYXR0ZXJzIGFuZCBkZXBlbmRzIG9uIHRoZSBIRE1JIFRY
DQo+IHJldmlzaW9uDQo+ID4gICAgICAgICogKGFuZCBwb3NzaWJseSBvbiB0aGUgcGxhdGZvcm0p
LiBTbyBmYXIgaS5NWDZRICh2MS4zMGEpLCBpLk1YNkRMDQo+ID4gLSAgICAgICogKHYxLjMxYSkg
YW5kIG11bHRpcGxlIEFsbHdpbm5lciBTb0NzICh2MS4zMmEpIGhhdmUgYmVlbg0KPiBpZGVudGlm
aWVkDQo+ID4gLSAgICAgICogYXMgbmVlZGluZyB0aGUgd29ya2Fyb3VuZCwgd2l0aCA0IGl0ZXJh
dGlvbnMgZm9yIHYxLjMwYSBhbmQgMQ0KPiA+IC0gICAgICAqIGl0ZXJhdGlvbiBmb3Igb3RoZXJz
Lg0KPiA+ICsgICAgICAqICh2MS4zMWEpLCBpTVg4NjUodjIuMTNhKSBhbmQgbXVsdGlwbGUgQWxs
d2lubmVyIFNvQ3MgKHYxLjMyYSkNCj4gPiArICAgICAgKiBoYXZlIGJlZW4gaWRlbnRpZmllZCBh
cyBuZWVkaW5nIHRoZSB3b3JrYXJvdW5kLA0KPiA+ICsgICAgICAqIHdpdGggNCBpdGVyYXRpb25z
IGZvciB2MS4zMGEgYW5kIDEgaXRlcmF0aW9uIGZvciBvdGhlcnMuDQo+ID4gICAgICAgICogVGhl
IEFtbG9naWMgTWVzb24gR1ggU29DcyAodjIuMDFhKSBoYXZlIGJlZW4gaWRlbnRpZmllZCBhcw0K
PiBuZWVkaW5nDQo+ID4gICAgICAgICogdGhlIHdvcmthcm91bmQgd2l0aCBhIHNpbmdsZSBpdGVy
YXRpb24uDQo+ID4gICAgICAgICogVGhlIFJvY2tjaGlwIFJLMzI4OCBTb0MgKHYyLjAwYSkgYW5k
IFJLMzMyOC9SSzMzOTkgU29Dcw0KPiA+ICh2Mi4xMWEpIGhhdmUgQEAgLTIxMDYsNiArMjEwNiw3
IEBAIHN0YXRpYyB2b2lkDQo+IGR3X2hkbWlfY2xlYXJfb3ZlcmZsb3coc3RydWN0IGR3X2hkbWkg
KmhkbWkpDQo+ID4gICAgICAgY2FzZSAweDIwMWE6DQo+ID4gICAgICAgY2FzZSAweDIxMWE6DQo+
ID4gICAgICAgY2FzZSAweDIxMmE6DQo+ID4gKyAgICAgY2FzZSAweDIxM2E6DQo+ID4gICAgICAg
ICAgICAgICBjb3VudCA9IDE7DQo+ID4gICAgICAgICAgICAgICBicmVhazsNCj4gDQo+IEF0IHNv
bWUgcG9pbnQgd2UgbXVzdCBjb25zaWRlciBvbmx5IHYxLjMwYSBuZWVkcyA0LCBhbmQgb3RoZXIg
bmVlZHMgMS4NCj4gDQo+IEl0IHdvdWxkIGJlIHNpbXBsZXIgdG8gcHV0IHRoZSAiY291bnQgPSAx
IiBpbiBhIGRlZmF1bHQgY2FzZS4NCj4gDQpBZ3JlZSwgSSB3aWxsIHB1dCB0aGUgImNvdW50ID0g
MSAiIHRvIGRlZmF1bHQgY2FzZS4NCj4gVGhlIGNvbW1lbnQgY2hhbmdlIGlzIHN0aWxsIHdlbGNv
bWUgc28gd2UgY2FuIHRyYWNrLg0KPiANCj4gVGhhbmtzLA0KPiBOZWlsDQo+IA0KPiA+ICAgICAg
IGRlZmF1bHQ6DQoNClRoYW5rcw0KU2FuZG9yDQoNCg==
