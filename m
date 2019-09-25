Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16399BDFC3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 16:14:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB34891CA;
	Wed, 25 Sep 2019 14:14:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B875891CA;
 Wed, 25 Sep 2019 14:14:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 07:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="218999000"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 25 Sep 2019 07:14:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 25 Sep 2019 17:14:45 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/dp/mst: Handle arbitrary DP_LINK_BW values
Date: Wed, 25 Sep 2019 17:14:41 +0300
Message-Id: <20190925141442.23236-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925141442.23236-1-ville.syrjala@linux.intel.com>
References: <20190925141442.23236-1-ville.syrjala@linux.intel.com>
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
Cc: Sean Paul <seanpaul@chromium.org>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk1h
a2UgZHJtX2RwX2dldF92Y19wYXlsb2FkKCkgdG9sZXJhdGUgYXJiaXRyYXJ5IERQX0xJTktfQldf
Kgp2YWx1ZXMsIGp1c3QgbGlrZSBkcm1fZHBfYndfY29kZV90b19saW5rX3JhdGUoKSBkb2VzIHNp
bmNlIGNvbW1pdAo1N2ExYjA4OTM3ODIgKCJkcm06IE1ha2UgdGhlIGJ3L2xpbmsgcmF0ZSBjYWxj
dWxhdGlvbnMgbW9yZSBmb3JnaXZpbmciKS4KCkNjOiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQu
Y29tPgpDYzogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+ClNpZ25lZC1vZmYtYnk6
IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyB8IDI5ICsrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggZTI1NTk3ZWIzY2Ex
Li5kNDY0NGEzYzEzMjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3Rv
cG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYwpAQCAt
Mjk3NCwzMCArMjk3NCwxMyBAQCBzdGF0aWMgaW50IGRybV9kcF9zZW5kX3VwX2Fja19yZXBseShz
dHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9tZ3IgKm1nciwKIAlyZXR1cm4gMDsKIH0KIAotc3Rh
dGljIGJvb2wgZHJtX2RwX2dldF92Y19wYXlsb2FkX2J3KGludCBkcF9saW5rX2J3LAotCQkJCSAg
ICAgaW50IGRwX2xpbmtfY291bnQsCi0JCQkJICAgICBpbnQgKm91dCkKK3N0YXRpYyBpbnQgZHJt
X2RwX2dldF92Y19wYXlsb2FkX2J3KHU4IGRwX2xpbmtfYncsIHU4ICBkcF9saW5rX2NvdW50KQog
ewotCXN3aXRjaCAoZHBfbGlua19idykgewotCWRlZmF1bHQ6CisJaWYgKGRwX2xpbmtfYncgPT0g
MCB8fCBkcF9saW5rX2NvdW50ID09IDApCiAJCURSTV9ERUJVR19LTVMoImludmFsaWQgbGluayBi
YW5kd2lkdGggaW4gRFBDRDogJXggKGxpbmsgY291bnQ6ICVkKVxuIiwKIAkJCSAgICAgIGRwX2xp
bmtfYncsIGRwX2xpbmtfY291bnQpOwotCQlyZXR1cm4gZmFsc2U7CiAKLQljYXNlIERQX0xJTktf
QldfMV82MjoKLQkJKm91dCA9IDMgKiBkcF9saW5rX2NvdW50OwotCQlicmVhazsKLQljYXNlIERQ
X0xJTktfQldfMl83OgotCQkqb3V0ID0gNSAqIGRwX2xpbmtfY291bnQ7Ci0JCWJyZWFrOwotCWNh
c2UgRFBfTElOS19CV181XzQ6Ci0JCSpvdXQgPSAxMCAqIGRwX2xpbmtfY291bnQ7Ci0JCWJyZWFr
OwotCWNhc2UgRFBfTElOS19CV184XzE6Ci0JCSpvdXQgPSAxNSAqIGRwX2xpbmtfY291bnQ7Ci0J
CWJyZWFrOwotCX0KLQlyZXR1cm4gdHJ1ZTsKKwlyZXR1cm4gZHBfbGlua19idyAqIGRwX2xpbmtf
Y291bnQgLyAyOwogfQogCiAvKioKQEAgLTMwMjksOSArMzAxMiw5IEBAIGludCBkcm1fZHBfbXN0
X3RvcG9sb2d5X21ncl9zZXRfbXN0KHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdy
LCBib29sIG1zCiAJCQlnb3RvIG91dF91bmxvY2s7CiAJCX0KIAotCQlpZiAoIWRybV9kcF9nZXRf
dmNfcGF5bG9hZF9idyhtZ3ItPmRwY2RbMV0sCi0JCQkJCSAgICAgIG1nci0+ZHBjZFsyXSAmIERQ
X01BWF9MQU5FX0NPVU5UX01BU0ssCi0JCQkJCSAgICAgICZtZ3ItPnBibl9kaXYpKSB7CisJCW1n
ci0+cGJuX2RpdiA9IGRybV9kcF9nZXRfdmNfcGF5bG9hZF9idyhtZ3ItPmRwY2RbMV0sCisJCQkJ
CQkJbWdyLT5kcGNkWzJdICYgRFBfTUFYX0xBTkVfQ09VTlRfTUFTSyk7CisJCWlmIChtZ3ItPnBi
bl9kaXYgPT0gMCkgewogCQkJcmV0ID0gLUVJTlZBTDsKIAkJCWdvdG8gb3V0X3VubG9jazsKIAkJ
fQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
