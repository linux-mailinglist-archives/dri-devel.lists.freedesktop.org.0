Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D00268C34
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 15:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A65899A5;
	Mon, 14 Sep 2020 13:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E807489B49
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 13:29:32 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id ay8so17565840edb.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 06:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2sgKFqAzyYTWFS7DpgNkPf7xuqkExWpe0vtA6hya4p8=;
 b=LNYaV5htN1AoGcRr3qutKAdIAJ9K2NpHJmZnCLnFDlG8+zhSr8pFBVrIVZbK7upLCy
 XuYIA5pbVz06HyYiXjA0CX8OrBfsP8QYVTX6yJ60VAjafiTzs3Dr1q7h1S6WN1SGAvlY
 UXlmfxZ5/aBJS18uzwRmNUI3/lYVMDzcdWcPZzIRtlGG2B6QiV90AnQEfAOpca3J5cuM
 fi/i79PCqkzlb/1pkXfPwtPFhCm+AEfUwe9iWPeCcG3ahwbSU9PfGzYe8A8PulfEuuIe
 /yCSNERBUwZ4Herw4m2hVxb+aHQ2rdJcpWKX6iPZoqfXgRCIkWGGqsSIIr4ud7pRIc3R
 2DEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2sgKFqAzyYTWFS7DpgNkPf7xuqkExWpe0vtA6hya4p8=;
 b=cotohp4YtRUTKzXFRIqi0m573znNbGFYkm7vyrAaCoWbnBc625pl4+YQbbGK4NyTjA
 PuRqyMnYyr7N0t6Qn4qP8nuN9tjRm3Ue195K8s9zq8olACddQUxoaYOTHXCUlQk+CjlB
 jPz7P6wIIVrmrG6A9g8lkVMIOvFswcWhhRWidT6zxbouMgvCGPMC8oX+XflzoF6Ga8i5
 E6MWBDrESRBqz6ba7zeEeMTZ+M0IWAOd2ji4zlb894iUBZNCEg1oAyCujfyPRMQqYwTi
 mbegNaP++rvhI+2QWXBJoXUdU59gvxx65W/NA8AbKVGyw89H5hcS9IsPVGQ8291Mt4na
 3DQw==
X-Gm-Message-State: AOAM5339x8o+dGXS+o0TGIl6AtIBGo53oPHudsMQ0VslLp9R99LBY8Ik
 OV93hXXerjGVWgLPQ9ylbA0=
X-Google-Smtp-Source: ABdhPJwqz+YzShnzPAVkh+LgWPDH996EZ9R5Asg2qCZETs+L6ijZw4dfeniXkQwebJgtgDxC1+lltA==
X-Received: by 2002:aa7:cad3:: with SMTP id l19mr16523629edt.352.1600090171724; 
 Mon, 14 Sep 2020 06:29:31 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6179:d701:8021:da3d])
 by smtp.gmail.com with ESMTPSA id d6sm9575625edm.31.2020.09.14.06.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 06:29:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: akpm@linux-foundation.org
