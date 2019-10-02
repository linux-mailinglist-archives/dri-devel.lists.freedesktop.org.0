Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3129C8F15
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 18:56:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D2C6E8D6;
	Wed,  2 Oct 2019 16:56:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19DA16E8D6
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 16:56:09 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id a24so12191819pgj.2
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 09:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0V6I7vxpenGYwQo+a0w9xjv8KE9amu4CMjrShydQWuc=;
 b=t7JrclmdXxITeBtocQWXwkn+6JXf4oLNHzw5iCFBTcK8umSc564bJC3d62y+GuGT9e
 8IDStUgV/X8vWwltJtEHaUNKwnvuLUvDMevSEwOOrngnIFxtC8qlhTATl9ps6nE05p+4
 5EGZiSOHUPdswBHaR1jIt+xu/LdnMka4vCzlkpU9MQ7O3LNyzGODrpdsahVyTB7GUBEl
 G2MiVKQ5IG3Pss7VbTJCjAT4Ba1GSpTnqjgFFucyCCHlcGhCFgaHDkaEMLo8JFOAN3SR
 GYnPMYE0bHfvtnydI9vKSq/QIGfjvHFeV8U+KSPzz9vGtZPmBOtpfCkJp8JWUQTprXTG
 AHcg==
X-Gm-Message-State: APjAAAUPp4Br2kTcRYiZhE37qqCmI3+7s/ItKzbGai4tbqukZsLT67db
 UkY3qBsYGhAil9cJFetAHzp9Xw==
X-Google-Smtp-Source: APXvYqw7iJb+eM19mWGTE2rmb9T/7FR39PHihYj+YtlS7q6rqzp4liG+5Pq1fL6s78/n2zPG//C9Cw==
X-Received: by 2002:a17:90a:cf93:: with SMTP id
 i19mr5509952pju.72.1570035368715; 
 Wed, 02 Oct 2019 09:56:08 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
 by smtp.gmail.com with ESMTPSA id b123sm27546480pgc.72.2019.10.02.09.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 09:56:07 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
To: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH v2] backlight: pwm_bl: Don't assign levels table repeatedly
Date: Wed,  2 Oct 2019 09:56:01 -0700
Message-Id: <20191002095541.v2.1.I4f2ede1f55ddd1c72b0303b7fd7f73a782fa33e5@changeid>
X-Mailer: git-send-email 2.23.0.444.g18eeb5a265-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0V6I7vxpenGYwQo+a0w9xjv8KE9amu4CMjrShydQWuc=;
 b=BNCWbn4YoFqFl6WmXRRnHBUsgZ15/0sG7ZoaJNoV2ERMyL0F2sh9H6Yz4aKEHvZdvj
 FJID9ANMx4kNqAyZ9Z+YtoAd6pfJacgQhQywuPzDjBbBLhTtZwVTI3CUZKUGgL2PHSrq
 QB9oc/76C2javT9MA1DwV78kZ9l7USnccItEI=
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Matthias Kaehlcke <mka@chromium.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cHdtX2JhY2tsaWdodF9wcm9iZSgpIHJlLWFzc2lnbnMgcGItPmxldmVscyBmb3IgZXZlcnkgYnJp
Z2h0bmVzcwpsZXZlbC4gVGhpcyBpcyBub3QgbmVlZGVkIGFuZCB3YXMgbGlrZWx5IG5vdCBpbnRl
bmRlZCwgc2luY2UKbmVpdGhlciBzaWRlIG9mIHRoZSBhc3NpZ25tZW50IGNoYW5nZXMgZHVyaW5n
IHRoZSBsb29wLiBBc3NpZ24KdGhlIGZpZWxkIG9ubHkgb25jZS4KClNpZ25lZC1vZmYtYnk6IE1h
dHRoaWFzIEthZWhsY2tlIDxta2FAY2hyb21pdW0ub3JnPgotLS0KCkNoYW5nZXMgaW4gdjI6Ci0g
cmVtb3ZlZCBjdXJseSBicmFjZXMgZnJvbSBmb3IgbG9vcAoKIGRyaXZlcnMvdmlkZW8vYmFja2xp
Z2h0L3B3bV9ibC5jIHwgNyArKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3
bV9ibC5jIGIvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvcHdtX2JsLmMKaW5kZXggNzQ2ZWViYzQx
MWRmLi4wNWQzYjM4MDI2NTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3
bV9ibC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L3B3bV9ibC5jCkBAIC01NjQsMTgg
KzU2NCwxNyBAQCBzdGF0aWMgaW50IHB3bV9iYWNrbGlnaHRfcHJvYmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKIAltZW1zZXQoJnByb3BzLCAwLCBzaXplb2Yoc3RydWN0IGJhY2tsaWdo
dF9wcm9wZXJ0aWVzKSk7CiAKIAlpZiAoZGF0YS0+bGV2ZWxzKSB7CisJCXBiLT5sZXZlbHMgPSBk
YXRhLT5sZXZlbHM7CisKIAkJLyoKIAkJICogRm9yIHRoZSBEVCBjYXNlLCBvbmx5IHdoZW4gYnJp
Z2h0bmVzcyBsZXZlbHMgaXMgZGVmaW5lZAogCQkgKiBkYXRhLT5sZXZlbHMgaXMgZmlsbGVkLiBG
b3IgdGhlIG5vbi1EVCBjYXNlLCBkYXRhLT5sZXZlbHMKIAkJICogY2FuIGNvbWUgZnJvbSBwbGF0
Zm9ybSBkYXRhLCBob3dldmVyIGlzIG5vdCB1c3VhbC4KIAkJICovCi0JCWZvciAoaSA9IDA7IGkg
PD0gZGF0YS0+bWF4X2JyaWdodG5lc3M7IGkrKykgeworCQlmb3IgKGkgPSAwOyBpIDw9IGRhdGEt
Pm1heF9icmlnaHRuZXNzOyBpKyspCiAJCQlpZiAoZGF0YS0+bGV2ZWxzW2ldID4gcGItPnNjYWxl
KQogCQkJCXBiLT5zY2FsZSA9IGRhdGEtPmxldmVsc1tpXTsKIAotCQkJcGItPmxldmVscyA9IGRh
dGEtPmxldmVsczsKLQkJfQotCiAJCWlmIChwd21fYmFja2xpZ2h0X2lzX2xpbmVhcihkYXRhKSkK
IAkJCXByb3BzLnNjYWxlID0gQkFDS0xJR0hUX1NDQUxFX0xJTkVBUjsKIAkJZWxzZQotLSAKMi4y
My4wLjQ0NC5nMThlZWI1YTI2NS1nb29nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
