Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BBD4E2B84
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 16:12:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C302510E352;
	Mon, 21 Mar 2022 15:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E47710E352
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 15:11:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fobs97SyXRkqfjgt23wcFIdnTGo/w4+9IgNjOSUX+qdufwdrPz60wMKLDHkEnXYr5DnJNhcSqCc/0YSyDFjsCnvQjfLHt/QIEs6zmSgXFFKKYgvAPv86WVw3s+tj7JqS2t72EqKxlFTHLxWiec12IxidZZHuHWvhCSQJD54lDcBfd6ehA89FBnpvKETVc4g5TJqlXKbxT15iw4lsGTYL6729I3d6aqNGRJrqClLu4GxFflE9Ch0Q7iS/bHR8Jb46dLqC2lhlekFhJI80Ii7euYW3fHSPCKYqZHD/mK2h7v0I9ZErGM6IM4hIOwgfm2Wgp8QUkgbpN1xSyV5mF25gQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1wFJdK6CwkWQnmvGN5vX59aayPuWLb+lPJldX7CfpA=;
 b=bMCAn+XKhY+GVfKAskMgmGsf5qdsCBxGREeM2i7mG2pN1SyHPlbdMTAWi2vi3B3Pe8EgIQvovL8xmWq2GE176bl27MX2l4vYlG8kSEbjj7PiimuIOJZK7AqUueo5LurkrDd2SB+IJEX6Ar/vJXKnj9BZi2w+UB7a2FEBrbRy/L5FE7NoLfvNWOUfVJLfD1dd62bxzUYY9rvQWfDy7ibJW6uJlOssCTAjHTm17JvIpepRhmQHeXu/9ALfSoWjwJkG3YrZ1MYZTniC00vgMFP2gOx7u+OEkOirsL+Er45BLg2tIbRUrTqz9RG1QiuoJn/2ItoupRwPS9MnqIiSh3jeNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b1wFJdK6CwkWQnmvGN5vX59aayPuWLb+lPJldX7CfpA=;
 b=r47MLkgkp26zL37U0zNetwafTKz7KlW1FrMJZfShoy7d103Q3xRfAnc/PC6I6I65Weu06ckiZQAZUAK18+NyCMdxUEHMHHgVdVRApee/6TY5QzKrg40vSgWslpkBebSm25NS5Fciwo6Z4w9p2JiamgpA3bd4x7Lk/AVclJztQyY=
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by SN6PR05MB5693.namprd05.prod.outlook.com (2603:10b6:805:f7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.15; Mon, 21 Mar
 2022 15:11:53 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c029:c5b4:6e3c:e8c]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::c029:c5b4:6e3c:e8c%7]) with mapi id 15.20.5102.015; Mon, 21 Mar 2022
 15:11:53 +0000
From: Zack Rusin <zackr@vmware.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "ckoenig.leichtzumerken@gmail.com" <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 07/23] drm/vmwgfx: stop using dma_resv_excl_fence
Thread-Topic: [PATCH 07/23] drm/vmwgfx: stop using dma_resv_excl_fence
Thread-Index: AQHYPSvVm4xK1+FNQUqjAPC0WhA6C6zJ3j8AgAAC5QCAABCBAA==
Date: Mon, 21 Mar 2022 15:11:52 +0000
Message-ID: <a4e761e3145685953c2246cd6ac60b1da521b756.camel@vmware.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
 <20220321135856.1331-7-christian.koenig@amd.com>
 <91bd73763a87c3311d8cc4878589f80a712c4574.camel@vmware.com>
 <ce7aef7c-01e8-d0d3-ca20-e0682400ecfd@amd.com>
