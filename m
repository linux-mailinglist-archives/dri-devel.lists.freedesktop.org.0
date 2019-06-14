Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0253E46AA5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F6E2895F5;
	Fri, 14 Jun 2019 20:37:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9313E892CC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:05 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id p26so5269890edr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TCXaQZ73yx7LttmHLkxXcWIV/gopMApb04FgKYUiEL4=;
 b=V9T8QGSJT9tM8NDfUWJWtb1NCyfrQYbC9ZMANPF5nmCKLtJYgi62ExO/csrRKROekU
 3PFQV7EoSbcunUxHYRfV21+FNy1FcSLHbt5OYrstWlqOnp4LMAgWoqKwEVqxHIs+fwWI
 lmkVh+r6zmoDT7+83uJkGeNrVpck7IfksYSSTooUHTV8ZVOQP+mNmOsnky/Fq3G5GVv4
 2m5uS/CnOpsW/s8b/9wrEe0KHj1UuvWBehzzKbH9h/HHLaBSYHu0JfuA4DjZc7HngclR
 jpv0kLBCuL9bVJXwzi7/uAzqmNUH2kItO7AvibyZ6EQyp9nxH9m4JYUm1J6pUGTUjrUU
 qOQA==
X-Gm-Message-State: APjAAAXGRiglPKS5zBDgiyNFNLxK0hi5ueDwvKzPMkwpFhzgVADR+lLq
 oksqrN3FYoTM7vDjFYkLO1Xb7LVmYcI=
X-Google-Smtp-Source: APXvYqx2THuaZW/v79YLHrhHmhjWdiqQzM7t62VycMNf/v+A8vCYPGZKajB3toUd3wz50vlCbyC02w==
X-Received: by 2002:aa7:df93:: with SMTP id b19mr26005172edy.153.1560544622669; 
 Fri, 14 Jun 2019 13:37:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:01 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 35/59] drm/radeon: Drop drm_gem_prime_import
Date: Fri, 14 Jun 2019 22:35:51 +0200
Message-Id: <20190614203615.12639-36-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TCXaQZ73yx7LttmHLkxXcWIV/gopMApb04FgKYUiEL4=;
 b=eR+jgDWjbS3tFTFatGDur/WCPGDI23bgL25nVgTOlwrxc1+WBcG8HE4sIfI478SdaZ
 KIcrLzNdnOQeePKw3DAz61AFwtqtfmYFqVSzYkbzqmElx9c1/0QVBCi2xIVOv7XHdebV
 dbimkmNnRyifebe1oBQtfQnUZm80E4rr7Pitg=
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
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwppbmRleCA0YTZhY2FhM2Y4NDMu
LjQ0MDNlNzZlMWFlMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
ZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKQEAgLTU2NCw3
ICs1NjQsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIga21zX2RyaXZlciA9IHsKIAkucHJp
bWVfaGFuZGxlX3RvX2ZkID0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCiAJLnByaW1lX2Zk
X3RvX2hhbmRsZSA9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAogCS5nZW1fcHJpbWVfZXhw
b3J0ID0gcmFkZW9uX2dlbV9wcmltZV9leHBvcnQsCi0JLmdlbV9wcmltZV9pbXBvcnQgPSBkcm1f
Z2VtX3ByaW1lX2ltcG9ydCwKIAkuZ2VtX3ByaW1lX3BpbiA9IHJhZGVvbl9nZW1fcHJpbWVfcGlu
LAogCS5nZW1fcHJpbWVfdW5waW4gPSByYWRlb25fZ2VtX3ByaW1lX3VucGluLAogCS5nZW1fcHJp
bWVfcmVzX29iaiA9IHJhZGVvbl9nZW1fcHJpbWVfcmVzX29iaiwKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
