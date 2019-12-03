Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939AD10FEA9
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683526E523;
	Tue,  3 Dec 2019 13:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAEF6E523
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id AA41D3F4F6;
 Tue,  3 Dec 2019 14:23:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5XIUkuPZmPyQ; Tue,  3 Dec 2019 14:22:51 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 0776A3F47A;
 Tue,  3 Dec 2019 14:22:49 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 47074362509;
 Tue,  3 Dec 2019 14:22:49 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/8] mm: Split huge pages on write-notify or COW
Date: Tue,  3 Dec 2019 14:22:33 +0100
Message-Id: <20191203132239.5910-3-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191203132239.5910-1-thomas_os@shipmail.org>
References: <20191203132239.5910-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575379369; bh=2B2HbcBZC2faRIFGBLOBIOYI9y4hMHEYGgmVKJZAfWg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AMr0rVn9g62Hl/6uhB1g3zVj87bYmG9ztaCiXBYqjYbHa3n/oOd2AQ8pASSAgNcYx
 nYREYqF0mWZqX1emMFKgrxhsvsIC8JSKht33WEewXGUl7G1GL4p0bunf/3EPWGAa9W
 JyKyzQdPzFdmc/8zg10XhfCrZkZZLDhmEjUGOY1M=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=AMr0rVn9; 
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

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKV2UgY3VycmVu
dGx5IG9ubHkgZG8gQ09XIGFuZCB3cml0ZS1ub3RpZnkgb24gdGhlIFBURSBsZXZlbCwgc28gaWYg
dGhlCmh1Z2VfZmF1bHQoKSBoYW5kbGVyIHJldHVybnMgVk1fRkFVTFRfRkFMTEJBQ0sgb24gd3Ag
ZmF1bHRzLApzcGxpdCB0aGUgaHVnZSBwYWdlcyBhbmQgcGFnZS10YWJsZSBlbnRyaWVzLiBBbHNv
IGRvIHRoaXMgZm9yIGh1Z2UgUFVEcwppZiB0aGVyZSBpcyBubyBodWdlX2ZhdWx0KCkgaGFuZGxl
ciBhbmQgdGhlIHZtYSBpcyBub3QgYW5vbnltb3VzLCBzaW1pbGFyCnRvIGhvdyBpdCdzIGRvbmUg
Zm9yIFBNRHMuCgpOb3RlIHRoYXQgZnMvZGF4LmMgZG9lcyB0aGUgc3BsaXR0aW5nIGluIHRoZSBo
dWdlX2ZhdWx0KCkgaGFuZGxlciwgYnV0IGFzCmh1Z2VfZmF1bHQoKSBpcyBpbXBsZW1lbnRlZCBi
eSBtb2R1bGVzIHdlIG5lZWQgdG8gY29uc2lkZXIgd2hldGhlciB0bwpleHBvcnQgdGhlIHNwbGl0
dGluZyBmdW5jdGlvbnMgZm9yIHVzZSBpbiB0aGUgbW9kdWxlcyBvciB3aGV0aGVyIHRvIHRyeQp0
byBrZWVwIGNhbGxzIGluIHRoZSBjb3JlLiBPcHQgZm9yIHRoZSBsYXR0ZXIuIEEgZm9sbG93LXVw
IHBhdGNoIGNhbgpyZW1vdmUgdGhlIGRheC5jIHNwbGl0X2h1Z2VfcG1kKCkgaWYgbmVlZGVkLgoK
Q2M6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+CkNjOiBNaWNoYWwg
SG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KQ2M6ICJNYXR0aGV3IFdpbGNveCAoT3JhY2xlKSIgPHdp
bGx5QGluZnJhZGVhZC5vcmc+CkNjOiAiS2lyaWxsIEEuIFNodXRlbW92IiA8a2lyaWxsLnNodXRl
bW92QGxpbnV4LmludGVsLmNvbT4KQ2M6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlh
LmNvbT4KQ2M6ICJKw6lyw7RtZSBHbGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+CkNjOiAiQ2hy
aXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTog
VGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgotLS0KIG1tL21lbW9yeS5j
IHwgMjQgKysrKysrKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTcgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9tZW1vcnkuYyBiL21tL21l
bW9yeS5jCmluZGV4IDc4NTE3YTViYjhhYy4uN2VkZTI0NTZhNzZmIDEwMDY0NAotLS0gYS9tbS9t
ZW1vcnkuYworKysgYi9tbS9tZW1vcnkuYwpAQCAtMzg1MSwxMSArMzg1MSwxNCBAQCBzdGF0aWMg
aW5saW5lIHZtX2ZhdWx0X3Qgd3BfaHVnZV9wbWQoc3RydWN0IHZtX2ZhdWx0ICp2bWYsIHBtZF90
IG9yaWdfcG1kKQogewogCWlmICh2bWFfaXNfYW5vbnltb3VzKHZtZi0+dm1hKSkKIAkJcmV0dXJu
IGRvX2h1Z2VfcG1kX3dwX3BhZ2Uodm1mLCBvcmlnX3BtZCk7Ci0JaWYgKHZtZi0+dm1hLT52bV9v
cHMtPmh1Z2VfZmF1bHQpCi0JCXJldHVybiB2bWYtPnZtYS0+dm1fb3BzLT5odWdlX2ZhdWx0KHZt
ZiwgUEVfU0laRV9QTUQpOworCWlmICh2bWYtPnZtYS0+dm1fb3BzLT5odWdlX2ZhdWx0KSB7CisJ
CXZtX2ZhdWx0X3QgcmV0ID0gdm1mLT52bWEtPnZtX29wcy0+aHVnZV9mYXVsdCh2bWYsIFBFX1NJ
WkVfUE1EKTsKIAotCS8qIENPVyBoYW5kbGVkIG9uIHB0ZSBsZXZlbDogc3BsaXQgcG1kICovCi0J
Vk1fQlVHX09OX1ZNQSh2bWYtPnZtYS0+dm1fZmxhZ3MgJiBWTV9TSEFSRUQsIHZtZi0+dm1hKTsK
KwkJaWYgKCEocmV0ICYgVk1fRkFVTFRfRkFMTEJBQ0spKQorCQkJcmV0dXJuIHJldDsKKwl9CisK
KwkvKiBDT1cgb3Igd3JpdGUtbm90aWZ5IGhhbmRsZWQgb24gcHRlIGxldmVsOiBzcGxpdCBwbWQu
ICovCiAJX19zcGxpdF9odWdlX3BtZCh2bWYtPnZtYSwgdm1mLT5wbWQsIHZtZi0+YWRkcmVzcywg
ZmFsc2UsIE5VTEwpOwogCiAJcmV0dXJuIFZNX0ZBVUxUX0ZBTExCQUNLOwpAQCAtMzg4Myw5ICsz
ODg2LDE2IEBAIHN0YXRpYyB2bV9mYXVsdF90IHdwX2h1Z2VfcHVkKHN0cnVjdCB2bV9mYXVsdCAq
dm1mLCBwdWRfdCBvcmlnX3B1ZCkKICNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UK
IAkvKiBObyBzdXBwb3J0IGZvciBhbm9ueW1vdXMgdHJhbnNwYXJlbnQgUFVEIHBhZ2VzIHlldCAq
LwogCWlmICh2bWFfaXNfYW5vbnltb3VzKHZtZi0+dm1hKSkKLQkJcmV0dXJuIFZNX0ZBVUxUX0ZB
TExCQUNLOwotCWlmICh2bWYtPnZtYS0+dm1fb3BzLT5odWdlX2ZhdWx0KQotCQlyZXR1cm4gdm1m
LT52bWEtPnZtX29wcy0+aHVnZV9mYXVsdCh2bWYsIFBFX1NJWkVfUFVEKTsKKwkJZ290byBzcGxp
dDsKKwlpZiAodm1mLT52bWEtPnZtX29wcy0+aHVnZV9mYXVsdCkgeworCQl2bV9mYXVsdF90IHJl
dCA9IHZtZi0+dm1hLT52bV9vcHMtPmh1Z2VfZmF1bHQodm1mLCBQRV9TSVpFX1BVRCk7CisKKwkJ
aWYgKCEocmV0ICYgVk1fRkFVTFRfRkFMTEJBQ0spKQorCQkJcmV0dXJuIHJldDsKKwl9CitzcGxp
dDoKKwkvKiBDT1cgb3Igd3JpdGUtbm90aWZ5IG5vdCBoYW5kbGVkIG9uIFBVRCBsZXZlbDogc3Bs
aXQgcHVkLiovCisJX19zcGxpdF9odWdlX3B1ZCh2bWYtPnZtYSwgdm1mLT5wdWQsIHZtZi0+YWRk
cmVzcyk7CiAjZW5kaWYgLyogQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFICovCiAJcmV0dXJu
IFZNX0ZBVUxUX0ZBTExCQUNLOwogfQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
