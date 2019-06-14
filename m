Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E982E46AB2
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5A389823;
	Fri, 14 Jun 2019 20:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF5889733
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:09 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id m10so5243039edv.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MeVtpsNXmvtyEIHkMmObs4X1kKSuhFRrIvb+lraGWMA=;
 b=p1Flea3ngyO4/DYx+z+yOw1P+pA9Q5FH78U9P7DZhu3H4NAip1N4pJOyWF8Feej8hI
 pZXaLE2RT6cCk++FgG1ttWEbUpphLABkh6/CciY+mZWqmpsGys081kmE2BzTwtODEFh3
 0yj4DkDpVbPkQItf+k857Z5FHAjlUUXEwA35mKpYiN1gPdavTLVpUnU2J1c7Gww1S/Wf
 KPSi5Kmkn6VkIK/MbbHsXY4FK+V/CA6bv89tFtXh5ggua8PlAOg5Fem4Qy/3ypAuYviv
 8pMxBp22SXrap9TUILzFfUj3FXMeIijUQWr3yiNpwnaG1Fl5PtVlc1mDlaPspKwfXyHB
 M9QQ==
X-Gm-Message-State: APjAAAVUzehaWlkee6fe9CKnbgDYJnQlJk9mOn4DY+zTwlF38uXjT+4j
 4ZtU/tzkrZYJ0BPP2t4VyU52b986v6Y=
X-Google-Smtp-Source: APXvYqwmxyMhIbR9TtQtGEc0XTmuhK6jYdK7sKovMyNUDFtUubxuWkX0RPMLOWDeXLVwOrSmJ91mSA==
X-Received: by 2002:a50:f486:: with SMTP id s6mr69637737edm.186.1560544626875; 
 Fri, 14 Jun 2019 13:37:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:06 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 39/59] drm/zte: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:55 +0200
Message-Id: <20190614203615.12639-40-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MeVtpsNXmvtyEIHkMmObs4X1kKSuhFRrIvb+lraGWMA=;
 b=YfRgHU9FH2khjeHMBdTEdje6LF6cVzCi/nu/9/HwYRRTvKpkQkBTl+dqgluJHyPhad
 9qQez2z/axGhPZL62HgFZgnVp1WZ0DsXCbhTEB9o+ftz939FW5FzYEWTnCWTVpOQggVH
 M2sr0/HNHgVTUfRSnD+jmR2BPhpzBgDoomCiQ=
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
 Shawn Guo <shawnguo@kernel.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBTaGF3biBHdW8g
PHNoYXduZ3VvQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3p0ZS96eF9kcm1fZHJ2
LmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0venRlL3p4X2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS96dGUvenhf
ZHJtX2Rydi5jCmluZGV4IDA2MGFkNTI2NmJjNy4uZWYwMTljYWQ3ZTgxIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0venRlL3p4X2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0venRl
L3p4X2RybV9kcnYuYwpAQCAtNDQsOCArNDQsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIg
enhfZHJtX2RyaXZlciA9IHsKIAkuZHVtYl9jcmVhdGUgPSBkcm1fZ2VtX2NtYV9kdW1iX2NyZWF0
ZSwKIAkucHJpbWVfaGFuZGxlX3RvX2ZkID0gZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCiAJ
LnByaW1lX2ZkX3RvX2hhbmRsZSA9IGRybV9nZW1fcHJpbWVfZmRfdG9faGFuZGxlLAotCS5nZW1f
cHJpbWVfZXhwb3J0ID0gZHJtX2dlbV9wcmltZV9leHBvcnQsCi0JLmdlbV9wcmltZV9pbXBvcnQg
PSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKIAkuZ2VtX3ByaW1lX2dldF9zZ190YWJsZSA9IGRybV9n
ZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZSwKIAkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9
IGRybV9nZW1fY21hX3ByaW1lX2ltcG9ydF9zZ190YWJsZSwKIAkuZ2VtX3ByaW1lX3ZtYXAgPSBk
cm1fZ2VtX2NtYV9wcmltZV92bWFwLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
