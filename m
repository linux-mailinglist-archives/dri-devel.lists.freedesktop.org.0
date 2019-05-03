Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF9212D8F
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2019 14:30:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460B489166;
	Fri,  3 May 2019 12:30:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D1989155
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2019 12:30:50 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x43CUl9I097952;
 Fri, 3 May 2019 07:30:47 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x43CUlvD128126
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 3 May 2019 07:30:47 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Fri, 3 May
 2019 07:30:45 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Fri, 3 May 2019 07:30:45 -0500
Received: from deskari.lan (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x43CUYtl002029;
 Fri, 3 May 2019 07:30:42 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Lucas Stach <l.stach@pengutronix.de>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Andrey Smirnov <andrew.smirnov@gmail.com>, Peter
 Ujfalusi <peter.ujfalusi@ti.com>, Jyri Sarha <jsarha@ti.com>, Benoit Parrot
 <bparrot@ti.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCHv3 03/23] drm/bridge: tc358767: fix ansi 8b10b use
Date: Fri, 3 May 2019 15:29:29 +0300
Message-ID: <20190503122949.12266-4-tomi.valkeinen@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190503122949.12266-1-tomi.valkeinen@ti.com>
References: <20190503122949.12266-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1556886647;
 bh=JPB40UxzUkwNzUpkes2MJwUEmhdZjthamiLdYgcgyoY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=epJ+MRbMA3uzSFLggukpAaAmm9pHc+8mw7tgF/dEaXDurVYAw6tsrzNuK4dkFrQ0j
 dE9KhpbwBltg9DAGMC7wX+Z3BZgglcspvV+KLIe55/JlkEZkcZ693NRLhx241BznZF
 BPiFCavtT0xoe/TAI5yCMQRrqkjjMf2X2RBwmxpI=
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

