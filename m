Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E954346A64
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:37:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430FA8951B;
	Fri, 14 Jun 2019 20:36:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 810CC894DD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:46 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id s49so5287231edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H/jSvXeNPdVe/RGvjR45d/TmnGLJ0w0V6fbPc6OnrNQ=;
 b=cLFcDtwNjpTDYbq+NaopuvjBwxz6qxFhvQSQa9/6lxVVpWnW13cjPW84ICUvlpPJZr
 pJ44MzwKBgY2/6rHp9/WaJMAWmUFxAtU2d7itaC8A7to929OYo1Yd0tNhzBkwuQREnR8
 eKBZybe9ScA9G0jMp9CPs35t/o4vrm6Uuigt52BqTgsibq8FE6fZMoQBR4qSyBHT4f9V
 fXyrww7NYh9jJCu59yNd9hXfZDHcO8x+tr191TYT/z8ha4RrlqdCdQXtZgUqkjxjbIvx
 E9281M+g/g5zho5wzxiV/aege+t8XC+vNvkmDGSP7rhl68XY+yYl1zS+u3TN2pT3LgTx
 J0rg==
X-Gm-Message-State: APjAAAX66kzZNKpz4gA88vbugm1d7CBcTSZoGh/zopfxPK/ZwU5YHZsj
 f191akwEnNrtEdhSp8CiiKTY98oMWfI=
X-Google-Smtp-Source: APXvYqxXcEjEsf5PL/eYQ8qT2eKEKjLTNP3sB0Pc0ALolZp8KC6XEyq8xYSaNSLLcw3gUVflYk+w7w==
X-Received: by 2002:a50:c8c3:: with SMTP id k3mr30718637edh.189.1560544604548; 
 Fri, 14 Jun 2019 13:36:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.43
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:43 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 19/59] drm/mtk: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:35 +0200
Message-Id: <20190614203615.12639-20-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=H/jSvXeNPdVe/RGvjR45d/TmnGLJ0w0V6fbPc6OnrNQ=;
 b=CXxL23WkHoPS8FvxmcYzc83marqI3uVGsFjc3IQ/ZMYiBKkKvOmR2Nl+lPtk6z1ujn
 8tfiJ7fhwbrLDxeAGHwXMMhhYY7GhooqzEjzjluTqoOvazX1bAPFNYtRgXl1Wwf17bS2
 aJeIwhEJOlRANhkIYk1AGF6HQt4T5IbsUM4Ss=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel.vetter@intel.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBDSyBIdSA8Y2su
aHVAbWVkaWF0ZWsuY29tPgpDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5k
ZT4KQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+CkNjOiBsaW51
eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYu
YyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21l
ZGlhdGVrL210a19kcm1fZHJ2LmMKaW5kZXggMWY4Yjg5NDNiMGM2Li5kZDhkYWI1NjI1MDAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCkBAIC0zMjksOCArMzI5LDYgQEAg
c3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIG10a19kcm1fZHJpdmVyID0gewogCiAJLnByaW1lX2hh
bmRsZV90b19mZCA9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAogCS5wcmltZV9mZF90b19o
YW5kbGUgPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSwKLQkuZ2VtX3ByaW1lX2V4cG9ydCA9
IGRybV9nZW1fcHJpbWVfZXhwb3J0LAotCS5nZW1fcHJpbWVfaW1wb3J0ID0gZHJtX2dlbV9wcmlt
ZV9pbXBvcnQsCiAJLmdlbV9wcmltZV9nZXRfc2dfdGFibGUgPSBtdGtfZ2VtX3ByaW1lX2dldF9z
Z190YWJsZSwKIAkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9IG10a19nZW1fcHJpbWVfaW1w
b3J0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfbW1hcCA9IG10a19kcm1fZ2VtX21tYXBfYnVmLAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
