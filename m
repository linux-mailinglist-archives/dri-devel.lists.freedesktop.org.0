Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E13153134
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 13:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58AD56F58E;
	Wed,  5 Feb 2020 12:54:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C0F6F58B
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 12:54:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id BE3653F545;
 Wed,  5 Feb 2020 13:54:24 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=UZZATccw; 
 dkim-atps=neutral
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
 with ESMTP id egtu1W7Qy1Bb; Wed,  5 Feb 2020 13:54:23 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 90C913F36B;
 Wed,  5 Feb 2020 13:54:18 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 0F98336037C;
 Wed,  5 Feb 2020 13:54:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1580907258; bh=LiTyLLIByG+Sgb2g/bWGf0WAGY1HDe6N6KfEq6OX0aA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UZZATccwPkAF46V0bdOCO4h8eMdld70EPG8meGn/GY+KNUGZp7YSjwehi1tcRKq1E
 AHsFKz1i98VOXGxMbsafLfVdZ677pjC/5kygr2zXAHfQgYZEb8GuVvSHDgdUZl+F+G
 gfbKyD4+unuSqHsF/tJD6KlJsRWSjie4jbuL8TJk=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/9] mm: Introduce vma_is_special_huge
Date: Wed,  5 Feb 2020 13:53:46 +0100
Message-Id: <20200205125353.2760-3-thomas_os@shipmail.org>
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

RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgoKRm9yIFZNX1BG
Tk1BUCBhbmQgVk1fTUlYRURNQVAgdm1hcyB0aGF0IHdhbnQgdG8gc3VwcG9ydCB0cmFuc2h1Z2Ug
cGFnZXMKYW5kIC1wYWdlIHRhYmxlIGVudHJpZXMsIGludHJvZHVjZSB2bWFfaXNfc3BlY2lhbF9o
dWdlKCkgdGhhdCB0YWtlcyB0aGUKc2FtZSBjb2RlcGF0aHMgYXMgdm1hX2lzX2RheCgpLgoKVGhl
IHVzZSBvZiAic3BlY2lhbCIgZm9sbG93cyB0aGUgZGVmaW5pdGlvbiBpbiBtZW1vcnkuYywgdm1f
bm9ybWFsX3BhZ2UoKToKIlNwZWNpYWwiIG1hcHBpbmdzIGRvIG5vdCB3aXNoIHRvIGJlIGFzc29j
aWF0ZWQgd2l0aCBhICJzdHJ1Y3QgcGFnZSIKKGVpdGhlciBpdCBkb2Vzbid0IGV4aXN0LCBvciBp
dCBleGlzdHMgYnV0IHRoZXkgZG9uJ3Qgd2FudCB0byB0b3VjaCBpdCkKCkZvciBQQUdFX1NJWkUg
cGFnZXMsICJzcGVjaWFsIiBpcyBkZXRlcm1pbmVkIHBlciBwYWdlIHRhYmxlIGVudHJ5IHRvIGJl
CmFibGUgdG8gZGVhbCB3aXRoIENPVyBwYWdlcy4gQnV0IHNpbmNlIHdlIGRvbid0IGhhdmUgaHVn
ZSBDT1cgcGFnZXMsCndlIGNhbiBjbGFzc2lmeSBhIHZtYSBhcyBlaXRoZXIgInNwZWNpYWwgaHVn
ZSIgb3IgIm5vcm1hbCBodWdlIi4KCkNjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4LWZvdW5k
YXRpb24ub3JnPgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+CkNjOiAiTWF0dGhl
dyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQub3JnPgpDYzogIktpcmlsbCBBLiBT
aHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5jb20+CkNjOiBSYWxwaCBDYW1w
YmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+CkNjOiAiSsOpcsO0bWUgR2xpc3NlIiA8amdsaXNz
ZUByZWRoYXQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVsLmNvbT4KU2lnbmVk
LW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgotLS0KIGlu
Y2x1ZGUvbGludXgvbW0uaCB8IDE3ICsrKysrKysrKysrKysrKysrCiBtbS9odWdlX21lbW9yeS5j
ICAgfCAgNiArKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4
L21tLmgKaW5kZXggMDE1N2QyOTM5MzVmLi5kMzcwY2UyOTMyYTEgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGludXgvbW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKQEAgLTI4MjIsNiArMjgyMiwy
MyBAQCBleHRlcm4gbG9uZyBjb3B5X2h1Z2VfcGFnZV9mcm9tX3VzZXIoc3RydWN0IHBhZ2UgKmRz
dF9wYWdlLAogCQkJCWNvbnN0IHZvaWQgX191c2VyICp1c3Jfc3JjLAogCQkJCXVuc2lnbmVkIGlu
dCBwYWdlc19wZXJfaHVnZV9wYWdlLAogCQkJCWJvb2wgYWxsb3dfcGFnZWZhdWx0KTsKKworLyoq
CisgKiB2bWFfaXNfc3BlY2lhbF9odWdlIC0gQXJlIHRyYW5zaHVnZSBwYWdlLXRhYmxlIGVudHJp
ZXMgY29uc2lkZXJlZCBzcGVjaWFsPworICogQHZtYTogUG9pbnRlciB0byB0aGUgc3RydWN0IHZt
X2FyZWFfc3RydWN0IHRvIGNvbnNpZGVyCisgKgorICogV2hldGhlciB0cmFuc2h1Z2UgcGFnZS10
YWJsZSBlbnRyaWVzIGFyZSBjb25zaWRlcmVkICJzcGVjaWFsIiBmb2xsb3dpbmcKKyAqIHRoZSBk
ZWZpbml0aW9uIGluIHZtX25vcm1hbF9wYWdlKCkuCisgKgorICogUmV0dXJuOiB0cnVlIGlmIHRy
YW5zaHVnZSBwYWdlLXRhYmxlIGVudHJpZXMgc2hvdWxkIGJlIGNvbnNpZGVyZWQgc3BlY2lhbCwK
KyAqIGZhbHNlIG90aGVyd2lzZS4KKyAqLworc3RhdGljIGlubGluZSBib29sIHZtYV9pc19zcGVj
aWFsX2h1Z2UoY29uc3Qgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCit7CisJcmV0dXJuIHZt
YV9pc19kYXgodm1hKSB8fCAodm1hLT52bV9maWxlICYmCisJCQkJICAgKHZtYS0+dm1fZmxhZ3Mg
JiAoVk1fUEZOTUFQIHwgVk1fTUlYRURNQVApKSk7Cit9CisKICNlbmRpZiAvKiBDT05GSUdfVFJB
TlNQQVJFTlRfSFVHRVBBR0UgfHwgQ09ORklHX0hVR0VUTEJGUyAqLwogCiAjaWZkZWYgQ09ORklH
X0RFQlVHX1BBR0VBTExPQwpkaWZmIC0tZ2l0IGEvbW0vaHVnZV9tZW1vcnkuYyBiL21tL2h1Z2Vf
bWVtb3J5LmMKaW5kZXggNDFhMGZiZGRjOTZiLi5mOGQyNGZjM2Y0ZGYgMTAwNjQ0Ci0tLSBhL21t
L2h1Z2VfbWVtb3J5LmMKKysrIGIvbW0vaHVnZV9tZW1vcnkuYwpAQCAtMTc4OSw3ICsxNzg5LDcg
QEAgaW50IHphcF9odWdlX3BtZChzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSwKIAlvcmlnX3BtZCA9IHBtZHBfaHVnZV9nZXRfYW5kX2NsZWFyX2Z1bGwo
dGxiLT5tbSwgYWRkciwgcG1kLAogCQkJdGxiLT5mdWxsbW0pOwogCXRsYl9yZW1vdmVfcG1kX3Rs
Yl9lbnRyeSh0bGIsIHBtZCwgYWRkcik7Ci0JaWYgKHZtYV9pc19kYXgodm1hKSkgeworCWlmICh2
bWFfaXNfc3BlY2lhbF9odWdlKHZtYSkpIHsKIAkJaWYgKGFyY2hfbmVlZHNfcGd0YWJsZV9kZXBv
c2l0KCkpCiAJCQl6YXBfZGVwb3NpdGVkX3RhYmxlKHRsYi0+bW0sIHBtZCk7CiAJCXNwaW5fdW5s
b2NrKHB0bCk7CkBAIC0yMDUzLDcgKzIwNTMsNyBAQCBpbnQgemFwX2h1Z2VfcHVkKHN0cnVjdCBt
bXVfZ2F0aGVyICp0bGIsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCSAqLwogCXB1ZHBf
aHVnZV9nZXRfYW5kX2NsZWFyX2Z1bGwodGxiLT5tbSwgYWRkciwgcHVkLCB0bGItPmZ1bGxtbSk7
CiAJdGxiX3JlbW92ZV9wdWRfdGxiX2VudHJ5KHRsYiwgcHVkLCBhZGRyKTsKLQlpZiAodm1hX2lz
X2RheCh2bWEpKSB7CisJaWYgKHZtYV9pc19zcGVjaWFsX2h1Z2Uodm1hKSkgewogCQlzcGluX3Vu
bG9jayhwdGwpOwogCQkvKiBObyB6ZXJvIHBhZ2Ugc3VwcG9ydCB5ZXQgKi8KIAl9IGVsc2UgewpA
QCAtMjE2Miw3ICsyMTYyLDcgQEAgc3RhdGljIHZvaWQgX19zcGxpdF9odWdlX3BtZF9sb2NrZWQo
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHBtZF90ICpwbWQsCiAJCSAqLwogCQlpZiAoYXJj
aF9uZWVkc19wZ3RhYmxlX2RlcG9zaXQoKSkKIAkJCXphcF9kZXBvc2l0ZWRfdGFibGUobW0sIHBt
ZCk7Ci0JCWlmICh2bWFfaXNfZGF4KHZtYSkpCisJCWlmICh2bWFfaXNfc3BlY2lhbF9odWdlKHZt
YSkpCiAJCQlyZXR1cm47CiAJCXBhZ2UgPSBwbWRfcGFnZShfcG1kKTsKIAkJaWYgKCFQYWdlRGly
dHkocGFnZSkgJiYgcG1kX2RpcnR5KF9wbWQpKQotLSAKMi4yMS4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
