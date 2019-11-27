Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62E9310ABCB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 09:32:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD89E6E4C4;
	Wed, 27 Nov 2019 08:32:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A254A6E372
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Nov 2019 08:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 292EE4883D;
 Wed, 27 Nov 2019 09:32:11 +0100 (CET)
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
 with ESMTP id iq7bkShjapaB; Wed, 27 Nov 2019 09:32:05 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 1D7CC4883B;
 Wed, 27 Nov 2019 09:32:02 +0100 (CET)
Received: from localhost.localdomain.localdomain
 (h-205-35.A357.priv.bahnhof.se [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 57F8A36018E;
 Wed, 27 Nov 2019 09:32:02 +0100 (CET)
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m=20=28VMware=29?=
 <thomas_os@shipmail.org>
To: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-graphics-maintainer@vmware.com
Subject: [RFC PATCH 1/7] mm: Introduce vma_is_special_huge
Date: Wed, 27 Nov 2019 09:31:14 +0100
Message-Id: <20191127083120.34611-2-thomas_os@shipmail.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191127083120.34611-1-thomas_os@shipmail.org>
References: <20191127083120.34611-1-thomas_os@shipmail.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1574843522; bh=aUknBP5TMwHTD1Ho6FduiImiKueQK6RP0Wp2FjTJP7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OWxSqdHsqdDBZLL1PoajVjb+07gXT7ZBdJmDWogLODVEPCHIxqhwtXz9Be4xTivom
 Z/1/ENm5vhykMYu9z3kTXqnQC9uOOtkJePaYEgqNu7mhFFBFIILHXkZA2zSC55G14a
 vRGoCITzIBOgK3N7MDlPUt6ry/PK3s4dxhU8hUrQ=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=OWxSqdHs; 
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
bW0uaAppbmRleCAyOTU3NWQzYzFlNDcuLjFlZTQ1ZWYzMDZkOCAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS9saW51eC9tbS5oCisrKyBiL2luY2x1ZGUvbGludXgvbW0uaApAQCAtMjgzOCw2ICsyODM4LDEy
IEBAIGV4dGVybiBsb25nIGNvcHlfaHVnZV9wYWdlX2Zyb21fdXNlcihzdHJ1Y3QgcGFnZSAqZHN0
X3BhZ2UsCiAJCQkJY29uc3Qgdm9pZCBfX3VzZXIgKnVzcl9zcmMsCiAJCQkJdW5zaWduZWQgaW50
IHBhZ2VzX3Blcl9odWdlX3BhZ2UsCiAJCQkJYm9vbCBhbGxvd19wYWdlZmF1bHQpOworc3RhdGlj
IGlubGluZSBib29sIHZtYV9pc19zcGVjaWFsX2h1Z2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWEpCit7CisJcmV0dXJuIHZtYV9pc19kYXgodm1hKSB8fCAodm1hLT52bV9maWxlICYmCisJCQkJ
ICAgKHZtYS0+dm1fZmxhZ3MgJiAoVk1fUEZOTUFQIHwgVk1fTUlYRURNQVApKSk7Cit9CisKICNl
bmRpZiAvKiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0UgfHwgQ09ORklHX0hVR0VUTEJGUyAq
LwogCiAjaWZkZWYgQ09ORklHX0RFQlVHX1BBR0VBTExPQwpkaWZmIC0tZ2l0IGEvbW0vaHVnZV9t
ZW1vcnkuYyBiL21tL2h1Z2VfbWVtb3J5LmMKaW5kZXggMTNjYzkzNzg1MDA2Li4zYzgzNDY3ZjA5
YjIgMTAwNjQ0Ci0tLSBhL21tL2h1Z2VfbWVtb3J5LmMKKysrIGIvbW0vaHVnZV9tZW1vcnkuYwpA
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
