Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6F16ADF3
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 19:51:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7735E6E170;
	Tue, 16 Jul 2019 17:51:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C656E16D;
 Tue, 16 Jul 2019 17:51:38 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id 4so3531663pld.10;
 Tue, 16 Jul 2019 10:51:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UiLaRqQi+KN5P/cP6egPb78oRpeEozQB/t5Ad8Uztd4=;
 b=sEAAPG2MjtWLaBOmuz6d3L8QoVd0abF8irrZyTFrDgLYFZAPTtTrFz8axbtknWFfPx
 +IPloko84Q2rB/ebRzPo98H1CLbZFurtsAnl7XQ3Lxy0Cfw8WuBhRYwt7H8UTt4Z7U39
 1KmOarMzIMTAVDYpXuUA5YeR9JHBRIscbvr0aXWuDVOb+EzDnrWUBPIjlZdfwglL2ss3
 Bg/M2RbFnLSYirltwbO8Xnk5M4FPJ+4E2hRMpOu9cZuEYlPBMRBNGPmLyrwozGX/T305
 fkYP6OIN4Rg9GVr8zgpAhcxVZhFmJ3Jnu0xo5PKGCvDx+cAj1RgQp/uSuz2NL9tHAV6j
 QdWQ==
X-Gm-Message-State: APjAAAUwvaWjwsC5rO3N9wNTvbVaByZIE50fpjS+Bl1XbxQO2z58349U
 1TVSde5yJsulU8qS3iIbx457pMbVe/I=
X-Google-Smtp-Source: APXvYqzFKslRA486uFuMA8KNQnLtCFo8RE9hfK9nYj7zlrGlay5yFSTuwTPyyWNjseq42zgOr7Agbw==
X-Received: by 2002:a17:902:b20c:: with SMTP id
 t12mr37712885plr.285.1563299497373; 
 Tue, 16 Jul 2019 10:51:37 -0700 (PDT)
Received: from localhost ([100.118.89.203])
 by smtp.gmail.com with ESMTPSA id g8sm2243238pgk.1.2019.07.16.10.51.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 10:51:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/3] drm/vgem: use normal cached mmap'ings
Date: Tue, 16 Jul 2019 10:43:23 -0700
Message-Id: <20190716174331.7371-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190716174331.7371-1-robdclark@gmail.com>
References: <20190716174331.7371-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UiLaRqQi+KN5P/cP6egPb78oRpeEozQB/t5Ad8Uztd4=;
 b=hE+P9H/tFUK8qpoBOYsg1V+ORebpPk0bjpfOrC11X3dwjJrq2UGU4kOsytw14cbTLr
 wOCN+LCKewt/JS2Z7zT+JsuLCfkk4iUXQE8zLGFD5oXwY1X2j/uwAXBu3t6Q4Bnvn1Wx
 vFmYwvPOkVkNb6SrLMRO9kIvJjMAHedXhrxRwMH2aOEKlBKWbDH52oySlExA8sO0L5qN
 Z3Y5nlT3eMF64tjLSabZV4HyjvDWAdJhcAkwUJkcqINqNFuuzyiWRzNwT8mlUVt6FN25
 WCb2Gw3g9txNOZzeaUw2/X1747vo9vF+zVUp2X9B2xpJwRDDKucIlInL8yT74rg4dCQj
 Rqng==
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
Cc: Rob Clark <robdclark@chromium.org>, Deepak Sharma <deepak.sharma@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Eric Biggers <ebiggers@google.com>,
 David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKU2luY2UgdGhlcmUgaXMg
