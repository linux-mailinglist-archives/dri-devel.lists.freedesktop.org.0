Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CDA191A99
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 21:11:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915376E091;
	Tue, 24 Mar 2020 20:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F20F56E081
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 20:11:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 7A5613FA16;
 Tue, 24 Mar 2020 21:11:44 +0100 (CET)
Authentication-Results: ste-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=SC907IVp; 
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-ftg-msa2.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8GgI8r0Fkpjd; Tue, 24 Mar 2020 21:11:43 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id ACF303F5ED;
 Tue, 24 Mar 2020 21:11:43 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 28798360351;
 Tue, 24 Mar 2020 21:11:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1585080703; bh=dpnrdYg+H0t1m4eMarcwA1QLL/f8FZ9Qq9Ix538PXuA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SC907IVp8Ih7txXNRoxmDbRmnmzNGE0fRRIypFPsGOJSPm12JK3N2IqEWPayhwGnJ
 e6zRke7cKWG54m8riTTXhI3OgWCxV26plomj9PlTcdk0hd9Jb6UEzpefOrLHnf4Cg7
 AqU7JTYiVe0dwkOtxghSe+jKlOUVHATOCYps6Yr4=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/9] mm: Split huge pages on write-notify or COW
Date: Tue, 24 Mar 2020 21:11:17 +0100
Message-Id: <20200324201123.3118-4-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200324201123.3118-1-thomas_os@shipmail.org>
References: <20200324201123.3118-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, "Thomas Hellstrom \(VMware\)" <thomas_os@shipmail.org>,
 Dan Williams <dan.j.williams@intel.com>,
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

