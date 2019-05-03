Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855CF12D9F
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FCE189F07;
	Fri,  3 May 2019 12:31:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8642D89F03
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:31:16 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CVDgM032421;
 Fri, 3 May 2019 07:31:13 -0500
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CVDHK129022
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:31:13 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:31:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:31:13 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYtw002029;
 Fri, 3 May 2019 07:31:11 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 14/23] drm/bridge: tc358767: use more reliable seq when
 finishing LT
Date: Fri, 3 May 2019 15:29:40 +0300
Message-ID: <20190503122949.12266-15-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886673;
 bh=U51m7omCOf6jKJBgqpjPT5g+6TzTgrGcBPh2jxPT/Qg=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=TtTi6zE5kfaMcI7qnkd2Hz2pxi8kB0057O5hMPoOlEAFGrfUQjaXvXjeEi0nI9HN8
 VU2E9BnZlt9MrmFmn2woC5DO+9DFs1KA2UShc/RJX9WIpLrn02rquDJwqaPHTt8h1Y
 UzqvJ7xKaumY3pyZ24Mk3dX9AzvujRTMjnVDQzt4=
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
ZS90YzM1ODc2Ny5jCmluZGV4IGVkMzQ4ZTA5NTc2YS4uODdlYjg3NWUxMTc0IDEwMDY0NAotLS0g
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
