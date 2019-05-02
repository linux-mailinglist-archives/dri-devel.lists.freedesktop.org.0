Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DE7122DA
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 21:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397BC89819;
	Thu,  2 May 2019 19:50:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 267EF89819
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 19:50:39 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id a26so1741786qtp.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 May 2019 12:50:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IADIU/EJ9FI/G06p19V/c4J8lEcHwqipgCGxkBiLylg=;
 b=eKJtNvxshEgwP9ArMH+fV6zhzjv+Y0DtnaA9DxaUkesXJXjf/Pw9vH6u9Qs2ek7JTM
 P7nsbdDub40EKtlORKx7sQHm5zRjkp5ScZ/f8F9fExizSF90ZRLkXv8hneNKXgfHIVku
 OKZXdv0xE36Ay/bj7flGLfh+WL6/WRE6MxKHgATwBPYZnlmRBCyndZRSyWbV0OXMUvUE
 ll4qZ3tX97p34F7e84jyTupuAuxVBUjQPNtx1j8pZUfFy3MpzIM85Z9MGGhf507zItxw
 p8e7dZWAUwYuZQ7Re72e4n8ttZZgfTkQy2a1BYE/2tjy5BQDRX8kURdAKebp/CYOYktQ
 qRtA==
X-Gm-Message-State: APjAAAWC+Q7W1UtVbyJVuHKML2jKEn7oBNUu2oL/bam1fcfNaloAwr2X
 GlR/QW5arI3Pw3gbFSvTEuY5u23q0tU=
X-Google-Smtp-Source: APXvYqxoEjvDEwkFiRYlf8cfhBENPjVWtZtE47VplWYS6ASODl3pXsDRHDYt5Doku3c45vfLjiwn3g==
X-Received: by 2002:ac8:3166:: with SMTP id h35mr4853635qtb.268.1556826637769; 
 Thu, 02 May 2019 12:50:37 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id k36sm34366qtc.52.2019.05.02.12.50.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 May 2019 12:50:37 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 10/10] drm/rockchip: Use drm_atomic_helper_commit_tail_rpm
Date: Thu,  2 May 2019 15:49:52 -0400
Message-Id: <20190502194956.218441-11-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190502194956.218441-1-sean@poorly.run>
References: <20190502194956.218441-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IADIU/EJ9FI/G06p19V/c4J8lEcHwqipgCGxkBiLylg=;
 b=Ix+JXVfo5ioRlNyP7UOsKwtCE1OZDBhyykPeRvW+abKdoCm2K5Iwhtt9QaXnM5CyQT
 QFEfeE1IT/KketqZA5YmdbDSrdGnTEUv2hi+OaOgcE3WEG+scLnzz/ecldOczc8PblKe
 w7t7g/f+LUB23NhiJqV/Amje431fC0KPD9WcMUVbNEwBA38DsWzYUpXxpNdRvbVnzuS6
 RULSnXewuPeKU00sikjI+d2D1Cmc+ZpvMfPDTcg54RpVtubQsm7pvWnTiOYhTRig4Sod
 0yy24k5oVH7rnk8M4EnOgcCx+k/lrqn5jGBDkzYlVas4d8kBKOK0DSjkrRHQddd8i0l5
 zCFg==
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
Cc: Zain Wang <wzz@rock-chips.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 linux-rockchip@lists.infradead.org, Sean Paul <seanpaul@chromium.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpOb3cgdGhhdCB3ZSB1c2Ug
dGhlIGRybSBwc3IgaGVscGVycywgd2Ugbm8gbG9uZ2VyIG5lZWQgdG8gaGFuZC1yb2xsIG91cgph
dG9taWNfY29tbWl0X3RhaWwgaW1wbGVtZW50YXRpb24uIFNvIHVzZSB0aGUgaGVscGVyCgpDaGFu
Z2VzIGluIHYyOgotIE5vbmUKQ2hhbmdlcyBpbiB2MzoKLSBOb25lCgpMaW5rIHRvIHYxOiBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAxOTAyMjgyMTA5Mzku
ODMzODYtNi1zZWFuQHBvb3JseS5ydW4KTGluayB0byB2MjogaHR0cHM6Ly9wYXRjaHdvcmsuZnJl
ZWRlc2t0b3Aub3JnL3BhdGNoL21zZ2lkLzIwMTkwMzI2MjA0NTA5Ljk2NTE1LTUtc2VhbkBwb29y
bHkucnVuCgpDYzogWmFpbiBXYW5nIDx3enpAcm9jay1jaGlwcy5jb20+CkNjOiBUb21hc3ogRmln
YSA8dGZpZ2FAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBTZWFuIFBhdWwgPHNlYW5wYXVs
QGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJt
X2ZiLmMgfCAyMSArLS0tLS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMjAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jv
Y2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tj
aGlwX2RybV9mYi5jCmluZGV4IDIxNDA2NGQ1OTllZS4uMWM2M2Q5ZTgzM2JjIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2ZiLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYi5jCkBAIC0xMTcsMjcgKzExNyw4IEBA
IHJvY2tjaGlwX3VzZXJfZmJfY3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCBk
cm1fZmlsZSAqZmlsZV9wcml2LAogCXJldHVybiBFUlJfUFRSKHJldCk7CiB9CiAKLXN0YXRpYyB2
b2lkCi1yb2NrY2hpcF9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsX3JwbShzdHJ1Y3QgZHJtX2F0
b21pY19zdGF0ZSAqb2xkX3N0YXRlKQotewotCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBvbGRf
c3RhdGUtPmRldjsKLQotCWRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9tb2Rlc2V0X2Rpc2FibGVz
KGRldiwgb2xkX3N0YXRlKTsKLQotCWRybV9hdG9taWNfaGVscGVyX2NvbW1pdF9tb2Rlc2V0X2Vu
YWJsZXMoZGV2LCBvbGRfc3RhdGUpOwotCi0JZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3BsYW5l
cyhkZXYsIG9sZF9zdGF0ZSwKLQkJCQkJRFJNX1BMQU5FX0NPTU1JVF9BQ1RJVkVfT05MWSk7Ci0K
LQlkcm1fYXRvbWljX2hlbHBlcl9jb21taXRfaHdfZG9uZShvbGRfc3RhdGUpOwotCi0JZHJtX2F0
b21pY19oZWxwZXJfd2FpdF9mb3JfdmJsYW5rcyhkZXYsIG9sZF9zdGF0ZSk7Ci0KLQlkcm1fYXRv
bWljX2hlbHBlcl9jbGVhbnVwX3BsYW5lcyhkZXYsIG9sZF9zdGF0ZSk7Ci19Ci0KIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2hlbHBlcl9mdW5jcyByb2NrY2hpcF9tb2RlX2Nv
bmZpZ19oZWxwZXJzID0gewotCS5hdG9taWNfY29tbWl0X3RhaWwgPSByb2NrY2hpcF9hdG9taWNf
aGVscGVyX2NvbW1pdF90YWlsX3JwbSwKKwkuYXRvbWljX2NvbW1pdF90YWlsID0gZHJtX2F0b21p
Y19oZWxwZXJfY29tbWl0X3RhaWxfcnBtLAogfTsKIAogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
bW9kZV9jb25maWdfZnVuY3Mgcm9ja2NoaXBfZHJtX21vZGVfY29uZmlnX2Z1bmNzID0gewotLSAK
U2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
