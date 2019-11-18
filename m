Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70761008A8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 16:51:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF2E6E5BD;
	Mon, 18 Nov 2019 15:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9734F6E5BD
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 15:51:48 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75--8wh2Ed1MxaKeL4EF5dJPA-1; Mon, 18 Nov 2019 10:51:43 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D67FB189F1DC;
 Mon, 18 Nov 2019 15:51:41 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26DDF600CD;
 Mon, 18 Nov 2019 15:51:40 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 03/13] drm/modes: parse_cmdline: Stop parsing extras after
 bpp / refresh at ', '
Date: Mon, 18 Nov 2019 16:51:24 +0100
Message-Id: <20191118155134.30468-3-hdegoede@redhat.com>
In-Reply-To: <20191118155134.30468-1-hdegoede@redhat.com>
References: <20191118155134.30468-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: -8wh2Ed1MxaKeL4EF5dJPA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574092307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oXv340W7tnCskIIua0UIte+Q1RpxbxWveO1PIOQh+kY=;
 b=P77Ezo2B56LDRYV3LarZHQ7T6/h+/JY9cFA7kmuZokzz92dIb1mQQAnKCxcaMqvrtnTBUJ
 Yjzib4c1vBXh1RmjVs0q796b0G9y3F/CvLM7B1pIUHrwfsqnUZNP7ssh6Q7QM6pNQ2196t
 U5U/9CXRl5obRigAsSSy9FV3K1oihCA=
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

