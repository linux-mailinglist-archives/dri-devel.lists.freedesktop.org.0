Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0183D61FD7
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 15:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F3D489CD9;
	Mon,  8 Jul 2019 13:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 663E289C33;
 Mon,  8 Jul 2019 13:52:48 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MTAJl-1hvicR406R-00UWYx; Mon, 08 Jul 2019 15:52:41 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/amd/display: avoid 64-bit division
Date: Mon,  8 Jul 2019 15:52:08 +0200
Message-Id: <20190708135238.651483-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:52AGef0Lq+dkr8kwjZNMwANHvgY3NRXyfVsWmIJgsnAVhNNRfc6
 +DvJqiMs58ht8342jZhhnhohh35rAb8AknH5DtGDOAN2AdFoXCfAFhd66huKJ7KP7xjFEOl
 1kTxt89yac00Xl8XVX6DHMdODQQoJ3QXl2KnJ+nrhTWnmYS5yWJD5d1DKT84ZJmlLvczuip
 7ZBsA0mrNEjAw8ono+ZwA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LM2YkTiy6w0=:Urgvr2KhXrQJHmnNUZ3Aay
 HFfPj1p4DzZqha1rGAJgrxsvl9i8srVeglCgb73+oum6M1wTdy8DYfYrTpaFTlP7cev+MOAos
 kyeL6Eq13c7PwtKIpYMvsJYlLZYlh8gu2FUWblDQa3Ng1tNbBh0jSZZQGnBdzegEvULxEcq7u
 c0la0Zph5YDkQMp/0h0NCc+2rN7rBiMFvYCcw5WwcIb3KegNA3Upn0RYUxCJ/zwbcWup7PHxE
 xIOB3orusnst6VaI+JFBAsA3Ks7kljv0AXSpRWYyJ6JUKE9jMXIyr/o5QCDN7MDLN3KQkwSQa
 6EF2OKILbWXOGfxMgiYdbQefheqOutolj0llTvM7r6pqMHHmOI7DTKvdSRcuoE8CR04K7knZP
 XdfDWv8uuYM0ZAmAR4kg5jOez0yZ00rwbL7QEeMyVQBnQAZpfOMlzgXKNSWusQO4/QpKcvEmn
 5dRCBC4s+r3HluLBSBrvRCR4Hbp9JAX68dim4X+6XlwZTPv95qtUe7yRhl5wLi32pyKwQroQX
 QoJDTBHHe/XBKcv7z7pajYSK2k9b6VwYvRV9efBlEPZDVmik3ZInGRj5IA1M1JRxVyANblVZU
 whrhtyHeR68dVy7SfImFQF4WsLWiahcsOCCbt3jlXsAkb+qbKb72HBUalG8TZNiVbHJjKGvC0
 kyZ2JWup0wlDDaCg6Gtg0BkHw3LAxzl05Bx0JK3pj2GEz4sSPk4X3jqV1gl9EhI8RUie7/7ak
 LSU+6aP8VHZ+Up6UUb4n9RG4490JV7q7/gvsVw==
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
Cc: Charlene Liu <Charlene.Liu@amd.com>, Chris Park <Chris.Park@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Tony Cheng <tony.cheng@amd.com>,
 David Francis <David.Francis@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel@lists.freedesktop.org, Jun Lei <Jun.Lei@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzItYml0IGFyY2hpdGVjdHVyZXMsIGRpdmlkaW5nIGEgNjQtYml0IGludGVnZXIgaW4gdGhl
