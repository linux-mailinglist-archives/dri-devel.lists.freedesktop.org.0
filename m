Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 465F076283
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jul 2019 11:49:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7B226ECE5;
	Fri, 26 Jul 2019 09:42:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on0707.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe06::707])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA2E96E6F6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 11:05:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgMcx9JgKAwmTEHB3YX+6ZE/9mTtvzSzRZcntsWDjENKAsGjAlnmX2u6W75DWIaZYPxnTYfHrxc3mf/AxdJWd3Rp1zZdtS/MjsC9DNOvL13luZvB6R861f2ESRjjwAv4M2NAr8htkIGziVKXkLud5G4zck6uKZaqtstJU0+T5F+wuoDkGbnJcp8o2L4IbHYi/j9Ov8pH00lAY8DceZH3on+O2ZMETbc8ytBIzJHzYDC5mGa3LrHxVAY1g3GrFBwL/thbXX8nEIMDQjAadb6pQCScfsvup5CM717ydoHqi3K8XvFRYuUXPWggZFENzhJeiOsX+10UlPS30LmJ6/2Khg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRcXUpf4uIYFEL9fgZ8SDY54LsOYeAmHh5gNyiFNMvA=;
 b=IX6djHgbkaRzkd05vdyTTibmU8ba2C0rpg14KuS0r/jVDripxogc+iKszoXuTLp43lAakv9qcZ37tpSrN0hacqu/yXtTxY9G5SQ2zVa6qmw89kGCDuXOD8p1gqd7mu83VcoVbPRnw7uw7xvl+ND/yLGvnWSljB6iuHkzPLuvoX3UbA6coebTnqxxSxppFZGoyljv9OdALsNLx9mCvJ9wrMTAlJkiYKWoK7lpJExJenv0hj7autofwvJxu6rZUqgAGGW+vCphq7hUrEdrjLqAv2iMaafoAj7aNlPBw7ahnA0c4HxvWppJqly46aYlBqhMkwFxelS6JXt6z4RDaazk6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=toradex.com;dmarc=pass action=none
 header.from=toradex.com;dkim=pass header.d=toradex.com;arc=none
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com (20.179.18.16) by
 AM6PR05MB6406.eurprd05.prod.outlook.com (20.179.6.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Thu, 25 Jul 2019 11:05:25 +0000
Received: from AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9]) by AM6PR05MB6535.eurprd05.prod.outlook.com
 ([fe80::c860:b386:22a:8ec9%6]) with mapi id 15.20.2094.017; Thu, 25 Jul 2019
 11:05:25 +0000
From: Oleksandr Suvorov <oleksandr.suvorov@toradex.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>
Subject: [PATCH 1/1] drm/bridge: vga-dac: Fix detect of monitor connection
Thread-Topic: [PATCH 1/1] drm/bridge: vga-dac: Fix detect of monitor connection
Thread-Index: AQHVQtjc9EMAkuteLkuZ4bDgcKxYhw==
Date: Thu, 25 Jul 2019 11:05:24 +0000
Message-ID: <20190725110520.26848-2-oleksandr.suvorov@toradex.com>
References: <20190725110520.26848-1-oleksandr.suvorov@toradex.com>
In-Reply-To: <20190725110520.26848-1-oleksandr.suvorov@toradex.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0065.eurprd01.prod.exchangelabs.com
 (2603:10a6:208::42) To AM6PR05MB6535.eurprd05.prod.outlook.com
 (2603:10a6:20b:71::16)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.20.1
