Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBF08148F
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 10:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C26326E373;
	Mon,  5 Aug 2019 08:59:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5496E377
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 08:59:10 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id z28so24408145ljn.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 01:59:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LNyCV5nRBh8vr0if6GHpu5YY8NlSLnHE1s9JSiyGhqo=;
 b=TV4QEHysnEhdV7ytKEu/7+MqYDGxbDlWt2+GGpVzjZ44E8q54TK5QwpFZ9oa3r7rn8
 yW4a7/4F9JUSZDufgy8gCyBK1TCp/dWotGYTekEU9H1mQJvIpMVTmgzXs7CZL51e2OT7
 LrUMicIRQzG68twA/Pi5bjUCyFhaGnpR7WSr5DtYISoAA3drlyINNZXj167BYHrengmc
 8eWS66Cjp2xEo7Rd/HelKjDVuv/ERroVjkWMj9WA3n+UD485NSH0sx9df+PxJ/ozyj+u
 HkLMZKu8uMllvh0LTMR9TgqT67VpQasq/T5Y9vK7Sn38PTB0HIBx2WZWovsfMieoF4+O
 qRmg==
X-Gm-Message-State: APjAAAXXUT51ZhOHisxrLUrZ+QRnApuYbgiN/KvQYFicwnpxlAvP/Smh
 4/ibL2Ms7BKHvfPAhAHSxkZnow==
X-Google-Smtp-Source: APXvYqxu0QuLvd1rl6bgg7HKmSXXY55bGLbA6eecyMtimwWefpBnoR3359vKaHL3B/LVkYk+ZTqmjQ==
X-Received: by 2002:a2e:8515:: with SMTP id j21mr63843840lji.233.1564995548901; 
 Mon, 05 Aug 2019 01:59:08 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id b20sm234500lfc.17.2019.08.05.01.59.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 01:59:07 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: Daniel Tang <dt.tangr@gmail.com>,
	Fabian Vogt <fabian@ritter-vogt.de>
