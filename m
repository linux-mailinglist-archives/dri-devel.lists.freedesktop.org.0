Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 985A810ECD1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 17:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4606E22A;
	Mon,  2 Dec 2019 16:03:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690053.outbound.protection.outlook.com [40.107.69.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A8DA6E228;
 Mon,  2 Dec 2019 16:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBsKIpdkDVTycDwObBhfPfFkd+/EBgtMFh4wSjwJNl+qnPOpV/PQ5kUUxkfmF1pV+QwhSo2AdxgvjLIGrorCM6/s7IxN24Wdag1bLGeV0xaEORJEOSLAWH8KS3IQ0DJUW4r1ic9a74muNHmT9Mc3/NLbj2uvahXbzGqnXghnzfYbDdFE9Qo1Sq/76wKRNLODXSlD/cV5gipJhRMIKQwmWO62Owcyb4Se5Dl1BykDJ0vlMEN4V/rdfQbA9ATBwqle7madu2txBjoiBHGSZf+sxRk08zkqwRcfm9uv16PD8pBxSS0jexrayx+y3d/Gu/RRllWSi/o9zrvJS0wmhYA6/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDEIEGs+F23J9Lg/ZP0c8scmpAWlXXUsiuQ0WLwP068=;
 b=Apyx6b2v2CvvGpji8xMFoCXZSm3ZoyE4OCbQ5DYn81C5GDmVGFkm8ecjzsf2OneZoEcMJGNlbnaxcqFuAwYS3yegZA3WcPkJGW9E/R7bSJsLECKmJWnyMnoOcj2qYAvhswq/tMYIh/nxeA+7OTSsUyBpGCQk58qcSGA6s5eydnJAPgmsnZSkrFQIzbC440i57hWgMJf4jQNL+CHQAVMNa+qxi1sL/U7jx7EbF2r7B/NIe+klwXZCEeFJIpPHhA5FHj647usr/ioZZJIwGo65lOQDPUC0sSe5xgfC/TDDRej1OL0USqfl9rpYd5f7dGfo/IBca0EvVurGBuqCAda0aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) by
 DM6PR12MB3579.namprd12.prod.outlook.com (20.178.31.224) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2495.18; Mon, 2 Dec 2019 16:03:53 +0000
Received: from DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::8954:6ba3:6dca:4616]) by DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::8954:6ba3:6dca:4616%7]) with mapi id 15.20.2495.014; Mon, 2 Dec 2019
 16:03:53 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: RE: [PATCH] drm/dp_mst: Correct the bug in
 drm_dp_update_payload_part1()
Thread-Topic: [PATCH] drm/dp_mst: Correct the bug in
 drm_dp_update_payload_part1()
