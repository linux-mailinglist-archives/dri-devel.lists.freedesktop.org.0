Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACA82AC6CE
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 22:19:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9DD38957D;
	Mon,  9 Nov 2020 21:19:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A90688958E
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 21:19:07 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 23so10375298wrc.8
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Nov 2020 13:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zaj9PQ1+4jRxFdQPS9IoWMCG22fw+6XqKxYZ9+Me3Xg=;
 b=G98UJ0t6Uf8XyAe1ROYsF/XIMBcEriB62SabFOr3x7XylyO8f9EbS45rVGhEBLXDKc
 hsQWYFs4zJrYc8FmqhCl4m5tFEmUxtb/xdNjP38hGmTM+qJYlf6lSeEtXHgBY1Lxc1SA
 woIBgG5kTOcPnd9oN2qSk/gOYKj/NVFn+xnPT8PufPJK9ISuPMYdystjas8QpGyhxCK+
 WtcpnuN2ItVwsIy5aLglVDP5NcL4TDQ+65zCqarczO7dPo3xQQ7A1fqgdOtMQ8sFQoBt
 TSwqrf1ReLTffFk2GBD4UR3j4VhzU9yKA8Fb0Q9ctsBiVMwkr9lJ2Lss+sSdO0Qjq+Zn
 hz3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zaj9PQ1+4jRxFdQPS9IoWMCG22fw+6XqKxYZ9+Me3Xg=;
 b=nXyBlXaMH1kaHodvQ1d3ZZH5AGIASC71Ac6uxBb/ijGbjtFruJ5Iuxkq2pxmDTsXef
 Oirh700PG0VOSla73xkPoABowlu4FPi3d+MKTy7fEwUybdw+6GUdwkKjMK8DU59d6h4y
 k6XXu2yDgaZV7nN0meJYehj41t4UEtOKvo5eGi/ATKYAz/ZDMRfGT7oiFFVl/6UPrEZR
 +ADQhIIpI4DnbLZ0LD5eJk8r9GeXdBvc+aO1vs+kIeZiIaPHwP02fUmRZ8RYrJDO+nIG
 pRAO+6CLFNvif9nroIaEHLCQti+C+r1Y8Jd82IyQ4GKNgJde+oWqIA+bIvgM0CBYwerZ
 lxNQ==
X-Gm-Message-State: AOAM530x+7bZrGTOPmUQCE+rqGfnO5E2kwiD9KyrQIB97AEvI9tpizgb
 JjAGyIBfBe7Pwo1dSt5euGKCKA==
X-Google-Smtp-Source: ABdhPJwBysRZoAQuR+8rQwerSjF7CGhlBAXduxk3l2+at9VV/7M8Sv74lR+5Ws5WSF+dHOXHmcBybQ==
X-Received: by 2002:a5d:4bc7:: with SMTP id l7mr7212779wrt.105.1604956746318; 
 Mon, 09 Nov 2020 13:19:06 -0800 (PST)
Received: from dell.default ([91.110.221.139])
 by smtp.gmail.com with ESMTPSA id 71sm15170630wrm.20.2020.11.09.13.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 13:19:05 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 02/20] drm/radeon: Move radeon_ttm{init,
 fini} to shared location
Date: Mon,  9 Nov 2020 21:18:37 +0000
Message-Id: <20201109211855.3340030-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201109211855.3340030-1-lee.jones@linaro.org>
References: <20201109211855.3340030-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmM6IEF0IHRvcCBsZXZlbDoKIGRyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jOjgxNzo1OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90
b3R5cGUgZm9yIOKAmHJhZGVvbl90dG1faW5pdOKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiA4
MTcgfCBpbnQgcmFkZW9uX3R0bV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogfCBe
fn5+fn5+fn5+fn5+fn4KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jOjg3ODo2
OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHJhZGVvbl90dG1fZmluaeKA
mSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCiA4NzggfCB2b2lkIHJhZGVvbl90dG1fZmluaShzdHJ1
Y3QgcmFkZW9uX2RldmljZSAqcmRldikKIHwgXn5+fn5+fn5+fn5+fn5+CgpDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwg
PHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4LW1lZGlhQHZn
ZXIua2VybmVsLm9yZwpDYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnClNpZ25lZC1v
ZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb24uaCAgICAgICAgfCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX29iamVjdC5jIHwgMiAtLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb24uaCBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uLmgKaW5kZXggNTNkOTg5OGU5
ODcxZS4uYTBjMjQ5N2NkNGNmNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb24uaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbi5oCkBAIC00NTEsNiAr
NDUxLDEwIEBAIHN0cnVjdCByYWRlb25fc3VyZmFjZV9yZWcgewogLyoKICAqIFRUTS4KICAqLwor
CitpbnQgcmFkZW9uX3R0bV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKK3ZvaWQg
cmFkZW9uX3R0bV9maW5pKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KTsKKwogc3RydWN0IHJh
ZGVvbl9tbWFuIHsKIAlzdHJ1Y3QgdHRtX2JvX2RldmljZQkJYmRldjsKIAlib29sCQkJCWluaXRp
YWxpemVkOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fb2JqZWN0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYwppbmRleCBhYjgxZTM1
Y2IwNjA2Li4wNDhkODNkMGNhOTk2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9vYmplY3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmpl
Y3QuYwpAQCAtNDEsOCArNDEsNiBAQAogI2luY2x1ZGUgInJhZGVvbi5oIgogI2luY2x1ZGUgInJh
ZGVvbl90cmFjZS5oIgogCi1pbnQgcmFkZW9uX3R0bV9pbml0KHN0cnVjdCByYWRlb25fZGV2aWNl
ICpyZGV2KTsKLXZvaWQgcmFkZW9uX3R0bV9maW5pKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2
KTsKIHN0YXRpYyB2b2lkIHJhZGVvbl9ib19jbGVhcl9zdXJmYWNlX3JlZyhzdHJ1Y3QgcmFkZW9u
X2JvICpibyk7CiAKIC8qCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
