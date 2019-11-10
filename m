Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CEEBF69D4
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 16:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5FA6E16D;
	Sun, 10 Nov 2019 15:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AC136E16D
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 15:41:18 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-217-6Tf4_KiANaCkvZnoTKNJDA-1; Sun, 10 Nov 2019 10:41:16 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AAA05107ACC4;
 Sun, 10 Nov 2019 15:41:14 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-82.ams2.redhat.com
 [10.36.116.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22AA2608BB;
 Sun, 10 Nov 2019 15:41:12 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 05/12] drm/modes: parse_cmdline: Rework
 drm_mode_parse_cmdline_options()
Date: Sun, 10 Nov 2019 16:40:54 +0100
Message-Id: <20191110154101.26486-6-hdegoede@redhat.com>
In-Reply-To: <20191110154101.26486-1-hdegoede@redhat.com>
References: <20191110154101.26486-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 6Tf4_KiANaCkvZnoTKNJDA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573400477;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GBiOo5XA6hW6Ut4UIa3tZy2cDce1xO8a/ETSX2PN5rA=;
 b=hi1/ViUIF9Nd20ZMt47tPe14ZP8qPy+B3bQYMmjVWtCkyAvKKArysMyjs94pN+R4Px1afR
 gMuUc7RvmIk516MNKJZftIrh8g7Y9Tuqx4Dm1AARj/RRg/Gq8IO3lt2sg7oRjfKhnsYCXm
 0Xjt4cWLDc3i43IMZaziydTt7GHqdeE=
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
Li4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgMjEgKysrKysrKysrLS0tLS0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X21vZGVzLmMKaW5kZXggZjQ5NDAxMTI0NzI3Li4yNWU4ZWRmNGNmYjggMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVz
LmMKQEAgLTE1OTEsMjMgKzE1OTEsMjEgQEAgc3RhdGljIGludCBkcm1fbW9kZV9wYXJzZV9jbWRs
aW5lX2ludChjb25zdCBjaGFyICpkZWxpbSwgdW5zaWduZWQgaW50ICppbnRfcmV0KQogCXJldHVy
biAwOwogfQogCi1zdGF0aWMgaW50IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfb3B0aW9ucyhjb25z
dCBjaGFyICpzdHIsIHNpemVfdCBsZW4sCitzdGF0aWMgaW50IGRybV9tb2RlX3BhcnNlX2NtZGxp
bmVfb3B0aW9ucyhjb25zdCBjaGFyICpzdHIsCiAJCQkJCSAgY29uc3Qgc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvciwKIAkJCQkJICBzdHJ1Y3QgZHJtX2NtZGxpbmVfbW9kZSAqbW9kZSkK
IHsKIAl1bnNpZ25lZCBpbnQgZGVnLCBtYXJnaW4sIHJvdGF0aW9uID0gMDsKLQljb25zdCBjaGFy
ICpzZXAgPSBzdHI7CisJY29uc3QgY2hhciAqZGVsaW0sICpvcHRpb24sICpzZXA7CiAKLQl3aGls
ZSAoKHNlcCA9IHN0cmNocihzZXAsICcsJykpKSB7Ci0JCWNvbnN0IGNoYXIgKmRlbGltLCAqb3B0
aW9uOwotCi0JCW9wdGlvbiA9IHNlcCArIDE7CisJb3B0aW9uID0gc3RyOworCWRvIHsKIAkJZGVs
aW0gPSBzdHJjaHIob3B0aW9uLCAnPScpOwogCQlpZiAoIWRlbGltKSB7CiAJCQlkZWxpbSA9IHN0
cmNocihvcHRpb24sICcsJyk7CiAKIAkJCWlmICghZGVsaW0pCi0JCQkJZGVsaW0gPSBzdHIgKyBs
ZW47CisJCQkJZGVsaW0gPSBvcHRpb24gKyBzdHJsZW4ob3B0aW9uKTsKIAkJfQogCiAJCWlmICgh
c3RybmNtcChvcHRpb24sICJyb3RhdGUiLCBkZWxpbSAtIG9wdGlvbikpIHsKQEAgLTE2NjEsOCAr
MTY1OSw5IEBAIHN0YXRpYyBpbnQgZHJtX21vZGVfcGFyc2VfY21kbGluZV9vcHRpb25zKGNvbnN0
IGNoYXIgKnN0ciwgc2l6ZV90IGxlbiwKIAkJfSBlbHNlIHsKIAkJCXJldHVybiAtRUlOVkFMOwog
CQl9Ci0JCXNlcCA9IGRlbGltOwotCX0KKwkJc2VwID0gc3RyY2hyKGRlbGltLCAnLCcpOworCQlv
cHRpb24gPSBzZXAgKyAxOworCX0gd2hpbGUgKHNlcCk7CiAKIAltb2RlLT5yb3RhdGlvbl9yZWZs
ZWN0aW9uID0gcm90YXRpb247CiAKQEAgLTE4NTUsOSArMTg1NCw3IEBAIGJvb2wgZHJtX21vZGVf
cGFyc2VfY29tbWFuZF9saW5lX2Zvcl9jb25uZWN0b3IoY29uc3QgY2hhciAqbW9kZV9vcHRpb24s
CiAJfQogCiAJaWYgKG9wdGlvbnNfcHRyKSB7Ci0JCWludCBsZW4gPSBzdHJsZW4obmFtZSkgLSAo
b3B0aW9uc19wdHIgLSBuYW1lKTsKLQotCQlyZXQgPSBkcm1fbW9kZV9wYXJzZV9jbWRsaW5lX29w
dGlvbnMob3B0aW9uc19wdHIsIGxlbiwKKwkJcmV0ID0gZHJtX21vZGVfcGFyc2VfY21kbGluZV9v
cHRpb25zKG9wdGlvbnNfcHRyICsgMSwKIAkJCQkJCSAgICAgY29ubmVjdG9yLCBtb2RlKTsKIAkJ
aWYgKHJldCkKIAkJCXJldHVybiBmYWxzZTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
