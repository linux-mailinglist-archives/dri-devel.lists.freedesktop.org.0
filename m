Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FB1106704
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 08:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E7386E24E;
	Fri, 22 Nov 2019 07:25:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2FD6E24E
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 07:25:04 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id q2so6169218ljg.7
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 23:25:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P6uG/Y/koPc50FC4dd0Y4/POJMoX0WFT55LgqB+SC9c=;
 b=umkhcAVLNt/J/N/WasOccfQCQM9gcpMHuiYynqXMpcUM1evMP5IOqgWfmlfZ3+EVwQ
 5ncE35Bnz8Fis+DkV9dK5W1hyqvGdMJ+qcZn74d8CEwbQv8wl211Ae3AfLvjgvqv6Fxp
 XYZhKYbrzRNnAaYfUnx6pZ5evh+xWyWisMOgYA1l6pDbL3jnHd5wQqXUUISLGLbRlopr
 q9GOP8idSedHEGTwqVC/SCFAIGZRJm10btbQEH5xD59mkgTQNaTsqRZQC09lW8oW1pvW
 xh1jJPhXqW+vxlU3powZ/R/3cVtBiqYke+GoEsktVeJ/iZCHG6EImD8P9rP/xDbVRT9+
 P/dQ==
X-Gm-Message-State: APjAAAXyOK7mKjTOX8RoNPgcApVidv7ZEUchd4mTdp+q1+etlcV0DpU8
 otWuPd/kspD0peEczyWVX2XYajV2ngGBdQ==
X-Google-Smtp-Source: APXvYqym1eTLyknpwVqzImXoV+s463bJ3UZIORURNvIaHZVBUBjZQO2B4ChJLH82OXas3sJ1/lpaqw==
X-Received: by 2002:a2e:9649:: with SMTP id z9mr10981112ljh.47.1574407502500; 
 Thu, 21 Nov 2019 23:25:02 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-21cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.33])
 by smtp.gmail.com with ESMTPSA id b28sm2752633ljp.9.2019.11.21.23.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 23:25:01 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 1/2] drm/mcde: Reuse global DSI command defs
