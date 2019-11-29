Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F8B10D400
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 11:30:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929DA6E8A8;
	Fri, 29 Nov 2019 10:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 463F16E8A8;
 Fri, 29 Nov 2019 10:30:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:30:10 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="212283011"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:30:07 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2 02/14] drm/fb-helper: don't preserve fb_ops across deferred
 IO use
Date: Fri, 29 Nov 2019 12:29:32 +0200
Message-Id: <1eae0b23d4724d5702b886b6a061ec8219eb9284.1575022735.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RGVmZXJyZWQgSU8gbm93IHByZXNlcnZlcyB0aGUgZmJfb3BzLgoKdjI6IFJlbW92ZSB0aGUgbm8t
b3AgdmZyZWUsIGRyb3AgYSBsb2NhbCB2YXIgIChOb3JhbGYpCgpDYzogTm9yYWxmIFRyw7hubmVz
IDxub3JhbGZAdHJvbm5lcy5vcmc+CkNjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
ClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWdu
ZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgfCAyNSArKystLS0tLS0tLS0tLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9mYl9oZWxwZXIuYwppbmRleCAwYzA4OGVhNzBhZDAuLjE3NTFiYjllZThkOCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiX2hlbHBlci5jCkBAIC0xOTU0LDcgKzE5NTQsNiBAQCBzdGF0aWMgaW50IGRybV9m
YmRldl9mYl9yZWxlYXNlKHN0cnVjdCBmYl9pbmZvICppbmZvLCBpbnQgdXNlcikKIHN0YXRpYyB2
b2lkIGRybV9mYmRldl9jbGVhbnVwKHN0cnVjdCBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIpCiB7
CiAJc3RydWN0IGZiX2luZm8gKmZiaSA9IGZiX2hlbHBlci0+ZmJkZXY7Ci0Jc3RydWN0IGZiX29w
cyAqZmJvcHMgPSBOVUxMOwogCXZvaWQgKnNoYWRvdyA9IE5VTEw7CiAKIAlpZiAoIWZiX2hlbHBl
ci0+ZGV2KQpAQCAtMTk2MywxNSArMTk2MiwxMSBAQCBzdGF0aWMgdm9pZCBkcm1fZmJkZXZfY2xl
YW51cChzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyKQogCWlmIChmYmkgJiYgZmJpLT5m
YmRlZmlvKSB7CiAJCWZiX2RlZmVycmVkX2lvX2NsZWFudXAoZmJpKTsKIAkJc2hhZG93ID0gZmJp
LT5zY3JlZW5fYnVmZmVyOwotCQlmYm9wcyA9IGZiaS0+ZmJvcHM7CiAJfQogCiAJZHJtX2ZiX2hl
bHBlcl9maW5pKGZiX2hlbHBlcik7CiAKLQlpZiAoc2hhZG93KSB7Ci0JCXZmcmVlKHNoYWRvdyk7
Ci0JCWtmcmVlKGZib3BzKTsKLQl9CisJdmZyZWUoc2hhZG93KTsKIAogCWRybV9jbGllbnRfZnJh
bWVidWZmZXJfZGVsZXRlKGZiX2hlbHBlci0+YnVmZmVyKTsKIH0KQEAgLTIwNjIsMjQgKzIwNTcs
MTAgQEAgc3RhdGljIGludCBkcm1fZmJfaGVscGVyX2dlbmVyaWNfcHJvYmUoc3RydWN0IGRybV9m
Yl9oZWxwZXIgKmZiX2hlbHBlciwKIAlkcm1fZmJfaGVscGVyX2ZpbGxfaW5mbyhmYmksIGZiX2hl
bHBlciwgc2l6ZXMpOwogCiAJaWYgKGRybV9mYmRldl91c2Vfc2hhZG93X2ZiKGZiX2hlbHBlcikp
IHsKLQkJc3RydWN0IGZiX29wcyAqZmJvcHM7Ci0JCXZvaWQgKnNoYWRvdzsKLQotCQkvKgotCQkg
KiBmYl9kZWZlcnJlZF9pb19jbGVhbnVwKCkgY2xlYXJzICZmYm9wcy0+ZmJfbW1hcCBzbyBhIHBl
cgotCQkgKiBpbnN0YW5jZSB2ZXJzaW9uIGlzIG5lY2Vzc2FyeS4KLQkJICovCi0JCWZib3BzID0g
a3phbGxvYyhzaXplb2YoKmZib3BzKSwgR0ZQX0tFUk5FTCk7Ci0JCXNoYWRvdyA9IHZ6YWxsb2Mo
ZmJpLT5zY3JlZW5fc2l6ZSk7Ci0JCWlmICghZmJvcHMgfHwgIXNoYWRvdykgewotCQkJa2ZyZWUo
ZmJvcHMpOwotCQkJdmZyZWUoc2hhZG93KTsKKwkJZmJpLT5zY3JlZW5fYnVmZmVyID0gdnphbGxv
YyhmYmktPnNjcmVlbl9zaXplKTsKKwkJaWYgKCFmYmktPnNjcmVlbl9idWZmZXIpCiAJCQlyZXR1
cm4gLUVOT01FTTsKLQkJfQogCi0JCSpmYm9wcyA9ICpmYmktPmZib3BzOwotCQlmYmktPmZib3Bz
ID0gZmJvcHM7Ci0JCWZiaS0+c2NyZWVuX2J1ZmZlciA9IHNoYWRvdzsKIAkJZmJpLT5mYmRlZmlv
ID0gJmRybV9mYmRldl9kZWZpbzsKIAogCQlmYl9kZWZlcnJlZF9pb19pbml0KGZiaSk7Ci0tIAoy
LjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
