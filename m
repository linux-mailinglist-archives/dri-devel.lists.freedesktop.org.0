Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB20961ED9
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 14:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B990089CE2;
	Mon,  8 Jul 2019 12:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936D889CE1;
 Mon,  8 Jul 2019 12:53:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 05:53:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="159116983"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 08 Jul 2019 05:53:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 15:53:27 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 01/19] drm: Add drm_modeset_lock_assert_held()
Date: Mon,  8 Jul 2019 15:53:07 +0300
Message-Id: <20190708125325.16576-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190708125325.16576-1-ville.syrjala@linux.intel.com>
References: <20190708125325.16576-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFk
ZCBhIHNtYWxsIHdyYXBwZXIgYXJvdW5kIGxvY2tkZXBfYXNzZXJ0X2hlbGQoKSB0byBtYWtlCml0
IGEgYml0IG1vcmUgY29udmVudGluZXQgdG8gdXNlIHdpdGggbW9kZXNldCBsb2Nrcy4KClNpZ25l
ZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+
Ci0tLQogaW5jbHVkZS9kcm0vZHJtX21vZGVzZXRfbG9jay5oIHwgOSArKysrKysrKysKIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
bW9kZXNldF9sb2NrLmggYi9pbmNsdWRlL2RybS9kcm1fbW9kZXNldF9sb2NrLmgKaW5kZXggN2I4
ODQxMDY1YjExLi40ZmM5YTQzYWM0NWEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9tb2Rl
c2V0X2xvY2suaAorKysgYi9pbmNsdWRlL2RybS9kcm1fbW9kZXNldF9sb2NrLmgKQEAgLTExNCw2
ICsxMTQsMTUgQEAgc3RhdGljIGlubGluZSBib29sIGRybV9tb2Rlc2V0X2lzX2xvY2tlZChzdHJ1
Y3QgZHJtX21vZGVzZXRfbG9jayAqbG9jaykKIAlyZXR1cm4gd3dfbXV0ZXhfaXNfbG9ja2VkKCZs
b2NrLT5tdXRleCk7CiB9CiAKKy8qKgorICogZHJtX21vZGVzZXRfbG9ja19hc3NlcnRfaGVsZCAt
IGVxdWl2YWxlbnQgdG8gbG9ja2RlcF9hc3NlcnRfaGVsZCgpCisgKiBAbG9jazogbG9jayB0byBj
aGVjaworICovCitzdGF0aWMgaW5saW5lIHZvaWQgZHJtX21vZGVzZXRfbG9ja19hc3NlcnRfaGVs
ZChzdHJ1Y3QgZHJtX21vZGVzZXRfbG9jayAqbG9jaykKK3sKKwlsb2NrZGVwX2Fzc2VydF9oZWxk
KCZsb2NrLT5tdXRleC5iYXNlKTsKK30KKwogaW50IGRybV9tb2Rlc2V0X2xvY2soc3RydWN0IGRy
bV9tb2Rlc2V0X2xvY2sgKmxvY2ssCiAJCXN0cnVjdCBkcm1fbW9kZXNldF9hY3F1aXJlX2N0eCAq
Y3R4KTsKIGludCBfX211c3RfY2hlY2sgZHJtX21vZGVzZXRfbG9ja19zaW5nbGVfaW50ZXJydXB0
aWJsZShzdHJ1Y3QgZHJtX21vZGVzZXRfbG9jayAqbG9jayk7Ci0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
