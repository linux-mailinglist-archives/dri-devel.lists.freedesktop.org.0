Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B571E298258
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 16:41:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E826E9DE;
	Sun, 25 Oct 2020 15:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 777116E9CE
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:41:11 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id v19so6851371edx.9
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 08:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PnUSWMc066WQ45H2u7OpbgHStFp4nv0aJngvvvZ7BGQ=;
 b=Uw83hhcuM75gkB5OjN+VRPbajL2NvlRwekav+a3BxTkxcoJRQCKjJorbujmfHkEKqI
 NCpYCEkbjKdVbyLMYAjMQ7TfWFAhZ28+nFajK9lCquarGSGSUqo7V/1TLD13Iy0MelSu
 N/tMzFVbOI17LsK1rD/Vh3BhbyDEi5s/IUcmx94HbQMWowQKu5JqDLvGZFhxYh3SpFZA
 tA5gP0xjASkkJcUzrgA203G1jzWhVm1t9QiKYCX67gVIuHBGoerifUIaEPfcvEWORTjU
 Lo5+OVNjS+OjmNT0rOIwzbrrv1e0S93fDr3vyEZpwIMZpqLU97uYcTCdVNuExk3Gwx0b
 WL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PnUSWMc066WQ45H2u7OpbgHStFp4nv0aJngvvvZ7BGQ=;
 b=eB+i6aoEYRRprXtOXRe+8VhlX0pohOEhZ5DrchpBzgUkF+6AWnNHQtXSZH4fyzSDZ/
 9e5AMKpo8rkYnLwB0NZ6RAtuZOswKTiQWjnHGdoEmq/rdTXOOuSYZa5eSR57VkimwE6r
 RdRuiralpsXILlkmDAwgydoyTQbEOxQOkkWUNZrTyIjeKVQayEKBoauAKPyo23i8jH5I
 EOaSwOupr8txTHUgnNkPgtxtMtf62qAaJc6MCnUV6zqk58JbT9P7TcRPEy0bYi8ZsCcU
 xei/eDERrcagRExUbmYtzbq1QUNMm/+ziwIb3zjYUPeVsMSREsC4XgH7t1P+T8ZvoeCg
 X1aw==
X-Gm-Message-State: AOAM531jlSAppkeyj73ZTTRgHowitsvUxvAbkR9jN2OCBG2hyqHogZzM
 Sv09+BwVbnVGptlC15GVRHAJqGHq/3Y=
X-Google-Smtp-Source: ABdhPJz3t9GfrOsKTeDnPUhMT9FznZunI+bJQGY87bZUkXu5GUcXrCoMCLrLv8OTc+gObXsJhH0xAA==
X-Received: by 2002:aa7:c98f:: with SMTP id c15mr12174268edt.200.1603640470136; 
 Sun, 25 Oct 2020 08:41:10 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d13a:1a76:8d61:cf5c])
 by smtp.gmail.com with ESMTPSA id g8sm4141931ejp.73.2020.10.25.08.41.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 08:41:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Madhav.Chauhan@amd.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/13] drm/radeon: switch to new allocator
