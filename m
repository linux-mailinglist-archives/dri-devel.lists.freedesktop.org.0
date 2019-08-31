Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F01EAA4FC7
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 09:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09D7788422;
	Mon,  2 Sep 2019 07:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp07.smtpout.orange.fr
 [80.12.242.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D596E0E5
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Aug 2019 10:00:35 +0000 (UTC)
Received: from localhost.localdomain ([90.126.97.183]) by mwinf5d13 with ME
 id vm0V2000c3xPcdm03m0WGA; Sat, 31 Aug 2019 12:00:33 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 31 Aug 2019 12:00:33 +0200
X-ME-IP: 90.126.97.183
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: b.zolnierkie@samsung.com,
	lkundrak@v3.sk,
	yuehaibing@huawei.com
Subject: [PATCH] pxa168fb: Fix the function used to release some memory in an
 error handling path
Date: Sat, 31 Aug 2019 12:00:24 +0200
Message-Id: <20190831100024.3248-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 07:24:25 +0000
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdGhlIHByb2JlIGZ1bmN0aW9uLCBzb21lIHJlc291cmNlcyBhcmUgYWxsb2NhdGVkIHVzaW5n
ICdkbWFfYWxsb2Nfd2MoKScsCnRoZXkgc2hvdWxkIGJlIHJlbGVhc2VkIHdpdGggJ2RtYV9mcmVl
X3djKCknLCBub3QgJ2RtYV9mcmVlX2NvaGVyZW50KCknLgoKV2UgYWxyZWFkeSB1c2UgJ2RtYV9m
cmVlX3djKCknIGluIHRoZSByZW1vdmUgZnVuY3Rpb24sIGJ1dCBub3QgaW4gdGhlCmVycm9yIGhh
bmRsaW5nIHBhdGggb2YgdGhlIHByb2JlIGZ1bmN0aW9uLgoKQWxzbywgcmVtb3ZlIGEgdXNlbGVz
cyAnUEFHRV9BTElHTigpJy4gJ2luZm8tPmZpeC5zbWVtX2xlbicgaXMgYWxyZWFkeQpQQUdFX0FM
SUdOZWQuCgpGaXhlczogNjM4NzcyYzc1NTNmICgiZmI6IGFkZCBzdXBwb3J0IG9mIExDRCBkaXNw
bGF5IGNvbnRyb2xsZXIgb24gcHhhMTY4LzkxMCAoYmFzZSBsYXllcikiKQpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGhlIEpBSUxMRVQgPGNocmlzdG9waGUuamFpbGxldEB3YW5hZG9vLmZyPgotLS0K
VGhlIGNoYW5nZSBhYm91dCBQQUdFX0FMSUdOIHNob3VsZCBwcm9iYWJseSBiZSBwYXJ0IG9mIGEg
c2VwYXJhdGUgY29tbWl0LgpIb3dldmVyLCBnaXQgaGlzdG9yeSBmb3IgdGhpcyBkcml2ZXIgaXMg
cmVhbGx5IHF1aWV0LiBJZiB5b3UgdGhpbmsgaXQKUkVBTExZIGRlc2VydmVzIGEgc2VwYXJhdGUg
cGF0Y2gsIGVpdGhlciBzcGxpdCBpdCBieSB5b3Vyc2VsZiBvciBheGUgdGhpcwpwYXJ0IG9mIHRo
ZSBwYXRjaC4gSSB3b24ndCBib3RoZXIgcmVzdWJtaXR0aW5nIGZvciB0aGlzIGxvbmVseSBjbGVh
bnVwLgpIb3BpbmcgZm9yIHlvdXIgdW5kZXJzdGFuZGluZy4KLS0tCiBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L3B4YTE2OGZiLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YTE2
OGZiLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YTE2OGZiLmMKaW5kZXggMTQxMGY0NzZlMTM1
Li4xZmM1MGZjMDY5NGIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvcHhhMTY4ZmIu
YworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3B4YTE2OGZiLmMKQEAgLTc2Niw4ICs3NjYsOCBA
QCBzdGF0aWMgaW50IHB4YTE2OGZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiBmYWlsZWRfZnJlZV9jbGs6CiAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGZiaS0+Y2xrKTsKIGZh
aWxlZF9mcmVlX2ZibWVtOgotCWRtYV9mcmVlX2NvaGVyZW50KGZiaS0+ZGV2LCBpbmZvLT5maXgu
c21lbV9sZW4sCi0JCQlpbmZvLT5zY3JlZW5fYmFzZSwgZmJpLT5mYl9zdGFydF9kbWEpOworCWRt
YV9mcmVlX3djKGZiaS0+ZGV2LCBpbmZvLT5maXguc21lbV9sZW4sCisJCSAgICBpbmZvLT5zY3Jl
ZW5fYmFzZSwgZmJpLT5mYl9zdGFydF9kbWEpOwogZmFpbGVkX2ZyZWVfaW5mbzoKIAlrZnJlZShp
bmZvKTsKIApAQCAtODAxLDcgKzgwMSw3IEBAIHN0YXRpYyBpbnQgcHhhMTY4ZmJfcmVtb3ZlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAKIAlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBk
ZXYsIDApOwogCi0JZG1hX2ZyZWVfd2MoZmJpLT5kZXYsIFBBR0VfQUxJR04oaW5mby0+Zml4LnNt
ZW1fbGVuKSwKKwlkbWFfZnJlZV93YyhmYmktPmRldiwgaW5mby0+Zml4LnNtZW1fbGVuLAogCQkg
ICAgaW5mby0+c2NyZWVuX2Jhc2UsIGluZm8tPmZpeC5zbWVtX3N0YXJ0KTsKIAogCWNsa19kaXNh
YmxlX3VucHJlcGFyZShmYmktPmNsayk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
