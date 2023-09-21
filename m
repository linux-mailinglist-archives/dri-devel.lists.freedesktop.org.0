Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBB77A92FA
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 11:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9307310E59A;
	Thu, 21 Sep 2023 09:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20623.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::623])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08B110E59A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 09:14:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXv8QZFMVAgzzhh6VL/1tAZnNXNEkEHp5AW2r2ZFempLE9LXsjpUiDBCBIn+yQ+vz5n4bFEz1PJwt7Bl3QOnN1dHirEdXN2hhFzxW+p9VEOfbXrU/YY9uxBeetS24pREDoSSFV5LZtr5Qp+5LWboWtOxc00yTOE/Q4KKcfiDDyjGL9enBnxxfIv0JgEmDLpxTLGs/ecs+MpAzdj5RgKkiG/w92EisvIYpJoiSAwDuJteqgfs0gsxQsUhZvSawRq5CnTGxZwo81i4p79KgSraJaJfwXzPGbm+pCEHkcR4OFLzt/9CRR8WoyFo82+sQOxf3a3GgnmIKynHbprc3cTepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfvfqZTS2cdDF8BQgeVJ2t967uVAqpCDzzNJvHHgANs=;
 b=ftESrAEH3v0NpxkkFCAVNYp+mJduriZC24Lj6kuPXD6gao/QGbYIuUXoBj/4zr2ftOjLmleR1yU5uonHgEOQVGDapOCByXYTgGn+C9Ea0m3cOgz3n7500kHLv6h6q/zWCCKAcyVWZuXjI7OSKPU3byCbC/hcU0/kiDRJMfM0e8AMOqLym6WxiORPfp504xSR+OwWd57W/J6ttisheC+DQctTR9ltUYivyvz9vqt/lbkhwrDFYqAx7jnUu4tbSBaga2nUXlofq7bQXAaqdl6Fn9H7ZS3cz8zIGZitwJDQ7Ha6KRIsJXeEjED8Mtv2MToWqmdV47CcoqsHjA5tE1uW3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfvfqZTS2cdDF8BQgeVJ2t967uVAqpCDzzNJvHHgANs=;
 b=gIpu8kcBqdRq7WEQZrpeSgB/0vXtweTme/I43ErLCIG/OvM994ppipnlY6P8nkYEsBR2r+pJV5Ctp0tEAW1K18I6dX4+7Chy01aQTE8FiDIzq/nFweh63Md0l/FE/ikeGa1KC6uIfMsJ0OogkqewTTr9a//BOBIJaGYo2pLWKp4=
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by DU0PR04MB9494.eurprd04.prod.outlook.com (2603:10a6:10:32e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 09:14:46 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::1ace:f566:c57a:7d4b%3]) with mapi id 15.20.6813.017; Thu, 21 Sep 2023
 09:14:45 +0000
From: Ying Liu <victor.liu@nxp.com>
To: Lucas Stach <l.stach@pengutronix.de>, Marek Vasut <marex@denx.de>
Subject: RE: [PATCH 2/5] drm: lcdif: move controller enable into atomic_flush
Thread-Topic: [PATCH 2/5] drm: lcdif: move controller enable into atomic_flush
Thread-Index: AQHZ662fEUnhuutWEkO/NTaz1A0SHLAk2e8AgAAQo4CAAANhEIAADdkAgAAAvnA=
Date: Thu, 21 Sep 2023 09:14:45 +0000
Message-ID: <AM7PR04MB70468A320A2517EB2A10FF7B98F8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
References: <20230920103126.2759601-1-l.stach@pengutronix.de>
 <20230920103126.2759601-3-l.stach@pengutronix.de>
 <AM7PR04MB7046AA99475489B1220D309998F8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <fa07e69431066065ab6dc6df8d4649ba04124aa4.camel@pengutronix.de>
 <AM7PR04MB704644037955946CE3B3A1E698F8A@AM7PR04MB7046.eurprd04.prod.outlook.com>
 <f43e25f5b1bbf4b681629198b92ce0deceb2e893.camel@pengutronix.de>