In-Reply-To: <ce7aef7c-01e8-d0d3-ca20-e0682400ecfd@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.40.4-1ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vmware.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 883a791a-f608-4191-446f-08da0b4d21af
x-ms-traffictypediagnostic: SN6PR05MB5693:EE_
x-ld-processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
x-ms-exchange-atpmessageproperties: SA|SL
x-microsoft-antispam-prvs: <SN6PR05MB56938D5D0198AEB4B083FEA3CE169@SN6PR05MB5693.namprd05.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Ae749JRq7Um8jQwieJXiZ4w62QWeXURbmf61Ne9zum4ifDzWPPYGxh6NsBzFN/ku4olnQHg3RuGpHFlSo5fbH+rxK2AHXCJZNvhSUhhwhJcemsPB3kcys/k9TceE8RUPy4H4fcPjcFQsveQ2skVGFUJSWce7UV2T8teRo57a67aqHktfFIx8DuvvcZzvUOPJZz83FIfsgXcLhXIWKfUT70flQ2LIr3XgUFgQlOPwz0j8OHbNmSn+UGW/JWE8/Pb+/CucqwJWNCy1sDYl7z8aHWtYvWkrNbQ13hjNiR079wbrMA96ABPUgmV4GHEAxL77l6qWNAlB6mQvMolhG4LirGkwyoWkl49mD2WiMJj2mzRZMS7gGFMYt0Nso1RF68ricUiSOlAOKJUUhzgzmg3Eu15y0dDSYYuwf77U7bq6woBcj4vEXfiFPLEnQLiODPC0583HLFIAK1NF/ReYwopYpvDdZ5t6doRJvX8eW3Z+72QvGYCJOOEq/e1UXp1Ms/VVgT4quvTGpq392W57UNT7F2ZsiP7usx+2Iwpu20stvo/T/z/g4/bbOezqDtb6Ah7P6npr59D29F0a37XibBQvI1Qjsk3olZcHqOLlr2z3Rtb7eb7IfENEE7IGf5/04HYllaOE2Yvify/E9akl2hUfmHtAFwu/aTf2CnW0wVeUP2jzKHJnJMGTfeisS4n1hKQJz1yPGcnGOn/rySiRZS1DDA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(71200400001)(64756008)(508600001)(6486002)(110136005)(6512007)(36756003)(66446008)(83380400001)(66946007)(66476007)(8936002)(316002)(76116006)(8676002)(4326008)(66556008)(6506007)(5660300002)(38070700005)(2906002)(2616005)(86362001)(186003)(26005)(107886003)(66574015)(122000001)(38100700002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1MySkZEaTFUODM4U1VYRHd2RVowSE13T01GM2dKUEphT2g3dmFOQWpUajdY?=
 =?utf-8?B?cTlINkcyK0xGK2FBQ1IvYTluSmVnYysyUUh4SXhPRVN5alo2N3JZdDZiczdE?=
 =?utf-8?B?cmw3UTVlVkZNazZoc0ZNTWVkc09PdUhNOVo0L1VFT2tMYnVLa0lyV3RTWGdK?=
 =?utf-8?B?SGh0ZmhlNCtOOHNhampqY1NkL0Jua2pVcUVKeXFOdGd4dGE5NnRWcWtoNkZU?=
 =?utf-8?B?U3Z4cGxpNVhhZjBoWnkwdDdTclRNU1BUL3ZkQWtRdXEwNGd1Y2JRTTVkbHNH?=
 =?utf-8?B?OGh0dFdVSHp2SHNRUEo2MGRqOGNkSkFmK2R6U0ZRZnAxa0h3cERGUEN3NkVD?=
 =?utf-8?B?dEFTK3hKLzMrZS9jbHYyeDNvckZNTW8vMkVOaW5kbGFKcnZWNDBrTDZsQldU?=
 =?utf-8?B?MDBsWGo0N0Y5Z3VFdzQ0Ulp3OUo4ZEs0ZHU0TnZjWlkwOWE4aUc1ekt6aXlM?=
 =?utf-8?B?d2JibGZZdW1FQXZnZkovQzY4STRWc2N2UWNvNURxTjVaMXYwOHA3R0ZCcGdl?=
 =?utf-8?B?R3g5UW9WYzNxY0pIUmJFdWpjOUhkZWMzVTErZE9yR1d4NnBWSUZoMGcrT0Rj?=
 =?utf-8?B?cDJ0WnFNbHA0c3BLVU9vZHV2LzBrLzJ4UGZHLy9yS3M1bDk4N0NIa21qM2k1?=
 =?utf-8?B?QTJDZ2NvanN4T2RQMW9NNEdJQTVONUN0b0VkR2xUSXd1cjltemQ2MWEwWmRr?=
 =?utf-8?B?TS9kSjY2ZFJHMnFGMUplWFI0dVBmV0FuTXAvQlpYb25FdUpmb1hFNlIwQUh0?=
 =?utf-8?B?NTBxcGpFQkRVRDgzUE54alhIMjZMR0xDR3puNy9hL2xodDF2d0ViZmM3ZFNw?=
 =?utf-8?B?SkhnVC81M0pFZThFOWJ1Nmd2TGx4TzZ2MDd5U095S2FjY05vbVJRUHBNUWN4?=
 =?utf-8?B?NFVMM29uTGFMbkhQYjJraDlMbWlWWE0xaUdPSUUxK2tDNGptTHdtM2V6U2dW?=
 =?utf-8?B?MlV6ejk1VHc3TTZHaGp4Sk5paktwUTFyTkhGOXBoVk1YY3VZOTRhbER0L2ky?=
 =?utf-8?B?cmphM0N6clpXNVI0NDZXc2hLZ21oL1d1MjFNVjBPQ3FVbVVZdno4bU05eUFM?=
 =?utf-8?B?eWg0VFhWOXgzaVJ6U0J2SEZtdEtpMjZnQzd3V1hVUEVFc1I1SnFjVFZQdG5D?=
 =?utf-8?B?S2ZTWDdSUlBwNmd2OFF1OS90S3E1ZjhEVWdVVUlQQ0t1bUtyREU2cExVWUtU?=
 =?utf-8?B?N3c3VW5jdDd1Nks3Y2g2NkpTRWpzTEpnNldoTjdXdHVxWlVnc3QvZmZiaVpX?=
 =?utf-8?B?ckZLZEJVbXFCMjhhMGdQOHVpblp3bVFKVVBDaHRjYlExclU4bUpUd0MxOGd1?=
 =?utf-8?B?TUptVkt0L01IWXdiNVNvNFJHOGJIMm03V1NVU3JYUG5OdXVDV3VvbWpEaDdi?=
 =?utf-8?B?bmgxYmZjK2ZublJpZVhrZ0Z3ZE1IcS9NdHVlQ3Ftc2NuczNyL3pEZUlIL3My?=
 =?utf-8?B?QzV2M0Exa0NTbDdlRWk0Tkt1UTRrb3pYZ0pOVER1Y0hvd1EwMUhUMm9qQ3pJ?=
 =?utf-8?B?VDQ4djRNbVNEYU4rRTRBWkp2QnFTZElVVlBOT2loYUNCZkJKNHRlL3BJWWtI?=
 =?utf-8?B?K3RnWE9QODZzaG5FZHRJd0xxVEcyc1lsYlBTZU9nL2c1ek4wc3RVN1BSa0Qr?=
 =?utf-8?B?UVhCR1JQd3NRTU84Q3JrcFd0NEZmUHJveGxvMDhXdXVSSEl3NmJMRW41VnRR?=
 =?utf-8?B?TVJnc2k5aStCT0UyeFRYb1c3Q0VsUUV4aU05MHErQm1UTmFwSFNzM043cGYw?=
 =?utf-8?B?bFBnallOT3NWTmdFNU4wcWc4Lzkya1BrckZ3LzQ3NmpWYXV6Y0ZZcDd0L3NK?=
 =?utf-8?B?SGViWklRaWF0Q3hmOS91T1ZVRGVJVkZVeUp4Z2dDeGlyNHM3VStnYTZ2OGk3?=
 =?utf-8?B?TkZ4Mm5LT0gvYldkOTl2OTlROWlEVXA0ekV0TUxodXRpaWhhZUdLVDdQTkVo?=
 =?utf-8?Q?POLJMZW3KLDWnmhpcuB32ZGEDW57cEyw?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <94BC377B2F63E04382AA7965D85D6273@namprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 883a791a-f608-4191-446f-08da0b4d21af
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2022 15:11:53.0774 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gMZLPnK+cUzJG0gmfMCpSoU3d47Gf1dMwc2P2C48IYkO31aqz552jDe5Ha2Dgr8z6Fsq9pSC37LniSJJcjp+Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR05MB5693
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
Cc: Linux-graphics-maintainer <Linux-graphics-maintainer@vmware.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyMDIyLTAzLTIxIGF0IDE1OjEyICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3Rl
Og0KPiBBbSAyMS4wMy4yMiB1bSAxNTowMiBzY2hyaWViIFphY2sgUnVzaW46DQo+ID4gT24gTW9u
LCAyMDIyLTAzLTIxIGF0IDE0OjU4ICswMTAwLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOg0KPiA+
ID4g4pqgIEV4dGVybmFsIEVtYWlsOiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRl
IG9mIHRoZQ0KPiA+ID4gb3JnYW5pemF0aW9uLiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bmxlc3MgeW91DQo+ID4gPiByZWNvZ25pemUgdGhlIHNlbmRlci4NCj4gPiA+
IA0KPiA+ID4gSW5zdGVhZCB1c2UgdGhlIG5ldyBkbWFfcmVzdl9nZXRfc2luZ2xldG9uIGZ1bmN0
aW9uLg0KPiA+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+DQo+ID4gPiBSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8
ZGFuaWVsLnZldHRlckBmZndsbC5jaD4NCj4gPiA+IENjOiBWTXdhcmUgR3JhcGhpY3MgPGxpbnV4
LWdyYXBoaWNzLW1haW50YWluZXJAdm13YXJlLmNvbT4NCj4gPiA+IENjOiBaYWNrIFJ1c2luIDx6
YWNrckB2bXdhcmUuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiDCoCBkcml2ZXJzL2dwdS9kcm0vdm13
Z2Z4L3Ztd2dmeF9yZXNvdXJjZS5jIHwgNiArKysrLS0NCj4gPiA+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9yZXNvdXJjZS5jDQo+ID4gPiBiL2Ry
aXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3Jlc291cmNlLmMNCj4gPiA+IGluZGV4IDcwODg5
OWJhMjEwMi4uMzZjM2I1ZGI3ZTY5IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3Ztd2dmeC92bXdnZnhfcmVzb3VyY2UuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfcmVzb3VyY2UuYw0KPiA+ID4gQEAgLTExNjUsOCArMTE2NSwxMCBAQCBpbnQg
dm13X3Jlc291cmNlc19jbGVhbihzdHJ1Y3QNCj4gPiA+IHZtd19idWZmZXJfb2JqZWN0ICp2Ym8s
IHBnb2ZmX3Qgc3RhcnQsDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB2
bXdfYm9fZmVuY2Vfc2luZ2xlKGJvLCBOVUxMKTsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChiby0+bW92aW5nKQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQoYm8tPm1vdmluZyk7DQo+
ID4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBiby0+bW92aW5nID0gZG1hX2ZlbmNl
X2dldA0KPiA+ID4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IChkbWFfcmVzdl9leGNsX2ZlbmNlKGJvLT5iYXNlLnJlc3YpKTsNCj4gPiA+ICsNCj4gPiA+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFRPRE86IFRoaXMgaXMgYWN0dWFsbHkgYSBt
ZW1vcnkgbWFuYWdlbWVudA0KPiA+ID4gZGVwZW5kZW5jeSAqLw0KPiA+ID4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRtYV9yZXN2X2dldF9zaW5nbGV0b24oYm8tPmJhc2Uu
cmVzdiwNCj4gPiA+IGZhbHNlLA0KPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgJmJvLT5tb3ZpbmcpOw0KPiA+ID4gwqDCoMKgwqDCoMKgwqDCoCB9DQo+ID4gPiANCj4gPiA+
IMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+ID4gPiAtLQ0KPiA+ID4gMi4yNS4xDQo+ID4g
PiANCj4gPiBTb3JyeSwgSSBoYXZlbid0IGhhZCB0aGUgdGltZSB0byBnbyBvdmVyIHRoZSBlbnRp
cmUgc2VyaWVzLCB0aGUNCj4gPiBwYXRjaA0KPiA+IGxvb2tzIGdvb2QsIGJ1dCB3aGF0J3MgdGhl
IG1lbW9yeSBtYW5hZ2VtZW50IGRlcGVuZGVuY3kgdGhlIHRvZG8NCj4gPiBtZW50aW9ucz8NCj4g
DQo+IFByZXZpb3VzbHkgdGhlIGZ1bmN0aW9uIGluc3RhbGxlZCBvbmx5IHRoZSBleGNsdXNpdmUg
ZmVuY2UgYXMgbW92aW5nDQo+IGZlbmNlIGludG8gdGhlIEJPLg0KPiBOb3cgaXQgZ3JhYnMgYWxs
IGZlbmNlcyBhbmQgaW5zdGFsbHMgdGhlbSBhcyBtb3ZpbmcgZmVuY2UgaW50byB0aGUNCj4gQk8u
DQo+IA0KPiBCdXQgd2hhdCB3ZSByZWFsbHkgbmVlZCBpcyB0cmFja2luZyBpZiBhIGZlbmNlIGlu
IHRoZSByZXNlcnZhdGlvbg0KPiBvYmplY3QNCj4gaXMgYSBrZXJuZWwgbWVtb3J5IG1hbmFnZW1l
bnQgZGVwZW5kZW5jeSBvciBub3QuDQo+IA0KPiBQYXRjaCAjMTkgYWRkcyB0aGF0IGFuZCBwYXRj
aCAjMjMgdGhlbiBmaW5hbGx5IGdldHMgcmlkIG9mIHRoZSB3aG9sZQ0KPiBiby0+bW92aW5nIGhh
bmRsaW5nIGhlcmUgYmVjYXVzZSBpdCBiZWNvbWVzIGNvbXBsZXRlbHkgdW5uZWNlc3NhcnkuDQo+
IA0KPiBJIGNhbiBkcm9wIHRoZSBjb21tZW50IGlmIHlvdSB3YW50IG9yIGp1c3Qgbm90ZSB0aGF0
IGl0IGlzIG9ubHkNCj4gdGVtcG9yYXJ5IHVudGlsIHRoZSBmb2xsb3cgdXAgcGF0Y2hlcyBhcmUg
bWVyZ2VkLg0KDQpBaCwgeWVzLCBpZiB5b3UgY291bGQgcmVtb3ZlIGl0IHRoYXQnZCBiZSBncmVh
dC4gVGhlIHBhdGNoIHdpbGwgbmV2ZXINCmJlIGJhY2twb3J0ZWQgYW55d2hlcmUgd2l0aG91dCB0
aGUgcmVzdCBvZiB0aGUgc2VyaWVzLCBzbyBpdCBzaG91bGRuJ3QNCmJlIGEgcHJvYmxlbS4gDQoN
CnoNCg==
