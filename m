Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1662446A9B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905F6892FE;
	Fri, 14 Jun 2019 20:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5B9D895E2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:03 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id z25so5221042edq.9
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U+SsSovEYgifk+pNbf4/kZablFT79UaGQf3kG+5U+50=;
 b=EVOk+vOMwtzLOFo7YgrbhGqdHNKQeY5U3lFW7qeMvca/lStRN+Yz5yoWvOcH9LSI/L
 K4sqX6zhEFAWPJGpPVSSxXHlc6VnJzig+h0tktomtlbsP/tUn0KDnSeKKiFgt12lg/mz
 qHmHtL6Xtb6TwjdxKpnKPCHjj667P+ZNAo8grb4Jb4G01gkk46oi8YpwHnfN294xvMZO
 sMMa9aQt6+AUrijVT7JfuprQ5p9HitWSdIy+rRoct+N3vUM6qPsMMv2wEQJAgZyqdInf
 nRPselu9hOmLQVttaM1cXxkiKnKC2y0EvBf/0ewS85N048x5tu/qS8OIt/HsJcagAWB2
 7d3w==
X-Gm-Message-State: APjAAAX2pv+GAODwRJi69Rwg7F2uJsBCs3tCXvhP8EeA2FE8jp/b6X00
 rcGKIwZ5mVAUgpDNVNOTm3Rgn0syL2w=
X-Google-Smtp-Source: APXvYqzRG+RxJ4GWZ0m9j7UlgW+92KtANbuJgRVipyeXgqsD/OI+4BuY/BRgoPXEmEMQ5TX5WwB3HQ==
X-Received: by 2002:a17:906:7901:: with SMTP id
 b1mr16691416ejo.244.1560544621296; 
 Fri, 14 Jun 2019 13:37:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:00 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 34/59] drm/vc3: Drop drm_gem_prime_import
Date: Fri, 14 Jun 2019 22:35:50 +0200
Message-Id: <20190614203615.12639-35-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U+SsSovEYgifk+pNbf4/kZablFT79UaGQf3kG+5U+50=;
 b=Okk0FkreoABkLrrJdJBxv81CFHLaqAZUzWoLXBcZSiDjVIcQHsGGPa0RiZ7qpNLisc
 2ocSZVl3TbVzCHgwEjYqEPT2WRZ0EpbdxuiwkpFv8i2mlUWCHvzTQV6UCKlw25X/rMPB
 OY6Bod3JybGBxEeYNQmqtD+fwoLG0e345egv8=
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
cHUvZHJtL3ZjNC92YzRfZHJ2LmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmMgYi9kcml2ZXJzL2dw
dS9kcm0vdmM0L3ZjNF9kcnYuYwppbmRleCBlZDRmZTdlZDllNjQuLmEyOTVhYTkxZDNjNSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3ZjNC92YzRfZHJ2LmMKQEAgLTIwMSw3ICsyMDEsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9k
cml2ZXIgdmM0X2RybV9kcml2ZXIgPSB7CiAKIAkucHJpbWVfaGFuZGxlX3RvX2ZkID0gZHJtX2dl
bV9wcmltZV9oYW5kbGVfdG9fZmQsCiAJLnByaW1lX2ZkX3RvX2hhbmRsZSA9IGRybV9nZW1fcHJp
bWVfZmRfdG9faGFuZGxlLAotCS5nZW1fcHJpbWVfaW1wb3J0ID0gZHJtX2dlbV9wcmltZV9pbXBv
cnQsCiAJLmdlbV9wcmltZV9leHBvcnQgPSB2YzRfcHJpbWVfZXhwb3J0LAogCS5nZW1fcHJpbWVf
Z2V0X3NnX3RhYmxlCT0gZHJtX2dlbV9jbWFfcHJpbWVfZ2V0X3NnX3RhYmxlLAogCS5nZW1fcHJp
bWVfaW1wb3J0X3NnX3RhYmxlID0gdmM0X3ByaW1lX2ltcG9ydF9zZ190YWJsZSwKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
