Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6D8E43F8
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2019 09:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B39226E8B3;
	Fri, 25 Oct 2019 07:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720079.outbound.protection.outlook.com [40.107.72.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02C2A6E8B1;
 Fri, 25 Oct 2019 07:04:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIgYxjdcPAw83ZKYdUZd38Rtj0o9CxFnJBewB35Q+Iwz8ElJaERBSSlpakOvF3eU7RC1APpLdh1tBegAdc2LyCF/DUCLal1X1A5apaucgixq8GWSGRCAfvrG7RQ/d2/l5k0BJZ0X6XkaUvZwO9b2MbiRUYJ/9MkCJROwxIW92N8JUJiz8woktEbvHKClfHR/OchvEFNpgTHUlweLzxzxTNhzq92AJqdkNFfkXv4futPQTGRG2rrpm04Uz6LiYKbOabrVqLpYi2QIX5zd1ro9g/uST7C/mMZ+0aGXnpgyH8jKhooGowJisEWh75JE9QX9tGcAnYUe0fiEg+PCH8G7jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o65Ho6mEx5TwXRVQVW7TtOtS0r56IGnPYCzWLcUz0GA=;
 b=TFxV9mo5sK16Y/g+jzKaPKXlmnvcmu27aNxDVU1iQHi5Lm1Y/gO0xQqNPYZcx7qsy7n+1Wc/xqXo0XiQ1OPH70o57Dy99L4uPKrTJUy7zz1hXrbXA64w0okhWtu2Oh3FRD49DFVKxeP/LF8jZv1RS+L6NQxaMNgKaa4bx0nT2t+xWoMQ83bDlCnKfISU0ceTb053MkZAt7g8xBrM2uoeb0f1oXjvLwyTQAerwUXXBH+HzYuE3PWYoMelxuMqZUyogSHhAER/s3bSIC1bLU1P3YvNUUUaJpiflAmJlsowIagJCQ8yXXx+dwEtfvBL7MM0JlPTbNEnGjnkNDWb3E9ZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB3200.namprd12.prod.outlook.com (20.179.82.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.23; Fri, 25 Oct 2019 07:04:31 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::c1ed:2bee:8172:25d8]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::c1ed:2bee:8172:25d8%7]) with mapi id 15.20.2367.022; Fri, 25 Oct 2019
 07:04:31 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <ckoenig.leichtzumerken@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zhou,
 David(ChunMing)" <David1.Zhou@amd.com>
