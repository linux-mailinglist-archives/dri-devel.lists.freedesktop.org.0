Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D5646A6D
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C208F89503;
	Fri, 14 Jun 2019 20:36:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BCE989452
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:44 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id s49so5287147edb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o8YdFWVByQQw2kbSJYvwAZvYSJINdZejGEAnfoP7ABg=;
 b=pv3nhMXRuxu9dU8PyuwPYlTrCmh/12TsW90NYNAXhcDZQyzhyMcOJAVYoos7tkWLTm
 iLI4HIpCAALvjLzLZlCf3KWE+HiFYJUl4FKfVIGxLIjaBQ4Co1P6KZYD3XKpU6YmqlOF
 0FJbc6jxx/fmvqTqRzpNZmmKgKGhp39ZL1eoxkXRdb7/g61P+qe3w6fXw+1mVXgOrXr1
 i6rAVoW0MnLYyxoopeF+mYjW2nALkR0xM/5rhdwavfdJ/wuvzI+D66c38jtfxaQPzOIr
 PkwXk2gxcicoXRT4UZfierXwTnEH0rtjY6Qs91kOChi/Mb0NsauGUFx+pY7Dq+9W0kZ0
 eUOA==
X-Gm-Message-State: APjAAAUkE7M3oQdT2IijEGX449b91wiwaBKi70ojZJcCtXl2rBp7VUtK
 NgqPowxTnixQpwT4f+gztb5x+QvRdaY=
X-Google-Smtp-Source: APXvYqy7z4kiBN4emSD4oafwbU4mewi9L5k+GGEEe6ueq+gxtqpbzG8TsVVCDKj05DPRTamXAjPZWQ==
X-Received: by 2002:a17:906:1813:: with SMTP id
 v19mr69648291eje.109.1560544602512; 
 Fri, 14 Jun 2019 13:36:42 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.41
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:41 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 17/59] drm/imx: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:33 +0200
Message-Id: <20190614203615.12639-18-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o8YdFWVByQQw2kbSJYvwAZvYSJINdZejGEAnfoP7ABg=;
 b=GSn4hAepYp7l8Zag1Wrp0xw+BaqUJOm6anR2s/xF4nndXpLX3J6Kjnplw5zMk6e6lD
 ojbORjD+kuhJ6cyADOcu76xekQFuS3sECJuJfr2pBSQEesehzd43aaDx1PFS5bAD0VC3
 DLoayOM2mOlRU80J1Vk3EH/rWgDsVxg89dVr4=
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBQaGlsaXBwIFph
YmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJu
ZWwub3JnPgpDYzogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgpDYzogUGVu
Z3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4KQ2M6IEZhYmlvIEVz
dGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT4KQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhA
bnhwLmNvbT4KQ2M6IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwotLS0KIGRy
aXZlcnMvZ3B1L2RybS9pbXgvaW14LWRybS1jb3JlLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwg
MiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1kcm0t
Y29yZS5jIGIvZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtZHJtLWNvcmUuYwppbmRleCAzODRkYjZk
ODZkYTAuLmJkZWZhYTE2MzVlYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2lteC9pbXgt
ZHJtLWNvcmUuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaW14L2lteC1kcm0tY29yZS5jCkBAIC0x
NTQsOCArMTU0LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGlteF9kcm1fZHJpdmVyID0g
ewogCiAJLnByaW1lX2hhbmRsZV90b19mZAk9IGRybV9nZW1fcHJpbWVfaGFuZGxlX3RvX2ZkLAog
CS5wcmltZV9mZF90b19oYW5kbGUJPSBkcm1fZ2VtX3ByaW1lX2ZkX3RvX2hhbmRsZSwKLQkuZ2Vt
X3ByaW1lX2ltcG9ydAk9IGRybV9nZW1fcHJpbWVfaW1wb3J0LAotCS5nZW1fcHJpbWVfZXhwb3J0
CT0gZHJtX2dlbV9wcmltZV9leHBvcnQsCiAJLmdlbV9wcmltZV9nZXRfc2dfdGFibGUJPSBkcm1f
Z2VtX2NtYV9wcmltZV9nZXRfc2dfdGFibGUsCiAJLmdlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUg
PSBkcm1fZ2VtX2NtYV9wcmltZV9pbXBvcnRfc2dfdGFibGUsCiAJLmdlbV9wcmltZV92bWFwCQk9
IGRybV9nZW1fY21hX3ByaW1lX3ZtYXAsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
