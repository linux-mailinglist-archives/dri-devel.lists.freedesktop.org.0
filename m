Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F55178E69
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 11:29:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA02F6EB17;
	Wed,  4 Mar 2020 10:29:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43CBA6EB0B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 10:28:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 7ECCE3F888;
 Wed,  4 Mar 2020 11:28:52 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=aYDMzrpo; 
 dkim-atps=neutral
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
 with ESMTP id ovLp4pFr5_Wd; Wed,  4 Mar 2020 11:28:50 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 5CC693F885;
 Wed,  4 Mar 2020 11:28:48 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 0E83136042F;
 Wed,  4 Mar 2020 11:28:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1583317728; bh=eArF6ZjbQdomBzBVnzbUQcGFkrLPEvAM1NjLa5asgsg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aYDMzrpoD0nNuFdNRG3boslnkJ3rFO1pNqTFdJzDcSDijQcx1cRVU0nVBP0ouv6pf
 qjDLfCcx2elKnNFohIkbfgdg91M67xEBCYHm0kFTqUbhgnHkt+nSBzysBEAeaviqL/
 qsn1A4dTA6TfXugmDW4/HvLd2yNQwBqXVShRK0kY=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/9] mm: Split huge pages on write-notify or COW
Date: Wed,  4 Mar 2020 11:28:34 +0100
Message-Id: <20200304102840.2801-4-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200304102840.2801-1-thomas_os@shipmail.org>
References: <20200304102840.2801-1-thomas_os@shipmail.org>
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
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

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKVGhlIGZ1bmN0
aW9ucyB3cF9odWdlX3BtZCgpIGFuZCB3cF9odWdlX3B1ZCgpIGN1cnJlbnRseSByZWxpZXMgb24g
dGhlCmh1Z2VfZmF1bHQoKSBjYWxsYmFjayB0byBzcGxpdCBodWdlIHBhZ2UgdGFibGUgZW50cmll
cyBpZiBuZWVkZWQuCkhvd2V2ZXIgZm9yIG1vZHVsZSB1c2VycyB0aGF0IHJlcXVpcmVzIGV4cG9y
dCBvZiB0aGUgc3BsaXRfaHVnZV94eHgoKQpmdW5jdGlvbmFsaXR5IHdoaWNoIG1heSBiZSB1bmRl
c2lyZWQuIEluc3RlYWQgc3BsaXQgcHJlLWV4aXN0aW5nIGh1Z2UKcGFnZS10YWJsZSBlbnRyaWVz
IG9uIFZNX0ZBVUxUX0ZBTExCQUNLIHJldHVybi4KCldlIGN1cnJlbnRseSBvbmx5IGRvIENPVyBh
bmQgd3JpdGUtbm90aWZ5IG9uIHRoZSBQVEUgbGV2ZWwsIHNvIGlmIHRoZQpodWdlX2ZhdWx0KCkg
aGFuZGxlciByZXR1cm5zIFZNX0ZBVUxUX0ZBTExCQUNLIG9uIHdwIGZhdWx0cywKc3BsaXQgdGhl
IGh1Z2UgcGFnZXMgYW5kIHBhZ2UtdGFibGUgZW50cmllcy4gQWxzbyBkbyB0aGlzIGZvciBodWdl
IFBVRHMKaWYgdGhlcmUgaXMgbm8gaHVnZV9mYXVsdCgpIGhhbmRsZXIgYW5kIHRoZSB2bWEgaXMg
bm90IGFub255bW91cywgc2ltaWxhcgp0byBob3cgaXQncyBkb25lIGZvciBQTURzLgoKTm90ZSB0
aGF0IGZzL2RheC5jIHN0aWxsIGRvZXMgdGhlIHNwbGl0dGluZyBpbiB0aGUgaHVnZV9mYXVsdCgp
IGhhbmRsZXIsIGJ1dCBhcwpodWdlX2ZhdWx0KCkgQSBmb2xsb3ctdXAgcGF0Y2ggY2FuIHJlbW92
ZSB0aGUgZGF4LmMgc3BsaXRfaHVnZV9wbWQoKSBpZiBuZWVkZWQuCgpDYzogQW5kcmV3IE1vcnRv
biA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6IE1pY2hhbCBIb2NrbyA8bWhvY2tvQHN1
c2UuY29tPgpDYzogIk1hdHRoZXcgV2lsY294IChPcmFjbGUpIiA8d2lsbHlAaW5mcmFkZWFkLm9y
Zz4KQ2M6ICJLaXJpbGwgQS4gU2h1dGVtb3YiIDxraXJpbGwuc2h1dGVtb3ZAbGludXguaW50ZWwu
Y29tPgpDYzogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpDYzogIkrDqXLD
tG1lIEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KQ2M6ICJDaHJpc3RpYW4gS8O2bmlnIiA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFt
c0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21A
dm13YXJlLmNvbT4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdA
YW1kLmNvbT4KLS0tCiBtbS9tZW1vcnkuYyB8IDI3ICsrKysrKysrKysrKysrKysrKystLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbW0vbWVtb3J5LmMgYi9tbS9tZW1vcnkuYwppbmRleCAwYmNjYzYyMmU0ODIuLjFl
M2ZjMTk4ODc5MCAxMDA2NDQKLS0tIGEvbW0vbWVtb3J5LmMKKysrIGIvbW0vbWVtb3J5LmMKQEAg
LTM5MzIsMTEgKzM5MzIsMTQgQEAgc3RhdGljIGlubGluZSB2bV9mYXVsdF90IHdwX2h1Z2VfcG1k
KHN0cnVjdCB2bV9mYXVsdCAqdm1mLCBwbWRfdCBvcmlnX3BtZCkKIHsKIAlpZiAodm1hX2lzX2Fu
b255bW91cyh2bWYtPnZtYSkpCiAJCXJldHVybiBkb19odWdlX3BtZF93cF9wYWdlKHZtZiwgb3Jp
Z19wbWQpOwotCWlmICh2bWYtPnZtYS0+dm1fb3BzLT5odWdlX2ZhdWx0KQotCQlyZXR1cm4gdm1m
LT52bWEtPnZtX29wcy0+aHVnZV9mYXVsdCh2bWYsIFBFX1NJWkVfUE1EKTsKKwlpZiAodm1mLT52
bWEtPnZtX29wcy0+aHVnZV9mYXVsdCkgeworCQl2bV9mYXVsdF90IHJldCA9IHZtZi0+dm1hLT52
bV9vcHMtPmh1Z2VfZmF1bHQodm1mLCBQRV9TSVpFX1BNRCk7CiAKLQkvKiBDT1cgaGFuZGxlZCBv
biBwdGUgbGV2ZWw6IHNwbGl0IHBtZCAqLwotCVZNX0JVR19PTl9WTUEodm1mLT52bWEtPnZtX2Zs
YWdzICYgVk1fU0hBUkVELCB2bWYtPnZtYSk7CisJCWlmICghKHJldCAmIFZNX0ZBVUxUX0ZBTExC
QUNLKSkKKwkJCXJldHVybiByZXQ7CisJfQorCisJLyogQ09XIG9yIHdyaXRlLW5vdGlmeSBoYW5k
bGVkIG9uIHB0ZSBsZXZlbDogc3BsaXQgcG1kLiAqLwogCV9fc3BsaXRfaHVnZV9wbWQodm1mLT52
bWEsIHZtZi0+cG1kLCB2bWYtPmFkZHJlc3MsIGZhbHNlLCBOVUxMKTsKIAogCXJldHVybiBWTV9G
QVVMVF9GQUxMQkFDSzsKQEAgLTM5NDksMTIgKzM5NTIsMjAgQEAgc3RhdGljIGlubGluZSBib29s
IHZtYV9pc19hY2Nlc3NpYmxlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQogCiBzdGF0aWMg
dm1fZmF1bHRfdCBjcmVhdGVfaHVnZV9wdWQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiB7Ci0jaWZk
ZWYgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFCisjaWYgZGVmaW5lZChDT05GSUdfVFJBTlNQ
QVJFTlRfSFVHRVBBR0UpICYmCQkJXAorCWRlZmluZWQoQ09ORklHX0hBVkVfQVJDSF9UUkFOU1BB
UkVOVF9IVUdFUEFHRV9QVUQpCiAJLyogTm8gc3VwcG9ydCBmb3IgYW5vbnltb3VzIHRyYW5zcGFy
ZW50IFBVRCBwYWdlcyB5ZXQgKi8KIAlpZiAodm1hX2lzX2Fub255bW91cyh2bWYtPnZtYSkpCi0J
CXJldHVybiBWTV9GQVVMVF9GQUxMQkFDSzsKLQlpZiAodm1mLT52bWEtPnZtX29wcy0+aHVnZV9m
YXVsdCkKLQkJcmV0dXJuIHZtZi0+dm1hLT52bV9vcHMtPmh1Z2VfZmF1bHQodm1mLCBQRV9TSVpF
X1BVRCk7CisJCWdvdG8gc3BsaXQ7CisJaWYgKHZtZi0+dm1hLT52bV9vcHMtPmh1Z2VfZmF1bHQp
IHsKKwkJdm1fZmF1bHRfdCByZXQgPSB2bWYtPnZtYS0+dm1fb3BzLT5odWdlX2ZhdWx0KHZtZiwg
UEVfU0laRV9QVUQpOworCisJCWlmICghKHJldCAmIFZNX0ZBVUxUX0ZBTExCQUNLKSkKKwkJCXJl
dHVybiByZXQ7CisJfQorc3BsaXQ6CisJLyogQ09XIG9yIHdyaXRlLW5vdGlmeSBub3QgaGFuZGxl
ZCBvbiBQVUQgbGV2ZWw6IHNwbGl0IHB1ZC4qLworCV9fc3BsaXRfaHVnZV9wdWQodm1mLT52bWEs
IHZtZi0+cHVkLCB2bWYtPmFkZHJlc3MpOwogI2VuZGlmIC8qIENPTkZJR19UUkFOU1BBUkVOVF9I
VUdFUEFHRSAqLwogCXJldHVybiBWTV9GQVVMVF9GQUxMQkFDSzsKIH0KLS0gCjIuMjEuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
