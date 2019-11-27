Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EABF910B353
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 17:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1B40896E9;
	Wed, 27 Nov 2019 16:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03F27896C4;
 Wed, 27 Nov 2019 16:32:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 08:32:49 -0800
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; d="scan'208";a="211806937"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 08:32:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/13] drm/fb-helper: don't preserve fb_ops across deferred IO
 use
Date: Wed, 27 Nov 2019 18:31:58 +0200
Message-Id: <e2b1685703878612093a37189d37685303fa15e9.1574871797.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1574871797.git.jani.nikula@intel.com>
References: <cover.1574871797.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVmZXJyZWQgSU8gbm93IHByZXNlcnZlcyB0aGUgZmJfb3BzLgoKQ2M6IE5vcmFsZiBUcsO4bm5l
cyA8bm9yYWxmQHRyb25uZXMub3JnPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgfCAxOCArKy0tLS0tLS0tLS0tLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZiX2hlbHBlci5jCmluZGV4IDBjMDg4ZWE3MGFkMC4uYTVhMmE1MzhkMDg1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZmJfaGVscGVyLmMKQEAgLTE5NTQsNyArMTk1NCw2IEBAIHN0YXRpYyBpbnQgZHJtX2Zi
ZGV2X2ZiX3JlbGVhc2Uoc3RydWN0IGZiX2luZm8gKmluZm8sIGludCB1c2VyKQogc3RhdGljIHZv
aWQgZHJtX2ZiZGV2X2NsZWFudXAoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlcikKIHsK
IAlzdHJ1Y3QgZmJfaW5mbyAqZmJpID0gZmJfaGVscGVyLT5mYmRldjsKLQlzdHJ1Y3QgZmJfb3Bz
ICpmYm9wcyA9IE5VTEw7CiAJdm9pZCAqc2hhZG93ID0gTlVMTDsKIAogCWlmICghZmJfaGVscGVy
LT5kZXYpCkBAIC0xOTYzLDE1ICsxOTYyLDExIEBAIHN0YXRpYyB2b2lkIGRybV9mYmRldl9jbGVh
bnVwKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIpCiAJaWYgKGZiaSAmJiBmYmktPmZi
ZGVmaW8pIHsKIAkJZmJfZGVmZXJyZWRfaW9fY2xlYW51cChmYmkpOwogCQlzaGFkb3cgPSBmYmkt
PnNjcmVlbl9idWZmZXI7Ci0JCWZib3BzID0gZmJpLT5mYm9wczsKIAl9CiAKIAlkcm1fZmJfaGVs
cGVyX2ZpbmkoZmJfaGVscGVyKTsKIAotCWlmIChzaGFkb3cpIHsKLQkJdmZyZWUoc2hhZG93KTsK
LQkJa2ZyZWUoZmJvcHMpOwotCX0KKwl2ZnJlZShzaGFkb3cpOwogCiAJZHJtX2NsaWVudF9mcmFt
ZWJ1ZmZlcl9kZWxldGUoZmJfaGVscGVyLT5idWZmZXIpOwogfQpAQCAtMjA2MiwyMyArMjA1Nywx
NCBAQCBzdGF0aWMgaW50IGRybV9mYl9oZWxwZXJfZ2VuZXJpY19wcm9iZShzdHJ1Y3QgZHJtX2Zi
X2hlbHBlciAqZmJfaGVscGVyLAogCWRybV9mYl9oZWxwZXJfZmlsbF9pbmZvKGZiaSwgZmJfaGVs
cGVyLCBzaXplcyk7CiAKIAlpZiAoZHJtX2ZiZGV2X3VzZV9zaGFkb3dfZmIoZmJfaGVscGVyKSkg
ewotCQlzdHJ1Y3QgZmJfb3BzICpmYm9wczsKIAkJdm9pZCAqc2hhZG93OwogCi0JCS8qCi0JCSAq
IGZiX2RlZmVycmVkX2lvX2NsZWFudXAoKSBjbGVhcnMgJmZib3BzLT5mYl9tbWFwIHNvIGEgcGVy
Ci0JCSAqIGluc3RhbmNlIHZlcnNpb24gaXMgbmVjZXNzYXJ5LgotCQkgKi8KLQkJZmJvcHMgPSBr
emFsbG9jKHNpemVvZigqZmJvcHMpLCBHRlBfS0VSTkVMKTsKIAkJc2hhZG93ID0gdnphbGxvYyhm
YmktPnNjcmVlbl9zaXplKTsKLQkJaWYgKCFmYm9wcyB8fCAhc2hhZG93KSB7Ci0JCQlrZnJlZShm
Ym9wcyk7CisJCWlmICghc2hhZG93KSB7CiAJCQl2ZnJlZShzaGFkb3cpOwogCQkJcmV0dXJuIC1F
Tk9NRU07CiAJCX0KIAotCQkqZmJvcHMgPSAqZmJpLT5mYm9wczsKLQkJZmJpLT5mYm9wcyA9IGZi
b3BzOwogCQlmYmktPnNjcmVlbl9idWZmZXIgPSBzaGFkb3c7CiAJCWZiaS0+ZmJkZWZpbyA9ICZk
cm1fZmJkZXZfZGVmaW87CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
