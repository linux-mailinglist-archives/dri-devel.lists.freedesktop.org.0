Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB92F69D5
	for <lists+dri-devel@lfdr.de>; Sun, 10 Nov 2019 16:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9383A6E673;
	Sun, 10 Nov 2019 15:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0719B6E637
 for <dri-devel@lists.freedesktop.org>; Sun, 10 Nov 2019 15:41:23 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-6-Ahutj3cTOZOBEDgopAmiXA-1; Sun, 10 Nov 2019 10:41:20 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FE822EE3;
 Sun, 10 Nov 2019 15:41:18 +0000 (UTC)
Received: from shalem.localdomain.com (ovpn-116-82.ams2.redhat.com
 [10.36.116.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA065608BB;
 Sun, 10 Nov 2019 15:41:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>
Subject: [PATCH 07/12] drm/modes: parse_cmdline: Set bpp/refresh_specified
 after successful parsing
Date: Sun, 10 Nov 2019 16:40:56 +0100
Message-Id: <20191110154101.26486-8-hdegoede@redhat.com>
In-Reply-To: <20191110154101.26486-1-hdegoede@redhat.com>
References: <20191110154101.26486-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: Ahutj3cTOZOBEDgopAmiXA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1573400483;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8Z7E+q7TxiqMBp4eKGGrF0yLJM04TBSCRwEGE3e2/is=;
 b=I7qlaJBvy5vP6lGB/Ioc65xxutLb1PERjWw69MWuSE1Wz15kaYbL4ecuqX1Jvh1/xmXn1s
 pzLTuZl5CIj51ULn3cTNx3oSw9YAGt3ICzyg7y+CkiXtpqtCoxPFnxLPb1Poinulc8A4kY
 CtUjb1lYEHNmNsPzUFieY6wlIVkHt+Y=
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

ZHJtX2Nvbm5lY3Rvcl9nZXRfY21kbGluZV9tb2RlKCkgY2FsbHMKZHJtX21vZGVfcGFyc2VfY29t
bWFuZF9saW5lX2Zvcl9jb25uZWN0b3IoKSB3aXRoICZjb25uZWN0b3ItPmNtZGxpbmVfbW9kZQph
cyBtb2RlIGFyZ3VtZW50LCBzbyBhbnl0aGluZyB3aGljaCB3ZSBzdG9yZSBpbiB0aGUgbW9kZSBh
cmd1bWVudHMgZ2V0cwprZXB0IGV2ZW4gaWYgd2UgcmV0dXJuIGZhbHNlLgoKQXZvaWQgc3Rvcmlu
ZyBhIHBvc3NpYmx5IGZhbHNlLXBvc3RpdmUgYnBwL3JlZnJlc2hfc3BlY2lmaWVkIHNldHRpbmcK
aW4gY29ubmVjdG9yLT5jbWRsaW5lX21vZGUgYnkgbW92aW5nIHRoZSBzZXR0aW5nIG9mIHRoZXNl
IHRvIGFmdGVyCnN1Y2Nlc3NmdWwgcGFyc2luZyBvZiB0aGUgYnBwL3JlZnJlc2ggcGFydHMgb2Yg
dGhlIHZpZGVvPSBhcmd1bWVudC4KClNpZ25lZC1vZmYtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdv
ZWRlQHJlZGhhdC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgOSArKysr
Ky0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9tb2Rlcy5jCmluZGV4IDgwY2IyNDdjODNjNy4uNzI4MjhmYTlmYzkxIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9t
b2Rlcy5jCkBAIC0xNzcxLDEwICsxNzcxLDggQEAgYm9vbCBkcm1fbW9kZV9wYXJzZV9jb21tYW5k
X2xpbmVfZm9yX2Nvbm5lY3Rvcihjb25zdCBjaGFyICptb2RlX29wdGlvbiwKIAogCS8qIFRyeSB0
byBsb2NhdGUgdGhlIGJwcCBhbmQgcmVmcmVzaCBzcGVjaWZpZXJzLCBpZiBhbnkgKi8KIAlicHBf
cHRyID0gc3RyY2hyKG5hbWUsICctJyk7Ci0JaWYgKGJwcF9wdHIpIHsKKwlpZiAoYnBwX3B0cikK
IAkJYnBwX29mZiA9IGJwcF9wdHIgLSBuYW1lOwotCQltb2RlLT5icHBfc3BlY2lmaWVkID0gdHJ1
ZTsKLQl9CiAKIAlyZWZyZXNoX3B0ciA9IHN0cmNocihuYW1lLCAnQCcpOwogCWlmIChyZWZyZXNo
X3B0cikgewpAQCAtMTc4Miw3ICsxNzgwLDYgQEAgYm9vbCBkcm1fbW9kZV9wYXJzZV9jb21tYW5k
X2xpbmVfZm9yX2Nvbm5lY3Rvcihjb25zdCBjaGFyICptb2RlX29wdGlvbiwKIAkJCXJldHVybiBm
YWxzZTsKIAogCQlyZWZyZXNoX29mZiA9IHJlZnJlc2hfcHRyIC0gbmFtZTsKLQkJbW9kZS0+cmVm
cmVzaF9zcGVjaWZpZWQgPSB0cnVlOwogCX0KIAogCS8qIExvY2F0ZSB0aGUgc3RhcnQgb2YgbmFt
ZWQgb3B0aW9ucyAqLwpAQCAtMTgyNSw2ICsxODIyLDggQEAgYm9vbCBkcm1fbW9kZV9wYXJzZV9j
b21tYW5kX2xpbmVfZm9yX2Nvbm5lY3Rvcihjb25zdCBjaGFyICptb2RlX29wdGlvbiwKIAkJcmV0
ID0gZHJtX21vZGVfcGFyc2VfY21kbGluZV9icHAoYnBwX3B0ciwgJmJwcF9lbmRfcHRyLCBtb2Rl
KTsKIAkJaWYgKHJldCkKIAkJCXJldHVybiBmYWxzZTsKKworCQltb2RlLT5icHBfc3BlY2lmaWVk
ID0gdHJ1ZTsKIAl9CiAKIAlpZiAocmVmcmVzaF9wdHIpIHsKQEAgLTE4MzIsNiArMTgzMSw4IEBA
IGJvb2wgZHJtX21vZGVfcGFyc2VfY29tbWFuZF9saW5lX2Zvcl9jb25uZWN0b3IoY29uc3QgY2hh
ciAqbW9kZV9vcHRpb24sCiAJCQkJCQkgICAgICZyZWZyZXNoX2VuZF9wdHIsIG1vZGUpOwogCQlp
ZiAocmV0KQogCQkJcmV0dXJuIGZhbHNlOworCisJCW1vZGUtPnJlZnJlc2hfc3BlY2lmaWVkID0g
dHJ1ZTsKIAl9CiAKIAkvKgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
