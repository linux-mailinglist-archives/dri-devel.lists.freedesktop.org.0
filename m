Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA172C13A
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 10:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0ABC689C9A;
	Tue, 28 May 2019 08:28:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC3289C93
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 08:28:21 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4S8SH2S036580;
 Tue, 28 May 2019 03:28:17 -0500
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4S8SHCJ114654
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2019 03:28:17 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 28
 May 2019 03:28:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 28 May 2019 03:28:17 -0500
Received: from deskari.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4S8Rxua125039;
 Tue, 28 May 2019 03:28:14 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: <dri-devel@lists.freedesktop.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Andrey Smirnov
 <andrew.smirnov@gmail.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Jyri
 Sarha <jsarha@ti.com>, Benoit Parrot <bparrot@ti.com>
Subject: [PATCHv4 06/24] drm/bridge: tc358767: cleanup aux_link_setup
Date: Tue, 28 May 2019 11:27:29 +0300
Message-ID: <20190528082747.3631-7-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528082747.3631-1-tomi.valkeinen@ti.com>
References: <20190528082747.3631-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1559032097;
 bh=JA81L4DZF+VT1/si/AaH2gVLTQtIvC+v133rQ78YOJI=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=ymcvbDnYJt3AOdKyl1PlSX/VWic7R7XV3ES5aYld1EtyriJv6q9rchSQq29tfNYrN
 2pdEHeWG73FvGKHzzFY6B1cq4vSkmSQ0l/6Gu1lxgOSwm24NWoq4FFZ2atdvyl0ysV
 IPlKo1qQsuSQZ0HiTx6qGk0DG/e4W3mJKLXtojeE=
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
dGMzNTg3NjcuYwppbmRleCAxMTljZDhkMTRkNGIuLjM5YTlkZTg4MGU1YSAxMDA2NDQKLS0tIGEv
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
