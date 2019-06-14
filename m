Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C897046A85
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6965B89598;
	Fri, 14 Jun 2019 20:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4601189561
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:56 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id i11so5285078edq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HZnZIGyd1ihO1nLfm2kHYBUDq0QLZnlqf87UlfFfYuA=;
 b=JlMjqbDhbQwQiD0y9bECk7grWmAGE243AByvKp6HR13IYBCbpWjz6feVokuA4Hzsco
 8ddHitMC9dIKUtBt66Cx1akB1TH4EcDzmbfOuSoXbyhZe5I6W6Zhzz5G37UgsKzwp6qe
 /D69sPoY+fTuE6CWI89NTD/E4DOnQwD4abOOQbIuyy3Y0uN88L8n43q7fz/aqY5ZGno7
 t5QN7TylwNLeXIVohAdrZfj59RPZ6N0MwHh9lSlh8RZsIF5XmMQHsOQCw365fclIoCR9
 Fx/O6f2l3eJCtaHdlaw66vYsJQHs96Q/MuSQ2bx3Jv6NJYOX5gwMcwWMDi382A2Ytgte
 pU4w==
X-Gm-Message-State: APjAAAXjnfk2Cd8iNS4azLw3CcsRkGH753ZZ1/EfQS457KMUHVdiTnTM
 nRYmCGpaSTU5jGBQZ9cAVvFIIO+uNJw=
X-Google-Smtp-Source: APXvYqzo7c4YiPdXTA1nMAho/q+VBz1pYUv8KpGFQpxV23HAOoQaukZtx6FVAfVwxPqMc+arUrfA5Q==
X-Received: by 2002:a50:a5ec:: with SMTP id b41mr75365674edc.52.1560544614283; 
 Fri, 14 Jun 2019 13:36:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:53 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 28/59] drm/shmob: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:44 +0200
Message-Id: <20190614203615.12639-29-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HZnZIGyd1ihO1nLfm2kHYBUDq0QLZnlqf87UlfFfYuA=;
 b=kzZDdnxGoG4YaTE/yWsfd1f965HNGM9GX0WqC7/ybtqTyBFTNmd1srGb3BqL/n7d81
 L3PhsxAuqdhniFBg/1xCADlT17vif/Y3ZR018eGdHfsp4HoGkJvraSYs7d2JPbFQqM80
 0gTKHruNH/EmQ8ezzVcS7eVnmCvq5UtM2ukE8=
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
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBMYXVyZW50IFBp
bmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBLaWVyYW4gQmlu
Z2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgpDYzogbGludXgt
cmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL3NobW9iaWxl
L3NobW9iX2RybV9kcnYuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zaG1vYmlsZS9zaG1vYl9kcm1fZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vc2htb2JpbGUvc2htb2JfZHJtX2Rydi5jCmluZGV4IDkwNDdhNDlmZjM1
ZS4uNmMxMDZiN2EzYmZlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2htb2JpbGUvc2ht
b2JfZHJtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9zaG1vYmlsZS9zaG1vYl9kcm1fZHJ2
LmMKQEAgLTEzMyw4ICsxMzMsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgc2htb2JfZHJt
X2RyaXZlciA9IHsKIAkuZ2VtX3ZtX29wcwkJPSAmZHJtX2dlbV9jbWFfdm1fb3BzLAogCS5wcmlt
ZV9oYW5kbGVfdG9fZmQJPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKIAkucHJpbWVfZmRf
dG9faGFuZGxlCT0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCi0JLmdlbV9wcmltZV9pbXBv
cnQJPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKLQkuZ2VtX3ByaW1lX2V4cG9ydAk9IGRybV9nZW1f
cHJpbWVfZXhwb3J0LAogCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlCT0gZHJtX2dlbV9jbWFfcHJp
bWVfZ2V0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0gZHJtX2dlbV9j
bWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfdm1hcAkJPSBkcm1fZ2VtX2Nt
YV9wcmltZV92bWFwLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
