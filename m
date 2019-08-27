Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9609E738
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 13:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9895899E9;
	Tue, 27 Aug 2019 11:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849A2899A7
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 11:59:02 +0000 (UTC)
Received: from localhost (lfbn-1-17395-211.w86-250.abo.wanadoo.fr
 [86.250.200.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DB76720828;
 Tue, 27 Aug 2019 11:59:01 +0000 (UTC)
From: Maxime Ripard <mripard@kernel.org>
To: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>, Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 3/4] drm/modes: Introduce a whitelist for the named modes
Date: Tue, 27 Aug 2019 13:58:49 +0200
Message-Id: <20190827115850.25731-3-mripard@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190827115850.25731-1-mripard@kernel.org>
References: <20190827115850.25731-1-mripard@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1566907142;
 bh=GO1r5rOQm+zBj2IKKM5SFlxBhfRya1jwSUEvCEdkEpQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=2npPcjYMZBEbpd0kYQDiZ67Dq93UewTMmTHq1LXf27BUd9Hsd3WFGQ2uw8lNVMD9o
 aAxMgBbhfwmuvD08llp07hlWGRakfx/HI0QoRmUCaOxUfkRZV4TqviIvGuCo7wapFB
 bYMKrKR9LPH8IBlTAhL7ksWgMvbBQ/OQh97OBVfc=
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

RnJvbTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290bGluLmNvbT4KClRoZSBuYW1l
ZCBtb2RlcyBzdXBwb3J0IGhhcyBpbnRyb2R1Y2VkIGEgbnVtYmVyIG9mIGdsaXRjaGVzIHRoYXQg
d2VyZSBpbgpwYXJ0IGR1ZSB0byB0aGUgZmFjdCB0aGF0IHRoZSBwYXJzZXIgd2lsbCB0YWtlIGFu
eSBzdHJpbmcgYXMgYSBuYW1lZCBtb2RlLgoKU2luY2Ugd2Ugc2hvdWxkbid0IGhhdmUgYSBsb3Qg
b2Ygb3B0aW9ucyB0aGVyZSAoYW5kIHRoZXkgc2hvdWxkIGJlIHByZXR0eQpzdGFuZGFyZCksIGxl
dCdzIGludHJvZHVjZSBhIHdoaXRlbGlzdCBvZiB0aGUgYXZhaWxhYmxlIG5hbWVkIG1vZGVzIHNv
IHRoYXQKdGhlIGtlcm5lbCBjYW4gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuIGEgcG9vcmx5IGZvcm1l
ZCBjb21tYW5kIGxpbmUgYW5kIGEKbmFtZWQgbW9kZS4KClNpZ25lZC1vZmYtYnk6IE1heGltZSBS
aXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ry
bV9tb2Rlcy5jIHwgMjAgKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAyMCBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCmluZGV4IGVhN2U2YzhjODMxOC4uOTg4Nzk3ZDgw
ODBhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9tb2Rlcy5jCkBAIC0xNjc3LDYgKzE2NzcsMjIgQEAgc3RhdGljIGludCBk
cm1fbW9kZV9wYXJzZV9jbWRsaW5lX29wdGlvbnMoY2hhciAqc3RyLCBzaXplX3QgbGVuLAogCXJl
dHVybiAwOwogfQogCitjb25zdCBjaGFyICpkcm1fbmFtZWRfbW9kZXNfd2hpdGVsaXN0W10gPSB7
CisJIk5UU0MiLAorCSJQQUwiLAorfTsKKworc3RhdGljIGJvb2wgZHJtX25hbWVkX21vZGVfaXNf
aW5fd2hpdGVsaXN0KGNvbnN0IGNoYXIgKm1vZGUsIHVuc2lnbmVkIGludCBzaXplKQoreworCWlu
dCBpOworCisJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoZHJtX25hbWVkX21vZGVzX3doaXRl
bGlzdCk7IGkrKykKKwkJaWYgKCFzdHJuY21wKG1vZGUsIGRybV9uYW1lZF9tb2Rlc193aGl0ZWxp
c3RbaV0sIHNpemUpKQorCQkJcmV0dXJuIHRydWU7CisKKwlyZXR1cm4gZmFsc2U7Cit9CisKIC8q
KgogICogZHJtX21vZGVfcGFyc2VfY29tbWFuZF9saW5lX2Zvcl9jb25uZWN0b3IgLSBwYXJzZSBj
b21tYW5kIGxpbmUgbW9kZWxpbmUgZm9yIGNvbm5lY3RvcgogICogQG1vZGVfb3B0aW9uOiBvcHRp
b25hbCBwZXIgY29ubmVjdG9yIG1vZGUgb3B0aW9uCkBAIC0xNzk0LDYgKzE4MTAsMTAgQEAgYm9v
bCBkcm1fbW9kZV9wYXJzZV9jb21tYW5kX2xpbmVfZm9yX2Nvbm5lY3Rvcihjb25zdCBjaGFyICpt
b2RlX29wdGlvbiwKIAlpZiAobmFtZWRfbW9kZSkgewogCQlpZiAobW9kZV9lbmQgKyAxID4gRFJN
X0RJU1BMQVlfTU9ERV9MRU4pCiAJCQlyZXR1cm4gZmFsc2U7CisKKwkJaWYgKCFkcm1fbmFtZWRf
bW9kZV9pc19pbl93aGl0ZWxpc3QobmFtZSwgbW9kZV9lbmQpKQorCQkJcmV0dXJuIGZhbHNlOwor
CiAJCXN0cnNjcHkobW9kZS0+bmFtZSwgbmFtZSwgbW9kZV9lbmQgKyAxKTsKIAl9IGVsc2Ugewog
CQlyZXQgPSBkcm1fbW9kZV9wYXJzZV9jbWRsaW5lX3Jlc19tb2RlKG5hbWUsIG1vZGVfZW5kLAot
LSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
