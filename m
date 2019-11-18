Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5578F1008AE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 16:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E53C76E5C3;
	Mon, 18 Nov 2019 15:52:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C216E5C3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 15:51:55 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-235-MYOi-fvLPAmPy4jaZAHS0Q-1; Mon, 18 Nov 2019 10:51:51 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED14A8A218E;
 Mon, 18 Nov 2019 15:51:49 +0000 (UTC)
Received: from shalem.localdomain.com (unknown [10.36.118.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3A4A1600CD;
 Mon, 18 Nov 2019 15:51:48 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v3 07/13] drm/modes: parse_cmdline: Set bpp/refresh_specified
 after successful parsing
Date: Mon, 18 Nov 2019 16:51:28 +0100
Message-Id: <20191118155134.30468-7-hdegoede@redhat.com>
In-Reply-To: <20191118155134.30468-1-hdegoede@redhat.com>
References: <20191118155134.30468-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: MYOi-fvLPAmPy4jaZAHS0Q-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574092314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vGvqf8aTqAiNCsenFw7/SVuCP0FRm5J7zSw/79yxVXQ=;
 b=de++gG8L/zw12Vh/CZQ5t9NxihBbAr84ydBNbQEl5WyS4GWb+SUhe5qTIMixlq5iBZyHUp
 +cBGCzYIhifICW/dbIDFmSMLVPbxfpkWXDu/usVEkIyFDSpNTarMYP4s9A9MQjeLCZbvnw
 NVFCf2rLNClY1yvI1VJZe6e0hIUt0no=
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

ZHJtX2Nvbm5lY3Rvcl9nZXRfY21kbGluZV9tb2RlKCkgY2FsbHMKZHJtX21vZGVfcGFyc2VfY29t
bWFuZF9saW5lX2Zvcl9jb25uZWN0b3IoKSB3aXRoICZjb25uZWN0b3ItPmNtZGxpbmVfbW9kZQph
cyBtb2RlIGFyZ3VtZW50LCBzbyBhbnl0aGluZyB3aGljaCB3ZSBzdG9yZSBpbiB0aGUgbW9kZSBh
cmd1bWVudHMgZ2V0cwprZXB0IGV2ZW4gaWYgd2UgcmV0dXJuIGZhbHNlLgoKQXZvaWQgc3Rvcmlu
ZyBhIHBvc3NpYmx5IGZhbHNlLXBvc3RpdmUgYnBwL3JlZnJlc2hfc3BlY2lmaWVkIHNldHRpbmcK
aW4gY29ubmVjdG9yLT5jbWRsaW5lX21vZGUgYnkgbW92aW5nIHRoZSBzZXR0aW5nIG9mIHRoZXNl
IHRvIGFmdGVyCnN1Y2Nlc3NmdWwgcGFyc2luZyBvZiB0aGUgYnBwL3JlZnJlc2ggcGFydHMgb2Yg
dGhlIHZpZGVvPSBhcmd1bWVudC4KCkFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtl
cm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJlZGhhdC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgOSArKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5j
CmluZGV4IDgwY2IyNDdjODNjNy4uNzI4MjhmYTlmYzkxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX21vZGVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCkBAIC0x
NzcxLDEwICsxNzcxLDggQEAgYm9vbCBkcm1fbW9kZV9wYXJzZV9jb21tYW5kX2xpbmVfZm9yX2Nv
bm5lY3Rvcihjb25zdCBjaGFyICptb2RlX29wdGlvbiwKIAogCS8qIFRyeSB0byBsb2NhdGUgdGhl
IGJwcCBhbmQgcmVmcmVzaCBzcGVjaWZpZXJzLCBpZiBhbnkgKi8KIAlicHBfcHRyID0gc3RyY2hy
KG5hbWUsICctJyk7Ci0JaWYgKGJwcF9wdHIpIHsKKwlpZiAoYnBwX3B0cikKIAkJYnBwX29mZiA9
IGJwcF9wdHIgLSBuYW1lOwotCQltb2RlLT5icHBfc3BlY2lmaWVkID0gdHJ1ZTsKLQl9CiAKIAly
ZWZyZXNoX3B0ciA9IHN0cmNocihuYW1lLCAnQCcpOwogCWlmIChyZWZyZXNoX3B0cikgewpAQCAt
MTc4Miw3ICsxNzgwLDYgQEAgYm9vbCBkcm1fbW9kZV9wYXJzZV9jb21tYW5kX2xpbmVfZm9yX2Nv
bm5lY3Rvcihjb25zdCBjaGFyICptb2RlX29wdGlvbiwKIAkJCXJldHVybiBmYWxzZTsKIAogCQly
ZWZyZXNoX29mZiA9IHJlZnJlc2hfcHRyIC0gbmFtZTsKLQkJbW9kZS0+cmVmcmVzaF9zcGVjaWZp
ZWQgPSB0cnVlOwogCX0KIAogCS8qIExvY2F0ZSB0aGUgc3RhcnQgb2YgbmFtZWQgb3B0aW9ucyAq
LwpAQCAtMTgyNSw2ICsxODIyLDggQEAgYm9vbCBkcm1fbW9kZV9wYXJzZV9jb21tYW5kX2xpbmVf
Zm9yX2Nvbm5lY3Rvcihjb25zdCBjaGFyICptb2RlX29wdGlvbiwKIAkJcmV0ID0gZHJtX21vZGVf
cGFyc2VfY21kbGluZV9icHAoYnBwX3B0ciwgJmJwcF9lbmRfcHRyLCBtb2RlKTsKIAkJaWYgKHJl
dCkKIAkJCXJldHVybiBmYWxzZTsKKworCQltb2RlLT5icHBfc3BlY2lmaWVkID0gdHJ1ZTsKIAl9
CiAKIAlpZiAocmVmcmVzaF9wdHIpIHsKQEAgLTE4MzIsNiArMTgzMSw4IEBAIGJvb2wgZHJtX21v
ZGVfcGFyc2VfY29tbWFuZF9saW5lX2Zvcl9jb25uZWN0b3IoY29uc3QgY2hhciAqbW9kZV9vcHRp
b24sCiAJCQkJCQkgICAgICZyZWZyZXNoX2VuZF9wdHIsIG1vZGUpOwogCQlpZiAocmV0KQogCQkJ
cmV0dXJuIGZhbHNlOworCisJCW1vZGUtPnJlZnJlc2hfc3BlY2lmaWVkID0gdHJ1ZTsKIAl9CiAK
IAkvKgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
