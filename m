Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34767280F32
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 10:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FAC06E250;
	Fri,  2 Oct 2020 08:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7C26E245
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 08:47:13 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id lo4so841107ejb.8
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 01:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+DBO7rgD2aCn+T+W3zG92pZpjUVb+QKAA0xIEdpmcec=;
 b=IUtQZmvb79kTgK3oN2YPLiBSuBR5ibtln0gF3gn37iQrQWUoxHEXcMWVhqouhYJw+T
 0C0XilEI62KgGGVDH+Z0F2+6NGy+DprGg/25PuOKrCnFqLuHfMVgNXSGfRBGhhl3b9EX
 gqiu80VQs4gwE9y3PLtZS5rhA0Z7RRnj7cPJaa+Z9iOEIk4HAVaDluocM20XDytzn1KM
 8HV53xn7ITtOAeIzbzojEAO7Vmxut43ZSK3btou5rF/5t6zK5c/HGmA74RkvFg9ottql
 0KSCyDN3l+NlmJWe5qzbCF6p4hm5ZipKDZz3Yek0B9oZioRH5b0FhsY9dKwA9Sxfx0WT
 qvPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+DBO7rgD2aCn+T+W3zG92pZpjUVb+QKAA0xIEdpmcec=;
 b=mVmWbdvXyfqrwWC9DUHrPWvBziUEerky9A4ERqcv8PxTY4Du6c/0LLij+MzS0/4o0p
 12u6t+v59v0Df2wIplYWP0gimhXzYXooDXkuU9DNovae96hckUU77UIqrJHvljRPkMGH
 AMEu5QfOxW3VNPdfBfJcHWzCIBviG1tmLy4nq5jRM3WJWk64Ui1q73aOcmChG3oYUCuU
 htQkuGj4KZzZBEs2egkMzkDE1vWHJBba6WYy1zgWKP0gwja+N3q8rkuxq45HFUkiDUE6
 eSYzs7hf24UX8Tw60smwCUT+LqeJBjM4YVGO8ZY0gl4uN4Z0rZ6pHj6QCykPHhhphprG
 3XVA==
X-Gm-Message-State: AOAM530iFg46msLzw47CJMtkr1eNb6lLzOTchVFe6AFaWCMMbIcI+oWd
 cXFp81qL+XGdoVawyHBRulDIzYKSYCM=
X-Google-Smtp-Source: ABdhPJyGebW7/SxTPdtnD3WMUl5SCmolR7HUbjWojSlZiZXNeBR9rcCA9L7TyyJp2wR8jqIAxhaZbQ==
X-Received: by 2002:a17:906:bcd5:: with SMTP id
 lw21mr1201856ejb.430.1601628431825; 
 Fri, 02 Oct 2020 01:47:11 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0ce:8a95:8e6:b4f4])
 by smtp.gmail.com with ESMTPSA id t10sm659153edw.86.2020.10.02.01.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 01:47:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 3/4] drm/ttm: drop glob parameter from ttm_bo_swapout
