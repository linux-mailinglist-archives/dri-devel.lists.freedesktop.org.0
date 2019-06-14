Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 040B346A52
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:37:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 687E0893EC;
	Fri, 14 Jun 2019 20:36:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B6789402
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:35 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w13so5255600eds.4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5HF71Ri55F3zqup3bp4EusHWzTvKdy4yFGy6BpewAc0=;
 b=jakPtfzNHhr8lsnWmISOc0Rw03krOOvUBvx5Y7Z6etTP5KqQuwAgXxqc7zRsSJ8mCT
 5nf1KnO7ta0Un2j9RfhaQjHRa4WzovaNI6NbCndcAdiEBkvRsGWxMsUKmouuwRXC/Meb
 DriWZH1mbJiC42quUPbsl42GUCdrYUqPM8jGtTcQepz95E3ea9pFuxWoy+lrEST0rhks
 fLAJ1AUx5n4tFbMPkweOx1clEos8+Gc+KpRtFB8ky+HgRAK5UJ3l2P3m3A9alnUBJr7V
 C4iLGay4b74qhNEMtpmcrBtUV0G8YvsAgtpca8qP2Xa/zfQqWHjNJwQr7j1BH4T0DleJ
 OjAQ==
X-Gm-Message-State: APjAAAXATU4+4maj1yoWjCQvXxjk1pitKq5/ho+5fNFtIeTabOroeYpS
 M0wUlkCLCoJ3HIA7nhkZIONsT2dUlXM=
X-Google-Smtp-Source: APXvYqzDAiRqwD979zghyiDe5PyS2ZrefOeykj0D3LRpc1j+C+vEf4kyPKm5wN8+djSihET5uLEksg==
X-Received: by 2002:a17:906:470a:: with SMTP id
 y10mr28425060ejq.115.1560544593534; 
 Fri, 14 Jun 2019 13:36:33 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.32
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:32 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/59] drm/arc: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:26 +0200
Message-Id: <20190614203615.12639-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5HF71Ri55F3zqup3bp4EusHWzTvKdy4yFGy6BpewAc0=;
 b=JNkwI1efr1151tYD0PQtsb5i0W8dJkMv9KKpjzCcykxvt2QixUT9R/ZTnuCflgZiIB
 1mZzaYhrGFj6PqT+HPNR77Orv62YWHN1w0KafbI8c2Tv8V/Ysg9a3KFKu5IctFtbuuP6
 teIwx5J2YtTh7dcvm4xKaL5/crvJ1lA0EHUEc=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBBbGV4ZXkgQnJv
ZGtpbiA8YWJyb2RraW5Ac3lub3BzeXMuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcmMvYXJj
cGd1X2Rydi5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2FyYy9hcmNwZ3VfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YXJjL2FyY3BndV9kcnYuYwppbmRleCA3NDI0MGNjMWMzMDAuLjZiN2Y3OTE2ODVlYyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FyYy9hcmNwZ3VfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FyYy9hcmNwZ3VfZHJ2LmMKQEAgLTE0OSw4ICsxNDksNiBAQCBzdGF0aWMgc3RydWN0IGRy
bV9kcml2ZXIgYXJjcGd1X2RybV9kcml2ZXIgPSB7CiAJLmdlbV9mcmVlX29iamVjdF91bmxvY2tl
ZCA9IGRybV9nZW1fY21hX2ZyZWVfb2JqZWN0LAogCS5nZW1fcHJpbnRfaW5mbyA9IGRybV9nZW1f
Y21hX3ByaW50X2luZm8sCiAJLmdlbV92bV9vcHMgPSAmZHJtX2dlbV9jbWFfdm1fb3BzLAotCS5n
ZW1fcHJpbWVfZXhwb3J0ID0gZHJtX2dlbV9wcmltZV9leHBvcnQsCi0JLmdlbV9wcmltZV9pbXBv
cnQgPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKIAkuZ2VtX3ByaW1lX2dldF9zZ190YWJsZSA9IGRy
bV9nZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZSwKIAkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJs
ZSA9IGRybV9nZW1fY21hX3ByaW1lX2ltcG9ydF9zZ190YWJsZSwKIAkuZ2VtX3ByaW1lX3ZtYXAg
PSBkcm1fZ2VtX2NtYV9wcmltZV92bWFwLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
