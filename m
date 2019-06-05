Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6B635ECD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 16:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B0289B51;
	Wed,  5 Jun 2019 14:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4522A89B18
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 14:12:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id r18so10635902wrm.10
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 07:12:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QJV2EelmzwU1/yznyPFkc/fxpPopz48+1zy1DsarmDE=;
 b=c8SBpA6kBUfjZ4UMVa+uGCtKZXjkw6UKElz3y5esy/mOip2i6aXyKuI4PavUCULVoS
 RDqOkZC+xW9PrUtT/rFYqQtpRF8oNvaVegAacLQQVudpKusgdqsOJkRmYSX+cAuN4rZp
 rgJZwW3ce4LaOC5/GWgVwIRWLb4yOKz0cvTyTYtm9RNvPAtynfEN1UF+8D593LhGv9oJ
 lKQhV+W2Hdt5JcqKWbX34Rs9Dhs0WggswPm5qocbG90XPIJNAKJl00wW5KDExP+V6w8M
 FeFl2/jioGO2EBhiMPoh6t+oGCSLOyzyi1s8+JxtPnT8v4Pya7bLncpMSPfvLj4zZyT1
 kvbQ==
X-Gm-Message-State: APjAAAW5BSj2pUVGyCr8WIAYVp5XUQsXAgJx2BAXdZrFinAghZ3aDKT3
 +Sd6fHDpN9aPrtNOF1xeDjIlROoR8cvQjw==
