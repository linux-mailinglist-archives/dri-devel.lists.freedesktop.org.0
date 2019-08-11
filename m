Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75DF89293
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 18:28:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1661589C9C;
	Sun, 11 Aug 2019 16:28:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750081.outbound.protection.outlook.com [40.107.75.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AB8389C51;
 Sun, 11 Aug 2019 16:28:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWtA6D2qQqJGVR8ZnRf89zxloTK4tv2TXEqVcvR9H8MC/9GA0aNtdSCNhsK8/oH0r+fHacrpyqjBF0hoI8EnXQw5P5uXV43+JBK7EiGsev/VkUeQ2zU+hRwUZoopAcg2Pzogb8u97FGsFvmG882n0s9UwVn1edT4MpfJkmBQwmLzlUnRqyCmHvBO25YQzJBfGKoBmQg91P/7yAks2aCk4FKtjeA/fV0gprK5qlI5jtbJVwIyzoPvHq4krlCOzIYYy5TwAPMuQ4kgZJHWfcESrMSu8aSGCCtJaSzmTrfB92RKVWa9Od6cainVaQDQTda3nfTgROReerVTmXJIuddPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7G+McgcLlD9tp86ZMIVKW4cwlyx69LfBcxI0zdTA6I=;
 b=oNhnQ0G8u3jQaLk0al45JDFIcyZPVLApuVYec22SjomEdOdqV6G42aY02UPeG0i3WOefyRKBO1HAJ9LGOdmG+vrieRKfm8c3f1f1CrkSb3c5+HBf8qaACLxuXu3Z8CxxStcUNPMmVnWj+OHea15ieBslwZ3qDbalZRdMZXWrEXdUyTTjKL24pN62LPhpGo1VpL09kfXowSEPM7gAJ/ktDmydB3o2jc2yjv8g/rHF3JvBr5H+kAg0cX+pmWKkmVHEChj1ap69/pX/auCmk72SRhJo0tsnjScwMk21MbwFle4n2KFCcCubZpt882xM+/h407LqPRunJ49rlH4pB2YcoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1482.namprd12.prod.outlook.com (10.172.37.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Sun, 11 Aug 2019 16:28:23 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::fc5f:ce01:e8c8:db89%12]) with mapi id 15.20.2157.022; Sun, 11 Aug
 2019 16:28:23 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Chris Wilson <chris@chris-wilson.co.uk>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5] dma-fence: Propagate errors to dma-fence-array
 container
Thread-Topic: [PATCH v5] dma-fence: Propagate errors to dma-fence-array
 container
Thread-Index: AQHVUGFlPzepPNZnbk6a2SQ6xRgHaab2Is0A
Date: Sun, 11 Aug 2019 16:28:23 +0000
Message-ID: <c3893221-dd75-4bb6-d965-185f57d9eea2@amd.com>
References: <61c7693c-497f-5d89-362f-b37c30c7a8da@amd.com>
 <20190811162524.6131-1-chris@chris-wilson.co.uk>