In-Reply-To: <f43e25f5b1bbf4b681629198b92ce0deceb2e893.camel@pengutronix.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM7PR04MB7046:EE_|DU0PR04MB9494:EE_
x-ms-office365-filtering-correlation-id: a761f9af-10c1-4f25-c17f-08dbba8332b6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yP2KqRkTawW/K41wEwwSOwd+5a0nwzZmAL1QQ5jCE1tF4JVwotG5RjebiNy76vSlnyaZv5j2FKvT3JF9KEagrCGgV0OdDVq2xxfMX8PRmzd1CRz07oEvWz7++WCQl6LhcxE0ncG+Y3uuxrFU/GQ/uhedArqJzg7BPSWw7S/Cb1875oqH0awVuWvJr8oPHQIn7aDbMLpWbg7HIbs/OlOoljqgcsmlr/kE+CSJDyBhdLwVCxIRMllQScc7A2VJJT5/04WotTms6+lv4rdt/w6C+nVmRQHxEC/16pxdOKwZsGj/dTYsEVFyUMdZlDKJAwXtdosQhVc3Nm7jwLUvGnUMfk8AxsJBWgx4g2jXUk6zSjWuueo9bKLYPteoemVb3D5WS7N0izzPh7Gp5YpO3o2WETz9mcq58o75Zu+gUyG3PoPuEDiWzbwsDzICkXhOoOu9kSCDVnCceeppBRJWjoxnl0x7goYYY+mkI3Zt/ZEohSRIXxz0dUVbihvj9ueBnlQ6BQRSM4W+aJcCAbNFN4P3cVC1gAZ/TMNU3XnJzFvaFu30YnZ3h4vjl7LZ+GiJjWVh4jiKN7aRHYluDMe667vBJuPTIggEQOcZ8pkLXtOT/UjJpW/eJedYb+mB4M9OCnXm
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(376002)(366004)(39860400002)(136003)(186009)(451199024)(1800799009)(478600001)(316002)(66446008)(66946007)(52536014)(66556008)(64756008)(66476007)(5660300002)(55016003)(83380400001)(41300700001)(110136005)(54906003)(4326008)(2906002)(76116006)(8936002)(8676002)(71200400001)(6506007)(7696005)(53546011)(9686003)(26005)(33656002)(38070700005)(38100700002)(122000001)(86362001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?REdhZXRvNytlY3FHYkJIdTNhUERWYit1RExwWnlLaTBxNVRnVnkrTk0vY0hM?=
 =?utf-8?B?WVd1UDg3dXJqeWFZUHFhM1VjanA1K1A0eGwxODNkTnlsdFN0UnRjL0M2ZG02?=
 =?utf-8?B?dHAxUnNETFdwUGcyYXgxWW45eGd1NThNUW95cDRma09NdHBDQm1QR0ZQV1R0?=
 =?utf-8?B?NDZwUnJ4UDAvQm11R0ZKK3p4NTN0aytPa1VxWmprVXUwYWlIZEJnMkJCVHVN?=
 =?utf-8?B?SmN2VG1SVjhWVkpGTDhiY0h6Ym41VUxGYXZyb1l4N2lYZDRNM2NjUjhuSk54?=
 =?utf-8?B?Mm55T1lNR3VVTzVDM2JIbC9IeDBRcitHNi9vbWtneFpSRDZXeVh5alFmc0lB?=
 =?utf-8?B?ZFM3ZUlYUERyNXNRYm1CcFVOdGFRRE1CWFZXWWE0MTJqYkttLy9TQzd0VWhr?=
 =?utf-8?B?RUh3ZjZNMW5HZll3VUVBQ1FZaG04WDhaN0taSEZQcHJ6ME1yeHZ3VW5XZCtJ?=
 =?utf-8?B?anczMzhPMVdiM050a1RlV0lRQUVSblJrNmpycTBCQ3dzVTJWeEMzZjhpNytj?=
 =?utf-8?B?TjR0Yy84UXo1SUt5MVA5VHVJQnM5ZmxvR2tYUmh2Ymh5NkFZNzRUc3hxK1ZJ?=
 =?utf-8?B?eTZyNC9tUm5KUGt1ZlNkcTlsc0dueGlhMER5ZzY2TjlRSFZtczFTZ0tXUlZj?=
 =?utf-8?B?NE9oVlpTMi9uVnVrWDQ2K28rUE5ta0xDMDNNMFhnYXIrLzdGdnhvRVIya0Nz?=
 =?utf-8?B?N0xGUHg3TUtCV0owMmxoSnpHZEJ2MENoeDN1YjVlU1lRVUppc3k3REpUczFz?=
 =?utf-8?B?OFlxSXFScVE1NHJuTzc3dXQycXhBTTcxblIyYXhsRVA5dXV4Mks0WHFZR2VI?=
 =?utf-8?B?TDVvR3QzN1lHM1JoMHdmTmRmSmU3R01rYUQvYXBDOTdxTlBQV1VUSEE5Tlhw?=
 =?utf-8?B?c0REcXVsVzRrRURwRE9aM2NKMEt1NVZVU1IveURBU0cwV1k3S1RSNU53S1oz?=
 =?utf-8?B?alBKcFVpN3dmR09naGRUNXgrK0pNdHR1c2pmUEQxekEzTVpJNDFHbWt4WjQr?=
 =?utf-8?B?S050My9YNVRBbW5tc3FuU3VYYm9rRWJ2OFpTT3BkMmhjR1NkS002eENyeWhs?=
 =?utf-8?B?UXpObVZtaS9Nc1NCZjRaVHdoU05ia0ZwSVIwVVVyN1JyYitLYWJ2eXBIZ0N3?=
 =?utf-8?B?QW83RTF3TlJ1ZWlrVlFKTWxQSiswb0R5b095Sk1qbjlVVXFoZkVxcU9jVmNF?=
 =?utf-8?B?aWp2K3VXQXFOTWxKNm9Rd01ZNWpxT3ZSdGg1dVBpRmRKZEhTajd3M0FOOExL?=
 =?utf-8?B?SE5QSlNNdUF5VDltRU1QWXZ6MFRoWEpxTXdlaW9YMU1yU1ZzczgxQkRFSS9J?=
 =?utf-8?B?WWhKbk93T3hZeFVIRDcwcW56T2MzQjF5R0dMenBsSUlsNkxPNVpWZHJWUVFS?=
 =?utf-8?B?aVJpRWhMM3V2M1pNYXpHMDNtSmhxaVFhak1DT1lKVDdSSkhQWjg3YlJnZ2t4?=
 =?utf-8?B?UzhyWTRsY09kT04wUkMrcjFvaXlwT2VZSEE4dHA4dlRmWkNIZlJDR00wdTR2?=
 =?utf-8?B?ZnRpMjhsYzZtY3hqYTdyNTdNMnN0MWEvRXBJNmFQSWhmSTY5MzI3bjMxL2Qr?=
 =?utf-8?B?Y0hJekxsWWRidUFVY05ONGFPeWc2ZDRIZENYR0d3N1lBMnZCWkFrMVRkdno5?=
 =?utf-8?B?b0JIZXAzZHZiNXVkVVVSQ0N3aVo3MDltbURVQm9PempqSE9RdjdnL3lXVmN5?=
 =?utf-8?B?bk5tK2ZBaWEza2l6TVNuaEtCQ2IvNHR3NENDaUl4d29aWVdWTVp3NllmcGZK?=
 =?utf-8?B?U3VGSzVleFhNYUl4bjdnYWhGaUpudVV1eEFTUmtFbzRHSW5pKzlGdnBoOVd0?=
 =?utf-8?B?U3MyVWQ3YWNwMlhpcm0vTm5LM1BGNlkyV2JwRVNTdFlGelFwNTVqWGRycHZJ?=
 =?utf-8?B?YmxjTDBEeFlRdkErd1R3NUdnZDlXVFEwWEp3SElQNzgxbUF2RmJybGZnQVdG?=
 =?utf-8?B?V1lWZmVQRGdpY0VJdFFIKy9oOWMxaldOZEM4aVpnL1oyZ1oxS3Q0eWJVanQr?=
 =?utf-8?B?d0VJODhERXgrWEoxUDBoQkYwaVZBOTBPNUxGV3J3VEV1SGZNQ1FVTGV0eHpl?=
 =?utf-8?B?OUdxQjdiVk1pNk9qc3N1OU5HN3kxclBBMEY0TEFxNmRDMVJPM0hGUStQaDhi?=
 =?utf-8?Q?KpDw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a761f9af-10c1-4f25-c17f-08dbba8332b6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2023 09:14:45.7255 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +tROdol0yEn8wiirlYCJe1dA4sJj+FfneQiCOprMTs/hr+2CRhMGM8J7kdjgiIKXi85sht7KzVcB58CwMC2wAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9494
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
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 dl-linux-imx <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 "patchwork-lst@pengutronix.de" <patchwork-lst@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1cnNkYXksIFNlcHRlbWJlciAyMSwgMjAyMyA0OjU3IFBNIEx1Y2FzIFN0YWNoIDxsLnN0
YWNoQHBlbmd1dHJvbml4LmRlPiB3cm90ZToNCj4gQW0gRG9ubmVyc3RhZywgZGVtIDIxLjA5LjIw
MjMgdW0gMDg6MTggKzAwMDAgc2NocmllYiBZaW5nIExpdToNCj4gPiBPbiBUaHVyc2RheSwgU2Vw
dGVtYmVyIDIxLCAyMDIzIDM6NTUgUE0gTHVjYXMgU3RhY2gNCj4gPGwuc3RhY2hAcGVuZ3V0cm9u
aXguZGU+IHdyb3RlOg0KPiA+ID4gQW0gRG9ubmVyc3RhZywgZGVtIDIxLjA5LjIwMjMgdW0gMDc6
MTMgKzAwMDAgc2NocmllYiBZaW5nIExpdToNCj4gPiA+ID4gSGksDQo+ID4gPiA+DQo+ID4gPiA+
IE9uIFdlZG5lc2RheSwgU2VwdGVtYmVyIDIwLCAyMDIzIDY6MzEgUE0gTHVjYXMgU3RhY2gNCj4g
PiA+IDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPiB3cm90ZToNCj4gPiA+ID4gPiBBbGxvdyBkcm1f
YXRvbWljX2hlbHBlcl9jb21taXRfdGFpbF9ycG0gdG8gc2V0dXAgYWxsIHRoZSBwbGFuZQ0KPiA+
ID4gPiA+IHN0YXRlIGJlZm9yZSB0aGUgc2Nhbm91dCBpcyBzdGFydGVkLg0KPiA+ID4gPiA+DQo+
ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXgu
ZGU+DQo+ID4gPiA+ID4gLS0tDQo+ID4gPiA+ID4gIGRyaXZlcnMvZ3B1L2RybS9teHNmYi9sY2Rp
Zl9rbXMuYyB8IDYgKysrKystDQo+ID4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPiA+ID4gPg0KPiA+ID4gPiA+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vbXhzZmIvbGNkaWZfa21zLmMNCj4gPiA+ID4gPiBiL2RyaXZlcnMvZ3B1
L2RybS9teHNmYi9sY2RpZl9rbXMuYw0KPiA+ID4gPiA+IGluZGV4IGY1YmZlOGI1MjkyMC4uNGFj
ZjY5MTRhOGQxIDEwMDY0NA0KPiA+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9s
Y2RpZl9rbXMuYw0KPiA+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9teHNmYi9sY2RpZl9r
bXMuYw0KPiA+ID4gPiA+IEBAIC01MDUsNiArNTA1LDggQEAgc3RhdGljIGludCBsY2RpZl9jcnRj
X2F0b21pY19jaGVjayhzdHJ1Y3QNCj4gZHJtX2NydGMNCj4gPiA+ID4gPiAqY3J0YywNCj4gPiA+
ID4gPiAgc3RhdGljIHZvaWQgbGNkaWZfY3J0Y19hdG9taWNfZmx1c2goc3RydWN0IGRybV9jcnRj
ICpjcnRjLA0KPiA+ID4gPiA+ICAJCQkJICAgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0
ZSkNCj4gPiA+ID4gPiAgew0KPiA+ID4gPiA+ICsJc3RydWN0IGRybV9jcnRjX3N0YXRlICpjcnRj
X3N0YXRlID0NCj4gPiA+ID4gPiBkcm1fYXRvbWljX2dldF9uZXdfY3J0Y19zdGF0ZShzdGF0ZSwN
Cj4gPiA+ID4gPiArDQo+IAkgIGNydGMpOw0KPiA+ID4gPiA+ICAJc3RydWN0IGxjZGlmX2RybV9w
cml2YXRlICpsY2RpZiA9IHRvX2xjZGlmX2RybV9wcml2YXRlKGNydGMtPmRldik7DQo+ID4gPiA+
ID4gIAlzdHJ1Y3QgZHJtX3BlbmRpbmdfdmJsYW5rX2V2ZW50ICpldmVudDsNCj4gPiA+ID4gPiAg
CXUzMiByZWc7DQo+ID4gPiA+ID4gQEAgLTUxMyw2ICs1MTUsOSBAQCBzdGF0aWMgdm9pZCBsY2Rp
Zl9jcnRjX2F0b21pY19mbHVzaChzdHJ1Y3QNCj4gZHJtX2NydGMNCj4gPiA+ID4gPiAqY3J0YywN
Cj4gPiA+ID4gPiAgCXJlZyB8PSBDVFJMREVTQ0wwXzVfU0hBRE9XX0xPQURfRU47DQo+ID4gPiA+
ID4gIAl3cml0ZWwocmVnLCBsY2RpZi0+YmFzZSArIExDRENfVjhfQ1RSTERFU0NMMF81KTsNCj4g
PiA+ID4gPg0KPiA+ID4gPiA+ICsJaWYgKGRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0KGNy
dGNfc3RhdGUpKQ0KPiA+ID4gPiA+ICsJCWxjZGlmX2VuYWJsZV9jb250cm9sbGVyKGxjZGlmKTsN
Cj4gPiA+ID4NCj4gPiA+ID4gTW92aW5nIGxjZGlmX2VuYWJsZV9jb250cm9sbGVyKCkgZnVuY3Rp
b24gY2FsbCBmcm9tIGF0b21pY19lbmFibGUgdG8NCj4gPiA+ID4gYXRvbWljX2ZsdXNoIHdvdWxk
IGNoYW5nZSBDUlRDIHZzIGJyaWRnZSBlbmFibGVtZW50IG9yZGVyLCB3aGljaA0KPiA+ID4gPiBl
ZmZlY3RpdmVseSBtYWtlcyBicmlkZ2UgZW5hYmxlbWVudCBoYXBwZW4gcHJpb3IgdG8gQ1JUQyBl
bmFibGVtZW50LA0KPiA+ID4gPiBzZWUgZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3RhaWxfcnBt
KCkgZGV0YWlsIGltcGxlbWVudGF0aW9uLiAgVGhlDQo+ID4gPiA+IHJldmVyc2VkIG9yZGVyIHBv
dGVudGlhbGx5IGNhdXNlcyBtYWxmdW5jdGlvbnMgb2YgdGhlIGJyaWRnZS4NCj4gPiA+ID4NCj4g
PiA+IFRoaXMgaGFzIG5vdGhpbmcgdG8gZG8gd2l0aCB0aGUgYnJpZGdlIGFmdGVyIHRoZSBMQ0RJ
RiBjb250cm9sbGVyLiBUaGUNCj4gPg0KPiA+IElNSE8sIHRoZSByZXNlcnZlZCBDUlRDIHZzIGJy
aWRnZSBlbmFibGVtZW50IG9yZGVyIGlzIHJlbGV2YW50IGZvcg0KPiA+IHRoZSBvdmVyYWxsIGRp
c3BsYXkgcGlwZWxpbmUuDQo+ID4NCj4gQWgsIEkgc2VlIHdoYXQgeW91IG1lYW4gbm93LiBNb3Zp
bmcgdGhlIGNvbnRyb2xsZXIgZW5hYmxlIGludG8gZmx1c2ggaXMNCj4gdmlvbGF0aW5nIHRoZSBk
b2N1bWVudGVkIGZsb3cgdGhhdCBicmlkZ2VzIG1pZ2h0IGFzc3VtZSB0aGUgZGlzcGxheQ0KPiBs
aW5rIHRvIGJlIHJ1bm5pbmcgaW4gdGhlaXIgZW5hYmxlIGNhbGxiYWNrLiBJIGRvbid0IHRoaW5r
IGFueSBvZiB0aGUNCj4gYnJpZGdlcyBjb25uZWN0ZWQgdG8gdGhlIExDRElGIHJlYWxseSBjYXJl
IGFib3V0IHRoaXMsIGJ1dCBpdCdzIGJhZA0KPiBuZXZlcnRoZWxlc3MuDQoNCk5vdCBzdXJlIGlm
IHRoZSBmaXJzdCBicmlkZ2VzKGFsbCBpbiBTb0NzIGZvciBub3cpIGNvbm5lY3RlZCB0byBMQ0RJ
RiBjYXJlDQphYm91dCB0aGUgb3JkZXIuICBCdXQsIGl0J3MgcmVhbGx5IGFib3V0IHRoZSBvdmVy
YWxsIGRpc3BsYXkgcGlwZWxpbmUgaW5jbHVkaW5nDQp3aWxkIG91dC1vZi1Tb0MgYnJpZGdlcyBp
biBhIGNoYWluLg0KDQo+IA0KPiBUaGlzIHNlZW1zIHRvIGJlIGEgZ2VuZXJpYyBpc3N1ZSB3aXRo
IHRoZSBSUE0gY29tbWl0IHRhaWwuIEVuYWJsaW5nIHRoZQ0KPiBkaXNwbGF5IGxpbmsgaW4gdGhl
IENSVEMgYXRvbWljX2VuYWJsZSB3aXRob3V0IGFsbCB0aGUgcGxhbmUgc3RhdGUNCj4gYmVpbmcg
c2V0IHVwIGluIHRoZSBIVyBzb3VuZHMgd3JvbmcgYW5kIEkgdGhpbmsgd2UgYWxzbyBkb24ndCB3
YW50IHRvDQoNClJpZ2h0LCBzZWVtcyB0byBiZSBhIGdlbmVyaWMgaXNzdWUuDQoNClJlZ2FyZHMs
DQpMaXUgWWluZw0KDQo+IGhvaXN0IChkdXBsaWNhdGUpIGFsbCB0aGUgcGxhbmUgc2V0dXAgaW50
byB0aGUgQ1JUQyBlbmFibGUuDQo+IA0KPiBJJ2xsIGxvb2sgaW50byB0aGlzIHNvbWUgbW9yZSB0
byBzZWUgaWYgd2UgY2FuIGRvIHNvbWV0aGluZyBiZXR0ZXIgdGhhdA0KPiBkb2Vzbid0IHZpb2xh
dGUgdGhlIGJyaWRnZSBjaGFpbiBjb25zdHJhaW50cy4NCj4gDQo+IFJlZ2FyZHMsDQo+IEx1Y2Fz
DQo+IA0KPiA+ID4gUlBNIGNvbW1pdF90YWlsIGltcGxlbWVudGF0aW9uIGVuYWJsZXMgdGhlIENS
VEMgYmVmb3JlIGFsbCB0aGUgcGxhbmUNCj4gPiA+IHN0YXRlIGlzIHNldCB1cC4gVG8gYXZvaWQg
aGF2aW5nIHRvIHByb2dyYW0gdGhlIHBsYW5lIHN0YXRlIGluIHRoZSBDUlRDDQo+ID4gPiBlbmFi
bGUgdGhpcyBzZXJpZXMgZGVmZXJzIHRoZSBhY3R1YWwgY29udHJvbGxlciBlbmFibGUgdG8gdGhl
IGxhc3Qgc3RlcA0KPiA+ID4gb2YgdGhlIGF0b21pYyBjb21taXQuIFRoaXMgd2F5IHRoZSBwbGFu
ZSBzdGF0ZSBpcyBwcm9ncmFtbWVkIHRoZSB1c3VhbA0KPiA+ID4gd2F5IHZpYSB0aGUgYXRvbWlj
IHVwZGF0ZV9wbGFuZSBjYWxsYmFjayBhbmQgd2UgZG9uJ3QgbmVlZCB0byBkdXBsaWNhdGUNCj4g
PiA+IHRoaXMgc2V0dXAuDQo+ID4NCj4gPiBJIHVuZGVyc3RhbmQgdGhlIHBhdGNoIGF2b2lkcyBz
b21lIGR1cGxpY2F0aW9ucyB2aWEgZGVmZXJyYWwgY29udHJvbGxlcg0KPiA+IGVuYWJsZW1lbnQg
dGltZSBwb2ludCwgYnV0IHRoZSByZXZlcnNlZCBDUlRDIHZzIGJyaWRnZSBlbmFibGVtZW50IG9y
ZGVyDQo+ID4gaXMgdGhlIGNvbmNlcm4gaGVyZS4NCj4gPg0KPiA+ID4NCj4gPiA+ID4gQlRXLCBl
dmVuIGlmIGl0J3Mgb2sgdG8gbW92ZSB0aGUgZnVuY3Rpb24gY2FsbCwgaXQgd291bGQgYmUgYmV0
dGVyIHRvIGNhbGwNCj4gPiA+ID4gbGNkaWZfZW5hYmxlX2NvbnRyb2xsZXIoKSBiZWZvcmUgQ1RS
TERFU0NMMF81X1NIQURPV19MT0FEX0VOIGlzDQo+ID4gPiA+IHNldCBzbyB0aGF0IHRoZSBvcmln
aW5hbCBzZXF1ZW5jZSBpcyBrZXB0LiAgQWxzbywgTENESUYgY2hhcHRlciBpbiBTb0MgUk1zDQo+
ID4gPiA+IGluZGljYXRlcyB0aGF0IHRoZSBzaGFkb3cgbG9hZCBlbmFibGVtZW50IGlzIHRoZSBs
YXN0IHN0ZXAgaW4NCj4gPiA+ID4gIlNvZnR3YXJlIGZsb3cgZGlhZ3JhbSIuDQo+ID4gPg0KPiA+
ID4gVGhpcyBmbG93IGNoYXJ0IHNob3dzIGhvdyB0aGUgZG91YmxlIGJ1ZmZlcmVkIHVwZGF0ZSBz
aG91bGQgd29yaywgaXQNCj4gPiA+IGRvZXNuJ3Qgc2hvdyB0aGUgaW5pdGlhbCBjb250cm9sbGVy
IGVuYWJsZSBzZXF1ZW5jZS4gV2l0aG91dCB0aGUgc2hhZG93DQo+ID4NCj4gPiBZb3UgYXJlIHJp
Z2h0LiAgVGhlIGRvd25zdHJlYW0gZHJpdmVyIGFsc28gZW5hYmxlcyBzaGFkb3cgbG9hZCBiZWZv
cmUNCj4gPiB0aGUgZW50aXJlIGNvbnRyb2xsZXIuDQo+ID4NCj4gPiBSZWdhcmRzLA0KPiA+IExp
dSBZaW5nDQo+ID4NCj4gPiA+IGxvYWQgZW5hYmxlIGJpdCBiZWluZyBzZXQgYmVmb3JlIHRoZSBj
b250cm9sbGVyIGVuYWJsZSBJIGNvdWxkIG9ic2VydmUNCj4gPiA+IHNwb3JhZGljIGlzc3VlcyBv
biB0aGUgZmlyc3QgZnJhbWUgd2hlcmUgdGhlIERNQSBlbmdpbmUgd291bGQgcmVhZCB0aGUNCj4g
PiA+IHdyb25nIG1lbW9yeSBhZGRyZXNzLg0KPiA+ID4NCj4gPiA+IFJlZ2FyZHMsDQo+ID4gPiBM
dWNhcw0KPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gUmVnYXJkcywNCj4gPiA+ID4gTGl1IFlpbmcN
Cj4gPiA+ID4NCj4gPiA+ID4gPiArDQo+ID4gPiA+ID4gIAlldmVudCA9IGNydGMtPnN0YXRlLT5l
dmVudDsNCj4gPiA+ID4gPiAgCWNydGMtPnN0YXRlLT5ldmVudCA9IE5VTEw7DQo+ID4gPiA+ID4N
Cj4gPiA+ID4gPiBAQCAtNTUyLDcgKzU1Nyw2IEBAIHN0YXRpYyB2b2lkIGxjZGlmX2NydGNfYXRv
bWljX2VuYWJsZShzdHJ1Y3QNCj4gPiA+IGRybV9jcnRjDQo+ID4gPiA+ID4gKmNydGMsDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiAJd3JpdGVsKENUUkxERVNDTF9ISUdIMF80X0FERFJfSElHSCh1cHBl
cl8zMl9iaXRzKHBhZGRyKSksDQo+ID4gPiA+ID4gIAkJICAgICAgIGxjZGlmLT5iYXNlICsgTENE
Q19WOF9DVFJMREVTQ0xfSElHSDBfNCk7DQo+ID4gPiA+ID4gIAl9DQo+ID4gPiA+ID4gLQlsY2Rp
Zl9lbmFibGVfY29udHJvbGxlcihsY2RpZik7DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAgCWRybV9j
cnRjX3ZibGFua19vbihjcnRjKTsNCj4gPiA+ID4gPiAgfQ0KPiA+ID4gPiA+IC0tDQo+ID4gPiA+
ID4gMi4zOS4yDQo+ID4gPiA+DQo+ID4NCg0K
