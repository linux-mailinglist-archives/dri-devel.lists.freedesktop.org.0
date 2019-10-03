Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F01CB56B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE19489DB7;
	Fri,  4 Oct 2019 07:39:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6224E6EA7D
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 20:20:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E0BE4B03B;
 Thu,  3 Oct 2019 20:20:21 +0000 (UTC)
From: Davidlohr Bueso <dave@stgolabs.net>
To: akpm@linux-foundation.org
Subject: [PATCH 05/11] IB/hfi1: convert __mmu_int_rb to half closed intervals
Date: Thu,  3 Oct 2019 13:18:52 -0700
Message-Id: <20191003201858.11666-6-dave@stgolabs.net>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191003201858.11666-1-dave@stgolabs.net>
References: <20191003201858.11666-1-dave@stgolabs.net>
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
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
Cc: Mike Marciniszyn <mike.marciniszyn@intel.com>, dave@stgolabs.net,
 Davidlohr Bueso <dbueso@suse.de>, peterz@infradead.org,
 Dennis Dalessandro <dennis.dalessandro@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Doug Ledford <dledford@redhat.com>, walken@google.com,
 linux-rdma@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIF9fbW11X2ludF9yYiBpbnRlcnZhbCB0cmVlIHJlYWxseSB3YW50cyBbYSwgYikgaW50ZXJ2
