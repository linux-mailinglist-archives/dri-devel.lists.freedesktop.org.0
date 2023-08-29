Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD25778C738
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 16:19:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F9C410E2A8;
	Tue, 29 Aug 2023 14:19:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2132.outbound.protection.outlook.com [40.107.113.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA4210E2A9
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Aug 2023 14:19:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JSVeKKrkSEc8E08tm2p4oazC4TiMPjravgAp9v7cFibgjFmuH+lAq4AeJvtvFUwB2DGK9/zVtbTdYh6Ul/sgQobTPouDuO1+xhGKxUvL4gZPxSmZk5jvPdLzkh21UT5EJwkJjSmnnQV7rGnam+VxEV1IG/EIYwk7YTSJdT/3n5j9g6zVMAy0SbVdP0TxIgMQWtv7+ED8fqAtrKlhQ6XDIAKnKZQcYeMpPDnylUiPle9OG5KH0OpeA2LVoYqqmD+LZQUtxUnQoYR27AM80Xz0y5/AV+9xz2gAZqN/jdTec3jrvj5J6Cmo5HLPGvITWC2BW1n1sa41GBnS/Y836UiO6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IKH/pCf5RY5G9lbC+3l+p722mRfiPMT/Oj1a1iZX+Tc=;
 b=QmKse/LNiszvxJLmkMJhIWQ7/E2rNSinNFWQiBIIzgB6jw3oxg9EKhoShyyaXNhsLbPLz2/6f1oRKvKvtDiLo/jjtSHbrSFFiAc8p9kksbWtjWSPeaavIKkY1ec/+0x9cREzt3hTVUntw+GVyXsiMYx3yuPChYssVz/l61sFrsPVyyvd/Zz2Ta5CeerbFoqpze4VuCqWirXv36kIr4C5OrUR8a+argluwMNgh1bUj9sFFS30YwOPiK0+ydIQ8uKn44H7mRzepap4JYK0A4oXwpzDQeZ/POnp15ky753R/OfYGiTzTlJfNQLwH2TH7KAzvc6H0B4W4+KGR09Xb0i2jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IKH/pCf5RY5G9lbC+3l+p722mRfiPMT/Oj1a1iZX+Tc=;
 b=gxwKG2rYTzib5YLSKytPDbJlK0aXWN7Bo/I9Dfvn5WOEJnz3l8Bn63bWf3ysVpz6AU9SipqjDNi2FZU57Q5mwPDIGy09HUGPcQElozCPUaLrfmIsR6jGYvaiISv6wVbxEr4OzOXJ1T4R6+f5W7ek/3T/ljz8EsDhJJmT8r2LiS0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8905.jpnprd01.prod.outlook.com (2603:1096:604:17d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.18; Tue, 29 Aug
 2023 14:19:02 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::9d23:32f5:9325:3706%5]) with mapi id 15.20.6745.015; Tue, 29 Aug 2023
 14:19:02 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 5/7] drm: adv7511: Add has_dsi feature bit to struct
 adv7511_chip_info
Thread-Topic: [PATCH 5/7] drm: adv7511: Add has_dsi feature bit to struct
 adv7511_chip_info
Thread-Index: AQHZzhDNRooR6Y68PEqAs3TUYFzfvrAA+T+AgABvdSA=
Date: Tue, 29 Aug 2023 14:19:02 +0000
Message-ID: <OS0PR01MB59227849D7EAA27F0DC6AB7986E7A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20230813180512.307418-1-biju.das.jz@bp.renesas.com>
 <20230813180512.307418-6-biju.das.jz@bp.renesas.com>
 <20230829073031.GA2302@pendragon.ideasonboard.com>
