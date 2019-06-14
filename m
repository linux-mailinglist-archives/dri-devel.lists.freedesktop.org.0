Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245DD45D11
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:41:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 161B58935B;
	Fri, 14 Jun 2019 12:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC56B8935A;
 Fri, 14 Jun 2019 12:41:32 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id n9so2412540wru.0;
 Fri, 14 Jun 2019 05:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Tr871nsuPUessZ2bWQYw8KM2Rhm9zDW+q+EHUwqz0SI=;
 b=Q4WlXeX/YR7KCkt49xNSqr/eeX26T+2qETtrwCviJtvkk7L83H5JuM51OW3DSDD+L4
 0Yt5P+tpz6kqXC2eGyUiQgISiAotQPrk09lsT+Q0FYOb3/i4qjnl8W7+cO3HM/HvcVjR
 B9IVaNGbTTpIxMbEZKiyh8EdS5TQquY9iaVydwsUars26dRVX5Anpi+VtMT2Cg+K0z//
 EfXNKtkIQwjrAkMM9iYs8Tm4zWsIWP3fMSKSfqSrTYFh3bNVJffRdNu308FpvgvkaxME
 94d1PLk5/7CNKeIzP9Pd59Je9AEhVaaIkPddlQgvY6pS26njdAvhyIOm6fmFxdzYmjeB
 qKJA==
X-Gm-Message-State: APjAAAU84f3fn4FT45+9z4w2dFXZPH42zvJbBX9n8d25SN1ne5HwxU9b
 RTegAvMxvXVof70lVUezqd4=
X-Google-Smtp-Source: APXvYqyzNlBKJCoQuX4ZgsYHo08dDzivgT9Ft6RDIkjEsdB1jkl76sickuRQBFCGcXcmKEYfhM0ncw==
X-Received: by 2002:adf:fb47:: with SMTP id c7mr28050488wrs.116.1560516091594; 
 Fri, 14 Jun 2019 05:41:31 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e0eb:ed4e:b781:3e9f])
 by smtp.gmail.com with ESMTPSA id n1sm2648209wrx.39.2019.06.14.05.41.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 05:41:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, yuq825@gmail.com, eric@anholt.net,
 peterz@infradead.org, thellstrom@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH 4/6] drm/etnaviv: use new ww_mutex_(un)lock_for_each macros
Date: Fri, 14 Jun 2019 14:41:23 +0200
Message-Id: <20190614124125.124181-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190614124125.124181-1-christian.koenig@amd.com>
References: <20190614124125.124181-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Tr871nsuPUessZ2bWQYw8KM2Rhm9zDW+q+EHUwqz0SI=;
 b=HNEI9YUO4lBZW0DBXk5plxjkkx4xQ/YflRzByiAcXkH4cwflz+XvBCOOwzXZJLhC7o
 GxW+Ubr+oumu4sc42tY/cVho0+2gxLTw3mEiM4rCWRtJwVngZqQkV3kClYv17EqkKbuK
 FUIvtVA461czRvWSdgj8+yTRwMkYtsEXoPgP254I9QQsVtkaT5xOphCi0t6bNtnSb74A
 MBbglKuALMuorwBp59wdDD/wFDPtd8wnzn1R08YUDBUz3m6w/clWTtB/Af1EhDcwV4Gd
 90zc9J/Jq1I/38b1uBkaPxUsNL1q6p4PSwqJtuKHElDjOds3g+uHBURvFk4hUX/OtMVz
 nIrg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBwcm92aWRlZCBtYWNyb3MgaW5zdGVhZCBvZiBpbXBsZW1lbnRpbmcgZGVhZGxvY2sg
