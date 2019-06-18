Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE16A4ABC4
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 22:25:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 393A76E249;
	Tue, 18 Jun 2019 20:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D70F56E248;
 Tue, 18 Jun 2019 20:25:48 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id h21so17038766qtn.13;
 Tue, 18 Jun 2019 13:25:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/mPcWOq6bvI/Rz9hbv+lJlmkKRg/e135jxE2BAg50pM=;
 b=pmSH7Taiu1dek0zW/rwW1CDDYbhmsYFwiOQP22Mpr8aQxY1ESjfQePe4NXj9JF6+gZ
 l5RdWKgTOA1O/wAZC2UqYOECQZy8mUdDxxfLc68DQHat7LmZAUQU4zoQ5sdkBTTu0ZhX
 GxoEikRHZBU0Q9iqRS1NEk/fIEV+R8BjVpZWCooaLNf/HfqMz4BN+SkT6UdJ5JWb5nR3
 0CRuECzzU2a2V0UX/gOZhpkb5u67qTVo3uC2EhH+naqe4P6vQ5ry/FF9hj9w4tdYjIV9
 FCTCTe95nXyHUrZ0cGUbC2mCjGj440vC/xyMIydLwt2t7qv2fcLeUw60oqdUPyqUl08m
 HWjg==
X-Gm-Message-State: APjAAAUJ0oGsPQcQiLJPa8ig+tGY0E1oA5OJ2WnEwojo4zS/JgqiSTmn
 JshNOlHBSbS+nADqi294AgMcMu6q6qs=
X-Google-Smtp-Source: APXvYqzyUL3X9E0qats7YR3PmXv//sVXhdaUp8xpUF8LRBxNUszW3/xqagPXh7quc7KRYLUMfm2cWw==
X-Received: by 2002:ac8:38a8:: with SMTP id
 f37mr101708974qtc.150.1560889547868; 
 Tue, 18 Jun 2019 13:25:47 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id c16sm4004494qke.43.2019.06.18.13.25.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 13:25:47 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/msm/mdp5: Use the interconnect API
Date: Tue, 18 Jun 2019 13:24:13 -0700
Message-Id: <20190618202425.15259-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618202425.15259-1-robdclark@gmail.com>
References: <20190618202425.15259-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/mPcWOq6bvI/Rz9hbv+lJlmkKRg/e135jxE2BAg50pM=;
 b=A2+Re1WBNBOftakVI6RS8tTdogZIEpHTmvSLUhBTnj7jSO/1JQdBvuHU/GTYpThg0v
 cNvGiwlhpFX0Rz2L8uikLorkH5Z/VMo1TnBSwP42FrbPhRvGpVGF7e39yOIA6ZKNiGoZ
 +2SGJOttWeg/zmqDYPVPw+6CyZAVzyXYcF5HGKf+sMEhPyYOsgvTm/Q6iiV1SDd+yz3L
 CjiqL5/kToemOxQnH4GQmfNFh8XpH2atSaXIUBwZmBZvMeT3k0qW83KjwBANJ+Sg1/Qj
 LIrPeFDjUPu95ncOTwy6lieNtH+gTWDuHPnAwp4p3Rb3UDe/rkQYIq5ayV+7UmMU5Rb5
 XFXw==
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
 Rajesh Yadav <ryadav@codeaurora.org>, Boris Brezillon <bbrezillon@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mamta Shukla <mamtashukla555@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>,
 Georgi Djakov <georgi.djakov@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogR2VvcmdpIERqYWtvdiA8Z2VvcmdpLmRqYWtvdkBsaW5hcm8ub3JnPgoKVGhlIGludGVy
