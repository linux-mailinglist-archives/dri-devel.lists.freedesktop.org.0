Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E749191AA0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Mar 2020 21:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03F456E0AD;
	Tue, 24 Mar 2020 20:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5F736E090
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 20:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 373543F504;
 Tue, 24 Mar 2020 21:11:46 +0100 (CET)
Authentication-Results: pio-pvt-msa2.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=FnJNWVZ2; 
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
 with ESMTP id NsUB7riQ5ocS; Tue, 24 Mar 2020 21:11:41 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id EBB5E3F4E7;
 Tue, 24 Mar 2020 21:11:40 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 87B9B360308;
 Tue, 24 Mar 2020 21:11:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1585080700; bh=LllKBqw2wO4T5iGYWqMCexSSQNGBp2Vkl1w4YNHgngg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FnJNWVZ2FVePl3FNGME5FwHpcjnGLBsjHXUNR0BlfOXIHzYdyus3mEgodbgqsEoL6
 yhAWDtTJlFUt2ReT31asqI0kmkUTByl3zNPv00xJR30ZQx4av/4oTrtBSMvmAHWJ8L
 p3QWRYlnrKAkhJPBNQ8i8vYA9ML/T/TKJFS0WjoU=
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v7 2/9] mm: Introduce vma_is_special_huge
Date: Tue, 24 Mar 2020 21:11:16 +0100
Message-Id: <20200324201123.3118-3-thomas_os@shipmail.org>
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
PgoKRm9yIFZNX1BGTk1BUCBhbmQgVk1fTUlYRURNQVAgdm1hcyB0aGF0IHdhbnQgdG8gc3VwcG9y
dCB0cmFuc2h1Z2UgcGFnZXMKYW5kIC1wYWdlIHRhYmxlIGVudHJpZXMsIGludHJvZHVjZSB2bWFf
aXNfc3BlY2lhbF9odWdlKCkgdGhhdCB0YWtlcyB0aGUKc2FtZSBjb2RlcGF0aHMgYXMgdm1hX2lz
X2RheCgpLgoKVGhlIHVzZSBvZiAic3BlY2lhbCIgZm9sbG93cyB0aGUgZGVmaW5pdGlvbiBpbiBt
ZW1vcnkuYywgdm1fbm9ybWFsX3BhZ2UoKToKIlNwZWNpYWwiIG1hcHBpbmdzIGRvIG5vdCB3aXNo
IHRvIGJlIGFzc29jaWF0ZWQgd2l0aCBhICJzdHJ1Y3QgcGFnZSIKKGVpdGhlciBpdCBkb2Vzbid0
IGV4aXN0LCBvciBpdCBleGlzdHMgYnV0IHRoZXkgZG9uJ3Qgd2FudCB0byB0b3VjaCBpdCkKCkZv
ciBQQUdFX1NJWkUgcGFnZXMsICJzcGVjaWFsIiBpcyBkZXRlcm1pbmVkIHBlciBwYWdlIHRhYmxl
IGVudHJ5IHRvIGJlCmFibGUgdG8gZGVhbCB3aXRoIENPVyBwYWdlcy4gQnV0IHNpbmNlIHdlIGRv
bid0IGhhdmUgaHVnZSBDT1cgcGFnZXMsCndlIGNhbiBjbGFzc2lmeSBhIHZtYSBhcyBlaXRoZXIg
InNwZWNpYWwgaHVnZSIgb3IgIm5vcm1hbCBodWdlIi4KCkNjOiBBbmRyZXcgTW9ydG9uIDxha3Bt
QGxpbnV4LWZvdW5kYXRpb24ub3JnPgpDYzogTWljaGFsIEhvY2tvIDxtaG9ja29Ac3VzZS5jb20+
CkNjOiAiTWF0dGhldyBXaWxjb3ggKE9yYWNsZSkiIDx3aWxseUBpbmZyYWRlYWQub3JnPgpDYzog
IktpcmlsbCBBLiBTaHV0ZW1vdiIgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5jb20+CkNj
OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+CkNjOiAiSsOpcsO0bWUgR2xp
c3NlIiA8amdsaXNzZUByZWRoYXQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYW4gV2lsbGlhbXMgPGRhbi5qLndpbGxpYW1zQGludGVs
LmNvbT4KU2lnbmVkLW9mZi1ieTogVGhvbWFzIEhlbGxzdHJvbSAoVk13YXJlKSA8dGhvbWFzX29z
QHNoaXBtYWlsLm9yZz4KQWNrZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KQWNrZWQtYnk6IEFuZHJldyBNb3J0b24gPGFrcG1AbGludXgtZm91bmRhdGlv
bi5vcmc+Ci0tLQogaW5jbHVkZS9saW51eC9tbS5oIHwgMTcgKysrKysrKysrKysrKysrKysKIG1t
L2h1Z2VfbWVtb3J5LmMgICB8ICA2ICsrKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBi
L2luY2x1ZGUvbGludXgvbW0uaAppbmRleCBjNTRmYjk2Y2IxZTYuLmJkZDc5YTcyYmI0MiAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCisrKyBiL2luY2x1ZGUvbGludXgvbW0uaApAQCAt
Mjg2Nyw2ICsyODY3LDIzIEBAIGV4dGVybiBsb25nIGNvcHlfaHVnZV9wYWdlX2Zyb21fdXNlcihz
dHJ1Y3QgcGFnZSAqZHN0X3BhZ2UsCiAJCQkJY29uc3Qgdm9pZCBfX3VzZXIgKnVzcl9zcmMsCiAJ
CQkJdW5zaWduZWQgaW50IHBhZ2VzX3Blcl9odWdlX3BhZ2UsCiAJCQkJYm9vbCBhbGxvd19wYWdl
ZmF1bHQpOworCisvKioKKyAqIHZtYV9pc19zcGVjaWFsX2h1Z2UgLSBBcmUgdHJhbnNodWdlIHBh
Z2UtdGFibGUgZW50cmllcyBjb25zaWRlcmVkIHNwZWNpYWw/CisgKiBAdm1hOiBQb2ludGVyIHRv
IHRoZSBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgdG8gY29uc2lkZXIKKyAqCisgKiBXaGV0aGVyIHRy
YW5zaHVnZSBwYWdlLXRhYmxlIGVudHJpZXMgYXJlIGNvbnNpZGVyZWQgInNwZWNpYWwiIGZvbGxv
d2luZworICogdGhlIGRlZmluaXRpb24gaW4gdm1fbm9ybWFsX3BhZ2UoKS4KKyAqCisgKiBSZXR1
cm46IHRydWUgaWYgdHJhbnNodWdlIHBhZ2UtdGFibGUgZW50cmllcyBzaG91bGQgYmUgY29uc2lk
ZXJlZCBzcGVjaWFsLAorICogZmFsc2Ugb3RoZXJ3aXNlLgorICovCitzdGF0aWMgaW5saW5lIGJv
b2wgdm1hX2lzX3NwZWNpYWxfaHVnZShjb25zdCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkK
K3sKKwlyZXR1cm4gdm1hX2lzX2RheCh2bWEpIHx8ICh2bWEtPnZtX2ZpbGUgJiYKKwkJCQkgICAo
dm1hLT52bV9mbGFncyAmIChWTV9QRk5NQVAgfCBWTV9NSVhFRE1BUCkpKTsKK30KKwogI2VuZGlm
IC8qIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSB8fCBDT05GSUdfSFVHRVRMQkZTICovCiAK
ICNpZmRlZiBDT05GSUdfREVCVUdfUEFHRUFMTE9DCmRpZmYgLS1naXQgYS9tbS9odWdlX21lbW9y
eS5jIGIvbW0vaHVnZV9tZW1vcnkuYwppbmRleCAyNGFkNTNiNGRmYzAuLjE5YzhkNDYyYWIwOCAx
MDA2NDQKLS0tIGEvbW0vaHVnZV9tZW1vcnkuYworKysgYi9tbS9odWdlX21lbW9yeS5jCkBAIC0x
ODAyLDcgKzE4MDIsNyBAQCBpbnQgemFwX2h1Z2VfcG1kKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIs
IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCW9yaWdfcG1kID0gcG1kcF9odWdlX2dldF9h
bmRfY2xlYXJfZnVsbCh0bGItPm1tLCBhZGRyLCBwbWQsCiAJCQl0bGItPmZ1bGxtbSk7CiAJdGxi
X3JlbW92ZV9wbWRfdGxiX2VudHJ5KHRsYiwgcG1kLCBhZGRyKTsKLQlpZiAodm1hX2lzX2RheCh2
bWEpKSB7CisJaWYgKHZtYV9pc19zcGVjaWFsX2h1Z2Uodm1hKSkgewogCQlpZiAoYXJjaF9uZWVk
c19wZ3RhYmxlX2RlcG9zaXQoKSkKIAkJCXphcF9kZXBvc2l0ZWRfdGFibGUodGxiLT5tbSwgcG1k
KTsKIAkJc3Bpbl91bmxvY2socHRsKTsKQEAgLTIwNjYsNyArMjA2Niw3IEBAIGludCB6YXBfaHVn
ZV9wdWQoc3RydWN0IG1tdV9nYXRoZXIgKnRsYiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEs
CiAJICovCiAJcHVkcF9odWdlX2dldF9hbmRfY2xlYXJfZnVsbCh0bGItPm1tLCBhZGRyLCBwdWQs
IHRsYi0+ZnVsbG1tKTsKIAl0bGJfcmVtb3ZlX3B1ZF90bGJfZW50cnkodGxiLCBwdWQsIGFkZHIp
OwotCWlmICh2bWFfaXNfZGF4KHZtYSkpIHsKKwlpZiAodm1hX2lzX3NwZWNpYWxfaHVnZSh2bWEp
KSB7CiAJCXNwaW5fdW5sb2NrKHB0bCk7CiAJCS8qIE5vIHplcm8gcGFnZSBzdXBwb3J0IHlldCAq
LwogCX0gZWxzZSB7CkBAIC0yMTc1LDcgKzIxNzUsNyBAQCBzdGF0aWMgdm9pZCBfX3NwbGl0X2h1
Z2VfcG1kX2xvY2tlZChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgcG1kX3QgKnBtZCwKIAkJ
ICovCiAJCWlmIChhcmNoX25lZWRzX3BndGFibGVfZGVwb3NpdCgpKQogCQkJemFwX2RlcG9zaXRl
ZF90YWJsZShtbSwgcG1kKTsKLQkJaWYgKHZtYV9pc19kYXgodm1hKSkKKwkJaWYgKHZtYV9pc19z
cGVjaWFsX2h1Z2Uodm1hKSkKIAkJCXJldHVybjsKIAkJcGFnZSA9IHBtZF9wYWdlKF9wbWQpOwog
CQlpZiAoIVBhZ2VEaXJ0eShwYWdlKSAmJiBwbWRfZGlydHkoX3BtZCkpCi0tIAoyLjIxLjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