bm8gcmVhbCBkZXZpY2UgYXNzb2NpYXRlZCB3aXRoIFZHRU0sIGl0IGlzIGltcG9zc2libGUgdG8K
ZW5kIHVwIHdpdGggYXBwcm9wcmlhdGUgZGV2LT5kbWFfb3BzLCBtZWFuaW5nIHRoYXQgd2UgaGF2
ZSBubyB3YXkgdG8KaW52YWxpZGF0ZSB0aGUgc2htZW0gcGFnZXMgYWxsb2NhdGVkIGJ5IFZHRU0u
ICBTbywgYXQgbGVhc3Qgb24gcGxhdGZvcm1zCndpdGhvdXQgZHJtX2NmbHVzaF9wYWdlcygpLCB3
ZSBlbmQgdXAgd2l0aCBjb3JydXB0aW9uIHdoZW4gY2FjaGUgbGluZXMKZnJvbSBwcmV2aW91cyB1
c2FnZSBvZiBWR0VNIGJvIHBhZ2VzIGdldCBldmljdGVkIHRvIG1lbW9yeS4KClRoZSBvbmx5IHNh
bmUgb3B0aW9uIGlzIHRvIHVzZSBjYWNoZWQgbWFwcGluZ3MuCgpTaWduZWQtb2ZmLWJ5OiBSb2Ig
Q2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3ZnZW0v
dmdlbV9kcnYuYyB8IDI0ICsrKysrKysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDE0IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS92Z2VtL3ZnZW1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5j
CmluZGV4IGExNzllOTYyYjc5ZS4uYjYwNzFhNDY2YjkyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdmdlbS92Z2VtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92Z2VtL3ZnZW1fZHJ2
LmMKQEAgLTI1OSw5ICsyNTksNiBAQCBzdGF0aWMgaW50IHZnZW1fbW1hcChzdHJ1Y3QgZmlsZSAq
ZmlscCwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJl
dDsKIAotCS8qIEtlZXAgdGhlIFdDIG1tYXBpbmcgc2V0IGJ5IGRybV9nZW1fbW1hcCgpIGJ1dCBv
dXIgcGFnZXMKLQkgKiBhcmUgb3JkaW5hcnkgYW5kIG5vdCBzcGVjaWFsLgotCSAqLwogCXZtYS0+
dm1fZmxhZ3MgPSBmbGFncyB8IFZNX0RPTlRFWFBBTkQgfCBWTV9ET05URFVNUDsKIAlyZXR1cm4g
MDsKIH0KQEAgLTMxMCwxNyArMzA3LDE3IEBAIHN0YXRpYyB2b2lkIHZnZW1fdW5waW5fcGFnZXMo
c3RydWN0IGRybV92Z2VtX2dlbV9vYmplY3QgKmJvKQogc3RhdGljIGludCB2Z2VtX3ByaW1lX3Bp
bihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0
cnVjdCBkcm1fdmdlbV9nZW1fb2JqZWN0ICpibyA9IHRvX3ZnZW1fYm8ob2JqKTsKLQlsb25nIG5f
cGFnZXMgPSBvYmotPnNpemUgPj4gUEFHRV9TSElGVDsKKwlsb25nIGksIG5fcGFnZXMgPSBvYmot
PnNpemUgPj4gUEFHRV9TSElGVDsKIAlzdHJ1Y3QgcGFnZSAqKnBhZ2VzOwogCiAJcGFnZXMgPSB2
Z2VtX3Bpbl9wYWdlcyhibyk7CiAJaWYgKElTX0VSUihwYWdlcykpCiAJCXJldHVybiBQVFJfRVJS
KHBhZ2VzKTsKIAotCS8qIEZsdXNoIHRoZSBvYmplY3QgZnJvbSB0aGUgQ1BVIGNhY2hlIHNvIHRo
YXQgaW1wb3J0ZXJzIGNhbiByZWx5Ci0JICogb24gY29oZXJlbnQgaW5kaXJlY3QgYWNjZXNzIHZp
YSB0aGUgZXhwb3J0ZWQgZG1hLWFkZHJlc3MuCi0JICovCi0JZHJtX2NsZmx1c2hfcGFnZXMocGFn
ZXMsIG5fcGFnZXMpOworCWZvciAoaSA9IDA7IGkgPCBuX3BhZ2VzOyBpKyspIHsKKwkJZG1hX3N5
bmNfc2luZ2xlX2Zvcl9kZXZpY2UoZGV2LCBwYWdlX3RvX3BoeXMocGFnZXNbaV0pLAorCQkJCQkg
ICBQQUdFX1NJWkUsIERNQV9CSURJUkVDVElPTkFMKTsKKwl9CiAKIAlyZXR1cm4gMDsKIH0KQEAg
LTMyOCw2ICszMjUsMTMgQEAgc3RhdGljIGludCB2Z2VtX3ByaW1lX3BpbihzdHJ1Y3QgZHJtX2dl
bV9vYmplY3QgKm9iaiwgc3RydWN0IGRldmljZSAqZGV2KQogc3RhdGljIHZvaWQgdmdlbV9wcmlt
ZV91bnBpbihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgc3RydWN0IGRldmljZSAqZGV2KQog
ewogCXN0cnVjdCBkcm1fdmdlbV9nZW1fb2JqZWN0ICpibyA9IHRvX3ZnZW1fYm8ob2JqKTsKKwls
b25nIGksIG5fcGFnZXMgPSBvYmotPnNpemUgPj4gUEFHRV9TSElGVDsKKwlzdHJ1Y3QgcGFnZSAq
KnBhZ2VzID0gYm8tPnBhZ2VzOworCisJZm9yIChpID0gMDsgaSA8IG5fcGFnZXM7IGkrKykgewor
CQlkbWFfc3luY19zaW5nbGVfZm9yX2NwdShkZXYsIHBhZ2VfdG9fcGh5cyhwYWdlc1tpXSksCisJ
CQkJCVBBR0VfU0laRSwgRE1BX0JJRElSRUNUSU9OQUwpOworCX0KIAogCXZnZW1fdW5waW5fcGFn
ZXMoYm8pOwogfQpAQCAtMzgyLDcgKzM4Niw3IEBAIHN0YXRpYyB2b2lkICp2Z2VtX3ByaW1lX3Zt
YXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCiAJaWYgKElTX0VSUihwYWdlcykpCiAJCXJl
dHVybiBOVUxMOwogCi0JcmV0dXJuIHZtYXAocGFnZXMsIG5fcGFnZXMsIDAsIHBncHJvdF93cml0
ZWNvbWJpbmUoUEFHRV9LRVJORUwpKTsKKwlyZXR1cm4gdm1hcChwYWdlcywgbl9wYWdlcywgMCwg
UEFHRV9LRVJORUwpOwogfQogCiBzdGF0aWMgdm9pZCB2Z2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3Qg
ZHJtX2dlbV9vYmplY3QgKm9iaiwgdm9pZCAqdmFkZHIpCkBAIC00MTEsNyArNDE1LDcgQEAgc3Rh
dGljIGludCB2Z2VtX3ByaW1lX21tYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosCiAJZnB1
dCh2bWEtPnZtX2ZpbGUpOwogCXZtYS0+dm1fZmlsZSA9IGdldF9maWxlKG9iai0+ZmlscCk7CiAJ
dm1hLT52bV9mbGFncyB8PSBWTV9ET05URVhQQU5EIHwgVk1fRE9OVERVTVA7Ci0Jdm1hLT52bV9w
YWdlX3Byb3QgPSBwZ3Byb3Rfd3JpdGVjb21iaW5lKHZtX2dldF9wYWdlX3Byb3Qodm1hLT52bV9m
bGFncykpOworCXZtYS0+dm1fcGFnZV9wcm90ID0gdm1fZ2V0X3BhZ2VfcHJvdCh2bWEtPnZtX2Zs
YWdzKTsKIAogCXJldHVybiAwOwogfQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
