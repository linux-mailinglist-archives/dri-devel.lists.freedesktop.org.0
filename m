Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD49299418
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 18:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B2196EA4A;
	Mon, 26 Oct 2020 17:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FCB46EA46
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 17:41:22 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id dn5so10300483edb.10
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 10:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=R5D0v8xDbpAiHzdOU0pOmfzAMc5S195Cxk9HijZ84DU=;
 b=fDFmwNRZi5qH4nNnZE5lPf0LH1MVDUF+jmOhsvAdhfggqGTTzqa9ULCmO2BAIt7w/6
 ddW4vj9D9IO6Gv/sdKqHVRFFq+uAfDeVWuDodXBpNRXjmphJq7N1jimn3/4/1zqjYsC9
 fM1E+HPiV6eFFNeeU0dE1zpxJJtmIuIJYRd9aJw5/rJdrOb9rNDgGUGVYKBTlrfVBDwZ
 lcbRi2nGlKg5nMZUjAJmaeZmlkE1ZS58ZHVMhtvSaYhBDF2LJLRgdUOmpAVpBkzONCem
 WU73AvvaSEQweCNs20vqdVcGNDpA3fLrfpeAGIMF2ySthc9Hz471afMrmNH921bcQyZI
 KNEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R5D0v8xDbpAiHzdOU0pOmfzAMc5S195Cxk9HijZ84DU=;
 b=jlhVY+xueyJCZghWUOmKZK9rUcf0arrxjTXKG92Otwq6JSbMFj6ZNYYAjLGpUkAwaw
 +QgCnMn3RA+9YE8pN86LdHa/cDSSC0ZHzarjXbUJPKkgO9nJGYkDVCRWwOajCo3YXjH8
 VKBEWrgpaF9opO7iYQ+d5Y90TEZwli4iyVmPB0/3rg4tFRnqmIwVEH1mtCEuzb/46oVQ
 FKbpgJAj/VK1KpN0oZfboTXk8p4xGT+bN2KykaECXvmO3T7wtnS5mvKN68gpAlX5SuVF
 xGEckU9bQ6zGtRfnDCw1bS2PKQxGWfv5Znsey59p1uXash16gzJw/7vClJyBXIMYlNmZ
 zLCQ==
X-Gm-Message-State: AOAM532wDilp6cxSP/hlUtwVOt72p+5Tgt8GgCPDKM3/9kVODD1Zdu9g
 xfAuqUHEVmnEq3r79Wo28TCwIq3qby0=
X-Google-Smtp-Source: ABdhPJz58gfpSV4gJB9Y9ZGQRMq8j6EqiJSQBBMUphoWDInZsp0xfz7TETIaUZFDbCmq7Ro2gPMZeg==
X-Received: by 2002:a05:6402:28e:: with SMTP id
 l14mr16574795edv.157.1603734080540; 
 Mon, 26 Oct 2020 10:41:20 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:203b:21f:8891:7b14])
 by smtp.gmail.com with ESMTPSA id i14sm6227325ejy.110.2020.10.26.10.41.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 10:41:20 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/9] drm/amdgpu: switch to new allocator
