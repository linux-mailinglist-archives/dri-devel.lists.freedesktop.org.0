Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 462BC51928
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2019 18:54:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7653B89D4B;
	Mon, 24 Jun 2019 16:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9A50A89CE1;
 Mon, 24 Jun 2019 16:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id F2D342A604B;
 Mon, 24 Jun 2019 18:54:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id mEliXgsGuDUD; Mon, 24 Jun 2019 18:54:09 +0200 (CEST)
Received: from thor (116.245.63.188.dynamic.wline.res.cust.swisscom.ch
 [188.63.245.116])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id 908362A6050;
 Mon, 24 Jun 2019 18:54:07 +0200 (CEST)
Received: from daenzer by thor with local (Exim 4.92)
 (envelope-from <michel@daenzer.net>)
 id 1hfSEI-0003Zc-JA; Mon, 24 Jun 2019 18:54:06 +0200
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH libdrm 2/9] amdgpu: Add BO handle to table in amdgpu_bo_create
Date: Mon, 24 Jun 2019 18:53:59 +0200
Message-Id: <20190624165406.13682-3-michel@daenzer.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624165406.13682-1-michel@daenzer.net>
References: <20190624165406.13682-1-michel@daenzer.net>
MIME-Version: 1.0
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
Cc: Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWljaGVsIETDpG56ZXIgPG1pY2hlbC5kYWVuemVyQGFtZC5jb20+CgpTaW1wbGlmaWVz
IGl0cyBjYWxsZXJzLgoKZGV2LT5ib190YWJsZV9tdXRleCBpcyBub3cgYWx3YXlzIGhlbGQgd2hl
biBhbWRncHVfYm9fY3JlYXRlIGlzIGNhbGxlZAoodGhpcyB3YXMgYWxyZWFkeSB0aGUgY2FzZSBp
biBhbWRncHVfYm9faW1wb3J0KS4KClNpZ25lZC1vZmYtYnk6IE1pY2hlbCBEw6RuemVyIDxtaWNo
ZWwuZGFlbnplckBhbWQuY29tPgotLS0KIGFtZGdwdS9hbWRncHVfYm8uYyB8IDMyICsrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvYW1kZ3B1L2FtZGdwdV9iby5jIGIvYW1k
Z3B1L2FtZGdwdV9iby5jCmluZGV4IDZjMGI4NTE3Li41YmRiOGZlOCAxMDA2NDQKLS0tIGEvYW1k
Z3B1L2FtZGdwdV9iby5jCisrKyBiL2FtZGdwdS9hbWRncHVfYm8uYwpAQCAtNTMsMTEgKzUzLDE4
IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2JvX2NyZWF0ZShhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYs
CiAJCQkgICAgYW1kZ3B1X2JvX2hhbmRsZSAqYnVmX2hhbmRsZSkKIHsKIAlzdHJ1Y3QgYW1kZ3B1
X2JvICpibzsKKwlpbnQgcjsKIAogCWJvID0gY2FsbG9jKDEsIHNpemVvZihzdHJ1Y3QgYW1kZ3B1
X2JvKSk7CiAJaWYgKCFibykKIAkJcmV0dXJuIC1FTk9NRU07CiAKKwlyID0gaGFuZGxlX3RhYmxl
X2luc2VydCgmZGV2LT5ib19oYW5kbGVzLCBoYW5kbGUsIGJvKTsKKwlpZiAocikgeworCQlmcmVl
KGJvKTsKKwkJcmV0dXJuIHI7CisJfQorCiAJYXRvbWljX3NldCgmYm8tPnJlZmNvdW50LCAxKTsK
IAliby0+ZGV2ID0gZGV2OwogCWJvLT5hbGxvY19zaXplID0gc2l6ZTsKQEAgLTg5LDE5ICs5Niwx
NCBAQCBkcm1fcHVibGljIGludCBhbWRncHVfYm9fYWxsb2MoYW1kZ3B1X2RldmljZV9oYW5kbGUg
ZGV2LAogCWlmIChyKQogCQlnb3RvIG91dDsKIAorCXB0aHJlYWRfbXV0ZXhfbG9jaygmZGV2LT5i
b190YWJsZV9tdXRleCk7CiAJciA9IGFtZGdwdV9ib19jcmVhdGUoZGV2LCBhbGxvY19idWZmZXIt
PmFsbG9jX3NpemUsIGFyZ3Mub3V0LmhhbmRsZSwKIAkJCSAgICAgYnVmX2hhbmRsZSk7CisJcHRo
cmVhZF9tdXRleF91bmxvY2soJmRldi0+Ym9fdGFibGVfbXV0ZXgpOwogCWlmIChyKSB7CiAJCWFt
ZGdwdV9jbG9zZV9rbXNfaGFuZGxlKGRldi0+ZmQsIGFyZ3Mub3V0LmhhbmRsZSk7Ci0JCWdvdG8g
b3V0OwogCX0KIAotCXB0aHJlYWRfbXV0ZXhfbG9jaygmZGV2LT5ib190YWJsZV9tdXRleCk7Ci0J
ciA9IGhhbmRsZV90YWJsZV9pbnNlcnQoJmRldi0+Ym9faGFuZGxlcywgKCpidWZfaGFuZGxlKS0+
aGFuZGxlLAotCQkJCSpidWZfaGFuZGxlKTsKLQlwdGhyZWFkX211dGV4X3VubG9jaygmZGV2LT5i
b190YWJsZV9tdXRleCk7Ci0JaWYgKHIpCi0JCWFtZGdwdV9ib19mcmVlKCpidWZfaGFuZGxlKTsK
IG91dDoKIAlyZXR1cm4gcjsKIH0KQEAgLTM2MywxNSArMzY1LDEyIEBAIGRybV9wdWJsaWMgaW50
IGFtZGdwdV9ib19pbXBvcnQoYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LAogCWlmIChyKQogCQln
b3RvIGZyZWVfYm9faGFuZGxlOwogCi0JciA9IGhhbmRsZV90YWJsZV9pbnNlcnQoJmRldi0+Ym9f
aGFuZGxlcywgYm8tPmhhbmRsZSwgYm8pOwotCWlmIChyKQotCQlnb3RvIGZyZWVfYm9faGFuZGxl
OwogCWlmIChmbGlua19uYW1lKSB7CiAJCWJvLT5mbGlua19uYW1lID0gZmxpbmtfbmFtZTsKIAkJ
ciA9IGhhbmRsZV90YWJsZV9pbnNlcnQoJmRldi0+Ym9fZmxpbmtfbmFtZXMsIGZsaW5rX25hbWUs
CiAJCQkJCWJvKTsKIAkJaWYgKHIpCi0JCQlnb3RvIHJlbW92ZV9oYW5kbGU7CisJCQlnb3RvIGZy
ZWVfYm9faGFuZGxlOwogCiAJfQogCkBAIC0zODAsOCArMzc5LDYgQEAgZHJtX3B1YmxpYyBpbnQg
YW1kZ3B1X2JvX2ltcG9ydChhbWRncHVfZGV2aWNlX2hhbmRsZSBkZXYsCiAJcHRocmVhZF9tdXRl
eF91bmxvY2soJmRldi0+Ym9fdGFibGVfbXV0ZXgpOwogCXJldHVybiAwOwogCi1yZW1vdmVfaGFu
ZGxlOgotCWhhbmRsZV90YWJsZV9yZW1vdmUoJmRldi0+Ym9faGFuZGxlcywgYm8tPmhhbmRsZSk7
CiBmcmVlX2JvX2hhbmRsZToKIAlpZiAoZmxpbmtfbmFtZSAmJiBvcGVuX2FyZy5oYW5kbGUpCiAJ
CWFtZGdwdV9jbG9zZV9rbXNfaGFuZGxlKGRldi0+ZmxpbmtfZmQsIG9wZW5fYXJnLmhhbmRsZSk7
CkBAIC01OTcsMTggKzU5NCwxMyBAQCBkcm1fcHVibGljIGludCBhbWRncHVfY3JlYXRlX2JvX2Zy
b21fdXNlcl9tZW0oYW1kZ3B1X2RldmljZV9oYW5kbGUgZGV2LAogCWlmIChyKQogCQlnb3RvIG91
dDsKIAorCXB0aHJlYWRfbXV0ZXhfbG9jaygmZGV2LT5ib190YWJsZV9tdXRleCk7CiAJciA9IGFt
ZGdwdV9ib19jcmVhdGUoZGV2LCBzaXplLCBhcmdzLmhhbmRsZSwgYnVmX2hhbmRsZSk7CisJcHRo
cmVhZF9tdXRleF91bmxvY2soJmRldi0+Ym9fdGFibGVfbXV0ZXgpOwogCWlmIChyKSB7CiAJCWFt
ZGdwdV9jbG9zZV9rbXNfaGFuZGxlKGRldi0+ZmQsIGFyZ3MuaGFuZGxlKTsKLQkJZ290byBvdXQ7
CiAJfQogCi0JcHRocmVhZF9tdXRleF9sb2NrKCZkZXYtPmJvX3RhYmxlX211dGV4KTsKLQlyID0g
aGFuZGxlX3RhYmxlX2luc2VydCgmZGV2LT5ib19oYW5kbGVzLCAoKmJ1Zl9oYW5kbGUpLT5oYW5k
bGUsCi0JCQkJKmJ1Zl9oYW5kbGUpOwotCXB0aHJlYWRfbXV0ZXhfdW5sb2NrKCZkZXYtPmJvX3Rh
YmxlX211dGV4KTsKLQlpZiAocikKLQkJYW1kZ3B1X2JvX2ZyZWUoKmJ1Zl9oYW5kbGUpOwogb3V0
OgogCXJldHVybiByOwogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
