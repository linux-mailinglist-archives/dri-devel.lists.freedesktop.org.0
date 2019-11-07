Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7793BF39FA
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 22:03:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FF76F7BF;
	Thu,  7 Nov 2019 21:03:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93EA66F7BB
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 21:03:20 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id y64so1132405ywe.3
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Nov 2019 13:03:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oygH01nqalvIc07wdgdaNh2D6+M1eA2NsoFjJs/rDb0=;
 b=RRgq4G0gZVkNDX4zfUXtYtoJRes6T0f3+zUYbRt7tIxSFkqPNMcNfCGd2BgHHlmxaQ
 Df6S14tvEkTt4cBL0UAiKk3WF8lJpY78MHTrP7ab3vD2ptzWw2oOVcBl9WGOuqwFdCHt
 0jt1ZwWvvL6mvjJ2jGCPIrC5wm6zD2n+3TYrXC2qNYbh7p1h9yKmJo41ZwZhcQ5Ef6WX
 wz1qu4ZdAGXMPlHjxLCwsagpLxZhUDCTPM5kUEBemESjmwG6X9kkrE/uFZ1IRxH1f+3T
 5Go0/HY4bP6WFxoLz9IzwrizjZQRyiB/zk5mPlB+GR8Efx+MSvuR3xOMkZVaGk/TAwlA
 1Pow==
X-Gm-Message-State: APjAAAXfLe9+Sne8QM33hokgfq+j8OGwsfCG5njx8tShRYDlw85/IJDJ
 f6mgZi41OBH4GkyDPqNhTDQ+qO+ZScQ=
X-Google-Smtp-Source: APXvYqybyUG3wYkJ3VuqgaYSln7LF9ZLFNUkASeuMvWC6u9J0rW2V9pyns2Zw600jfzNSnsYKf2Odw==
X-Received: by 2002:a0d:cc91:: with SMTP id o139mr4228911ywd.373.1573160599586; 
 Thu, 07 Nov 2019 13:03:19 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id r14sm1064196ywl.97.2019.11.07.13.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2019 13:03:19 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm: trace: Make the vblank queued/delivered events
 classed
Date: Thu,  7 Nov 2019 16:03:00 -0500
Message-Id: <20191107210316.143216-2-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191107210316.143216-1-sean@poorly.run>
References: <20191107210316.143216-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oygH01nqalvIc07wdgdaNh2D6+M1eA2NsoFjJs/rDb0=;
 b=KTF28fihFWzJ8ff6rJKJ6Ewe+3QwnTlEM+4+QqV2AVD2G0sa2z+oq4pKP0eMDaOyZe
 rjq55tk25mxy1+cj7P/8sZazXnIGyGCNscjnNZbOH57Lq8TDBz+078xFG6GgJgCLdR53
 dUQdZ62QsUYAcudkbrltrYYVZl+alVFkjiseQEsExitp7nu4/dLrkU0b++IOdx3TL4Cr
 HOeFAETYYf9baKQegpnuBAMMAfNH/UfkyYTNV8jmfzmanXwGqU3pdW/MMfqxE1aLQx3R
 PjuuQWpma1NXbKYTrNRGgRKYOAP8/7lxtvK+WHE5A9SgwEbfvbeHhR2WpXry+S3zxQtC
 AA+A==
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
Cc: daniel.vetter@ffwll.ch, Sean Paul <seanpaul@chromium.org>,
 tzimmermann@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpXZSBjYW4gdXNlIGFuIGV2