Y29ubmVjdCBBUEkgcHJvdmlkZXMgYW4gaW50ZXJmYWNlIGZvciBjb25zdW1lciBkcml2ZXJzIHRv
CmV4cHJlc3MgdGhlaXIgYmFuZHdpZHRoIG5lZWRzIGluIHRoZSBTb0MuIFRoaXMgZGF0YSBpcyBh
Z2dyZWdhdGVkCmFuZCB0aGUgb24tY2hpcCBpbnRlcmNvbm5lY3QgaGFyZHdhcmUgaXMgY29uZmln
dXJlZCB0byB0aGUgbW9zdAphcHByb3ByaWF0ZSBwb3dlci9wZXJmb3JtYW5jZSBwcm9maWxlLgoK
VXNlIHRoZSBBUEkgdG8gY29uZmlndXJlIHRoZSBpbnRlcmNvbm5lY3RzIGFuZCByZXF1ZXN0IGJh
bmR3aWR0aApiZXR3ZWVuIEREUiBhbmQgdGhlIGRpc3BsYXkgaGFyZHdhcmUgKE1EUCBwb3J0KHMp
IGFuZCByb3RhdG9yCmRvd25zY2FsZXIpLgoKdjI6IHVwZGF0ZSB0aGUgcGF0aCBuYW1lcyB0byBi
ZSBjb25zaXN0ZW50IHdpdGggZHB1LCBoYW5kbGUgdGhlIE5VTEwKICAgIHBhdGggY2FzZSwgdXBk
YXRlZCBjb21taXQgbXNnIGZyb20gR2VvcmdpLgoKU2lnbmVkLW9mZi1ieTogR2VvcmdpIERqYWtv
diA8Z2VvcmdpLmRqYWtvdkBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUv
bWRwNV9rbXMuYyB8IDE0ICsrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVf
a21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jCmluZGV4IDk3
MTc5YmVjODkwMi4uZWVhYzQyOWFjZjQwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvbWRwNS9tZHA1X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1
L21kcDVfa21zLmMKQEAgLTE2LDYgKzE2LDcgQEAKICAqIHRoaXMgcHJvZ3JhbS4gIElmIG5vdCwg
c2VlIDxodHRwOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KICAqLwogCisjaW5jbHVkZSA8bGlu
dXgvaW50ZXJjb25uZWN0Lmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfaXJxLmg+CiAKICNpbmNsdWRl
ICJtc21fZHJ2LmgiCkBAIC0xMDUwLDYgKzEwNTEsMTkgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBj
b21wb25lbnRfb3BzIG1kcDVfb3BzID0gewogCiBzdGF0aWMgaW50IG1kcDVfZGV2X3Byb2JlKHN0
cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiB7CisJc3RydWN0IGljY19wYXRoICpwYXRoMCA9
IG9mX2ljY19nZXQoJnBkZXYtPmRldiwgIm1kcDAtbWVtIik7CisJc3RydWN0IGljY19wYXRoICpw
YXRoMSA9IG9mX2ljY19nZXQoJnBkZXYtPmRldiwgIm1kcDEtbWVtIik7CisJc3RydWN0IGljY19w
YXRoICpwYXRoX3JvdCA9IG9mX2ljY19nZXQoJnBkZXYtPmRldiwgInJvdGF0b3ItbWVtIik7CisK
KwlpZiAoSVNfRVJSX09SX05VTEwocGF0aDApKQorCQlyZXR1cm4gUFRSX0VSUl9PUl9aRVJPKHBh
dGgwKTsKKwlpY2Nfc2V0X2J3KHBhdGgwLCAwLCBNQnBzX3RvX2ljYyg2NDAwKSk7CisKKwlpZiAo
IUlTX0VSUl9PUl9OVUxMKHBhdGgxKSkKKwkJaWNjX3NldF9idyhwYXRoMSwgMCwgTUJwc190b19p
Y2MoNjQwMCkpOworCWlmICghSVNfRVJSX09SX05VTEwocGF0aF9yb3QpKQorCQlpY2Nfc2V0X2J3
KHBhdGhfcm90LCAwLCBNQnBzX3RvX2ljYyg2NDAwKSk7CisKIAlEQkcoIiIpOwogCXJldHVybiBj
b21wb25lbnRfYWRkKCZwZGV2LT5kZXYsICZtZHA1X29wcyk7CiB9Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
