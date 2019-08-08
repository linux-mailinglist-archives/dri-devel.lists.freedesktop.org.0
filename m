Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4016286D12
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 00:22:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E12D6ECCD;
	Thu,  8 Aug 2019 22:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CAA6ECCD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 22:22:04 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id l15so67857730oth.7
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 15:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T+bEnEpkz+ZRgimT11B8n1cZQnPJ56dXCRl4mSO81UA=;
 b=k0vUGxpn8egUs7jS0u4o3GPbRo29eUVz3PfW4wM0q0Nwtfqyix/e+7t01OhB+NUBWk
 EDcCWW8/WRO1mHIH7/22TDD1nC72G+VhFGcopKJQxX9ltcfon6iiaJ3447UdOPYnho0z
 SyHQWIrY/WpJPZWAZ02nDLcKFGfOPvAiQgifEnEaqbJdN+6W8ihk+UVxK4JL8GkGX3AR
 xQBoHfzdR/+83xffbByc8+oppGoPXUIoGu9bDT3ZRb2Hj4kMtGL/GeDhRnB+JosnOc+Q
 /G1iHcDNL5w9W7SQEKm+NN3GafxmJEfRX+qtJe4SSIJhv8Bn8zZG76hhCSS8B4I/7r7f
 4gbg==
X-Gm-Message-State: APjAAAUCI8zRa4YtKeiZbGgXv/v7CYZnE/BPnJb3Le+mVHybudChLk16
 Im+mUIV9xb+wQpqo9s2qbGBVTF8=
X-Google-Smtp-Source: APXvYqyEStIibxrsGck9V1BR4Gb6vp3Dvq3OvLtN+Ux2B4ii38TDb/+yyWHKd/Paig3+wOnlNd6vyw==
X-Received: by 2002:a5d:924e:: with SMTP id e14mr16640982iol.215.1565302923477; 
 Thu, 08 Aug 2019 15:22:03 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id i4sm118528553iog.31.2019.08.08.15.22.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 15:22:03 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/9] drm/gem: Allow sparsely populated page arrays in
 drm_gem_put_pages
Date: Thu,  8 Aug 2019 16:21:52 -0600
Message-Id: <20190808222200.13176-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808222200.13176-1-robh@kernel.org>
References: <20190808222200.13176-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGFuZnJvc3QgaGFzIGEgbmVlZCBmb3IgcGFnZXMgYWxsb2NhdGVkIG9uIGRlbWFuZCB2aWEgR1BV
IHBhZ2UgZmF1bHRzLgpXaGVuIHJlbGVhc2luZyB0aGUgcGFnZXMsIHRoZSBvbmx5IHRoaW5nIHBy
ZXZlbnRpbmcgdXNpbmcKZHJtX2dlbV9wdXRfcGFnZXMoKSBpcyBuZWVkaW5nIHRvIHNraXAgb3Zl
ciB1bnBvcHVsYXRlZCBwYWdlcywgc28gYWxsb3cKZm9yIHNraXBwaW5nIG92ZXIgTlVMTCBzdHJ1
Y3QgcGFnZSBwb2ludGVycy4KCkNjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPgpDYzogTWF4aW1lIFJpcGFyZCA8bWF4aW1lLnJpcGFyZEBib290
bGluLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGF2aWQgQWlybGll
IDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpD
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpSZXZpZXdlZC1ieTogU3RldmVuIFBy
aWNlIDxzdGV2ZW4ucHJpY2VAYXJtLmNvbT4KQWNrZWQtYnk6IEFseXNzYSBSb3Nlbnp3ZWlnIDxh
bHlzc2Eucm9zZW56d2VpZ0Bjb2xsYWJvcmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVycmlu
ZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgfCAzICsr
KwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCmluZGV4IGFmYzM4
Y2VjZTNmNS4uYTJkZDE5ODE3N2YyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKQEAgLTYzMyw2ICs2MzMsOSBAQCB2
b2lkIGRybV9nZW1fcHV0X3BhZ2VzKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3Qg
cGFnZSAqKnBhZ2VzLAogCiAJcGFnZXZlY19pbml0KCZwdmVjKTsKIAlmb3IgKGkgPSAwOyBpIDwg
bnBhZ2VzOyBpKyspIHsKKwkJaWYgKCFwYWdlc1tpXSkKKwkJCWNvbnRpbnVlOworCiAJCWlmIChk
aXJ0eSkKIAkJCXNldF9wYWdlX2RpcnR5KHBhZ2VzW2ldKTsKIAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
