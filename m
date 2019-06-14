Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62DAD46A6F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C9B89581;
	Fri, 14 Jun 2019 20:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D1A89452
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:45 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id a14so5199518edv.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R6PfFUqF6PPjQ+2KhjwRpZn+kcNs1sc43D2/dq9an+Q=;
 b=BM0zjfnbqxSmT+UF+gV37ZXhNL/KWr88JqoSNqe4BJhtatFsSb5OndclXANQplSS8B
 is6n4eviUqeigSqF24D7ZBUxe4BnSLvvQ+hM0lY7n8iJ4w8cwm24LVrvwbnM9rKrVGcJ
 +1iNghLArkGAOScnrCfSFbIUQrzDeXq2L9qugLK5d/V1Eg022HiCyVmfhlE5AFhM3J9v
 oCPd4gVFpN0MtOxvhcHV2GZPwkvwmue3qW7Y8I1A4LEo0dKjdg+YDMr55GZD9BfBDRa0
 QvukATiA7bmcaxco4yVlNXPojLx+LZPd/eBfGTMhvh6pqIY007t68pAzBUdT4KByJc2b
 i4ZQ==
X-Gm-Message-State: APjAAAVKUzLeLOINNsHD8A6NHvaWNbfBdhIsxMFkcrSqZ2CgYzXOGcyF
 5q9AI2V5+Wb/XrPbDiLZJuW6BYVi0D0=
X-Google-Smtp-Source: APXvYqzegbVMyOVyR22k1kbhoNYJQqA40Gi82fiW+BK4bC/QQ8P+UzwW88vCgKZeSkx0seZrJt+bHw==
X-Received: by 2002:a17:907:2114:: with SMTP id
 qn20mr66326790ejb.138.1560544603439; 
 Fri, 14 Jun 2019 13:36:43 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:42 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 18/59] drm/mcde: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:34 +0200
Message-Id: <20190614203615.12639-19-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R6PfFUqF6PPjQ+2KhjwRpZn+kcNs1sc43D2/dq9an+Q=;
 b=jXRFsqkoYYsco0cX8unkvA9yIqk1aek7FzkRgYLrvFOi1mZUHrDTOwLwE59rPdsVM4
 d9bdFE75iLKpp6qUGWYFiTLMjX9JcR0IYr4AiXCvb6ohL85UnYhPz6jzbsB0Ol6ZcJON
 GQFy7Mkz8OeTcd2Z7ZXXjgqqEEI5tNbYUqx/c=
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
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBMaW51cyBXYWxs
ZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21jZGUv
bWNkZV9kcnYuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0v
bWNkZS9tY2RlX2Rydi5jCmluZGV4IGY3MzFkNjg5ZDUyZi4uYTE5MTdlMjFkNTNiIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tY2RlL21jZGVfZHJ2LmMKQEAgLTI1NCw4ICsyNTQsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9k
cml2ZXIgbWNkZV9kcm1fZHJpdmVyID0gewogCiAJLnByaW1lX2hhbmRsZV90b19mZCA9IGRybV9n
ZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAogCS5wcmltZV9mZF90b19oYW5kbGUgPSBkcm1fZ2VtX3By
aW1lX2ZkX3RvX2hhbmRsZSwKLQkuZ2VtX3ByaW1lX2ltcG9ydCA9IGRybV9nZW1fcHJpbWVfaW1w
b3J0LAotCS5nZW1fcHJpbWVfZXhwb3J0ID0gZHJtX2dlbV9wcmltZV9leHBvcnQsCiAJLmdlbV9w
cmltZV9nZXRfc2dfdGFibGUJPSBkcm1fZ2VtX2NtYV9wcmltZV9nZXRfc2dfdGFibGUsCiAJLmdl
bV9wcmltZV9pbXBvcnRfc2dfdGFibGUgPSBkcm1fZ2VtX2NtYV9wcmltZV9pbXBvcnRfc2dfdGFi
bGUsCiAJLmdlbV9wcmltZV92bWFwID0gZHJtX2dlbV9jbWFfcHJpbWVfdm1hcCwKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