In-Reply-To: <20230829073031.GA2302@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS0PR01MB5922:EE_|OS3PR01MB8905:EE_
x-ms-office365-filtering-correlation-id: 09c805af-4d25-42a9-7c73-08dba89ae52d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ae6GWyMeE1qVj53XDf3HmQpUeaB4V7TLF9cq7SmhfsFb6RbR4cZ6xUDy1z6hWxQY01u/G9lCiSf7nW9lZbLR3YFQLw24yMWAwPVxFX0+Lg/nEWiCa0Rt/BoEc4E2V6v+iq1rXLbwjbl5qQKZh9IwJJoLkGzJTrawa8IniHshCllYeUlJ381KgGK4CIq3GEFJ8CdeYWW1qlwT74U5FOAYhEQmgyeWMo/8FTkcj5V/NJxekXGb4XsZeK2Z5834EKHjzYLIdsiEQC4nSyqP6g1/yMrl5vGKCzuSqx4Ee9z9SSBd9xpCNWgt5ydAfLjsRBKNYNu1p+UHcM3Oy5qT0bAM9ys1Igw83bTV3NpobERSmhyLqcFEGAyQtPOIccA7IIpTIMFUsDGquglcIQlxu3xicq+VSw2Xprx/q84RFnmPRVF93tx1yWdUYsf8p7hI7wiXK6opNjghL6KApE619+7EGjepaNeCEVMDYkyqNMWrPlOQ65ddCo0AodG9LMWssnNoedaYYXw7vCL9K3iK38Qzo42xYTrpfJ7cuhg0i/HclHJ5dBJcoE5yksycg2aEon9G6EcyR+XDAh0JCcUaqENuJgs2gREF6erttbdPvZjhbD6sNdbulGWd0J0m4CW9Cwr1
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(346002)(396003)(366004)(136003)(1800799009)(186009)(451199024)(7416002)(2906002)(54906003)(76116006)(33656002)(64756008)(66446008)(66476007)(66556008)(66946007)(5660300002)(316002)(6916009)(55016003)(41300700001)(8936002)(4326008)(8676002)(52536014)(71200400001)(6506007)(7696005)(9686003)(38100700002)(38070700005)(122000001)(86362001)(478600001)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YlJPbUw1NktQMWRXNCt1aCs2ajQ2SngrVDB3QTI4N1R1bEpjUDl0SVVjMEs5?=
 =?utf-8?B?WXF5cFlUa1hFSG9jYXdKNVE1aHhMQXhSVVBVZHZUbi8yRHVma04vQngxeVBk?=
 =?utf-8?B?azZaMUM1SnQybno4eWVvaUxkbU9FcURnT3JlelZ2RWRpbGo4NnE3dEloSFNE?=
 =?utf-8?B?bFUwSEdlTkl0bzJkYU5kZU5xZkQ0T3Q4NWtPa21TcUFRdEVzSHMyUWJibUE1?=
 =?utf-8?B?SXZVaHp2L1NvdGN2aTBOeTZBalJCVDRTTVRHTE10NFMvL1BTSW5aZ3ExdUg1?=
 =?utf-8?B?UFB2dXlhTlQyK3hUQWsxNU4rVDd3akVKZ3BQYzRoVVcwbm1Ram1PQXJGVVhm?=
 =?utf-8?B?eXdqOVFLTFhWY0ZzUmdnSWl5K1FoSGZvV010QjN4MDhjWms1b3N6WTlwUE1z?=
 =?utf-8?B?TkFBVmVxaGtBa0s0SWJNV29heGE1MWJudFRrRU84aFlrcktXSWhtdXVVeEg4?=
 =?utf-8?B?dUE4YStUWStwc0NodDR6a21KOHZBSGpGdk44Z0xtb2E0dWY2U2dzSTZUd2RZ?=
 =?utf-8?B?MUJoTGh4dFZsa1poT1ZvWkxHRWx0UmxBY3JUOEdsZW02THBFRm5MRlZJRGNj?=
 =?utf-8?B?MEsrVnBuRXhSVm8wS0xFYmJYMGYydTl6UEFPNjVGWHpnK0ozN0pvcEpEaVlP?=
 =?utf-8?B?bXc1bnN6SnFjRWJpMmZoWHVOa2h0cERkY0pucXhncXBia05ycG94MkpqQXo3?=
 =?utf-8?B?WFFWdE9lOXNUVlNpN0ZjbkdJd3BhamMydTRDMFFteUYydUgwVjJtSVdpNDlO?=
 =?utf-8?B?RmxjaFpMSExLWGFGMDFWb2l2R0xHUW14NGpHTkdPN2taN0NGWnhvTlpqcHNs?=
 =?utf-8?B?M0ppQXJHeTMvK2lOdGtuMTdqZzVCQlcvVmZaeU9GWGk2RnY2ZFpkM05CMzkz?=
 =?utf-8?B?VkNEZWpHNW5VR1dNQlZNMVhoNFZyR2M1T0FtYmVpdEo5YndNYUFPblUrSTE4?=
 =?utf-8?B?TTdzeFhBWnFJK0JLcG11c3owbXVlOFJTNlRENDdvUHlZT3FsSHBhOW9GdThq?=
 =?utf-8?B?Z2k2MThEcDRpcFNXdm9qSTFWNUM0R0lsb3l4UmdsZVdWRVQ0cFJYUWJyeW4r?=
 =?utf-8?B?Z3JneFpQN2J1Z0N1b0NjNS8xNzZhV3FPZFdDRDQ5dnZpMlQzQXZVT0llb0o5?=
 =?utf-8?B?UXNqd0RqOVo0QWs5bVlQSzdiTEQrcENNR20rOTA1RU5wQkN6cjdxZkxtaGRZ?=
 =?utf-8?B?TUR4RmxGb2xoZTNMUlV6NG9idzZXa0I4bFNodVlyRVV5TVNxTFljN2lJSUVE?=
 =?utf-8?B?aGZGdG9oQ1ZEYi81aWsrTkxoVDE5YW1paDNBNmZkNFIva2lHdGpSVXh0ZEZl?=
 =?utf-8?B?LzFXSHozN29ycC81dVBYdHdYL210bFplZGRYYnZlejA4T09FMjhFR3NNRWw3?=
 =?utf-8?B?Rm5aeTNSdUNMRHRzWWtvalN4bkR5UUlWMTcwMFdiYUdzU2taS2pEekQyaWdT?=
 =?utf-8?B?RHNLSVhCcmtTQjNlWTN6NjBPZDI5QXIzcDdhSHNvdVRqYUNacEMwL1B6OTBx?=
 =?utf-8?B?OUozT3htcHFCWU1EKzkvUEtFQ0tFTmRCMHpGaUllRDN1Y1oxeVN6N005dXlB?=
 =?utf-8?B?TXFlMTQyeFJIVjhiOUtZM1M2WEsrZG5ka3h2QkhHSUhnNUlzU3orR3oyMWZx?=
 =?utf-8?B?UUlHOXRjVHc1c2MxOWdpRnFWRnZMMnBDbDUzdDJhN0liUUFVT1l5QnYwY1Jq?=
 =?utf-8?B?TUt5MDZoMHJSaEJ2UUkzS3pCRk4xWGFTUitPMHJXa0djczkyd09LKzBUT0dm?=
 =?utf-8?B?RlQ0WkRkSnkzTG9hckNPNlZXeDk1YjEzQ3FaRVdkbUpOMG5mMnR2V0lxbnFk?=
 =?utf-8?B?MjBLUGxOZXArOGFPR1pKTmlzZ291OHh5TDlXbmpsTFhZREhaaHBBU29IVlIr?=
 =?utf-8?B?ZThONGdjZCtXSU91SVBTbU82eFZvd1B2U3BnMGdPcnljTVJKNi9xdDFjTDYy?=
 =?utf-8?B?SURLNXEzRGt2cmxPL3IvK1BNaWFMdW5LbngzUWhETlZROCt5RFoxVXBlQkF6?=
 =?utf-8?B?WXpCdjVDc0pBeHBBUHIxVWt0TjhPTmhhLzFueW15SVJYNW50cHRMQUZPQTEr?=
 =?utf-8?B?VE84eTlZa2J0RzNFSnJIUk5vNGJoMzNMeG9ZV2V3YVRweGZ4TEhVUkM2UnRx?=
 =?utf-8?Q?qnm4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09c805af-4d25-42a9-7c73-08dba89ae52d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2023 14:19:02.6343 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: FeUR/jdvlaeCYMNc0mVrxrTFl9HxoUjks/z6VIrviejoH8wugO2lLMJdGLWsyUHBS/GHdJUgUYasSYB6PzR72DzJpmmHQ+6haMDilE25FUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8905
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Jonas Karlman <jonas@kwiboo.se>,
 Adam Ford <aford173@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bogdan Togorean <bogdan.togorean@analog.com>,
 =?utf-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>,
 Ahmad Fatoum <a.fatoum@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSCA1LzddIGRybTogYWR2NzUxMTogQWRkIGhhc19kc2kgZmVhdHVyZSBiaXQgdG8gc3Ry