RnJvbTogIlRob21hcyBIZWxsc3Ryb20gKFZNd2FyZSkiIDx0aG9tYXNfb3NAc2hpcG1haWwub3Jn
PgoKVGhlIGZ1bmN0aW9ucyB3cF9odWdlX3BtZCgpIGFuZCB3cF9odWdlX3B1ZCgpIGN1cnJlbnRs
eSByZWxpZXMgb24gdGhlCmh1Z2VfZmF1bHQoKSBjYWxsYmFjayB0byBzcGxpdCBodWdlIHBhZ2Ug
dGFibGUgZW50cmllcyBpZiBuZWVkZWQuCkhvd2V2ZXIgZm9yIG1vZHVsZSB1c2VycyB0aGF0IHJl
cXVpcmVzIGV4cG9ydCBvZiB0aGUgc3BsaXRfaHVnZV94eHgoKQpmdW5jdGlvbmFsaXR5IHdoaWNo
IG1heSBiZSB1bmRlc2lyZWQuIEluc3RlYWQgc3BsaXQgcHJlLWV4aXN0aW5nIGh1Z2UKcGFnZS10
YWJsZSBlbnRyaWVzIG9uIFZNX0ZBVUxUX0ZBTExCQUNLIHJldHVybi4KCldlIGN1cnJlbnRseSBv
bmx5IGRvIENPVyBhbmQgd3JpdGUtbm90aWZ5IG9uIHRoZSBQVEUgbGV2ZWwsIHNvIGlmIHRoZQpo
dWdlX2ZhdWx0KCkgaGFuZGxlciByZXR1cm5zIFZNX0ZBVUxUX0ZBTExCQUNLIG9uIHdwIGZhdWx0
cywKc3BsaXQgdGhlIGh1Z2UgcGFnZXMgYW5kIHBhZ2UtdGFibGUgZW50cmllcy4gQWxzbyBkbyB0
aGlzIGZvciBodWdlIFBVRHMKaWYgdGhlcmUgaXMgbm8gaHVnZV9mYXVsdCgpIGhhbmRsZXIgYW5k
IHRoZSB2bWEgaXMgbm90IGFub255bW91cywgc2ltaWxhcgp0byBob3cgaXQncyBkb25lIGZvciBQ
TURzLgoKTm90ZSB0aGF0IGZzL2RheC5jIHN0aWxsIGRvZXMgdGhlIHNwbGl0dGluZyBpbiB0aGUg
aHVnZV9mYXVsdCgpIGhhbmRsZXIsCmJ1dCBhcyBodWdlX2ZhdWx0KCkgQSBmb2xsb3ctdXAgcGF0
Y2ggY2FuIHJlbW92ZSB0aGUgZGF4LmMgc3BsaXRfaHVnZV9wbWQoKQppZiBuZWVkZWQuCgpDYzog
QW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1pY2hhbCBIb2Nr
byA8bWhvY2tvQHN1c2UuY29tPgpDYzogIk1hdHRoZXcgV2lsY294IChPcmFjbGUpIiA8d2lsbHlA
aW5mcmFkZWFkLm9yZz4KQ2M6ICJLaXJpbGwgQS4gU2h1dGVtb3YiIDxraXJpbGwuc2h1dGVtb3ZA
bGludXguaW50ZWwuY29tPgpDYzogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29t
PgpDYzogIkrDqXLDtG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6ICJDaHJpc3Rp
YW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGFuIFdpbGxpYW1zIDxk
YW4uai53aWxsaWFtc0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20g
KFZNd2FyZSkgPHRob21hc19vc0BzaGlwbWFpbC5vcmc+CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkFja2VkLWJ5OiBBbmRyZXcgTW9ydG9uIDxh
a3BtQGxpbnV4LWZvdW5kYXRpb24ub3JnPgotLS0KIG1tL21lbW9yeS5jIHwgMjcgKysrKysrKysr
KysrKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9tZW1vcnkuYyBiL21tL21lbW9yeS5jCmluZGV4
IGU4YmZkZjBkOWQxZC4uZWZhNTliMWIxMDljIDEwMDY0NAotLS0gYS9tbS9tZW1vcnkuYworKysg
Yi9tbS9tZW1vcnkuYwpAQCAtMzk1MSwxMSArMzk1MSwxNCBAQCBzdGF0aWMgaW5saW5lIHZtX2Zh
dWx0X3Qgd3BfaHVnZV9wbWQoc3RydWN0IHZtX2ZhdWx0ICp2bWYsIHBtZF90IG9yaWdfcG1kKQog
ewogCWlmICh2bWFfaXNfYW5vbnltb3VzKHZtZi0+dm1hKSkKIAkJcmV0dXJuIGRvX2h1Z2VfcG1k
X3dwX3BhZ2Uodm1mLCBvcmlnX3BtZCk7Ci0JaWYgKHZtZi0+dm1hLT52bV9vcHMtPmh1Z2VfZmF1
bHQpCi0JCXJldHVybiB2bWYtPnZtYS0+dm1fb3BzLT5odWdlX2ZhdWx0KHZtZiwgUEVfU0laRV9Q
TUQpOworCWlmICh2bWYtPnZtYS0+dm1fb3BzLT5odWdlX2ZhdWx0KSB7CisJCXZtX2ZhdWx0X3Qg
cmV0ID0gdm1mLT52bWEtPnZtX29wcy0+aHVnZV9mYXVsdCh2bWYsIFBFX1NJWkVfUE1EKTsKIAot
CS8qIENPVyBoYW5kbGVkIG9uIHB0ZSBsZXZlbDogc3BsaXQgcG1kICovCi0JVk1fQlVHX09OX1ZN
QSh2bWYtPnZtYS0+dm1fZmxhZ3MgJiBWTV9TSEFSRUQsIHZtZi0+dm1hKTsKKwkJaWYgKCEocmV0
ICYgVk1fRkFVTFRfRkFMTEJBQ0spKQorCQkJcmV0dXJuIHJldDsKKwl9CisKKwkvKiBDT1cgb3Ig
d3JpdGUtbm90aWZ5IGhhbmRsZWQgb24gcHRlIGxldmVsOiBzcGxpdCBwbWQuICovCiAJX19zcGxp
dF9odWdlX3BtZCh2bWYtPnZtYSwgdm1mLT5wbWQsIHZtZi0+YWRkcmVzcywgZmFsc2UsIE5VTEwp
OwogCiAJcmV0dXJuIFZNX0ZBVUxUX0ZBTExCQUNLOwpAQCAtMzk2OCwxMiArMzk3MSwyMCBAQCBz
dGF0aWMgaW5saW5lIGJvb2wgdm1hX2lzX2FjY2Vzc2libGUoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEpCiAKIHN0YXRpYyB2bV9mYXVsdF90IGNyZWF0ZV9odWdlX3B1ZChzdHJ1Y3Qgdm1fZmF1
bHQgKnZtZikKIHsKLSNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UKKyNpZiBkZWZp
bmVkKENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSkgJiYJCQlcCisJZGVmaW5lZChDT05GSUdf
SEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFX1BVRCkKIAkvKiBObyBzdXBwb3J0IGZvciBh
bm9ueW1vdXMgdHJhbnNwYXJlbnQgUFVEIHBhZ2VzIHlldCAqLwogCWlmICh2bWFfaXNfYW5vbnlt
b3VzKHZtZi0+dm1hKSkKLQkJcmV0dXJuIFZNX0ZBVUxUX0ZBTExCQUNLOwotCWlmICh2bWYtPnZt
YS0+dm1fb3BzLT5odWdlX2ZhdWx0KQotCQlyZXR1cm4gdm1mLT52bWEtPnZtX29wcy0+aHVnZV9m
YXVsdCh2bWYsIFBFX1NJWkVfUFVEKTsKKwkJZ290byBzcGxpdDsKKwlpZiAodm1mLT52bWEtPnZt
X29wcy0+aHVnZV9mYXVsdCkgeworCQl2bV9mYXVsdF90IHJldCA9IHZtZi0+dm1hLT52bV9vcHMt
Pmh1Z2VfZmF1bHQodm1mLCBQRV9TSVpFX1BVRCk7CisKKwkJaWYgKCEocmV0ICYgVk1fRkFVTFRf
RkFMTEJBQ0spKQorCQkJcmV0dXJuIHJldDsKKwl9CitzcGxpdDoKKwkvKiBDT1cgb3Igd3JpdGUt
bm90aWZ5IG5vdCBoYW5kbGVkIG9uIFBVRCBsZXZlbDogc3BsaXQgcHVkLiovCisJX19zcGxpdF9o
dWdlX3B1ZCh2bWYtPnZtYSwgdm1mLT5wdWQsIHZtZi0+YWRkcmVzcyk7CiAjZW5kaWYgLyogQ09O
RklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFICovCiAJcmV0dXJuIFZNX0ZBVUxUX0ZBTExCQUNLOwog
fQotLSAKMi4yMS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