Subject: RE: [PATCH] drm/ttm: use the parent resv for ghost objects v3
Thread-Topic: [PATCH] drm/ttm: use the parent resv for ghost objects v3
Thread-Index: AQHVilyEDOhDyIolMUGH/L4iXEH2xKdq8BgQ
Date: Fri, 25 Oct 2019 07:04:31 +0000
Message-ID: <MN2PR12MB3309282BBF66E364EFEA8984EC650@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <20191024111632.1836-1-christian.koenig@amd.com>
In-Reply-To: <20191024111632.1836-1-christian.koenig@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: f48a309a-7932-48e2-82a0-08d7591995b8
x-ms-traffictypediagnostic: MN2PR12MB3200:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB320007C9E1B96ACC8AB3F296EC650@MN2PR12MB3200.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(979002)(4636009)(396003)(136003)(366004)(39860400002)(376002)(346002)(13464003)(199004)(189003)(64756008)(25786009)(8676002)(316002)(81166006)(66476007)(81156014)(33656002)(86362001)(305945005)(256004)(2501003)(6246003)(9686003)(14444005)(7736002)(966005)(6306002)(55016002)(6636002)(66946007)(476003)(478600001)(66066001)(229853002)(76176011)(66574012)(7696005)(52536014)(110136005)(8936002)(6116002)(3846002)(14454004)(2906002)(186003)(76116006)(71190400001)(71200400001)(5660300002)(74316002)(11346002)(446003)(2201001)(99286004)(53546011)(66446008)(6506007)(6436002)(486006)(102836004)(26005)(66556008)(969003)(989001)(999001)(1009001)(1019001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3200;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: J7/J5AOFgDTMk16vH3kzWSZfGHraWIqGN8mDqkWJJI5T5qbaKtgYnXkxm+qUdG3KsQCXv5FwjZGkE1g0X/7N1yR7j+Yr70kSZdEdpu9eWlvyWDWJeddk/+ghCYkZiJnjy8BYyWf+xZi5iqv4Y1cub49br4kt8AN2KnjJ/sol6GJPJlGXmmH87QrAl0SMIZJ8NqE6a8qZn4wBys3ygyF5vtWDTtK8Php7mZc4un8GoCB+P7w77wvg1re0kbqxqZxPG6/6JWlrjwS86325K0BJYJaumDIzcqskt9/maMAwS30hla3cnToXfbhbQvCnqJFPbkNEoUsNAuPfJ1CoFEhGkv1NFm6qnuF8FDIFpk4JCKbC2aWqNfQk1tdKI3Q506J496CJRnvTSiEFqiH0xie2CdUvfuRKwi9drOJJb70ap9bygFHNmWLtOrcFdinuHNgOtUfCWd6QLcsiIePVHTfNjnpAASqfYHpmQQdjBZ/pN+k=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f48a309a-7932-48e2-82a0-08d7591995b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 07:04:31.5866 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: M+CpqWJIQ6EVWbOKseIcgZ9aIFJ/JbPFI4Tia4XbaMb0UXhKCUtCQ8XkKP915vcqbyvNUoqYEIYB0sWpUJrIhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3200
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o65Ho6mEx5TwXRVQVW7TtOtS0r56IGnPYCzWLcUz0GA=;
 b=Od8PxfAuUOX9JdyVIzFS8r99tDK3otUNMiyC+wuM9GQm19xLqbBtQ56bhdbjyMTEET7AIg+R6RFxrY19u+lCUwKizRH2Jp8jc3RRUxuxBM2WfnUU8/iarbOT+k6ib7gIY7TKgdZamvwPT2wQcatTRvxnLDkTtlNNtk2tFUdAKeQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFtZC5jb20+DQoNCi0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBhbWQtZ2Z4IDxhbWQtZ2Z4LWJvdW5jZXNAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YgQ2hyaXN0aWFuIEvDtm5pZw0KU2VudDogVGh1cnNk
YXksIE9jdG9iZXIgMjQsIDIwMTkgNzoxNyBQTQ0KVG86IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmc7IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBaaG91LCBEYXZpZChDaHVu
TWluZykgPERhdmlkMS5aaG91QGFtZC5jb20+DQpTdWJqZWN0OiBbUEFUQ0hdIGRybS90dG06IHVz
ZSB0aGUgcGFyZW50IHJlc3YgZm9yIGdob3N0IG9iamVjdHMgdjMNCg0KVGhpcyB3YXkgdGhlIFRU
TSBpcyBkZXN0cm95ZWQgd2l0aCB0aGUgY29ycmVjdCBkbWFfcmVzdiBvYmplY3QgbG9ja2VkIGFu
ZCB3ZSBjYW4gZXZlbiBwaXBlbGluZSBpbXBvcnRlZCBCTyBldmljdGlvbnMuDQoNCnYyOiBMaW1p
dCB0aGlzIHRvIG9ubHkgY2FzZXMgd2hlbiB0aGUgcGFyZW50IG9iamVjdCB1c2VzIGEgc2VwYXJh
dGUNCiAgICByZXNlcnZhdGlvbiBvYmplY3QgYXMgd2VsbC4gVGhpcyBmaXhlcyBhbm90aGVyIE9P
TSBwcm9ibGVtLg0KdjM6IGZpeCBpbml0IGFuZCB0cnlfbG9jayBvbiB0aGUgd3Jvbmcgb2JqZWN0
DQoNClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4NCi0tLQ0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyB8IDIwICsrKysr
KysrKysrLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDkgZGVs
ZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGls
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMNCmluZGV4IDczYTFiMDE4NjAy
OS4uZjdiNTdjYTFhOTViIDEwMDY0NA0KLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9f
dXRpbC5jDQorKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMNCkBAIC01MTYs
OSArNTE2LDExIEBAIHN0YXRpYyBpbnQgdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIoc3RydWN0
IHR0bV9idWZmZXJfb2JqZWN0ICpibywNCiAJa3JlZl9pbml0KCZmYm8tPmJhc2Uua3JlZik7DQog
CWZiby0+YmFzZS5kZXN0cm95ID0gJnR0bV90cmFuc2ZlcmVkX2Rlc3Ryb3k7DQogCWZiby0+YmFz
ZS5hY2Nfc2l6ZSA9IDA7DQotCWZiby0+YmFzZS5iYXNlLnJlc3YgPSAmZmJvLT5iYXNlLmJhc2Uu
X3Jlc3Y7DQotCWRtYV9yZXN2X2luaXQoZmJvLT5iYXNlLmJhc2UucmVzdik7DQotCXJldCA9IGRt
YV9yZXN2X3RyeWxvY2soZmJvLT5iYXNlLmJhc2UucmVzdik7DQorCWlmIChiby0+YmFzZS5yZXN2
ID09ICZiby0+YmFzZS5fcmVzdikNCisJCWZiby0+YmFzZS5iYXNlLnJlc3YgPSAmZmJvLT5iYXNl
LmJhc2UuX3Jlc3Y7DQorDQorCWRtYV9yZXN2X2luaXQoJmZiby0+YmFzZS5iYXNlLl9yZXN2KTsN
CisJcmV0ID0gZG1hX3Jlc3ZfdHJ5bG9jaygmZmJvLT5iYXNlLmJhc2UuX3Jlc3YpOw0KIAlXQVJO
X09OKCFyZXQpOw0KIA0KIAkqbmV3X29iaiA9ICZmYm8tPmJhc2U7DQpAQCAtNzE1LDcgKzcxNyw3
IEBAIGludCB0dG1fYm9fbW92ZV9hY2NlbF9jbGVhbnVwKHN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dCAqYm8sDQogCQlpZiAocmV0KQ0KIAkJCXJldHVybiByZXQ7DQogDQotCQlkbWFfcmVzdl9hZGRf
ZXhjbF9mZW5jZShnaG9zdF9vYmotPmJhc2UucmVzdiwgZmVuY2UpOw0KKwkJZG1hX3Jlc3ZfYWRk
X2V4Y2xfZmVuY2UoJmdob3N0X29iai0+YmFzZS5fcmVzdiwgZmVuY2UpOw0KIA0KIAkJLyoqDQog
CQkgKiBJZiB3ZSdyZSBub3QgbW92aW5nIHRvIGZpeGVkIG1lbW9yeSwgdGhlIFRUTSBvYmplY3Qg
QEAgLTcyOCw3ICs3MzAsNyBAQCBpbnQgdHRtX2JvX21vdmVfYWNjZWxfY2xlYW51cChzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLA0KIAkJZWxzZQ0KIAkJCWJvLT50dG0gPSBOVUxMOw0KIA0K
LQkJdHRtX2JvX3VucmVzZXJ2ZShnaG9zdF9vYmopOw0KKwkJZG1hX3Jlc3ZfdW5sb2NrKCZnaG9z
dF9vYmotPmJhc2UuX3Jlc3YpOw0KIAkJdHRtX2JvX3B1dChnaG9zdF9vYmopOw0KIAl9DQogDQpA
QCAtNzcxLDcgKzc3Myw3IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfbW92ZShzdHJ1Y3QgdHRtX2J1
ZmZlcl9vYmplY3QgKmJvLA0KIAkJaWYgKHJldCkNCiAJCQlyZXR1cm4gcmV0Ow0KIA0KLQkJZG1h
X3Jlc3ZfYWRkX2V4Y2xfZmVuY2UoZ2hvc3Rfb2JqLT5iYXNlLnJlc3YsIGZlbmNlKTsNCisJCWRt
YV9yZXN2X2FkZF9leGNsX2ZlbmNlKCZnaG9zdF9vYmotPmJhc2UuX3Jlc3YsIGZlbmNlKTsNCiAN
CiAJCS8qKg0KIAkJICogSWYgd2UncmUgbm90IG1vdmluZyB0byBmaXhlZCBtZW1vcnksIHRoZSBU
VE0gb2JqZWN0IEBAIC03ODQsNyArNzg2LDcgQEAgaW50IHR0bV9ib19waXBlbGluZV9tb3ZlKHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sDQogCQllbHNlDQogCQkJYm8tPnR0bSA9IE5VTEw7
DQogDQotCQl0dG1fYm9fdW5yZXNlcnZlKGdob3N0X29iaik7DQorCQlkbWFfcmVzdl91bmxvY2so
Jmdob3N0X29iai0+YmFzZS5fcmVzdik7DQogCQl0dG1fYm9fcHV0KGdob3N0X29iaik7DQogDQog
CX0gZWxzZSBpZiAoZnJvbS0+ZmxhZ3MgJiBUVE1fTUVNVFlQRV9GTEFHX0ZJWEVEKSB7IEBAIC04
NDAsNyArODQyLDcgQEAgaW50IHR0bV9ib19waXBlbGluZV9ndXR0aW5nKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8pDQogCWlmIChyZXQpDQogCQlyZXR1cm4gcmV0Ow0KIA0KLQlyZXQgPSBk
bWFfcmVzdl9jb3B5X2ZlbmNlcyhnaG9zdC0+YmFzZS5yZXN2LCBiby0+YmFzZS5yZXN2KTsNCisJ
cmV0ID0gZG1hX3Jlc3ZfY29weV9mZW5jZXMoJmdob3N0LT5iYXNlLl9yZXN2LCBiby0+YmFzZS5y
ZXN2KTsNCiAJLyogTGFzdCByZXNvcnQsIHdhaXQgZm9yIHRoZSBCTyB0byBiZSBpZGxlIHdoZW4g
d2UgYXJlIE9PTSAqLw0KIAlpZiAocmV0KQ0KIAkJdHRtX2JvX3dhaXQoYm8sIGZhbHNlLCBmYWxz
ZSk7DQpAQCAtODQ5LDcgKzg1MSw3IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhzdHJ1
Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQ0KIAliby0+bWVtLm1lbV90eXBlID0gVFRNX1BMX1NZ
U1RFTTsNCiAJYm8tPnR0bSA9IE5VTEw7DQogDQotCXR0bV9ib191bnJlc2VydmUoZ2hvc3QpOw0K
KwlkbWFfcmVzdl91bmxvY2soJmdob3N0LT5iYXNlLl9yZXN2KTsNCiAJdHRtX2JvX3B1dChnaG9z
dCk7DQogDQogCXJldHVybiAwOw0KLS0NCjIuMTcuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KYW1kLWdmeCBtYWlsaW5nIGxpc3QNCmFtZC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2FtZC1nZngNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
