Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEB1C069F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2019 15:47:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612FE6E22A;
	Fri, 27 Sep 2019 13:47:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50D836E22A;
 Fri, 27 Sep 2019 13:47:38 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id i14so3512993pgt.11;
 Fri, 27 Sep 2019 06:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LgNE1dnflbO76HHoSzXDBrhS2Qt9Qg9bvtNf3mYw86I=;
 b=T7ziUE+PJT5VUvLqZGsWjs3lO4uxbSNUK2mKCHZmiwn/sCnThHSWWjX18SiTFBGHmP
 o3ijkhfQFk9tcigoxLYwtaKjY4lmrECdcBsmgOVh6PyplbVuusekOziRjbWZcLP+lvFO
 Kj+au60oGdketna8jEvS8jQx/e7ohJExvQI4JJMcq0oTx97GCdFXrXsWy72J2KkoFold
 7/Y3oCrNlmjaEAekEGcYAN8qC4YO9yZW2aAOXCDgr2QbpWV6chr1bkUQQJTfgzkVcpZ8
 douYsMCwQky1ysw7kJCqWKAXiFIgImceAPwBmaC4mf3JHDhhU/JdJJQw8+blivu/V5w+
 w0Fw==
X-Gm-Message-State: APjAAAWcC45OCecNl0ciztzZkPr7GHmlNA6WPR1zSLN87x8V+3mCCvkr
 PBmMvvxq48vKPWOLxZPREKf4hWrql2Q=
X-Google-Smtp-Source: APXvYqwwHWMqYdUtw+4kFiwkUrXCikUrN/LGx+TS3Ct/ckajj7Ptg+mbYAdCoEYMXsuyBiIPYg9j8w==
X-Received: by 2002:a63:d846:: with SMTP id k6mr9407645pgj.378.1569592057691; 
 Fri, 27 Sep 2019 06:47:37 -0700 (PDT)
Received: from localhost.localdomain (ah.ptr230.ptrcloud.net. [153.122.161.8])
 by smtp.gmail.com with ESMTPSA id
 q71sm5608860pjb.26.2019.09.27.06.47.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 06:47:37 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm/lima: add __GFP_NOWARN flag to all dma_alloc_wc
Date: Fri, 27 Sep 2019 21:46:16 +0800
Message-Id: <20190927134616.21899-7-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190927134616.21899-1-yuq825@gmail.com>
References: <20190927134616.21899-1-yuq825@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LgNE1dnflbO76HHoSzXDBrhS2Qt9Qg9bvtNf3mYw86I=;
 b=kfUKqSjumKv76d0ksK5/sd/yt/R2KmEFkkY8xxAkhK/SFKJXRP2OWzDsoVTkoLjyTb
 2w98lAs39X/2fmoIMZq4NDjoF7f7tmzBpS6WRE75MVvGR+W6K1ah67BCo7i2GsA9aXXP
 f8B+sKfs7pFz8ynl3AKoNPWSqfECftdX7vR59JM9RecVKZe2UIJtyZ6jcq97RWVMFkLm
 A4sih3O5DQsInPQ41yVqG+bfd0vFzKoGpWCKyi5o5Y74KdVTflVRJuoRvvMxsRshs0vy
 f5f/AgIBpgtDqw1t42WMjkZJVj1x2jHIZKzWq4GW4Bk3Rd1yIViAgXMLMXJmq788C0sJ
 D8Ow==
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
Cc: lima@lists.freedesktop.org, Maxime Ripard <maxime.ripard@bootlin.com>,
 David Airlie <airlied@linux.ie>, Qiang Yu <yuq825@gmail.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwcmV2ZW50IENNQSBwcmludGluZyBkdW15ICJQRk5zIGJ1c3kiIGluZm8gd2hpY2ggaXMK
Y2F1c2VkIGJ5IGFsbG9jIGZhaWwgcmUtdHJ5IGNhc2UuCgpTaWduZWQtb2ZmLWJ5OiBRaWFuZyBZ
dSA8eXVxODI1QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2Rldmlj
ZS5jIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV92bS5jICAgICB8IDQgKystLQog
MiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2UuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9saW1hL2xpbWFfZGV2aWNlLmMKaW5kZXggZDg2YjhkODFhNDgzLi4zZDFhMmI0ZDEwMDUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2aWNlLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2UuYwpAQCAtMzEzLDcgKzMxMyw3IEBAIGludCBsaW1h
X2RldmljZV9pbml0KHN0cnVjdCBsaW1hX2RldmljZSAqbGRldikKIAkJbGRldi0+dmFfZW5kID0g
TElNQV9WQV9SRVNFUlZFX1NUQVJUOwogCQlsZGV2LT5kbGJ1X2NwdSA9IGRtYV9hbGxvY193YygK
IAkJCWxkZXYtPmRldiwgTElNQV9QQUdFX1NJWkUsCi0JCQkmbGRldi0+ZGxidV9kbWEsIEdGUF9L
RVJORUwpOworCQkJJmxkZXYtPmRsYnVfZG1hLCBHRlBfS0VSTkVMIHwgX19HRlBfTk9XQVJOKTsK
IAkJaWYgKCFsZGV2LT5kbGJ1X2NwdSkgewogCQkJZXJyID0gLUVOT01FTTsKIAkJCWdvdG8gZXJy
X291dDI7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX3ZtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbGltYS9saW1hX3ZtLmMKaW5kZXggOGU2OWM0NTQwZThiLi44NDBlMjM1MGQ4
NzIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfdm0uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vbGltYS9saW1hX3ZtLmMKQEAgLTU2LDcgKzU2LDcgQEAgc3RhdGljIGludCBs
aW1hX3ZtX21hcF9wYWdlKHN0cnVjdCBsaW1hX3ZtICp2bSwgZG1hX2FkZHJfdCBwYSwgdTMyIHZh
KQogCiAJCXZtLT5idHNbcGJlXS5jcHUgPSBkbWFfYWxsb2Nfd2MoCiAJCQl2bS0+ZGV2LT5kZXYs
IExJTUFfUEFHRV9TSVpFIDw8IExJTUFfVk1fTlVNX1BUX1BFUl9CVF9TSElGVCwKLQkJCSZ2bS0+
YnRzW3BiZV0uZG1hLCBHRlBfS0VSTkVMIHwgX19HRlBfWkVSTyk7CisJCQkmdm0tPmJ0c1twYmVd
LmRtYSwgR0ZQX0tFUk5FTCB8IF9fR0ZQX05PV0FSTiB8IF9fR0ZQX1pFUk8pOwogCQlpZiAoIXZt
LT5idHNbcGJlXS5jcHUpCiAJCQlyZXR1cm4gLUVOT01FTTsKIApAQCAtMjA4LDcgKzIwOCw3IEBA
IHN0cnVjdCBsaW1hX3ZtICpsaW1hX3ZtX2NyZWF0ZShzdHJ1Y3QgbGltYV9kZXZpY2UgKmRldikK
IAlrcmVmX2luaXQoJnZtLT5yZWZjb3VudCk7CiAKIAl2bS0+cGQuY3B1ID0gZG1hX2FsbG9jX3dj
KGRldi0+ZGV2LCBMSU1BX1BBR0VfU0laRSwgJnZtLT5wZC5kbWEsCi0JCQkJICBHRlBfS0VSTkVM
IHwgX19HRlBfWkVSTyk7CisJCQkJICBHRlBfS0VSTkVMIHwgX19HRlBfTk9XQVJOIHwgX19HRlBf
WkVSTyk7CiAJaWYgKCF2bS0+cGQuY3B1KQogCQlnb3RvIGVycl9vdXQwOwogCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
