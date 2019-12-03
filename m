Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F5810FE9B
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 14:23:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08056E51C;
	Tue,  3 Dec 2019 13:23:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239AC6E519
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 13:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id B424C3F65E;
 Tue,  3 Dec 2019 14:22:59 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lW1SaHItLEle; Tue,  3 Dec 2019 14:22:51 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 0E91E3F610;
 Tue,  3 Dec 2019 14:22:49 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 2477C362501;
 Tue,  3 Dec 2019 14:22:49 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/8] mm: Introduce vma_is_special_huge
Date: Tue,  3 Dec 2019 14:22:32 +0100
Message-Id: <20191203132239.5910-2-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191203132239.5910-1-thomas_os@shipmail.org>
References: <20191203132239.5910-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575379369; bh=JLkkdIE9mprN8GszmhGEf0COfTe/iLFyFEMrXdJeUpE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fD1VKeNg8GgWU75/B8yZCyR4fAweMyzYoCBdGlgBABwa0v0rtZatx59rW9V+oH5+I
 X/u2wOi68BCMLbgUQHLJA/uTRYAVJToL6GL85BWR1nN8DqNyyu24Xm1pusiBsU7zWS
 pVJWQ1qy12we4/iUpNA2kapoMkAvQAV/q+IR0VHw=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=fD1VKeNg; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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
ZC5jb20+ClNpZ25lZC1vZmYtYnk6IFRob21hcyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJl
LmNvbT4KLS0tCiBpbmNsdWRlL2xpbnV4L21tLmggfCA2ICsrKysrKwogbW0vaHVnZV9tZW1vcnku
YyAgIHwgNiArKystLS0KIDIgZmlsZXMgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgv
bW0uaAppbmRleCAwMTMzNTQyZDY5YzkuLjg4NmExZjg5OTg4NyAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9tbS5oCisrKyBiL2luY2x1ZGUvbGludXgvbW0uaApAQCAtMjgyMiw2ICsyODIyLDEy
IEBAIGV4dGVybiBsb25nIGNvcHlfaHVnZV9wYWdlX2Zyb21fdXNlcihzdHJ1Y3QgcGFnZSAqZHN0
X3BhZ2UsCiAJCQkJY29uc3Qgdm9pZCBfX3VzZXIgKnVzcl9zcmMsCiAJCQkJdW5zaWduZWQgaW50
IHBhZ2VzX3Blcl9odWdlX3BhZ2UsCiAJCQkJYm9vbCBhbGxvd19wYWdlZmF1bHQpOworc3RhdGlj
IGlubGluZSBib29sIHZtYV9pc19zcGVjaWFsX2h1Z2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEpCit7CisJcmV0dXJuIHZtYV9pc19kYXgodm1hKSB8fCAodm1hLT52bV9maWxlICYmCisJCQkJ
ICAgKHZtYS0+dm1fZmxhZ3MgJiAoVk1fUEZOTUFQIHwgVk1fTUlYRURNQVApKSk7Cit9CisKICNl
bmRpZiAvKiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UgfHwgQ09ORklHX0hVR0VUTEJGUyAq
LwogCiAjaWZkZWYgQ09ORklHX0RFQlVHX1BBR0VBTExPQwpkaWZmIC0tZ2l0IGEvbW0vaHVnZV9t
ZW1vcnkuYyBiL21tL2h1Z2VfbWVtb3J5LmMKaW5kZXggNDFhMGZiZGRjOTZiLi5mOGQyNGZjM2Y0
ZGYgMTAwNjQ0Ci0tLSBhL21tL2h1Z2VfbWVtb3J5LmMKKysrIGIvbW0vaHVnZV9tZW1vcnkuYwpA
QCAtMTc4OSw3ICsxNzg5LDcgQEAgaW50IHphcF9odWdlX3BtZChzdHJ1Y3QgbW11X2dhdGhlciAq
dGxiLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAlvcmlnX3BtZCA9IHBtZHBfaHVnZV9n
ZXRfYW5kX2NsZWFyX2Z1bGwodGxiLT5tbSwgYWRkciwgcG1kLAogCQkJdGxiLT5mdWxsbW0pOwog
CXRsYl9yZW1vdmVfcG1kX3RsYl9lbnRyeSh0bGIsIHBtZCwgYWRkcik7Ci0JaWYgKHZtYV9pc19k
YXgodm1hKSkgeworCWlmICh2bWFfaXNfc3BlY2lhbF9odWdlKHZtYSkpIHsKIAkJaWYgKGFyY2hf
bmVlZHNfcGd0YWJsZV9kZXBvc2l0KCkpCiAJCQl6YXBfZGVwb3NpdGVkX3RhYmxlKHRsYi0+bW0s
IHBtZCk7CiAJCXNwaW5fdW5sb2NrKHB0bCk7CkBAIC0yMDUzLDcgKzIwNTMsNyBAQCBpbnQgemFw
X2h1Z2VfcHVkKHN0cnVjdCBtbXVfZ2F0aGVyICp0bGIsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLAogCSAqLwogCXB1ZHBfaHVnZV9nZXRfYW5kX2NsZWFyX2Z1bGwodGxiLT5tbSwgYWRkciwg
cHVkLCB0bGItPmZ1bGxtbSk7CiAJdGxiX3JlbW92ZV9wdWRfdGxiX2VudHJ5KHRsYiwgcHVkLCBh
ZGRyKTsKLQlpZiAodm1hX2lzX2RheCh2bWEpKSB7CisJaWYgKHZtYV9pc19zcGVjaWFsX2h1Z2Uo
dm1hKSkgewogCQlzcGluX3VubG9jayhwdGwpOwogCQkvKiBObyB6ZXJvIHBhZ2Ugc3VwcG9ydCB5
ZXQgKi8KIAl9IGVsc2UgewpAQCAtMjE2Miw3ICsyMTYyLDcgQEAgc3RhdGljIHZvaWQgX19zcGxp
dF9odWdlX3BtZF9sb2NrZWQoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsIHBtZF90ICpwbWQs
CiAJCSAqLwogCQlpZiAoYXJjaF9uZWVkc19wZ3RhYmxlX2RlcG9zaXQoKSkKIAkJCXphcF9kZXBv
c2l0ZWRfdGFibGUobW0sIHBtZCk7Ci0JCWlmICh2bWFfaXNfZGF4KHZtYSkpCisJCWlmICh2bWFf
aXNfc3BlY2lhbF9odWdlKHZtYSkpCiAJCQlyZXR1cm47CiAJCXBhZ2UgPSBwbWRfcGFnZShfcG1k
KTsKIAkJaWYgKCFQYWdlRGlydHkocGFnZSkgJiYgcG1kX2RpcnR5KF9wbWQpKQotLSAKMi4yMS4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
