Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E242692F
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 19:37:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D2A89C6E;
	Wed, 22 May 2019 17:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E9B89C6E
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 17:37:07 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id j53so3357530qta.9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 10:37:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rfjKyX7zH6WdV+81p3MbZM1b4C1cPYdMHawe6tfVqAs=;
 b=njcfgpdozm0X7tXX1jMKR5/wyXOBSMVuSotqg/LHpzaIGlPWujYDQN2Ya8pf0hhjkR
 xvxEPIYVe5uhH4/0XsSjR/Cc5nfandS5tMJdCB/xhuPmxOoVl1GdakNMNcTj74w7T/M6
 ziUBB/BbSroaiKPX/PDlqVE4rx7E+/l1SgbB93zL4XJMt90yvkF6TEOHO93LwDj186QB
 gVUNv7SPkD8E2NGBICVbUHBut3LqIsJSnHgyoyZ7/A9OoVM9l5JzcYiFmRZS0fr9rgvf
 dFX8IfTakIeYsFT47McsUVz+lj9krjueeVwlnEAfvxwfhTbgfVFxIxKCaeZVJoFleSto
 I5mA==
X-Gm-Message-State: APjAAAUvcJW4y62EBVHbcw421j+9fNL7ptN2iob65959qx4HZ/xrq/N+
 RTbVNxUTV2WnqV4+KkrJBLQKIKTssFo=
X-Google-Smtp-Source: APXvYqy43UmlIKYjLNdnnXAJzeA14V/9hMBmSX0GlDxsmqTqZ6mvNCzd//FES5K73n/5R618j8mAGQ==
X-Received: by 2002:ac8:38d1:: with SMTP id g17mr6085370qtc.281.1558546626606; 
 Wed, 22 May 2019 10:37:06 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id w143sm10692969qka.22.2019.05.22.10.37.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 10:37:06 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 2/5] drm/msm/a6xx: Remove duplicate irq disable from remove
Date: Wed, 22 May 2019 13:36:41 -0400
Message-Id: <20190522173656.162006-2-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190522173656.162006-1-sean@poorly.run>
References: <20190522173656.162006-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rfjKyX7zH6WdV+81p3MbZM1b4C1cPYdMHawe6tfVqAs=;
 b=VUhMOA1ELdO2stBmws9mvE7SyaFYOggjY0RgWmAQ6KDJRHFjsOThuqfVd1XAUr91yy
 JohAmFWN88/e3S4AweJBb/XTKZRNl0ObBTwmbTajcUlv06sxUIzX5Q9QZH6EWEyM6Bsj
 GiXK79bczQHpZeh9VeojG6UUWPJQTvTZuBqAhLAB/75k8D1WNeyBI//aRciFBUv1v5eG
 BsZ7DD5Q4beTX041a6b6G5VuE73PapMjm37tIELFnuufhzF1Isuq6VpMqG4DcbtP85Ql
 D0wHVA3lwsnCFBbv0gq2v0dV/aGm4A4FnPIKDXMxAmn9QGyIOSCyoC8JX7olSq78aZtM
 pxjg==
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
Cc: Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgphNnh4X2dtdV9zdG9wKCkg
YWxyZWFkeSBjYWxscyB0aGlzIGZ1bmN0aW9uIHZpYSBzaHV0ZG93biBvciBmb3JjZV9zdG9wLApz
byBpdCdzIG5vdCBuZWNlc3NhcnkgdG8gY2FsbCBpdCB0d2ljZS4gVGhpcyBhbHNvIGtub2NrcyB0
aGUgaXJxIGRlcHRoCmNvdW50IG91dCBvZiBzeW5jLCBzbyBuaWNlIHRvIGF2b2lkLgoKU2lnbmVk
LW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dt
dS5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYwppbmRleCBhYTg0ZWRi
MjVkOTEuLjc0MmM4ZmY5YTYxYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJl
bm8vYTZ4eF9nbXUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5j
CkBAIC0xMjM5LDcgKzEyMzksNiBAQCB2b2lkIGE2eHhfZ211X3JlbW92ZShzdHJ1Y3QgYTZ4eF9n
cHUgKmE2eHhfZ3B1KQogCQlkZXZfcG1fZG9tYWluX2RldGFjaChnbXUtPmd4cGQsIGZhbHNlKTsK
IAl9CiAKLQlhNnh4X2dtdV9pcnFfZGlzYWJsZShnbXUpOwogCWE2eHhfZ211X21lbW9yeV9mcmVl
KGdtdSwgZ211LT5oZmkpOwogCiAJaW9tbXVfZGV0YWNoX2RldmljZShnbXUtPmRvbWFpbiwgZ211
LT5kZXYpOwotLSAKU2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21p
dW0gT1MKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