Subject: [PATCH 3/4 v2] drm/panel: simple: Support TI nspire panels
Date: Mon,  5 Aug 2019 10:58:46 +0200
Message-Id: <20190805085847.25554-4-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190805085847.25554-1-linus.walleij@linaro.org>
References: <20190805085847.25554-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LNyCV5nRBh8vr0if6GHpu5YY8NlSLnHE1s9JSiyGhqo=;
 b=j54Rj2XaGuAIh1QjDzcW4Ftb6/YJer99fQuk8COxqyd60VzDeuQ65d6FHyUF5S1IS8
 2quTXmox5D/afUITLCaLymjqQ4HeFS6BXZQTsmTQfD8ilpFQMf1hpdO7aAHUK45hj4mW
 Sji83QTaCNlQhAGJ/cWfg5t+0ArDMd2imzJUlJw7V+XZtnQuEmFsF/waSfpvNhUkJ468
 UsXI5DVCBel4zUwtGvG8QIO7esZQYpfyjCDb+xs6fif5FsbKJMuKjuJxtOkHNMDAeDNO
 x79NvYeJsVQG11B1rwQT1Rv76AIPpwFECXhDWMcjOaPelHapSXLbbAAmaaCxqOslNaoF
 12Jg==
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
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBhZGRzIHN1cHBvcnQgZm9yIHRoZSBUSSBuc3BpcmUgcGFuZWxzIHRvIHRoZSBzaW1wbGUg
cGFuZWwKcm9zdGVyLiBUaGlzIGNvZGUgaXMgYmFzZWQgb24gYXJjaC9hcm0vbWFjaC1uc3BpcmUv
Y2xjZC5jLgpUaGlzIGluY2x1ZGVzIGxpa2VseSB0aGUgZmlyc3QgZ3JheXNjYWxlIHBhbmVsIHN1
cHBvcnRlZC4KClRoZXNlIHBhbmVscyB3aWxsIGJlIHVzZWQgd2l0aCB0aGUgUEwxMXggRFJNIGRy
aXZlci4KCkNjOiBEYW5pZWwgVGFuZyA8ZHQudGFuZ3JAZ21haWwuY29tPgpDYzogRmFiaWFuIFZv
Z3QgPGZhYmlhbkByaXR0ZXItdm9ndC5kZT4KVGVzdGVkLWJ5OiBGYWJpYW4gVm9ndCA8ZmFiaWFu
QHJpdHRlci12b2d0LmRlPgpTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxs
ZWlqQGxpbmFyby5vcmc+Ci0tLQpDaGFuZ2VMb2cgdjEtPnYyOgotIEJ1bXAgY2xvY2sgZnJlcXVl
bmN5IHRvIDEwIE1IeiBhZnRlciBGYWJpYW4ncyB0cmlhbC1hbmQtZXJyb3IKLSBDaGFuZ2VkIHZz
eW1ib2wgbmFtZXMgdG8gdGlfbnNwaXJlXyoKLSBTb3J0ZWQgYWxwaGFiZXRpY2FsbHkKLSBTcGVj
aWZ5IHBvc2l0aXZlIGVkZ2Ugb24gdGhlIGNsYXNzaWMgZGlzcGxheSBidXMKLS0tCiBkcml2ZXJz
L2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxlLmMgfCA2NCArKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNjQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5l
bC9wYW5lbC1zaW1wbGUuYwppbmRleCA1YTkzYzRlZGYxZTQuLjk2Zjg5NGI0NDMxMyAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXNpbXBsZS5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwpAQCAtMjU3OCw2ICsyNTc4LDY0IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyB0aWFubWFfdG0wNzBydmhnNzEgPSB7CiAJLmJ1c19m
b3JtYXQgPSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDdYNF9TUFdHLAogfTsKIAorc3RhdGljIGNv
bnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHRpX25zcGlyZV9jeF9sY2RfbW9kZVtdID0gewor
CXsKKwkJLmNsb2NrID0gMTAwMDAsCisJCS5oZGlzcGxheSA9IDMyMCwKKwkJLmhzeW5jX3N0YXJ0
ID0gMzIwICsgNTAsCisJCS5oc3luY19lbmQgPSAzMjAgKyA1MCArIDYsCisJCS5odG90YWwgPSAz
MjAgKyA1MCArIDYgKyAzOCwKKwkJLnZkaXNwbGF5ID0gMjQwLAorCQkudnN5bmNfc3RhcnQgPSAy
NDAgKyAzLAorCQkudnN5bmNfZW5kID0gMjQwICsgMyArIDEsCisJCS52dG90YWwgPSAyNDAgKyAz
ICsgMSArIDE3LAorCQkudnJlZnJlc2ggPSA2MCwKKwkJLmZsYWdzID0gRFJNX01PREVfRkxBR19O
VlNZTkMgfCBEUk1fTU9ERV9GTEFHX05IU1lOQywKKwl9LAorfTsKKworc3RhdGljIGNvbnN0IHN0
cnVjdCBwYW5lbF9kZXNjIHRpX25zcGlyZV9jeF9sY2RfcGFuZWwgPSB7CisJLm1vZGVzID0gdGlf
bnNwaXJlX2N4X2xjZF9tb2RlLAorCS5udW1fbW9kZXMgPSAxLAorCS5icGMgPSA4LAorCS5zaXpl
ID0geworCQkud2lkdGggPSA2NSwKKwkJLmhlaWdodCA9IDQ5LAorCX0sCisJLmJ1c19mb3JtYXQg
PSBNRURJQV9CVVNfRk1UX1JHQjg4OF8xWDI0LAorCS5idXNfZmxhZ3MgPSBEUk1fQlVTX0ZMQUdf
UElYREFUQV9ORUdFREdFLAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9t
b2RlIHRpX25zcGlyZV9jbGFzc2ljX2xjZF9tb2RlW10gPSB7CisJeworCQkuY2xvY2sgPSAxMDAw
MCwKKwkJLmhkaXNwbGF5ID0gMzIwLAorCQkuaHN5bmNfc3RhcnQgPSAzMjAgKyA2LAorCQkuaHN5
bmNfZW5kID0gMzIwICsgNiArIDYsCisJCS5odG90YWwgPSAzMjAgKyA2ICsgNiArIDYsCisJCS52
ZGlzcGxheSA9IDI0MCwKKwkJLnZzeW5jX3N0YXJ0ID0gMjQwICsgMCwKKwkJLnZzeW5jX2VuZCA9
IDI0MCArIDAgKyAxLAorCQkudnRvdGFsID0gMjQwICsgMCArIDEgKyAwLAorCQkudnJlZnJlc2gg
PSA2MCwKKwkJLmZsYWdzID0gRFJNX01PREVfRkxBR19QSFNZTkMgfCBEUk1fTU9ERV9GTEFHX1BW
U1lOQywKKwl9LAorfTsKKworc3RhdGljIGNvbnN0IHN0cnVjdCBwYW5lbF9kZXNjIHRpX25zcGly
ZV9jbGFzc2ljX2xjZF9wYW5lbCA9IHsKKwkubW9kZXMgPSB0aV9uc3BpcmVfY2xhc3NpY19sY2Rf
bW9kZSwKKwkubnVtX21vZGVzID0gMSwKKwkvKiBUaGUgZ3JheXNjYWxlIHBhbmVsIGhhcyA4IGJp
dCBmb3IgdGhlIGNvbG9yIC4uIFkgKGJsYWNrKSAqLworCS5icGMgPSA4LAorCS5zaXplID0gewor
CQkud2lkdGggPSA3MSwKKwkJLmhlaWdodCA9IDUzLAorCX0sCisJLyogVGhpcyBpcyB0aGUgZ3Jh
eXNjYWxlIGJ1cyBmb3JtYXQgKi8KKwkuYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfWThfMVg4
LAorCS5idXNfZmxhZ3MgPSBEUk1fQlVTX0ZMQUdfUElYREFUQV9QT1NFREdFLAorfTsKKwogc3Rh
dGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2RlIHRvc2hpYmFfbHQwODlhYzI5MDAwX21v
ZGUgPSB7CiAJLmNsb2NrID0gNzk1MDAsCiAJLmhkaXNwbGF5ID0gMTI4MCwKQEAgLTMwMjksNiAr
MzA4NywxMiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBwbGF0Zm9ybV9vZl9t
YXRjaFtdID0gewogCX0sIHsKIAkJLmNvbXBhdGlibGUgPSAidGlhbm1hLHRtMDcwcnZoZzcxIiwK
IAkJLmRhdGEgPSAmdGlhbm1hX3RtMDcwcnZoZzcxLAorCX0sIHsKKwkJLmNvbXBhdGlibGUgPSAi
dGksbnNwaXJlLWN4LWxjZC1wYW5lbCIsCisJCS5kYXRhID0gJnRpX25zcGlyZV9jeF9sY2RfcGFu
ZWwsCisJfSwgeworCQkuY29tcGF0aWJsZSA9ICJ0aSxuc3BpcmUtY2xhc3NpYy1sY2QtcGFuZWwi
LAorCQkuZGF0YSA9ICZ0aV9uc3BpcmVfY2xhc3NpY19sY2RfcGFuZWwsCiAJfSwgewogCQkuY29t
cGF0aWJsZSA9ICJ0b3NoaWJhLGx0MDg5YWMyOTAwMCIsCiAJCS5kYXRhID0gJnRvc2hpYmFfbHQw
ODlhYzI5MDAwLAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