Date: Mon, 26 Oct 2020 18:41:11 +0100
Message-Id: <20201026174117.2553-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026174117.2553-1-christian.koenig@amd.com>
References: <20201026174117.2553-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgc2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlIGFsbCBjYXNlcyBoZXJlLgoKU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyB8IDM5ICsrKysrKysrKy0tLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyNSBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKaW5kZXggMzQ5NDQ5Mjc4
MzhlLi45NzJiMTAzZDAxYjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRt
LmMKQEAgLTQ3LDcgKzQ3LDYgQEAKICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9ib19kcml2ZXIuaD4K
ICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9wbGFjZW1lbnQuaD4KICNpbmNsdWRlIDxkcm0vdHRtL3R0
bV9tb2R1bGUuaD4KLSNpbmNsdWRlIDxkcm0vdHRtL3R0bV9wYWdlX2FsbG9jLmg+CiAKICNpbmNs
dWRlIDxkcm0vZHJtX2RlYnVnZnMuaD4KICNpbmNsdWRlIDxkcm0vYW1kZ3B1X2RybS5oPgpAQCAt
MTM4MywxNSArMTM4Miw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3R0bV90dF9wb3B1bGF0ZShzdHJ1
Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAkJcmV0dXJuIDA7CiAJfQogCi0jaWZkZWYgQ09ORklH
X1NXSU9UTEIKLQlpZiAoYWRldi0+bmVlZF9zd2lvdGxiICYmIHN3aW90bGJfbnJfdGJsKCkpIHsK
LQkJcmV0dXJuIHR0bV9kbWFfcG9wdWxhdGUoJmd0dC0+dHRtLCBhZGV2LT5kZXYsIGN0eCk7Ci0J
fQotI2VuZGlmCi0KLQkvKiBmYWxsIGJhY2sgdG8gZ2VuZXJpYyBoZWxwZXIgdG8gcG9wdWxhdGUg
dGhlIHBhZ2UgYXJyYXkKLQkgKiBhbmQgbWFwIHRoZW0gdG8gdGhlIGRldmljZSAqLwotCXJldHVy
biB0dG1fcG9wdWxhdGVfYW5kX21hcF9wYWdlcyhhZGV2LT5kZXYsICZndHQtPnR0bSwgY3R4KTsK
KwlyZXR1cm4gdHRtX3Bvb2xfYWxsb2MoJmFkZXYtPm1tYW4uYmRldi5wb29sLCB0dG0sIGN0eCk7
CiB9CiAKIC8qKgpAQCAtMTQwMCw3ICsxMzkxLDggQEAgc3RhdGljIGludCBhbWRncHVfdHRtX3R0
X3BvcHVsYXRlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAogICogVW5tYXBzIHBhZ2VzIG9m
IGEgdHRtX3R0IG9iamVjdCBmcm9tIHRoZSBkZXZpY2UgYWRkcmVzcyBzcGFjZSBhbmQKICAqIHVu
cG9wdWxhdGVzIHRoZSBwYWdlIGFycmF5IGJhY2tpbmcgaXQuCiAgKi8KLXN0YXRpYyB2b2lkIGFt
ZGdwdV90dG1fdHRfdW5wb3B1bGF0ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgc3RydWN0
IHR0bV90dCAqdHRtKQorc3RhdGljIHZvaWQgYW1kZ3B1X3R0bV90dF91bnBvcHVsYXRlKHN0cnVj
dCB0dG1fYm9fZGV2aWNlICpiZGV2LAorCQkJCSAgICAgc3RydWN0IHR0bV90dCAqdHRtKQogewog
CXN0cnVjdCBhbWRncHVfdHRtX3R0ICpndHQgPSAodm9pZCAqKXR0bTsKIAlzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldjsKQEAgLTE0MjUsMTYgKzE0MTcsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVf
dHRtX3R0X3VucG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1f
dHQgKgogCQlyZXR1cm47CiAKIAlhZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KGJkZXYpOwotCi0jaWZk
ZWYgQ09ORklHX1NXSU9UTEIKLQlpZiAoYWRldi0+bmVlZF9zd2lvdGxiICYmIHN3aW90bGJfbnJf
dGJsKCkpIHsKLQkJdHRtX2RtYV91bnBvcHVsYXRlKCZndHQtPnR0bSwgYWRldi0+ZGV2KTsKLQkJ
cmV0dXJuOwotCX0KLSNlbmRpZgotCi0JLyogZmFsbCBiYWNrIHRvIGdlbmVyaWMgaGVscGVyIHRv
IHVubWFwIGFuZCB1bnBvcHVsYXRlIGFycmF5ICovCi0JdHRtX3VubWFwX2FuZF91bnBvcHVsYXRl
X3BhZ2VzKGFkZXYtPmRldiwgJmd0dC0+dHRtKTsKKwlyZXR1cm4gdHRtX3Bvb2xfZnJlZSgmYWRl
di0+bW1hbi5iZGV2LnBvb2wsIHR0bSk7CiB9CiAKIC8qKgpAQCAtMjM0NywxNiArMjMzMCwyMiBA
QCBzdGF0aWMgaW50IGFtZGdwdV9tbV9kdW1wX3RhYmxlKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9p
ZCAqZGF0YSkKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIGludCBhbWRncHVfdHRtX3Bvb2xfZGVi
dWdmcyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpCit7CisJc3RydWN0IGRybV9pbmZv
X25vZGUgKm5vZGUgPSAoc3RydWN0IGRybV9pbmZvX25vZGUgKiltLT5wcml2YXRlOworCXN0cnVj
dCBkcm1fZGV2aWNlICpkZXYgPSBub2RlLT5taW5vci0+ZGV2OworCXN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2ID0gZHJtX3RvX2FkZXYoZGV2KTsKKworCXJldHVybiB0dG1fcG9vbF9kZWJ1Z2Zz
KCZhZGV2LT5tbWFuLmJkZXYucG9vbCwgbSk7Cit9CisKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJt
X2luZm9fbGlzdCBhbWRncHVfdHRtX2RlYnVnZnNfbGlzdFtdID0gewogCXsiYW1kZ3B1X3ZyYW1f
bW0iLCBhbWRncHVfbW1fZHVtcF90YWJsZSwgMCwgKHZvaWQgKilUVE1fUExfVlJBTX0sCiAJeyJh
bWRncHVfZ3R0X21tIiwgYW1kZ3B1X21tX2R1bXBfdGFibGUsIDAsICh2b2lkICopVFRNX1BMX1RU
fSwKIAl7ImFtZGdwdV9nZHNfbW0iLCBhbWRncHVfbW1fZHVtcF90YWJsZSwgMCwgKHZvaWQgKilB
TURHUFVfUExfR0RTfSwKIAl7ImFtZGdwdV9nd3NfbW0iLCBhbWRncHVfbW1fZHVtcF90YWJsZSwg
MCwgKHZvaWQgKilBTURHUFVfUExfR1dTfSwKIAl7ImFtZGdwdV9vYV9tbSIsIGFtZGdwdV9tbV9k
dW1wX3RhYmxlLCAwLCAodm9pZCAqKUFNREdQVV9QTF9PQX0sCi0JeyJ0dG1fcGFnZV9wb29sIiwg
dHRtX3BhZ2VfYWxsb2NfZGVidWdmcywgMCwgTlVMTH0sCi0jaWZkZWYgQ09ORklHX1NXSU9UTEIK
LQl7InR0bV9kbWFfcGFnZV9wb29sIiwgdHRtX2RtYV9wYWdlX2FsbG9jX2RlYnVnZnMsIDAsIE5V
TEx9Ci0jZW5kaWYKKwl7InR0bV9wYWdlX3Bvb2wiLCBhbWRncHVfdHRtX3Bvb2xfZGVidWdmcywg
MCwgTlVMTH0sCiB9OwogCiAvKioKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
