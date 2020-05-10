Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A981A1CD24A
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 09:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F8236E207;
	Mon, 11 May 2020 07:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29DD289FCC
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 16:55:53 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x17so7960431wrt.5
 for <dri-devel@lists.freedesktop.org>; Sun, 10 May 2020 09:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J2NZIexCjyou0gnqYIxLphqp5NvK6vqVAKw4e0qfsGY=;
 b=iGe+4boFyoyEwgcr1y1fulRfHhw6r8Ulz+Va19XbTLSKAXEQJY/VLrxeMxnXkekHgB
 pcFdEzlQC5SWySsC5piU84siiG2iBeGEz7zQQCszq4bE6p/+hn42Is2oNoJ5JrOwf1pu
 Xj0eYH2DDv6JABQd00ejfmGxJBCCXkB+3mchmx6J4YnWtWt6cm/d7Lhyi5DH3Yn3foHl
 cpKUvarDGiHQYzCTDFLFkPf4Ab0zVJjpjnjcnoysLFWLjcg8+LgJ+6zxNti88Mh65j0A
 QFCFeR9nL1AWmNiFjGdm6TJJ/pZQi0kdqkDWNbMaiytGy2G2yxo4MIrU/wrS6fbua3po
 B8Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J2NZIexCjyou0gnqYIxLphqp5NvK6vqVAKw4e0qfsGY=;
 b=haFJVgY017DQpxlA0KfyDSfrQt5YlG0gKdYuts9DWFo9bXS1QHnXPYKyyBJ7aM2JHH
 J8hQaFn5V8C1ctVMN2uDOKg3ssnAlLNJNpHx9YQQXpZHDwFYVYkr2rHlFlA5gpCZuBDC
 zIIiJs8SGHXsUyA1jEebKKqqazhsPUzvDU+4mQeRLzt6gHUHLZUaV1iHuR6SjdDp0kGh
 1YlTeF2X7ZHYvi7zCJneXKSShqzhNExqNSiWR2efIW2nfdo0hRbnwvgjL66OpYEka5kE
 dk4g5iK+i+LafQFKzsD8XUJ0Yq/cLCEY0ESWzNN5uaFwH1G8pGihhSs7+h6CcU8IABh3
 BrbA==
X-Gm-Message-State: AGi0PubejiZDnTiDo5zHnQMvGev6VrUj/B0QrOnM6XvHAbknKgEOd/eG
 bXVK4eLYZ3hngpJL+aWqpcU=
X-Google-Smtp-Source: APiQypKuHzFrSqsTFi5saBMKe2/BUEXB5RxULRmhIUQ8PWuoFXrEHmx2Phfsf7zofiPwkCYLAdGceA==
X-Received: by 2002:a5d:68cb:: with SMTP id p11mr13857358wrw.349.1589129751769; 
 Sun, 10 May 2020 09:55:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:1f1:d0f0:1cc8:b1f1:a2b8:a1ee])
 by smtp.gmail.com with ESMTPSA id
 g15sm13637670wrp.96.2020.05.10.09.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 May 2020 09:55:51 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH 09/15] drm/panfrost: dynamically alloc regulators
