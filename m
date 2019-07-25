Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F3F742C3
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 03:10:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439766E313;
	Thu, 25 Jul 2019 01:10:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DB366E2D1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 01:10:08 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id k20so93609921ios.10
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:10:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ohz11I0BD5v1dSKvx1LVUw/2M1EDEBmAhM95SHgIQi4=;
 b=VGC8enFEGg+QLvlkKPTECdxHdybsnxtvkU01SFJoyiM9mcVZI9+m/vwTp1WSqg6HAC
 T7hqtmYVp1KEJzeHDW3CgRu6CmydxZBfipECZ1l+eHmkCuwhWYtYEgEi4VL/NA70WSil
 GyelarPYEso2bPS47/JyccxZoET7/LeOhfEKEwiy7EXPOQjR3OYyTlMQfT18N2qT2Bsl
 1IsJpgnfLhpc270jGL7KNm/D0RsxW6lYdWtldNygPi8bCNcEVpe83gdG/lWIInXqqBEi
 5ZWKfJY53WJ1J5oV7NwS3xdVpF5JuyKO/xazb3JjqCAkrV4HHsuVzt6MaOoQBKMOdnj+
 TLIg==
X-Gm-Message-State: APjAAAUpSHWpVuhdaf1AoiLw0EWQkeRRGmTTehTJOjDV3XwNS+6/E3tU
 GUntdHw/txhKIPhH9b964HCWqL8=
X-Google-Smtp-Source: APXvYqyJnHCpey6OCI97yKilmnsaEX6sd6UOeaeZ/PKt64VtZ3FJT0VnmZJOHk/FbV5kj8l+pjQseA==
X-Received: by 2002:a5e:d817:: with SMTP id l23mr9457434iok.282.1564017007097; 
 Wed, 24 Jul 2019 18:10:07 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id o7sm40675924ioo.81.2019.07.24.18.10.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 18:10:06 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/7] drm/gem: Allow sparsely populated page arrays in
 drm_gem_put_pages
Date: Wed, 24 Jul 2019 19:09:57 -0600
Message-Id: <20190725011003.30837-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725011003.30837-1-robh@kernel.org>
References: <20190725011003.30837-1-robh@kernel.org>
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
YzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPgotLS0KdjI6CiAtIG5ldyBwYXRjaAoKIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbS5jCmluZGV4IDI0M2Y0M2Q3MGY0Mi4uZGIzNzNjOTQ1ZjE2IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMK
QEAgLTYzMyw2ICs2MzMsOSBAQCB2b2lkIGRybV9nZW1fcHV0X3BhZ2VzKHN0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqb2JqLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzLAoKIAlwYWdldmVjX2luaXQoJnB2ZWMp
OwogCWZvciAoaSA9IDA7IGkgPCBucGFnZXM7IGkrKykgeworCQlpZiAoIXBhZ2VzW2ldKQorCQkJ
Y29udGludWU7CisKIAkJaWYgKGRpcnR5KQogCQkJc2V0X3BhZ2VfZGlydHkocGFnZXNbaV0pOwoK
LS0KMi4yMC4xCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