In-Reply-To: <20190811162524.6131-1-chris@chris-wilson.co.uk>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: PR0P264CA0078.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:18::18) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 76d3b70d-4385-4908-2cd5-08d71e78edc4
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1482; 
x-ms-traffictypediagnostic: DM5PR12MB1482:
x-microsoft-antispam-prvs: <DM5PR12MB1482964C0C4E92DD37E7C61E83D00@DM5PR12MB1482.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 0126A32F74
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(396003)(376002)(39850400004)(136003)(346002)(189003)(199004)(7736002)(14444005)(4326008)(478600001)(102836004)(14454004)(305945005)(46003)(186003)(66574012)(486006)(31686004)(476003)(11346002)(446003)(256004)(2616005)(65806001)(65956001)(25786009)(8676002)(6116002)(76176011)(52116002)(386003)(6506007)(2501003)(5660300002)(58126008)(71190400001)(71200400001)(110136005)(6512007)(99286004)(316002)(64126003)(53936002)(6486002)(81156014)(81166006)(6436002)(65826007)(8936002)(6246003)(36756003)(86362001)(2906002)(66446008)(54906003)(66476007)(64756008)(66556008)(66946007)(31696002)(229853002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1482;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: C2vuvczjxGaY0qITIjFtEaLGyugeP984d/KD95AAOs3/FfSSU8SVP8LVzCfiwSXBC2hoIA1laAlalk9PZHu1dpgM2gH9ILDyCeqXjeuUMrb69+ANeYOI8U69hQ3NziPxJX2o7ajhl4jTUE8xGF64rlFRN8bzWdvll103WdMWD6/MHUWCaXix7xRYuUokfn9hW38UJtoPbOJsIPzxaL29cK8j52fZiTMd4fd3TgHuNIU+5FF5GIOquDtJdCCLVxoY233v3CBdkL7vY5y+991s3kTJnETXr1uwy0204jT+lodnLk9LdKGOX5sh6GfT9N67cRurAHIqtlTnTTgZ5Li0Uk4m/+W90r0GoCpylKmpnnRJ7s9gDpBjWHH2JQuST1AewYm+3796LHNwVpZUeIuaj5mZCL/WJa8+/nr2XGxhG7w=
x-ms-exchange-transport-forked: True
Content-ID: <D393530095829B42ADF67B2F735EF701@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d3b70d-4385-4908-2cd5-08d71e78edc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2019 16:28:23.1899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qmkThh6KDkywN9wwUH9Tft6DqeEvSRZduO/vw0I5ani2oFK1xM+dBtacoTp66cg6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1482
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y7G+McgcLlD9tp86ZMIVKW4cwlyx69LfBcxI0zdTA6I=;
 b=EOrI9STKxNK25LGWodJ5Mv/3dhWfndbCyPSrVOylU+9KUwBTab6d2jQ08yn1hvfmGvfT9e+ZmC2zIvnwvStaovO9Ls0BUrMkczOjbKFgA5MNeUadaZr9oN+c1oVub3Hm4e3UU105nlqi70mkcVKuyfCygpIu1bx6rEc250ra6AI=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: Gustavo Padovan <gustavo@padovan.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMDguMTkgdW0gMTg6MjUgc2NocmllYiBDaHJpcyBXaWxzb246DQo+IFdoZW4gb25lIG9m
IHRoZSBhcnJheSBvZiBmZW5jZXMgaXMgc2lnbmFsZWQsIHByb3BhZ2F0ZSBpdHMgZXJyb3JzIHRv
IHRoZQ0KPiBwYXJlbnQgZmVuY2UtYXJyYXkgKGtlZXBpbmcgdGhlIGZpcnN0IGVycm9yIHRvIGJl
IHJhaXNlZCkuDQo+DQo+IHYyOiBPcGVuY29kZSBjbXB4Y2hnX2xvY2FsIHRvIGF2b2lkIGNvbXBp
bGVyIGZyZWFrb3V0Lg0KPiB2MzogQmUgY2FyZWZ1bCBub3QgdG8gZmxhZyBhbiBlcnJvciBpZiB3
ZSByYWNlIGFnYWluc3Qgc2lnbmFsLW9uLWFueS4NCj4gdjQ6IFNhbWUgYXBwbGllcyB0byBpbnN0
YWxsaW5nIHRoZSBzaWduYWwgY2IuDQo+IHY1OiBVc2UgY21weGNoZyB0byBvbmx5IHNldCB0aGUg
ZXJyb3Igb25jZSBiZWZvcmUgdXNpbmcgYSBuaWZ0eSBpZGVhIGJ5DQo+IENocmlzdGlhbiB0byBh
dm9pZCBjaGFuZ2luZyB0aGUgc3RhdHVzIGFmdGVyIGVtaXR0aW5nIHRoZSBzaWduYWwuDQo+DQo+
IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPg0K
PiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGluYXJvLm9yZz4NCj4gQ2M6IEd1c3Rh
dm8gUGFkb3ZhbiA8Z3VzdGF2b0BwYWRvdmFuLm9yZz4NCj4gQ2M6IENocmlzdGlhbiBLw7ZuaWcg
PGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2RtYS1i
dWYvZG1hLWZlbmNlLWFycmF5LmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
DQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMxIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYyBiL2RyaXZl
cnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYw0KPiBpbmRleCAxMmM2ZjY0YzBiYzIuLmQzZmJk
OTUwYmU5NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5jZS1hcnJheS5j
DQo+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtYXJyYXkuYw0KPiBAQCAtMTMsNiAr
MTMsOCBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4
L2RtYS1mZW5jZS1hcnJheS5oPg0KPiAgIA0KPiArI2RlZmluZSBQRU5ESU5HX0VSUk9SIDENCj4g
Kw0KPiAgIHN0YXRpYyBjb25zdCBjaGFyICpkbWFfZmVuY2VfYXJyYXlfZ2V0X2RyaXZlcl9uYW1l
KHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlKQ0KPiAgIHsNCj4gICAJcmV0dXJuICJkbWFfZmVuY2Vf
YXJyYXkiOw0KPiBAQCAtMjMsMTAgKzI1LDI5IEBAIHN0YXRpYyBjb25zdCBjaGFyICpkbWFfZmVu
Y2VfYXJyYXlfZ2V0X3RpbWVsaW5lX25hbWUoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpDQo+ICAg
CXJldHVybiAidW5ib3VuZCI7DQo+ICAgfQ0KPiAgIA0KPiArc3RhdGljIHZvaWQgZG1hX2ZlbmNl
X2FycmF5X3NldF9wZW5kaW5nX2Vycm9yKHN0cnVjdCBkbWFfZmVuY2VfYXJyYXkgKmFycmF5LA0K
PiArCQkJCQkgICAgICBpbnQgZXJyb3IpDQo+ICt7DQo+ICsJLyoNCj4gKwkgKiBQcm9wYWdhdGUg
dGhlIGZpcnN0IGVycm9yIHJlcG9ydGVkIGJ5IGFueSBvZiBvdXIgZmVuY2VzLCBidXQgb25seQ0K
PiArCSAqIGJlZm9yZSB3ZSBvdXJzZWx2ZXMgYXJlIHNpZ25hbGVkLg0KPiArCSAqLw0KPiArCWlm
IChlcnJvcikNCj4gKwkJY21weGNoZygmYXJyYXktPmJhc2UuZXJyb3IsIFBFTkRJTkdfRVJST1Is
IGVycm9yKTsNCj4gK30NCj4gKw0KPiArc3RhdGljIHZvaWQgZG1hX2ZlbmNlX2FycmF5X2NsZWFy
X3BlbmRpbmdfZXJyb3Ioc3RydWN0IGRtYV9mZW5jZV9hcnJheSAqYXJyYXkpDQo+ICt7DQo+ICsJ
LyogQ2xlYXIgdGhlIGVycm9yIGZsYWcgaWYgbm90IGFjdHVhbGx5IHNldC4gKi8NCj4gKwljbXB4
Y2hnKCZhcnJheS0+YmFzZS5lcnJvciwgUEVORElOR19FUlJPUiwgMCk7DQo+ICt9DQo+ICsNCj4g
ICBzdGF0aWMgdm9pZCBpcnFfZG1hX2ZlbmNlX2FycmF5X3dvcmsoc3RydWN0IGlycV93b3JrICp3
cmspDQo+ICAgew0KPiAgIAlzdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5ICphcnJheSA9IGNvbnRhaW5l
cl9vZih3cmssIHR5cGVvZigqYXJyYXkpLCB3b3JrKTsNCj4gICANCj4gKwlkbWFfZmVuY2VfYXJy
YXlfY2xlYXJfcGVuZGluZ19lcnJvcihhcnJheSk7DQo+ICsNCj4gICAJZG1hX2ZlbmNlX3NpZ25h
bCgmYXJyYXktPmJhc2UpOw0KPiAgIAlkbWFfZmVuY2VfcHV0KCZhcnJheS0+YmFzZSk7DQo+ICAg
fQ0KPiBAQCAtMzgsNiArNTksOCBAQCBzdGF0aWMgdm9pZCBkbWFfZmVuY2VfYXJyYXlfY2JfZnVu
YyhzdHJ1Y3QgZG1hX2ZlbmNlICpmLA0KPiAgIAkJY29udGFpbmVyX29mKGNiLCBzdHJ1Y3QgZG1h
X2ZlbmNlX2FycmF5X2NiLCBjYik7DQo+ICAgCXN0cnVjdCBkbWFfZmVuY2VfYXJyYXkgKmFycmF5
ID0gYXJyYXlfY2ItPmFycmF5Ow0KPiAgIA0KPiArCWRtYV9mZW5jZV9hcnJheV9zZXRfcGVuZGlu
Z19lcnJvcihhcnJheSwgZi0+ZXJyb3IpOw0KPiArDQo+ICAgCWlmIChhdG9taWNfZGVjX2FuZF90
ZXN0KCZhcnJheS0+bnVtX3BlbmRpbmcpKQ0KPiAgIAkJaXJxX3dvcmtfcXVldWUoJmFycmF5LT53
b3JrKTsNCj4gICAJZWxzZQ0KPiBAQCAtNjMsOSArODYsMTQgQEAgc3RhdGljIGJvb2wgZG1hX2Zl
bmNlX2FycmF5X2VuYWJsZV9zaWduYWxpbmcoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpDQo+ICAg
CQlkbWFfZmVuY2VfZ2V0KCZhcnJheS0+YmFzZSk7DQo+ICAgCQlpZiAoZG1hX2ZlbmNlX2FkZF9j
YWxsYmFjayhhcnJheS0+ZmVuY2VzW2ldLCAmY2JbaV0uY2IsDQo+ICAgCQkJCQkgICBkbWFfZmVu
Y2VfYXJyYXlfY2JfZnVuYykpIHsNCj4gKwkJCWludCBlcnJvciA9IGFycmF5LT5mZW5jZXNbaV0t
PmVycm9yOw0KPiArDQo+ICsJCQlkbWFfZmVuY2VfYXJyYXlfc2V0X3BlbmRpbmdfZXJyb3IoYXJy
YXksIGVycm9yKTsNCj4gICAJCQlkbWFfZmVuY2VfcHV0KCZhcnJheS0+YmFzZSk7DQo+IC0JCQlp
ZiAoYXRvbWljX2RlY19hbmRfdGVzdCgmYXJyYXktPm51bV9wZW5kaW5nKSkNCj4gKwkJCWlmIChh
dG9taWNfZGVjX2FuZF90ZXN0KCZhcnJheS0+bnVtX3BlbmRpbmcpKSB7DQo+ICsJCQkJZG1hX2Zl
bmNlX2FycmF5X2NsZWFyX3BlbmRpbmdfZXJyb3IoYXJyYXkpOw0KPiAgIAkJCQlyZXR1cm4gZmFs
c2U7DQo+ICsJCQl9DQo+ICAgCQl9DQo+ICAgCX0NCj4gICANCj4gQEAgLTE0Miw2ICsxNzAsOCBA
QCBzdHJ1Y3QgZG1hX2ZlbmNlX2FycmF5ICpkbWFfZmVuY2VfYXJyYXlfY3JlYXRlKGludCBudW1f
ZmVuY2VzLA0KPiAgIAlhdG9taWNfc2V0KCZhcnJheS0+bnVtX3BlbmRpbmcsIHNpZ25hbF9vbl9h
bnkgPyAxIDogbnVtX2ZlbmNlcyk7DQo+ICAgCWFycmF5LT5mZW5jZXMgPSBmZW5jZXM7DQo+ICAg
DQo+ICsJYXJyYXktPmJhc2UuZXJyb3IgPSBQRU5ESU5HX0VSUk9SOw0KPiArDQo+ICAgCXJldHVy
biBhcnJheTsNCj4gICB9DQo+ICAgRVhQT1JUX1NZTUJPTChkbWFfZmVuY2VfYXJyYXlfY3JlYXRl
KTsNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
