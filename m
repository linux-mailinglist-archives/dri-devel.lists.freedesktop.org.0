Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CBB46A65
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:37:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EEB8934F;
	Fri, 14 Jun 2019 20:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2128936C
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:47 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k21so5263127edq.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CdjzPk9kMBtnORmrw6SV223z66CbONc15QxjD1QLasw=;
 b=WITwsivwAkgHMZmsUzpFYqpqpU9cgQ8BDXmA3lkdp1pAljhtrlL66h0rk0OCEXfQAp
 fGkaMVfbP23iHUwRZx1QY9/AyAmj366qkSDK6viOL/9ogFQYEhIrhBpBkFhJviIB2FkE
 bI3YuLa4DYHchhiuylkcr7XQkkDqjWianJA8+Guxa8dd8fGS/CxTeKBwhVf2meuBXNoy
 +MKtUW5BAR2Yp8N5kVtBan4tv6M1pNClgfsqDe/wZGOSndBMy2KqgV6N1umHTbfryv71
 ygNHrNlavz7lzOY8i9gIHA5u8Ht6aX1ahiSBPBNyXFrkUsra6VEqZlugDxS6E7Hj1FEq
 C+wA==
X-Gm-Message-State: APjAAAWQWwDPK+Plq9ff99wifgzs55ZaKXhoGZQpZQGMQvJI/btXlf8C
 1BVPvWnvxwbqe3vEsigAlFVa1i/6Dmg=
X-Google-Smtp-Source: APXvYqxZ+2+MykTDVtttUpRVv7sYtN3XxhiGqxwDeeUAjjeeMfXPstSFGQXgpyvqmc1NAhQSq5h4Lw==
X-Received: by 2002:a50:97ac:: with SMTP id e41mr46669754edb.27.1560544605717; 
 Fri, 14 Jun 2019 13:36:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 20/59] drm/meson: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:36 +0200
Message-Id: <20190614203615.12639-21-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CdjzPk9kMBtnORmrw6SV223z66CbONc15QxjD1QLasw=;
 b=E34K7NE2WPXVAuiOZH4PhkUzvtjNfPrvlndMNNRMM3NAm0JvhO4XEWzd3/HdePWWiA
 wyNHPJrAuBSUdHOIP7r4e7IBwsC9dey3CP/qAjCz89uiTFfoo8dqLpobYgMguP598PLV
 eOyiZFYNmXBrIdu+UMt9hhdrdWf7lgLugRTes=
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
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBOZWlsIEFybXN0
cm9uZyA8bmFybXN0cm9uZ0BiYXlsaWJyZS5jb20+CkNjOiBLZXZpbiBIaWxtYW4gPGtoaWxtYW5A
YmF5bGlicmUuY29tPgpDYzogbGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCkNjOiBs
aW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fZHJ2LmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKaW5kZXggMTQwMzYzZjkzNTc1Li4zN2RjYTgzZDZl
YjEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKQEAgLTEwMSw4ICsxMDEsNiBAQCBzdGF0
aWMgc3RydWN0IGRybV9kcml2ZXIgbWVzb25fZHJpdmVyID0gewogCS8qIFBSSU1FIE9wcyAqLwog
CS5wcmltZV9oYW5kbGVfdG9fZmQJPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKIAkucHJp
bWVfZmRfdG9faGFuZGxlCT0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCi0JLmdlbV9wcmlt
ZV9pbXBvcnQJPSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKLQkuZ2VtX3ByaW1lX2V4cG9ydAk9IGRy
bV9nZW1fcHJpbWVfZXhwb3J0LAogCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlCT0gZHJtX2dlbV9j
bWFfcHJpbWVfZ2V0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0gZHJt
X2dlbV9jbWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfdm1hcAkJPSBkcm1f
Z2VtX2NtYV9wcmltZV92bWFwLAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