dWN0DQo+IGFkdjc1MTFfY2hpcF9pbmZvDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gVGhhbmsgeW91
IGZvciB0aGUgcGF0Y2guDQo+IA0KPiBPbiBTdW4sIEF1ZyAxMywgMjAyMyBhdCAwNzowNToxMFBN
ICswMTAwLCBCaWp1IERhcyB3cm90ZToNCj4gPiBUaGUgQURWNzUzMyBhbmQgQURWNzUzNSBoYXZl
IERTSSBzdXBwb3J0LiBBZGQgYSBmZWF0dXJlIGJpdCBoYXNfZHNpIHRvDQo+ID4gc3RydWN0IGFk
djc1MTFfY2hpcF9pbmZvIGZvciBoYW5kbGluZyBjb25maWd1cmF0aW9uIHJlbGF0ZWQgdG8gRFNJ
Lg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVz
YXMuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2
NzUxMS5oICAgICB8ICAxICsNCj4gPiAgZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fk
djc1MTFfZHJ2LmMgfCAyMA0KPiA+ICsrKysrKysrKysrLS0tLS0tLS0tDQo+ID4gIDIgZmlsZXMg
Y2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4gYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+ID4gaW5kZXggYjI5ZDEx
Y2FlOTMyLi4yYTAxN2JiMzFhMTQgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
YWR2NzUxMS9hZHY3NTExLmgNCj4gPiBAQCAtMzM5LDYgKzMzOSw3IEBAIHN0cnVjdCBhZHY3NTEx
X2NoaXBfaW5mbyB7DQo+ID4gIAl1bnNpZ25lZCBsb25nIG1heF9sYW5lX2ZyZXE7DQo+ID4gIAlj
b25zdCBjaGFyICogY29uc3QgKnN1cHBseV9uYW1lczsNCj4gPiAgCXVuc2lnbmVkIGludCBudW1f
c3VwcGxpZXM7DQo+ID4gKwl1bnNpZ25lZCBoYXNfZHNpOjE7DQo+IA0KPiBBcyB5b3UncmUgbm90
IHNob3J0IG9mIHNwYWNlIGhlcmUsIEknZCBtYWtlIHRoaXMgYSBib29sLg0KDQpPSywgd2lsbCB1
c2UgYm9vbCBoZXJlLg0KDQo+IA0KPiA+ICB9Ow0KPiA+DQo+ID4gIHN0cnVjdCBhZHY3NTExIHsN
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFf
ZHJ2LmMNCj4gPiBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2Rydi5j
DQo+ID4gaW5kZXggZjZmMTVjMWIwODgyLi42NmIzZjhmY2Y2N2QgMTAwNjQ0DQo+ID4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTFfZHJ2LmMNCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMV9kcnYuYw0KPiA+IEBAIC0zNzMs
NyArMzczLDcgQEAgc3RhdGljIHZvaWQgYWR2NzUxMV9wb3dlcl9vbihzdHJ1Y3QgYWR2NzUxMSAq
YWR2NzUxMSkNCj4gPiAgCSAqLw0KPiA+ICAJcmVnY2FjaGVfc3luYyhhZHY3NTExLT5yZWdtYXAp
Ow0KPiA+DQo+ID4gLQlpZiAoYWR2NzUxMS0+aW5mby0+dHlwZSA9PSBBRFY3NTMzIHx8IGFkdjc1
MTEtPmluZm8tPnR5cGUgPT0gQURWNzUzNSkNCj4gPiArCWlmIChhZHY3NTExLT5pbmZvLT5oYXNf
ZHNpKQ0KPiA+ICAJCWFkdjc1MzNfZHNpX3Bvd2VyX29uKGFkdjc1MTEpOw0KPiA+ICAJYWR2NzUx
MS0+cG93ZXJlZCA9IHRydWU7DQo+ID4gIH0NCj4gPiBAQCAtMzk3LDcgKzM5Nyw3IEBAIHN0YXRp
YyB2b2lkIF9fYWR2NzUxMV9wb3dlcl9vZmYoc3RydWN0IGFkdjc1MTENCj4gPiAqYWR2NzUxMSkg
IHN0YXRpYyB2b2lkIGFkdjc1MTFfcG93ZXJfb2ZmKHN0cnVjdCBhZHY3NTExICphZHY3NTExKSAg
ew0KPiA+ICAJX19hZHY3NTExX3Bvd2VyX29mZihhZHY3NTExKTsNCj4gPiAtCWlmIChhZHY3NTEx
LT5pbmZvLT50eXBlID09IEFEVjc1MzMgfHwgYWR2NzUxMS0+aW5mby0+dHlwZSA9PSBBRFY3NTM1
KQ0KPiA+ICsJaWYgKGFkdjc1MTEtPmluZm8tPmhhc19kc2kpDQo+ID4gIAkJYWR2NzUzM19kc2lf
cG93ZXJfb2ZmKGFkdjc1MTEpOw0KPiA+ICAJYWR2NzUxMS0+cG93ZXJlZCA9IGZhbHNlOw0KPiA+
ICB9DQo+ID4gQEAgLTc4Niw3ICs3ODYsNyBAQCBzdGF0aWMgdm9pZCBhZHY3NTExX21vZGVfc2V0
KHN0cnVjdCBhZHY3NTExICphZHY3NTExLA0KPiA+ICAJZWxzZQ0KPiA+ICAJCWxvd19yZWZyZXNo
X3JhdGUgPSBBRFY3NTExX0xPV19SRUZSRVNIX1JBVEVfTk9ORTsNCj4gPg0KPiA+IC0JaWYgKGFk
djc1MTEtPmluZm8tPnR5cGUgPT0gQURWNzUxMSkNCj4gPiArCWlmICghYWR2NzUxMS0+aW5mby0+
aGFzX2RzaSkNCj4gDQo+IFdoaWxlIHRoaXMgaXMgZnVuY3Rpb25hbGx5IGVxdWl2YWxlbnQsIGlz
IHRoZSByZWdpc3RlciBiZWxvdyByZWFsbHkgcmVsYXRlZA0KPiB0byBEU0kgPyBJZiBub3QsIEkn
ZCByYXRoZXIgbm90IGNoZWNrIHRoZSBoYXNfZHNpIGZpZWxkIGhlcmUgYnV0IGtlZXANCj4gY2hl
Y2tpbmcgdGhlIHR5cGUuDQoNCldoYXQgY3JlYXRpbmcgYSBwYWNrZWQgdmFsdWUgZm9yIHRoaXMg
aGFyZHdhcmUgZGlmZmVyZW5jZQ0KYXMgZHJpdmVyIGRhdGE/DQoNCiB7IDB4ZmIsIDB4NiwgMHgx
fSBhbmQgeyAweDRhLCAweGMsIDIpIHBhY2tlZCBhcyB1bnNpZ25lZCBpbnQNCmRyaXZlciBkYXRh
IGxvd19yZWZyZXNoX2RhdGEgYW5kIHdlIGNhbiBnZXQgcmlkIG9mIHRoaXMNCmlmIHN0YXRlbWVu
dCBhbmQgZGVwYWNrIGl0IGhlcmUuDQoNCj4gDQo+ID4gIAkJcmVnbWFwX3VwZGF0ZV9iaXRzKGFk
djc1MTEtPnJlZ21hcCwgMHhmYiwNCj4gPiAgCQkJCSAgIDB4NiwgbG93X3JlZnJlc2hfcmF0ZSA8
PCAxKTsNCj4gPiAgCWVsc2UNCj4gPiBAQCAtOTIxLDcgKzkyMSw3IEBAIHN0YXRpYyBlbnVtIGRy
bV9tb2RlX3N0YXR1cw0KPiA+IGFkdjc1MTFfYnJpZGdlX21vZGVfdmFsaWQoc3RydWN0IGRybV9i
cmlkZ2UgKmJyaWRnZSwgIHsNCj4gPiAgCXN0cnVjdCBhZHY3NTExICphZHYgPSBicmlkZ2VfdG9f
YWR2NzUxMShicmlkZ2UpOw0KPiA+DQo+ID4gLQlpZiAoYWR2LT5pbmZvLT50eXBlID09IEFEVjc1
MzMgfHwgYWR2LT5pbmZvLT50eXBlID09IEFEVjc1MzUpDQo+ID4gKwlpZiAoYWR2LT5pbmZvLT5o
YXNfZHNpKQ0KPiA+ICAJCXJldHVybiBhZHY3NTMzX21vZGVfdmFsaWQoYWR2LCBtb2RlKTsNCj4g
PiAgCWVsc2UNCj4gPiAgCQlyZXR1cm4gYWR2NzUxMV9tb2RlX3ZhbGlkKGFkdiwgbW9kZSk7IEBA
IC0xMDg2LDcgKzEwODYsNyBAQA0KPiBzdGF0aWMNCj4gPiBpbnQgYWR2NzUxMV9pbml0X2NlY19y
ZWdtYXAoc3RydWN0IGFkdjc1MTEgKmFkdikNCj4gPiAgCQlnb3RvIGVycjsNCj4gPiAgCX0NCj4g
Pg0KPiA+IC0JaWYgKGFkdi0+aW5mby0+dHlwZSA9PSBBRFY3NTMzIHx8IGFkdi0+aW5mby0+dHlw
ZSA9PSBBRFY3NTM1KSB7DQo+ID4gKwlpZiAoYWR2LT5pbmZvLT5oYXNfZHNpKSB7DQo+IA0KPiBT
YW1lIGNvbW1lbnQgaGVyZSwgdGhpcyBkb2Vzbid0IHNlZW0gbG9naWNhbGx5IHJpZ2h0Lg0KDQpC
dXQgdGhpcyBwYXRjaGluZyBpcyBhcHBsaWNhYmxlIGZvciBEU0kuDQoNCg0KPiANCj4gPiAgCQly
ZXQgPSBhZHY3NTMzX3BhdGNoX2NlY19yZWdpc3RlcnMoYWR2KTsNCj4gPiAgCQlpZiAocmV0KQ0K
PiA+ICAJCQlnb3RvIGVycjsNCj4gPiBAQCAtMTI0NSw3ICsxMjQ1LDcgQEAgc3RhdGljIGludCBh
ZHY3NTExX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50ICppMmMpDQo+ID4gIAkJZ290byB1bmluaXRf
cmVndWxhdG9yczsNCj4gPiAgCWRldl9kYmcoZGV2LCAiUmV2LiAlZFxuIiwgdmFsKTsNCj4gPg0K
PiA+IC0JaWYgKGluZm8tPnR5cGUgPT0gQURWNzUxMSkNCj4gPiArCWlmICghaW5mby0+aGFzX2Rz
aSkNCj4gDQo+IEFuZCBoZXJlIHRvby4NCg0KV2lsbCBjcmVhdGUgYW5vdGhlciBib29sLiBpbmZv
LT5oYXNfZHBpLCBpcyBpdCBvaz8/DQoNCkNoZWVycywNCkJpanUNCg0KPiANCj4gPiAgCQlyZXQg
PSByZWdtYXBfcmVnaXN0ZXJfcGF0Y2goYWR2NzUxMS0+cmVnbWFwLA0KPiA+ICAJCQkJCSAgICBh
ZHY3NTExX2ZpeGVkX3JlZ2lzdGVycywNCj4gPiAgCQkJCQkgICAgQVJSQVlfU0laRShhZHY3NTEx
X2ZpeGVkX3JlZ2lzdGVycykpOw0KPiA+IEBAIC0xMzE2LDcgKzEzMTYsNyBAQCBzdGF0aWMgaW50
IGFkdjc1MTFfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmkyYykNCj4gPg0KPiA+ICAJYWR2NzUx
MV9hdWRpb19pbml0KGRldiwgYWR2NzUxMSk7DQo+ID4NCj4gPiAtCWlmIChpbmZvLT50eXBlID09
IEFEVjc1MzMgfHwgaW5mby0+dHlwZSA9PSBBRFY3NTM1KSB7DQo+ID4gKwlpZiAoaW5mby0+aGFz
X2RzaSkgew0KPiA+ICAJCXJldCA9IGFkdjc1MzNfYXR0YWNoX2RzaShhZHY3NTExKTsNCj4gPiAg
CQlpZiAocmV0KQ0KPiA+ICAJCQlnb3RvIGVycl91bnJlZ2lzdGVyX2F1ZGlvOw0KPiA+IEBAIC0x
MzcwLDcgKzEzNzAsOCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFkdjc1MTFfY2hpcF9pbmZvDQo+
IGFkdjc1MzNfY2hpcF9pbmZvID0gew0KPiA+ICAJLm1heF9tb2RlX2Nsb2NrID0gODAwMDAsDQo+
ID4gIAkubWF4X2xhbmVfZnJlcSA9IDgwMDAwMCwNCj4gPiAgCS5zdXBwbHlfbmFtZXMgPSBhZHY3
NTMzX3N1cHBseV9uYW1lcywNCj4gPiAtCS5udW1fc3VwcGxpZXMgPSBBUlJBWV9TSVpFKGFkdjc1
MzNfc3VwcGx5X25hbWVzKQ0KPiA+ICsJLm51bV9zdXBwbGllcyA9IEFSUkFZX1NJWkUoYWR2NzUz
M19zdXBwbHlfbmFtZXMpLA0KPiA+ICsJLmhhc19kc2kgPSAxDQo+ID4gIH07DQo+ID4NCj4gPiAg
c3RhdGljIGNvbnN0IHN0cnVjdCBhZHY3NTExX2NoaXBfaW5mbyBhZHY3NTM1X2NoaXBfaW5mbyA9
IHsgQEANCj4gPiAtMTM3OCw3ICsxMzc5LDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhZHY3NTEx
X2NoaXBfaW5mbw0KPiBhZHY3NTM1X2NoaXBfaW5mbyA9IHsNCj4gPiAgCS5tYXhfbW9kZV9jbG9j
ayA9IDE0ODUwMCwNCj4gPiAgCS5tYXhfbGFuZV9mcmVxID0gODkxMDAwLA0KPiA+ICAJLnN1cHBs
eV9uYW1lcyA9IGFkdjc1MzNfc3VwcGx5X25hbWVzLA0KPiA+IC0JLm51bV9zdXBwbGllcyA9IEFS
UkFZX1NJWkUoYWR2NzUzM19zdXBwbHlfbmFtZXMpDQo+ID4gKwkubnVtX3N1cHBsaWVzID0gQVJS
QVlfU0laRShhZHY3NTMzX3N1cHBseV9uYW1lcyksDQo+ID4gKwkuaGFzX2RzaSA9IDENCj4gPiAg
fTsNCj4gPg0KPiA+ICBzdGF0aWMgY29uc3Qgc3RydWN0IGkyY19kZXZpY2VfaWQgYWR2NzUxMV9p
MmNfaWRzW10gPSB7DQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFy
dA0K