ZW50IGNsYXNzIHRvIHJlbW92ZSBzb21lIGJvaWxlcnBsYXRlIGZvciB0aGUgZXZlbnQKcXVldWVk
L2RlbGl2ZXJlZCB0cmFjZSBldmVudHMuCgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5w
YXVsQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3RyYWNlLmggfCAyNyAr
KysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMo
KyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdHJh
Y2UuaCBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fdHJhY2UuaAppbmRleCAxMWM2ZGQ1NzdlOGVkLi40
ODdiYzM0NzhlZmVjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3RyYWNlLmgKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV90cmFjZS5oCkBAIC0zMiw3ICszMiw3IEBAIFRSQUNFX0VW
RU5UKGRybV92YmxhbmtfZXZlbnQsCiAJCQlfX2VudHJ5LT5oaWdoX3ByZWMgPyAidHJ1ZSIgOiAi
ZmFsc2UiKQogKTsKIAotVFJBQ0VfRVZFTlQoZHJtX3ZibGFua19ldmVudF9xdWV1ZWQsCitERUNM
QVJFX0VWRU5UX0NMQVNTKGNsYXNzX2RybV92YmxhbmtfZXZlbnQsCiAJICAgIFRQX1BST1RPKHN0
cnVjdCBkcm1fZmlsZSAqZmlsZSwgaW50IGNydGMsIHVuc2lnbmVkIGludCBzZXEpLAogCSAgICBU
UF9BUkdTKGZpbGUsIGNydGMsIHNlcSksCiAJICAgIFRQX1NUUlVDVF9fZW50cnkoCkBAIC00NSwy
NSArNDUsMTYgQEAgVFJBQ0VfRVZFTlQoZHJtX3ZibGFua19ldmVudF9xdWV1ZWQsCiAJCSAgICBf
X2VudHJ5LT5jcnRjID0gY3J0YzsKIAkJICAgIF9fZW50cnktPnNlcSA9IHNlcTsKIAkJICAgICks
Ci0JICAgIFRQX3ByaW50aygiZmlsZT0lcCwgY3J0Yz0lZCwgc2VxPSV1IiwgX19lbnRyeS0+Zmls
ZSwgX19lbnRyeS0+Y3J0YywgXAorCSAgICBUUF9wcmludGsoImZpbGU9JXAsIGNydGM9JWQsIHNl
cT0ldSIsIF9fZW50cnktPmZpbGUsIF9fZW50cnktPmNydGMsCiAJCSAgICAgIF9fZW50cnktPnNl
cSkKICk7Ci0KLVRSQUNFX0VWRU5UKGRybV92YmxhbmtfZXZlbnRfZGVsaXZlcmVkLAotCSAgICBU
UF9QUk9UTyhzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsIGludCBjcnRjLCB1bnNpZ25lZCBpbnQgc2Vx
KSwKLQkgICAgVFBfQVJHUyhmaWxlLCBjcnRjLCBzZXEpLAotCSAgICBUUF9TVFJVQ1RfX2VudHJ5
KAotCQkgICAgX19maWVsZChzdHJ1Y3QgZHJtX2ZpbGUgKiwgZmlsZSkKLQkJICAgIF9fZmllbGQo
aW50LCBjcnRjKQotCQkgICAgX19maWVsZCh1bnNpZ25lZCBpbnQsIHNlcSkKLQkJICAgICksCi0J
ICAgIFRQX2Zhc3RfYXNzaWduKAotCQkgICAgX19lbnRyeS0+ZmlsZSA9IGZpbGU7Ci0JCSAgICBf
X2VudHJ5LT5jcnRjID0gY3J0YzsKLQkJICAgIF9fZW50cnktPnNlcSA9IHNlcTsKLQkJICAgICks
Ci0JICAgIFRQX3ByaW50aygiZmlsZT0lcCwgY3J0Yz0lZCwgc2VxPSV1IiwgX19lbnRyeS0+Zmls
ZSwgX19lbnRyeS0+Y3J0YywgXAotCQkgICAgICBfX2VudHJ5LT5zZXEpCitERUZJTkVfRVZFTlQo
Y2xhc3NfZHJtX3ZibGFua19ldmVudCwgZHJtX3ZibGFua19ldmVudF9xdWV1ZWQsCisJVFBfUFJP
VE8oc3RydWN0IGRybV9maWxlICpmaWxlLCBpbnQgY3J0YywgdW5zaWduZWQgaW50IHNlcSksCisJ
VFBfQVJHUyhmaWxlLCBjcnRjLCBzZXEpCispOworREVGSU5FX0VWRU5UKGNsYXNzX2RybV92Ymxh
bmtfZXZlbnQsIGRybV92YmxhbmtfZXZlbnRfZGVsaXZlcmVkLAorCVRQX1BST1RPKHN0cnVjdCBk
cm1fZmlsZSAqZmlsZSwgaW50IGNydGMsIHVuc2lnbmVkIGludCBzZXEpLAorCVRQX0FSR1MoZmls
ZSwgY3J0Yywgc2VxKQogKTsKIAogI2VuZGlmIC8qIF9EUk1fVFJBQ0VfSF8gKi8KLS0gClNlYW4g
UGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