IGtlcm5lbApsZWFkcyB0byBhIGxpbmsgZXJyb3I6CgpFUlJPUjogIl9fdWRpdmRpMyIgW2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdS5rb10gdW5kZWZpbmVkIQpFUlJPUjogIl9fZGl2
ZGkzIiBbZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1LmtvXSB1bmRlZmluZWQhCgpD
aGFuZ2UgdGhlIHR3byByZWNlbnRseSBpbnRyb2R1Y2VkIGluc3RhbmNlcyB0byBhIG11bHRpcGx5
K3NoaWZ0Cm9wZXJhdGlvbiB0aGF0IGlzIGFsc28gbXVjaCBjaGVhcGVyIG9uIDMyLWJpdCBhcmNo
aXRlY3R1cmVzLgpXZSBjYW4gZG8gdGhhdCBoZXJlLCBzaW5jZSBib3RoIG9mIHRoZW0gYXJlIHJl
YWxseSAzMi1iaXQgbnVtYmVycwp0aGF0IGNoYW5nZSBhIGZldyBwZXJjZW50LgoKRml4ZXM6IGJl
ZGJiZTZhZjRiZSAoImRybS9hbWQvZGlzcGxheTogTW92ZSBsaW5rIGZ1bmN0aW9ucyBmcm9tIGRj
IHRvIGRjX2xpbmsiKQpGaXhlczogZjE4YmM0ZTUzYWQ2ICgiZHJtL2FtZC9kaXNwbGF5OiB1cGRh
dGUgY2FsY3VsYXRlZCBib3VuZGluZyBib3ggbG9naWMgZm9yIE5WIikKU2lnbmVkLW9mZi1ieTog
QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kY19saW5rLmMgICAgICAgICB8IDQgKystLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgfCAyICstCiAyIGZpbGVzIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKaW5kZXggYzE3ZGI1YzE0NGFhLi44ZGJm
NzU5ZWJhNDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX2xpbmsuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rLmMKQEAgLTMwNzIsOCArMzA3Miw4IEBAIHVpbnQzMl90IGRjX2xpbmtfYmFuZHdpZHRoX2ti
cHMoCiAJCSAqIGJ1dCB0aGUgZGlmZmVyZW5jZSBpcyBtaW5pbWFsIGFuZCBpcyBpbiBhIHNhZmUg
ZGlyZWN0aW9uLAogCQkgKiB3aGljaCBhbGwgd29ya3Mgd2VsbCBhcm91bmQgcG90ZW50aWFsIGFt
YmlndWl0eSBvZiBEUCAxLjRhIHNwZWMuCiAJCSAqLwotCQlsb25nIGxvbmcgZmVjX2xpbmtfYndf
a2JwcyA9IGxpbmtfYndfa2JwcyAqIDk3MExMOwotCQlsaW5rX2J3X2ticHMgPSAodWludDMyX3Qp
KGZlY19saW5rX2J3X2ticHMgLyAxMDAwTEwpOworCQlsaW5rX2J3X2ticHMgPSBtdWxfdTY0X3Uz
Ml9zaHIoQklUX1VMTCgzMikgKiA5NzBMTCAvIDEwMDAsCisJCQkJCSAgICAgICBsaW5rX2J3X2ti
cHMsIDMyKTsKIAl9CiAjZW5kaWYKIApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwppbmRleCBiMzUzMjdiYWZiYzUuLjcwYWM4
YTk1ZDJkYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIw
L2RjbjIwX3Jlc291cmNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Rj
bjIwL2RjbjIwX3Jlc291cmNlLmMKQEAgLTI2NTcsNyArMjY1Nyw3IEBAIHN0YXRpYyB2b2lkIHVw
ZGF0ZV9ib3VuZGluZ19ib3goc3RydWN0IGRjICpkYywgc3RydWN0IF92Y3NfZHBpX3NvY19ib3Vu
ZGluZ19ib3hfCiAJCWNhbGN1bGF0ZWRfc3RhdGVzW2ldLmRyYW1fc3BlZWRfbXRzID0gdWNsa19z
dGF0ZXNbaV0gKiAxNiAvIDEwMDA7CiAKIAkJLy8gRkNMSzpVQ0xLIHJhdGlvIGlzIDEuMDgKLQkJ
bWluX2ZjbGtfcmVxdWlyZWRfYnlfdWNsayA9ICgodW5zaWduZWQgbG9uZyBsb25nKXVjbGtfc3Rh
dGVzW2ldKSAqIDEwODAgLyAxMDAwMDAwOworCQltaW5fZmNsa19yZXF1aXJlZF9ieV91Y2xrID0g
bXVsX3U2NF91MzJfc2hyKEJJVF9VTEwoMzIpICogMTA4MCAvIDEwMDAwMDAsIHVjbGtfc3RhdGVz
W2ldLCAzMik7CiAKIAkJY2FsY3VsYXRlZF9zdGF0ZXNbaV0uZmFicmljY2xrX21oeiA9IChtaW5f
ZmNsa19yZXF1aXJlZF9ieV91Y2xrIDwgbWluX2RjZmNsaykgPwogCQkJCW1pbl9kY2ZjbGsgOiBt
aW5fZmNsa19yZXF1aXJlZF9ieV91Y2xrOwotLSAKMi4yMC4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
