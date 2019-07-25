Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D21758DC
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 22:30:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B33976E82D;
	Thu, 25 Jul 2019 20:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBDB36E82D;
 Thu, 25 Jul 2019 20:30:46 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2F47985539;
 Thu, 25 Jul 2019 20:30:46 +0000 (UTC)
Received: from treble.redhat.com (ovpn-122-90.rdu2.redhat.com [10.10.122.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0FB6F5D772;
 Thu, 25 Jul 2019 20:30:44 +0000 (UTC)
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Remove redundant user_access_end() from
 __copy_from_user() error path
Date: Thu, 25 Jul 2019 15:29:57 -0500
Message-Id: <51a4155c5bc2ca847a9cbe85c1c11918bb193141.1564086017.git.jpoimboe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Thu, 25 Jul 2019 20:30:46 +0000 (UTC)
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
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Sedat Dilek <sedat.dilek@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Nathan Chancellor <natechancellor@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T2JqdG9vbCByZXBvcnRzOgoKICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhl
Y2J1ZmZlci5vOiB3YXJuaW5nOiBvYmp0b29sOiAuYWx0aW5zdHJfcmVwbGFjZW1lbnQrMHgzNjog
cmVkdW5kYW50IFVBQ0NFU1MgZGlzYWJsZQoKX19jb3B5X2Zyb21fdXNlcigpIGFscmVhZHkgZG9l
cyBib3RoIFNUQUMgYW5kIENMQUMsIHNvIHRoZQp1c2VyX2FjY2Vzc19lbmQoKSBpbiBpdHMgZXJy
b3IgcGF0aCBhZGRzIGFuIGV4dHJhIHVubmVjZXNzYXJ5IENMQUMuCgpGaXhlczogMGIyYzhmOGI2
YjBjICgiaTkxNTogZml4IG1pc3NpbmcgdXNlcl9hY2Nlc3NfZW5kKCkgaW4gcGFnZSBmYXVsdCBl
eGNlcHRpb24gY2FzZSIpClJlcG9ydGVkLWJ5OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRy
b25peC5kZT4KUmVwb3J0ZWQtYnk6IFNlZGF0IERpbGVrIDxzZWRhdC5kaWxla0BnbWFpbC5jb20+
CkFja2VkLWJ5OiBQZXRlciBaaWpsc3RyYSAoSW50ZWwpIDxwZXRlcnpAaW5mcmFkZWFkLm9yZz4K
VGVzdGVkLWJ5OiBOaWNrIERlc2F1bG5pZXJzIDxuZGVzYXVsbmllcnNAZ29vZ2xlLmNvbT4KVGVz
dGVkLWJ5OiBTZWRhdCBEaWxlayA8c2VkYXQuZGlsZWtAZ21haWwuY29tPgpMaW5rOiBodHRwczov
L2dpdGh1Yi5jb20vQ2xhbmdCdWlsdExpbnV4L2xpbnV4L2lzc3Vlcy82MTcKU2lnbmVkLW9mZi1i
eTogSm9zaCBQb2ltYm9ldWYgPGpwb2ltYm9lQHJlZGhhdC5jb20+Ci0tLQogLi4uL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jICAgIHwgMjAgKysrKysrKysrLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMKaW5kZXggNWZh
ZTBlNTBhYWQwLi40MWRhYjllYTMzY2QgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2dlbS9pOTE1X2dlbV9leGVjYnVmZmVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX2V4ZWNidWZmZXIuYwpAQCAtMTYyOCw2ICsxNjI4LDcgQEAgc3RhdGljIGludCBj
aGVja19yZWxvY2F0aW9ucyhjb25zdCBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNfb2JqZWN0MiAq
ZW50cnkpCiAKIHN0YXRpYyBpbnQgZWJfY29weV9yZWxvY2F0aW9ucyhjb25zdCBzdHJ1Y3QgaTkx
NV9leGVjYnVmZmVyICplYikKIHsKKwlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX3JlbG9jYXRpb25fZW50
cnkgKnJlbG9jczsKIAljb25zdCB1bnNpZ25lZCBpbnQgY291bnQgPSBlYi0+YnVmZmVyX2NvdW50
OwogCXVuc2lnbmVkIGludCBpOwogCWludCBlcnI7CkBAIC0xNjM1LDcgKzE2MzYsNiBAQCBzdGF0
aWMgaW50IGViX2NvcHlfcmVsb2NhdGlvbnMoY29uc3Qgc3RydWN0IGk5MTVfZXhlY2J1ZmZlciAq
ZWIpCiAJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKIAkJY29uc3QgdW5zaWduZWQgaW50
IG5yZWxvYyA9IGViLT5leGVjW2ldLnJlbG9jYXRpb25fY291bnQ7CiAJCXN0cnVjdCBkcm1faTkx
NV9nZW1fcmVsb2NhdGlvbl9lbnRyeSBfX3VzZXIgKnVyZWxvY3M7Ci0JCXN0cnVjdCBkcm1faTkx
NV9nZW1fcmVsb2NhdGlvbl9lbnRyeSAqcmVsb2NzOwogCQl1bnNpZ25lZCBsb25nIHNpemU7CiAJ
CXVuc2lnbmVkIGxvbmcgY29waWVkOwogCkBAIC0xNjYzLDE0ICsxNjYzLDggQEAgc3RhdGljIGlu
dCBlYl9jb3B5X3JlbG9jYXRpb25zKGNvbnN0IHN0cnVjdCBpOTE1X2V4ZWNidWZmZXIgKmViKQog
CiAJCQlpZiAoX19jb3B5X2Zyb21fdXNlcigoY2hhciAqKXJlbG9jcyArIGNvcGllZCwKIAkJCQkJ
ICAgICAoY2hhciBfX3VzZXIgKil1cmVsb2NzICsgY29waWVkLAotCQkJCQkgICAgIGxlbikpIHsK
LWVuZF91c2VyOgotCQkJCXVzZXJfYWNjZXNzX2VuZCgpOwotZW5kOgotCQkJCWt2ZnJlZShyZWxv
Y3MpOwotCQkJCWVyciA9IC1FRkFVTFQ7Ci0JCQkJZ290byBlcnI7Ci0JCQl9CisJCQkJCSAgICAg
bGVuKSkKKwkJCQlnb3RvIGVuZDsKIAogCQkJY29waWVkICs9IGxlbjsKIAkJfSB3aGlsZSAoY29w
aWVkIDwgc2l6ZSk7CkBAIC0xNjk5LDEwICsxNjkzLDE0IEBAIHN0YXRpYyBpbnQgZWJfY29weV9y
ZWxvY2F0aW9ucyhjb25zdCBzdHJ1Y3QgaTkxNV9leGVjYnVmZmVyICplYikKIAogCXJldHVybiAw
OwogCitlbmRfdXNlcjoKKwl1c2VyX2FjY2Vzc19lbmQoKTsKK2VuZDoKKwlrdmZyZWUocmVsb2Nz
KTsKKwllcnIgPSAtRUZBVUxUOwogZXJyOgogCXdoaWxlIChpLS0pIHsKLQkJc3RydWN0IGRybV9p
OTE1X2dlbV9yZWxvY2F0aW9uX2VudHJ5ICpyZWxvY3MgPQotCQkJdTY0X3RvX3B0cih0eXBlb2Yo
KnJlbG9jcyksIGViLT5leGVjW2ldLnJlbG9jc19wdHIpOworCQlyZWxvY3MgPSB1NjRfdG9fcHRy
KHR5cGVvZigqcmVsb2NzKSwgZWItPmV4ZWNbaV0ucmVsb2NzX3B0cik7CiAJCWlmIChlYi0+ZXhl
Y1tpXS5yZWxvY2F0aW9uX2NvdW50KQogCQkJa3ZmcmVlKHJlbG9jcyk7CiAJfQotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
