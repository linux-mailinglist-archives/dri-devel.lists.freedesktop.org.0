Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F04E388B
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:46:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AC96E49B;
	Thu, 24 Oct 2019 16:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE346E48F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:45:54 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z11so3486289wro.11
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W2ba8i6cmLNAVuw9Ax+u8c8Mx7vEOPzpNImQ2Ltx3BU=;
 b=GWY2swPNu+x7+4+sMSslBbJz/OsvPcLTH9nyY512PgSaEC94pQrI6UShoP/YszNJe0
 4Pq/m/bgQu0OjP0g4wzlvRSdCboGSqURZzE441hvyiIq3nYcMBpr1RVXanq4d7jhdkKN
 l70AzgDqnNFL0FQ2FTjJfFX3Ti05Jm9PUexxErbJLag+CS+HY4NtUp/U/ZeSpi09WKKX
 /ip4KqxAGkLYfMi9vI62pmLZp0rk3lU0Xifka6iu+JSjc/odn2z0yMc5yu+KcmE4HUQ9
 KXI5BipeFJ5M3TyyKc8jcXOw+//lEfdy2eugSOMkdx/VocP+NtY5LYOvSbGWYuMIGB9Z
 cMBw==
X-Gm-Message-State: APjAAAWxAM1pGgboVBtW/Ke4Xu5WWYsd6HL+SplWp9AsqfsjjRD5k4Et
 KAbkG7o34vJNxSCGifblvwMjXL7i
X-Google-Smtp-Source: APXvYqzxAAu40HRGwD/211/4A721vw1pPY68bX60qRMq+Gu+zzY6cblRT/v/7RfYzdUkACAccI9Myw==
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr4691068wrs.63.1571935553087; 
 Thu, 24 Oct 2019 09:45:53 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id n1sm31200223wrg.67.2019.10.24.09.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:45:51 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 07/32] drm/tegra: dp: Read TPS3 capability from sink
Date: Thu, 24 Oct 2019 18:45:09 +0200
Message-Id: <20191024164534.132764-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W2ba8i6cmLNAVuw9Ax+u8c8Mx7vEOPzpNImQ2Ltx3BU=;
 b=k9WJb44yg/elITsDxYJnXcTvdo6WewwN3UuPJc9iOB1Licvzg4FbMNxOVLzfqVPrd7
 6YtBLIAosFZE9WAiGJjfPBSOmPvx90IUBe8vXAkcKYfr723hw03CxvIJpDpiaJrdKhF7
 K3OAZ2AAof+X8sSSQw+DWZW+7DXT1bum7c9psxevh/w7z35KPtifFHGTQ5dbv+1lg+B0
 0SMn1BPvKS5Tw1Hf/Yh+SQMs8iB1N2Pa34oFf1qW6kWhWg0H4bRN+7tohthu/c1qEb5u
 hOgIyB4a4rgoQ8AbjXDezwqmmzZwp8j6h3KbMDu9P20SV8qJ/HBYHPNe5dFNl1Q9TrJS
 CGXA==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBUUFMzIGNhcGFi
aWxpdHkgY2FuIGJlIGV4cG9zZWQgYnkgRFAgMS4yIGFuZCBsYXRlciBzaW5rcyBpZiB0aGV5CnN1
cHBvcnQgdGhlIGFsdGVybmF0aXZlIHRyYWluaW5nIHBhdHRlcm4gZm9yIGNoYW5uZWwgZXF1YWxp
emF0aW9uLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYyB8IDMgKysrCiBkcml2ZXJzL2dwdS9k
cm0vdGVncmEvZHAuaCB8IDcgKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdGVncmEvZHAuYwppbmRleCA5N2ZjMDIyNTQ4M2YuLmUyMmViYWI2NzdiOSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2RwLmMKQEAgLTExLDYgKzExLDcgQEAKIHN0YXRpYyB2b2lkIGRybV9kcF9saW5rX2NhcHNf
cmVzZXQoc3RydWN0IGRybV9kcF9saW5rX2NhcHMgKmNhcHMpCiB7CiAJY2Fwcy0+ZW5oYW5jZWRf
ZnJhbWluZyA9IGZhbHNlOworCWNhcHMtPnRwczNfc3VwcG9ydGVkID0gZmFsc2U7CiAJY2Fwcy0+
ZmFzdF90cmFpbmluZyA9IGZhbHNlOwogfQogCkBAIC0xOCw2ICsxOSw3IEBAIHZvaWQgZHJtX2Rw
X2xpbmtfY2Fwc19jb3B5KHN0cnVjdCBkcm1fZHBfbGlua19jYXBzICpkZXN0LAogCQkJICAgY29u
c3Qgc3RydWN0IGRybV9kcF9saW5rX2NhcHMgKnNyYykKIHsKIAlkZXN0LT5lbmhhbmNlZF9mcmFt
aW5nID0gc3JjLT5lbmhhbmNlZF9mcmFtaW5nOworCWRlc3QtPnRwczNfc3VwcG9ydGVkID0gc3Jj
LT50cHMzX3N1cHBvcnRlZDsKIAlkZXN0LT5mYXN0X3RyYWluaW5nID0gc3JjLT5mYXN0X3RyYWlu
aW5nOwogfQogCkBAIC02Myw2ICs2NSw3IEBAIGludCBkcm1fZHBfbGlua19wcm9iZShzdHJ1Y3Qg
ZHJtX2RwX2F1eCAqYXV4LCBzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmspCiAJbGluay0+bWF4X2xh
bmVzID0gZHJtX2RwX21heF9sYW5lX2NvdW50KGRwY2QpOwogCiAJbGluay0+Y2Fwcy5lbmhhbmNl
ZF9mcmFtaW5nID0gZHJtX2RwX2VuaGFuY2VkX2ZyYW1lX2NhcChkcGNkKTsKKwlsaW5rLT5jYXBz
LnRwczNfc3VwcG9ydGVkID0gZHJtX2RwX3RwczNfc3VwcG9ydGVkKGRwY2QpOwogCWxpbmstPmNh
cHMuZmFzdF90cmFpbmluZyA9IGRybV9kcF9mYXN0X3RyYWluaW5nX2NhcChkcGNkKTsKIAogCWxp
bmstPnJhdGUgPSBsaW5rLT5tYXhfcmF0ZTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS9kcC5oIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmgKaW5kZXggZDZhZTQ3N2JhYjVj
Li45OTkwNzg4MTI5NDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5oCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcC5oCkBAIC0yMiw2ICsyMiwxMyBAQCBzdHJ1Y3Qg
ZHJtX2RwX2xpbmtfY2FwcyB7CiAJICovCiAJYm9vbCBlbmhhbmNlZF9mcmFtaW5nOwogCisJLyoq
CisJICogdHBzM19zdXBwb3J0ZWQ6CisJICoKKwkgKiB0cmFpbmluZyBwYXR0ZXJuIHNlcXVlbmNl
IDMgc3VwcG9ydGVkIGZvciBlcXVhbGl6YXRpb24KKwkgKi8KKwlib29sIHRwczNfc3VwcG9ydGVk
OworCiAJLyoqCiAJICogQGZhc3RfdHJhaW5pbmc6CiAJICoKLS0gCjIuMjMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
