Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28979E735
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 13:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3238999C;
	Tue, 27 Aug 2019 11:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E44898FD
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 11:58:56 +0000 (UTC)
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 85F1420828;
 Tue, 27 Aug 2019 11:58:55 +0000 (UTC)
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 1/4] drm/modes: Add a switch to differentiate free standing
 options
Date: Tue, 27 Aug 2019 13:58:47 +0200
Message-Id: <20190827115850.25731-1-mripard@kernel.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566907136;
 bh=AceCkCyWy+b5/vnwo8aHDeOQ5eliPyLR5AI98lY4Wx4=;
 h=From:To:Cc:Subject:Date:From;
 b=GrcuTXnEy4RY8tWMxYE71G90OjuZQY6ROt7sXiX5VkZ0GLfaV5igjZbG/z5r7YXxw
 fh1TJrWf33H6sFUnGzh66aQlmvwHOnG02jiDKW2/GB4VYjixZ3PAEc52HMhFXVg86b
 vjziEtcsWxB7ZkfA2L/LN4Yj7BUftCPUiqXB06l4=
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, jernej.skrabec@gmail.com,
 thomas.graichen@googlemail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KClNvbWUgZXh0
cmEgY29tbWFuZCBsaW5lIG9wdGlvbnMgY2FuIGJlIGVpdGhlciBzcGVjaWZpZWQgd2l0aG91dCBh
bnl0aGluZwplbHNlIG9uIHRoZSBjb21tYW5kIGxpbmUgKGJhc2ljYWxseSBhbGwgdGhlIGZvcmNl
IGNvbm5lY3Rpb24gb3B0aW9ucyksIGJ1dApzb21lIG90aGVyIGFyZSBvbmx5IHJlbGV2YW50IHdo
ZW4gbWF0Y2hlZCB3aXRoIGEgcmVzb2x1dGlvbiAobWFyZ2luIGFuZAppbnRlcmxhY2UpLgoKTGV0
J3MgYWRkIGEgc3dpdGNoIHRvIHJlc3RyaWN0IGlmIG5lZWRlZCB0aGUgYXZhaWxhYmxlIG9wdGlv
biBzZXQuCgpGaXhlczogZTA4YWI3NGJkNGM3ICgiZHJtL21vZGVzOiBSZXdyaXRlIHRoZSBjb21t
YW5kIGxpbmUgcGFyc2VyIikKU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJp
cGFyZEBib290bGluLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgfCAxMCAr
KysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9tb2Rlcy5jCmluZGV4IDExYWNjOTU4MTk3Ny4uZTU5OTdmMzViNzc5IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9tb2Rlcy5jCkBAIC0xNDU0LDYgKzE0NTQsNyBAQCBzdGF0aWMgaW50IGRybV9tb2RlX3BhcnNl
X2NtZGxpbmVfcmVmcmVzaChjb25zdCBjaGFyICpzdHIsIGNoYXIgKiplbmRfcHRyLAogfQogCiBz
dGF0aWMgaW50IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfZXh0cmEoY29uc3QgY2hhciAqc3RyLCBp
bnQgbGVuZ3RoLAorCQkJCQlib29sIGZyZWVzdGFuZGluZywKIAkJCQkJY29uc3Qgc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAkJCQkJc3RydWN0IGRybV9jbWRsaW5lX21vZGUgKm1v
ZGUpCiB7CkBAIC0xNDYyLDkgKzE0NjMsMTUgQEAgc3RhdGljIGludCBkcm1fbW9kZV9wYXJzZV9j
bWRsaW5lX2V4dHJhKGNvbnN0IGNoYXIgKnN0ciwgaW50IGxlbmd0aCwKIAlmb3IgKGkgPSAwOyBp
IDwgbGVuZ3RoOyBpKyspIHsKIAkJc3dpdGNoIChzdHJbaV0pIHsKIAkJY2FzZSAnaSc6CisJCQlp
ZiAoZnJlZXN0YW5kaW5nKQorCQkJCXJldHVybiAtRUlOVkFMOworCiAJCQltb2RlLT5pbnRlcmxh
Y2UgPSB0cnVlOwogCQkJYnJlYWs7CiAJCWNhc2UgJ20nOgorCQkJaWYgKGZyZWVzdGFuZGluZykK
KwkJCQlyZXR1cm4gLUVJTlZBTDsKKwogCQkJbW9kZS0+bWFyZ2lucyA9IHRydWU7CiAJCQlicmVh
azsKIAkJY2FzZSAnRCc6CkBAIC0xNTQyLDYgKzE1NDksNyBAQCBzdGF0aWMgaW50IGRybV9tb2Rl
X3BhcnNlX2NtZGxpbmVfcmVzX21vZGUoY29uc3QgY2hhciAqc3RyLCB1bnNpZ25lZCBpbnQgbGVu
Z3RoLAogCQkJaWYgKGV4dHJhcykgewogCQkJCWludCByZXQgPSBkcm1fbW9kZV9wYXJzZV9jbWRs
aW5lX2V4dHJhKGVuZF9wdHIgKyBpLAogCQkJCQkJCQkgICAgICAgMSwKKwkJCQkJCQkJICAgICAg
IGZhbHNlLAogCQkJCQkJCQkgICAgICAgY29ubmVjdG9yLAogCQkJCQkJCQkgICAgICAgbW9kZSk7
CiAJCQkJaWYgKHJldCkKQEAgLTE4MTEsNyArMTgxOSw3IEBAIGJvb2wgZHJtX21vZGVfcGFyc2Vf
Y29tbWFuZF9saW5lX2Zvcl9jb25uZWN0b3IoY29uc3QgY2hhciAqbW9kZV9vcHRpb24sCiAJICAg
IGV4dHJhX3B0ciAhPSBvcHRpb25zX3B0cikgewogCQlpbnQgbGVuID0gc3RybGVuKG5hbWUpIC0g
KGV4dHJhX3B0ciAtIG5hbWUpOwogCi0JCXJldCA9IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfZXh0
cmEoZXh0cmFfcHRyLCBsZW4sCisJCXJldCA9IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfZXh0cmEo
ZXh0cmFfcHRyLCBsZW4sIGZhbHNlLAogCQkJCQkJICAgY29ubmVjdG9yLCBtb2RlKTsKIAkJaWYg
KHJldCkKIAkJCXJldHVybiBmYWxzZTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
