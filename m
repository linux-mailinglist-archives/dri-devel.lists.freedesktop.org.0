Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24EED3358C
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2019 18:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F8A689024;
	Mon,  3 Jun 2019 16:56:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E39892B9;
 Mon,  3 Jun 2019 16:56:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: koike) with ESMTPSA id A58E1284CE3
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org,
	nicholas.kazlauskas@amd.com
Subject: [PATCH v4 3/5] drm/msm: fix fb references in async update
Date: Mon,  3 Jun 2019 13:56:08 -0300
Message-Id: <20190603165610.24614-4-helen.koike@collabora.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190603165610.24614-1-helen.koike@collabora.com>
References: <20190603165610.24614-1-helen.koike@collabora.com>
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
Cc: Sean Paul <seanpaul@google.com>, David Airlie <airlied@linux.ie>,
 daniel.vetter@ffwll.ch, kernel@collabora.com,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
 Helen Koike <helen.koike@collabora.com>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@google.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Tomasz Figa <tfiga@chromium.org>, boris.brezillon@collabora.com,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QXN5bmMgdXBkYXRlIGNhbGxiYWNrcyBhcmUgZXhwZWN0ZWQgdG8gc2V0IHRoZSBvbGRfZmIgaW4g
dGhlIG5ld19zdGF0ZQpzbyBwcmVwYXJlL2NsZWFudXAgZnJhbWVidWZmZXJzIGFyZSBiYWxhbmNl
ZC4KCkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4gIyB2NC4xNCsKRml4ZXM6IDIyNGE0Yzk3
MDk4NyAoImRybS9tc206IHVwZGF0ZSBjdXJzb3JzIGFzeW5jaHJvbm91c2x5IHRocm91Z2ggYXRv
bWljIikKU3VnZ2VzdGVkLWJ5OiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBjb2xs
YWJvcmEuY29tPgpTaWduZWQtb2ZmLWJ5OiBIZWxlbiBLb2lrZSA8aGVsZW4ua29pa2VAY29sbGFi
b3JhLmNvbT4KQWNrZWQtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KCi0tLQpI
ZWxsbywKClRoaXMgd2FzIHRlc3RlZCBvbiB0aGUgZHJhZ29uYm9hcmQgNDEwYyB1c2luZyBpZ3Qg
cGxhbmVfY3Vyc29yX2xlZ2FjeSBhbmQKa21zX2N1cnNvcl9sZWdhY3kgYW5kIEkgZGlkbid0IHNl
ZSBhbnkgcmVncmVzc2lvbnMuCgpDaGFuZ2VzIGluIHY0OgotIGFkZCBhY2tlZCBieSB0YWcKCkNo
YW5nZXMgaW4gdjM6IE5vbmUKQ2hhbmdlcyBpbiB2MjoKLSB1cGRhdGUgQ0Mgc3RhYmxlIGFuZCBG
aXhlcyB0YWcKCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X3BsYW5lLmMgfCA0
ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvbWRwNS9tZHA1X3BsYW5lLmMKaW5kZXggOWQ5ZmI2YzVmZDY4Li4xMTA1YzI0MzNm
MTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfcGxhbmUu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X3BsYW5lLmMKQEAgLTUw
Miw2ICs1MDIsOCBAQCBzdGF0aWMgaW50IG1kcDVfcGxhbmVfYXRvbWljX2FzeW5jX2NoZWNrKHN0
cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogc3RhdGljIHZvaWQgbWRwNV9wbGFuZV9hdG9taWNfYXN5
bmNfdXBkYXRlKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLAogCQkJCQkgICBzdHJ1Y3QgZHJtX3Bs
YW5lX3N0YXRlICpuZXdfc3RhdGUpCiB7CisJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqb2xkX2Zi
ID0gcGxhbmUtPnN0YXRlLT5mYjsKKwogCXBsYW5lLT5zdGF0ZS0+c3JjX3ggPSBuZXdfc3RhdGUt
PnNyY194OwogCXBsYW5lLT5zdGF0ZS0+c3JjX3kgPSBuZXdfc3RhdGUtPnNyY195OwogCXBsYW5l
LT5zdGF0ZS0+Y3J0Y194ID0gbmV3X3N0YXRlLT5jcnRjX3g7CkBAIC01MjQsNiArNTI2LDggQEAg
c3RhdGljIHZvaWQgbWRwNV9wbGFuZV9hdG9taWNfYXN5bmNfdXBkYXRlKHN0cnVjdCBkcm1fcGxh
bmUgKnBsYW5lLAogCiAJKnRvX21kcDVfcGxhbmVfc3RhdGUocGxhbmUtPnN0YXRlKSA9CiAJCSp0
b19tZHA1X3BsYW5lX3N0YXRlKG5ld19zdGF0ZSk7CisKKwluZXdfc3RhdGUtPmZiID0gb2xkX2Zi
OwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9wbGFuZV9oZWxwZXJfZnVuY3MgbWRwNV9w
bGFuZV9oZWxwZXJfZnVuY3MgPSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