Date: Fri, 22 Nov 2019 08:24:57 +0100
Message-Id: <20191122072457.25619-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P6uG/Y/koPc50FC4dd0Y4/POJMoX0WFT55LgqB+SC9c=;
 b=KAI6LIcufFWUWEpwoIE142/h1b0G1G5c5DH5TlOyJKshY6UcVTeKH34Bc66qJb3ksV
 tvAIsjEbB0iKqT1iGW7+IBzZ/HVv5H0cg7hUMtfQeXzHh/ORTKkKNdHg7gCBrUJw3EVN
 ctqdEKg7zOXKftJy4oNVCcRWUcY/iAlpFR8HbbU73+GgU0D7lvdxQzWdLcH7Iad1lT2M
 vhcaavvAANhdo1wd55pfnlRyDQNBBKFffNnc56jcQj7HObkNzKFPInCqeGoRNWCErLxk
 dbz4Joc2kjKPNIu07VzJxDa+gVQjonPLJUMgHT2zNHdH5SKTVAkmNT7//BCesFwMFJUv
 f5zg==
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
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIE1DREUgRFNJIGluY2x1ZGUgZmlsZSByZWRlZmluZXMgc29tZSBjb21tYW5kcyB0aGF0CmFs
cmVhZHkgZXhpc3QgaW4gdGhlIGNvbW1vbiA8dmlkZW8vbWlwaV9kaXNwbGF5Lmg+IGhlYWRlci4K
CkNjOiBTdGVwaGFuIEdlcmhvbGQgPHN0ZXBoYW5AZ2VyaG9sZC5uZXQ+ClNpZ25lZC1vZmYtYnk6
IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbWNkZS9tY2RlX2RzaS5jICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL21jZGUv
bWNkZV9kc2lfcmVncy5oIHwgMTEgLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
Y2RlL21jZGVfZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2RzaS5jCmluZGV4IGQ0
YTEyZmU3ZmYwMS4uZGMwN2I1MzRmMDFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWNk
ZS9tY2RlX2RzaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMKQEAgLTM1
MCw3ICszNTAsNyBAQCB2b2lkIG1jZGVfZHNpX3RlX3JlcXVlc3Qoc3RydWN0IG1pcGlfZHNpX2Rl
dmljZSAqbWRzaSkKIAl2YWwgfD0gMCA8PCBEU0lfRElSRUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NN
RF9JRF9TSElGVDsKIAl2YWwgfD0gMiA8PCBEU0lfRElSRUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NN
RF9TSVpFX1NISUZUOwogCXZhbCB8PSBEU0lfRElSRUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NNRF9M
UF9FTjsKLQl2YWwgfD0gRFNJX0RJUkVDVF9DTURfTUFJTl9TRVRUSU5HU19DTURfSEVBRF9EQ1Nf
U0hPUlRfV1JJVEVfMSA8PAorCXZhbCB8PSBNSVBJX0RTSV9HRU5FUklDX1NIT1JUX1dSSVRFXzFf
UEFSQU0gPDwKIAkJRFNJX0RJUkVDVF9DTURfTUFJTl9TRVRUSU5HU19DTURfSEVBRF9TSElGVDsK
IAl3cml0ZWwodmFsLCBkLT5yZWdzICsgRFNJX0RJUkVDVF9DTURfTUFJTl9TRVRUSU5HUyk7CiAK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpX3JlZ3MuaCBiL2RyaXZl
cnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpX3JlZ3MuaAppbmRleCBiMDNhMzM2YzIzNWYuLjgwODlk
YjgwNWM1NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2lfcmVncy5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpX3JlZ3MuaApAQCAtMTIzLDE3ICsx
MjMsNiBAQAogI2RlZmluZSBEU0lfRElSRUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NNRF9MT05HTk9U
U0hPUlQgQklUKDMpCiAjZGVmaW5lIERTSV9ESVJFQ1RfQ01EX01BSU5fU0VUVElOR1NfQ01EX0hF
QURfU0hJRlQgOAogI2RlZmluZSBEU0lfRElSRUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NNRF9IRUFE
X01BU0sgMHgwMDAwM0YwMAotI2RlZmluZSBEU0lfRElSRUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NN
RF9IRUFEX1RVUk5fT05fUEVSSVBIRVJBTCA1MAotI2RlZmluZSBEU0lfRElSRUNUX0NNRF9NQUlO
X1NFVFRJTkdTX0NNRF9IRUFEX1NIVVRfRE9XTl9QRVJJUEhFUkFMIDM0Ci0jZGVmaW5lIERTSV9E
SVJFQ1RfQ01EX01BSU5fU0VUVElOR1NfQ01EX0hFQURfR0VORVJJQ19TSE9SVF9XUklURV8wIDMK
LSNkZWZpbmUgRFNJX0RJUkVDVF9DTURfTUFJTl9TRVRUSU5HU19DTURfSEVBRF9HRU5FUklDX1NI
T1JUX1dSSVRFXzEgMTkKLSNkZWZpbmUgRFNJX0RJUkVDVF9DTURfTUFJTl9TRVRUSU5HU19DTURf
SEVBRF9HRU5FUklDX1NIT1JUX1dSSVRFXzIgMzUKLSNkZWZpbmUgRFNJX0RJUkVDVF9DTURfTUFJ
Tl9TRVRUSU5HU19DTURfSEVBRF9HRU5FUklDX0xPTkdfV1JJVEUgNDEKLSNkZWZpbmUgRFNJX0RJ
UkVDVF9DTURfTUFJTl9TRVRUSU5HU19DTURfSEVBRF9EQ1NfU0hPUlRfV1JJVEVfMCA1Ci0jZGVm
aW5lIERTSV9ESVJFQ1RfQ01EX01BSU5fU0VUVElOR1NfQ01EX0hFQURfRENTX1NIT1JUX1dSSVRF
XzEgMjEKLSNkZWZpbmUgRFNJX0RJUkVDVF9DTURfTUFJTl9TRVRUSU5HU19DTURfSEVBRF9EQ1Nf
TE9OR19XUklURSA1NwotI2RlZmluZSBEU0lfRElSRUNUX0NNRF9NQUlOX1NFVFRJTkdTX0NNRF9I
RUFEX0RDU19SRUFEIDYKLSNkZWZpbmUgRFNJX0RJUkVDVF9DTURfTUFJTl9TRVRUSU5HU19DTURf
SEVBRF9TRVRfTUFYX1BLVF9TSVpFIDU1CiAjZGVmaW5lIERTSV9ESVJFQ1RfQ01EX01BSU5fU0VU
VElOR1NfQ01EX0lEX1NISUZUIDE0CiAjZGVmaW5lIERTSV9ESVJFQ1RfQ01EX01BSU5fU0VUVElO
R1NfQ01EX1NJWkVfU0hJRlQgMTYKICNkZWZpbmUgRFNJX0RJUkVDVF9DTURfTUFJTl9TRVRUSU5H
U19DTURfTFBfRU4gQklUKDIxKQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
