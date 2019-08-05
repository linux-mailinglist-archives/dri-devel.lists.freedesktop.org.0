Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7595826BE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 23:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A9966E19C;
	Mon,  5 Aug 2019 21:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 461896E19C;
 Mon,  5 Aug 2019 21:21:40 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id u17so40370742pgi.6;
 Mon, 05 Aug 2019 14:21:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0OeBQSmDe1xB3j4rFO2BJAt14X15aBZMOVJCfaHc6LY=;
 b=UiPPKHn2BZJJ3SAXO26Yfc/cP/bhac9iE97rvOA7esOyvwD6ga6f7kjRg5aeu57anr
 IayvVuyaXIBvYTwI2s6HOXSx9s0vbMWzkjP1d7cdUXePGZeiDon8uwL71/JhwcxCJnpn
 8CBrGOQHsH7t0d7XVv32Cr+6Nd+YL5UIN1LWDGXZQpTPJCQ/dIK4cShsgTGazJxFBYnE
 +IZC+/VygFGdTy6NNMwO0vL80R2VPbIO8k3i1L3rZ53/DJ+UkHNZbtnX7JkmVMKQkCEV
 ONUAXX+X/FR3eOFapRXpTNVL/NDDd7FRlMIdcm2jjmrMbyN4rpXEtiG9Fu7wbVARYU42
 R35A==
X-Gm-Message-State: APjAAAVP7tpamerhGD1LIGDpLV8xSm0P/HcAeP7NQGtLWcOJPNuJJYfy
 8yo4ycEWpmJO9sB5+2MGq+O4dkkFfdQ=
X-Google-Smtp-Source: APXvYqzYkbGeZQnOUdtCfiR5eVyf9faEZUVFiJdOsNaNr95dPgUihphNyzw+oDlds8tspfo+6KC2Pg==
X-Received: by 2002:a63:f941:: with SMTP id q1mr139140666pgk.350.1565040099484; 
 Mon, 05 Aug 2019 14:21:39 -0700 (PDT)
Received: from localhost ([100.118.89.196])
 by smtp.gmail.com with ESMTPSA id r12sm66910903pgb.73.2019.08.05.14.21.38
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 14:21:38 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm: use drm_cache when available
Date: Mon,  5 Aug 2019 14:14:34 -0700
Message-Id: <20190805211451.20176-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805211451.20176-1-robdclark@gmail.com>
References: <20190805211451.20176-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0OeBQSmDe1xB3j4rFO2BJAt14X15aBZMOVJCfaHc6LY=;
 b=udJV5gKYkc67MZOEO3IGRVgW8n6V52TOvRmHEDWyme7dORPIgCmmqhH0J80IivOTKd
 yYMTe21ojN4bSKOnAtli2KxUhxAlsSGM2zTXSr//TjRHeOnx6vaheXxV4T/F0cOg3GOu
 Ni3sX0FkoAE3Sb0p4TenKRIaI3ByAyb4kpXO3cwwDvpA8nt5UnBWoyaLWu3g1BZOw4kJ
 XGKcBL2PS0gPWQ3hLP0V4pDoOltHcAd0IPqoJtk0cJdFVLZNzaR+Knw8MsIILKpn/hCq
 bXimrChiXBHpwucZLtnbis6QC9JuSjGhVZUPyI5IXQPfT2Cnaf730fDwr6BIjxT0ZF+/
 phjQ==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKRm9yIGEgbG9uZyB0aW1l