x-originating-ip: [194.105.145.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c189facf-cd15-4efd-ab54-08d710effe73
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:AM6PR05MB6406; 
x-ms-traffictypediagnostic: AM6PR05MB6406:
x-microsoft-antispam-prvs: <AM6PR05MB640639F565F8E4514DBB8F00F9C10@AM6PR05MB6406.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:510;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(199004)(189003)(81166006)(6512007)(66066001)(25786009)(71190400001)(2906002)(7736002)(305945005)(14444005)(4326008)(7416002)(498600001)(52116002)(99286004)(71200400001)(256004)(66446008)(64756008)(76176011)(14454004)(44832011)(6486002)(66946007)(68736007)(6436002)(2616005)(50226002)(476003)(186003)(446003)(386003)(102836004)(5660300002)(8676002)(6506007)(26005)(54906003)(3846002)(53936002)(81156014)(6116002)(8936002)(110136005)(1076003)(86362001)(36756003)(66476007)(66556008)(11346002)(486006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR05MB6406;
 H:AM6PR05MB6535.eurprd05.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: toradex.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9sx3bRzoIwHGRTYe9Mut9UdPVq3Pprnz13VlerohJShlidAhougJ7JtWFM15JSX66/9FUGwVWlgoEzY0MYslyPF8mVaZx+w1kz+ojk7Qwnsxuvqv8ibhHVHnjvBLTgwFOBy5AZBkD6MAfw8fTpyUOHLjgxnbRJlCZihX6Xk7T1NYM2op5OgijWRY8GmilP7BK2Q0svs9YH9DmCa/shTF+9pDmOdLYlRhL35GK6N/tcoveahpUuJsdBWOPQpSREKIEaNKfQF8k50SjlsBpKEDDAPU0ePFKn1DpdjmatdzbrqAbI760HfjiuSovQiDzeCN1tdq8www6B178dhcL+XjilUZChUkUKv2m0yINBV+M1EY4miXh5rwIJkcyh2cfokkO089Hre0kGefwSz8pLN44K0vxkksKh5G0yxy0fWISv4=
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c189facf-cd15-4efd-ab54-08d710effe73
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 11:05:24.9995 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oleksandr.suvorov@toradex.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR05MB6406
X-Mailman-Approved-At: Fri, 26 Jul 2019 09:41:34 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toradex.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRcXUpf4uIYFEL9fgZ8SDY54LsOYeAmHh5gNyiFNMvA=;
 b=eK+t2Z8rHysT+V043gYsS5vwQSWPDOgs7BW26yD/g5+T/TXnt+AaaFHFwqsVDQ1CvWKqJYYptlIz9UEpQEoOHiHLmD3ZttbTMkKBqe5zHlDtbRw+qloospQrGMH6Uuwb7LzKgAywchmFNYkqAkw2We4tD4t3sf8wXu0kWsHT6Ts=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=oleksandr.suvorov@toradex.com; 
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Igor Opaniuk <igor.opaniuk@toradex.com>, Jonas Karlman <jonas@kwiboo.se>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Oleksandr Suvorov <oleksandr.suvorov@toradex.com>,
 David Airlie <airlied@linux.ie>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "maxime.ripard@free-electrons.com" <maxime.ripard@free-electrons.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RERDIGFuZCBWR0EgY2hhbm5lbHMgYXJlIGluZGVwZW5kZW50LCBhbmQgdGhlcmVmb3JlCndlIGNh
bm5vdCBkZWNpZGUgd2hldGhlciB0aGUgbW9uaXRvciBpcyBjb25uZWN0ZWQgb3Igbm90LApkZXBl
bmRpbmcgb24gdGhlIGluZm9ybWF0aW9uIGZyb20gdGhlIEREQy4KClNvIHRoZSBtb25pdG9yIHNo
b3VsZCBhbHdheXMgYmUgY29uc2lkZXJlZCBjb25uZWN0ZWQuClRodXMgdGhlcmUgaXMgbm8gcmVh
c29uIHRvIHVzZSBjb25uZWN0b3IgZGV0ZWN0IGNhbGxiYWNrIGZvciB0aGlzCmRyaXZlci4KCkZp
eGVzIERSTSBlcnJvciBvZiBkdW1iIG1vbml0b3IgZGV0ZWN0aW9uIGxpa2U6Ci4uLgpEUk06IGhl
YWQgJ1ZHQS0xJyBmb3VuZCwgY29ubmVjdG9yIDMyIGlzIGRpc2Nvbm5lY3RlZC4KLi4uCgpDYzog
c3RhYmxlQHZnZXIua2VybmVsLm9yZwpGaXhlczogNTZmZThiNmY0OTkxICgiZHJtL2JyaWRnZTog
QWRkIFJHQiB0byBWR0EgYnJpZGdlIHN1cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIg
U3V2b3JvdiA8b2xla3NhbmRyLnN1dm9yb3ZAdG9yYWRleC5jb20+Ci0tLQoKIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvZHVtYi12Z2EtZGFjLmMgfCAxOCAtLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YnJpZGdlL2R1bWItdmdhLWRhYy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1k
YWMuYwppbmRleCBkMzI4ODViOTA2YWUuLmUzN2MxOTM1NmQxMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2JyaWRnZS9kdW1iLXZnYS1kYWMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2R1bWItdmdhLWRhYy5jCkBAIC03MywyNSArNzMsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9jb25uZWN0b3JfaGVscGVyX2Z1bmNzIGR1bWJfdmdhX2Nvbl9oZWxwZXJfZnVuY3MgPSB7
CiAJLmdldF9tb2Rlcwk9IGR1bWJfdmdhX2dldF9tb2RlcywKIH07CiAKLXN0YXRpYyBlbnVtIGRy
bV9jb25uZWN0b3Jfc3RhdHVzCi1kdW1iX3ZnYV9jb25uZWN0b3JfZGV0ZWN0KHN0cnVjdCBkcm1f
Y29ubmVjdG9yICpjb25uZWN0b3IsIGJvb2wgZm9yY2UpCi17Ci0Jc3RydWN0IGR1bWJfdmdhICp2
Z2EgPSBkcm1fY29ubmVjdG9yX3RvX2R1bWJfdmdhKGNvbm5lY3Rvcik7Ci0KLQkvKgotCSAqIEV2
ZW4gaWYgd2UgaGF2ZSBhbiBJMkMgYnVzLCB3ZSBjYW4ndCBhc3N1bWUgdGhhdCB0aGUgY2FibGUK
LQkgKiBpcyBkaXNjb25uZWN0ZWQgaWYgZHJtX3Byb2JlX2RkYyBmYWlscy4gU29tZSBjYWJsZXMg
ZG9uJ3QKLQkgKiB3aXJlIHRoZSBEREMgcGlucywgb3IgdGhlIEkyQyBidXMgbWlnaHQgbm90IGJl
IHdvcmtpbmcgYXQKLQkgKiBhbGwuCi0JICovCi0JaWYgKCFJU19FUlIodmdhLT5kZGMpICYmIGRy
bV9wcm9iZV9kZGModmdhLT5kZGMpKQotCQlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0
ZWQ7Ci0KLQlyZXR1cm4gY29ubmVjdG9yX3N0YXR1c191bmtub3duOwotfQotCiBzdGF0aWMgY29u
c3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgZHVtYl92Z2FfY29uX2Z1bmNzID0gewotCS5k
ZXRlY3QJCQk9IGR1bWJfdmdhX2Nvbm5lY3Rvcl9kZXRlY3QsCiAJLmZpbGxfbW9kZXMJCT0gZHJt
X2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzLAogCS5kZXN0cm95CQk9IGRybV9j
b25uZWN0b3JfY2xlYW51cCwKIAkucmVzZXQJCQk9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rv
cl9yZXNldCwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
