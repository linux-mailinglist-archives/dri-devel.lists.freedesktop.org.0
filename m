Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B064F10ABCF
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8B3892CA;
	Wed, 27 Nov 2019 08:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 032926E372
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 08:32:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 9F72E3F5BF;
 Wed, 27 Nov 2019 09:32:13 +0100 (CET)
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
 with ESMTP id jM6coC0IXBPB; Wed, 27 Nov 2019 09:32:05 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 05D393F5AE;
 Wed, 27 Nov 2019 09:32:02 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 7A01436037D;
 Wed, 27 Nov 2019 09:32:02 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-graphics-maintainer@vmware.com
Subject: [RFC PATCH 2/7] mm: Split huge pages on write-notify or COW
Date: Wed, 27 Nov 2019 09:31:15 +0100
Message-Id: <20191127083120.34611-3-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191127083120.34611-1-thomas_os@shipmail.org>
References: <20191127083120.34611-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1574843522; bh=+m8VIGOM4hHWg9ASpsN1nrWT205H44kgXg6hbjLA1Dg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SKBX2VHSrStFphgDRYDXqRsbsGdOIfqGWoRiYui+VMFnvTvXmpAh+vz7TJRZN+hGW
 6XxxDWgvlbh7xrttMcQGXBQ0w87B81VcHrEDko6KFZb/nKJmQTCbuzEwTgbMgkY9E6
 1KRuqQ/x0lMBB4iCoQtlT9XyfcjMi0auNwN9k0yI=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=SKBX2VHS; 
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
 Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
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
bW9yeS5jCmluZGV4IDI4ZjE2MmUyODE0NC4uODliOGE3NzMwZDY2IDEwMDY0NAotLS0gYS9tbS9t
ZW1vcnkuYworKysgYi9tbS9tZW1vcnkuYwpAQCAtMzc1NSwxMSArMzc1NSwxNCBAQCBzdGF0aWMg
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
ZmFsc2UsIE5VTEwpOwogCiAJcmV0dXJuIFZNX0ZBVUxUX0ZBTExCQUNLOwpAQCAtMzc4Nyw5ICsz
NzkwLDE2IEBAIHN0YXRpYyB2bV9mYXVsdF90IHdwX2h1Z2VfcHVkKHN0cnVjdCB2bV9mYXVsdCAq
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
