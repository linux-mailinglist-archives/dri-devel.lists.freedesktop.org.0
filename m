Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0531D7D93E1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 11:38:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9637610E966;
	Fri, 27 Oct 2023 09:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaf::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE32910E966
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Oct 2023 09:37:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqCMpG6GuewQB/XCWXaIRcCWtZ/0OiSTa0HGcIM1b9agIKJMsdfYAKdLM5683aLbZmX/nt9pb29eKAud7mwPstl7HZDVbuhjLEMWZxQGT2xV//bWsr7Sdac53iBQhK88RM6HQondFXA9klIl1PUuDgAc0549W/IsrGH+n5JNDv5JFgY3gv27066XQC3wy5MKpL87SIpoIgKuqoT5MjrU+e+7xP+R6f7F4c4SNBnXEt/vbsTGeLpfqb39xlkI4IlAchXzBhS8zqtpJwUG3RHac/zk1V1mU8wL2FCeDYssz2IZa6QKgmCf2FInx0NHcPFMJH94LJMbqltm3/8x1faT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HyPDwZt4moE2dadVYtOyzg29hMKTFbLrxKb+PwbYnDM=;
 b=cRxE5dh8EBFMSZ5aOQOkq7rwxihnPd+CaciWk3fsw4rnQiM0G2LYW2LyOIB0HpqvoiujwIJgBeygScCHA5hHTBfC55XusFevwhTPhneucUoRV8gG1KbjW5y52bAYgrZ9EzMIa7En9nhje09KKPkpUKfpaay5/yP0xvzsUuw2vzh1KcUgf5SXERDpuyEgEP86PxBLKDZsQzqbEQSbqPaVy98ArsQk1aPMQiP6bTejau4eJZJg3eGviFfjPaima9MCqE6aZ7cChCNtI4aroBlS5L03r71eK20xcZC+S5JLa8F+wHPFUq+VE5TPL3XUp3K6xIJUmgdTOhhuzLJ9MEcLSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HyPDwZt4moE2dadVYtOyzg29hMKTFbLrxKb+PwbYnDM=;
 b=tKtoFcCernAf8/+X0BlvCRRlSHpMxdig9PfTyIAk8U6XgIpkRbKiaKO5tNhwSY/3lG/9rip4rv+taT56HdzZM0jHiohTPykqWFVjL2PfrD9AclAkt0CEaXCQAwfXrLaq6zPpDx4bSvTvuA7EGT9WIIglIydmEx7GTgdBAu5oH6U=
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com (2603:10a6:803:b6::20)
 by PA4PR03MB8295.eurprd03.prod.outlook.com (2603:10a6:102:260::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.23; Fri, 27 Oct
 2023 09:37:54 +0000
Received: from VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35]) by VI1PR03MB4942.eurprd03.prod.outlook.com
 ([fe80::67c9:f19a:51af:df35%7]) with mapi id 15.20.6933.024; Fri, 27 Oct 2023
 09:37:54 +0000
From: Emil Abildgaard Svendsen <EMAS@bang-olufsen.dk>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] drm: bridge: adv7511: fix reading edid segments
Thread-Topic: [PATCH] drm: bridge: adv7511: fix reading edid segments
Thread-Index: AQHaB//Vr2lGoiWaYEqV/lAWTsFsCLBcJxwAgAE7aQA=
Date: Fri, 27 Oct 2023 09:37:54 +0000
Message-ID: <ZTuE8sbA7Chuni0o@emil-HP-ZBook-Studio-G5>
References: <20231026113029.575846-1-emas@bang-olufsen.dk>
 <CAOMZO5CqOvAd=U57=jrG0JqcoMJsKtZ-sAox_=8Wtn4a22R0Kg@mail.gmail.com>