Subject: [PATCH 2/2] mm: introduce vma_set_file function
Date: Mon, 14 Sep 2020 15:29:20 +0200
Message-Id: <20200914132920.59183-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200914132920.59183-1-christian.koenig@amd.com>
References: <20200914132920.59183-1-christian.koenig@amd.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBuZXcgdm1hX3NldF9maWxlKCkgZnVuY3Rpb24gdG8gYWxsb3cgY2hhbmdpbmcKdm1h
LT52bV9maWxlIHdpdGggdGhlIG5lY2Vzc2FyeSByZWZjb3VudCBkYW5jZS4KClNpZ25lZC1vZmYt
Ynk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2
ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgMTYgKysrKystLS0tLS0tLS0tLQogaW5jbHVkZS9saW51
eC9tbS5oICAgICAgICB8ICAyICsrCiBtbS9tbWFwLmMgICAgICAgICAgICAgICAgIHwgMTYgKysr
KysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVy
cy9kbWEtYnVmL2RtYS1idWYuYwppbmRleCAxNjk5YThlMzA5ZWYuLjY3MmYzNTI1YmE3NCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYworKysgYi9kcml2ZXJzL2RtYS1idWYv
ZG1hLWJ1Zi5jCkBAIC0xMTYzLDIwICsxMTYzLDE0IEBAIGludCBkbWFfYnVmX21tYXAoc3RydWN0
IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCXJldHVybiAt
RUlOVkFMOwogCiAJLyogcmVhZGp1c3QgdGhlIHZtYSAqLwotCWdldF9maWxlKGRtYWJ1Zi0+Zmls
ZSk7Ci0Jb2xkZmlsZSA9IHZtYS0+dm1fZmlsZTsKLQl2bWEtPnZtX2ZpbGUgPSBkbWFidWYtPmZp
bGU7CisJb2xkZmlsZSA9IHZtYV9zZXRfZmlsZSh2bWEsIGRtYWJ1Zi0+ZmlsZSk7CiAJdm1hLT52
bV9wZ29mZiA9IHBnb2ZmOwogCiAJcmV0ID0gZG1hYnVmLT5vcHMtPm1tYXAoZG1hYnVmLCB2bWEp
OwotCWlmIChyZXQpIHsKLQkJLyogcmVzdG9yZSBvbGQgcGFyYW1ldGVycyBvbiBmYWlsdXJlICov
Ci0JCXZtYS0+dm1fZmlsZSA9IG9sZGZpbGU7Ci0JCWZwdXQoZG1hYnVmLT5maWxlKTsKLQl9IGVs
c2UgewotCQlpZiAob2xkZmlsZSkKLQkJCWZwdXQob2xkZmlsZSk7Ci0JfQorCS8qIHJlc3RvcmUg
b2xkIHBhcmFtZXRlcnMgb24gZmFpbHVyZSAqLworCWlmIChyZXQpCisJCXZtYV9zZXRfZmlsZSh2
bWEsIG9sZGZpbGUpOworCiAJcmV0dXJuIHJldDsKIAogfQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCmluZGV4IDE5ODNlMDhmNTkwNi4uMzk4YTZm
ZGFhZDFlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21tLmgKKysrIGIvaW5jbHVkZS9saW51
eC9tbS5oCkBAIC0yNjg4LDYgKzI2ODgsOCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdm1hX3NldF9w
YWdlX3Byb3Qoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB9CiAjZW5kaWYKIAorc3RydWN0
IGZpbGUgKnZtYV9zZXRfZmlsZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwgc3RydWN0IGZp
bGUgKmZpbGUpOworCiAjaWZkZWYgQ09ORklHX05VTUFfQkFMQU5DSU5HCiB1bnNpZ25lZCBsb25n
IGNoYW5nZV9wcm90X251bWEoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCQl1bnNpZ25l
ZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCk7CmRpZmYgLS1naXQgYS9tbS9tbWFwLmMg
Yi9tbS9tbWFwLmMKaW5kZXggNDAyNDhkODRhZDVmLi5kM2MzYzUxMGY2NDMgMTAwNjQ0Ci0tLSBh
L21tL21tYXAuYworKysgYi9tbS9tbWFwLmMKQEAgLTEzNiw2ICsxMzYsMjIgQEAgdm9pZCB2bWFf
c2V0X3BhZ2VfcHJvdChzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIAlXUklURV9PTkNFKHZt
YS0+dm1fcGFnZV9wcm90LCB2bV9wYWdlX3Byb3QpOwogfQogCisvKgorICogQ2hhbmdlIGJhY2tp
bmcgZmlsZSwgb25seSB2YWxpZCB0byB1c2UgZHVyaW5nIGluaXRpYWwgVk1BIHNldHVwLgorICov
CitzdHJ1Y3QgZmlsZSAqdm1hX3NldF9maWxlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBz
dHJ1Y3QgZmlsZSAqZmlsZSkKK3sKKwlpZiAoZmlsZSkKKwkgICAgICAgIGdldF9maWxlKGZpbGUp
OworCisJc3dhcCh2bWEtPnZtX2ZpbGUsIGZpbGUpOworCisJaWYgKGZpbGUpCisJCWZwdXQoZmls
ZSk7CisKKwlyZXR1cm4gZmlsZTsKK30KKwogLyoKICAqIFJlcXVpcmVzIGlub2RlLT5pX21hcHBp
bmctPmlfbW1hcF9yd3NlbQogICovCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