YWxzLApub3QgZnVsbHkgY2xvc2VkIGFzIGN1cnJlbnRseS4gQXMgc3VjaCBjb252ZXJ0IGl0IHRv
IHVzZSB0aGUgbmV3CmludGVydmFsX3RyZWVfZ2VuLmguCgpDYzogTWlrZSBNYXJjaW5pc3p5biA8
bWlrZS5tYXJjaW5pc3p5bkBpbnRlbC5jb20+CkNjOiBEZW5uaXMgRGFsZXNzYW5kcm8gPGRlbm5p
cy5kYWxlc3NhbmRyb0BpbnRlbC5jb20+CkNjOiBEb3VnIExlZGZvcmQgPGRsZWRmb3JkQHJlZGhh
dC5jb20+CkNjOiBsaW51eC1yZG1hQHZnZXIua2VybmVsLm9yZwpTaWduZWQtb2ZmLWJ5OiBEYXZp
ZGxvaHIgQnVlc28gPGRidWVzb0BzdXNlLmRlPgotLS0KIGRyaXZlcnMvaW5maW5pYmFuZC9ody9o
ZmkxL21tdV9yYi5jIHwgMTUgKysrKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5maW5pYmFu
ZC9ody9oZmkxL21tdV9yYi5jIGIvZHJpdmVycy9pbmZpbmliYW5kL2h3L2hmaTEvbW11X3JiLmMK
aW5kZXggMTRkMmE5MDk2NGMzLi5mYjYzODJiMmQ0NGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5m
aW5pYmFuZC9ody9oZmkxL21tdV9yYi5jCisrKyBiL2RyaXZlcnMvaW5maW5pYmFuZC9ody9oZmkx
L21tdV9yYi5jCkBAIC00Nyw3ICs0Nyw3IEBACiAjaW5jbHVkZSA8bGludXgvbGlzdC5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3JjdWxpc3QuaD4KICNpbmNsdWRlIDxsaW51eC9tbXVfbm90aWZpZXIuaD4K
LSNpbmNsdWRlIDxsaW51eC9pbnRlcnZhbF90cmVlX2dlbmVyaWMuaD4KKyNpbmNsdWRlIDxsaW51
eC9pbnRlcnZhbF90cmVlX2dlbi5oPgogCiAjaW5jbHVkZSAibW11X3JiLmgiCiAjaW5jbHVkZSAi
dHJhY2UuaCIKQEAgLTg5LDcgKzg5LDcgQEAgc3RhdGljIHVuc2lnbmVkIGxvbmcgbW11X25vZGVf
c3RhcnQoc3RydWN0IG1tdV9yYl9ub2RlICpub2RlKQogCiBzdGF0aWMgdW5zaWduZWQgbG9uZyBt
bXVfbm9kZV9sYXN0KHN0cnVjdCBtbXVfcmJfbm9kZSAqbm9kZSkKIHsKLQlyZXR1cm4gUEFHRV9B
TElHTihub2RlLT5hZGRyICsgbm9kZS0+bGVuKSAtIDE7CisJcmV0dXJuIFBBR0VfQUxJR04obm9k
ZS0+YWRkciArIG5vZGUtPmxlbik7CiB9CiAKIGludCBoZmkxX21tdV9yYl9yZWdpc3Rlcih2b2lk
ICpvcHNfYXJnLCBzdHJ1Y3QgbW1fc3RydWN0ICptbSwKQEAgLTE5NSwxMyArMTk1LDEzIEBAIHN0
YXRpYyBzdHJ1Y3QgbW11X3JiX25vZGUgKl9fbW11X3JiX3NlYXJjaChzdHJ1Y3QgbW11X3JiX2hh
bmRsZXIgKmhhbmRsZXIsCiAJdHJhY2VfaGZpMV9tbXVfcmJfc2VhcmNoKGFkZHIsIGxlbik7CiAJ
aWYgKCFoYW5kbGVyLT5vcHMtPmZpbHRlcikgewogCQlub2RlID0gX19tbXVfaW50X3JiX2l0ZXJf
Zmlyc3QoJmhhbmRsZXItPnJvb3QsIGFkZHIsCi0JCQkJCSAgICAgICAoYWRkciArIGxlbikgLSAx
KTsKKwkJCQkJICAgICAgIGFkZHIgKyBsZW4pOwogCX0gZWxzZSB7CiAJCWZvciAobm9kZSA9IF9f
bW11X2ludF9yYl9pdGVyX2ZpcnN0KCZoYW5kbGVyLT5yb290LCBhZGRyLAotCQkJCQkJICAgIChh
ZGRyICsgbGVuKSAtIDEpOworCQkJCQkJICAgIGFkZHIgKyBsZW4pOwogCQkgICAgIG5vZGU7CiAJ
CSAgICAgbm9kZSA9IF9fbW11X2ludF9yYl9pdGVyX25leHQobm9kZSwgYWRkciwKLQkJCQkJCSAg
IChhZGRyICsgbGVuKSAtIDEpKSB7CisJCQkJCQkgICBhZGRyICsgbGVuKSkgewogCQkJaWYgKGhh
bmRsZXItPm9wcy0+ZmlsdGVyKG5vZGUsIGFkZHIsIGxlbikpCiAJCQkJcmV0dXJuIG5vZGU7CiAJ
CX0KQEAgLTI5MywxMSArMjkzLDEwIEBAIHN0YXRpYyBpbnQgbW11X25vdGlmaWVyX3JhbmdlX3N0
YXJ0KHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLAogCWJvb2wgYWRkZWQgPSBmYWxzZTsKIAogCXNw
aW5fbG9ja19pcnFzYXZlKCZoYW5kbGVyLT5sb2NrLCBmbGFncyk7Ci0JZm9yIChub2RlID0gX19t
bXVfaW50X3JiX2l0ZXJfZmlyc3Qocm9vdCwgcmFuZ2UtPnN0YXJ0LCByYW5nZS0+ZW5kLTEpOwor
CWZvciAobm9kZSA9IF9fbW11X2ludF9yYl9pdGVyX2ZpcnN0KHJvb3QsIHJhbmdlLT5zdGFydCwg
cmFuZ2UtPmVuZCk7CiAJICAgICBub2RlOyBub2RlID0gcHRyKSB7CiAJCS8qIEd1YXJkIGFnYWlu
c3Qgbm9kZSByZW1vdmFsLiAqLwotCQlwdHIgPSBfX21tdV9pbnRfcmJfaXRlcl9uZXh0KG5vZGUs
IHJhbmdlLT5zdGFydCwKLQkJCQkJICAgICByYW5nZS0+ZW5kIC0gMSk7CisJCXB0ciA9IF9fbW11
X2ludF9yYl9pdGVyX25leHQobm9kZSwgcmFuZ2UtPnN0YXJ0LCByYW5nZS0+ZW5kKTsKIAkJdHJh
Y2VfaGZpMV9tbXVfbWVtX2ludmFsaWRhdGUobm9kZS0+YWRkciwgbm9kZS0+bGVuKTsKIAkJaWYg
KGhhbmRsZXItPm9wcy0+aW52YWxpZGF0ZShoYW5kbGVyLT5vcHNfYXJnLCBub2RlKSkgewogCQkJ
X19tbXVfaW50X3JiX3JlbW92ZShub2RlLCByb290KTsKLS0gCjIuMTYuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
