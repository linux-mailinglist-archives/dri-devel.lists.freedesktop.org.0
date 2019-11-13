Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5063FB577
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:44:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B30D6ED9D;
	Wed, 13 Nov 2019 16:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B70716EDA1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 16:44:48 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-br9ixFOmNVuvSpaY4JEY-Q-1; Wed, 13 Nov 2019 11:44:46 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 271279CB8CE;
 Wed, 13 Nov 2019 16:44:45 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-143.ams2.redhat.com
 [10.36.116.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8A88510E1B43;
 Wed, 13 Nov 2019 16:44:43 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 05/13] drm/modes: parse_cmdline: Rework
 drm_mode_parse_cmdline_options()
Date: Wed, 13 Nov 2019 17:44:26 +0100
Message-Id: <20191113164434.254159-5-hdegoede@redhat.com>
In-Reply-To: <20191113164434.254159-1-hdegoede@redhat.com>
References: <20191113164434.254159-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: br9ixFOmNVuvSpaY4JEY-Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573663487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSiTl7pw12MQcXnVZ1xbULINFRjcwrc8smNr6zYReVE=;
 b=SpL8nhjLXjWG+Aty515S9j9waJT53qrOF2oZImTlTMbIbCLXD+1eWwtBGLEsxjIlZt6WrF
 +87632RHeC6QZSsR7hjVJc5tSBIW9u/TOaoxwxTqZN3S1lThX8lyEV+M8VdDxo5kgWe+xK
 WW5wp0bEIIVJMTKu4Ivc+3+kMfX49kc=
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Derek Basehore <dbasehore@chromium.org>,
 =?UTF-8?q?Mathieu=20Alexandre-T=C3=A9treault?= <alexandretm@amotus.ca>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVmYWN0b3IgZHJtX21vZGVfcGFyc2VfY21kbGluZV9vcHRpb25zKCkgc28gdGhhdCBpdCB0YWtl
cyBhIHBvaW50ZXIKdG8gdGhlIGZpcnN0IG9wdGlvbiwgcmF0aGVyIHRoZW4gYSBwb2ludGVyIHRv
IHRoZSAnLCcgYmVmb3JlIHRoZSBmaXJzdApvcHRpb24uCgpUaGlzIGlzIGEgcHJlcGFyYXRpb24g
cGF0Y2ggZm9yIGFsbG93aW5nIHBhcnNpbmcgb2Ygc3RhbmQtYWxvbmUgb3B0aW9ucwp3aXRob3V0
IGEgbW9kZSBiZWZvcmUgdGhlbSwgZS5nLjogdmlkZW89SERNSS0xOm1hcmdpbl9yaWdodD0xNCwu
Li4KCkFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+ClNpZ25lZC1v
ZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2RybV9tb2Rlcy5jIHwgMjEgKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKaW5k
ZXggZjQ5NDAxMTI0NzI3Li4yNWU4ZWRmNGNmYjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fbW9kZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKQEAgLTE1OTEs
MjMgKzE1OTEsMjEgQEAgc3RhdGljIGludCBkcm1fbW9kZV9wYXJzZV9jbWRsaW5lX2ludChjb25z
dCBjaGFyICpkZWxpbSwgdW5zaWduZWQgaW50ICppbnRfcmV0KQogCXJldHVybiAwOwogfQogCi1z
dGF0aWMgaW50IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfb3B0aW9ucyhjb25zdCBjaGFyICpzdHIs
IHNpemVfdCBsZW4sCitzdGF0aWMgaW50IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfb3B0aW9ucyhj
b25zdCBjaGFyICpzdHIsCiAJCQkJCSAgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5l
Y3RvciwKIAkJCQkJICBzdHJ1Y3QgZHJtX2NtZGxpbmVfbW9kZSAqbW9kZSkKIHsKIAl1bnNpZ25l
ZCBpbnQgZGVnLCBtYXJnaW4sIHJvdGF0aW9uID0gMDsKLQljb25zdCBjaGFyICpzZXAgPSBzdHI7
CisJY29uc3QgY2hhciAqZGVsaW0sICpvcHRpb24sICpzZXA7CiAKLQl3aGlsZSAoKHNlcCA9IHN0
cmNocihzZXAsICcsJykpKSB7Ci0JCWNvbnN0IGNoYXIgKmRlbGltLCAqb3B0aW9uOwotCi0JCW9w
dGlvbiA9IHNlcCArIDE7CisJb3B0aW9uID0gc3RyOworCWRvIHsKIAkJZGVsaW0gPSBzdHJjaHIo
b3B0aW9uLCAnPScpOwogCQlpZiAoIWRlbGltKSB7CiAJCQlkZWxpbSA9IHN0cmNocihvcHRpb24s
ICcsJyk7CiAKIAkJCWlmICghZGVsaW0pCi0JCQkJZGVsaW0gPSBzdHIgKyBsZW47CisJCQkJZGVs
aW0gPSBvcHRpb24gKyBzdHJsZW4ob3B0aW9uKTsKIAkJfQogCiAJCWlmICghc3RybmNtcChvcHRp
b24sICJyb3RhdGUiLCBkZWxpbSAtIG9wdGlvbikpIHsKQEAgLTE2NjEsOCArMTY1OSw5IEBAIHN0
YXRpYyBpbnQgZHJtX21vZGVfcGFyc2VfY21kbGluZV9vcHRpb25zKGNvbnN0IGNoYXIgKnN0ciwg
c2l6ZV90IGxlbiwKIAkJfSBlbHNlIHsKIAkJCXJldHVybiAtRUlOVkFMOwogCQl9Ci0JCXNlcCA9
IGRlbGltOwotCX0KKwkJc2VwID0gc3RyY2hyKGRlbGltLCAnLCcpOworCQlvcHRpb24gPSBzZXAg
KyAxOworCX0gd2hpbGUgKHNlcCk7CiAKIAltb2RlLT5yb3RhdGlvbl9yZWZsZWN0aW9uID0gcm90
YXRpb247CiAKQEAgLTE4NTUsOSArMTg1NCw3IEBAIGJvb2wgZHJtX21vZGVfcGFyc2VfY29tbWFu
ZF9saW5lX2Zvcl9jb25uZWN0b3IoY29uc3QgY2hhciAqbW9kZV9vcHRpb24sCiAJfQogCiAJaWYg
KG9wdGlvbnNfcHRyKSB7Ci0JCWludCBsZW4gPSBzdHJsZW4obmFtZSkgLSAob3B0aW9uc19wdHIg
LSBuYW1lKTsKLQotCQlyZXQgPSBkcm1fbW9kZV9wYXJzZV9jbWRsaW5lX29wdGlvbnMob3B0aW9u
c19wdHIsIGxlbiwKKwkJcmV0ID0gZHJtX21vZGVfcGFyc2VfY21kbGluZV9vcHRpb25zKG9wdGlv
bnNfcHRyICsgMSwKIAkJCQkJCSAgICAgY29ubmVjdG9yLCBtb2RlKTsKIAkJaWYgKHJldCkKIAkJ
CXJldHVybiBmYWxzZTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
