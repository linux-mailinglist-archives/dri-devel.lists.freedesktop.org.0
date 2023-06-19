Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 331FE734A7A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 05:11:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B45A10E174;
	Mon, 19 Jun 2023 03:11:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2088.outbound.protection.outlook.com [40.107.7.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F52810E18B
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 03:11:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mXBj33S2KmKEgiUATEzj+eMQjbPNvlcLD0ItozRWnn1d9cXIdUadEK8oHGlIQHXKcNrOcuZ/hSUDovvn4shzlXP+LLC3okNja70+Ol3GW+LfBsDVDyQ8pl8vSOVbxkvbV4s1jWOj1jWTD6MGQapdiaie4DyfZKSnULd8tsbV4bFB/afg/ue52G360EzSRT1odKV++wv6sDUNtAVyx2P3cDRileW7PQyDWoxWh9V2cNAu8QiZeFmwi/A7/yS33FOq4EzUChntqJQuKrGN8uW78GOWYDngBu2R8G7m6b7F2YQv2ttl5bsTCs9wRwNvHWRnIYaChYDaFul4b65DdLupLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XICGxJN5JqsA95qH4568IS9jd2oFCdGcTvBMB/DuwCM=;
 b=fw3b31M29W8DKrG7zjxAX78fLQn3kReyvVO0gJNDX7Jz+3xMOE08tKQ35QTUwvKLVgXWMG7hs+TuC/X8ewYJ6j38DgfoCxNZX+b3iTM5VI8+Uqktkut9UGjp1KFCfM53A6RI4/XUXmG4Gc61oNl1mCyceGrVAFpiVnH6yrwA4rFL8X3eyEhydK4Mm/QvyLApFqPuCJ37vFVGn3HYhYTXLUoH01b5q4vWzc5MjOL9kZZtBLhNfbwYqZfeJ5PD3C/6EpmlGpHj8BTTlgt5Olns1xPePqV4aaOLYqZsXVkJy22yCDM9yZEUpTowN6ONbvVCxvt3Exy+Z8U3NBNgaLOYOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XICGxJN5JqsA95qH4568IS9jd2oFCdGcTvBMB/DuwCM=;
 b=N11NuaJFqOboFONf0sLzXa7trC9eRuTW0ltT2rXR8LmhP3FlA2uwXq+JsW/gQxRin/8GSB9yGEwYW8emQdLpesk7ZBTiyb+BSC9nnuOs0s3pzYfo4Vg7lVrt3z73gmXn6E1PFU305o0yka0lQxsHUDnJ0v+QCLM7T+vHFkxQEiY=
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB8689.eurprd04.prod.outlook.com (2603:10a6:20b:428::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 03:11:02 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6500.036; Mon, 19 Jun 2023
 03:11:02 +0000
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
Subject: RE: [EXT] Re: [PATCH v6 5/8] drm: bridge: Cadence: Add MHDP8501 HDMI
 driver
Thread-Topic: [EXT] Re: [PATCH v6 5/8] drm: bridge: Cadence: Add MHDP8501 HDMI
 driver
Thread-Index: AQHZnyaYP49pnnNJn0eIcxtD11iofq+NK+2AgARFb5A=
Date: Mon, 19 Jun 2023 03:11:02 +0000
Message-ID: <PAXPR04MB94485237A1921466463DD691F45FA@PAXPR04MB9448.eurprd04.prod.outlook.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
 <ee0982418cc2e996b1f7889375b1a5138fb38a11.1686729444.git.Sandor.yu@nxp.com>
 <11795277.nUPlyArG6x@steina-w>
In-Reply-To: <11795277.nUPlyArG6x@steina-w>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9448:EE_|AS8PR04MB8689:EE_
x-ms-office365-filtering-correlation-id: 9146779a-739d-4e1e-04da-08db7072d045
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +T2JCv6/ZaN7TDJy86Yb29qzTIz/Cq4Aw5S+phTnMiUJJk4QMYz2YW1ellHv+tImF3eLuhI1J4f8AioF/A6Yljqb3YwQfTuK6mw8IGlEpauHg1tGxvrVd5g3CqT3mwAX5Ct6FQsl4MC4Drr0KnvBhGmeStHw1EzPCxUcYeREALlW1dueRs4pSbk+279A1RVRyg00Xv7tb6U1M9CGaH5s6ui3Wd6hbYIrT5Q1LxKwocfraEbNnQd4oK+eOvT1K8zotnnKgxn12EmGo6GLStJtEoZAu/NZ+rzHcXcjxaYVzc/zaakvSC7e5nKnQfHCEk+0pq7GbqFqtcDjbjjQLHKFyHsRu21igB078u9b1fBOZsDZqyWqpa6FtEKOqYbO1+7tFcTAlnNdRxejgxysMNqNaD5vu1WjVngL03/ciWX5BqbRP/dnJnxIbLbW79IZt9jD1imFweDBJpv63BDMkL0+v9o8kHeUN9U0zaK6jp+d0jPZIxsvDFxJKdAArtTfb0CQLxEo8izINAkbV8kECzRBzrCORL153H6Wmd8b85qRAs+QGEjXrpxa3OjiaDbapYG9XptxaSggbzufyWd7bWcjd4zhk9OSWOIWYfagpP7IoajViLkxbLNQU+f2yJHN+Pmx
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199021)(2906002)(41300700001)(44832011)(7416002)(52536014)(5660300002)(38070700005)(8676002)(8936002)(33656002)(55016003)(86362001)(966005)(478600001)(45080400002)(71200400001)(7696005)(83380400001)(66574015)(186003)(26005)(6506007)(53546011)(9686003)(54906003)(110136005)(316002)(38100700002)(122000001)(921005)(64756008)(66446008)(66476007)(66556008)(4326008)(76116006)(66946007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Wk41OWdUbHVxTHhtc09MK3dwNUtTN0p6bExBaVM0TzZYQ3Y1M3VGOTh1WVpM?=
 =?utf-8?B?NnBLSVJWU1AzQXhLZTJtQm1wVHNLM3hWbGUwNVgxWGROSnJQSVJnYzIvbFly?=
 =?utf-8?B?U1U1TEJUNE1IL3NPQzlXRk5xUlQzMGliWDJqbVduNEVRMytuaXZnWWhnUity?=
 =?utf-8?B?ODFHeFZ0ZFpuNXpCa0ZUdEhkMGU0L0ZzcDd3NVFqdERlSEZTc0cra3M1UWhO?=
 =?utf-8?B?MDZRWXN4cEtoVVRYMkowLzJ5MUJLWE5WUnMrakpidWZRSExCR0s1b1poSTdP?=
 =?utf-8?B?NE0xVTNYOW9QN1VmbnFqbklObGVDM0tJNWEydjM1Y3pEbG9tVnZIVTNXZnFz?=
 =?utf-8?B?TEFLdHlGd0psb0U0Wk8xY1psS3FJaW5qL01jV2lYd3JuZDJlK2t6L0JKUHFY?=
 =?utf-8?B?dkkvWXFTd1NYRzZ0Tmd4VmNOMHE3RmVCbTE0TDdvUU5xUnMvb3RSb2c1ZjIr?=
 =?utf-8?B?dW9yQW96OWVISHF0VHVobHN3ZDVPdVpRbWRzaUx6ejYrQnJXWUlZbjJwSlRZ?=
 =?utf-8?B?bkZMN3hOL2NqU0VQNFFYeStuSzBtRXA3citYZHUrM3UwUVVmbUdySVZCMkpo?=
 =?utf-8?B?dDM3a01sWmY1VU1xMTlDVzhGVDNyQmFjUnJPYkI3dVYrS1p2V0ZDeHhMRkZw?=
 =?utf-8?B?LzZQTVJJa3NxN21sUVVQZVVHbU04Q1MvQkZRZ0JpUEc4NzZuUklNcEs0T1ZG?=
 =?utf-8?B?b1RRMjRmdjF5S1JBd3pXRUl1VnVoTlpLcjRMWmRnOEZTc2QrSlR2bzYvbkpq?=
 =?utf-8?B?UjdsOG9PVmZiN3RlVDlFckVOQ3JlRHRZTUVVaVpqbUM5V3llRlJEekJLUVM5?=
 =?utf-8?B?WVE5ZTVMZ0dmS0Y2UUVRQ0h4aHJzTDhxczN0OVU4WnRvQU4yK055dFd0NXFx?=
 =?utf-8?B?SmZ4TEZZVWt6cEtoQnp2VUFyZGRTZmo1UlZuQWNqekdoVDFLOTRibnBmQ0o3?=
 =?utf-8?B?ZkFacGZVZHhhcitNckZHRFBQQmVFMUZsYjhGc2d2bWJsRk5RaXBVQzFuZzBF?=
 =?utf-8?B?NmhuTldUYmxBY085Y3p4TUU0VFQvdjlrSFlZNm5LZ2tPdEZtZDhGUVd3SURm?=
 =?utf-8?B?Qkw4WXVaNjQ5cWEyTnhVMldSaTE0M0NkK3BFVHRpNFhLK2NHdXo3bDhJc1lQ?=
 =?utf-8?B?ZmZrdTNsY3NTV0pWR1lQVndzd2FRS3VzQmd2ZUxNR0VVMTZuK09uMCtod2xh?=
 =?utf-8?B?WEs2ZDdrc2l2aGx1VXVzL3dwVG9EdXlFMTBieWkra3hRT251SnM5cEhYUmFk?=
 =?utf-8?B?YnprTFlDejZuaWZQdFQ4NmM0N3ZUVW9ITUMzZklLVS9xdElZOVRRZ0xMZEls?=
 =?utf-8?B?d0o5MUVxdXBvZUhqYXJZYzg4OWpQS0wwZys2M0dsWlJGZEhUVk16TnhwRUhq?=
 =?utf-8?B?WXZYY2Z3cGp4LzZBSDNkNmRLUXpaSVlYWXZ6ZnZvSno2eEpBWFBWc3k5cE5Z?=
 =?utf-8?B?ekxVNHVrc1lpdUZsT0dzRnRxT2NMQWMwZDRlbVlYMHNNbmhkd3FtMGR5cmJI?=
 =?utf-8?B?OExwaGNEbXQyWldSR2l3M3JEclZHQ2lDZjFvL054b0NQNVBsZ0c5KzFjc1Uy?=
 =?utf-8?B?RVA3NUdrWVViZnhqNkIzSms3ZUVRNjJGcmVsNVBLbjEzQ1ZrcWVMU1ZBanor?=
 =?utf-8?B?NlBIQyt3NCtQUkpNOTU2aXRXaVpEQUh2Q0EvcFRGWlRDUG5LUDdpTjBNUUlz?=
 =?utf-8?B?Mmp5Z1ptbFIyeHB5NnNuaGdQM3F0NHlIWnZCMTlyWnBNZ3NRM3JlL09FK2tL?=
 =?utf-8?B?U2dxangyNmtpU0FsTXJCMjY5QVJobkpYVTVwaUh2d1l6VVdMWFpSeTllL2dx?=
 =?utf-8?B?a1RnNlFzZ2JPMnFvcXgyUkZ4ejBQVEVXQ0x3UjluOWRDKzdKN1FRb1lFbS90?=
 =?utf-8?B?aGRNZFlkWC9TZXFLM0RSd0R4clZDaHY0VzhzeWE5NnlCVGlLWkhmUzVtTWVq?=
 =?utf-8?B?ODJNUDRCSHJmMnMvQlE2UWFMbDlva3dtNUtnU3RqVmpYQ3FmZ0NBWmU0YlNs?=
 =?utf-8?B?QVNsUC9BMXBWTDVVTFlodWREaWRvVkllNmZyWFBVckVjTlJ3SHl3d2RTU1o1?=
 =?utf-8?B?MlZGanUyOXRvNzZjREZrSDFKbks4MGtxdW5LUTNMcUdCWG10UUE3ZFcybU8z?=
 =?utf-8?Q?eHRQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9146779a-739d-4e1e-04da-08db7072d045
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2023 03:11:02.5218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhRLtHxxRn1UnrKV2kgLxjZrx1VKgrbIPswxD7Ahd6/r1iZr+g8cV0V9D+/zFLNthlXUp6AYwUAVc2l4duFjYQ==
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
aW5AZXcudHEtZ3JvdXAuY29tPg0KPiBTZW50OiAyMDIz5bm0NuaciDE25pelIDE3OjMwDQo+IFRv
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
amVjdDogW0VYVF0gUmU6IFtQQVRDSCB2NiA1LzhdIGRybTogYnJpZGdlOiBDYWRlbmNlOiBBZGQg
TUhEUDg1MDENCj4gSERNSSBkcml2ZXINCj4NCj4gQ2F1dGlvbjogVGhpcyBpcyBhbiBleHRlcm5h
bCBlbWFpbC4gUGxlYXNlIHRha2UgY2FyZSB3aGVuIGNsaWNraW5nIGxpbmtzIG9yDQo+IG9wZW5p
bmcgYXR0YWNobWVudHMuIFdoZW4gaW4gZG91YnQsIHJlcG9ydCB0aGUgbWVzc2FnZSB1c2luZyB0
aGUgJ1JlcG9ydA0KPiB0aGlzIGVtYWlsJyBidXR0b24NCj4NCj4NCj4gSGkgU2FuZG9yLA0KPg0K
PiB0aGFua3MgZm9yIHNlbmRpbmcgYSBuZXcgdmVyc2lvbi4NCj4NCj4gQW0gRG9ubmVyc3RhZywg
MTUuIEp1bmkgMjAyMywgMDM6Mzg6MTUgQ0VTVCBzY2hyaWViIFNhbmRvciBZdToNCj4gPiBBZGQg
YSBuZXcgRFJNIEhETUkgYnJpZGdlIGRyaXZlciBmb3IgQ2FkZW5jZSBNSERQODUwMSB0aGF0IHVz
ZWQgaW4NCj4gPiBGcmVlc2NhbGUgaS5NWDhNUSBTb0MuDQo+ID4gTUhEUDg1MDEgY291bGQgc3Vw
cG9ydCBIRE1JIG9yIERpc3BsYXlQb3J0IHN0YW5kYXJkcyBhY2NvcmRpbmcNCj4gPiBlbWJlZGRl
ZCBGaXJtd2FyZSBydW5uaW5nIGluIHRoZSB1Q1BVLg0KPiA+DQo+ID4gRm9yIGlNWDhNUSBTb0Ms
IHRoZSBIRE1JIEZXIHdhcyBsb2FkZWQgYW5kIGFjdGl2YXRlZCBieSBTT0MgUk9NDQo+IGNvZGUu
DQo+ID4gQm9vdGxvYWQgYmluYXJ5IGluY2x1ZGVkIEhETUkgRlcgd2FzIHJlcXVpcmVkIGZvciB0
aGUgZHJpdmVyLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogU2FuZG9yIFl1IDxTYW5kb3IueXVA
bnhwLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jYWRlbmNlL0tj
b25maWcgICAgICAgIHwgICAxMiArDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2FkZW5j
ZS9NYWtlZmlsZSAgICAgICB8ICAgIDEgKw0KPiA+ICAuLi4vZHJtL2JyaWRnZS9jYWRlbmNlL2Nk
bnMtbWhkcDg1MDEtaGRtaS5jICAgfCAxMDI0DQo+ICsrKysrKysrKysrKysrKysrDQo+ID4gIDMg
ZmlsZXMgY2hhbmdlZCwgMTAzNyBpbnNlcnRpb25zKCspDQo+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0
NA0KPiA+IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2FkZW5jZS9jZG5zLW1oZHA4NTAxLWhkbWku
Yw0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2FkZW5jZS9L
Y29uZmlnDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2NhZGVuY2UvS2NvbmZpZyBpbmRl
eA0KPiA+IDViN2VjNGU0OWFhMS4uYmVlMDVlODM0MDU1DQo+ID4gMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jYWRlbmNlL0tjb25maWcNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL2NhZGVuY2UvS2NvbmZpZw0KPiA+IEBAIC01OSwzICs1OSwxNSBAQCBj
b25maWcgRFJNX0NETlNfTUhEUDg1MDFfRFANCj4gPiAgICAgICAgIFN1cHBvcnQgQ2FkZW5jZSBN
SERQODUwMSBEaXNwbGF5UG9ydCBkcml2ZXIuDQo+ID4gICAgICAgICBDYWRlbmNlIE1IRFA4NTAx
IENvbnRyb2xsZXIgc3VwcG9ydCBvbmUgb3IgbW9yZSBwcm90b2NvbHMsDQo+ID4gICAgICAgICBE
aXNwbGF5UG9ydCBmaXJtd2FyZSBpcyByZXF1aXJlZCBmb3IgdGhpcyBkcml2ZXIuDQo+ID4gKw0K
PiA+ICtjb25maWcgRFJNX0NETlNfTUhEUDg1MDFfSERNSQ0KPiA+ICsgICAgIHRyaXN0YXRlICJD
YWRlbmNlIE1IRFA4NTAxIEhETUkgRFJNIGRyaXZlciINCj4gPiArICAgICBzZWxlY3QgRFJNX0tN
U19IRUxQRVINCj4gPiArICAgICBzZWxlY3QgRFJNX1BBTkVMX0JSSURHRQ0KPiA+ICsgICAgIHNl
bGVjdCBEUk1fRElTUExBWV9IRUxQRVINCj4gPiArICAgICBzZWxlY3QgRFJNX0NETlNfQVVESU8N
Cj4gPiArICAgICBkZXBlbmRzIG9uIE9GDQo+ID4gKyAgICAgaGVscA0KPiA+ICsgICAgICAgU3Vw
cG9ydCBDYWRlbmNlIE1IRFA4NTAxIEhETUkgZHJpdmVyLg0KPiA+ICsgICAgICAgQ2FkZW5jZSBN
SERQODUwMSBDb250cm9sbGVyIHN1cHBvcnQgb25lIG9yIG1vcmUgcHJvdG9jb2xzLA0KPiA+ICsg
ICAgICAgSERNSSBmaXJtd2FyZSBpcyByZXF1aXJlZCBmb3IgdGhpcyBkcml2ZXIuDQo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2FkZW5jZS9NYWtlZmlsZQ0KPiA+IGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jYWRlbmNlL01ha2VmaWxlIGluZGV4DQo+ID4gNTg0MmU0
NTQwYzYyLi44YTEyOWMxNGFjMTQNCj4gPiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL2NhZGVuY2UvTWFrZWZpbGUNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2NhZGVuY2UvTWFrZWZpbGUNCj4gPiBAQCAtNywzICs3LDQgQEAgY2Rucy1taGRwODU0Ni15
IDo9IGNkbnMtbWhkcDg1NDYtY29yZS5vDQo+ID4gY2Rucy1taGRwODU0Ni1oZGNwLm8NCj4gPiBj
ZG5zLW1oZHA4NTQ2LSQoQ09ORklHX0RSTV9DRE5TX01IRFA4NTQ2X0o3MjFFKSArPQ0KPiA+IGNk
bnMtbWhkcDg1NDYtajcyMWUubw0KPiA+DQo+ID4gIG9iai0kKENPTkZJR19EUk1fQ0ROU19NSERQ
ODUwMV9EUCkgKz0gY2Rucy1taGRwODUwMS1kcC5vDQo+ID4gK29iai0kKENPTkZJR19EUk1fQ0RO
U19NSERQODUwMV9IRE1JKSArPSBjZG5zLW1oZHA4NTAxLWhkbWkubw0KPiA+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2NhZGVuY2UvY2Rucy1taGRwODUwMS1oZG1pLmMNCj4g
PiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2FkZW5jZS9jZG5zLW1oZHA4NTAxLWhkbWkuYyBu
ZXcgZmlsZSBtb2RlDQo+ID4gMTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAwMC4uNDM2NzNmMWI1MGY2
DQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvY2Fk
ZW5jZS9jZG5zLW1oZHA4NTAxLWhkbWkuYw0KPiBbLi4uXQ0KPiA+ICtzdGF0aWMgaW50IGNkbnNf
aGRtaV9icmlkZ2VfYXR0YWNoKHN0cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UsDQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gZHJtX2JyaWRnZV9hdHRhY2hfZmxhZ3MgZmxh
Z3MpDQo+IHsNCj4gPiArICAgICBzdHJ1Y3QgY2Ruc19taGRwX2RldmljZSAqbWhkcCA9IGJyaWRn
ZS0+ZHJpdmVyX3ByaXZhdGU7DQo+ID4gKyAgICAgc3RydWN0IGRybV9tb2RlX2NvbmZpZyAqY29u
ZmlnID0gJmJyaWRnZS0+ZGV2LT5tb2RlX2NvbmZpZzsNCj4gPiArICAgICBzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmVuY29kZXIgPSBicmlkZ2UtPmVuY29kZXI7DQo+ID4gKyAgICAgc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvciA9ICZtaGRwLT5jb25uZWN0b3I7DQo+ID4gKw0KPiA+ICsgICAg
IGlmICghKGZsYWdzICYgRFJNX0JSSURHRV9BVFRBQ0hfTk9fQ09OTkVDVE9SKSkgew0KPiA+ICsg
ICAgICAgICAgICAgY29ubmVjdG9yLT5pbnRlcmxhY2VfYWxsb3dlZCA9IDA7DQo+ID4gKyAgICAg
ICAgICAgICBjb25uZWN0b3ItPnBvbGxlZCA9IERSTV9DT05ORUNUT1JfUE9MTF9IUEQ7DQo+ID4g
Kw0KPiA+ICsgICAgICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKGNvbm5lY3RvciwN
Cj4gJmNkbnNfaGRtaV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzKTsNCj4gPiArDQo+ID4gKyAgICAg
ICAgICAgICBkcm1fY29ubmVjdG9yX2luaXQoYnJpZGdlLT5kZXYsIGNvbm5lY3RvciwNCj4gJmNk
bnNfaGRtaV9jb25uZWN0b3JfZnVuY3MsDQo+ID4gKw0KPiBEUk1fTU9ERV9DT05ORUNUT1JfSERN
SUEpOw0KPiA+ICsNCj4gPiArICAgICAgICAgICAgIGRybV9vYmplY3RfYXR0YWNoX3Byb3BlcnR5
KCZjb25uZWN0b3ItPmJhc2UsDQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb25maWctDQo+ID5oZHJfb3V0cHV0X21ldGFkYXRhX3Byb3BlcnR5LCAwKTsNCj4g
PiArDQo+ID4gKyAgICAgICAgICAgICBpZg0KPiA+ICsgKCFkcm1fbW9kZV9jcmVhdGVfaGRtaV9j
b2xvcnNwYWNlX3Byb3BlcnR5KGNvbm5lY3RvcikpDQo+DQo+IFRoaXMgaXMgbWlzc2luZyBhIDJu
ZCBwYXJhbWV0ZXIuDQpJIGhhdmUgbm90IGZvdW5kIGZ1bmN0aW9uIGRybV9tb2RlX2NyZWF0ZV9o
ZG1pX2NvbG9yc3BhY2VfcHJvcGVydHkgbmVlZCAybmQgcGFyYW1ldGVyIGluIEw2LjEuDQpBbmQg
dGhvc2UgY29ubmVjdG9yIGluaXQgZnVuY3Rpb25zIHdpbGwgYmUgcmVtb3ZlIGluIHRoZSBuZXh0
IHZlcnNpb24gYWNjb3JkaW5nIFNhbSdzIGNvbW1lbnRzLCBiZWNhdXNlIHRoZXkgYXJlIG5vdCBy
ZWFsbHkgbmVlZGVkLg0KDQpCLlINClNhbmRvcg0KPg0KPiA+ICsNCj4gZHJtX29iamVjdF9hdHRh
Y2hfcHJvcGVydHkoJmNvbm5lY3Rvci0+YmFzZSwNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgY29ubmVjdG9yLQ0KPiA+Y29sb3JzcGFjZV9wcm9wZXJ0
eSwgMCk7DQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZW5j
b2Rlcihjb25uZWN0b3IsIGVuY29kZXIpOw0KPiA+ICsgICAgIH0NCj4gPiArDQo+ID4gKyAgICAg
cmV0dXJuIDA7DQo+ID4gK30NCj4gWy4uLl0NCj4NCj4gQmVzdCByZWdhcmRzLA0KPiBBbGV4YW5k
ZXINCj4gLS0NCj4gVFEtU3lzdGVtcyBHbWJIIHwgTcO8aGxzdHJhw59lIDIsIEd1dCBEZWxsaW5n
IHwgODIyMjkgU2VlZmVsZCwgR2VybWFueQ0KPiBBbXRzZ2VyaWNodCBNw7xuY2hlbiwgSFJCIDEw
NTAxOA0KPiBHZXNjaMOkZnRzZsO8aHJlcjogRGV0bGVmIFNjaG5laWRlciwgUsO8ZGlnZXIgU3Rh
aGwsIFN0ZWZhbiBTY2huZWlkZXINCj4gaHR0cDovL3d3dy50cS8NCj4gLWdyb3VwLmNvbSUyRiZk
YXRhPTA1JTdDMDElN0NTYW5kb3IueXUlNDBueHAuY29tJTdDNzdmYmFhY2UwNTJjDQo+IDRjY2Yz
MzhjMDhkYjZlNGM0MGNiJTdDNjg2ZWExZDNiYzJiNGM2ZmE5MmNkOTljNWMzMDE2MzUlN0MwJTdD
DQo+IDAlN0M2MzgyMjUwNDYwMTA4MTc1MzAlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lq
b2lNQzR3DQo+IExqQXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJ
Nk1uMCUzRCU3QzMwMDAlN0MNCj4gJTdDJTdDJnNkYXRhPUpKamVWMkluWHpIeWVmTDR1aUs5JTJC
UnRTVmpvQllkJTJGd0lxU2JJUWhESDkwJTNEDQo+ICZyZXNlcnZlZD0wDQo+DQoNCg==
