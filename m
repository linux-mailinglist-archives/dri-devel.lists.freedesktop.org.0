Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EFE12D94
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:31:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB74289E7B;
	Fri,  3 May 2019 12:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0E08920E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:30:57 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CUsab097966;
 Fri, 3 May 2019 07:30:54 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CUsfJ128201
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:30:54 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:30:52 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:30:52 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYto002029;
 Fri, 3 May 2019 07:30:50 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 06/23] drm/bridge: tc358767: cleanup aux_link_setup
Date: Fri, 3 May 2019 15:29:32 +0300
Message-ID: <20190503122949.12266-7-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886654;
 bh=fQsmmtM5MpRYWPrPM4z5XLDBrl2HrOSXP7IvYRrRnZI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=BDrwWKGCIzwMC3Vb5ZDJja0MO9h+LmrHfpAqOBe+OWyqxiAJuM8UG9jrJYngM1bQu
 qAEM+E/YUQFOvt0bV0qMVhX46PodB7wy1fAIiIPjATy4vNHTxAl23ZeQi/7Ic0D0No
 7C+ep4rmu7UVeDopaXK0CZtHxyN4t6pCx0aJrjJE=
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

VGhlIGRyaXZlciBzZXRzIHVwIEFVWCBsaW5rIGF0IHByb2JlIHRpbWUsIGJ1dCwgZm9yIHNvbWUg
cmVhc29uLCBhbHNvCnNldHMgdGhlIG1haW4gbGluaydzIG51bWJlciBvZiBsYW5lcyB1c2luZyB0
Yy0+bGluay5iYXNlLm51bV9sYW5lcy4gVGhpcwppcyBub3QgbmVlZGVkIG5vciBjb3JyZWN0LCBh
cyB0aGUgbnVtYmVyIG9mIGxhbmVzIGhhcyBub3QgYmVlbiBkZWNpZGVkCnlldC4gVGhlIG51bWJl
ciBvZiBsYW5lcyB3aWxsIGJlIHNldCBsYXRlciBkdXJpbmcgbWFpbiBsaW5rIHNldHVwLgoKTW9k
aWZ5IGF1eF9saW5rX3NldHVwIHNvIHRoYXQgaXQgZG9lcyBub3QgdXNlIHRjLT5saW5rLCBhbmQg
dGh1cyBtYWtlcwphdXggc2V0dXAgaW5kZXBlbmRlbnQgb2YgdGhlIGxpbmsgcHJvYmluZy4KClNp
Z25lZC1vZmYtYnk6IFRvbWkgVmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+ClJldmll
d2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpSZXZpZXdlZC1ieTog
TGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDkgKysrLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGMzNTg3NjcuYwppbmRleCBmNTQ5MThiMDU5NGMuLmYxMjU3MjdhYzk4ZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvdGMzNTg3NjcuYwpAQCAtNTQyLDcgKzU0Miw2IEBAIHN0YXRpYyBpbnQgdGNfYXV4X2xp
bmtfc2V0dXAoc3RydWN0IHRjX2RhdGEgKnRjKQogCXVuc2lnbmVkIGxvbmcgcmF0ZTsKIAl1MzIg
dmFsdWU7CiAJaW50IHJldDsKLQl1MzIgZHBfcGh5X2N0cmw7CiAKIAlyYXRlID0gY2xrX2dldF9y
YXRlKHRjLT5yZWZjbGspOwogCXN3aXRjaCAocmF0ZSkgewpAQCAtNTY3LDEwICs1NjYsNyBAQCBz
dGF0aWMgaW50IHRjX2F1eF9saW5rX3NldHVwKHN0cnVjdCB0Y19kYXRhICp0YykKIAl2YWx1ZSB8
PSBTWVNDTEtfU0VMX0xTQ0xLIHwgTFNDTEtfRElWXzI7CiAJdGNfd3JpdGUoU1lTX1BMTFBBUkFN
LCB2YWx1ZSk7CiAKLQlkcF9waHlfY3RybCA9IEJHUkVOIHwgUFdSX1NXX0VOIHwgUEhZX0EwX0VO
OwotCWlmICh0Yy0+bGluay5iYXNlLm51bV9sYW5lcyA9PSAyKQotCQlkcF9waHlfY3RybCB8PSBQ
SFlfMkxBTkU7Ci0JdGNfd3JpdGUoRFBfUEhZX0NUUkwsIGRwX3BoeV9jdHJsKTsKKwl0Y193cml0
ZShEUF9QSFlfQ1RSTCwgQkdSRU4gfCBQV1JfU1dfRU4gfCBQSFlfQTBfRU4pOwogCiAJLyoKIAkg
KiBJbml0aWFsbHkgUExMcyBhcmUgaW4gYnlwYXNzLiBGb3JjZSBQTEwgcGFyYW1ldGVyIHVwZGF0
ZSwKQEAgLTU4Nyw4ICs1ODMsOSBAQCBzdGF0aWMgaW50IHRjX2F1eF9saW5rX3NldHVwKHN0cnVj
dCB0Y19kYXRhICp0YykKIAlpZiAocmV0ID09IC1FVElNRURPVVQpIHsKIAkJZGV2X2Vycih0Yy0+
ZGV2LCAiVGltZW91dCB3YWl0aW5nIGZvciBQSFkgdG8gYmVjb21lIHJlYWR5Iik7CiAJCXJldHVy
biByZXQ7Ci0JfSBlbHNlIGlmIChyZXQpCisJfSBlbHNlIGlmIChyZXQpIHsKIAkJZ290byBlcnI7
CisJfQogCiAJLyogU2V0dXAgQVVYIGxpbmsgKi8KIAl0Y193cml0ZShEUDBfQVVYQ0ZHMSwgQVVY
X1JYX0ZJTFRFUl9FTiB8Ci0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2Fs
YW5rYXR1IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEt
NC4gS290aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
