Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0376F69D2
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 16:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84206E635;
	Sun, 10 Nov 2019 15:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB6816E098
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 15:41:14 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-bItT5d6TOKumuhXYLd2VaQ-1; Sun, 10 Nov 2019 10:41:12 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 02019801E51;
 Sun, 10 Nov 2019 15:41:11 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-82.ams2.redhat.com
 [10.36.116.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A2CB608BB;
 Sun, 10 Nov 2019 15:41:09 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 03/12] drm/modes: parse_cmdline: Stop parsing extras after bpp
 / refresh at ', '
Date: Sun, 10 Nov 2019 16:40:52 +0100
Message-Id: <20191110154101.26486-4-hdegoede@redhat.com>
In-Reply-To: <20191110154101.26486-1-hdegoede@redhat.com>
References: <20191110154101.26486-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: bItT5d6TOKumuhXYLd2VaQ-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573400474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9uoZFku2A5U4YYMzI6/WndQRD7DY2GIQjpcs6F8vv9c=;
 b=OuhcHTf1my87VcqIWq7PAPmWcSL6J5VK53/8ZOsxGPpWQ1DQx7z8XNXpk+DGsrG6SY5Ult
 Y30yQD5F68XOmEMIQHDgOpEPUS+naRNADbv1e4tH5MXXLbWwZFSRRu93xJbQWcbx0Z0csR
 /g1mNg2WNoH/OevjcU7DvqOZ2fEPlZM=
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