IGRybS9tc20gaGFkIGJlZW4gYWJ1c2luZyBkbWFfbWFwXyogb3IgZG1hX3N5bmNfKiB0bwpjbGVh
biBwYWdlcyBmb3IgYnVmZmVycyB3aXRoIHVuY2FjaGVkL3dyaXRlY29tYmluZSBDUFUgbW1hcCdp
bmdzLgoKQnV0IGRybS9tc20gaXMgbWFuYWdpbmcgaXQncyBvd24gaW9tbXUgZG9tYWlucywgYW5k
IHJlYWxseSBkb2Vzbid0IHdhbnQKdGhlIGFkZGl0aW9uYWwgZnVuY3Rpb25hbGl0eSBwcm92aWRl
ZCBieSB2YXJpb3VzIERNQSBBUEkgb3BzLgoKTGV0J3MganVzdCBjdXQgdGhlIGFic3RyYWN0aW9u
IGFuZCB1c2UgZHJtX2NhY2hlIHdoZXJlIHBvc3NpYmxlLgoKU2lnbmVkLW9mZi1ieTogUm9iIENs
YXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNt
X2dlbS5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJt
L21zbS9tc21fZ2VtLmMKaW5kZXggOGNmNjM2MmU2NGJmLi5hZjE5ZWYyMGQwZDUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2dlbS5jCkBAIC05LDYgKzksOCBAQAogI2luY2x1ZGUgPGxpbnV4L2RtYS1idWYuaD4K
ICNpbmNsdWRlIDxsaW51eC9wZm5fdC5oPgogCisjaW5jbHVkZSA8ZHJtL2RybV9jYWNoZS5oPgor
CiAjaW5jbHVkZSAibXNtX2Rydi5oIgogI2luY2x1ZGUgIm1zbV9mZW5jZS5oIgogI2luY2x1ZGUg
Im1zbV9nZW0uaCIKQEAgLTQ4LDYgKzUwLDcgQEAgc3RhdGljIGJvb2wgdXNlX3BhZ2VzKHN0cnVj
dCBkcm1fZ2VtX29iamVjdCAqb2JqKQogCiBzdGF0aWMgdm9pZCBzeW5jX2Zvcl9kZXZpY2Uoc3Ry
dWN0IG1zbV9nZW1fb2JqZWN0ICptc21fb2JqKQogeworI2lmICFkZWZpbmVkKEhBU19EUk1fQ0FD
SEUpCiAJc3RydWN0IGRldmljZSAqZGV2ID0gbXNtX29iai0+YmFzZS5kZXYtPmRldjsKIAogCWlm
IChnZXRfZG1hX29wcyhkZXYpKSB7CkBAIC01NywxMCArNjAsMTQgQEAgc3RhdGljIHZvaWQgc3lu
Y19mb3JfZGV2aWNlKHN0cnVjdCBtc21fZ2VtX29iamVjdCAqbXNtX29iaikKIAkJZG1hX21hcF9z
ZyhkZXYsIG1zbV9vYmotPnNndC0+c2dsLAogCQkJbXNtX29iai0+c2d0LT5uZW50cywgRE1BX0JJ
RElSRUNUSU9OQUwpOwogCX0KKyNlbHNlCisJZHJtX2NsZmx1c2hfc2cobXNtX29iai0+c2d0KTsK
KyNlbmRpZgogfQogCiBzdGF0aWMgdm9pZCBzeW5jX2Zvcl9jcHUoc3RydWN0IG1zbV9nZW1fb2Jq
ZWN0ICptc21fb2JqKQogeworI2lmICFkZWZpbmVkKEhBU19EUk1fQ0FDSEUpCiAJc3RydWN0IGRl
dmljZSAqZGV2ID0gbXNtX29iai0+YmFzZS5kZXYtPmRldjsKIAogCWlmIChnZXRfZG1hX29wcyhk
ZXYpKSB7CkBAIC03MCw2ICs3Nyw3IEBAIHN0YXRpYyB2b2lkIHN5bmNfZm9yX2NwdShzdHJ1Y3Qg
bXNtX2dlbV9vYmplY3QgKm1zbV9vYmopCiAJCWRtYV91bm1hcF9zZyhkZXYsIG1zbV9vYmotPnNn
dC0+c2dsLAogCQkJbXNtX29iai0+c2d0LT5uZW50cywgRE1BX0JJRElSRUNUSU9OQUwpOwogCX0K
KyNlbmRpZgogfQogCiAvKiBhbGxvY2F0ZSBwYWdlcyBmcm9tIFZSQU0gY2FydmVvdXQsIHVzZWQg
d2hlbiBubyBJT01NVTogKi8KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
