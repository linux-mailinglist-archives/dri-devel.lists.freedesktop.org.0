Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F15510FE9F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:23:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E356E51D;
	Tue,  3 Dec 2019 13:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 798B26E51C
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 13C553F3BB;
 Tue,  3 Dec 2019 14:23:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nI47Hg1oegk5; Tue,  3 Dec 2019 14:22:52 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id E98B03F387;
 Tue,  3 Dec 2019 14:22:49 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 72D06362530;
 Tue,  3 Dec 2019 14:22:49 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/8] mm: Add vmf_insert_pfn_xxx_prot() for huge page-table
 entries
Date: Tue,  3 Dec 2019 14:22:34 +0100
Message-Id: <20191203132239.5910-4-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191203132239.5910-1-thomas_os@shipmail.org>
References: <20191203132239.5910-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575379369; bh=nW8buLNAfHYB2D7ORGSziu6wMzvhJOag52VEHcMvQ5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S8r3MakWtsAry23pkBSqlA08b3lbNn/1uBuFtigrbxY6goplLTpR52K8tr46G6lCx
 fJSBODOqA5Zs9pFW5t8dkPu7IDd8mBwqG7+cGMgxt96Xz4cgZI+W3l1MyQH2C366ZG
 JFeg2kOWCjE4nZwcVEv8bHXLH67txTZRApsXIC0Y=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="S8r3MakW";
 dkim-atps=neutral
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKRm9yIGdyYXBo
aWNzIGRyaXZlcnMgbmVlZGluZyB0byBtb2RpZnkgdGhlIHBhZ2UtcHJvdGVjdGlvbiwgYWRkCmh1
Z2UgcGFnZS10YWJsZSBlbnRyaWVzIGNvdW50ZXJwYXJ0cyB0byB2bWZfaW5zZXJ0X3Bybl9wcm90
KCkuCgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1p
Y2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpDYzogIk1hdHRoZXcgV2lsY294IChPcmFjbGUp
IiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6ICJLaXJpbGwgQS4gU2h1dGVtb3YiIDxraXJpbGwu
c2h1dGVtb3ZAbGludXguaW50ZWwuY29tPgpDYzogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBu
dmlkaWEuY29tPgpDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6
ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Ci0tLQogaW5jbHVk
ZS9saW51eC9odWdlX21tLmggfCAxNyArKysrKysrKysrKysrKystLQogbW0vaHVnZV9tZW1vcnku
YyAgICAgICAgfCAxMiArKysrKystLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9u
cygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2h1Z2VfbW0u
aCBiL2luY2x1ZGUvbGludXgvaHVnZV9tbS5oCmluZGV4IDBiODRlMTNlODhlMi4uYjcyMWQ0MmQw
YWRjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2h1Z2VfbW0uaAorKysgYi9pbmNsdWRlL2xp
bnV4L2h1Z2VfbW0uaApAQCAtNDcsOCArNDcsMjEgQEAgZXh0ZXJuIGJvb2wgbW92ZV9odWdlX3Bt
ZChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBvbGRfYWRkciwKIGV4
dGVybiBpbnQgY2hhbmdlX2h1Z2VfcG1kKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBwbWRf
dCAqcG1kLAogCQkJdW5zaWduZWQgbG9uZyBhZGRyLCBwZ3Byb3RfdCBuZXdwcm90LAogCQkJaW50
IHByb3RfbnVtYSk7Ci12bV9mYXVsdF90IHZtZl9pbnNlcnRfcGZuX3BtZChzdHJ1Y3Qgdm1fZmF1
bHQgKnZtZiwgcGZuX3QgcGZuLCBib29sIHdyaXRlKTsKLXZtX2ZhdWx0X3Qgdm1mX2luc2VydF9w
Zm5fcHVkKHN0cnVjdCB2bV9mYXVsdCAqdm1mLCBwZm5fdCBwZm4sIGJvb2wgd3JpdGUpOwordm1f
ZmF1bHRfdCB2bWZfaW5zZXJ0X3Bmbl9wbWRfcHJvdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwgcGZu
X3QgcGZuLAorCQkJCSAgIHBncHJvdF90IHBncHJvdCwgYm9vbCB3cml0ZSk7CitzdGF0aWMgaW5s
aW5lIHZtX2ZhdWx0X3Qgdm1mX2luc2VydF9wZm5fcG1kKHN0cnVjdCB2bV9mYXVsdCAqdm1mLCBw
Zm5fdCBwZm4sCisJCQkJCSAgICBib29sIHdyaXRlKQoreworCXJldHVybiB2bWZfaW5zZXJ0X3Bm
bl9wbWRfcHJvdCh2bWYsIHBmbiwgdm1mLT52bWEtPnZtX3BhZ2VfcHJvdCwgd3JpdGUpOworfQor
dm1fZmF1bHRfdCB2bWZfaW5zZXJ0X3Bmbl9wdWRfcHJvdChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwg
cGZuX3QgcGZuLAorCQkJCSAgIHBncHJvdF90IHBncHJvdCwgYm9vbCB3cml0ZSk7CitzdGF0aWMg
aW5saW5lIHZtX2ZhdWx0X3Qgdm1mX2luc2VydF9wZm5fcHVkKHN0cnVjdCB2bV9mYXVsdCAqdm1m
LCBwZm5fdCBwZm4sCisJCQkJCSAgICBib29sIHdyaXRlKQoreworCXJldHVybiB2bWZfaW5zZXJ0
X3Bmbl9wdWRfcHJvdCh2bWYsIHBmbiwgdm1mLT52bWEtPnZtX3BhZ2VfcHJvdCwgd3JpdGUpOwor
fQorCiBlbnVtIHRyYW5zcGFyZW50X2h1Z2VwYWdlX2ZsYWcgewogCVRSQU5TUEFSRU5UX0hVR0VQ
QUdFX0ZMQUcsCiAJVFJBTlNQQVJFTlRfSFVHRVBBR0VfUkVRX01BRFZfRkxBRywKZGlmZiAtLWdp
dCBhL21tL2h1Z2VfbWVtb3J5LmMgYi9tbS9odWdlX21lbW9yeS5jCmluZGV4IGY4ZDI0ZmMzZjRk
Zi4uYjQ3MjMxMzcwOWVkIDEwMDY0NAotLS0gYS9tbS9odWdlX21lbW9yeS5jCisrKyBiL21tL2h1
Z2VfbWVtb3J5LmMKQEAgLTgxMSwxMSArODExLDExIEBAIHN0YXRpYyB2b2lkIGluc2VydF9wZm5f
cG1kKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJCXB0
ZV9mcmVlKG1tLCBwZ3RhYmxlKTsKIH0KIAotdm1fZmF1bHRfdCB2bWZfaW5zZXJ0X3Bmbl9wbWQo
c3RydWN0IHZtX2ZhdWx0ICp2bWYsIHBmbl90IHBmbiwgYm9vbCB3cml0ZSkKK3ZtX2ZhdWx0X3Qg
dm1mX2luc2VydF9wZm5fcG1kX3Byb3Qoc3RydWN0IHZtX2ZhdWx0ICp2bWYsIHBmbl90IHBmbiwK
KwkJCQkgICBwZ3Byb3RfdCBwZ3Byb3QsIGJvb2wgd3JpdGUpCiB7CiAJdW5zaWduZWQgbG9uZyBh
ZGRyID0gdm1mLT5hZGRyZXNzICYgUE1EX01BU0s7CiAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEgPSB2bWYtPnZtYTsKLQlwZ3Byb3RfdCBwZ3Byb3QgPSB2bWEtPnZtX3BhZ2VfcHJvdDsKIAlw
Z3RhYmxlX3QgcGd0YWJsZSA9IE5VTEw7CiAKIAkvKgpAQCAtODQzLDcgKzg0Myw3IEBAIHZtX2Zh
dWx0X3Qgdm1mX2luc2VydF9wZm5fcG1kKHN0cnVjdCB2bV9mYXVsdCAqdm1mLCBwZm5fdCBwZm4s
IGJvb2wgd3JpdGUpCiAJaW5zZXJ0X3Bmbl9wbWQodm1hLCBhZGRyLCB2bWYtPnBtZCwgcGZuLCBw
Z3Byb3QsIHdyaXRlLCBwZ3RhYmxlKTsKIAlyZXR1cm4gVk1fRkFVTFRfTk9QQUdFOwogfQotRVhQ
T1JUX1NZTUJPTF9HUEwodm1mX2luc2VydF9wZm5fcG1kKTsKK0VYUE9SVF9TWU1CT0xfR1BMKHZt
Zl9pbnNlcnRfcGZuX3BtZF9wcm90KTsKIAogI2lmZGVmIENPTkZJR19IQVZFX0FSQ0hfVFJBTlNQ
QVJFTlRfSFVHRVBBR0VfUFVECiBzdGF0aWMgcHVkX3QgbWF5YmVfcHVkX21rd3JpdGUocHVkX3Qg
cHVkLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKQEAgLTg4OSwxMSArODg5LDExIEBAIHN0
YXRpYyB2b2lkIGluc2VydF9wZm5fcHVkKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNp
Z25lZCBsb25nIGFkZHIsCiAJc3Bpbl91bmxvY2socHRsKTsKIH0KIAotdm1fZmF1bHRfdCB2bWZf
aW5zZXJ0X3Bmbl9wdWQoc3RydWN0IHZtX2ZhdWx0ICp2bWYsIHBmbl90IHBmbiwgYm9vbCB3cml0
ZSkKK3ZtX2ZhdWx0X3Qgdm1mX2luc2VydF9wZm5fcHVkX3Byb3Qoc3RydWN0IHZtX2ZhdWx0ICp2
bWYsIHBmbl90IHBmbiwKKwkJCQkgICBwZ3Byb3RfdCBwZ3Byb3QsIGJvb2wgd3JpdGUpCiB7CiAJ
dW5zaWduZWQgbG9uZyBhZGRyID0gdm1mLT5hZGRyZXNzICYgUFVEX01BU0s7CiAJc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEgPSB2bWYtPnZtYTsKLQlwZ3Byb3RfdCBwZ3Byb3QgPSB2bWEtPnZt
X3BhZ2VfcHJvdDsKIAogCS8qCiAJICogSWYgd2UgaGFkIHB1ZF9zcGVjaWFsLCB3ZSBjb3VsZCBh
dm9pZCBhbGwgdGhlc2UgcmVzdHJpY3Rpb25zLApAQCAtOTE0LDcgKzkxNCw3IEBAIHZtX2ZhdWx0
X3Qgdm1mX2luc2VydF9wZm5fcHVkKHN0cnVjdCB2bV9mYXVsdCAqdm1mLCBwZm5fdCBwZm4sIGJv
b2wgd3JpdGUpCiAJaW5zZXJ0X3Bmbl9wdWQodm1hLCBhZGRyLCB2bWYtPnB1ZCwgcGZuLCBwZ3By
b3QsIHdyaXRlKTsKIAlyZXR1cm4gVk1fRkFVTFRfTk9QQUdFOwogfQotRVhQT1JUX1NZTUJPTF9H
UEwodm1mX2luc2VydF9wZm5fcHVkKTsKK0VYUE9SVF9TWU1CT0xfR1BMKHZtZl9pbnNlcnRfcGZu
X3B1ZF9wcm90KTsKICNlbmRpZiAvKiBDT05GSUdfSEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQ
QUdFX1BVRCAqLwogCiBzdGF0aWMgdm9pZCB0b3VjaF9wbWQoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEsIHVuc2lnbmVkIGxvbmcgYWRkciwKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
