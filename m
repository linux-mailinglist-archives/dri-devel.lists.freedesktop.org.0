Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC55FB576
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 17:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EC776EDA6;
	Wed, 13 Nov 2019 16:44:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28063891CB
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 16:44:45 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-gPZUhK4zMoOWeAKSmWS0YA-1; Wed, 13 Nov 2019 11:44:40 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F603190AD51;
 Wed, 13 Nov 2019 16:44:39 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-143.ams2.redhat.com
 [10.36.116.143])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D300510246FD;
 Wed, 13 Nov 2019 16:44:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v2 02/13] drm/modes: parse_cmdline: Make various char pointers
 const
Date: Wed, 13 Nov 2019 17:44:23 +0100
Message-Id: <20191113164434.254159-2-hdegoede@redhat.com>
In-Reply-To: <20191113164434.254159-1-hdegoede@redhat.com>
References: <20191113164434.254159-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: gPZUhK4zMoOWeAKSmWS0YA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573663484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TlTZQQmSFXns/D2akW7xnUw6aRuUdo3CgkoFgles9KM=;
 b=VnUefTBzYMsS9LfhwKbv7n6jx711hPa1LJm6I2r8puCdCL5yeCoCRxOOmrnfFMMuu0m2TJ
 5qb8PgNlvIkaSfjy784pMAlCyTaHaS+c+CoxrNJYgLXl5sp+Y3K9moT10o4scktIEUOphC
 CGq1urcwOMHafFsGSHjyehaZjjj+g2Q=
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

V2UgYXJlIG5vdCBzdXBwb3NlZCB0byBtb2RpZnkgdGhlIHBhc3NlZCBpbiBzdHJpbmcsIG1ha2Ug
Y2hhciBwb2ludGVycwp1c2VkIGluIGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfb3B0aW9ucygpIGNv
bnN0IGNoYXIgKiB3aGVyZSBwb3NzaWJsZS4KCkFja2VkLWJ5OiBNYXhpbWUgUmlwYXJkIDxtcmlw
YXJkQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdvZWRlQHJl
ZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgMTAgKysrKystLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X21vZGVzLmMKaW5kZXggM2MzYzc0MzUyMjVmLi42NTRkNGI2ZmVjYjMgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVz
LmMKQEAgLTE1OTEsMTUgKzE1OTEsMTUgQEAgc3RhdGljIGludCBkcm1fbW9kZV9wYXJzZV9jbWRs
aW5lX2ludChjb25zdCBjaGFyICpkZWxpbSwgdW5zaWduZWQgaW50ICppbnRfcmV0KQogCXJldHVy
biAwOwogfQogCi1zdGF0aWMgaW50IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfb3B0aW9ucyhjaGFy
ICpzdHIsIHNpemVfdCBsZW4sCitzdGF0aWMgaW50IGRybV9tb2RlX3BhcnNlX2NtZGxpbmVfb3B0
aW9ucyhjb25zdCBjaGFyICpzdHIsIHNpemVfdCBsZW4sCiAJCQkJCSAgY29uc3Qgc3RydWN0IGRy
bV9jb25uZWN0b3IgKmNvbm5lY3RvciwKIAkJCQkJICBzdHJ1Y3QgZHJtX2NtZGxpbmVfbW9kZSAq
bW9kZSkKIHsKIAl1bnNpZ25lZCBpbnQgZGVnLCBtYXJnaW4sIHJvdGF0aW9uID0gMDsKLQljaGFy
ICpzZXAgPSBzdHI7CisJY29uc3QgY2hhciAqc2VwID0gc3RyOwogCiAJd2hpbGUgKChzZXAgPSBz
dHJjaHIoc2VwLCAnLCcpKSkgewotCQljaGFyICpkZWxpbSwgKm9wdGlvbjsKKwkJY29uc3QgY2hh
ciAqZGVsaW0sICpvcHRpb247CiAKIAkJb3B0aW9uID0gc2VwICsgMTsKIAkJZGVsaW0gPSBzdHJj
aHIob3B0aW9uLCAnPScpOwpAQCAtMTcxOCw4ICsxNzE4LDggQEAgYm9vbCBkcm1fbW9kZV9wYXJz
ZV9jb21tYW5kX2xpbmVfZm9yX2Nvbm5lY3Rvcihjb25zdCBjaGFyICptb2RlX29wdGlvbiwKIAli
b29sIG5hbWVkX21vZGUgPSBmYWxzZSwgcGFyc2VfZXh0cmFzID0gZmFsc2U7CiAJdW5zaWduZWQg
aW50IGJwcF9vZmYgPSAwLCByZWZyZXNoX29mZiA9IDAsIG9wdGlvbnNfb2ZmID0gMDsKIAl1bnNp
Z25lZCBpbnQgbW9kZV9lbmQgPSAwOwotCWNoYXIgKmJwcF9wdHIgPSBOVUxMLCAqcmVmcmVzaF9w
dHIgPSBOVUxMLCAqZXh0cmFfcHRyID0gTlVMTDsKLQljaGFyICpvcHRpb25zX3B0ciA9IE5VTEw7
CisJY29uc3QgY2hhciAqYnBwX3B0ciA9IE5VTEwsICpyZWZyZXNoX3B0ciA9IE5VTEwsICpleHRy
YV9wdHIgPSBOVUxMOworCWNvbnN0IGNoYXIgKm9wdGlvbnNfcHRyID0gTlVMTDsKIAljaGFyICpi
cHBfZW5kX3B0ciA9IE5VTEwsICpyZWZyZXNoX2VuZF9wdHIgPSBOVUxMOwogCWludCByZXQ7CiAK
LS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
