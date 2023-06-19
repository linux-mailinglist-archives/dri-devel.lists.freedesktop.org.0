Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F70734A74
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 05:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F132D10E079;
	Mon, 19 Jun 2023 03:10:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0d::612])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9009E10E079
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 03:10:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BF73GG6jZtj0pr0ooCSR9FcOCZCKgSHHioy8tK54LqGypfigQQkcJKiQON2LW9Xd3c1P4THrsbrCUzPTyD5/KctRJgVLr7LSBHk5YUm1moeVwlTbPtlO7GQ0zeH6Dur7r+k23QD3htvWwciNb9VbPBbHRWJ0xaw4g7EcqgQmLKOMdd87ZD4p6pob0tcw9IcI7mZEYHRhRF/hsQIvJM66uCuvyBQAy1OGiC+pd9rlICIvyNcDyJAEe4UNl/Ku8S29PhjrIPvQhCZfaTH30h6Z4v/NfLZREilZBHwzhRBMdP4DJStjdFW+FOoFjxJ1ZmaDVvH9Nv26Imhedxxq/JXdDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1BHfPTyo0LI9lvos3xxJjVM4Qm9FTFg6Yx9OTVL3Eew=;
 b=FgaUhNkhlrU2qUvFBcuFgOOfDyrxU49um7aq3sG9NDk6gM9qYZvOlm9WP7jANU9M7QR4R1aILeWuVwot/isPrUesmyHTpwMuYgm3EJ7ecUbNZcPhioAvZMQGkNMsn1+UKfAdE+x8iT2DuwvPK57i8rUqK8ExdsC6zq70DUdQAlV3jYg4lSceZJTIuEXfwEFQlmfVUxv++R6n4iJKqCWGle52NdipBrvwDo7V91G1uLVANuQONfGhnUspXP3RD3eTInJJDjkniuNEtS4XHsctJw7wGER4qqlb5DmCaNBW6+1XrCWZJhgi99YBnK80LRvgVPcdcO2PX2ATkHgEJCunVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1BHfPTyo0LI9lvos3xxJjVM4Qm9FTFg6Yx9OTVL3Eew=;
 b=aqXIN+Qk284KEIcSymu0J2+7U/VKoxVg3Mf9GCUcufF73xXeYtkuCT4/k+bqC/4lQ37K7IkcieDHUTgXj6gm8N4IHicRF+IFlCxPTZPvWitYwIRNfFI5di6pG8ZQu1HTvbaWNU7bXZKJWgHA1yReelaLbmCKizMdFpqRTG1VW1U=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB8689.eurprd04.prod.outlook.com (2603:10a6:20b:428::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 03:10:40 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 03:10:40 +0000
From: Sandor Yu <sandor.yu@nxp.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>, "jernej.skrabec@gmail.com"
 <jernej.skrabec@gmail.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "shawnguo@kernel.org"
 <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "vkoul@kernel.org"
 <vkoul@kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-phy@lists.infradead.org"
 <linux-phy@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v6 6/8] dt-bindings: phy: Add Freescale iMX8MQ
 DP and HDMI PHY
Thread-Topic: [EXT] Re: [PATCH v6 6/8] dt-bindings: phy: Add Freescale iMX8MQ
 DP and HDMI PHY
Thread-Index: AQHZnyaZM5O4nPkWf0qGgBnvaagP0q+NLTuAgARIoVA=
Date: Mon, 19 Jun 2023 03:10:40 +0000
Message-ID: <PAXPR04MB944896514084D079970CA829F45FA@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <2ccb849de420ced29b3f9be38e12664e1919b631.1686729444.git.Sandor.yu@nxp.com>
 <5009063.iIbC2pHGDl@steina-w>