Date: Sun, 25 Oct 2020 16:40:55 +0100
Message-Id: <20201025154100.16400-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201025154100.16400-1-christian.koenig@amd.com>
References: <20201025154100.16400-1-christian.koenig@amd.com>
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
Cc: Ray.Huang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgc2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlIGFsbCBjYXNlcyBoZXJlLgoKU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jIHwgNDcgKysrKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCmluZGV4IDFhZGQzOTE4NTE5Yy4uN2M0
M2RhNDI5ZThiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwpAQCAtNDcsNyArNDcs
NiBAQAogI2luY2x1ZGUgPGRybS90dG0vdHRtX2JvX2FwaS5oPgogI2luY2x1ZGUgPGRybS90dG0v
dHRtX2JvX2RyaXZlci5oPgogI2luY2x1ZGUgPGRybS90dG0vdHRtX21vZHVsZS5oPgotI2luY2x1
ZGUgPGRybS90dG0vdHRtX3BhZ2VfYWxsb2MuaD4KICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9wbGFj
ZW1lbnQuaD4KIAogI2luY2x1ZGUgInJhZGVvbl9yZWcuaCIKQEAgLTY3OSwxOSArNjc4LDcgQEAg
c3RhdGljIGludCByYWRlb25fdHRtX3R0X3BvcHVsYXRlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpi
ZGV2LAogCQlyZXR1cm4gMDsKIAl9CiAKLSNpZiBJU19FTkFCTEVEKENPTkZJR19BR1ApCi0JaWYg
KHJkZXYtPmZsYWdzICYgUkFERU9OX0lTX0FHUCkgewotCQlyZXR1cm4gdHRtX3Bvb2xfcG9wdWxh
dGUodHRtLCBjdHgpOwotCX0KLSNlbmRpZgotCi0jaWZkZWYgQ09ORklHX1NXSU9UTEIKLQlpZiAo
cmRldi0+bmVlZF9zd2lvdGxiICYmIHN3aW90bGJfbnJfdGJsKCkpIHsKLQkJcmV0dXJuIHR0bV9k
bWFfcG9wdWxhdGUoJmd0dC0+dHRtLCByZGV2LT5kZXYsIGN0eCk7Ci0JfQotI2VuZGlmCi0KLQly
ZXR1cm4gdHRtX3BvcHVsYXRlX2FuZF9tYXBfcGFnZXMocmRldi0+ZGV2LCAmZ3R0LT50dG0sIGN0
eCk7CisJcmV0dXJuIHR0bV9wb29sX2FsbG9jKCZyZGV2LT5tbWFuLmJkZXYucG9vbCwgdHRtLCBj
dHgpOwogfQogCiBzdGF0aWMgdm9pZCByYWRlb25fdHRtX3R0X3VucG9wdWxhdGUoc3RydWN0IHR0
bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fdHQgKnR0bSkKQEAgLTcwOSwyMSArNjk2LDcg
QEAgc3RhdGljIHZvaWQgcmFkZW9uX3R0bV90dF91bnBvcHVsYXRlKHN0cnVjdCB0dG1fYm9fZGV2
aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX3R0ICoKIAlpZiAoc2xhdmUpCiAJCXJldHVybjsKIAotI2lm
IElTX0VOQUJMRUQoQ09ORklHX0FHUCkKLQlpZiAocmRldi0+ZmxhZ3MgJiBSQURFT05fSVNfQUdQ
KSB7Ci0JCXR0bV9wb29sX3VucG9wdWxhdGUodHRtKTsKLQkJcmV0dXJuOwotCX0KLSNlbmRpZgot
Ci0jaWZkZWYgQ09ORklHX1NXSU9UTEIKLQlpZiAocmRldi0+bmVlZF9zd2lvdGxiICYmIHN3aW90
bGJfbnJfdGJsKCkpIHsKLQkJdHRtX2RtYV91bnBvcHVsYXRlKCZndHQtPnR0bSwgcmRldi0+ZGV2
KTsKLQkJcmV0dXJuOwotCX0KLSNlbmRpZgotCi0JdHRtX3VubWFwX2FuZF91bnBvcHVsYXRlX3Bh
Z2VzKHJkZXYtPmRldiwgJmd0dC0+dHRtKTsKKwlyZXR1cm4gdHRtX3Bvb2xfZnJlZSgmcmRldi0+
bW1hbi5iZGV2LnBvb2wsIHR0bSk7CiB9CiAKIGludCByYWRlb25fdHRtX3R0X3NldF91c2VycHRy
KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2LApAQCAtODU3LDYgKzgzMCw5IEBAIGludCByYWRl
b25fdHRtX2luaXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiAJfQogCXJkZXYtPm1tYW4u
aW5pdGlhbGl6ZWQgPSB0cnVlOwogCisJdHRtX3Bvb2xfaW5pdCgmcmRldi0+bW1hbi5iZGV2LnBv
b2wsIHJkZXYtPmRldiwgcmRldi0+bmVlZF9zd2lvdGxiLAorCQkgICAgICBkbWFfYWRkcmVzc2lu
Z19saW1pdGVkKCZyZGV2LT5wZGV2LT5kZXYpKTsKKwogCXIgPSByYWRlb25fdHRtX2luaXRfdnJh
bShyZGV2KTsKIAlpZiAocikgewogCQlEUk1fRVJST1IoIkZhaWxlZCBpbml0aWFsaXppbmcgVlJB
TSBoZWFwLlxuIik7CkBAIC0xMDA0LDYgKzk4MCwxNCBAQCBzdGF0aWMgaW50IHJhZGVvbl9tbV9k
dW1wX3RhYmxlKHN0cnVjdCBzZXFfZmlsZSAqbSwgdm9pZCAqZGF0YSkKIAlyZXR1cm4gMDsKIH0K
IAorc3RhdGljIGludCByYWRlb25fdHRtX3Bvb2xfZGVidWdmcyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0s
IHZvaWQgKmRhdGEpCit7CisJc3RydWN0IGRybV9pbmZvX25vZGUgKm5vZGUgPSAoc3RydWN0IGRy
bV9pbmZvX25vZGUgKiltLT5wcml2YXRlOworCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBub2Rl
LT5taW5vci0+ZGV2OworCXN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2ID0gZGV2LT5kZXZfcHJp
dmF0ZTsKKworCXJldHVybiB0dG1fcG9vbF9kZWJ1Z2ZzKCZyZGV2LT5tbWFuLmJkZXYucG9vbCwg
bSk7Cit9CiAKIHN0YXRpYyBpbnQgdHRtX3BsX3ZyYW0gPSBUVE1fUExfVlJBTTsKIHN0YXRpYyBp
bnQgdHRtX3BsX3R0ID0gVFRNX1BMX1RUOwpAQCAtMTAxMSwxMCArOTk1LDcgQEAgc3RhdGljIGlu
dCB0dG1fcGxfdHQgPSBUVE1fUExfVFQ7CiBzdGF0aWMgc3RydWN0IGRybV9pbmZvX2xpc3QgcmFk
ZW9uX3R0bV9kZWJ1Z2ZzX2xpc3RbXSA9IHsKIAl7InJhZGVvbl92cmFtX21tIiwgcmFkZW9uX21t
X2R1bXBfdGFibGUsIDAsICZ0dG1fcGxfdnJhbX0sCiAJeyJyYWRlb25fZ3R0X21tIiwgcmFkZW9u
X21tX2R1bXBfdGFibGUsIDAsICZ0dG1fcGxfdHR9LAotCXsidHRtX3BhZ2VfcG9vbCIsIHR0bV9w
YWdlX2FsbG9jX2RlYnVnZnMsIDAsIE5VTEx9LAotI2lmZGVmIENPTkZJR19TV0lPVExCCi0JeyJ0
dG1fZG1hX3BhZ2VfcG9vbCIsIHR0bV9kbWFfcGFnZV9hbGxvY19kZWJ1Z2ZzLCAwLCBOVUxMfQot
I2VuZGlmCisJeyJ0dG1fcGFnZV9wb29sIiwgcmFkZW9uX3R0bV9wb29sX2RlYnVnZnMsIDAsIE5V
TEx9CiB9OwogCiBzdGF0aWMgaW50IHJhZGVvbl90dG1fdnJhbV9vcGVuKHN0cnVjdCBpbm9kZSAq
aW5vZGUsIHN0cnVjdCBmaWxlICpmaWxlcCkKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
