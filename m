Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 980A0A54E5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:31:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBA189A34;
	Mon,  2 Sep 2019 11:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9C0689AF3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:31:42 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id k2so12748962wmj.4
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0WT2p9YE2Ashh7/dR+BPduOjzmcm3MtzE5GRVv48sDY=;
 b=d2IiBfL9I5gI6SyVPFr5W4TmIBg1Xp6SxWEkX8/tjEXnqBbCnnOQuacC5oQIUKKvPL
 AdKwJTVAr10S6lMdTOrFTbzp5eLOw6yTqr/LFh8Qo+E7e6WAJygd3BL8Qrgv+fCSPmbn
 4sAkMQv+CduwhSojXKgVtMEdZBdDLi3V+sKbcbbmzkh/QK3dY1jv4tRSrJekxo6bYTJj
 20plU538a34HSUe0TpAsR2rkJrni5lDoBbQYX0AsEXD71OkO6yGDhEWlORycoGiwAMgG
 hKdSUoQtygnW0+Z8XdazermgLClunogYLMezN5Tq2FmJMQIhDeNFchy/9Qlg/AExZHOq
 mqag==
X-Gm-Message-State: APjAAAWcGZImj5drw5CSgJI9dx9F+bbsnHmciJUoNbD69JbULYI6QYht
 +WGcECU5rnMafYYI/ejEpWeZA12K
X-Google-Smtp-Source: APXvYqw3P36G8YH4dc4iNAyanEri3nHU9fwqCeVO3+OTFAukQRE+o6f1haizIWp/Gs+6Pb+0BQeUtQ==
X-Received: by 2002:a1c:6c09:: with SMTP id h9mr1017258wmc.36.1567423900866;
 Mon, 02 Sep 2019 04:31:40 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id m3sm11808970wmc.44.2019.09.02.04.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:39 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/21] drm/dp: Read TPS3 capability from sink
Date: Mon,  2 Sep 2019 13:31:08 +0200
Message-Id: <20190902113121.31323-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0WT2p9YE2Ashh7/dR+BPduOjzmcm3MtzE5GRVv48sDY=;
 b=l0nxk0Xpc13UhXx85TjdQwWldMLfsxgvtjmDwPU4Ru17HVpwq48kMQIo2sPjwuN8rN
 V73jB0WwlAPWwOAN1RWP+V4oP+lZjOKmm2xirSVnsR1YbSUZZRjfBPKJT/kpoKifWOva
 xcgRCuJUIVKhBtVlbV/kdHgYbZw9FRbHfBShFfTMwcoliQmyG5FKDvnvbcPPkxDEV/ID
 5gX9JFb+b0TSp8WRdX/a8nLfZq+j4oQTG+WEdyDZCZS1JzmkxF7OEojmKzFrjSd0i8Xt
 VLnk8wESksdlNJQzBmo4ABhjFPXz28Vn8GWk3e4ZqMwR1qqU1YXNs2qiYQxlgLK7mIF/
 7KVA==
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
