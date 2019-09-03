Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8237FA7325
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 21:07:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E529A89801;
	Tue,  3 Sep 2019 19:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC74C897F5
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 19:06:58 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id g24so19589012edu.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Sep 2019 12:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ckY/KAeiZDB3HVlWWtTrREXRk00i+gfuUAhn7BUyNQc=;
 b=i+ceunnhPJHeGTtwf39MGZ56dL9Pu/QlM9P/6i2zK4zxu35d6JpqG3naV4A45VN1Cw
 WNyy53H2WpM+qTbPbHwHXbIX5g+h8JkqDSRp3q2xgMU16jw/4PZo94pSyScOdYq0Poel
 SdfF8JcVhxHe9lvtkDuiLyqE5hMJM5xPWwKCmmbMJe+uncQDv2/NsAOVOXl/8l/yc0fd
 ptANNLqEgbCtlgksvBH1W5xf09m4W8oTVvWi9m8fEO7TBZ5RNEB0aN/f+1dxCB8ATUVg
 E4VAC1ZsR9mc1jvZ41PgV4TqoYkBTDTnM4p1llu4SM7jNu4YqHTntSAupYk8okJNCjw3
 PIaQ==
X-Gm-Message-State: APjAAAVuL2jn7kYcazgsBfOHxx99USSM/VNBka1sgYKy7ixXfpGPhiPK
 GPkaHAYx7J8W+V4wKiJgal8p8WLa1K0=
X-Google-Smtp-Source: APXvYqx1BOkLWrBFwYTyatQP2rtihPWcoLWBj195C0eN89jv+ZkAeI6xRXFztEdEdx+ijWV2lChkuQ==
X-Received: by 2002:a17:906:c802:: with SMTP id
 cx2mr29826265ejb.114.1567537617137; 
 Tue, 03 Sep 2019 12:06:57 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id b12sm3655583edj.93.2019.09.03.12.06.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 12:06:56 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/atomic: Take the atomic toys away from X
Date: Tue,  3 Sep 2019 21:06:40 +0200
Message-Id: <20190903190642.32588-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ckY/KAeiZDB3HVlWWtTrREXRk00i+gfuUAhn7BUyNQc=;
 b=HcguDoinyhyklB70paAwAOsIanu+sNgBF0yAcpJHLx3t0bOo4u5VOKazsy/uNHnGkF
 doqd6Nx3eF0PJTgC8nyUow73FANyqbLGFiYOEqQBnKilYlk1pFIV3s2QTt9gQSDMSHVP
 BQtkWGqNHAkmHQp0BRaOIFWbPz9NwimF7mA5M=
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable@vger.kernel.org, Daniel Vetter <daniel.vetter@intel.com>,
 Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIC1tb2Rlc2V0dGluZyBkZHggaGFzIGEgdG90YWxseSBicm9rZW4gaWRlYSBvZiBob3cgYXRv
bWljIHdvcmtzOgotIGRvZXNuJ3QgZGlzYWJsZSBvbGQgY29ubmVjdG9ycywgYXNzdW1pbmcgdGhl
eSBnZXQgYXV0by1kaXNhYmxlIGxpa2UKICB3aXRoIHRoZSBsZWdhY3kgc2V0Y3J0YwotIGFzc3Vt
ZXMgQVNZTkNfRkxJUCBpcyB3aXJlZCB0aHJvdWdoIGZvciB0aGUgYXRvbWljIGlvY3RsCi0gbm90
IGEgc2luZ2xlIGNhbGwgdG8gVEVTVF9PTkxZCgpJb3cgdGhlIGltcGxlbWVudGF0aW9uIGlzIGEg
MToxIHRyYW5zbGF0aW9uIG9mIGxlZ2FjeSBpb2N0bHMgdG8KYXRvbWljLCB3aGljaCBpcyBhKSBi
cm9rZW4gYikgcG9pbnRsZXNzLgoKV2UgYWxyZWFkeSBoYXZlIGJ1Z3MgaW4gYm90aCBpOTE1IGFu
ZCBhbWRncHUtREMgd2hlcmUgdGhpcyBwcmV2ZW50cyB1cwpmcm9tIGVuYWJsaW5nIG5lYXQgZmVh
dHVyZXMuCgpJZiBhbnlvbmUgZXZlciBjYXJlcyBhYm91dCBhdG9taWMgaW4gWCB3ZSBjYW4gZWFz
aWx5IGFkZCBhIG5ldyBhdG9taWMKbGV2ZWwgKHJlcS0+dmFsdWUgPT0gMikgZm9yIFggdG8gZ2V0
IGJhY2sgdGhlIHNoaW55IHRveXMuCgpTaW5jZSB0aGVzZSBicm9rZW4gdmVyc2lvbnMgb2YgLW1v
ZGVzZXR0aW5nIGhhdmUgYmVlbiBzaGlwcGluZywKdGhlcmUncyByZWFsbHkgbm8gb3RoZXIgd2F5
IHRvIGdldCBvdXQgb2YgdGhpcyBiaW5kLgoKUmVmZXJlbmNlczogaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL3hvcmcveHNlcnZlci9pc3N1ZXMvNjI5ClJlZmVyZW5jZXM6IGh0dHBzOi8v
Z2l0bGFiLmZyZWVkZXNrdG9wLm9yZy94b3JnL3hzZXJ2ZXIvbWVyZ2VfcmVxdWVzdHMvMTgwCkNj
OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpD
YzogTWljaGVsIETDpG56ZXIgPG1pY2hlbEBkYWVuemVyLm5ldD4KQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGRldWNoZXJAZ21haWwuY29tPgpDYzogQWRhbSBKYWNrc29uIDxhamF4QHJlZGhhdC5jb20+
CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGll
ZEBsaW51eC5pZT4KQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9pb2N0bC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2lvY3RsLmMKaW5kZXggMmMxMjBjNThmNzJkLi4xY2I3YjRjM2M4N2MgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1faW9jdGwuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2lv
Y3RsLmMKQEAgLTMzNCw2ICszMzQsOSBAQCBkcm1fc2V0Y2xpZW50Y2FwKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KQogCQlmaWxl
X3ByaXYtPnVuaXZlcnNhbF9wbGFuZXMgPSByZXEtPnZhbHVlOwogCQlicmVhazsKIAljYXNlIERS
TV9DTElFTlRfQ0FQX0FUT01JQzoKKwkJLyogVGhlIG1vZGVzZXR0aW5nIEREWCBoYXMgYSB0b3Rh
bGx5IGJyb2tlbiBpZGVhIG9mIGF0b21pYy4gKi8KKwkJaWYgKHN0cnN0cihjdXJyZW50LT5jb21t
LCAiWCIpKQorCQkJcmV0dXJuIC1FT1BOT1RTVVBQOwogCQlpZiAoIWRybV9jb3JlX2NoZWNrX2Zl
YXR1cmUoZGV2LCBEUklWRVJfQVRPTUlDKSkKIAkJCXJldHVybiAtRU9QTk9UU1VQUDsKIAkJaWYg
KHJlcS0+dmFsdWUgPiAxKQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
