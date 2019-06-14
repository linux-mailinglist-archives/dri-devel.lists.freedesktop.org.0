Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9163E46AA8
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439E489310;
	Fri, 14 Jun 2019 20:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0019A89580
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:54 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id e3so5195332edr.10
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vlm+rv94huTn04MhgYNqn9Qe+r+R2T5g6JPxRxFgFew=;
 b=dEooSvSwDuKrJZyQjqllxF/Iif34KtbXStYJ+AeFPsh7H7M+dL6R7PRiH6fNYs4cwD
 MGXzwxL3xZj9CWI3RyuPwmOq2YKnTMlU5DvbBY7sIS2jvWERWZHrStIejngTQ6GcVt+n
 dLqzoWuJYbuY/VtSoZaun1msYnYKGvA6SXnSpgRdc2oA+R9fzm7nt+YbWTI+8LosbODJ
 FY57OgPkvvh8zn2R4VFuJP+YCSETxAu6N4YiCtuXs8/ntaW/8rGONvhXRdKqDHvkwNDG
 TbsrIPd4YgtIXW9FqV3TWhLGonE7/YQyTFFEJd3PPvx6Xaj4OaTZjnh79d3+6jMLOzxT
 HLAg==
X-Gm-Message-State: APjAAAVKldJxK0ai8Ox9cHX4IqxR6lKpx0fulhCpz4gihOLKkBPKj/Nj
 zPYevr0di6gBL0t0enqeIbLC8tPUlek=
X-Google-Smtp-Source: APXvYqz/rw+nXPEfVEGNMIVqUQ9lr23BCUcLfFlX0HI0dbMkkTCBDzcUsWQu2IaYJTDJ0IL9OADk7Q==
X-Received: by 2002:a05:6402:78c:: with SMTP id
 d12mr43018114edy.160.1560544613235; 
 Fri, 14 Jun 2019 13:36:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:52 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 27/59] drm/rockchip: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:43 +0200
Message-Id: <20190614203615.12639-28-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vlm+rv94huTn04MhgYNqn9Qe+r+R2T5g6JPxRxFgFew=;
 b=URv6OAXgbuSACR/wqNmpMG4uTxnz3YmKH29b+NByyHHXifzir7/gnX2Y4XUbydaCLO
 3ytdGd4BIq+Zf+KcBZZ0tzbRnJVNS8SkEDTxgkBtuobGwLWkALrGjHB77k4cwGFsN3ZM
 Ayb2bKnimM3veuDPuP6aAqesG6eT7FN9IDrmo=
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
 linux-rockchip@lists.infradead.org, Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBTYW5keSBIdWFu
ZyA8aGpjQHJvY2stY2hpcHMuY29tPgpDYzogIkhlaWtvIFN0w7xibmVyIiA8aGVpa29Ac250ZWNo
LmRlPgpDYzogbGludXgtYXJtLWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBsaW51eC1y
b2NrY2hpcEBsaXN0cy5pbmZyYWRlYWQub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L3JvY2tjaGlwX2RybV9kcnYuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5jCmluZGV4IDU5
MDkxYjYyNDFlYy4uNzgyOTc5ZjFiNTVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9j
a2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fZHJ2LmMKQEAgLTIxOSw4ICsyMTksNiBAQCBzdGF0aWMgc3RydWN0IGRybV9k
cml2ZXIgcm9ja2NoaXBfZHJtX2RyaXZlciA9IHsKIAkuZHVtYl9jcmVhdGUJCT0gcm9ja2NoaXBf
Z2VtX2R1bWJfY3JlYXRlLAogCS5wcmltZV9oYW5kbGVfdG9fZmQJPSBkcm1fZ2VtX3ByaW1lX2hh
bmRsZV90b19mZCwKIAkucHJpbWVfZmRfdG9faGFuZGxlCT0gZHJtX2dlbV9wcmltZV9mZF90b19o
YW5kbGUsCi0JLmdlbV9wcmltZV9pbXBvcnQJPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKLQkuZ2Vt
X3ByaW1lX2V4cG9ydAk9IGRybV9nZW1fcHJpbWVfZXhwb3J0LAogCS5nZW1fcHJpbWVfZ2V0X3Nn
X3RhYmxlCT0gcm9ja2NoaXBfZ2VtX3ByaW1lX2dldF9zZ190YWJsZSwKIAkuZ2VtX3ByaW1lX2lt
cG9ydF9zZ190YWJsZQk9IHJvY2tjaGlwX2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUsCiAJLmdl
bV9wcmltZV92bWFwCQk9IHJvY2tjaGlwX2dlbV9wcmltZV92bWFwLAotLSAKMi4yMC4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
