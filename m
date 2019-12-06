Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EFC8114D85
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2019 09:24:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054D16EBAB;
	Fri,  6 Dec 2019 08:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF0466E1B7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2019 08:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 57AB63F474;
 Fri,  6 Dec 2019 09:24:40 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IHDq2TaP34MI; Fri,  6 Dec 2019 09:24:39 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 16DE53F382;
 Fri,  6 Dec 2019 09:24:35 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 86C6A362490;
 Fri,  6 Dec 2019 09:24:35 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] mm, drm/ttm: Fix vm page protection handling
Date: Fri,  6 Dec 2019 09:24:26 +0100
Message-Id: <20191206082426.2958-3-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206082426.2958-1-thomas_os@shipmail.org>
References: <20191206082426.2958-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575620675; bh=vA5oKiItYexHVRFCoWyqWGI1NLy1VoQTOtL/JY2WRl8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YNxp0bMDU/Lr7mefqdqa8DtUlgkkzDHvunM29Ji2gxqHnrBZ1Hn5ujRM6AuYsRudo
 O0WK5l8vU/18HpWB/XsKYr1WbuYGEFi+vhZZa6iBOXC4+QmjPPpVk/Uzxn/9xTgmlf
 1zuYLOIDnOcvqr1nP/QIWvXiMz6vc7ckz4y79Leg=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=YNxp0bMD; 
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

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVFRNIGdyYXBo
aWNzIGJ1ZmZlciBvYmplY3RzIG1heSwgdHJhbnNwYXJlbnRseSB0byB1c2VyLXNwYWNlLCAgbW92
ZQpiZXR3ZWVuIElPIGFuZCBzeXN0ZW0gbWVtb3J5LiBXaGVuIHRoYXQgaGFwcGVucywgYWxsIFBU
RXMgcG9pbnRpbmcgdG8gdGhlCm9sZCBsb2NhdGlvbiBhcmUgemFwcGVkIGJlZm9yZSB0aGUgbW92
ZSBhbmQgdGhlbiBmYXVsdGVkIGluIGFnYWluIGlmCm5lZWRlZC4gV2hlbiB0aGF0IGhhcHBlbnMs
IHRoZSBwYWdlIHByb3RlY3Rpb24gY2FjaGluZyBtb2RlLSBhbmQKZW5jcnlwdGlvbiBiaXRzIG1h
eSBjaGFuZ2UgYW5kIGJlIGRpZmZlcmVudCBmcm9tIHRob3NlIG9mCnN0cnVjdCB2bV9hcmVhX3N0
cnVjdDo6dm1fcGFnZV9wcm90LgoKV2Ugd2VyZSB1c2luZyBhbiB1Z2x5IGhhY2sgdG8gc2V0IHRo
ZSBwYWdlIHByb3RlY3Rpb24gY29ycmVjdGx5LgpGaXggdGhhdCBhbmQgaW5zdGVhZCBleHBvcnQg
YW5kIHVzZSB2bWZfaW5zZXJ0X21peGVkX3Byb3QoKSBvciB1c2UKdm1mX2luc2VydF9wZm5fcHJv
dCgpLgpBbHNvIGdldCB0aGUgZGVmYXVsdCBwYWdlIHByb3RlY3Rpb24gZnJvbQpzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3Q6OnZtX3BhZ2VfcHJvdCByYXRoZXIgdGhhbiB1c2luZyB2bV9nZXRfcGFnZV9w
cm90KCkuClRoaXMgd2F5IHdlIGNhdGNoIG1vZGlmaWNhdGlvbnMgZG9uZSBieSB0aGUgdm0gc3lz
dGVtIGZvciBkcml2ZXJzIHRoYXQKd2FudCB3cml0ZS1ub3RpZmljYXRpb24uCgpDYzogQW5kcmV3
IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhv
Y2tvQHN1c2UuY29tPgpDYzogIk1hdHRoZXcgV2lsY294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFk
ZWFkLm9yZz4KQ2M6ICJLaXJpbGwgQS4gU2h1dGVtb3YiIDxraXJpbGwuc2h1dGVtb3ZAbGludXgu
aW50ZWwuY29tPgpDYzogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpDYzog
IkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2
bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVs
bHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+ClJldmlld2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm9fdm0uYyB8IDI4ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIG1tL21lbW9yeS5j
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQsIDIyIGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm9fdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKaW5kZXggZTY0OTVj
YTI2MzBiLi4zNWQwYTBlN2FhY2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X2JvX3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwpAQCAtMTczLDcg
KzE3Myw2IEBAIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9m
YXVsdCAqdm1mLAogCQkJCSAgICBwZ29mZl90IG51bV9wcmVmYXVsdCkKIHsKIAlzdHJ1Y3Qgdm1f
YXJlYV9zdHJ1Y3QgKnZtYSA9IHZtZi0+dm1hOwotCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCBjdm1h
ID0gKnZtYTsKIAlzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvID0gdm1hLT52bV9wcml2YXRl
X2RhdGE7CiAJc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYgPSBiby0+YmRldjsKIAl1bnNpZ25l
ZCBsb25nIHBhZ2Vfb2Zmc2V0OwpAQCAtMjQ0LDcgKzI0Myw3IEBAIHZtX2ZhdWx0X3QgdHRtX2Jv
X3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9mYXVsdCAqdm1mLAogCQlnb3RvIG91dF9pb191
bmxvY2s7CiAJfQogCi0JY3ZtYS52bV9wYWdlX3Byb3QgPSB0dG1faW9fcHJvdChiby0+bWVtLnBs
YWNlbWVudCwgcHJvdCk7CisJcHJvdCA9IHR0bV9pb19wcm90KGJvLT5tZW0ucGxhY2VtZW50LCBw
cm90KTsKIAlpZiAoIWJvLT5tZW0uYnVzLmlzX2lvbWVtKSB7CiAJCXN0cnVjdCB0dG1fb3BlcmF0
aW9uX2N0eCBjdHggPSB7CiAJCQkuaW50ZXJydXB0aWJsZSA9IGZhbHNlLApAQCAtMjYwLDcgKzI1
OSw3IEBAIHZtX2ZhdWx0X3QgdHRtX2JvX3ZtX2ZhdWx0X3Jlc2VydmVkKHN0cnVjdCB2bV9mYXVs
dCAqdm1mLAogCQl9CiAJfSBlbHNlIHsKIAkJLyogSW9tZW0gc2hvdWxkIG5vdCBiZSBtYXJrZWQg
ZW5jcnlwdGVkICovCi0JCWN2bWEudm1fcGFnZV9wcm90ID0gcGdwcm90X2RlY3J5cHRlZChjdm1h
LnZtX3BhZ2VfcHJvdCk7CisJCXByb3QgPSBwZ3Byb3RfZGVjcnlwdGVkKHByb3QpOwogCX0KIAog
CS8qCkBAIC0yODMsMTEgKzI4MiwyNiBAQCB2bV9mYXVsdF90IHR0bV9ib192bV9mYXVsdF9yZXNl
cnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKIAkJCXBmbiA9IHBhZ2VfdG9fcGZuKHBhZ2UpOwog
CQl9CiAKKwkJLyoKKwkJICogTm90ZSB0aGF0IHRoZSB2YWx1ZSBvZiBAcHJvdCBhdCB0aGlzIHBv
aW50IG1heSBkaWZmZXIgZnJvbQorCQkgKiB0aGUgdmFsdWUgb2YgQHZtYS0+dm1fcGFnZV9wcm90
IGluIHRoZSBjYWNoaW5nLSBhbmQKKwkJICogZW5jcnlwdGlvbiBiaXRzLiBUaGlzIGlzIGJlY2F1
c2UgdGhlIGV4YWN0IGxvY2F0aW9uIG9mIHRoZQorCQkgKiBkYXRhIG1heSBub3QgYmUga25vd24g
YXQgbW1hcCgpIHRpbWUgYW5kIG1heSBhbHNvIGNoYW5nZQorCQkgKiBhdCBhcmJpdHJhcnkgdGlt
ZXMgd2hpbGUgdGhlIGRhdGEgaXMgbW1hcCdlZC4KKwkJICogVGhpcyBpcyBvayBhcyBsb25nIGFz
IEB2bWEtPnZtX3BhZ2VfcHJvdCBpcyBub3QgdXNlZCBieQorCQkgKiB0aGUgY29yZSB2bSB0byBz
ZXQgY2FjaGluZy0gYW5kIGVuY3J5cHRpb24gYml0cy4KKwkJICogVGhpcyBpcyBlbnN1cmVkIGJ5
IGNvcmUgdm0gdXNpbmcgcHRlX21vZGlmeSgpIHRvIG1vZGlmeQorCQkgKiBwYWdlIHRhYmxlIGVu
dHJ5IHByb3RlY3Rpb24gYml0cyAodGhhdCBmdW5jdGlvbiBwcmVzZXJ2ZXMKKwkJICogb2xkIGNh
Y2hpbmctIGFuZCBlbmNyeXB0aW9uIGJpdHMpLCBhbmQgdGhlIEBmYXVsdAorCQkgKiBjYWxsYmFj
ayBiZWluZyB0aGUgb25seSBmdW5jdGlvbiB0aGF0IGNyZWF0ZXMgbmV3CisJCSAqIHBhZ2UgdGFi
bGUgZW50cmllcy4KKwkJICovCiAJCWlmICh2bWEtPnZtX2ZsYWdzICYgVk1fTUlYRURNQVApCi0J
CQlyZXQgPSB2bWZfaW5zZXJ0X21peGVkKCZjdm1hLCBhZGRyZXNzLAotCQkJCQlfX3Bmbl90b19w
Zm5fdChwZm4sIFBGTl9ERVYpKTsKKwkJCXJldCA9IHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCh2bWEs
IGFkZHJlc3MsCisJCQkJCQkgICAgX19wZm5fdG9fcGZuX3QocGZuLCBQRk5fREVWKSwKKwkJCQkJ
CSAgICBwcm90KTsKIAkJZWxzZQotCQkJcmV0ID0gdm1mX2luc2VydF9wZm4oJmN2bWEsIGFkZHJl
c3MsIHBmbik7CisJCQlyZXQgPSB2bWZfaW5zZXJ0X3Bmbl9wcm90KHZtYSwgYWRkcmVzcywgcGZu
LCBwcm90KTsKIAogCQkvKiBOZXZlciBlcnJvciBvbiBwcmVmYXVsdGVkIFBURXMgKi8KIAkJaWYg
KHVubGlrZWx5KChyZXQgJiBWTV9GQVVMVF9FUlJPUikpKSB7CkBAIC0zMTksNyArMzMzLDcgQEAg
dm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiAJaWYgKHJl
dCkKIAkJcmV0dXJuIHJldDsKIAotCXByb3QgPSB2bV9nZXRfcGFnZV9wcm90KHZtYS0+dm1fZmxh
Z3MpOworCXByb3QgPSB2bWEtPnZtX3BhZ2VfcHJvdDsKIAlyZXQgPSB0dG1fYm9fdm1fZmF1bHRf
cmVzZXJ2ZWQodm1mLCBwcm90LCBUVE1fQk9fVk1fTlVNX1BSRUZBVUxUKTsKIAlpZiAocmV0ID09
IFZNX0ZBVUxUX1JFVFJZICYmICEodm1mLT5mbGFncyAmIEZBVUxUX0ZMQUdfUkVUUllfTk9XQUlU
KSkKIAkJcmV0dXJuIHJldDsKZGlmZiAtLWdpdCBhL21tL21lbW9yeS5jIGIvbW0vbWVtb3J5LmMK
aW5kZXggYjllN2YxZDU2YjFjLi40YzI2YzI3YWZiMGEgMTAwNjQ0Ci0tLSBhL21tL21lbW9yeS5j
CisrKyBiL21tL21lbW9yeS5jCkBAIC0xNzY5LDYgKzE3NjksNyBAQCB2bV9mYXVsdF90IHZtZl9p
bnNlcnRfbWl4ZWRfcHJvdChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgdW5zaWduZWQgbG9u
ZyBhZGRyLAogewogCXJldHVybiBfX3ZtX2luc2VydF9taXhlZCh2bWEsIGFkZHIsIHBmbiwgcGdw
cm90LCBmYWxzZSk7CiB9CitFWFBPUlRfU1lNQk9MKHZtZl9pbnNlcnRfbWl4ZWRfcHJvdCk7CiAK
IHZtX2ZhdWx0X3Qgdm1mX2luc2VydF9taXhlZChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwg
dW5zaWduZWQgbG9uZyBhZGRyLAogCQlwZm5fdCBwZm4pCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