X-Google-Smtp-Source: APXvYqyfg6omR+ZPIC7qJMVZoiXxGQOWD9YskUpPvpHHMZWtFQOlsNcFXDkrbb+rAuRH69aSGBrBgA==
X-Received: by 2002:adf:a38d:: with SMTP id l13mr19424196wrb.187.1559743977659; 
 Wed, 05 Jun 2019 07:12:57 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id s8sm36292546wra.55.2019.06.05.07.12.57
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 05 Jun 2019 07:12:57 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/meson: fix G12A primary plane disabling
Date: Wed,  5 Jun 2019 16:12:53 +0200
Message-Id: <20190605141253.24165-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605141253.24165-1-narmstrong@baylibre.com>
References: <20190605141253.24165-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QJV2EelmzwU1/yznyPFkc/fxpPopz48+1zy1DsarmDE=;
 b=TVdJqRZFfU5s0FX3DJNaUJBa2wh3dlpycCNSUJUcDpNztvmmX7eFg6a+jgjhjp3qbp
 gQHVEwCL4w4ZnmBCCNQOzLmQ0xRkyb0gjzO6PQfC1KWeuZVPLOTTJfFXgbJfkEgqNm0L
 WMPL2OgOFvdi39tuwXV61CrYn9Fl1MBkA6pFoEdnUXyk/pPydlqd/rJ+lc8ByEjTKuY3
 u2dE2rGaX0W+8/+nrwyyqMzgBV2jkkmvxPC6u82FSHu8rvUtIBZnlJDfCYmtP3A9B2H+
 FfqafncdaU4zneDGniLi5/V3HygLwRsR2wVPzsZBfwlD/LS/QOi259lfN7GnIZt5I0fq
 KxJg==
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
Cc: linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEcxMkEgUHJpbWFyeSBwbGFuZSB3YXMgZGlzYWJsZWQgYnkgd3JpdGluZyBpbiB0aGUgT1NE
MSBjb25maWd1cmF0aW9uCnJlZ2lzdGVycywgYnV0IHRoaXMgY2F1c2VkIHRoZSBwbGFuZSBibGVu
ZGVyIHRvIHN0YWxsIGluc3RlYWQgb2YgY29udGludWluZwpibGVuZGVkIG9ubHkgdGhlIG92ZXJs
YXkgcGxhbmUuCgpGaXggdGhpcyBieSBkaXNhYmxpbmcgdGhlIE9TRDEgcGxhbmUgaW4gdGhlIGJs
ZW5kZXIgcmVnaXN0ZXJzLCBhbmQgYWxzbwplbmFibGluZyBpdCBiYWNrIHVzaW5nIHRoZSBzYW1l
IHJlZ2lzdGVyLgoKRml4ZXM6IDQ5MGY1MGMxMDlkMSAoImRybS9tZXNvbjogQWRkIEcxMkEgc3Vw
cG9ydCBmb3IgT1NEMSBQbGFuZSIpClNpZ25lZC1vZmYtYnk6IE5laWwgQXJtc3Ryb25nIDxuYXJt
c3Ryb25nQGJheWxpYnJlLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fY3J0
Yy5jICB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9wbGFuZS5jIHwgNCArKy0t
CiBkcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdml1LmMgICB8IDMgKy0tCiAzIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21l
c29uX2NydGMuYwppbmRleCA1MGE5YTk2NzIwYjkuLmFhOGVhMTA3NTI0ZSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2NydGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fY3J0Yy5jCkBAIC0yNTIsNiArMjUyLDggQEAgc3RhdGljIHZvaWQgbWVzb25f
ZzEyYV9jcnRjX2VuYWJsZV9vc2QxKHN0cnVjdCBtZXNvbl9kcm0gKnByaXYpCiAJd3JpdGVsX3Jl
bGF4ZWQocHJpdi0+dml1Lm9zYl9ibGVuZDFfc2l6ZSwKIAkJICAgICAgIHByaXYtPmlvX2Jhc2Ug
KwogCQkgICAgICAgX1JFRyhWSVVfT1NEX0JMRU5EX0JMRU5EMV9TSVpFKSk7CisJd3JpdGVsX2Jp
dHNfcmVsYXhlZCgzIDw8IDgsIDMgPDwgOCwKKwkJCSAgICBwcml2LT5pb19iYXNlICsgX1JFRyhP
U0QxX0JMRU5EX1NSQ19DVFJMKSk7CiB9CiAKIHN0YXRpYyB2b2lkIG1lc29uX2NydGNfZW5hYmxl
X3ZkMShzdHJ1Y3QgbWVzb25fZHJtICpwcml2KQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lc29uL21lc29uX3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fcGxhbmUu
YwppbmRleCBiNzg4MjgwODk1YzYuLmQ5MDQyN2I5M2E1MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lc29uL21l
c29uX3BsYW5lLmMKQEAgLTMxOCw4ICszMTgsOCBAQCBzdGF0aWMgdm9pZCBtZXNvbl9wbGFuZV9h
dG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAogCS8qIERpc2FibGUgT1NE
MSAqLwogCWlmIChtZXNvbl92cHVfaXNfY29tcGF0aWJsZShwcml2LCAiYW1sb2dpYyxtZXNvbi1n
MTJhLXZwdSIpKQotCQl3cml0ZWxfYml0c19yZWxheGVkKEJJVCgwKSB8IEJJVCgyMSksIDAsCi0J
CQlwcml2LT5pb19iYXNlICsgX1JFRyhWSVVfT1NEMV9DVFJMX1NUQVQpKTsKKwkJd3JpdGVsX2Jp
dHNfcmVsYXhlZCgzIDw8IDgsIDAsCisJCQkJICAgIHByaXYtPmlvX2Jhc2UgKyBfUkVHKE9TRDFf
QkxFTkRfU1JDX0NUUkwpKTsKIAllbHNlCiAJCXdyaXRlbF9iaXRzX3JlbGF4ZWQoVlBQX09TRDFf
UE9TVEJMRU5ELCAwLAogCQkJCSAgICBwcml2LT5pb19iYXNlICsgX1JFRyhWUFBfTUlTQykpOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZpdS5jIGIvZHJpdmVycy9n
cHUvZHJtL21lc29uL21lc29uX3ZpdS5jCmluZGV4IDQ2MmM3Y2IzZTFiZC4uNGIyYjMwMjRkMzcx
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdml1LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL21lc29uL21lc29uX3ZpdS5jCkBAIC00MDUsOCArNDA1LDcgQEAgdm9pZCBt
ZXNvbl92aXVfaW5pdChzdHJ1Y3QgbWVzb25fZHJtICpwcml2KQogCQkJCTAgPDwgMTYgfAogCQkJ
CTEsCiAJCQkJcHJpdi0+aW9fYmFzZSArIF9SRUcoVklVX09TRF9CTEVORF9DVFJMKSk7Ci0JCXdy
aXRlbF9yZWxheGVkKDMgPDwgOCB8Ci0JCQkJMSA8PCAyMCwKKwkJd3JpdGVsX3JlbGF4ZWQoMSA8
PCAyMCwKIAkJCQlwcml2LT5pb19iYXNlICsgX1JFRyhPU0QxX0JMRU5EX1NSQ19DVFJMKSk7CiAJ
CXdyaXRlbF9yZWxheGVkKDEgPDwgMjAsCiAJCQkJcHJpdi0+aW9fYmFzZSArIF9SRUcoT1NEMl9C
TEVORF9TUkNfQ1RSTCkpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
