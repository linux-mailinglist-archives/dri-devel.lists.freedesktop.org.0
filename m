Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B15484D8C
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 15:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C13389D43;
	Wed,  7 Aug 2019 13:38:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A0089CE3
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 13:38:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Aug 2019 06:37:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,357,1559545200"; d="scan'208";a="176196872"
Received: from unknown (HELO delly.ger.corp.intel.com) ([10.252.52.138])
 by fmsmga007.fm.intel.com with ESMTP; 07 Aug 2019 06:37:52 -0700
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/syncobj: add submit point query capability
Date: Wed,  7 Aug 2019 16:37:45 +0300
Message-Id: <20190807133745.4110-3-lionel.g.landwerlin@intel.com>
X-Mailer: git-send-email 2.23.0.rc1
In-Reply-To: <20190807133745.4110-1-lionel.g.landwerlin@intel.com>
References: <20190807133745.4110-1-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
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
Cc: zhoucm1@amd.com, Christian.Koenig@amd.com, jason@jlekstrand.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBmZWF0dXJlIHdhcyB0YWxrZWQgYWJvdXQgYnkgRGF2aWQuIEl0IGFsbG93cyB1c2Vyc3Bh
Y2UgdG8gcXVlcnkKdGhlIGxhc3Qgc3VibWl0dGVkIHBvaW50IG9uIGEgdGltZWxpbmUuCgpGb2xs
b3dpbmcgdGhlIHByZXZpb3VzIGNvbW1pdCBpdCBtYWRlIHNlbnNlIHRvIGFkZCBpdC4KClNpZ25l
ZC1vZmYtYnk6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5sYW5kd2VybGluQGludGVsLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyB8IDE1ICsrKysrKysrKysrKysr
LQogaW5jbHVkZS91YXBpL2RybS9kcm0uaCAgICAgICAgfCAgMSArCiAyIGZpbGVzIGNoYW5nZWQs
IDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX3N5bmNvYmouYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jCmluZGV4
IGM0MzdmYjZhYWY3Yy4uYWQyZjU2NzJkNzA3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX3N5bmNvYmouYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwpAQCAtMTI5
MSw3ICsxMjkxLDggQEAgaW50IGRybV9zeW5jb2JqX3F1ZXJ5X2lvY3RsKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJCXJldHVybiAtRU9QTk9UU1VQUDsKIAogCWlmIChhcmdz
LT5zZWxlY3RvciAhPSBEUk1fU1lOQ09CSl9USU1FTElORV9BUlJBWV9TRUxFQ1RPUl9TSUdOQUxF
RF9QT0lOVCAmJgotCSAgICBhcmdzLT5zZWxlY3RvciAhPSBEUk1fU1lOQ09CSl9USU1FTElORV9B
UlJBWV9TRUxFQ1RPUl9TSURFQkFORF9QQVlMT0FEKQorCSAgICBhcmdzLT5zZWxlY3RvciAhPSBE
Uk1fU1lOQ09CSl9USU1FTElORV9BUlJBWV9TRUxFQ1RPUl9TSURFQkFORF9QQVlMT0FEICYmCisJ
ICAgIGFyZ3MtPnNlbGVjdG9yICE9IERSTV9TWU5DT0JKX1RJTUVMSU5FX0FSUkFZX1NFTEVDVE9S
X1NVQk1JVF9QT0lOVCkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAlpZiAoYXJncy0+Y291bnRfaGFu
ZGxlcyA9PSAwKQpAQCAtMTM0Niw2ICsxMzQ3LDE4IEBAIGludCBkcm1fc3luY29ial9xdWVyeV9p
b2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCQkJaWYgKHJldCkKIAkJ
CQlnb3RvIGVycm9yOwogCQkJYnJlYWs7CisKKwkJY2FzZSBEUk1fU1lOQ09CSl9USU1FTElORV9B
UlJBWV9TRUxFQ1RPUl9TVUJNSVRfUE9JTlQ6CisJCQlmZW5jZSA9IGRybV9zeW5jb2JqX2ZlbmNl
X2dldChzeW5jb2Jqc1tpXSk7CisJCQljaGFpbiA9IHRvX2RtYV9mZW5jZV9jaGFpbihmZW5jZSk7
CisJCQlwb2ludCA9IGNoYWluID8gY2hhaW4tPmJhc2Uuc2Vxbm8gOiAwOworCQkJZG1hX2ZlbmNl
X3B1dChmZW5jZSk7CisKKwkJCXJldCA9IGNvcHlfdG9fdXNlcigmcG9pbnRzW2ldLCAmcG9pbnQs
IHNpemVvZih1aW50NjRfdCkpOworCQkJcmV0ID0gcmV0ID8gLUVGQVVMVCA6IDA7CisJCQlpZiAo
cmV0KQorCQkJCWdvdG8gZXJyb3I7CisJCQlicmVhazsKIAkJfQogCX0KIApkaWZmIC0tZ2l0IGEv
aW5jbHVkZS91YXBpL2RybS9kcm0uaCBiL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmgKaW5kZXggZGVh
NzU5YTM2ZDM3Li4zYjhjZGIzZmZhOTQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFwaS9kcm0vZHJt
LmgKKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm0uaApAQCAtNzg1LDYgKzc4NSw3IEBAIHN0cnVj
dCBkcm1fc3luY29ial90aW1lbGluZV9hcnJheSB7CiAJX191MzIgc2VsZWN0b3I7CiAjZGVmaW5l
IERSTV9TWU5DT0JKX1RJTUVMSU5FX0FSUkFZX1NFTEVDVE9SX1NJR05BTEVEX1BPSU5UICAgKDAp
CiAjZGVmaW5lIERSTV9TWU5DT0JKX1RJTUVMSU5FX0FSUkFZX1NFTEVDVE9SX1NJREVCQU5EX1BB
WUxPQUQgKDEpCisjZGVmaW5lIERSTV9TWU5DT0JKX1RJTUVMSU5FX0FSUkFZX1NFTEVDVE9SX1NV
Qk1JVF9QT0lOVCAgICAgKDIpCiB9OwogCiAKLS0gCjIuMjMuMC5yYzEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
