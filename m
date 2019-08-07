Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7A585343
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 20:52:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 895976E75E;
	Wed,  7 Aug 2019 18:52:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8BB6E75D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2019 18:52:03 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id z63so32843780ywz.9
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Aug 2019 11:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uBJnbcNgXL4Ewt9aXEKXXTybz6mgacmlW9xupC/bPsc=;
 b=HIo8CeIomn1bRprOM7r645Y7PL2GBgV98veJDQvoeyHTH5gnr5W4yDL+vEpUIn7djx
 8F4IZG+KQ+5MwvDz8AWrrd5QeZFWZlMEOkQBAqZYrkalL/ug6cy21hMo3gY/4tzIuGz8
 tU0WitQFglvw5/JDOQ3o2oa8lwPWGeeHnOu/UDyX8MeOBMmuqMyCqKkJCwL8jTmBU5nI
 P2biaohlaYeE1/MIkpatpLERuM0hVMhKUYHEbmPGhz31s63MMFkHigRYY3lPGBoZu0t8
 V8Jp49IIldUWcbwD8rFeVa0AHH4w1dhp2tNU8uAxPhG4z/wrXH+BLz1AvQBHYhIA7MWv
 gniQ==
X-Gm-Message-State: APjAAAWZk3RPoG7FuGPkCQKKoNIw5Yopr3d8wU+67t+PgMZkK8PP+9pG
 cBoQDXGawyYaWq5yhJfMrU3LYQ==
X-Google-Smtp-Source: APXvYqybR9mHxZg127Kte6AYTK7OAVaW22KUyjQarf6IV6TetInW4a+GbgKCDa1r0Ey/tvuSRyQjYw==
X-Received: by 2002:a81:5f82:: with SMTP id t124mr6836554ywb.344.1565203922409; 
 Wed, 07 Aug 2019 11:52:02 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id d127sm20174910ywb.27.2019.08.07.11.52.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 07 Aug 2019 11:52:02 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dsi: Fix return value check for clk_get_parent
Date: Wed,  7 Aug 2019 14:51:50 -0400
Message-Id: <20190807185201.16072-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.rc1.153.gdeed80330f-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uBJnbcNgXL4Ewt9aXEKXXTybz6mgacmlW9xupC/bPsc=;
 b=OBhAk4Pt26i2GgK6u2y94cEldEvtZoBVr3PpcqvWMNCMP6HulT4f78bxyX/lOT8XKn
 kqpb+5re5/nFIrPpIi5i/4mjIweIMh+P5h2tirVbmynk3utJX/HmtlIpcS1ZBEsjIVM8
 fQIJvH7GRYCBaPDgYsHx/G+ozoKKY4Y7JCN0hFvJphK11AN7GCR4izHCrVJWPVja6Vpv
 bujaV0FA1QJUszApem6HCR0mBa7LB+xqDcNjMCVjIPAEVjUB19/rLjgFUQCrsPsZ+Y/p
 TSQPGn7M83PVj/JtYfogXPxe3icU1L7oeCS48ITWJMlpcm+tL+IRPXIr6d++P8Oi5FZy
 elSw==
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stable@vger.kernel.org, Sean Paul <seanpaul@chromium.org>,
 Sibi Sankar <sibis@codeaurora.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpjbGtfZ2V0X3BhcmVudCBy
ZXR1cm5zIGFuIGVycm9yIHBvaW50ZXIgdXBvbiBmYWlsdXJlLCBub3QgTlVMTC4gU28gdGhlCmNo
ZWNrcyBhcyB0aGV5IGV4aXN0IHdvbid0IGNhdGNoIGEgZmFpbHVyZS4gVGhpcyBwYXRjaCBjaGFu
Z2VzIHRoZQpjaGVja3MgYW5kIHRoZSByZXR1cm4gdmFsdWVzIHRvIHByb3Blcmx5IGhhbmRsZSBh
biBlcnJvciBwb2ludGVyLgoKRml4ZXM6IGM0ZDhjZmU1MTZkYyAoImRybS9tc20vZHNpOiBhZGQg
aW1wbGVtZW50YXRpb24gZm9yIGhlbHBlciBmdW5jdGlvbnMiKQpDYzogU2liaSBTYW5rYXIgPHNp
YmlzQGNvZGVhdXJvcmEub3JnPgpDYzogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+
CkNjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+CkNjOiA8c3RhYmxlQHZnZXIu
a2VybmVsLm9yZz4gIyB2NC4xOSsKU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBj
aHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyB8IDgg
KysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMKaW5kZXggYWEzNWQxOGFiNDNjOS4uMDJhY2I0
MzM4NzIxYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCkBAIC00MjEsMTUgKzQyMSwx
NSBAQCBzdGF0aWMgaW50IGRzaV9jbGtfaW5pdChzdHJ1Y3QgbXNtX2RzaV9ob3N0ICptc21faG9z
dCkKIAl9CiAKIAltc21faG9zdC0+Ynl0ZV9jbGtfc3JjID0gY2xrX2dldF9wYXJlbnQobXNtX2hv
c3QtPmJ5dGVfY2xrKTsKLQlpZiAoIW1zbV9ob3N0LT5ieXRlX2Nsa19zcmMpIHsKLQkJcmV0ID0g
LUVOT0RFVjsKKwlpZiAoSVNfRVJSKG1zbV9ob3N0LT5ieXRlX2Nsa19zcmMpKSB7CisJCXJldCA9
IFBUUl9FUlIobXNtX2hvc3QtPmJ5dGVfY2xrX3NyYyk7CiAJCXByX2VycigiJXM6IGNhbid0IGZp
bmQgYnl0ZV9jbGsgY2xvY2suIHJldD0lZFxuIiwgX19mdW5jX18sIHJldCk7CiAJCWdvdG8gZXhp
dDsKIAl9CiAKIAltc21faG9zdC0+cGl4ZWxfY2xrX3NyYyA9IGNsa19nZXRfcGFyZW50KG1zbV9o
b3N0LT5waXhlbF9jbGspOwotCWlmICghbXNtX2hvc3QtPnBpeGVsX2Nsa19zcmMpIHsKLQkJcmV0
ID0gLUVOT0RFVjsKKwlpZiAoSVNfRVJSKG1zbV9ob3N0LT5waXhlbF9jbGtfc3JjKSkgeworCQly
ZXQgPSBQVFJfRVJSKG1zbV9ob3N0LT5waXhlbF9jbGtfc3JjKTsKIAkJcHJfZXJyKCIlczogY2Fu
J3QgZmluZCBwaXhlbF9jbGsgY2xvY2suIHJldD0lZFxuIiwgX19mdW5jX18sIHJldCk7CiAJCWdv
dG8gZXhpdDsKIAl9Ci0tIApTZWFuIFBhdWwsIFNvZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBD
aHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
