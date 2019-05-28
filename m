Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF7F2C142
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:29:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D76289CAF;
	Tue, 28 May 2019 08:28:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863C989CF9
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:41 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Sc69125286;
 Tue, 28 May 2019 03:28:38 -0500
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8SbQE083025
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:37 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:37 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Rxui125039;
 Tue, 28 May 2019 03:28:35 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 14/24] drm/bridge: tc358767: use more reliable seq when
 finishing LT
Date: Tue, 28 May 2019 11:27:37 +0300
Message-ID: <20190528082747.3631-15-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032118;
 bh=I0qHcVhPYKdpjSqR6xuKYqzFyr4QxWqd0Vb32SyYoX8=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=XmQ9/HudenOGCTnrHdL9qC8wL9XLnl5vizfg2cXITDrA6ZvAtaG85o0mzfPHMhQFD
 zSvTd+lBvQcSMszkPDPdSl87Ce1trjIqvarJargsiE9dtbkcKS3l3pckgGEwRoWEMx
 Y/u5esZXyEdUU0HkgS2Ni1FJpt3y3UbKietcgeOU=
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
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXQgdGhlIGVuZCBvZiB0aGUgbGluayB0cmFpbmluZywgdHdvIHN0ZXBzIGhhdmUgdG8gYmUgdGFr
ZW46IDEpCnRjMzU4NzY3J3MgTFQgbW9kZSBpcyBkaXNhYmxlZCBieSBhIHdyaXRlIHRvIERQMF9T
UkNDVFJMLCBhbmQgMikgUmVtb3ZlCkxUIGZsYWcgaW4gRFBDRCAweDEwMi4KClRvc2hpYmEncyBk
b2N1bWVudGF0aW9uIHRlbGxzIHRvIGZpcnN0IHdyaXRlIHRoZSBEUENELCB0aGVuIG1vZGlmeQpE
UDBfU1JDQ1RSTC4gSW4gbXkgdGVzdGluZyB0aGlzIG9mdGVuIGNhdXNlcyBpc3N1ZXMsIGFuZCB0
aGUgbGluawpkaXNjb25uZWN0cyByaWdodCBhZnRlciB0aG9zZSBzdGVwcy4KCklmIEkgcmV2ZXJz
ZSB0aGUgc3RlcHMsIGl0IHdvcmtzIGV2ZXJ5IHRpbWUuIFRoZXJlJ3MgYSBjaGFuY2UgdGhhdCB0
aGlzCmlzIERQIHNpbmsgc3BlY2lmaWMsIHRob3VnaCwgYnV0IGFzIG15IHRlc3Rpbmcgc2hvd3Mg
dGhpcyBzZXF1ZW5jZSB0byBiZQptdWNoIG1vcmUgcmVsaWFibGUsIGxldCdzIGNoYW5nZSBpdC4K
ClNpZ25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+ClJl
dmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDE1ICsrKysrKysrKysrKy0tLQogMSBmaWxl
IGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS90YzM1ODc2Ny5jCmluZGV4IGE2MGEyZTY1ZTQ2OC4uNDBmM2VmY2FkZTUwIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS90YzM1ODc2Ny5jCkBAIC05NjEsNiArOTYxLDE4IEBAIHN0YXRpYyBpbnQgdGNfbWFp
bl9saW5rX2VuYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJaWYgKHJldCkKIAkJZ290byBlcnI7
CiAKKwkvKgorCSAqIFRvc2hpYmEncyBkb2N1bWVudGF0aW9uIHN1Z2dlc3RzIHRvIGZpcnN0IGNs
ZWFyIERQQ0QgMHgxMDIsIHRoZW4KKwkgKiBjbGVhciB0aGUgdHJhaW5pbmcgcGF0dGVybiBiaXQg
aW4gRFAwX1NSQ0NUUkwuIFRlc3Rpbmcgc2hvd3MKKwkgKiB0aGF0IHRoZSBsaW5rIHNvbWV0aW1l
cyBkcm9wcyBpZiB0aG9zZSBzdGVwcyBhcmUgZG9uZSBpbiB0aGF0IG9yZGVyLAorCSAqIGJ1dCBp
ZiB0aGUgc3RlcHMgYXJlIGRvbmUgaW4gcmV2ZXJzZSBvcmRlciwgdGhlIGxpbmsgc3RheXMgdXAu
CisJICoKKwkgKiBTbyB3ZSBkbyB0aGUgc3RlcHMgZGlmZmVyZW50bHkgdGhhbiBkb2N1bWVudGVk
IGhlcmUuCisJICovCisKKwkvKiBDbGVhciBUcmFpbmluZyBQYXR0ZXJuLCBzZXQgQXV0b0NvcnJl
Y3QgTW9kZSA9IDEgKi8KKwl0Y193cml0ZShEUDBfU1JDQ1RSTCwgdGNfc3JjY3RybCh0YykgfCBE
UDBfU1JDQ1RSTF9BVVRPQ09SUkVDVCk7CisKIAkvKiBDbGVhciBEUENEIDB4MTAyICovCiAJLyog
Tm90ZTogQ2FuIE5vdCB1c2UgRFAwX1NOS0xUQ1RSTCAoMHgwNkU0KSBzaG9ydCBjdXQgKi8KIAl0
bXBbMF0gPSB0Yy0+bGluay5zY3JhbWJsZXJfZGlzID8gRFBfTElOS19TQ1JBTUJMSU5HX0RJU0FC
TEUgOiAweDAwOwpAQCAtOTY4LDkgKzk4MCw2IEBAIHN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX2Vu
YWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJaWYgKHJldCA8IDApCiAJCWdvdG8gZXJyX2RwY2Rf
d3JpdGU7CiAKLQkvKiBDbGVhciBUcmFpbmluZyBQYXR0ZXJuLCBzZXQgQXV0b0NvcnJlY3QgTW9k
ZSA9IDEgKi8KLQl0Y193cml0ZShEUDBfU1JDQ1RSTCwgdGNfc3JjY3RybCh0YykgfCBEUDBfU1JD
Q1RSTF9BVVRPQ09SUkVDVCk7Ci0KIAkvKiBXYWl0ICovCiAJdGltZW91dCA9IDEwMDsKIAlkbyB7
Ci0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1IDIyLCAwMDE4
MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290aXBhaWtrYS9E
b21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
