Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91269298254
	for <lists+dri-devel@lfdr.de>; Sun, 25 Oct 2020 16:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0476E9D4;
	Sun, 25 Oct 2020 15:41:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162146E9CE
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 15:41:13 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id l16so6877477eds.3
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Oct 2020 08:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mq7ejWcmKebsM2gDO93gjterElAsPrAOGBpgAtoKYos=;
 b=qKSIXS/GJjQf9jZo6fAxMOixJ/EiWtWpO32fBpHcsvAH13S7VxBBv79WZTP9hzYjvP
 D/NEs7Ir/9ykWkBxUK/RWSAOF/XXQVmHqQj1rsw3PVTgDlJk3cPmkJoH+X2lyq9xK3Xn
 4sLXL+qdY7inlVPB/QlhbuSO6s/i7o83KNzEXUrEZGaKxxx3PPjovXIqnb6Ut648J+1e
 hlP/dffaO6VnjvxA+H79ZrujymfZdx5En7gIGS9HE/il4tlbzHYQwTjmVNuRHzTNchPf
 vTuer2gy7NQpU5OJ6FSgSG/ZI58RTu36Op/Jq/ZeoajJzjqAhFzVOU+NRAtuonyZP/BC
 vYjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mq7ejWcmKebsM2gDO93gjterElAsPrAOGBpgAtoKYos=;
 b=rsH7DEFurpBE0MpvX+jXS+QIIELxn2e/4iomaC3MNoSOP63ikQLe7PMfr5/I292BMM
 0zwKXrVrc1N/JosTH8fPD78jB6Z5liQ5nF4jQMmNiWlm6GZU/kASC0wVQwQWNj4mbUaj
 VQsHeqLub/qy5pFK8ccO6gEdCUSl0xe+2+Xg8Wjx/aVqLi51WhozMST/me9f4qTdgxQ6
 1Z3poq4dgdWw/8NmkxeEtztIglH3nAu21DEkggr1u0WSpjmQa2yxSWG+a+GtNM9DqxVj
 skx5SvYVuZ0Wpik/zD7SLCmTyhaecE2aBFfXBLzpDBtIjkmaksBUud4R1R3Ci7jMEasL
 M2Xg==
X-Gm-Message-State: AOAM531866pG+QNYRkY5GNLrjYnsrUE8EwzqfLmaGRgKqKi8+b/0wJVG
 8uuHHzn5aNwEHaL697n/U8E=
X-Google-Smtp-Source: ABdhPJw9d5zhyV22MnCcQVlbM3o/8EUTlpLTjFiayRK/tOroQqRloRbt2GEK6yKdUhP22J5owN6i6A==
X-Received: by 2002:aa7:cd42:: with SMTP id v2mr11555619edw.151.1603640471713; 
 Sun, 25 Oct 2020 08:41:11 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d13a:1a76:8d61:cf5c])
 by smtp.gmail.com with ESMTPSA id g8sm4141931ejp.73.2020.10.25.08.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 08:41:11 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Madhav.Chauhan@amd.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/13] drm/vmwgfx: switch to new allocator
Date: Sun, 25 Oct 2020 16:40:57 +0100
Message-Id: <20201025154100.16400-11-christian.koenig@amd.com>
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