Thread-Index: AQHVqMTYN8Ih8KxJzkaIj0WLYxG/maenAmOQ
Date: Mon, 2 Dec 2019 16:03:53 +0000
Message-ID: <DM6PR12MB34660B5730B30E1B7597771E9E430@DM6PR12MB3466.namprd12.prod.outlook.com>
References: <20191202035841.16984-1-Wayne.Lin@amd.com>
In-Reply-To: <20191202035841.16984-1-Wayne.Lin@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 218a4953-525a-407c-529f-08d777413acc
x-ms-traffictypediagnostic: DM6PR12MB3579:|DM6PR12MB3579:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB3579749F040F277E419F37709E430@DM6PR12MB3579.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0239D46DB6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(136003)(366004)(376002)(396003)(39860400002)(13464003)(199004)(189003)(4326008)(66066001)(81166006)(8936002)(2501003)(52536014)(102836004)(186003)(6506007)(53546011)(26005)(446003)(76176011)(7696005)(11346002)(14444005)(256004)(71200400001)(71190400001)(76116006)(66946007)(66476007)(66556008)(64756008)(66446008)(45080400002)(5660300002)(54906003)(6436002)(110136005)(966005)(6246003)(478600001)(3846002)(55016002)(14454004)(6116002)(86362001)(99286004)(316002)(2201001)(33656002)(8676002)(81156014)(74316002)(305945005)(7736002)(9686003)(6306002)(450100002)(25786009)(2906002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3579;
 H:DM6PR12MB3466.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5LxT2A86f0UnkvcuCUexp57mq2Ns4YJUXk/EZzueZa1SXuco+tLlMgUS78cgMqp1hwMhP8QrFvsopDDP8iTQJqy1Hb90uQ1LTHbsDlVLqS2nefc3P0RWXAdvahVAaedzXtJoUJuIq3dlZpr2X6RgW7jcdK/9I1qyJOCt0OjxApJ/u7WO8WVAqVis0NcbKk0xci13CHGJKwSRo61o6Y/Al8EKRWM6plLbyphdk7rCbtwSd2pKzYox9hqrkkXgSIL1IUpZOJxA6zYE0AxisuI0OkXOuj0BHAwNxr6PpJlwLfe6BdV3A/k6ult04Ap97ivUmq+e5z2JrQnoec0PiBdvwhCJyoYZJPV3lcFa6o6bTrmILmP5vyn07PevcqZcfVynBpBcZk6ZQOlBrlVSUACWHf5jKXHxU55C2dAcQ6hK5alzU00KITz7Go6GEVzoRAF6
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218a4953-525a-407c-529f-08d777413acc
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Dec 2019 16:03:53.7993 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lk86fcmIU9LnsXgbKw52+Dp/upJfeBQB3gR0itsw0AQ9MrsdagrWgfTZMd8rnLsv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3579
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IDEIEGs+F23J9Lg/ZP0c8scmpAWlXXUsiuQ0WLwP068=;
 b=DfcWSIcS/Gy90LnkdUiuNbJ/1y/tq0yskv+upHvy7G0FrhxwW4sxDyGTQ+8Ye14jIXQNRT0ehM9DfsIvO1Jaemfl4RST47GldMyW8QdWBwbahLMJp2JGpPPkBgtATfZ6SnWdu4Z/lb6wTIPoldsDVfB+R8NFkg6zHXUofVQJBqo=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "Zuo, Jerry" <Jerry.Zuo@amd.com>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, "Lin, Wayne" <Wayne.Lin@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IFdheW5lIExp
bg0KPiBTZW50OiAyMDE5L0RlY2VtYmVyLzAxLCBTdW5kYXkgMTA6NTkgUE0NCj4gVG86IGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
DQo+IENjOiBadW8sIEplcnJ5IDxKZXJyeS5adW9AYW1kLmNvbT47IFdlbnRsYW5kLCBIYXJyeQ0K
PiA8SGFycnkuV2VudGxhbmRAYW1kLmNvbT47IEthemxhdXNrYXMsIE5pY2hvbGFzDQo+IDxOaWNo
b2xhcy5LYXpsYXVza2FzQGFtZC5jb20+OyBMaW4sIFdheW5lIDxXYXluZS5MaW5AYW1kLmNvbT4N
Cj4gU3ViamVjdDogW1BBVENIXSBkcm0vZHBfbXN0OiBDb3JyZWN0IHRoZSBidWcgaW4NCj4gZHJt
X2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCkNCj4gDQo+IFtXaHldDQo+IElmIHRoZSBwYXlsb2Fk
X3N0YXRlIGlzIERQX1BBWUxPQURfREVMRVRFX0xPQ0FMIGluIHNlcmllcywgY3VycmVudCBjb2Rl
DQo+IGRvZXNuJ3QgZGVsZXRlIHRoZSBwYXlsb2FkIGF0IGN1cnJlbnQgaW5kZXggYW5kIGp1c3Qg
bW92ZSB0aGUgaW5kZXggdG8gbmV4dA0KPiBvbmUgYWZ0ZXIgc2h1ZmZsaW5nIHBheWxvYWRzLg0K
PiANCj4gW0hvd10NCj4gQWZ0ZXIgc2h1ZmZsaW5nIHBheWxvYWRzLCBkZWNpZGUgd2hldGhlciB0
byBtb3ZlIG9uIGluZGV4IG9yIG5vdCBhY2NvcmRpbmcNCj4gdG8gcGF5bG9hZF9zdGF0ZSBvZiBj
dXJyZW50IHBheWxvYWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBXYXluZSBMaW4gPFdheW5lLkxp
bkBhbWQuY29tPg0KDQoNClJldmlld2VkLWJ5OiBaaGFuIExpdSA8emhhbi5saXVAYW1kLmNvbT4N
Cg0KDQo+IC0tLQ0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDMg
KystDQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYw0K
PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMNCj4gaW5kZXggODFlOTJi
MjYwZDdhLi44ZGE1ZDQ2MWVhMDEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYw0KPiBAQCAtMzE3Niw3ICszMTc2LDggQEAgaW50IGRybV9kcF91cGRhdGVfcGF5bG9h
ZF9wYXJ0MShzdHJ1Y3QNCj4gZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1ncikNCj4gIAkJCWRy
bV9kcF9tc3RfdG9wb2xvZ3lfcHV0X3BvcnQocG9ydCk7DQo+ICAJfQ0KPiANCj4gLQlmb3IgKGkg
PSAwOyBpIDwgbWdyLT5tYXhfcGF5bG9hZHM7IGkrKykgew0KPiArCWZvciAoaSA9IDA7IGkgPCBt
Z3ItPm1heF9wYXlsb2FkczsNCj4gKwkJKG1nci0+cGF5bG9hZHNbaV0ucGF5bG9hZF9zdGF0ZSA9
PQ0KPiBEUF9QQVlMT0FEX0RFTEVURV9MT0NBTCkgPyBpIDoNCj4gK2krKykgew0KPiAgCQlpZiAo
bWdyLT5wYXlsb2Fkc1tpXS5wYXlsb2FkX3N0YXRlICE9DQo+IERQX1BBWUxPQURfREVMRVRFX0xP
Q0FMKQ0KPiAgCQkJY29udGludWU7DQo+IA0KPiAtLQ0KPiAyLjE3LjENCj4gDQo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGlu
ZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbmFtMTEu
c2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3Rz
Lg0KPiBmcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtDQo+IGdmeCZh
bXA7ZGF0YT0wMiU3QzAxJTdDemhhbi5saXUlNDBhbWQuY29tJTdDYWNiZjZjOTI3MmM0NGU1NjQy
DQo+IGNhMDhkNzc2ZGJmNjg4JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0Mw
JTdDMCU3QzYNCj4gMzcxMDg1NTk0ODM1NzkyNjMmYW1wO3NkYXRhPUpOVXBZV1pSeE5lJTJCMCUy
RkNlMDRmaldSdldoJTINCj4gRlBwM0NBU3k0RlJyZzBpSHVJJTNEJmFtcDtyZXNlcnZlZD0wDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
