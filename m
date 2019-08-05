Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07FC81925
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:24:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7086E426;
	Mon,  5 Aug 2019 12:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5B66E421
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:24:04 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id p15so78419983eds.8
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:24:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0WT2p9YE2Ashh7/dR+BPduOjzmcm3MtzE5GRVv48sDY=;
 b=q2nQI71lWROpwepa6ypkSA0Td+DZdN2/Q1/wfyigKVtxceLCO9rU5+ISPqgc966vYF
 KH2NKyYa5sTQ3yWGqnN2bVNPKbliDkRD2gK9/pvXcLx9I92idza+27eb09IpZWPv1J6g
 HiJ2uZMR9d/eyBjCnozngMCQGkE01wsEkzFN2GV+zZTq7gPggSUMMszrgOkcRgUjnp8J
 6TREA+zmcghGR5+GPmbmVa8X2B6PsnSkiLJyxg2lD6scotgAnRhYo3Bg/vGad2pWC+wY
 DwWBLJdFiIOuHcysQkvDfma2VcUl+AZMglz3AFAEn2SlsRLnRBKbnLqVVtOrus+5QK7f
 z44w==
X-Gm-Message-State: APjAAAW2gH3n5hAZzRvIxPAtm+bmZb1J93amTiWCZUVh63XOUNvNwuDY
 5kYpvIc6mXVRhtHCiQGkQxAELsh8
X-Google-Smtp-Source: APXvYqxcBJjplYItbzC+KpBBaa8LRUMLvMcdBh3cvYSpiqLgCHQ8zOM2WSZ72/VWb0p+ZNWnBUMSzw==
X-Received: by 2002:a17:907:20b7:: with SMTP id
 pw23mr118783650ejb.127.1565007842265; 
 Mon, 05 Aug 2019 05:24:02 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id f36sm19886992ede.47.2019.08.05.05.24.01
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:24:01 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/21] drm/dp: Read TPS3 capability from sink
Date: Mon,  5 Aug 2019 14:23:37 +0200
Message-Id: <20190805122350.8838-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805122350.8838-1-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0WT2p9YE2Ashh7/dR+BPduOjzmcm3MtzE5GRVv48sDY=;
 b=AcoDfwiQXbI38sFW8qyx9PgEvwqCq51IVIwD+w0rWJv93BUAKVryFWVXrfPtULIkHQ
 P/2rcTBWdBlXNJeBvrkIqrNtQiWDU1W8+zvQYneUroBGtN5Jfqg+pXPB+9O/fkH8BQP7
 qMVQNARUBfXTIMTiFixzLwTrXR0G1nPnSldS1LFfysxzskmrsUd635FK9z9m58f8iY9I
 yllUWOa8KixgU7wE1U/EABpyNl+nKIz4CXw9vhM4oNT2enk5cnm4nQmoIY+qZRk+w4BH
 F345qwyWdPkOcgV4GQcqiqnMQ6VY4w/iNBgVHyhvcRBlD3187kGXWANTw2Zuo7T8KfMM
 YU2w==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBUUFMzIGNhcGFi
