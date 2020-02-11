Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 436511594C5
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 17:22:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5BB6EEB7;
	Tue, 11 Feb 2020 16:22:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8894A6EEB5;
 Tue, 11 Feb 2020 16:22:34 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 08:22:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="251595200"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 11 Feb 2020 08:22:30 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 11 Feb 2020 18:22:29 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 6/7] drm: Validate encoder->possible_crtcs
Date: Tue, 11 Feb 2020 18:22:07 +0200
Message-Id: <20200211162208.16224-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
References: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldB
Uk4gaWYgdGhlIGVuY29kZXIgcG9zc2libGVfY3J0Y3MgaXMgZWZmZWN0aXZlbHkgZW1wdHkgb3Ig
Y29udGFpbnMKYml0cyBmb3Igbm9uLWV4aXN0aW5nIGNydGNzLgoKdjI6IE1vdmUgdG8gZHJtX21v
ZGVfY29uZmlnX3ZhbGlkYXRlKCkgKERhbmllbCkKICAgIE1ha2UgdGhlIGRvY3Mgc2F5IHdlIFdB
Uk4gd2hlbiB0aGlzIGlzIHdyb25nIChEYW5pZWwpCiAgICBFeHRyYWN0IGZ1bGxfY3J0Y19tYXNr
KCkKCkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X21vZGVfY29uZmlnLmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKy0KIGluY2x1ZGUv
ZHJtL2RybV9lbmNvZGVyLmggICAgICAgICB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDI3IGlu
c2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9tb2RlX2NvbmZpZy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZpZy5jCmlu
ZGV4IGFmYzkxNDQ3MjkzYS4uNGMxYjM1MGRkYjk1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX21vZGVfY29uZmlnLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2RlX2NvbmZp
Zy5jCkBAIC01ODEsNiArNTgxLDI5IEBAIHN0YXRpYyB2b2lkIHZhbGlkYXRlX2VuY29kZXJfcG9z
c2libGVfY2xvbmVzKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcikKIAkgICAgIGVuY29kZXIt
PnBvc3NpYmxlX2Nsb25lcywgZW5jb2Rlcl9tYXNrKTsKIH0KIAorc3RhdGljIHUzMiBmdWxsX2Ny
dGNfbWFzayhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQoreworCXN0cnVjdCBkcm1fY3J0YyAqY3J0
YzsKKwl1MzIgY3J0Y19tYXNrID0gMDsKKworCWRybV9mb3JfZWFjaF9jcnRjKGNydGMsIGRldikK
KwkJY3J0Y19tYXNrIHw9IGRybV9jcnRjX21hc2soY3J0Yyk7CisKKwlyZXR1cm4gY3J0Y19tYXNr
OworfQorCitzdGF0aWMgdm9pZCB2YWxpZGF0ZV9lbmNvZGVyX3Bvc3NpYmxlX2NydGNzKHN0cnVj
dCBkcm1fZW5jb2RlciAqZW5jb2RlcikKK3sKKwl1MzIgY3J0Y19tYXNrID0gZnVsbF9jcnRjX21h
c2soZW5jb2Rlci0+ZGV2KTsKKworCVdBUk4oKGVuY29kZXItPnBvc3NpYmxlX2NydGNzICYgY3J0
Y19tYXNrKSA9PSAwIHx8CisJICAgICAoZW5jb2Rlci0+cG9zc2libGVfY3J0Y3MgJiB+Y3J0Y19t
YXNrKSAhPSAwLAorCSAgICAgIkJvZ3VzIHBvc3NpYmxlX2NydGNzOiAiCisJICAgICAiW0VOQ09E
RVI6JWQ6JXNdIHBvc3NpYmxlX2NydGNzPTB4JXggKGZ1bGwgY3J0YyBtYXNrPTB4JXgpXG4iLAor
CSAgICAgZW5jb2Rlci0+YmFzZS5pZCwgZW5jb2Rlci0+bmFtZSwKKwkgICAgIGVuY29kZXItPnBv
c3NpYmxlX2NydGNzLCBjcnRjX21hc2spOworfQorCiB2b2lkIGRybV9tb2RlX2NvbmZpZ192YWxp
ZGF0ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogewogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5j
b2RlcjsKQEAgLTU4OCw2ICs2MTEsOCBAQCB2b2lkIGRybV9tb2RlX2NvbmZpZ192YWxpZGF0ZShz
dHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCWRybV9mb3JfZWFjaF9lbmNvZGVyKGVuY29kZXIsIGRl
dikKIAkJZml4dXBfZW5jb2Rlcl9wb3NzaWJsZV9jbG9uZXMoZW5jb2Rlcik7CiAKLQlkcm1fZm9y
X2VhY2hfZW5jb2RlcihlbmNvZGVyLCBkZXYpCisJZHJtX2Zvcl9lYWNoX2VuY29kZXIoZW5jb2Rl
ciwgZGV2KSB7CiAJCXZhbGlkYXRlX2VuY29kZXJfcG9zc2libGVfY2xvbmVzKGVuY29kZXIpOwor
CQl2YWxpZGF0ZV9lbmNvZGVyX3Bvc3NpYmxlX2NydGNzKGVuY29kZXIpOworCX0KIH0KZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9lbmNvZGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZW5jb2Rl
ci5oCmluZGV4IDM3NDE5NjNiOTU4Ny4uYjIzNjI2OWY0MWFjIDEwMDY0NAotLS0gYS9pbmNsdWRl
L2RybS9kcm1fZW5jb2Rlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9lbmNvZGVyLmgKQEAgLTE0
Miw3ICsxNDIsNyBAQCBzdHJ1Y3QgZHJtX2VuY29kZXIgewogCSAqIHRoZSBiaXRzIGZvciBhbGwg
JmRybV9jcnRjIG9iamVjdHMgdGhpcyBlbmNvZGVyIGNhbiBiZSBjb25uZWN0ZWQgdG8KIAkgKiBi
ZWZvcmUgY2FsbGluZyBkcm1fZGV2X3JlZ2lzdGVyKCkuCiAJICoKLQkgKiBJbiByZWFsaXR5IGFs
bW9zdCBldmVyeSBkcml2ZXIgZ2V0cyB0aGlzIHdyb25nLgorCSAqIFlvdSB3aWxsIGdldCBhIFdB
Uk4gaWYgeW91IGdldCB0aGlzIHdyb25nIGluIHRoZSBkcml2ZXIuCiAJICoKIAkgKiBOb3RlIHRo
YXQgc2luY2UgQ1JUQyBvYmplY3RzIGNhbid0IGJlIGhvdHBsdWdnZWQgdGhlIGFzc2lnbmVkIGlu
ZGljZXMKIAkgKiBhcmUgc3RhYmxlIGFuZCBoZW5jZSBrbm93biBiZWZvcmUgcmVnaXN0ZXJpbmcg
YWxsIG9iamVjdHMuCi0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
