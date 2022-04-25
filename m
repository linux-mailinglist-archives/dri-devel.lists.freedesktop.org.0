Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D95E350D952
	for <lists+dri-devel@lfdr.de>; Mon, 25 Apr 2022 08:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04FBC10E211;
	Mon, 25 Apr 2022 06:19:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2095.outbound.protection.outlook.com [40.107.113.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690C310E211
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Apr 2022 06:19:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtjyo2B6YtmShtrgxCgi37NOVbWuKH9k2gMFsnKfA3C3tVonBxZ8NoADyU7ll6cwvNPJeCfc71JPCAM8p1FiCsPji7HL9hE291MHw5Y4GWjdGJycktKsw8GrOnUxUNwasA4vUnm+P9Z9vtcYjwIoVaMYONpGIt6t+mVSA5G1e3/fr8/pnq92TE5S9M8vir7efqUPQWaSlJNPMwn8fabt01DQOoLz8GCqGdPY9SR2r/te+5/vNp3S63wT88nNr+zZkFUb9jd84SQVBitrQh/51JES4zWrKysByGw1x5eoo+qxSkCL/9GsXuSTqup2zJsyr29ZuFk0h4oLLBQ4LI9xHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+hCIW3o4I61Dmn7iYDaOsit0uOx0wCKsnTGadRtg00=;
 b=nGCc36BZMkKMZX41BqmANTqX3U2AZYfo3yPOKGiCSzO+xhbwYceVMBfZYwQ9w9KFcUCCr+jR3u5aP+uFiY8srh0Rljg1BqRSfuvP7b4vsISJItOyuzp96lwlzvb4oLJ2QBg6GenxLg3xHmlFan/Kiuk3eD9kAnF7LgpQS+Ip0RDBpmtp2ofTqLfSSc3b6VNwOFY8TM9h+ZlzhimS+wfKV8sVFoqIBsEDwa0Ds53jnoBpRNj3ZkKjq8wlqKdEeMquGM8L5Z/Dkr6++uqFeAIWX4lZRGt9RSRlfOwVaRgyeENpauy59yUOlHD6jsfzVc0PA18+S2YcX2NptRgoTIYdxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+hCIW3o4I61Dmn7iYDaOsit0uOx0wCKsnTGadRtg00=;
 b=j0f6jNyH9Ie6T77lXXe01GlgK6SMiVD+bHRF6pOMbPbchdAASepG2Es3hdHCF0v6JC98RTazqKPa1hlzwM7Uy40WkUjhSOpAN0eQPYdYl1uAmaICSrXiqtCb6yR2Nv08VPxBoJ/8EM5oObtw2h+XJwFxyK172M6QePWfmz6S76Q=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (20.183.20.197) by
 OSBPR01MB3879.jpnprd01.prod.outlook.com (20.178.98.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.13; Mon, 25 Apr 2022 06:19:21 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b129:a6f3:c39e:98db%4]) with mapi id 15.20.5186.021; Mon, 25 Apr 2022
 06:19:21 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH] drm: rcar-du: Add setting to PnALPHAR register on Gen3
Thread-Topic: [PATCH] drm: rcar-du: Add setting to PnALPHAR register on Gen3
Thread-Index: AQHYVuUAOzlVPnUgs0+FWxrpB7gKdqz/MuUAgAAIosCAAHu9gIAAcvOw
Date: Mon, 25 Apr 2022 06:19:21 +0000
Message-ID: <OS0PR01MB5922144D4A3742E33E27858886F89@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220423073728.111808-1-biju.das.jz@bp.renesas.com>
 <YmVtRlI0+IfuXujL@pendragon.ideasonboard.com>
 <OS0PR01MB59229B70A7C183B82882BFDC86F99@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <YmXcUe0/ip43XloB@pendragon.ideasonboard.com>