QmVmb3JlIHRoaXMgY29tbWl0IGl0IHdhcyBpbXBvc3NpYmxlIHRvIGFkZCBhbiBleHRyYSBtb2Rl
IGFyZ3VtZW50IGFmdGVyCmEgYnBwIG9yIHJlZnJlc2ggc3BlY2lmaWVyLCBjb21iaW5lZCB3aXRo
IGFuIG9wdGlvbiwgZS5nLgp2aWRlbz1IRE1JLTE6NzIweDQ4MC0yNGUscm90YXRlPTE4MCB3b3Vs
ZCBub3Qgd29yaywgZWl0aGVyIHRoZSAiZSIgdG8KZm9yY2UgZW5hYmxlIHdvdWxkIG5lZWQgdG8g
YmUgZHJvcHBlZCBvciB0aGUgIixyb3RhdGU9MTgwIiwgb3RoZXJ3aXNlCnRoZSBtb2RlX29wdGlv
biB3b3VsZCBub3QgYmUgYWNjZXB0ZWQuCgpUaGlzIGNvbW1pdCBmaXhlcyB0aGlzIGJ5IGZpeGlu
ZyB0aGUgbGVuZ3RoIGNhbGN1bGF0aW9uIGlmIGV4dHJhc19wdHIKaXMgc2V0IHRvIHN0b3AgdGhl
IGV4dHJhIHBhcnNpbmcgYXQgdGhlIHN0YXJ0IG9mIHRoZSBvcHRpb25zIChzdG9wIGF0IHRoZQon
LCcgb3B0aW9uc19wdHIgcG9pbnRzIHRvKS4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUg
PGhkZWdvZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jICAg
ICAgICAgICAgICAgICAgIHwgMTAgKysrKy0tLQogLi4uL2dwdS9kcm0vc2VsZnRlc3RzL2RybV9j
bWRsaW5lX3NlbGZ0ZXN0cy5oIHwgIDEgKwogLi4uL2RybS9zZWxmdGVzdHMvdGVzdC1kcm1fY21k
bGluZV9wYXJzZXIuYyAgIHwgMjYgKysrKysrKysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2Vk
LCAzMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwppbmRleCA2
NTRkNGI2ZmVjYjMuLmE4YWE3OTU1ZmQ0NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9tb2Rlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwpAQCAtMTcyMSw3ICsx
NzIxLDcgQEAgYm9vbCBkcm1fbW9kZV9wYXJzZV9jb21tYW5kX2xpbmVfZm9yX2Nvbm5lY3Rvcihj
b25zdCBjaGFyICptb2RlX29wdGlvbiwKIAljb25zdCBjaGFyICpicHBfcHRyID0gTlVMTCwgKnJl
ZnJlc2hfcHRyID0gTlVMTCwgKmV4dHJhX3B0ciA9IE5VTEw7CiAJY29uc3QgY2hhciAqb3B0aW9u
c19wdHIgPSBOVUxMOwogCWNoYXIgKmJwcF9lbmRfcHRyID0gTlVMTCwgKnJlZnJlc2hfZW5kX3B0
ciA9IE5VTEw7Ci0JaW50IHJldDsKKwlpbnQgaSwgbGVuLCByZXQ7CiAKICNpZmRlZiBDT05GSUdf
RkIKIAlpZiAoIW1vZGVfb3B0aW9uKQpAQCAtMTg0MSw5ICsxODQxLDExIEBAIGJvb2wgZHJtX21v
ZGVfcGFyc2VfY29tbWFuZF9saW5lX2Zvcl9jb25uZWN0b3IoY29uc3QgY2hhciAqbW9kZV9vcHRp
b24sCiAJZWxzZSBpZiAocmVmcmVzaF9wdHIpCiAJCWV4dHJhX3B0ciA9IHJlZnJlc2hfZW5kX3B0
cjsKIAotCWlmIChleHRyYV9wdHIgJiYKLQkgICAgZXh0cmFfcHRyICE9IG9wdGlvbnNfcHRyKSB7
Ci0JCWludCBsZW4gPSBzdHJsZW4obmFtZSkgLSAoZXh0cmFfcHRyIC0gbmFtZSk7CisJaWYgKGV4
dHJhX3B0cikgeworCQlpZiAob3B0aW9uc19wdHIpCisJCQlsZW4gPSBvcHRpb25zX3B0ciAtIGV4
dHJhX3B0cjsKKwkJZWxzZQorCQkJbGVuID0gc3RybGVuKGV4dHJhX3B0cik7CiAKIAkJcmV0ID0g
ZHJtX21vZGVfcGFyc2VfY21kbGluZV9leHRyYShleHRyYV9wdHIsIGxlbiwgZmFsc2UsCiAJCQkJ
CQkgICBjb25uZWN0b3IsIG1vZGUpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0
ZXN0cy9kcm1fY21kbGluZV9zZWxmdGVzdHMuaCBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMv
ZHJtX2NtZGxpbmVfc2VsZnRlc3RzLmgKaW5kZXggNmQ2MWEwZWI1ZDY0Li5jYTFmYzdhNzg5NTMg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvZHJtX2NtZGxpbmVfc2VsZnRl
c3RzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy9kcm1fY21kbGluZV9zZWxmdGVz
dHMuaApAQCAtNjAsMyArNjAsNCBAQCBjbWRsaW5lX3Rlc3QoZHJtX2NtZGxpbmVfdGVzdF92bWly
cm9yKQogY21kbGluZV90ZXN0KGRybV9jbWRsaW5lX3Rlc3RfbWFyZ2luX29wdGlvbnMpCiBjbWRs
aW5lX3Rlc3QoZHJtX2NtZGxpbmVfdGVzdF9tdWx0aXBsZV9vcHRpb25zKQogY21kbGluZV90ZXN0
KGRybV9jbWRsaW5lX3Rlc3RfaW52YWxpZF9vcHRpb24pCitjbWRsaW5lX3Rlc3QoZHJtX2NtZGxp
bmVfdGVzdF9icHBfZXh0cmFfYW5kX29wdGlvbikKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9zZWxmdGVzdHMvdGVzdC1kcm1fY21kbGluZV9wYXJzZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9z
ZWxmdGVzdHMvdGVzdC1kcm1fY21kbGluZV9wYXJzZXIuYwppbmRleCAwMTNkZTlkMjdjMzUuLjVi
OGRlYTkyMjI1NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NlbGZ0ZXN0cy90ZXN0LWRy
bV9jbWRsaW5lX3BhcnNlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zZWxmdGVzdHMvdGVzdC1k
cm1fY21kbGluZV9wYXJzZXIuYwpAQCAtOTkyLDYgKzk5MiwzMiBAQCBzdGF0aWMgaW50IGRybV9j
bWRsaW5lX3Rlc3RfaW52YWxpZF9vcHRpb24odm9pZCAqaWdub3JlZCkKIAlyZXR1cm4gMDsKIH0K
IAorc3RhdGljIGludCBkcm1fY21kbGluZV90ZXN0X2JwcF9leHRyYV9hbmRfb3B0aW9uKHZvaWQg
Kmlnbm9yZWQpCit7CisJc3RydWN0IGRybV9jbWRsaW5lX21vZGUgbW9kZSA9IHsgfTsKKworCUZB
SUxfT04oIWRybV9tb2RlX3BhcnNlX2NvbW1hbmRfbGluZV9mb3JfY29ubmVjdG9yKCI3MjB4NDgw
LTI0ZSxyb3RhdGU9MTgwIiwKKwkJCQkJCQkgICAmbm9fY29ubmVjdG9yLAorCQkJCQkJCSAgICZt
b2RlKSk7CisJRkFJTF9PTighbW9kZS5zcGVjaWZpZWQpOworCUZBSUxfT04obW9kZS54cmVzICE9
IDcyMCk7CisJRkFJTF9PTihtb2RlLnlyZXMgIT0gNDgwKTsKKwlGQUlMX09OKG1vZGUucm90YXRp
b25fcmVmbGVjdGlvbiAhPSBEUk1fTU9ERV9ST1RBVEVfMTgwKTsKKworCUZBSUxfT04obW9kZS5y
ZWZyZXNoX3NwZWNpZmllZCk7CisKKwlGQUlMX09OKCFtb2RlLmJwcF9zcGVjaWZpZWQpOworCUZB
SUxfT04obW9kZS5icHAgIT0gMjQpOworCisJRkFJTF9PTihtb2RlLnJiKTsKKwlGQUlMX09OKG1v
ZGUuY3Z0KTsKKwlGQUlMX09OKG1vZGUuaW50ZXJsYWNlKTsKKwlGQUlMX09OKG1vZGUubWFyZ2lu
cyk7CisJRkFJTF9PTihtb2RlLmZvcmNlICE9IERSTV9GT1JDRV9PTik7CisKKwlyZXR1cm4gMDsK
K30KKwogI2luY2x1ZGUgImRybV9zZWxmdGVzdC5jIgogCiBzdGF0aWMgaW50IF9faW5pdCB0ZXN0
X2RybV9jbWRsaW5lX2luaXQodm9pZCkKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
