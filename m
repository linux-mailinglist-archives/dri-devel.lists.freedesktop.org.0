Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1122DB96
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F5A26E2CE;
	Wed, 29 May 2019 11:20:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A426E0E2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:26:43 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id q17so1339058pfq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 03:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xJTL67gH9xPtYyMqvCkT0yEzd1FL39jXNF6HUA35ERA=;
 b=dnGje+7vOn/THOx5TzLPZ+aneBdRw7st4pHMzojMHXnZpGXrJPywMLo5pG97xS1Ugz
 RIu4a2TxRfWxRPcimTbzuwQ80FkjtsXHPqSuAg22aFl4KBD4Pp0uCvFjyX1mmB9YyN0f
 ORna2hkBCTulsv5xm2w/edtUYmSDbkWimouv41jJNOUYPKMGxKKqonQxmy7fcoc/HNGl
 ytlrVRkqjm4QMhccJv9xyAnmywlyL9ZHz7Hc+W2zaVWLXeRwOVY2i1PNRh2lNTrXTyny
 m//TqzN/EY7FmtpEg7ppvjFVCn1oIm/0goNyCqiFbrY15OWGcTjyen68tBFcM02eZqTO
 zNyw==
X-Gm-Message-State: APjAAAUkj5ynYff39QKC8wIxL+szTxXIn5hn6j5lkSV90lN8ESnM6mOT
 eIMKznpCUYHqSKqVeBOejLroLw==
X-Google-Smtp-Source: APXvYqxd31GalQHglufXhJap16lK/DzJU5TFe0799jhvV8zXWwrroNs5HUHJZR1S0kMiTp9HOfNbhw==
X-Received: by 2002:a62:14d6:: with SMTP id 205mr148943107pfu.4.1559125597639; 
 Wed, 29 May 2019 03:26:37 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id e12sm18992183pfl.122.2019.05.29.03.26.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 29 May 2019 03:26:36 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 0/4] fix mediatek drm, dis, and disp-* unbind/bind
Date: Wed, 29 May 2019 18:25:51 +0800
Message-Id: <20190529102555.251579-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xJTL67gH9xPtYyMqvCkT0yEzd1FL39jXNF6HUA35ERA=;
 b=XZmEt/OOIdZyii8nBgo1yRd792hZgheTgotTZYs35weSjW2UgrlscLr8K8uZVXdqPC
 wjMTLrFRr7dFI+eNNyHZ3W50dHgdjhSbXuqOsmzCTHKob+R4NLkva0/xHzQFut5G1vB3
 /Xa+6mwNyPTx7T0mE0amSv+SQqf+IlzMIifJA=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUgYXJlIHNvbWUgZXJyb3JzIHdoZW4gdW5iaW5kaW5nIGFuZCByZWJpbmRpbmcgbWVkaWF0
ZWsgZHJtLCBkc2ksCmFuZCBkaXNwLSogZHJpdmVycy4gVGhpcyBzZXJpZXMgaXMgdG8gZml4IHRo
b3NlIGVycm9ycyBhbmQgd2FybmluZ3MuCgpIc2luLVlpIFdhbmcgKDQpOgogIGRybTogbWVkaWF0
ZWs6IGZpeCB1bmJpbmQgZnVuY3Rpb25zCiAgZHJtOiBtZWRpYXRlazogdW5iaW5kIGNvbXBvbmVu
dHMgaW4gbXRrX2RybV91bmJpbmQoKQogIGRybTogbWVkaWF0ZWs6IGNhbGwgZHJtX2F0b21pY19o
ZWxwZXJfc2h1dGRvd24oKSB3aGVuIHVuYmluZGluZyBkcml2ZXIKICBkcm06IG1lZGlhdGVrOiBj
bGVhciBudW1fcGlwZXMgd2hlbiB1bmJpbmQgZHJpdmVyCgogZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMgfCA4ICsrKy0tLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RzaS5jICAgICB8IDIgKysKIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
