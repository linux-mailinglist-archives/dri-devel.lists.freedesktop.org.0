Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048C246AB4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DC6289836;
	Fri, 14 Jun 2019 20:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CDF4897BB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:17 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p26so5270514edr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rps7hs/Leag+Shj5ZT/qv4nRg40VI7vqYRBje0ZReVA=;
 b=MALOLjaYQ/HvSOkoQyebjmLclTdvdB2eQoYpUbmVl4+fqb/0dTkxmcEQsop3RU8dYD
 PdwKBOcvaac8/Mk1/FI4ZPQu1rzkgpR9KzZgatgK7EsS0syqhicmt6UgxP9KsJ6A0ALw
 bOBpgVQ3nz/qGQsvHizqd7RAdphdS0kxe5YS3Vux8ObLUZN+Pw/QD/8MJ0CmPLFFvE9o
 7avYvc0qqpJWe0Pditkv9UHw4gJMbvRIcOL75oHS6XcHBfVUZyrkGzHZeiBGWLzS3Ln5
 1ZRMCmOQaIIUDljbdH2zWz0r286UTCzKeHvxPzj82bLiRemw6inaAuymqIYzHhm8p9Ja
 3NRA==
X-Gm-Message-State: APjAAAXYuuvlgMnBN9NASt/IG/TTsgqi8IE9+w/WbhoHldMC4Pr2p700
 itQICGJIb8TaO76Zg+LsdYRLUllpJGM=
X-Google-Smtp-Source: APXvYqwE/9Gq+rjcFNd2qiGUJDD6Cf9CW2K5wNNuogwDxZ7cKk9XBf97p7yr0UnI2EAxpiDwI4ULYw==
X-Received: by 2002:a05:6402:1507:: with SMTP id
 f7mr42613630edw.94.1560544634826; 
 Fri, 14 Jun 2019 13:37:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.13
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:14 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 46/59] drm/panfrost: don't set gem_obj->resv for prime import
 anymore
Date: Fri, 14 Jun 2019 22:36:02 +0200
Message-Id: <20190614203615.12639-47-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rps7hs/Leag+Shj5ZT/qv4nRg40VI7vqYRBje0ZReVA=;
 b=Hn9uIVKcRYcIqoeYVehvjdcNHqCZAdn1UHWbNuvHRZDV1DxctS6Pi7ONYAVky0hlHP
 RW5CoJMbfE7pSIvFIyJhE6dY7FgfYEaVh9FynoHd5l5A4BfJq4ulThL5/Gr3QpU702JN
 Zb8TzkxXKhRTFWp+X5479BOwZPTT1Ju82Ry2g=
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
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBub3cgZG9uZSBpbiBkcm1fcHJpbWUuYwoKU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPgpDYzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMgfCAyIC0tCiAxIGZpbGUg
Y2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFu
ZnJvc3QvcGFuZnJvc3RfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
Z2VtLmMKaW5kZXggODg2ODc1YWUzMWQzLi41OTBkMzc4ZmFiMWIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfZ2VtLmMKQEAgLTkxLDggKzkxLDYgQEAgcGFuZnJvc3RfZ2VtX3By
aW1lX2ltcG9ydF9zZ190YWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCiAJcG9iaiA9IHRv
X3BhbmZyb3N0X2JvKG9iaik7CiAKLQlvYmotPnJlc3YgPSBhdHRhY2gtPmRtYWJ1Zi0+cmVzdjsK
LQogCXBhbmZyb3N0X21tdV9tYXAocG9iaik7CiAKIAlyZXR1cm4gb2JqOwotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