In-Reply-To: <5009063.iIbC2pHGDl@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AS8PR04MB8689:EE_
x-ms-office365-filtering-correlation-id: 752afe74-2244-4265-a3ef-08db7072c334
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: czK4SblQV5x+BVZnmIT82/nrfAFdNVt4aducta3CcDX/XKBaJsMziQRcy9B+0/qKOCKNZAFHIRBthex2xCvhDL0C6soz2n7YuOc7FgMxwATZqqoPctpKH7jUG/Qr8T6EEr/N418PmHlKUVbBIfq4jMd2L7t4mjjRpD/t76EbG4h2q4Soz0olKvNt/suEz/KND0djJWiIwseeUsjyxQwTlHMTtsxUVgGOuvGT7kVfrn+O+hfbqyPRAOnjKTbZRPIrKu8sgJgCkPMBMcrHb2KaOtBG3HBdusNv6ji6nxvh3Sgz7eYNawVIBb1IFQdosb7eS3u1aGxq/Puu+1HWK+27v8De4q1Xluft6vjvKDz/ETT2MLrd2NsTo+YXgdOpgOmSDlIOxjyY9fOX/BxQTJWyPzypSsHNzyYiY74FqedFC6sFFGxcj3ppNAnHw9YJiA+wuuyJ31VPfFyqmBWQjf80gaSqF9rgsgiRIq9Ccd0fgn2mUjJr7Ker6q8wt4K6CC5Vsu87X3BQxebuiGqjpydRpLYdE3v5A1MnJhh6UU6F638iRiX0bJsr3EOYcPxgHsnrXS3PFJBs755gBIkXc2X/ieFxZT30BF4hQhECV+lzgUUCMgJTkL86oSrX6kU++EbPrRtuLLCYDqmZfVIz5ilQpQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199021)(2906002)(41300700001)(44832011)(7416002)(52536014)(5660300002)(38070700005)(8676002)(8936002)(33656002)(55016003)(86362001)(966005)(478600001)(45080400002)(71200400001)(7696005)(83380400001)(66574015)(186003)(26005)(6506007)(53546011)(9686003)(54906003)(110136005)(316002)(38100700002)(122000001)(921005)(64756008)(66446008)(66476007)(66556008)(4326008)(76116006)(66946007)(32563001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Q2tLMmRxQnpMZXZ3bWpBOHd0d1dDTW56d1dXOWdyU1RScGdoYmRpeGFuNVBl?=
 =?utf-8?B?Y2M5Z2FEN1IwMlJvTTY2R0Y4Zk9XR0tQblVhSnFNc3JEdXVhUWs5NnRqZ3g1?=
 =?utf-8?B?STdscDhSbzRTNW0wUzVRelk5ajllbXBjSFBrblN2TFUyVzJaWnVFUy9Bc0gz?=
 =?utf-8?B?cG4yMXRYNlhscEJDNElrL1BZUGlzaWpvN1ZnV1BZLzdoQ3ZRRmFEWXM0V1d2?=
 =?utf-8?B?WUJoTUp1Vm9vZnUrdUlxbUFPQ3ZtT2lGVWYxQ1Voa1hYTWdkekhjY2RaK0NI?=
 =?utf-8?B?TytmYVRIU0tsS2RGd2JSTGJ2MytFNU1IMWpuMVdBcEVqUERnUndpSis2YXI2?=
 =?utf-8?B?ZFZwcURRSG0zWDQ4MFpjUmhlTmdNOVNvaWg3b0x6QVRNZTNObEhBNkRDRnk5?=
 =?utf-8?B?cmtiOFlEN1VkdVJLb1lhUDIwOXg3c0VycUVpRWhkdUxBU3RvR1h5SXI5eGZv?=
 =?utf-8?B?MDl4SUxrN1N6d0NUZTNudGRjbXB2N0RPc1Rob2NtWExmdmNtZ2JDYUtGNkZl?=
 =?utf-8?B?WE16UzlYenRhOERYbUUyNlFCdnNGbHRVd1VSYlJjeTVDR2xRODcxeURTVzdk?=
 =?utf-8?B?OStVeGFnN1ZiaTc4YUFqM29zZkRtWDFHV3RyR2FQdHlpbCsrSmNhZmRjSFBl?=
 =?utf-8?B?c29wTzJwZ3FNaFBtdVduUHNaSjdjS0xrTmpNWXA2RXp1dS96WllNR00rNTRP?=
 =?utf-8?B?ak1FWFMxZXE0SGdaVkxZcHdZU0F3a3RxeFZDdEVWQWV0VEJ3dTFHajVTTi9o?=
 =?utf-8?B?OWQ0QjVEQ3ozamtBYXhLYzY5bVh4cGlBaWU5bTFiYUJ1RFlHWEt1OXBRU1JM?=
 =?utf-8?B?Wk9aVjZWVkcwYXF3Y1dUK2xESGY2anhQdmExc05nc3NoZGRMam5CUGo2MEs2?=
 =?utf-8?B?T3hXbEUyNTlkMjFJZUlLOVQzbXlnamwwRkNOYVI1citsVjdyZWFEMGQrcTh1?=
 =?utf-8?B?NndXdjFDaUcxYXYxdzk5b0lkNW5PTkNjZ0ttY0t2UU9XQTIrQW5taldab2hW?=
 =?utf-8?B?Qzh1eUMwVlR0S2VJWHcyRkkyb1M3NForb3REZHl1L282cHFLYlREOFBDdW5V?=
 =?utf-8?B?cU5sdmM1cVZxVStCbDQzTUh3UWlkWGFrem81R3l4SGNpZVYwc0t6RmR5YkxT?=
 =?utf-8?B?VytRT2R1TGRTaTA2Nmh1cDIrRHhPaXNLUUs1b3RDMHFFR1BrcjMyUWpFdjIr?=
 =?utf-8?B?OHE0M1lGVjJ3dHZzdnlOcHJ1UXNVaGtQNmFCRXFaWTU3WjBOeXB5UC9kYnIv?=
 =?utf-8?B?b3NFbkl2V0I0aWIvc0FieENCREEzQmdDSTI0WUZJY3dTdWNoaDExbzNmWDBX?=
 =?utf-8?B?VWh2N3YveXRnWERMYzRjOVg5OG5iYnBxQ2Jlem5FdkgvdUFvSFRkQ0ZqNnpC?=
 =?utf-8?B?OEc3Y3hLT2MxakwzSkNOM1p6am5MRkVRQ2RYdmFyeEx1bzhDN1VlczBJRURo?=
 =?utf-8?B?ZmhZWjRJZUhDZzNKYXR5aVNKZzRkNDR1NXJrd0tZTEo5c2w4cWxwVmhVbzBx?=
 =?utf-8?B?UmlzU1RDa0E4VXg3SzFoYWNGWnFhKzZpTmJvVVhjQWljbFdUY3RzK0k0ZHdJ?=
 =?utf-8?B?SUNFejAzZWNNNUpYcTRkcitaS0xDamc3bjVFVUdYaHUxUzI0TS8yTTgwOXhy?=
 =?utf-8?B?ZjJsaVNMQzlVTXBuTVA4L2w1ZXRtV1ZDOWtPOFo1MnQ3TnBaV2dOY2E2czRW?=
 =?utf-8?B?Z0tCMlZvRUN2RlpRVXJ1dURucVpaYlpBRWhXSFlkZ01INUdUWXBlWWhZV3Vt?=
 =?utf-8?B?bjBHN2oxS2p2dFBtWTZPL056RGpyaTBSNkRuSE9xc3l0V2ZMbWRDc1d3Mi93?=
 =?utf-8?B?RktqdERVeUhXYlNsRjBOSm1tdW1iSXVIM2FPQjRkVERkR0R0bThBM1lSNTBW?=
 =?utf-8?B?YjZvZG5uT3FyaEN4dVdRV05GSzJucW42RXo3WS8vOG4xS21DbW9PT0ZoaDNr?=
 =?utf-8?B?MGNLQlEyam5CSlcvN2JEcVdEa3I5QkNRaXZ1TW1SOEdTaGVYUEJqblZUWk15?=
 =?utf-8?B?NnhvT2IzdFV2Z2djRnBNcUk4Y2E0SGh0M1FKUXZEQ1Z1VC9iZTJwNkFGeWJB?=
 =?utf-8?B?eGdKdXU4ZHE1REtubXpJaHY2TEltNnBwMXVlSURVVTVQRG96RDFoemd4QXJ0?=
 =?utf-8?Q?Tbjs=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 752afe74-2244-4265-a3ef-08db7072c334
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2023 03:10:40.6398 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MpFX0YHTcU5BmmNDC98J5rKnFmIqnTLAn5Z1II3Y+1gWAHnpOhnKlacV3dFyqgK3NtLuxnF/S1emx13CdROggw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8689
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
Cc: Oliver Brown <oliver.brown@nxp.com>, dl-linux-imx <linux-imx@nxp.com>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQWxleGFuZGVyLA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMsDQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQWxleGFuZGVyIFN0ZWluIDxhbGV4YW5kZXIuc3Rl
aW5AZXcudHEtZ3JvdXAuY29tPg0KPiBTZW50OiAyMDIz5bm0NuaciDE25pelIDE3OjM1DQo+IFRv
OiBhbmRyemVqLmhhamRhQGludGVsLmNvbTsgbmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZzsNCj4g
cm9iZXJ0LmZvc3NAbGluYXJvLm9yZzsgTGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29t
Ow0KPiBqb25hc0Brd2lib28uc2U7IGplcm5lai5za3JhYmVjQGdtYWlsLmNvbTsgYWlybGllZEBn
bWFpbC5jb207DQo+IGRhbmllbEBmZndsbC5jaDsgcm9iaCtkdEBrZXJuZWwub3JnOyBrcnp5c3p0
b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7DQo+IHNoYXduZ3VvQGtlcm5lbC5vcmc7IHMuaGF1
ZXJAcGVuZ3V0cm9uaXguZGU7IGZlc3RldmFtQGdtYWlsLmNvbTsNCj4gdmtvdWxAa2VybmVsLm9y
ZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj4gZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmc7IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZzsNCj4gbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtcGh5QGxpc3RzLmluZnJhZGVhZC5vcmcNCj4g
Q2M6IE9saXZlciBCcm93biA8b2xpdmVyLmJyb3duQG54cC5jb20+OyBTYW5kb3IgWXUgPHNhbmRv
ci55dUBueHAuY29tPjsNCj4gZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IGtlcm5l
bEBwZW5ndXRyb25peC5kZTsgU2FuZG9yIFl1DQo+IDxzYW5kb3IueXVAbnhwLmNvbT4NCj4gU3Vi
amVjdDogW0VYVF0gUmU6IFtQQVRDSCB2NiA2LzhdIGR0LWJpbmRpbmdzOiBwaHk6IEFkZCBGcmVl
c2NhbGUgaU1YOE1RIERQDQo+IGFuZCBIRE1JIFBIWQ0KPg0KPiBDYXV0aW9uOiBUaGlzIGlzIGFu
IGV4dGVybmFsIGVtYWlsLiBQbGVhc2UgdGFrZSBjYXJlIHdoZW4gY2xpY2tpbmcgbGlua3Mgb3IN
Cj4gb3BlbmluZyBhdHRhY2htZW50cy4gV2hlbiBpbiBkb3VidCwgcmVwb3J0IHRoZSBtZXNzYWdl
IHVzaW5nIHRoZSAnUmVwb3J0DQo+IHRoaXMgZW1haWwnIGJ1dHRvbg0KPg0KPg0KPiBIaSBTYW5k
b3IsDQo+DQo+IEFtIERvbm5lcnN0YWcsIDE1LiBKdW5pIDIwMjMsIDAzOjM4OjE2IENFU1Qgc2No
cmllYiBTYW5kb3IgWXU6DQo+ID4gQWRkIGJpbmRpbmdzIGZvciBGcmVlc2NhbGUgaU1YOE1RIERQ
IGFuZCBIRE1JIFBIWS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNhbmRvciBZdSA8U2FuZG9y
Lnl1QG54cC5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9waHkvZnNsLGlteDhtcS1k
cC1oZG1pLXBoeS55YW1sICB8IDUzDQo+ID4gKysrKysrKysrKysrKysrKysrKw0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKQ0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4g
PiBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGh5L2ZzbCxpbXg4bXEtZHAtaGRt
aS1waHkueWFtbA0KPiA+DQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3BoeS9mc2wsaW14OG1xLWRwLWhkbWktcGh5LnlhbWwNCj4gPiBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waHkvZnNsLGlteDhtcS1kcC1oZG1pLXBo
eS55YW1sDQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQgaW5kZXggMDAwMDAwMDAwMDAwLi45MTdm
MTEzNTAzZGMNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrDQo+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BoeS9mc2wsaW14OG1xLWRwLWhkbWktcGh5LnlhbQ0KPiA+ICsr
KyBsDQo+ID4gQEAgLTAsMCArMSw1MyBAQA0KPiA+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVy
OiAoR1BMLTIuMCBPUiBCU0QtMi1DbGF1c2UpICVZQU1MIDEuMg0KPiA+ICstLS0NCj4gPiArJGlk
Og0KPiA+ICtodHRwOi8vZGV2aS8NCj4gPg0KPiArY2V0cmVlLm9yZyUyRnNjaGVtYXMlMkZwaHkl
MkZmc2wlMkNpbXg4bXEtZHAtaGRtaS1waHkueWFtbCUyMyZkDQo+IGF0YT0wNQ0KPiA+DQo+ICsl
N0MwMSU3Q1NhbmRvci55dSU0MG54cC5jb20lN0NmMmQ0ZTVlYTk5ZmE0ZjU3NzZiZjA4ZGI2ZTRj
ZTdiYQ0KPiAlN0M2ODZlDQo+ID4NCj4gK2ExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0Mw
JTdDMCU3QzYzODIyNTA0ODgxNzc5MjE3NiU3Qw0KPiBVbmtub3duJTcNCj4gPg0KPiArQ1RXRnBi
R1pzYjNkOGV5SldJam9pTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFX
DQo+IHdpTENKWA0KPiA+DQo+ICtWQ0k2TW4wJTNEJTdDMzAwMCU3QyU3QyU3QyZzZGF0YT1heVlB
MHJheURSMncxTERnVTUzVnRDaXR3DQo+IE1IOVBub2JsWDJrDQo+ID4gK0poYnU2R3MlM0QmcmVz
ZXJ2ZWQ9MA0KPiA+ICskc2NoZW1hOg0KPiA+ICtodHRwOi8vZGV2aS8NCj4gPg0KPiArY2V0cmVl
Lm9yZyUyRm1ldGEtc2NoZW1hcyUyRmNvcmUueWFtbCUyMyZkYXRhPTA1JTdDMDElN0NTYW5kb3Iu
DQo+IHl1JTQwbg0KPiA+DQo+ICt4cC5jb20lN0NmMmQ0ZTVlYTk5ZmE0ZjU3NzZiZjA4ZGI2ZTRj
ZTdiYSU3QzY4NmVhMWQzYmMyYjRjNmZhOTINCj4gY2Q5OWM1DQo+ID4NCj4gK2MzMDE2MzUlN0Mw
JTdDMCU3QzYzODIyNTA0ODgxNzc5MjE3NiU3Q1Vua25vd24lN0NUV0ZwYkdacw0KPiBiM2Q4ZXlK
V0lqb2kNCj4gPg0KPiArTUM0d0xqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFX
d2lMQ0pYVkNJNk1uMCUzRCU3QzMNCj4gMDAwJTdDJQ0KPiA+DQo+ICs3QyU3QyZzZGF0YT1EYWdR
dHJJYmxHRWszVDFtYW1TbUkyMDEwU1JzenFoSXBKNHBpWHkzTDRNJTNEJnJlDQo+IHNlcnZlZD0w
DQo+ID4gKw0KPiA+ICt0aXRsZTogQ2FkZW5jZSBIRFAtVFggRFAvSERNSSBQSFkgZm9yIEZyZWVz
Y2FsZSBpLk1YOE1RIFNvQw0KPiA+ICsNCj4gPiArbWFpbnRhaW5lcnM6DQo+ID4gKyAgLSBTYW5k
b3IgWXUgPHNhbmRvci55dUBueHAuY29tPg0KPiA+ICsNCj4gPiArcHJvcGVydGllczoNCj4gPiAr
ICBjb21wYXRpYmxlOg0KPiA+ICsgICAgZW51bToNCj4gPiArICAgICAgLSBmc2wsaW14OG1xLWRw
LXBoeQ0KPiA+ICsgICAgICAtIGZzbCxpbXg4bXEtaGRtaS1waHkNCj4NCj4gSG93IGlzIGl0IGlu
dGVuZGVkIHRvIHNlbGVjdCBEUCBvciBIRE1JPyBFLmcuIHByb3ZpZGUgYSBzaW5nbGUgZGVmYXVs
dCBkcC1waHkNCj4gbm9kZSBpbiBpbXg4bXEuZHRzaSBhbmQgY2hhbmdlIHRoZSBjb21wYXRpYmxl
IHRvIEhETUkgb24gYm9hcmQtbGV2ZWw/DQo+DQpUaGUgUEhZIGRyaXZlciBzZWxlY3Qgc2hvdWxk
IGFsaWduIHdpdGggSERNSS9EUCBkcml2ZXIgYmFzZSBvbiBib2FyZCB0eXBlLg0KRm9yIEhETUkg
Ym9hcmQ6ICBmc2wsaW14OG1xLWhkbWktcGh5ICsgZnNsLGlteDhtcS1taGRwODUwMS1oZG1pDQpG
b3IgRFAgYm9hcmQ6ICAgICBmc2wsaW14OG1xLWRwLXBoeSArIGZzbCxpbXg4bXEtbWhkcDg1MDEt
ZHANCg0KQi5SDQpTYW5kb3INCg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEFsZXhhbmRlcg0KPg0KPiA+
ICsNCj4gPiArICByZWc6DQo+ID4gKyAgICBtYXhJdGVtczogMQ0KPiA+ICsNCj4gPiArICBjbG9j
a3M6DQo+ID4gKyAgICBpdGVtczoNCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogUEhZIHJlZmVy
ZW5jZSBjbG9jay4NCj4gPiArICAgICAgLSBkZXNjcmlwdGlvbjogQVBCIGNsb2NrLg0KPiA+ICsN
Cj4gPiArICBjbG9jay1uYW1lczoNCj4gPiArICAgIGl0ZW1zOg0KPiA+ICsgICAgICAtIGNvbnN0
OiByZWYNCj4gPiArICAgICAgLSBjb25zdDogYXBiDQo+ID4gKw0KPiA+ICsgICIjcGh5LWNlbGxz
IjoNCj4gPiArICAgIGNvbnN0OiAwDQo+ID4gKw0KPiA+ICtyZXF1aXJlZDoNCj4gPiArICAtIGNv
bXBhdGlibGUNCj4gPiArICAtIHJlZw0KPiA+ICsgIC0gY2xvY2tzDQo+ID4gKyAgLSBjbG9jay1u
YW1lcw0KPiA+ICsgIC0gIiNwaHktY2VsbHMiDQo+ID4gKw0KPiA+ICthZGRpdGlvbmFsUHJvcGVy
dGllczogZmFsc2UNCj4gPiArDQo+ID4gK2V4YW1wbGVzOg0KPiA+ICsgIC0gfA0KPiA+ICsgICAg
I2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL2lteDhtcS1jbG9jay5oPg0KPiA+ICsgICAgI2lu
Y2x1ZGUgPGR0LWJpbmRpbmdzL3BoeS9waHkuaD4NCj4gPiArICAgIGRwX3BoeTogcGh5QDMyYzAw
MDAwIHsNCj4gPiArICAgICAgICBjb21wYXRpYmxlID0gImZzbCxpbXg4bXEtZHAtcGh5IjsNCj4g
PiArICAgICAgICByZWcgPSA8MHgzMmMwMDAwMCAweDEwMDAwMD47DQo+ID4gKyAgICAgICAgI3Bo
eS1jZWxscyA9IDwwPjsNCj4gPiArICAgICAgICBjbG9ja3MgPSA8JmhkbWlfcGh5XzI3bT4sIDwm
Y2xrDQo+IElNWDhNUV9DTEtfRElTUF9BUEJfUk9PVD47DQo+ID4gKyAgICAgICAgY2xvY2stbmFt
ZXMgPSAicmVmIiwgImFwYiI7DQo+ID4gKyAgICB9Ow0KPg0KPg0KPiAtLQ0KPiBUUS1TeXN0ZW1z
IEdtYkggfCBNw7xobHN0cmHDn2UgMiwgR3V0IERlbGxpbmcgfCA4MjIyOSBTZWVmZWxkLCBHZXJt
YW55DQo+IEFtdHNnZXJpY2h0IE3DvG5jaGVuLCBIUkIgMTA1MDE4DQo+IEdlc2Now6RmdHNmw7xo
cmVyOiBEZXRsZWYgU2NobmVpZGVyLCBSw7xkaWdlciBTdGFobCwgU3RlZmFuIFNjaG5laWRlcg0K
PiBodHRwOi8vd3d3LnRxLw0KPiAtZ3JvdXAuY29tJTJGJmRhdGE9MDUlN0MwMSU3Q1NhbmRvci55
dSU0MG54cC5jb20lN0NmMmQ0ZTVlYTk5ZmENCj4gNGY1Nzc2YmYwOGRiNmU0Y2U3YmElN0M2ODZl
YTFkM2JjMmI0YzZmYTkyY2Q5OWM1YzMwMTYzNSU3QzAlN0MNCj4gMCU3QzYzODIyNTA0ODgxNzc5
MjE3NiU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHcNCj4gTGpBd01EQWlMQ0pR
SWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNEJTdDMzAwMCU3Qw0KPiAl
N0MlN0Mmc2RhdGE9NnVpaDg0WEJ5UzZhWDUxOXo3bDUwYW1abDJYblBJTVNnZ3lmU0Q0eGQ0TSUz
RCZyZQ0KPiBzZXJ2ZWQ9MA0KPg0KDQo=
