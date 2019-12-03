Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C88D10FC04
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 11:49:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 361926E03F;
	Tue,  3 Dec 2019 10:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AAA46E03F
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 10:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 27DD63FE39;
 Tue,  3 Dec 2019 11:49:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gTqlOwftKrLs; Tue,  3 Dec 2019 11:49:07 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 0D0CC3FE37;
 Tue,  3 Dec 2019 11:49:05 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 47F3636034F;
 Tue,  3 Dec 2019 11:49:05 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] mm: Add and export vmf_insert_mixed_prot()
Date: Tue,  3 Dec 2019 11:48:52 +0100
Message-Id: <20191203104853.4378-2-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191203104853.4378-1-thomas_os@shipmail.org>
References: <20191203104853.4378-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575370145; bh=AFXw/uH1wuScMRXIYhAKW/HRfzazdRemAk3cLSieV/k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=onio2ntofvbf7V1zW/Jze0Ov8sW+GTZKwHTYJEzYwp+Iz7MHP2bKQUXAdOLkzvzF9
 Xz6/9tX6vRLtU/7RX8xO3fvCbRAsPX3Q54iQ9QDd/thxymet8Tc+Lh93aR7FIx+uRv
 Ghs2xzrJSrENP6/rgfs12l7OZClgeGuPheDOpKMA=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=onio2nto; 
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

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIFRUTSBt
b2R1bGUgdG9kYXkgdXNlcyBhIGhhY2sgdG8gYmUgYWJsZSB0byBzZXQgYSBkaWZmZXJlbnQgcGFn
ZQpwcm90ZWN0aW9uIHRoYW4gc3RydWN0IHZtX2FyZWFfc3RydWN0Ojp2bV9wYWdlX3Byb3QuIFRv
IGJlIGFibGUgdG8gZG8KdGhpcyBwcm9wZXJseSwgYWRkIGFuZCBleHBvcnQgdm1mX2luc2VydF9t
aXhlZF9wcm90KCkuCgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9y
Zz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1c2UuY29tPgpDYzogIk1hdHRoZXcgV2lsY294
IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9yZz4KQ2M6ICJLaXJpbGwgQS4gU2h1dGVtb3Yi
IDxraXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwuY29tPgpDYzogUmFscGggQ2FtcGJlbGwgPHJj
YW1wYmVsbEBudmlkaWEuY29tPgpDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0
LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+CkFj
a2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQog
aW5jbHVkZS9saW51eC9tbS5oIHwgIDIgKysKIG1tL21lbW9yeS5jICAgICAgICB8IDE1ICsrKysr
KysrKysrLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0u
aAppbmRleCBjYzI5MjI3M2U2YmEuLjI5NTc1ZDNjMWU0NyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9s
aW51eC9tbS5oCisrKyBiL2luY2x1ZGUvbGludXgvbW0uaApAQCAtMjU0OCw2ICsyNTQ4LDggQEAg
dm1fZmF1bHRfdCB2bWZfaW5zZXJ0X3Bmbl9wcm90KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
LCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJCQl1bnNpZ25lZCBsb25nIHBmbiwgcGdwcm90X3QgcGdw
cm90KTsKIHZtX2ZhdWx0X3Qgdm1mX2luc2VydF9taXhlZChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQkJcGZuX3QgcGZuKTsKK3ZtX2ZhdWx0X3Qgdm1m
X2luc2VydF9taXhlZF9wcm90KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBs
b25nIGFkZHIsCisJCQlwZm5fdCBwZm4sIHBncHJvdF90IHBncHJvdCk7CiB2bV9mYXVsdF90IHZt
Zl9pbnNlcnRfbWl4ZWRfbWt3cml0ZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAkJdW5z
aWduZWQgbG9uZyBhZGRyLCBwZm5fdCBwZm4pOwogaW50IHZtX2lvbWFwX21lbW9yeShzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwgcGh5c19hZGRyX3Qgc3RhcnQsIHVuc2lnbmVkIGxvbmcgbGVu
KTsKZGlmZiAtLWdpdCBhL21tL21lbW9yeS5jIGIvbW0vbWVtb3J5LmMKaW5kZXggYjFjYTUxYTA3
OWYyLi40YzI2YzI3YWZiMGEgMTAwNjQ0Ci0tLSBhL21tL21lbW9yeS5jCisrKyBiL21tL21lbW9y
eS5jCkBAIC0xNzE5LDkgKzE3MTksOSBAQCBzdGF0aWMgYm9vbCB2bV9taXhlZF9vayhzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwgcGZuX3QgcGZuKQogfQogCiBzdGF0aWMgdm1fZmF1bHRfdCBf
X3ZtX2luc2VydF9taXhlZChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKLQkJdW5zaWduZWQg
bG9uZyBhZGRyLCBwZm5fdCBwZm4sIGJvb2wgbWt3cml0ZSkKKwkJdW5zaWduZWQgbG9uZyBhZGRy
LCBwZm5fdCBwZm4sIHBncHJvdF90IHBncHJvdCwKKwkJYm9vbCBta3dyaXRlKQogewotCXBncHJv
dF90IHBncHJvdCA9IHZtYS0+dm1fcGFnZV9wcm90OwogCWludCBlcnI7CiAKIAlCVUdfT04oIXZt
X21peGVkX29rKHZtYSwgcGZuKSk7CkBAIC0xNzY0LDEwICsxNzY0LDE3IEBAIHN0YXRpYyB2bV9m
YXVsdF90IF9fdm1faW5zZXJ0X21peGVkKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCXJl
dHVybiBWTV9GQVVMVF9OT1BBR0U7CiB9CiAKK3ZtX2ZhdWx0X3Qgdm1mX2luc2VydF9taXhlZF9w
cm90KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIsCisJCQkJ
IHBmbl90IHBmbiwgcGdwcm90X3QgcGdwcm90KQoreworCXJldHVybiBfX3ZtX2luc2VydF9taXhl
ZCh2bWEsIGFkZHIsIHBmbiwgcGdwcm90LCBmYWxzZSk7Cit9CitFWFBPUlRfU1lNQk9MKHZtZl9p
bnNlcnRfbWl4ZWRfcHJvdCk7CisKIHZtX2ZhdWx0X3Qgdm1mX2luc2VydF9taXhlZChzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQlwZm5fdCBwZm4pCiB7
Ci0JcmV0dXJuIF9fdm1faW5zZXJ0X21peGVkKHZtYSwgYWRkciwgcGZuLCBmYWxzZSk7CisJcmV0
dXJuIF9fdm1faW5zZXJ0X21peGVkKHZtYSwgYWRkciwgcGZuLCB2bWEtPnZtX3BhZ2VfcHJvdCwg
ZmFsc2UpOwogfQogRVhQT1JUX1NZTUJPTCh2bWZfaW5zZXJ0X21peGVkKTsKIApAQCAtMTc3OSw3
ICsxNzg2LDcgQEAgRVhQT1JUX1NZTUJPTCh2bWZfaW5zZXJ0X21peGVkKTsKIHZtX2ZhdWx0X3Qg
dm1mX2luc2VydF9taXhlZF9ta3dyaXRlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCQl1
bnNpZ25lZCBsb25nIGFkZHIsIHBmbl90IHBmbikKIHsKLQlyZXR1cm4gX192bV9pbnNlcnRfbWl4
ZWQodm1hLCBhZGRyLCBwZm4sIHRydWUpOworCXJldHVybiBfX3ZtX2luc2VydF9taXhlZCh2bWEs
IGFkZHIsIHBmbiwgdm1hLT52bV9wYWdlX3Byb3QsIHRydWUpOwogfQogRVhQT1JUX1NZTUJPTCh2
bWZfaW5zZXJ0X21peGVkX21rd3JpdGUpOwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