Date: Fri,  2 Oct 2020 10:47:06 +0200
Message-Id: <20201002084707.2203-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002084707.2203-1-christian.koenig@amd.com>
References: <20201002084707.2203-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgY2FuIGFsd2F5cyBhY2Nlc3MgdGhlIGdsb2JhbCBzdGF0ZS4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jICAgICB8IDUgKysrLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X21lbW9yeS5jIHwgMiArLQogaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCAgICAgfCAyICst
CiAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwppbmRleCA2MTMxMWY2OWY5ZjguLjVjNTgzNmM0Mjg0ZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV9iby5jCkBAIC0xMjE1LDggKzEyMTUsOSBAQCBFWFBPUlRfU1lNQk9MKHR0bV9ib193YWl0KTsK
ICAqIEEgYnVmZmVyIG9iamVjdCBzaHJpbmsgbWV0aG9kIHRoYXQgdHJpZXMgdG8gc3dhcCBvdXQg
dGhlIGZpcnN0CiAgKiBidWZmZXIgb2JqZWN0IG9uIHRoZSBib19nbG9iYWw6OnN3YXBfbHJ1IGxp
c3QuCiAgKi8KLWludCB0dG1fYm9fc3dhcG91dChzdHJ1Y3QgdHRtX2dsb2JhbCAqZ2xvYiwgc3Ry
dWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpCitpbnQgdHRtX2JvX3N3YXBvdXQoc3RydWN0IHR0
bV9vcGVyYXRpb25fY3R4ICpjdHgpCiB7CisJc3RydWN0IHR0bV9nbG9iYWwgKmdsb2IgPSAmdHRt
X2dsb2I7CiAJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibzsKIAlpbnQgcmV0ID0gLUVCVVNZ
OwogCWJvb2wgbG9ja2VkOwpAQCAtMTMxNCw3ICsxMzE1LDcgQEAgdm9pZCB0dG1fYm9fc3dhcG91
dF9hbGwodm9pZCkKIAkJLm5vX3dhaXRfZ3B1ID0gZmFsc2UKIAl9OwogCi0Jd2hpbGUgKHR0bV9i
b19zd2Fwb3V0KCZ0dG1fZ2xvYiwgJmN0eCkgPT0gMCk7CisJd2hpbGUgKHR0bV9ib19zd2Fwb3V0
KCZjdHgpID09IDApOwogfQogRVhQT1JUX1NZTUJPTCh0dG1fYm9fc3dhcG91dF9hbGwpOwogCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tZW1vcnkuYyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX21lbW9yeS5jCmluZGV4IDZhNmMxMDcyZDgzMS4uNjljZjYyMmU3OWU1IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9tZW1vcnkuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9tZW1vcnkuYwpAQCAtMjc1LDcgKzI3NSw3IEBAIHN0YXRpYyB2b2lk
IHR0bV9zaHJpbmsoc3RydWN0IHR0bV9tZW1fZ2xvYmFsICpnbG9iLCBib29sIGZyb21fd3EsCiAK
IAl3aGlsZSAodHRtX3pvbmVzX2Fib3ZlX3N3YXBfdGFyZ2V0KGdsb2IsIGZyb21fd3EsIGV4dHJh
KSkgewogCQlzcGluX3VubG9jaygmZ2xvYi0+bG9jayk7Ci0JCXJldCA9IHR0bV9ib19zd2Fwb3V0
KCZ0dG1fZ2xvYiwgY3R4KTsKKwkJcmV0ID0gdHRtX2JvX3N3YXBvdXQoY3R4KTsKIAkJc3Bpbl9s
b2NrKCZnbG9iLT5sb2NrKTsKIAkJaWYgKHVubGlrZWx5KHJldCAhPSAwKSkKIAkJCWJyZWFrOwpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBiL2luY2x1ZGUvZHJtL3R0
bS90dG1fYm9fYXBpLmgKaW5kZXggZjQwMTRmNDViZDhiLi5mMGZiZWY3ODE3YzYgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19hcGkuaApAQCAtNTQxLDcgKzU0MSw3IEBAIHNzaXplX3QgdHRtX2JvX2lvKHN0cnVjdCB0
dG1fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgZmlsZSAqZmlscCwKIAkJICBjb25zdCBjaGFyIF9fdXNl
ciAqd2J1ZiwgY2hhciBfX3VzZXIgKnJidWYsCiAJCSAgc2l6ZV90IGNvdW50LCBsb2ZmX3QgKmZf
cG9zLCBib29sIHdyaXRlKTsKIAotaW50IHR0bV9ib19zd2Fwb3V0KHN0cnVjdCB0dG1fZ2xvYmFs
ICpnbG9iLCBzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHggKmN0eCk7CitpbnQgdHRtX2JvX3N3YXBv
dXQoc3RydWN0IHR0bV9vcGVyYXRpb25fY3R4ICpjdHgpOwogdm9pZCB0dG1fYm9fc3dhcG91dF9h
bGwodm9pZCk7CiAKIC8qKgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
