Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DD9178E5B
	for <lists+dri-devel@lfdr.de>; Wed,  4 Mar 2020 11:29:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF97E6EB0B;
	Wed,  4 Mar 2020 10:28:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 655B26EB0C
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 10:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 27C333F42D;
 Wed,  4 Mar 2020 11:28:51 +0100 (CET)
Authentication-Results: pio-pvt-msa3.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=el+RIwg9; 
 dkim-atps=neutral
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
 with ESMTP id LVOnsctSoC9o; Wed,  4 Mar 2020 11:28:50 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 5A39A3F338;
 Wed,  4 Mar 2020 11:28:48 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D71FA36037A;
 Wed,  4 Mar 2020 11:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1583317728; bh=sjfw4EDUDCZlOzwRRGyUB4kL3vTEnAR8SOHYZEwYpC8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=el+RIwg9+OzpimzePaaSa5WbqcXjekYwdI/KSv03Hsoo/7/YrfNC2onq/M1sxHLFm
 o1N207XdbYu0eUWYonfZlc6PHNeGnMsBxaeOekA4avAtrMS1FZrGvFG+T15HVt+gcm
 N7eAqne3cYe6CdtGGqlim5W+7duAaluOG/zNIeXA=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/9] mm: Introduce vma_is_special_huge
Date: Wed,  4 Mar 2020 11:28:33 +0100
Message-Id: <20200304102840.2801-3-thomas_os@shipmail.org>
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
LW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgpBY2tlZC1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGluY2x1
ZGUvbGludXgvbW0uaCB8IDE3ICsrKysrKysrKysrKysrKysrCiBtbS9odWdlX21lbW9yeS5jICAg
fCAgNiArKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21t
LmgKaW5kZXggNTIyNjllNTZjNTE0Li5lNjFjZjNmNjA5YjQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUv
bGludXgvbW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKQEAgLTI4NjMsNiArMjg2MywyMyBA
QCBleHRlcm4gbG9uZyBjb3B5X2h1Z2VfcGFnZV9mcm9tX3VzZXIoc3RydWN0IHBhZ2UgKmRzdF9w
YWdlLAogCQkJCWNvbnN0IHZvaWQgX191c2VyICp1c3Jfc3JjLAogCQkJCXVuc2lnbmVkIGludCBw
YWdlc19wZXJfaHVnZV9wYWdlLAogCQkJCWJvb2wgYWxsb3dfcGFnZWZhdWx0KTsKKworLyoqCisg
KiB2bWFfaXNfc3BlY2lhbF9odWdlIC0gQXJlIHRyYW5zaHVnZSBwYWdlLXRhYmxlIGVudHJpZXMg
Y29uc2lkZXJlZCBzcGVjaWFsPworICogQHZtYTogUG9pbnRlciB0byB0aGUgc3RydWN0IHZtX2Fy
ZWFfc3RydWN0IHRvIGNvbnNpZGVyCisgKgorICogV2hldGhlciB0cmFuc2h1Z2UgcGFnZS10YWJs
ZSBlbnRyaWVzIGFyZSBjb25zaWRlcmVkICJzcGVjaWFsIiBmb2xsb3dpbmcKKyAqIHRoZSBkZWZp
bml0aW9uIGluIHZtX25vcm1hbF9wYWdlKCkuCisgKgorICogUmV0dXJuOiB0cnVlIGlmIHRyYW5z
aHVnZSBwYWdlLXRhYmxlIGVudHJpZXMgc2hvdWxkIGJlIGNvbnNpZGVyZWQgc3BlY2lhbCwKKyAq
IGZhbHNlIG90aGVyd2lzZS4KKyAqLworc3RhdGljIGlubGluZSBib29sIHZtYV9pc19zcGVjaWFs
X2h1Z2UoY29uc3Qgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCit7CisJcmV0dXJuIHZtYV9p
c19kYXgodm1hKSB8fCAodm1hLT52bV9maWxlICYmCisJCQkJICAgKHZtYS0+dm1fZmxhZ3MgJiAo
Vk1fUEZOTUFQIHwgVk1fTUlYRURNQVApKSk7Cit9CisKICNlbmRpZiAvKiBDT05GSUdfVFJBTlNQ
QVJFTlRfSFVHRVBBR0UgfHwgQ09ORklHX0hVR0VUTEJGUyAqLwogCiAjaWZkZWYgQ09ORklHX0RF
QlVHX1BBR0VBTExPQwpkaWZmIC0tZ2l0IGEvbW0vaHVnZV9tZW1vcnkuYyBiL21tL2h1Z2VfbWVt
b3J5LmMKaW5kZXggYjA4YjE5OWY5YTExLi5mZjdhOGI4NWMzYmEgMTAwNjQ0Ci0tLSBhL21tL2h1
Z2VfbWVtb3J5LmMKKysrIGIvbW0vaHVnZV9tZW1vcnkuYwpAQCAtMTgwMiw3ICsxODAyLDcgQEAg
aW50IHphcF9odWdlX3BtZChzdHJ1Y3QgbW11X2dhdGhlciAqdGxiLCBzdHJ1Y3Qgdm1fYXJlYV9z
dHJ1Y3QgKnZtYSwKIAlvcmlnX3BtZCA9IHBtZHBfaHVnZV9nZXRfYW5kX2NsZWFyX2Z1bGwodGxi
LT5tbSwgYWRkciwgcG1kLAogCQkJdGxiLT5mdWxsbW0pOwogCXRsYl9yZW1vdmVfcG1kX3RsYl9l
bnRyeSh0bGIsIHBtZCwgYWRkcik7Ci0JaWYgKHZtYV9pc19kYXgodm1hKSkgeworCWlmICh2bWFf
aXNfc3BlY2lhbF9odWdlKHZtYSkpIHsKIAkJaWYgKGFyY2hfbmVlZHNfcGd0YWJsZV9kZXBvc2l0
KCkpCiAJCQl6YXBfZGVwb3NpdGVkX3RhYmxlKHRsYi0+bW0sIHBtZCk7CiAJCXNwaW5fdW5sb2Nr
KHB0bCk7CkBAIC0yMDY2LDcgKzIwNjYsNyBAQCBpbnQgemFwX2h1Z2VfcHVkKHN0cnVjdCBtbXVf
Z2F0aGVyICp0bGIsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCSAqLwogCXB1ZHBfaHVn
ZV9nZXRfYW5kX2NsZWFyX2Z1bGwodGxiLT5tbSwgYWRkciwgcHVkLCB0bGItPmZ1bGxtbSk7CiAJ
dGxiX3JlbW92ZV9wdWRfdGxiX2VudHJ5KHRsYiwgcHVkLCBhZGRyKTsKLQlpZiAodm1hX2lzX2Rh
eCh2bWEpKSB7CisJaWYgKHZtYV9pc19zcGVjaWFsX2h1Z2Uodm1hKSkgewogCQlzcGluX3VubG9j
ayhwdGwpOwogCQkvKiBObyB6ZXJvIHBhZ2Ugc3VwcG9ydCB5ZXQgKi8KIAl9IGVsc2UgewpAQCAt
MjE3NSw3ICsyMTc1LDcgQEAgc3RhdGljIHZvaWQgX19zcGxpdF9odWdlX3BtZF9sb2NrZWQoc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHBtZF90ICpwbWQsCiAJCSAqLwogCQlpZiAoYXJjaF9u
ZWVkc19wZ3RhYmxlX2RlcG9zaXQoKSkKIAkJCXphcF9kZXBvc2l0ZWRfdGFibGUobW0sIHBtZCk7
Ci0JCWlmICh2bWFfaXNfZGF4KHZtYSkpCisJCWlmICh2bWFfaXNfc3BlY2lhbF9odWdlKHZtYSkp
CiAJCQlyZXR1cm47CiAJCXBhZ2UgPSBwbWRfcGFnZShfcG1kKTsKIAkJaWYgKCFQYWdlRGlydHko
cGFnZSkgJiYgcG1kX2RpcnR5KF9wbWQpKQotLSAKMi4yMS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
