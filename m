Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762E115313A
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 13:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 537406F593;
	Wed,  5 Feb 2020 12:54:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2756F592
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 12:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id CD4E03F695;
 Wed,  5 Feb 2020 13:54:27 +0100 (CET)
Authentication-Results: ste-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=iq0wNGkO; 
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
 with ESMTP id IdEYKwXtpuB6; Wed,  5 Feb 2020 13:54:23 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id A930B3F669;
 Wed,  5 Feb 2020 13:54:18 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 32FC1360413;
 Wed,  5 Feb 2020 13:54:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1580907258; bh=b14LVZl/+itpO85NpGNOLmY5imFMUhPrKjnSv3EgZ4c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iq0wNGkOta0XVDOb4TsmUnEau5JJ6UnHcTcKtTptRJf9qO7ebH2AyH4imdZyDk5pA
 cDvaeW7pk2xtLSWFFCiGOAZgbJH4su10Ij45+oCozqPfgS7PhIUl0ndlqaQ3ywps3E
 kkw7Ip76PhyQnFUv/o06hpT5I45oPMNK6i5B9LcA=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/9] mm: Split huge pages on write-notify or COW
Date: Wed,  5 Feb 2020 13:53:47 +0100
Message-Id: <20200205125353.2760-4-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200205125353.2760-1-thomas_os@shipmail.org>
References: <20200205125353.2760-1-thomas_os@shipmail.org>
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
aXN0aWFuIEvDtm5pZyIgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQ2M6IERhbiBXaWxsaWFt
cyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0
cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Ci0tLQogbW0vbWVtb3J5LmMgfCAyNyArKysrKysr
KysrKysrKysrKysrLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL21lbW9yeS5jIGIvbW0vbWVtb3J5LmMKaW5k
ZXggMTdhYWRjNzUxZTVjLi40YzQ5ZmU5NjNlNWMgMTAwNjQ0Ci0tLSBhL21tL21lbW9yeS5jCisr
KyBiL21tL21lbW9yeS5jCkBAIC0zODgwLDExICszODgwLDE0IEBAIHN0YXRpYyBpbmxpbmUgdm1f
ZmF1bHRfdCB3cF9odWdlX3BtZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwgcG1kX3Qgb3JpZ19wbWQp
CiB7CiAJaWYgKHZtYV9pc19hbm9ueW1vdXModm1mLT52bWEpKQogCQlyZXR1cm4gZG9faHVnZV9w
bWRfd3BfcGFnZSh2bWYsIG9yaWdfcG1kKTsKLQlpZiAodm1mLT52bWEtPnZtX29wcy0+aHVnZV9m
YXVsdCkKLQkJcmV0dXJuIHZtZi0+dm1hLT52bV9vcHMtPmh1Z2VfZmF1bHQodm1mLCBQRV9TSVpF
X1BNRCk7CisJaWYgKHZtZi0+dm1hLT52bV9vcHMtPmh1Z2VfZmF1bHQpIHsKKwkJdm1fZmF1bHRf
dCByZXQgPSB2bWYtPnZtYS0+dm1fb3BzLT5odWdlX2ZhdWx0KHZtZiwgUEVfU0laRV9QTUQpOwog
Ci0JLyogQ09XIGhhbmRsZWQgb24gcHRlIGxldmVsOiBzcGxpdCBwbWQgKi8KLQlWTV9CVUdfT05f
Vk1BKHZtZi0+dm1hLT52bV9mbGFncyAmIFZNX1NIQVJFRCwgdm1mLT52bWEpOworCQlpZiAoIShy
ZXQgJiBWTV9GQVVMVF9GQUxMQkFDSykpCisJCQlyZXR1cm4gcmV0OworCX0KKworCS8qIENPVyBv
ciB3cml0ZS1ub3RpZnkgaGFuZGxlZCBvbiBwdGUgbGV2ZWw6IHNwbGl0IHBtZC4gKi8KIAlfX3Nw
bGl0X2h1Z2VfcG1kKHZtZi0+dm1hLCB2bWYtPnBtZCwgdm1mLT5hZGRyZXNzLCBmYWxzZSwgTlVM
TCk7CiAKIAlyZXR1cm4gVk1fRkFVTFRfRkFMTEJBQ0s7CkBAIC0zODk3LDEyICszOTAwLDIwIEBA
IHN0YXRpYyBpbmxpbmUgYm9vbCB2bWFfaXNfYWNjZXNzaWJsZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSkKIAogc3RhdGljIHZtX2ZhdWx0X3QgY3JlYXRlX2h1Z2VfcHVkKHN0cnVjdCB2bV9m
YXVsdCAqdm1mKQogewotI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRQorI2lmIGRl
ZmluZWQoQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFKSAmJgkJCVwKKwlkZWZpbmVkKENPTkZJ
R19IQVZFX0FSQ0hfVFJBTlNQQVJFTlRfSFVHRVBBR0VfUFVEKQogCS8qIE5vIHN1cHBvcnQgZm9y
IGFub255bW91cyB0cmFuc3BhcmVudCBQVUQgcGFnZXMgeWV0ICovCiAJaWYgKHZtYV9pc19hbm9u
eW1vdXModm1mLT52bWEpKQotCQlyZXR1cm4gVk1fRkFVTFRfRkFMTEJBQ0s7Ci0JaWYgKHZtZi0+
dm1hLT52bV9vcHMtPmh1Z2VfZmF1bHQpCi0JCXJldHVybiB2bWYtPnZtYS0+dm1fb3BzLT5odWdl
X2ZhdWx0KHZtZiwgUEVfU0laRV9QVUQpOworCQlnb3RvIHNwbGl0OworCWlmICh2bWYtPnZtYS0+
dm1fb3BzLT5odWdlX2ZhdWx0KSB7CisJCXZtX2ZhdWx0X3QgcmV0ID0gdm1mLT52bWEtPnZtX29w
cy0+aHVnZV9mYXVsdCh2bWYsIFBFX1NJWkVfUFVEKTsKKworCQlpZiAoIShyZXQgJiBWTV9GQVVM
VF9GQUxMQkFDSykpCisJCQlyZXR1cm4gcmV0OworCX0KK3NwbGl0OgorCS8qIENPVyBvciB3cml0
ZS1ub3RpZnkgbm90IGhhbmRsZWQgb24gUFVEIGxldmVsOiBzcGxpdCBwdWQuKi8KKwlfX3NwbGl0
X2h1Z2VfcHVkKHZtZi0+dm1hLCB2bWYtPnB1ZCwgdm1mLT5hZGRyZXNzKTsKICNlbmRpZiAvKiBD
T05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UgKi8KIAlyZXR1cm4gVk1fRkFVTFRfRkFMTEJBQ0s7
CiB9Ci0tIAoyLjIxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