Date: Sun, 10 May 2020 18:55:32 +0200
Message-Id: <20200510165538.19720-10-peron.clem@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200510165538.19720-1-peron.clem@gmail.com>
References: <20200510165538.19720-1-peron.clem@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 May 2020 07:17:28 +0000
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugd2lsbCBsYXRlciBpbnRyb2R1Y2UgcmVndWxhdG9ycyBtYW5hZ2VkIGJ5IE9QUC4KCk9ubHkg
YWxsb2MgcmVndWxhdG9ycyB3aGVuIGl0J3MgbmVlZGVkLiBUaGlzIGFsc28gaGVscCB1c2UKdG8g
cmVsZWFzZSB0aGUgcmVndWxhdG9ycyBvbmx5IHdoZW4gdGhleSBhcmUgYWxsb2NhdGVkLgoKU2ln
bmVkLW9mZi1ieTogQ2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmMgfCAxNCArKysrKysrKyst
LS0tLQogZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oIHwgIDMgKy0t
CiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jIGIvZHJp
dmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5jCmluZGV4IGY0ODAxMjcyMDVk
Ni4uNjdlZWRmNjRlODJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFu
ZnJvc3RfZGV2aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rl
dmljZS5jCkBAIC05MCw5ICs5MCwxMSBAQCBzdGF0aWMgaW50IHBhbmZyb3N0X3JlZ3VsYXRvcl9p
bml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQogewogCWludCByZXQsIGk7CiAKLQlp
ZiAoV0FSTihwZmRldi0+Y29tcC0+bnVtX3N1cHBsaWVzID4gQVJSQVlfU0laRShwZmRldi0+cmVn
dWxhdG9ycyksCi0JCQkiVG9vIG1hbnkgc3VwcGxpZXMgaW4gY29tcGF0aWJsZSBzdHJ1Y3R1cmUu
XG4iKSkKLQkJcmV0dXJuIC1FSU5WQUw7CisJcGZkZXYtPnJlZ3VsYXRvcnMgPSBkZXZtX2tjYWxs
b2MocGZkZXYtPmRldiwgcGZkZXYtPmNvbXAtPm51bV9zdXBwbGllcywKKwkJCQkJIHNpemVvZigq
cGZkZXYtPnJlZ3VsYXRvcnMpLAorCQkJCQkgR0ZQX0tFUk5FTCk7CisJaWYgKCFwZmRldi0+cmVn
dWxhdG9ycykKKwkJcmV0dXJuIC1FTk9NRU07CiAKIAlmb3IgKGkgPSAwOyBpIDwgcGZkZXYtPmNv
bXAtPm51bV9zdXBwbGllczsgaSsrKQogCQlwZmRldi0+cmVndWxhdG9yc1tpXS5zdXBwbHkgPSBw
ZmRldi0+Y29tcC0+c3VwcGx5X25hbWVzW2ldOwpAQCAtMTE3LDggKzExOSwxMCBAQCBzdGF0aWMg
aW50IHBhbmZyb3N0X3JlZ3VsYXRvcl9pbml0KHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2
KQogCiBzdGF0aWMgdm9pZCBwYW5mcm9zdF9yZWd1bGF0b3JfZmluaShzdHJ1Y3QgcGFuZnJvc3Rf
ZGV2aWNlICpwZmRldikKIHsKLQlyZWd1bGF0b3JfYnVsa19kaXNhYmxlKHBmZGV2LT5jb21wLT5u
dW1fc3VwcGxpZXMsCi0JCQlwZmRldi0+cmVndWxhdG9ycyk7CisJaWYgKCFwZmRldi0+cmVndWxh
dG9ycykKKwkJcmV0dXJuOworCisJcmVndWxhdG9yX2J1bGtfZGlzYWJsZShwZmRldi0+Y29tcC0+
bnVtX3N1cHBsaWVzLCBwZmRldi0+cmVndWxhdG9ycyk7CiB9CiAKIHN0YXRpYyB2b2lkIHBhbmZy
b3N0X3BtX2RvbWFpbl9maW5pKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2KQpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2RldmljZS5oCmluZGV4IDJlZmE1OWM5ZDFjNS4u
OTUzZjc1MzZhNzczIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJv
c3RfZGV2aWNlLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2Rldmlj
ZS5oCkBAIC0yMiw3ICsyMiw2IEBAIHN0cnVjdCBwYW5mcm9zdF9qb2I7CiBzdHJ1Y3QgcGFuZnJv
c3RfcGVyZmNudDsKIAogI2RlZmluZSBOVU1fSk9CX1NMT1RTIDMKLSNkZWZpbmUgTUFYX1JFR1VM
QVRPUlMgMgogI2RlZmluZSBNQVhfUE1fRE9NQUlOUyAzCiAKIHN0cnVjdCBwYW5mcm9zdF9mZWF0
dXJlcyB7CkBAIC04MSw3ICs4MCw3IEBAIHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgewogCXZvaWQg
X19pb21lbSAqaW9tZW07CiAJc3RydWN0IGNsayAqY2xvY2s7CiAJc3RydWN0IGNsayAqYnVzX2Ns
b2NrOwotCXN0cnVjdCByZWd1bGF0b3JfYnVsa19kYXRhIHJlZ3VsYXRvcnNbTUFYX1JFR1VMQVRP
UlNdOworCXN0cnVjdCByZWd1bGF0b3JfYnVsa19kYXRhICpyZWd1bGF0b3JzOwogCXN0cnVjdCBy
ZXNldF9jb250cm9sICpyc3RjOwogCS8qIHBtX2RvbWFpbnMgZm9yIGRldmljZXMgd2l0aCBtb3Jl
IHRoYW4gb25lLiAqLwogCXN0cnVjdCBkZXZpY2UgKnBtX2RvbWFpbl9kZXZzW01BWF9QTV9ET01B
SU5TXTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
