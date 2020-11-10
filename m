Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB692AE453
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 00:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F08D89D58;
	Tue, 10 Nov 2020 23:47:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 217F589D58
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 23:47:00 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id h23so12355185ljg.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 15:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=khCnrGcki9o8mKzcd5bCbIg16yUPV4xc/WhNkEV8Tok=;
 b=u/ORs0QN5/8GNcc5WPRtlACFGXVsKVFbYuGsrzCv1yjHxcPy/iM5a/i+6vMUP6AKjN
 zSHk/ZYl8qUWVCssuNs9diEHlqZ4Py5b5EqAo7jLgpwAddN/m2FV9P7oyjsd2QxhzXRz
 l+6ua64z7QgON4W1QW+UOSGw3txS1ESYHK9IfLUs6k8RLIImNiWIUt/sSPfpSP55FQi0
 cyqgQId3rGQ1p8BbtMwSDfUHV57QQE5+iSRp7zPcMOKdx6Q1Is+CQYGV3VtbmHWgrsMQ
 5QFsV8pJxfrZi04clbXYEzKmGfR1dY/++THEnKwL/mwp785/k2SEfBwdo7Y4SelB+pF5
 7HSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=khCnrGcki9o8mKzcd5bCbIg16yUPV4xc/WhNkEV8Tok=;
 b=JVfUwI4F9sLuEq1fpHXBnhxiMXRvQQBJWfJK22BiKnxZm69B4tbUDS1Suz/Zz8kI8q
 0ns+miPGG9k1KAICC9+oZlZ7yYKZGa5ec00kOPxoXTsHIF7MnXANdiM8pKnWxDsvsWUe
 sL8OKtZfbE34Y9Oi4GZLB5BwRz4BTMdid75ja/+/QAm446s17qwAEs7e6yhtOsKWu8Yu
 VgPftK3rm1w2ZItN38EsmL7xgUrde5zKgcx0frqjbfD7mBYiFzraSBhIknFWBXcp97c+
 1EGbQZNjFILJW3HbHoR9oUJkffRgL+clhD3RYgblPuIFbZz3Eo/RBPDoHnO8WwVwk1NU
 RVbw==
X-Gm-Message-State: AOAM533WbC5QfwazGPnwuv6HN/4M9+ULs59CYAxmw/7kSfAki75fi3Qz
 4ZANJ8yLcoq5LUBdt/KhRBhNwQ==
X-Google-Smtp-Source: ABdhPJzu4zhI7ATvz2cS3ifaqpbPNdcj+FCldCfQgZdOFlyA1OLSbRWf/zHRc4w+ZEKaQQ/wAABacg==
X-Received: by 2002:a2e:9083:: with SMTP id l3mr3274847ljg.118.1605052018573; 
 Tue, 10 Nov 2020 15:46:58 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-92d7225c.014-348-6c756e10.bbcust.telenor.se. [92.34.215.146])
 by smtp.gmail.com with ESMTPSA id y65sm39883lff.73.2020.11.10.15.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 15:46:57 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Subject: [PATCH 1/5] drm/panel: s6e63m0: Simplify SPI writing
Date: Wed, 11 Nov 2020 00:46:49 +0100
Message-Id: <20201110234653.2248594-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110234653.2248594-1-linus.walleij@linaro.org>
References: <20201110234653.2248594-1-linus.walleij@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyB3cml0aW5nIGNvZGUgaXMgZXF1aXZhbGVudCB0byB0aGUgc3BpX3dyaXRlKCkKaGVscGVy
IGluIHRoZSBTUEkgZnJhbWV3b3JrLiBJbnNlcnQgYSBjb21tZW50CnRoYXQgdGhpcyB3aWxsIGFs
d2F5cyB3b3JrIGZpbmUgc2luY2UgU1BJIGJ1ZmZlcnMKYXJlIGluIG5hdGl2ZSBlbmRpYW5uZXNz
LgoKQ2M6IFN0ZXBoYW4gR2VyaG9sZCA8c3RlcGhhbkBnZXJob2xkLm5ldD4KQ2M6IFBhd2XFgiBD
aG1pZWwgPHBhd2VsLm1pa29sYWouY2htaWVsQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogTGlu
dXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9wYW5lbC9wYW5lbC1zYW1zdW5nLXM2ZTYzbTAtc3BpLmMgfCAxMSArKy0tLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2Ftc3VuZy1zNmU2M20wLXNwaS5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNhbXN1bmctczZlNjNtMC1zcGkuYwppbmRleCBkMjk4
ZDc4MDIyMGQuLjc1ZjAwZWQ0ODEwYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNhbXN1bmctczZlNjNtMC1zcGkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwv
cGFuZWwtc2Ftc3VuZy1zNmU2M20wLXNwaS5jCkBAIC0yNSwxNiArMjUsOSBAQCBzdGF0aWMgaW50
IHM2ZTYzbTBfc3BpX2Rjc19yZWFkKHN0cnVjdCBkZXZpY2UgKmRldiwgY29uc3QgdTggY21kLCB1
OCAqZGF0YSkKIHN0YXRpYyBpbnQgczZlNjNtMF9zcGlfd3JpdGVfd29yZChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHUxNiBkYXRhKQogewogCXN0cnVjdCBzcGlfZGV2aWNlICpzcGkgPSB0b19zcGlfZGV2
aWNlKGRldik7Ci0Jc3RydWN0IHNwaV90cmFuc2ZlciB4ZmVyID0gewotCQkubGVuCT0gMiwKLQkJ
LnR4X2J1ZiA9ICZkYXRhLAotCX07Ci0Jc3RydWN0IHNwaV9tZXNzYWdlIG1zZzsKIAotCXNwaV9t
ZXNzYWdlX2luaXQoJm1zZyk7Ci0Jc3BpX21lc3NhZ2VfYWRkX3RhaWwoJnhmZXIsICZtc2cpOwot
Ci0JcmV0dXJuIHNwaV9zeW5jKHNwaSwgJm1zZyk7CisJLyogU1BJIGJ1ZmZlcnMgYXJlIGFsd2F5
cyBpbiBDUFUgb3JkZXIgKi8KKwlyZXR1cm4gc3BpX3dyaXRlKHNwaSwgJmRhdGEsIDIpOwogfQog
CiBzdGF0aWMgaW50IHM2ZTYzbTBfc3BpX2Rjc193cml0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNv
bnN0IHU4ICpkYXRhLCBzaXplX3QgbGVuKQotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