QmVmb3JlIHRoaXMgY29tbWl0IGl0IHdhcyBpbXBvc3NpYmxlIHRvIGFkZCBhbiBleHRyYSBtb2Rl
IGFyZ3VtZW50IGFmdGVyCmEgYnBwIG9yIHJlZnJlc2ggc3BlY2lmaWVyLCBjb21iaW5lZCB3aXRo
IGFuIG9wdGlvbiwgZS5nLgp2aWRlbz1IRE1JLTE6NzIweDQ4MC0yNGUscm90YXRlPTE4MCB3b3Vs
ZCBub3Qgd29yaywgZWl0aGVyIHRoZSAiZSIgdG8KZm9yY2UgZW5hYmxlIHdvdWxkIG5lZWQgdG8g
YmUgZHJvcHBlZCBvciB0aGUgIixyb3RhdGU9MTgwIiwgb3RoZXJ3aXNlCnRoZSBtb2RlX29wdGlv
biB3b3VsZCBub3QgYmUgYWNjZXB0ZWQuCgpUaGlzIGNvbW1pdCBmaXhlcyB0aGlzIGJ5IGZpeGlu
ZyB0aGUgbGVuZ3RoIGNhbGN1bGF0aW9uIGlmIGV4dHJhc19wdHIKaXMgc2V0IHRvIHN0b3AgdGhl
IGV4dHJhIHBhcnNpbmcgYXQgdGhlIHN0YXJ0IG9mIHRoZSBvcHRpb25zIChzdG9wIGF0IHRoZQon
LCcgb3B0aW9uc19wdHIgcG9pbnRzIHRvKS4KCkFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtcmlw
YXJkQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJl
ZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jICAgICAgICAgICAgICAg
ICAgIHwgMTAgKysrKy0tLQogLi4uL2dwdS9kcm0vc2VsZnRlc3RzL2RybV9jbWRsaW5lX3NlbGZ0
ZXN0cy5oIHwgIDEgKwogLi4uL2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fY21kbGluZV9wYXJzZXIu
YyAgIHwgMjYgKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRp
b25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
bW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwppbmRleCA2NTRkNGI2ZmVjYjMu
LmE4YWE3OTU1ZmQ0NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwpAQCAtMTcyMSw3ICsxNzIxLDcgQEAgYm9v
bCBkcm1fbW9kZV9wYXJzZV9jb21tYW5kX2xpbmVfZm9yX2Nvbm5lY3Rvcihjb25zdCBjaGFyICpt
b2RlX29wdGlvbiwKIAljb25zdCBjaGFyICpicHBfcHRyID0gTlVMTCwgKnJlZnJlc2hfcHRyID0g
TlVMTCwgKmV4dHJhX3B0ciA9IE5VTEw7CiAJY29uc3QgY2hhciAqb3B0aW9uc19wdHIgPSBOVUxM
OwogCWNoYXIgKmJwcF9lbmRfcHRyID0gTlVMTCwgKnJlZnJlc2hfZW5kX3B0ciA9IE5VTEw7Ci0J
aW50IHJldDsKKwlpbnQgaSwgbGVuLCByZXQ7CiAKICNpZmRlZiBDT05GSUdfRkIKIAlpZiAoIW1v
ZGVfb3B0aW9uKQpAQCAtMTg0MSw5ICsxODQxLDExIEBAIGJvb2wgZHJtX21vZGVfcGFyc2VfY29t
bWFuZF9saW5lX2Zvcl9jb25uZWN0b3IoY29uc3QgY2hhciAqbW9kZV9vcHRpb24sCiAJZWxzZSBp
ZiAocmVmcmVzaF9wdHIpCiAJCWV4dHJhX3B0ciA9IHJlZnJlc2hfZW5kX3B0cjsKIAotCWlmIChl
eHRyYV9wdHIgJiYKLQkgICAgZXh0cmFfcHRyICE9IG9wdGlvbnNfcHRyKSB7Ci0JCWludCBsZW4g
PSBzdHJsZW4obmFtZSkgLSAoZXh0cmFfcHRyIC0gbmFtZSk7CisJaWYgKGV4dHJhX3B0cikgewor
CQlpZiAob3B0aW9uc19wdHIpCisJCQlsZW4gPSBvcHRpb25zX3B0ciAtIGV4dHJhX3B0cjsKKwkJ
ZWxzZQorCQkJbGVuID0gc3RybGVuKGV4dHJhX3B0cik7CiAKIAkJcmV0ID0gZHJtX21vZGVfcGFy
c2VfY21kbGluZV9leHRyYShleHRyYV9wdHIsIGxlbiwgZmFsc2UsCiAJCQkJCQkgICBjb25uZWN0
b3IsIG1vZGUpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy9kcm1fY21k
bGluZV9zZWxmdGVzdHMuaCBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvZHJtX2NtZGxpbmVf
c2VsZnRlc3RzLmgKaW5kZXggNmQ2MWEwZWI1ZDY0Li5jYTFmYzdhNzg5NTMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvZHJtX2NtZGxpbmVfc2VsZnRlc3RzLmgKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy9kcm1fY21kbGluZV9zZWxmdGVzdHMuaApAQCAtNjAs
MyArNjAsNCBAQCBjbWRsaW5lX3Rlc3QoZHJtX2NtZGxpbmVfdGVzdF92bWlycm9yKQogY21kbGlu
ZV90ZXN0KGRybV9jbWRsaW5lX3Rlc3RfbWFyZ2luX29wdGlvbnMpCiBjbWRsaW5lX3Rlc3QoZHJt
X2NtZGxpbmVfdGVzdF9tdWx0aXBsZV9vcHRpb25zKQogY21kbGluZV90ZXN0KGRybV9jbWRsaW5l
X3Rlc3RfaW52YWxpZF9vcHRpb24pCitjbWRsaW5lX3Rlc3QoZHJtX2NtZGxpbmVfdGVzdF9icHBf
ZXh0cmFfYW5kX29wdGlvbikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMv
dGVzdC1kcm1fY21kbGluZV9wYXJzZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVz
dC1kcm1fY21kbGluZV9wYXJzZXIuYwppbmRleCAwMTNkZTlkMjdjMzUuLjViOGRlYTkyMjI1NyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRybV9jbWRsaW5lX3Bh
cnNlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fY21kbGluZV9w
YXJzZXIuYwpAQCAtOTkyLDYgKzk5MiwzMiBAQCBzdGF0aWMgaW50IGRybV9jbWRsaW5lX3Rlc3Rf
aW52YWxpZF9vcHRpb24odm9pZCAqaWdub3JlZCkKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGlu
dCBkcm1fY21kbGluZV90ZXN0X2JwcF9leHRyYV9hbmRfb3B0aW9uKHZvaWQgKmlnbm9yZWQpCit7
CisJc3RydWN0IGRybV9jbWRsaW5lX21vZGUgbW9kZSA9IHsgfTsKKworCUZBSUxfT04oIWRybV9t
b2RlX3BhcnNlX2NvbW1hbmRfbGluZV9mb3JfY29ubmVjdG9yKCI3MjB4NDgwLTI0ZSxyb3RhdGU9
MTgwIiwKKwkJCQkJCQkgICAmbm9fY29ubmVjdG9yLAorCQkJCQkJCSAgICZtb2RlKSk7CisJRkFJ
TF9PTighbW9kZS5zcGVjaWZpZWQpOworCUZBSUxfT04obW9kZS54cmVzICE9IDcyMCk7CisJRkFJ
TF9PTihtb2RlLnlyZXMgIT0gNDgwKTsKKwlGQUlMX09OKG1vZGUucm90YXRpb25fcmVmbGVjdGlv
biAhPSBEUk1fTU9ERV9ST1RBVEVfMTgwKTsKKworCUZBSUxfT04obW9kZS5yZWZyZXNoX3NwZWNp
ZmllZCk7CisKKwlGQUlMX09OKCFtb2RlLmJwcF9zcGVjaWZpZWQpOworCUZBSUxfT04obW9kZS5i
cHAgIT0gMjQpOworCisJRkFJTF9PTihtb2RlLnJiKTsKKwlGQUlMX09OKG1vZGUuY3Z0KTsKKwlG
QUlMX09OKG1vZGUuaW50ZXJsYWNlKTsKKwlGQUlMX09OKG1vZGUubWFyZ2lucyk7CisJRkFJTF9P
Tihtb2RlLmZvcmNlICE9IERSTV9GT1JDRV9PTik7CisKKwlyZXR1cm4gMDsKK30KKwogI2luY2x1
ZGUgImRybV9zZWxmdGVzdC5jIgogCiBzdGF0aWMgaW50IF9faW5pdCB0ZXN0X2RybV9jbWRsaW5l
X2luaXQodm9pZCkKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
