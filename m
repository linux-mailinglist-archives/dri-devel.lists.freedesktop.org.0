Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92A480162
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 21:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EADF6E5BB;
	Fri,  2 Aug 2019 19:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC5356E5BB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 19:51:54 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id g20so154705157ioc.12
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 12:51:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3p4cBswFFRoKy6tEpknmdkGW5IPNEAcVsUIZqRHEvng=;
 b=ImfLIJuNGazzxPJ0pHHSu8rCY98jzTP1xZA9DPSMxAkG6SUp5HviR5xY8vORaGk68k
 G5xMBtCjnnAi++pKzlM5rGAjZX3TuICnfOy/CHNDjZsohCKXUtwfMpwi+t/tNPhoFGj8
 ytxzIUliwzOnyk9Dh+akBdA63zULgJmHuRbYbHN+VuyStNgvDCHG2mmHGOG9UGp3Vi0l
 GaHfbQEP7hQDT0Ojo5pBDvMpfxte4DmDf7sGcLx5kCVIzdmKmAGkkhwEkpQD77vHyDOv
 emGHJjtnfrxN06XAw7c85EZ2QIlEcbAYolQFgS439Pu/1Lxqne/DXcLY3P8PfyJVNizS
 7rLQ==
X-Gm-Message-State: APjAAAVxRV9hCQfIGFBQ9FTCedkkv38tcXxnN+CSCgLl81+vb5KzKEQH
 BRV6pekKWAu2q5Epe2cepqCqE7Q=
X-Google-Smtp-Source: APXvYqwWPC+Pv1T+a94+1FW3hcYuxQsfSNAfwdKYZESZOeciimDtash2k2FoHvnYFK1VVGTc1ySOxQ==
X-Received: by 2002:a02:b016:: with SMTP id p22mr56289915jah.121.1564775513702; 
 Fri, 02 Aug 2019 12:51:53 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id s4sm98419934iop.25.2019.08.02.12.51.52
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 12:51:53 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/8] drm/gem: Allow sparsely populated page arrays in
 drm_gem_put_pages
Date: Fri,  2 Aug 2019 13:51:43 -0600
Message-Id: <20190802195150.23207-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802195150.23207-1-robh@kernel.org>
References: <20190802195150.23207-1-robh@kernel.org>
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
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
Z3B1L2RybS9kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCmluZGV4IDI0M2Y0
M2Q3MGY0Mi4uZGIzNzNjOTQ1ZjE2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKQEAgLTYzMyw2ICs2MzMsOSBAQCB2
b2lkIGRybV9nZW1fcHV0X3BhZ2VzKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCBzdHJ1Y3Qg
cGFnZSAqKnBhZ2VzLAogCiAJcGFnZXZlY19pbml0KCZwdmVjKTsKIAlmb3IgKGkgPSAwOyBpIDwg
bnBhZ2VzOyBpKyspIHsKKwkJaWYgKCFwYWdlc1tpXSkKKwkJCWNvbnRpbnVlOworCiAJCWlmIChk
aXJ0eSkKIAkJCXNldF9wYWdlX2RpcnR5KHBhZ2VzW2ldKTsKIAotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
