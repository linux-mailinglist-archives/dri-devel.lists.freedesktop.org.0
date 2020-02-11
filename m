Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E81594B8
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 17:22:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33596EEA7;
	Tue, 11 Feb 2020 16:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0AD6EEA7;
 Tue, 11 Feb 2020 16:22:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 08:22:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="266311544"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 11 Feb 2020 08:22:08 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 11 Feb 2020 18:22:08 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/7] drm: Try to fix encoder possible_clones/crtc
Date: Tue, 11 Feb 2020 18:22:01 +0200
Message-Id: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFu
b3RoZXIgcmVzcGluIG9mIHRoZSBwb3NzaWJsZV9jbG9uZXMvY3J0Y3MgZml4aW5nLgoKQ2hhbmdl
cyBiYXNlZCBvbiB2MiByZXZpZXc6Ci0gaW50cm9kdWNlIGRybV9tb2RlX2NvbmZpZ192YWxpZGF0
ZSgpCi0gV0FSTiBmb3IgcG9zc2libGVfY2xvbmVzIT0wIHdoZW4gdGhlIGVuY29kZXIKICBpdHNl
bGYgaXNuJ3QgaW4gdGhlIG1hc2sKLSB1cGRhdGUgdGhlIGRvY3VtZW50YXRpb24gdG8gbWF0Y2gg
dGhlIGNvZGUKCk90aGVyIGNoYW5nZXM6Ci0gc2xpZ3RoIHJlZmFjdG9yaW5nIG9mIHRoZSBjb2Rl
IHRvIG1ha2UgaXQKICBtb3JlIGNvbnNpc3RlbnQKLSBhZGQgYSBwYXRjaCB0byBmaXh1cCBwb3Nz
aWJsZV9jcnRjcyB0b28gKG1pZ2h0IG5vdAogIGJlIG5lZWRlZCBidXQgaW5jbHVkZWQgaXQganVz
dCBpbiBjYXNlKS4KCkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4K
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KClZpbGxlIFN5cmrDpGzDpCAoNyk6
CiAgZHJtOiBJbmNsdWRlIHRoZSBlbmNvZGVyIGl0c2VsZiBpbiBwb3NzaWJsZV9jbG9uZXMKICBk
cm0vZ21hNTAwOiBTYW5pdGl6ZSBwb3NzaWJsZV9jbG9uZXMKICBkcm0vZXh5bm9zOiBVc2UgZHJt
X2VuY29kZXJfbWFzaygpCiAgZHJtL2lteDogUmVtb3ZlIHRoZSBib2d1cyBwb3NzaWJsZV9jbG9u
ZXMgc2V0dXAKICBkcm06IFZhbGlkYXRlIGVuY29kZXItPnBvc3NpYmxlX2Nsb25lcwogIGRybTog
VmFsaWRhdGUgZW5jb2Rlci0+cG9zc2libGVfY3J0Y3MKICBkcm06IEFsbG93IGRyaXZlcnMgdG8g
bGVhdmUgZW5jb2Rlci0+cG9zc2libGVfY3J0Y3M9PTAKCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Ny
dGNfaW50ZXJuYWwuaCAgICAgfCAgMSArCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jICAgICAg
ICAgICAgICAgfCAgMyArCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVfY29uZmlnLmMgICAgICAg
fCA5NyArKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4
eW5vc19kcm1fZHJ2LmMgfCAgNSArLQogZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9mcmFtZWJ1ZmZl
ci5jICAgIHwgMTYgKystLQogZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tZGZsZF9kc2lfZHBpLmMg
IHwgIDQgKy0KIGRyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWRybS1jb3JlLmMgICAgICB8ICA0ICst
CiBpbmNsdWRlL2RybS9kcm1fZW5jb2Rlci5oICAgICAgICAgICAgICAgfCAxMiArKy0KIDggZmls
ZXMgY2hhbmdlZCwgMTI1IGluc2VydGlvbnMoKyksIDE3IGRlbGV0aW9ucygtKQoKLS0gCjIuMjQu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