RFAgYWx3YXlzIHVzZXMgQU5TSSA4QjEwQiBlbmNvZGluZy4gU29tZSBtb25pdG9ycyAob2xkPykg
bWF5IG5vdCBoYXZlCnRoZSBBTlNJIDhCMTBCIGJpdCBzZXQgaW4gRFBDRCwgZXZlbiBpZiBpdCBz
aG91bGQgYWx3YXlzIGJlIHNldC4KClRoZSB0YzM1ODc2NyBkcml2ZXIgY3VycmVudGx5IHJlc3Bl
Y3RzIHRoYXQgZmxhZywgYW5kIHR1cm5zIHRoZSBlbmNvZGluZwpvZmYgaWYgdGhlIG1vbml0b3Ig
ZG9lcyBub3QgaGF2ZSB0aGUgYml0IHNldCwgd2hpY2ggdGhlbiByZXN1bHRzIGluIHRoZQptb25p
dG9yIG5vdCB3b3JraW5nLgoKVGhpcyBwYXRjaCBtYWtlcyB0aGUgZHJpdmVyIHRvIGFsd2F5cyB1
c2UgQU5TSSA4QjEwQiBlbmNvZGluZywgYW5kIGRyb3BzCnRoZSAnY29kaW5nOGIxMGInIGZpZWxk
IHdoaWNoIGlzIG5vIGxvbmdlciB1c2VkLgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4g
PHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJ6ZWogSGFqZGEgPGEuaGFq
ZGFAc2Ftc3VuZy5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIHwg
MTEgKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDggZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jIGIv
ZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCmluZGV4IDAzZGE0N2NmZjE4Mi4uNjY0
Y2M2OTFhODQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2Ny5jCkBAIC0xODgsNyArMTg4LDYg
QEAgc3RydWN0IHRjX2VkcF9saW5rIHsKIAl1OAkJCWFzc3I7CiAJaW50CQkJc2NyYW1ibGVyX2Rp
czsKIAlpbnQJCQlzcHJlYWQ7Ci0JaW50CQkJY29kaW5nOGIxMGI7CiAJdTgJCQlzd2luZzsKIAl1
OAkJCXByZWVtcDsKIH07CkBAIC0zOTAsMTMgKzM4OSwxMCBAQCBzdGF0aWMgdTMyIHRjX3NyY2N0
cmwoc3RydWN0IHRjX2RhdGEgKnRjKQogCSAqIE5vIHRyYWluaW5nIHBhdHRlcm4sIHNrZXcgbGFu
ZSAxIGRhdGEgYnkgdHdvIExTQ0xLIGN5Y2xlcyB3aXRoCiAJICogcmVzcGVjdCB0byBsYW5lIDAg
ZGF0YSwgQXV0b0NvcnJlY3QgTW9kZSA9IDAKIAkgKi8KLQl1MzIgcmVnID0gRFAwX1NSQ0NUUkxf
Tk9UUCB8IERQMF9TUkNDVFJMX0xBTkVTS0VXOworCXUzMiByZWcgPSBEUDBfU1JDQ1RSTF9OT1RQ
IHwgRFAwX1NSQ0NUUkxfTEFORVNLRVcgfCBEUDBfU1JDQ1RSTF9FTjgxMEI7CiAKIAlpZiAodGMt
Pmxpbmsuc2NyYW1ibGVyX2RpcykKIAkJcmVnIHw9IERQMF9TUkNDVFJMX1NDUk1CTERJUzsJLyog
U2NyYW1ibGVyIERpc2FibGVkICovCi0JaWYgKHRjLT5saW5rLmNvZGluZzhiMTBiKQotCQkvKiBF
bmFibGUgOC8xMEIgRW5jb2RlciAoVHhEYXRhWzE5OjE2XSBub3QgdXNlZCkgKi8KLQkJcmVnIHw9
IERQMF9TUkNDVFJMX0VOODEwQjsKIAlpZiAodGMtPmxpbmsuc3ByZWFkKQogCQlyZWcgfD0gRFAw
X1NSQ0NUUkxfU1NDRzsJLyogU3ByZWFkIFNwZWN0cnVtIEVuYWJsZSAqLwogCWlmICh0Yy0+bGlu
ay5iYXNlLm51bV9sYW5lcyA9PSAyKQpAQCAtNjM1LDcgKzYzMSw3IEBAIHN0YXRpYyBpbnQgdGNf
Z2V0X2Rpc3BsYXlfcHJvcHMoc3RydWN0IHRjX2RhdGEgKnRjKQogCXJldCA9IGRybV9kcF9kcGNk
X3JlYWRiKCZ0Yy0+YXV4LCBEUF9NQUlOX0xJTktfQ0hBTk5FTF9DT0RJTkcsIHRtcCk7CiAJaWYg
KHJldCA8IDApCiAJCWdvdG8gZXJyX2RwY2RfcmVhZDsKLQl0Yy0+bGluay5jb2Rpbmc4YjEwYiA9
IHRtcFswXSAmIEJJVCgwKTsKKwogCXRjLT5saW5rLnNjcmFtYmxlcl9kaXMgPSAwOwogCS8qIHJl
YWQgYXNzciAqLwogCXJldCA9IGRybV9kcF9kcGNkX3JlYWRiKCZ0Yy0+YXV4LCBEUF9FRFBfQ09O
RklHVVJBVElPTl9TRVQsIHRtcCk7CkBAIC02NDksNyArNjQ1LDYgQEAgc3RhdGljIGludCB0Y19n
ZXRfZGlzcGxheV9wcm9wcyhzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJCXRjLT5saW5rLmJhc2UubnVt
X2xhbmVzLAogCQkodGMtPmxpbmsuYmFzZS5jYXBhYmlsaXRpZXMgJiBEUF9MSU5LX0NBUF9FTkhB
TkNFRF9GUkFNSU5HKSA/CiAJCSJlbmhhbmNlZCIgOiAibm9uLWVuaGFuY2VkIik7Ci0JZGV2X2Ri
Zyh0Yy0+ZGV2LCAiQU5TSSA4Qi8xMEI6ICVkXG4iLCB0Yy0+bGluay5jb2Rpbmc4YjEwYik7CiAJ
ZGV2X2RiZyh0Yy0+ZGV2LCAiRGlzcGxheSBBU1NSOiAlZCwgVEMzNTg3NjcgQVNTUjogJWRcbiIs
CiAJCXRjLT5saW5rLmFzc3IsIHRjLT5hc3NyKTsKIApAQCAtOTUxLDcgKzk0Niw3IEBAIHN0YXRp
YyBpbnQgdGNfbWFpbl9saW5rX3NldHVwKHN0cnVjdCB0Y19kYXRhICp0YykKIAkvKiBET1dOU1BS
RUFEX0NUUkwgKi8KIAl0bXBbMF0gPSB0Yy0+bGluay5zcHJlYWQgPyBEUF9TUFJFQURfQU1QXzBf
NSA6IDB4MDA7CiAJLyogTUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HX1NFVCAqLwotCXRtcFsxXSA9
ICB0Yy0+bGluay5jb2Rpbmc4YjEwYiA/IERQX1NFVF9BTlNJXzhCMTBCIDogMHgwMDsKKwl0bXBb
MV0gPSAgRFBfU0VUX0FOU0lfOEIxMEI7CiAJcmV0ID0gZHJtX2RwX2RwY2Rfd3JpdGUoYXV4LCBE
UF9ET1dOU1BSRUFEX0NUUkwsIHRtcCwgMik7CiAJaWYgKHJldCA8IDApCiAJCWdvdG8gZXJyX2Rw
Y2Rfd3JpdGU7Ci0tIApUZXhhcyBJbnN0cnVtZW50cyBGaW5sYW5kIE95LCBQb3Jra2FsYW5rYXR1
IDIyLCAwMDE4MCBIZWxzaW5raS4KWS10dW5udXMvQnVzaW5lc3MgSUQ6IDA2MTU1MjEtNC4gS290
aXBhaWtrYS9Eb21pY2lsZTogSGVsc2lua2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