SXQgc2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlIGFsbCBjYXNlcyBub3cuCgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgICAgICAgIHwgIDQgLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgfCAzNiArKy0tLS0tLS0tLS0tLS0tLS0t
LS0tCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwppbmRleCA3YmQxYmUyNmFmZTQuLmIzYTYwOTU5
YjVkNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKQEAgLTU5NSwxMCArNTk1LDYg
QEAgc3RhdGljIGludCB2bXdfZG1hX3NlbGVjdF9tb2RlKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2
X3ByaXYpCiAJZWxzZQogCQlkZXZfcHJpdi0+bWFwX21vZGUgPSB2bXdfZG1hX21hcF9wb3B1bGF0
ZTsKIAotICAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0RSTV9UVE1fRE1BX1BBR0VfUE9P
TCkgJiYKLQkgICAgKGRldl9wcml2LT5tYXBfbW9kZSA9PSB2bXdfZG1hX2FsbG9jX2NvaGVyZW50
KSkKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KIAlEUk1fSU5GTygiRE1BIG1hcCBtb2RlOiAlc1xuIiwg
bmFtZXNbZGV2X3ByaXYtPm1hcF9tb2RlXSk7CiAJcmV0dXJuIDA7CiB9CmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMgYi9kcml2ZXJzL2dwdS9k
cm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKaW5kZXggOTJhNWQyNDVmZjRkLi5hYTBjZGY0
NzZhNTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X3R0bV9idWZm
ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF90dG1fYnVmZmVyLmMKQEAg
LTI4LDcgKzI4LDYgQEAKICNpbmNsdWRlICJ2bXdnZnhfZHJ2LmgiCiAjaW5jbHVkZSA8ZHJtL3R0
bS90dG1fYm9fZHJpdmVyLmg+CiAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fcGxhY2VtZW50Lmg+Ci0j
aW5jbHVkZSA8ZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5oPgogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IHR0bV9wbGFjZSB2cmFtX3BsYWNlbWVudF9mbGFncyA9IHsKIAkuZnBmbiA9IDAsCkBAIC01ODIs
MzAgKzU4MSwxMSBAQCBzdGF0aWMgdm9pZCB2bXdfdHRtX2Rlc3Ryb3koc3RydWN0IHR0bV9ib19k
ZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fdHQgKnR0bSkKIHN0YXRpYyBpbnQgdm13X3R0bV9wb3B1
bGF0ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAkJCSAgICBzdHJ1Y3QgdHRtX3R0ICp0
dG0sIHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4KQogewotCXN0cnVjdCB2bXdfdHRtX3R0
ICp2bXdfdHQgPQotCQljb250YWluZXJfb2YodHRtLCBzdHJ1Y3Qgdm13X3R0bV90dCwgZG1hX3R0
bSk7Ci0Jc3RydWN0IHZtd19wcml2YXRlICpkZXZfcHJpdiA9IHZtd190dC0+ZGV2X3ByaXY7Ci0J
c3RydWN0IHR0bV9tZW1fZ2xvYmFsICpnbG9iID0gdm13X21lbV9nbG9iKGRldl9wcml2KTsKLQlp
bnQgcmV0OwotCisJLyogVE9ETzogbWF5YmUgY29tcGxldGVseSBkcm9wIHRoaXMgPyAqLwogCWlm
ICh0dG1fdHRfaXNfcG9wdWxhdGVkKHR0bSkpCiAJCXJldHVybiAwOwogCi0JaWYgKGRldl9wcml2
LT5tYXBfbW9kZSA9PSB2bXdfZG1hX2FsbG9jX2NvaGVyZW50KSB7Ci0JCXNpemVfdCBzaXplID0K
LQkJCXR0bV9yb3VuZF9wb3QodHRtLT5udW1fcGFnZXMgKiBzaXplb2YoZG1hX2FkZHJfdCkpOwot
CQlyZXQgPSB0dG1fbWVtX2dsb2JhbF9hbGxvYyhnbG9iLCBzaXplLCBjdHgpOwotCQlpZiAodW5s
aWtlbHkocmV0ICE9IDApKQotCQkJcmV0dXJuIHJldDsKLQotCQlyZXQgPSB0dG1fZG1hX3BvcHVs
YXRlKCZ2bXdfdHQtPmRtYV90dG0sIGRldl9wcml2LT5kZXYtPmRldiwKLQkJCQkJY3R4KTsKLQkJ
aWYgKHVubGlrZWx5KHJldCAhPSAwKSkKLQkJCXR0bV9tZW1fZ2xvYmFsX2ZyZWUoZ2xvYiwgc2l6
ZSk7Ci0JfSBlbHNlCi0JCXJldCA9IHR0bV9wb29sX3BvcHVsYXRlKHR0bSwgY3R4KTsKLQotCXJl
dHVybiByZXQ7CisJcmV0dXJuIHR0bV9wb29sX2FsbG9jKCZiZGV2LT5wb29sLCB0dG0sIGN0eCk7
CiB9CiAKIHN0YXRpYyB2b2lkIHZtd190dG1fdW5wb3B1bGF0ZShzdHJ1Y3QgdHRtX2JvX2Rldmlj
ZSAqYmRldiwKQEAgLTYxMyw5ICs1OTMsNiBAQCBzdGF0aWMgdm9pZCB2bXdfdHRtX3VucG9wdWxh
dGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiB7CiAJc3RydWN0IHZtd190dG1fdHQgKnZt
d190dCA9IGNvbnRhaW5lcl9vZih0dG0sIHN0cnVjdCB2bXdfdHRtX3R0LAogCQkJCQkJIGRtYV90
dG0pOwotCXN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYgPSB2bXdfdHQtPmRldl9wcml2Owot
CXN0cnVjdCB0dG1fbWVtX2dsb2JhbCAqZ2xvYiA9IHZtd19tZW1fZ2xvYihkZXZfcHJpdik7Ci0K
IAogCWlmICh2bXdfdHQtPm1vYikgewogCQl2bXdfbW9iX2Rlc3Ryb3kodm13X3R0LT5tb2IpOwpA
QCAtNjIzLDE0ICs2MDAsNyBAQCBzdGF0aWMgdm9pZCB2bXdfdHRtX3VucG9wdWxhdGUoc3RydWN0
IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJfQogCiAJdm13X3R0bV91bm1hcF9kbWEodm13X3R0KTsK
LQlpZiAoZGV2X3ByaXYtPm1hcF9tb2RlID09IHZtd19kbWFfYWxsb2NfY29oZXJlbnQpIHsKLQkJ
c2l6ZV90IHNpemUgPQotCQkJdHRtX3JvdW5kX3BvdCh0dG0tPm51bV9wYWdlcyAqIHNpemVvZihk
bWFfYWRkcl90KSk7Ci0KLQkJdHRtX2RtYV91bnBvcHVsYXRlKCZ2bXdfdHQtPmRtYV90dG0sIGRl
dl9wcml2LT5kZXYtPmRldik7Ci0JCXR0bV9tZW1fZ2xvYmFsX2ZyZWUoZ2xvYiwgc2l6ZSk7Ci0J
fSBlbHNlCi0JCXR0bV9wb29sX3VucG9wdWxhdGUodHRtKTsKKwl0dG1fcG9vbF9mcmVlKCZiZGV2
LT5wb29sLCB0dG0pOwogfQogCiBzdGF0aWMgc3RydWN0IHR0bV90dCAqdm13X3R0bV90dF9jcmVh
dGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKLS0gCjIuMTcuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