In-Reply-To: <CAOMZO5CqOvAd=U57=jrG0JqcoMJsKtZ-sAox_=8Wtn4a22R0Kg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR03MB4942:EE_|PA4PR03MB8295:EE_
x-ms-office365-filtering-correlation-id: dfeae96e-b351-42bc-81b5-08dbd6d06585
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: FXab0C7dbJEXpMZKTlhLe/yPLQHRVx9xHGhYD6ef3fvEUIbyZC2gHonTjP/zF2t12ZR0IHqWa1Oa8j2vmWAhsEUaG2/UK88dsx6hkj/VkE9Zynmki/PHu2GXdm6LkKcXP1RMEhfFtL2T9Iz6rmRMBMr84yTbPNwd6Y2Kj6Jc4YEbzcpQIQBg2StxW4q/S0JGU5OLOICcVVfD6uBTlhwZefv2z5Pdy0l7TJd/b2GxCoFqCwNDE9aL6Q+2s4ZBmy1D2EJSi43HGOBZNDloNitpveOzoMtZ5csl44t+QyInGskPToLFi/uSNNpxAi/4USROQRs+jROyCQoDsArfEI8rJYjLZB1Q4GLck0gf1WSAlzk2vSYLgPozt5OoO5XbuU6wLBXcW/GlKc7zuElq3mEM4ccpVwRPOzNUGwpFgbLdCFBai+Nz0Y7hZySP5J3zUyXlbJxnoGR4Ri0ur4PrZMdFN9X87QOCiz+m2GqkZSAxAJvwL7PnaCqiRa9xDt/2BFkthLu6yT+87uT8A6ubKAiUqgKKhme69aJjvzdCC9kHt8n7UgBLr18e5PYqTjVIZz8OIYUtRFisekFrb4Y5WqyVg4+lhTQHVu09xgLJW+l/5QXLUH+Vds52B3GrMNrIQ693
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR03MB4942.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(346002)(376002)(136003)(396003)(366004)(39850400004)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(66556008)(54906003)(66946007)(64756008)(66446008)(91956017)(316002)(76116006)(6916009)(66476007)(53546011)(6506007)(71200400001)(122000001)(9686003)(38100700002)(6512007)(8676002)(4326008)(8936002)(7416002)(33716001)(26005)(5660300002)(6486002)(2906002)(478600001)(86362001)(83380400001)(38070700009)(41300700001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Sm5pT2FHRC9yWERWS0w0YTdjVy9ocFdybURvdEQ0a2tFRUdDN1h5Y1Z4VTE3?=
 =?utf-8?B?cS9mbGgzYVNrcUhHZVdWd0lhNjJpY3pLNnUwM1dnTEhDdU5aNFJFZVVWR0FP?=
 =?utf-8?B?SS9LcSs0bHF2ZE1yQlpXM1M4djdSMlQxcFBuQW91ZFAxUHRPYy9mNEZmQWY2?=
 =?utf-8?B?OEZvRHlTdTh5UmpobStPWWJzbGRMN1dweDRBYzA3b0RCNW8va2lKeUExcVMz?=
 =?utf-8?B?ZXZPNzdvQ3Zmb3ROZVNqQ0hIZFVIRStpR2QyVUtpTXoxbGJkREIxNjF6VktN?=
 =?utf-8?B?ejc4NmVCOFgrTWYwMXRlNC9JR1hDZlhTczJPaVdJd09tTk96YndXZUJUOXFt?=
 =?utf-8?B?Wm5vU3p6NGVlYW9XQ2krdVo3YWxlRUhqZitheEJhQk4yRFIwTGUwYTRuVjRG?=
 =?utf-8?B?SVJzQ3FJRTZLZkNhaUlDOGVBOXl3WitHYm14WHhuUjdqUFQ0VFQxQTVkU09i?=
 =?utf-8?B?YXV4TWUrWHY0V2htR3lIamV3dTBHT2txSmdZaENRdEt4SlVtNkNzR3ZyMlRS?=
 =?utf-8?B?b3d6ZjhSbnNmQXJXdTFNMjdtZSsySVBRZE1ZditvNXI2S3FjZlEyZ1pyams2?=
 =?utf-8?B?UFpPa1c2Q3pLL0R0ejFjdkZMUHkrQWtDWldtZmsrTVpCZnRqTU1QQ2w3SStk?=
 =?utf-8?B?a1pzQUdzRXdWNUJWMm42Mlp1TjVaZzBWK2Y2YWNuVkpjR2JQUFBkTmFyWE1B?=
 =?utf-8?B?UWlhcXNWMk42V0tXVWlFNmd2eUc4enJ1bzJZN2pSKzVVRkdXNVJuLzY4Z2t1?=
 =?utf-8?B?dVZEOEtha2QzZEpBK2hrSGRSM3YxRzhWYjhPcmVXS1N2SVVMSDlRY1VndEZL?=
 =?utf-8?B?bHVTVlI3by9iQUVDNUJScWpMVWNPOC94dUZ2bkJxdGUrbzI3bGN4N1ppVGd4?=
 =?utf-8?B?UVJnaStkUlZITU4xNWtkUzROTEh5a3ZsQTBXTzhCaHFtbFZvYXVsdDZBMGph?=
 =?utf-8?B?bmkvd3JLUG1oSTBDUXNNVHg2UnZWZ3MrU09LUnczQXVXVkVvRHdST1JQbGIx?=
 =?utf-8?B?dFhlS3NaTzREVkt3a0JkN2h5Ymt2akhlS3Z3MDY2T1prWkF0MEZIRU16VTha?=
 =?utf-8?B?RitqbCtEODV3YTRVV1I3UHNRQ3AwZEt3V0R5cGxYKzJWWUh6K2Q5WWdCdktR?=
 =?utf-8?B?dTNiU3Y4TnNpTithQjE0RW9aTWZLWVZZemdueThsK2RzdGtOYWpJUlFnNzR3?=
 =?utf-8?B?K3BTQjJmNEMxQ3N3YUlYTVVoblpNdnBVYVQ4aVg5dkYvZVZ6UXBKMUVUUmVO?=
 =?utf-8?B?cFdBQ0RZSHJoZERzK21SOC9SVzUyQjJFQzN3UHJhZjFlNUg2YVAvbWpWTXpv?=
 =?utf-8?B?aEtiZFYvMjhwb2h1aGlWTmFpRFh0ZHkzckt4NmVCeThSQTRBbWdRT1dOTmhp?=
 =?utf-8?B?SDFkUmgxUThrREpCMXQwQWVwSUk2M0d1Yi9CNjlyZ0R3Tm1Dd1pmSDBWUUE5?=
 =?utf-8?B?V29JazJXNUo1SklDdFFFeitPZ25ZL1RVMnJVVTNwTVRMQ2l1enVnb05uTWlq?=
 =?utf-8?B?VkozM01ZQUZFR041UlJ4eUVoZDBpYnZJc2dWMVhNSXk2UTJUaTFEbStnSmJI?=
 =?utf-8?B?N1hnZC9YMTU0ZUY0Q2RId3h6ZXl0cjRJOEZsV3BlN2VUa0w1ZHlYZXpBOHRh?=
 =?utf-8?B?QkpOSVd5OWsreUdTOGZFUGU2bHR4emlVOEdubnpJRWg5ZzZUdVhFU1BMWTBC?=
 =?utf-8?B?dHdGa2FBUklCay9zNjJSV3d4bHRaOEdBaHRyaHdqeTRodXROaEE2MGhjTjc4?=
 =?utf-8?B?VXRRN0JCMDZlYklHTXkxbjNoSlNxczRITWE0c2hmbnhKbitydVcwUXZGalhF?=
 =?utf-8?B?TkhLbm43S2RkWVZXajRnZXIreks4WnkwdEJHeHVBa0pYWkRVMlhxd3dneWRG?=
 =?utf-8?B?ZC90V0xoREZwNlBnM3V1VVRZTDNxLzJxamY2NlpOTFhLSFJpcjJ6eEwwZjJz?=
 =?utf-8?B?SXRIenlCcUNBVWZGc2dEc0E1QjdxVFBhaFBRTythTFVlc3NDZEdzRXZaaU9W?=
 =?utf-8?B?SFRSblA4VUE3aU9jVFhQa0ttTi82VVRhRk8rYkhENEs4UzZ1Qzc1YVpCZy8r?=
 =?utf-8?B?bkNwbzgzMkFvcXMxUy9nSEh6Y0RKYlJZNHEzRXVCQnQ2aVZMSlJCYXgzWDJm?=
 =?utf-8?B?b0dSbTJ3WThBc2x0WGdIR3hVNlhFYnNZS1BzSXlnRjc5YS94Q1duOVh1Q0hp?=
 =?utf-8?B?QXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4D8C3ECC70E90544AC318D2AA0282F79@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4942.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfeae96e-b351-42bc-81b5-08dbd6d06585
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 09:37:54.7557 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Kt/48uWVdbqrzxp2uhP5tRVj5ld28Qk1dsJpnWxJL0IdrfYQJ1+evdPqD7Y395mjUe1iHDN5d0xsmD6E5AqNzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB8295
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMjYsIDIwMjMgYXQgMTE6NDk6MDBBTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3
cm90ZToNCj4gSGkgRW1pbCwNCj4gDQo+IE9uIFRodSwgT2N0IDI2LCAyMDIzIGF0IDExOjQ34oCv
QU0gRW1pbCBBYmlsZGdhYXJkIFN2ZW5kc2VuDQo+IDxFTUFTQGJhbmctb2x1ZnNlbi5kaz4gd3Jv
dGU6DQo+ID4NCj4gPiBDdXJyZW50bHkgcmVhZGluZyBFRElEIG9ubHkgd29ya3MgYmVjYXVzZSB1
c3VhbGx5IG9ubHkgdHdvIEVESUQgYmxvY2tzDQo+ID4gb2YgMTI4IGJ5dGVzIGlzIHVzZWQuIFdo
ZXJlIGFuIEVESUQgc2VnbWVudCBob2xkcyAyNTYgYnl0ZXMgb3IgdHdvIEVESUQNCj4gPiBibG9j
a3MuIEFuZCB0aGUgZmlyc3QgRURJRCBzZWdtZW50IHJlYWQgd29ya3MgZmluZSBidXQgRS1FRElE
IHNwZWNpZmllcw0KPiA+IHVwIHRvIDEyOCBzZWdtZW50cy4NCj4gPg0KPiA+IFRoZSBsb2dpYyBp
cyBicm9rZW4gc28gY2hhbmdlIEVESUQgc2VnbWVudCBpbmRleCB0byBtdWx0aXBsZSBvZiAyNTYN
Cj4gPiBieXRlcyBhbmQgbm90IDEyOCAoYmxvY2sgc2l6ZSkuDQo+ID4NCj4gPiBBbHNvIGNoYW5n
ZSBjaGVjayBvZiBEREMgc3RhdHVzLiBJbnN0ZWFkIG9mIHNpbGVudGx5IG5vdCByZWFkaW5nIEVE
SUQNCj4gPiB3aGVuIGluICJJRExFIiBzdGF0ZSBbMV0uIENoZWNrIGlmIHRoZSBEREMgY29udHJv
bGxlciBpcyBpbiByZXNldA0KPiA+IGluc3RlYWQgKG5vIEhQRCkuDQo+ID4NCj4gPiBbMV0NCj4g
PiBBRFY3NTExIFByb2dyYW1taW5nIEd1aWRlOiBUYWJsZSAxMTogRERDQ29udHJvbGxlciBTdGF0
dXM6DQo+ID4NCj4gPiAgIDB4QzggWzM6MF0gIEREQyBDb250cm9sbGVyIFN0YXRlDQo+ID4NCj4g
PiAgIDAwMDAgICAgICAgIEluIFJlc2V0IChObyBIb3QgUGx1ZyBEZXRlY3RlZCkNCj4gPiAgIDAw
MDEgICAgICAgIFJlYWRpbmcgRURJRA0KPiA+ICAgMDAxMCAgICAgICAgSURMRSAoV2FpdGluZyBm
b3IgSERDUCBSZXF1ZXN0ZWQpDQo+ID4gICAwMDExICAgICAgICBJbml0aWFsaXppbmcgSERDUA0K
PiA+ICAgMDEwMCAgICAgICAgSERDUCBFbmFibGVkDQo+ID4gICAwMTAxICAgICAgICBJbml0aWFs
aXppbmcgSERDUCBSZXBlYXRlcg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogRW1pbCBTdmVuZHNl
biA8ZW1hc0BiYW5nLW9sdWZzZW4uZGs+DQo+IA0KPiBXaGF0IGFib3V0IHBhc3NpbmcgYSBGaXhl
cyB0YWc/DQoNClRoYW5rIHlvdSEgSSBzaW1wbHkgZm9yZ290LiBJIHdpbGwgYWRkIGl0Lg==