aGFuZGxpbmcgb24gb3VyIG93bi4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2dlbV9zdWJtaXQuYyB8IDU1ICsrKysrLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTQgaW5zZXJ0aW9ucygrKSwgNDEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fc3VibWl0LmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZXRuYXZpdi9ldG5hdml2X2dlbV9zdWJtaXQuYwppbmRleCBlMDU0ZjA5YWM4MjguLjkyM2I4YTcx
ZjgwZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fc3Vi
bWl0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9nZW1fc3VibWl0LmMK
QEAgLTExOCw1NSArMTE4LDI4IEBAIHN0YXRpYyB2b2lkIHN1Ym1pdF91bmxvY2tfb2JqZWN0KHN0
cnVjdCBldG5hdml2X2dlbV9zdWJtaXQgKnN1Ym1pdCwgaW50IGkpCiBzdGF0aWMgaW50IHN1Ym1p
dF9sb2NrX29iamVjdHMoc3RydWN0IGV0bmF2aXZfZ2VtX3N1Ym1pdCAqc3VibWl0LAogCQlzdHJ1
Y3Qgd3dfYWNxdWlyZV9jdHggKnRpY2tldCkKIHsKLQlpbnQgY29udGVuZGVkLCBzbG93X2xvY2tl
ZCA9IC0xLCBpLCByZXQgPSAwOwotCi1yZXRyeToKLQlmb3IgKGkgPSAwOyBpIDwgc3VibWl0LT5u
cl9ib3M7IGkrKykgewotCQlzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiA9ICZzdWJtaXQtPmJv
c1tpXS5vYmotPmJhc2U7Ci0KLQkJaWYgKHNsb3dfbG9ja2VkID09IGkpCi0JCQlzbG93X2xvY2tl
ZCA9IC0xOwotCi0JCWNvbnRlbmRlZCA9IGk7CisJc3RydWN0IHd3X211dGV4ICpjb250ZW5kZWQ7
CisJaW50IGksIHJldCA9IDA7CiAKLQkJaWYgKCEoc3VibWl0LT5ib3NbaV0uZmxhZ3MgJiBCT19M
T0NLRUQpKSB7Ci0JCQlyZXQgPSB3d19tdXRleF9sb2NrX2ludGVycnVwdGlibGUoJm9iai0+cmVz
di0+bG9jaywKLQkJCQkJCQkgIHRpY2tldCk7Ci0JCQlpZiAocmV0ID09IC1FQUxSRUFEWSkKLQkJ
CQlEUk1fRVJST1IoIkJPIGF0IGluZGV4ICV1IGFscmVhZHkgb24gc3VibWl0IGxpc3RcbiIsCi0J
CQkJCSAgaSk7Ci0JCQlpZiAocmV0KQotCQkJCWdvdG8gZmFpbDsKLQkJCXN1Ym1pdC0+Ym9zW2ld
LmZsYWdzIHw9IEJPX0xPQ0tFRDsKLQkJfQorCXd3X211dGV4X2xvY2tfZm9yX2VhY2goZm9yIChp
ID0gMDsgaSA8IHN1Ym1pdC0+bnJfYm9zOyBpKyspLAorCQkJICAgICAgICZzdWJtaXQtPmJvc1tp
XS5vYmotPmJhc2UucmVzdi0+bG9jaywKKwkJCSAgICAgICBjb250ZW5kZWQsIHJldCwgdHJ1ZSwg
dGlja2V0KSB7CisJCWlmIChyZXQgPT0gLUVBTFJFQURZKQorCQkJRFJNX0VSUk9SKCJCTyBhdCBp
bmRleCAldSBhbHJlYWR5IG9uIHN1Ym1pdCBsaXN0XG4iLCBpKTsKKwkJaWYgKHJldCkKKwkJCWdv
dG8gZmFpbDsKIAl9CiAKKwlmb3IgKGkgPSAwOyBpIDwgc3VibWl0LT5ucl9ib3M7IGkrKykKKwkJ
c3VibWl0LT5ib3NbaV0uZmxhZ3MgfD0gQk9fTE9DS0VEOwogCXd3X2FjcXVpcmVfZG9uZSh0aWNr
ZXQpOwogCiAJcmV0dXJuIDA7CiAKIGZhaWw6Ci0JZm9yICg7IGkgPj0gMDsgaS0tKQotCQlzdWJt
aXRfdW5sb2NrX29iamVjdChzdWJtaXQsIGkpOwotCi0JaWYgKHNsb3dfbG9ja2VkID4gMCkKLQkJ
c3VibWl0X3VubG9ja19vYmplY3Qoc3VibWl0LCBzbG93X2xvY2tlZCk7Ci0KLQlpZiAocmV0ID09
IC1FREVBRExLKSB7Ci0JCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqOwotCi0JCW9iaiA9ICZz
dWJtaXQtPmJvc1tjb250ZW5kZWRdLm9iai0+YmFzZTsKLQotCQkvKiB3ZSBsb3N0IG91dCBpbiBh
IHNlcW5vIHJhY2UsIGxvY2sgYW5kIHJldHJ5Li4gKi8KLQkJcmV0ID0gd3dfbXV0ZXhfbG9ja19z
bG93X2ludGVycnVwdGlibGUoJm9iai0+cmVzdi0+bG9jaywKLQkJCQkJCSAgICAgICB0aWNrZXQp
OwotCQlpZiAoIXJldCkgewotCQkJc3VibWl0LT5ib3NbY29udGVuZGVkXS5mbGFncyB8PSBCT19M
T0NLRUQ7Ci0JCQlzbG93X2xvY2tlZCA9IGNvbnRlbmRlZDsKLQkJCWdvdG8gcmV0cnk7Ci0JCX0K
LQl9Ci0KKwl3d19tdXRleF91bmxvY2tfZm9yX2VhY2goZm9yIChpID0gMDsgaSA8IHN1Ym1pdC0+
bnJfYm9zOyBpKyspLAorCQkJCSAmc3VibWl0LT5ib3NbaV0ub2JqLT5iYXNlLnJlc3YtPmxvY2ss
CisJCQkJIGNvbnRlbmRlZCk7CiAJcmV0dXJuIHJldDsKIH0KIAotLSAKMi4xNy4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
