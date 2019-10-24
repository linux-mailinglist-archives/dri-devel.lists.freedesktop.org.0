Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D649E388F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 18:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E90046E4B1;
	Thu, 24 Oct 2019 16:45:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1353F6E48F
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 16:45:50 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id g7so3593547wmk.4
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 09:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=abbwhhQgie2zwXLpQrwNZHmhm1e7uRKQChzXAIX90vQ=;
 b=NLNE5LXGdXQnS4jvgVTTLp1NQLW2r/O2wNeuxiUwFa894tx2v+5QApvXW8W0Yu9sot
 ZLdM2rwbT/VU6PslfNlefem/5/6AQZWdd3B+L0bgLPz8kDthw38LSaTTHKe14gr48kqY
 /C2pKeF5BXF8RypJORrp1gLxMpKD0KgMYFf/SePpJOh5fzXbtODkIxKpNJ/IPR2Nf0nE
 8lT6uG0RqSvLrcJqhHZSLVsgQ4QTQVsu7e7QyAUL4WD0XU6cUkINzKWZ9Ik+Ub3VhfC/
 369jE2P9QolaEhDuzH+gXP1nbJ8wvXzSf6QuyBwiX+VawJTH0q5NV0iEIEQzS1pjEJMS
 OR1g==
X-Gm-Message-State: APjAAAWoMzBx/h5UZo3Z7IMJvEnt5FXGwyuWoaXRIpU+V+u/kQzlakWK
 VmaiDgyCBtLINtw3mWF1CVU=
X-Google-Smtp-Source: APXvYqyUl2sgcTdEBy3Cw6Tr4Ze4P/bih0rI3/DUlOgsQPO6w4YwxxA3/vexOLN5x8i03YWgfdTWng==
X-Received: by 2002:a1c:3284:: with SMTP id y126mr5960528wmy.164.1571935548519; 
 Thu, 24 Oct 2019 09:45:48 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id z15sm25195288wrr.19.2019.10.24.09.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 09:45:47 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 05/32] drm/tegra: dp: Probe link using existing parsing helpers
Date: Thu, 24 Oct 2019 18:45:07 +0200
Message-Id: <20191024164534.132764-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024164534.132764-1-thierry.reding@gmail.com>
References: <20191024164534.132764-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=abbwhhQgie2zwXLpQrwNZHmhm1e7uRKQChzXAIX90vQ=;
 b=vXoojypPny2wjvKL3hyDhbkqvgKFOT+etdOa+s8a8OplRP+/bn6EpScpzZFwTv6vLL
 OojQ16wXU91uAGGQCRFsWL4utnFkBtGbzQwdIQ2A4Hs/OsgcfR44G1BHZFnalxvUAvfz
 OYe1rrHHoPVeevntjR31NmsQFQBQbuSJg9YzgWFFGXaXWou2amSU7yYfIt0fXbPmewfA
 qzOVUKYKc2Xc7PSmOdF1zfzNSa96H6344poUNVSSu0FBoGGGZO6iOLdSB/5RBdIjAbKi
 6uagfSyySYjK3fuGlBICeDbpu16fMcyIne0Obl/2YE1j456yYWKaxgGIhpzrxg374S1P
 /rhw==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClVzZSBleGlzdGluZyBw
YXJzaW5nIGhlbHBlcnMgdG8gcHJvYmUgYSBEaXNwbGF5UG9ydCBsaW5rLgoKU2lnbmVkLW9mZi1i
eTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vdGVncmEvZHAuYyB8IDEzICsrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2RwLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHAuYwppbmRleCBlNzYwMmZjMzlhNGEu
LmY5MjM0ZjY2MDYyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RwLmMKQEAgLTQ3LDIxICs0NywyMCBAQCBzdGF0aWMg
dm9pZCBkcm1fZHBfbGlua19yZXNldChzdHJ1Y3QgZHJtX2RwX2xpbmsgKmxpbmspCiAgKi8KIGlu
dCBkcm1fZHBfbGlua19wcm9iZShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCBzdHJ1Y3QgZHJtX2Rw
X2xpbmsgKmxpbmspCiB7Ci0JdTggdmFsdWVzWzNdOworCXU4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQ
X1NJWkVdOwogCWludCBlcnI7CiAKIAlkcm1fZHBfbGlua19yZXNldChsaW5rKTsKIAotCWVyciA9
IGRybV9kcF9kcGNkX3JlYWQoYXV4LCBEUF9EUENEX1JFViwgdmFsdWVzLCBzaXplb2YodmFsdWVz
KSk7CisJZXJyID0gZHJtX2RwX2RwY2RfcmVhZChhdXgsIERQX0RQQ0RfUkVWLCBkcGNkLCBzaXpl
b2YoZHBjZCkpOwogCWlmIChlcnIgPCAwKQogCQlyZXR1cm4gZXJyOwogCi0JbGluay0+cmV2aXNp
b24gPSB2YWx1ZXNbMF07Ci0JbGluay0+bWF4X3JhdGUgPSBkcm1fZHBfYndfY29kZV90b19saW5r
X3JhdGUodmFsdWVzWzFdKTsKLQlsaW5rLT5tYXhfbGFuZXMgPSB2YWx1ZXNbMl0gJiBEUF9NQVhf
TEFORV9DT1VOVF9NQVNLOworCWxpbmstPnJldmlzaW9uID0gZHBjZFtEUF9EUENEX1JFVl07CisJ
bGluay0+bWF4X3JhdGUgPSBkcm1fZHBfbWF4X2xpbmtfcmF0ZShkcGNkKTsKKwlsaW5rLT5tYXhf
bGFuZXMgPSBkcm1fZHBfbWF4X2xhbmVfY291bnQoZHBjZCk7CiAKLQlpZiAodmFsdWVzWzJdICYg
RFBfRU5IQU5DRURfRlJBTUVfQ0FQKQotCQlsaW5rLT5jYXBzLmVuaGFuY2VkX2ZyYW1pbmcgPSB0
cnVlOworCWxpbmstPmNhcHMuZW5oYW5jZWRfZnJhbWluZyA9IGRybV9kcF9lbmhhbmNlZF9mcmFt
ZV9jYXAoZHBjZCk7CiAKIAlsaW5rLT5yYXRlID0gbGluay0+bWF4X3JhdGU7CiAJbGluay0+bGFu
ZXMgPSBsaW5rLT5tYXhfbGFuZXM7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