In-Reply-To: <YmXcUe0/ip43XloB@pendragon.ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9b0912f3-18a4-40d3-6ae1-08da26838942
x-ms-traffictypediagnostic: OSBPR01MB3879:EE_
x-microsoft-antispam-prvs: <OSBPR01MB387911ADA6027241B420BF2186F89@OSBPR01MB3879.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 9rE5G4FjzdcePq8RdQP2Du6QUaCc/PGAFx0CEJEIKFuShSdN7mCVFbo8HCDBKi6NzQeq+sF8EqaI/1W0i7io3tTo1GEnaOMOxv2dzEEaNaJv5+RRiBwuVoIpEKmnH8tNok7ZijhhwnKH7X4+21XOYulnNzWnI9FtRXf9GFqaLRnh9+p3in5TIuzA7vZIGeoLwCAUNqMQrTQY071YehrZqI1ntBtYz+6j0H1pAhMdsc3ORLe5MLtfqJiPLKVaBZJvIF4s8iAbjqw4xu3wvGd7mAsXvSK0LXTVd89rs1LfdPeorv6Y9d6aU+CrwrbYJwODxR6wmcCV48JEKExEkfusbBEgZnqBkfe7kmn6vsVdcs5QjBbzYxyYTHLByCV55OiQkxI/s65yZ39niSuNDv+CSDDidS6D7jCEG/65Fbwe4vkXK90mGboQWSjNZ4vyEzy5gAmFz7+mMAPOnxDEioZJk1HO1spSMb2eA29KSh9XNwBvJZWbvxFn7GM6iMxjX2ah201Q0kLceXcY2rTiQiGFr0lGw007J6mo9pT70YJU7YMyldSPnD7MMdH0dJ5iqTwMBwjtE/XCatX6Ccfsyf96damR47FrPbfCZ65RJu/LERxRp/2M+r2UQTaOFttmAWpDnvhipMVXFtn7s3mwm65Avt2xZkJHfgj0U+k+DIRZJUL0+HFpX/NKpYgUKm8gn2DAcCm8ttI6aI7UKrXGS/hiTw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(122000001)(38100700002)(54906003)(6916009)(2906002)(66446008)(107886003)(38070700005)(55016003)(316002)(33656002)(7696005)(19627235002)(4326008)(8676002)(66946007)(66476007)(76116006)(66556008)(186003)(26005)(64756008)(86362001)(83380400001)(52536014)(9686003)(71200400001)(508600001)(8936002)(6506007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RVAyc21zb0ZXL2c4clE2N282UG1sdGlXcHZFV05FNzFxOGtUTG44Sko3MjRQ?=
 =?utf-8?B?QVJIZ3ptdkhWLzlhYWNJc053L1g0bWxTalJxL2hqelAxTEZ4ejkvNkNQUnJq?=
 =?utf-8?B?UXpXTG1aWnJpeGgwQ0xSYTVJY29ySmo1N0VrK2VFREk4RElJUjZ1K1JBNWg5?=
 =?utf-8?B?b1VLUjE5dXN2aFZ1U1dnZUlaSlYxOEEraVZHMjJmVkJXaTdzWlF2R25kRGM0?=
 =?utf-8?B?ZFZGNE1JaUpEdmE4ZFkwVHY0VFZ2VjhxYmxDRjVZWk96VjI3VlhsWUtMc3lq?=
 =?utf-8?B?cmVQVmZKT2VMUm5kWnhLbVc5aEhlSE9LeDBIcHVQWFdwZmR1K2hFNDZyZlh0?=
 =?utf-8?B?RkI2Y3lDbDFCUnhsUUE1ZTFGMklTd3VHR0JGRm5pampEQXV1eSt3NWk5cklu?=
 =?utf-8?B?R0F6NXh4SUlKOWdwQTFqSklSS25qaTJjZ1liSFlLRlVNSDZINjdyWWQ0SzM4?=
 =?utf-8?B?bE9MYUxBMkVRdWFEWGVSVnVVRmdlV3YzUkx3WnN0ZmJYNHlKRTY0OTI4bVhN?=
 =?utf-8?B?UjFXUEZyMUtNYS9sN1dCSld3K1Fhc0daWG0rM05BSC8xc0wvcDRKdFlkaEF5?=
 =?utf-8?B?WFlRUjlFUnhuWk90ZXExRi9tRng3QjJjZS9VelhTcDNxckNVZEgxUTd0TzZn?=
 =?utf-8?B?dWF2ZWRDSzQzQVVEY1FnWHN2YVNUUEFEckxYN1lCc0U0R21uNm96TGJ4Y0pw?=
 =?utf-8?B?dDhoTVBkcnJRQ2l3VVhENmZlLzYzR2VRWllGK0JaMU9IdEUvaXhTczQ3R0Jo?=
 =?utf-8?B?aVQxbmF1R3VLRUxxVEM0NjFTK0ljZjRxWTZLSGV6Wm9udGt3NzBSU2VZNGhx?=
 =?utf-8?B?LzhDbG9GVTVOODdycmdUL2NDMDhSdzhEc1VmVTZYUVliK2hvR2RBY21LTnZB?=
 =?utf-8?B?VzRlSnZDOUtzb0JUbm5hR0NJS0grWmJtaHN3TGRkNE13Y0VseHUvcDZVbk96?=
 =?utf-8?B?dUo1Wm84QjBMNEZQaHV4WE0wQkV1d05IY1BvUTZsQldaVmZmQVBmdzdKclBh?=
 =?utf-8?B?NDlVV2l6OTdManM2eXhlYWswZm5lcjJZbUZ6L2UwMGloUTRiSWhzOFFWUjlO?=
 =?utf-8?B?bGlWc1pPKzh1cFMrbVlnU0JYcVQzYjZ2YStWME9UVkNWTGVoaVBIUHlIVDUw?=
 =?utf-8?B?MHF2b09ENkgzbVB5c3l3dFowcm4zL0JrUGZYMmhGWnFBR040bE9Sb2R6V2tY?=
 =?utf-8?B?RmJNRVRORjVkbnRkLy9LUXgyZFpWUFdRMmtBZXYwazE1b3FuTHhOZ3Q0Q1NQ?=
 =?utf-8?B?cWFyNkIyeU4wRUl6cUltdm5Xd0ZsZlM3TmVQdFF6c1AwQWJ6ZzVQaW9hZDJQ?=
 =?utf-8?B?M0RpbVY0dUJYNkF4KzFIbXcwdVV0cHQrdlJ6WWFaSGUwdjBMT1cxWUV5dzlw?=
 =?utf-8?B?Qm9RQ25XT1dBU2M0UThRNlRUblJhU2FrczBTcVkvc29vWkN3a1pwRGpwNjRZ?=
 =?utf-8?B?VFgyRXVCY3kyRXFReWhYcHNidEkzZVFNWXZsQ1hrMVVoTWM4TjI4UDVjZDdm?=
 =?utf-8?B?dzZpeFJXT0g0dlZnRGpreTRNaTU0K0JDSDIzK3hJRW8vUEZvWTJSL3Q4Y1Vr?=
 =?utf-8?B?cG5ydlJtZVNYcFpGcU5HQUNxdFJBa3FsMmVtaG5OS3NBQlFqblJNR0F4akN4?=
 =?utf-8?B?NzdWNmFPMXRjeUY0WEpJWGdBTDFnRmlicGorandJUTR6bGplUnF1WksxMHRn?=
 =?utf-8?B?MGNMRVoweWJrMXFxVm5DVXpyTHFOcDhmbUIwSUN5SDJhUGtObEt5QnJQQ1hi?=
 =?utf-8?B?V3FyU05kWVNpa1RqaGhwODdQTzVoam16cGl2VDNYMnl1dVJuUkdlVXR5b3lV?=
 =?utf-8?B?K25jYUV4KzE5S01HalJwbDNKT0VMMHArWU04S1doemp5aEFYa1Jma2hZK0wr?=
 =?utf-8?B?TlNqS1ZLakJZVlNmSjVrR3oxbTZMbk56djdaVFUvQkZWd2pXRENMVTV4d0Nj?=
 =?utf-8?B?Y0QraWZLaVMyR2ZobjdWYVE2VVNJM21oOGRiczBvQjFwUmo4VDhRckduZXpJ?=
 =?utf-8?B?Y1dPZGFWcEJSRkZtNE56dDVMejUvN0lFMGNJSE9Ob3pGdzdhdTEya05nS3E2?=
 =?utf-8?B?S09lNkZUOWd3VGNDaEpTQTkweHRpVjBSUERST3puRUJXUVJDbnlDdDllK3o5?=
 =?utf-8?B?aFdENEE2RHlSVjQxMzd1YU0vREpUYk95eWRJSkNsU2ZkK3R2S25RVmFEWUh0?=
 =?utf-8?B?Sm4xdmdwRiszV2FYdEoyK3UyWUhFcFA1bnh3SmtVd0xRS2FCOXYvNUtITzVv?=
 =?utf-8?B?VENCYVkrdU9iaTdxb09SM3ZqaDNXYVFjWTltUXZwRVg5blVHNng1RXBOaHgw?=
 =?utf-8?B?eXhpOFZPbU1MaE9kVTVBMU5hMDdZMXpvOHh3K2ErZGN0QXp2TGRaMG45WXZC?=
 =?utf-8?Q?KbCANWb4xl0UMK1I=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b0912f3-18a4-40d3-6ae1-08da26838942
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2022 06:19:21.1111 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iq6E3g8MRI8cSV4KcVX/su8mQEBS0gGBzK9bSg5pdvUCF8xx4VMdqD4k0cWxom/FpknVCSPnwSbJZTgSfQQkAwEzTgE5lLaEu9QpyUki8qA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB3879
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
Cc: Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Biju Das <biju.das@bp.renesas.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Hoai Luu <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB0aGUgZmVlZGJhY2suDQoNCj4gU3ViamVjdDogUmU6
IFtQQVRDSF0gZHJtOiByY2FyLWR1OiBBZGQgc2V0dGluZyB0byBQbkFMUEhBUiByZWdpc3RlciBv
bg0KPiBHZW4zDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gU3VuLCBBcHIgMjQsIDIwMjIgYXQg
MDQ6MTI6MDhQTSArMDAwMCwgQmlqdSBEYXMgd3JvdGU6DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BB
VENIXSBkcm06IHJjYXItZHU6IEFkZCBzZXR0aW5nIHRvIFBuQUxQSEFSIHJlZ2lzdGVyDQo+ID4g
PiBvbiBHZW4zIE9uIFNhdCwgQXByIDIzLCAyMDIyIGF0IDA4OjM3OjI4QU0gKzAxMDAsIEJpanUg
RGFzIHdyb3RlOg0KPiA+ID4gPiBGcm9tOiBMVVUgSE9BSSA8aG9haS5sdXUudWJAcmVuZXNhcy5j
b20+DQo+ID4gPiA+DQo+ID4gPiA+IEluIEdlbjMsIHdoZW4gQWxwaGEgYmxlbmQgaXMgZW5hYmxl
ZCBpbiB0aGUgUG5NUiByZWdpc3RlciwNCj4gPiA+ID4gZGVwZW5kaW5nIG9uIHRoZSBpbml0aWFs
IHZhbHVlIG9mIHRoZSBQbkFMUEhBUiByZWdpc3RlciwgZWl0aGVyDQo+ID4gPiA+IGNoYW5uZWwg
b2YgRFUgbWlnaHQgYmUgYmxhY2sgc2NyZWVuLg0KPiA+ID4gPiBUaGVyZWZvcmUsIHRoaXMgcGF0
Y2ggcHJldmVudHMgdGhlIGJsYWNrIHNjcmVlbiBieSBzZXR0aW5nIHRoZQ0KPiA+ID4gPiBQbkFM
UEhBUiByZWdpc3RlciB0byBhbGwgMC4NCj4gPiA+ID4NCj4gPiA+ID4gSW4gYWRkaXRpb24sIFBu
QUxQSEFSIHJlZ2lzdGVyIHdpbGwgYmUgcmVsZWFzZWQgaW4gdGhlIFItQ2FyIEdlbjMNCj4gPiA+
ID4gSGFyZHdhcmUgTWFudWFsIFJldiAyLjQgKFNlcC4gMjAyMSkuDQo+ID4gPiA+DQo+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IExVVSBIT0FJIDxob2FpLmx1dS51YkByZW5lc2FzLmNvbT4NCj4gPiA+
ID4gU2lnbmVkLW9mZi1ieTogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0K
PiA+ID4gPiAtLS0NCj4gPiA+ID4gVGhpcyBwYXRjaCBpcyBiYXNlZCBvbiBbMV0NCj4gPiA+ID4g
WzFdDQo+ID4gPiA+DQo+ID4gPiA+IE5vdCBzdXJlIHRoaXMgcGF0Y2hlcyBoYXMgdG8gZ28gd2l0
aCBGaXhlcyB0YWcgZm9yIHN0YWJsZT8/DQo+ID4gPiA+DQo+ID4gPiA+IFRlc3RlZCB0aGUgY2hh
bmdlcyBvbiBSWi9HMk0gYm9hcmQNCj4gPiA+ID4NCj4gPiA+ID4gcm9vdEBoaWhvcGUtcnpnMm06
L2NpcC10ZXN0LXNjcmlwdHMjICBtb2RldGVzdCAtTSByY2FyLWR1IC13DQo+ID4gPiA+IDU0OmFs
cGhhOjU1NTU1IHJvb3RAaGlob3BlLXJ6ZzJtOi9jaXAtdGVzdC1zY3JpcHRzIyBtb2RldGVzdCAt
TQ0KPiA+ID4gPiByY2FyLWR1DQo+ID4gPiAtcyAiOTNAOTA6MTAyNHg3NjhAQVIyNCIgLWQgLVAg
IjU0QDkwOjQwMHgzMDArMjAwKzIwMEBYUjI0Ig0KPiA+ID4gPiBzZXR0aW5nIG1vZGUgMTAyNHg3
NjgtNzVIekBBUjI0IG9uIGNvbm5lY3RvcnMgOTMsIGNydGMgOTAgdGVzdGluZw0KPiA+ID4gPiA0
MDB4MzAwQFhSMjQgb3ZlcmxheSBwbGFuZSA1NA0KPiA+ID4gPiAtLS0NCj4gPiA+ID4gIGRyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcGxhbmUuYyB8IDYgKysrKysrDQo+ID4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+ID4gPiA+DQo+ID4gPiA+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3BsYW5lLmMNCj4gPiA+ID4gYi9k
cml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3BsYW5lLmMNCj4gPiA+ID4gaW5kZXggNWMx
YzdiYjA0ZjNmLi5hZmYzOWI5MjUzZjggMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yY2FyLWR1L3JjYXJfZHVfcGxhbmUuYw0KPiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2R1X3BsYW5lLmMNCj4gPiA+ID4gQEAgLTUxMCw2ICs1MTAsMTIgQEAg
c3RhdGljIHZvaWQNCj4gPiA+ID4gcmNhcl9kdV9wbGFuZV9zZXR1cF9mb3JtYXRfZ2VuMyhzdHJ1
Y3QgcmNhcl9kdV9ncm91cCAqcmdycCwNCj4gPiA+ID4NCj4gPiA+ID4gIAlyY2FyX2R1X3BsYW5l
X3dyaXRlKHJncnAsIGluZGV4LCBQbkREQ1I0LA0KPiA+ID4gPiAgCQkJICAgIHN0YXRlLT5mb3Jt
YXQtPmVkZiB8IFBuRERDUjRfQ09ERSk7DQo+ID4gPiA+ICsNCj4gPiA+ID4gKwkvKiBJbiBHZW4z
LCBQbkFMUEhBUiByZWdpc3RlciBuZWVkIHRvIGJlIHNldCB0byAwDQo+ID4gPiA+ICsJICogdG8g
YXZvaWQgYmxhY2sgc2NyZWVuIGlzc3VlIHdoZW4gYWxwaGEgYmxlbmQgaXMgZW5hYmxlDQo+ID4g
PiA+ICsJICogb24gRFUgbW9kdWxlDQo+ID4gPiA+ICsJICovDQo+ID4gPg0KPiA+ID4gQ29tbWVu
dHMgc2hvdWxkIHN0YXJ0IHdpdGggLyogb24gYSBsaW5lIG9mIGl0cyBvd24sIGFuZCB5b3UgY2Fu
IGFsc28NCj4gPiA+IHJlZmxvdyB0aGUgdGV4dCB0byA4MCBjb2x1bW5zOg0KPiA+DQo+ID4gT0su
DQo+ID4NCj4gPiA+IAkvKg0KPiA+ID4gCSAqIEluIEdlbjMsIFBuQUxQSEFSIHJlZ2lzdGVyIG5l
ZWQgdG8gYmUgc2V0IHRvIDAgdG8gYXZvaWQgYmxhY2sNCj4gc2NyZWVuDQo+ID4gPiAJICogaXNz
dWUgd2hlbiBhbHBoYSBibGVuZCBpcyBlbmFibGUgb24gRFUgbW9kdWxlLg0KPiA+ID4gCSAqLw0K
PiA+ID4NCj4gPiA+IEl0IHdvdWxkIGhvd2V2ZXIgYmUgbmljZXIgdG8gZG9jdW1lbnQgdGhlIGV4
YWN0IGJlaGF2aW91ciwgYnV0IHRoZQ0KPiA+ID4gbGF0ZXN0IHZlcnNpb24gb2YgdGhlIGRvY3Vt
ZW50YXRpb24gSSBoYXZlIGFjY2VzcyB0byBpcyByZXYgMi4zIGFuZA0KPiA+ID4gaXQgbGlzdHMg
UG5BTFBIQVIgYXMgbm90IGF2YWlsYWJsZSBvbiBHZW4zLg0KPiA+DQo+ID4gSSBkb24ndCBoYXZl
IGFjY2VzcyB0byByZXYgMi40LCBidXQgSSBnb3QgYWNjZXNzIHRvDQo+ID4gIlItQ2FyLUdlbjNf
Q29tbW9uX09QQ19DdXN0b21lcl9Ob3RpZmljYXRpb25zX1YzMC4xLnBkZiINCj4gPiB3aGVyZSBp
dCBpcyBtZW50aW9uZWQgYWJvdXQgdGhpcyBpc3N1ZSBhbmQgc29sdXRpb24gZm9yIGZpeCB3aGlj
aCBpcw0KPiA+IGlubGluZSB3aXRoIHRoZSBwYXRjaCBmcm9tIFItQ2FyIEJTUC4NCj4gPg0KPiA+
ICJUaGUgcmVhc29uIGlzIHRoYXQgYSByZWdpc3RlciBpcyBub3QgaW5pdGlhbGl6ZWQgYnkgcmVz
ZXQuDQo+ID4gVGhpcyBjb3VsZCBsZWFkIHRvIG91dHB1dCB3cm9uZyBpbWFnZSBkYXRhIG9mIG90
aGVyIHBsYW5lIG9yIHdyb25nDQo+ID4gY29sb3Igc2V0IGZyb20gQlBPUiAoQmFja2dyb3VuZCBw
bGFuZSBvdXRwdXQgcmVnaXN0ZXIpLiINCj4gPg0KPiA+ID4gRnVydGhlcm1vcmUsIGlzIHRoaXMg
cmVhbGx5IHRoZSByaWdodCBmaXgsIHNob3VsZG4ndCB3ZSBpbnN0ZWFkDQo+ID4gPiBhdm9pZCBl
bmFibGluZyBhbHBoYS1ibGVuZGluZyBpbiBQbk1SIG9uIEdlbjMgPw0KPiA+DQo+ID4gQXZvaWQg
ZW5hYmxpbmcgYWxwaGEtYmxlbmRpbmcgaW4gUG5NUiBvbiBHZW4zLCB3aWxsIGl0IGhlbHAgaGVy
ZT8NCj4gDQo+IEl0J3MgaGFyZCB0byB0ZWxsIHdpdGhvdXQga25vd2luZyB0aGUgZXhhY3QgY2F1
c2Ugb2YgdGhlIGlzc3VlLiBDbGVhcmluZw0KPiBQbkFMUEhBUiBwcm9iYWJseSBtYWtlcyBzZW5z
ZSBvbiBHZW4zIGlmIHRoZSByZWdpc3RlciBleGlzdHMsDQo+IGluZGVwZW5kZW50bHkgZnJvbSBk
aXNhYmxpbmcgYWxwaGEgYmxlbmRpbmcgaW4gUG5NUi4gSXQgd291bGQgYmUgbmljZSBpZg0KPiB0
aGUgY29tbWl0IG1lc3NzYWdlIGNvdWxkIHJlZmVyZW5jZSB0aGUgaXNzdWUgZGVzY3JpYmVkIGlu
IFItQ2FyLQ0KPiBHZW4zX0NvbW1vbl9PUENfQ3VzdG9tZXJfTm90aWZpY2F0aW9uc19WMzAuMS5w
ZGYuIEkgd291bGQgYWxzbyBleHBhbmQgdGhlDQo+IGNvbW1lbnQgYSBsaXR0bGUgYml0Og0KPiAN
Cj4gIC8qDQo+ICAgKiBPbiBHZW4zLCBzb21lIERVIGNoYW5uZWxzIGhhdmUgdHdvIHBsYW5lcywg
ZWFjaCBiZWluZyB3aXJlZCB0byBhDQo+IHNlcGFyYXRlDQo+ICAgKiBWU1BEIGluc3RhbmNlLiBU
aGUgRFUgY2FuIHRoZW4gYmxlbmQgdHdvIHR3byBwbGFuZXMuIFdoaWxlIHRoaXMNCj4gZmVhdHVy
ZQ0KPiAgICogaXNuJ3QgdXNlZCBieSB0aGUgZHJpdmVyLCBpc3N1ZXMgcmVsYXRlZCB0byBhbHBo
YSBibGVuZGluZyAoc3VjaCBhcw0KPiAgICogaW5jb3JyZWN0IGNvbG9ycyBvciBwbGFuZXMgYmVp
bmcgaW52aXNpYmxlKSBtYXkgc3RpbGwgb2NjdXIgaWYgdGhlDQo+IFBuQUxQSEFSDQo+ICAgKiBy
ZWdpc3RlciBoYXMgYSBzdGFsZSB2YWx1ZS4gU2V0IHRoZSByZWdpc3RlciB0byAwIHRvIGF2b2lk
IHRoaXMuDQo+ICAgKi8NCg0KT0suDQoNCj4gDQo+ID4gSGVyZSB0aGUgaXNzdWUgdGhleSBtZW50
aW9uZWQgYXMgInJlZ2lzdGVyIGlzIG5vdCBpbml0aWFsaXplZCBieSByZXNldCINCj4gPg0KPiA+
ID4gPiArCXJjYXJfZHVfcGxhbmVfd3JpdGUocmdycCwgaW5kZXgsIFBuQUxQSEFSLCAweDAwMDAw
MDAwKTsNCj4gDQo+IEknZCB3cml0ZSAwIGluc3RlYWQgb2YgMHgwMDAwMDAwMCB0byBtYXRjaCB0
aGUgcmVzdCBvZiB0aGUgZHJpdmVyLg0KPiANCj4gV291bGQgeW91IG1pbmQgc2VuZGluZyBhIHYy
IHdpdGggdGhlc2UgY2hhbmdlZCBhbmQgYW4gZXhwYW5kZWQgY29tbWl0DQo+IG1lc3NhZ2UgPw0K
DQpPSywgV2lsbCBzZW5kIHYyIHdpdGggdGhlc2UgY2hhbmdlcy4NCg0KQ2hlZXJzLA0KQmlqdQ0K
DQo+IA0KPiA+ID4gPiAgfQ0KPiA+ID4gPg0KPiA+ID4gPiAgc3RhdGljIHZvaWQgcmNhcl9kdV9w
bGFuZV9zZXR1cF9mb3JtYXQoc3RydWN0IHJjYXJfZHVfZ3JvdXANCj4gPiA+ID4gKnJncnAsDQo+
IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K