aWxpdHkgY2FuIGJlIGV4cG9zZWQgYnkgRFAgMS4yIGFuZCBsYXRlciBzaW5rcyBpZiB0aGV5CnN1
cHBvcnQgdGhlIGFsdGVybmF0aXZlIHRyYWluaW5nIHBhdHRlcm4gZm9yIGNoYW5uZWwgZXF1YWxp
emF0aW9uLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgMyArKysKIGluY2x1ZGUv
ZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCmluZGV4IDc0ZTRmY2VhY2U3ZS4uYzQ3ZDc4
OTczYzFlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKQEAgLTM1NSw2ICszNTUsNyBAQCBFWFBP
UlRfU1lNQk9MKGRybV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMpOwogc3RhdGljIHZvaWQgZHJt
X2RwX2xpbmtfY2Fwc19yZXNldChzdHJ1Y3QgZHJtX2RwX2xpbmtfY2FwcyAqY2FwcykKIHsKIAlj
YXBzLT5lbmhhbmNlZF9mcmFtaW5nID0gZmFsc2U7CisJY2Fwcy0+dHBzM19zdXBwb3J0ZWQgPSBm
YWxzZTsKIAljYXBzLT5mYXN0X3RyYWluaW5nID0gZmFsc2U7CiB9CiAKQEAgLTM2Miw2ICszNjMs
NyBAQCB2b2lkIGRybV9kcF9saW5rX2NhcHNfY29weShzdHJ1Y3QgZHJtX2RwX2xpbmtfY2FwcyAq
ZGVzdCwKIAkJCSAgIGNvbnN0IHN0cnVjdCBkcm1fZHBfbGlua19jYXBzICpzcmMpCiB7CiAJZGVz
dC0+ZW5oYW5jZWRfZnJhbWluZyA9IHNyYy0+ZW5oYW5jZWRfZnJhbWluZzsKKwlkZXN0LT50cHMz
X3N1cHBvcnRlZCA9IHNyYy0+dHBzM19zdXBwb3J0ZWQ7CiAJZGVzdC0+ZmFzdF90cmFpbmluZyA9
IHNyYy0+ZmFzdF90cmFpbmluZzsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2RwX2xpbmtfY2Fwc19j
b3B5KTsKQEAgLTQwOCw2ICs0MTAsNyBAQCBpbnQgZHJtX2RwX2xpbmtfcHJvYmUoc3RydWN0IGRy
bV9kcF9hdXggKmF1eCwgc3RydWN0IGRybV9kcF9saW5rICpsaW5rKQogCWxpbmstPm1heF9sYW5l
cyA9IGRybV9kcF9tYXhfbGFuZV9jb3VudCh2YWx1ZXMpOwogCiAJbGluay0+Y2Fwcy5lbmhhbmNl
ZF9mcmFtaW5nID0gZHJtX2RwX2VuaGFuY2VkX2ZyYW1lX2NhcCh2YWx1ZXMpOworCWxpbmstPmNh
cHMudHBzM19zdXBwb3J0ZWQgPSBkcm1fZHBfdHBzM19zdXBwb3J0ZWQodmFsdWVzKTsKIAlsaW5r
LT5jYXBzLmZhc3RfdHJhaW5pbmcgPSBkcm1fZHBfZmFzdF90cmFpbmluZ19jYXAodmFsdWVzKTsK
IAogCWxpbmstPnJhdGUgPSBsaW5rLT5tYXhfcmF0ZTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAppbmRleCBjMTQ4
ZjU2ODUxOTUuLmFiOThlYmIzMDJhOSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hl
bHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTM2OSwxMCArMTM2
OSwxMiBAQCBpbnQgZHJtX2RwX2RwY2RfcmVhZF9saW5rX3N0YXR1cyhzdHJ1Y3QgZHJtX2RwX2F1
eCAqYXV4LAogLyoqCiAgKiBzdHJ1Y3QgZHJtX2RwX2xpbmtfY2FwcyAtIERQIGxpbmsgY2FwYWJp
bGl0aWVzCiAgKiBAZW5oYW5jZWRfZnJhbWluZzogZW5oYW5jZWQgZnJhbWluZyBjYXBhYmlsaXR5
IChtYW5kYXRvcnkgYXMgb2YgRFAgMS4yKQorICogQHRwczNfc3VwcG9ydGVkOiB0cmFpbmluZyBw
YXR0ZXJuIHNlcXVlbmNlIDMgc3VwcG9ydGVkIGZvciBlcXVhbGl6YXRpb24KICAqIEBmYXN0X3Ry
YWluaW5nOiBBVVggQ0ggaGFuZHNoYWtlIG5vdCByZXF1aXJlZCBmb3IgbGluayB0cmFpbmluZwog
ICovCiBzdHJ1Y3QgZHJtX2RwX2xpbmtfY2FwcyB7CiAJYm9vbCBlbmhhbmNlZF9mcmFtaW5nOwor
CWJvb2wgdHBzM19zdXBwb3J0ZWQ7CiAJYm9vbCBmYXN0X3RyYWluaW5nOwogfTsKIAotLSAKMi4y
Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
