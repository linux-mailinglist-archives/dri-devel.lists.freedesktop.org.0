Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 578A546A5F
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CE9F894EA;
	Fri, 14 Jun 2019 20:36:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F71C89452
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:43 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p26so5268608edr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A1+UX4XN7J3a2b7YvKfIkFgrauttZzDX+EEYE5Cqodw=;
 b=MhjVOAAYPOXui92tWWmG+DbYA+3oEvvKTGR7oeSJdRU95lkDED3Dpcbuu13oUB1/pT
 2+VLfUPGknhMlHn/rVCpvqqvWEIXDoLjJQeolH1m/7ujpfu2mVvxVBGJ5xQyrIdkhW8J
 IaOLseyc6Eh+SdNpMOa5wQQ1347cSpnfabZG9FPGP78NY5IB1xWceLAX24e/37fZVQhX
 dxdysO4Mna1fd+N4GIhD1l1FkUuN4WVZ3NCWm2SvwRRhlBLnx0Rd1A9SOloEZsqFsOwr
 XrwMzKYAB8fiV7zX07+mex1drU7srSm0DaYAaySlfwzoTN+cDTWTM8c4hra4sVssJA1r
 iL5w==
X-Gm-Message-State: APjAAAXZZ6LGpF5vkGLViD8DRZT8mOOr4BnuPSW7n1VwHhF5ABwpgCYt
 6kX1JRY6AiX2jhc0zVc/v1WqRp3MRc8=
X-Google-Smtp-Source: APXvYqz0CbNW5+QuO1UGwPMICP1ugMu7qOyXETa1d8TwZjnVq89vN00C73vAyXp6sXwgSx8G5E/1bQ==
X-Received: by 2002:a50:f486:: with SMTP id s6mr69635983edm.186.1560544601348; 
 Fri, 14 Jun 2019 13:36:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.40
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 16/59] drm/hisilicon: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:32 +0200
Message-Id: <20190614203615.12639-17-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A1+UX4XN7J3a2b7YvKfIkFgrauttZzDX+EEYE5Cqodw=;
 b=I8MtkLZea4dErxph3dmuCCHxg6rdNn8/c/+qdh6U1cV7HO6z3vT1ShLSQROwE4/PrF
 uhe5RotVsjS/17zC8T/XpiHtNB3mr7YFEtT7htCvOv6+9Tstg4ljnuFqvyWlfWoQpUCc
 ds8jLig8rlZLy29KFE22sXBPZ7WQ4JP17ZU0I=
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
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBTYW0gUmF2bmJv
cmcgPHNhbUByYXZuYm9yZy5vcmc+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPgpDYzogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhpc2lsaWNvbi5jb20+CkNj
OiAiTm9yYWxmIFRyw7hubmVzIiA8bm9yYWxmQHRyb25uZXMub3JnPgpDYzogQ0sgSHUgPGNrLmh1
QG1lZGlhdGVrLmNvbT4KQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5jIHwg
MiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYwppbmRleCA3M2YyYjUzZjMyY2MuLjZl
OTVkM2IxNjdjYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9r
aXJpbl9kcm1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJp
bl9kcm1fZHJ2LmMKQEAgLTEyNiw4ICsxMjYsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIg
a2lyaW5fZHJtX2RyaXZlciA9IHsKIAogCS5wcmltZV9oYW5kbGVfdG9fZmQJPSBkcm1fZ2VtX3By
aW1lX2hhbmRsZV90b19mZCwKIAkucHJpbWVfZmRfdG9faGFuZGxlCT0gZHJtX2dlbV9wcmltZV9m
ZF90b19oYW5kbGUsCi0JLmdlbV9wcmltZV9leHBvcnQJPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwK
LQkuZ2VtX3ByaW1lX2ltcG9ydAk9IGRybV9nZW1fcHJpbWVfaW1wb3J0LAogCS5nZW1fcHJpbWVf
Z2V0X3NnX3RhYmxlID0gZHJtX2dlbV9jbWFfcHJpbWVfZ2V0X3NnX3RhYmxlLAogCS5nZW1fcHJp
bWVfaW1wb3J0X3NnX3RhYmxlID0gZHJtX2dlbV9jbWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAog
CS5nZW1fcHJpbWVfdm1hcAkJPSBkcm1fZ2VtX2NtYV9wcmltZV92bWFwLAotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
