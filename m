Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF661F9B9D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 17:10:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2A36E342;
	Mon, 15 Jun 2020 15:10:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4156E342
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 15:10:33 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l26so15002509wme.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 08:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x8EY5DrwIqYCISh22w/ZjbbsN1OT/NHPAQzEZAe1lHA=;
 b=OxtyBVrTV+qRGlT+fPFx7bRibi/txYJQipLHc/Mvz49GaQ3L0w6ta7OUeGAG1dS2Xc
 EbmgylBwj3z0BREKrK25CZFALyxz/nzBNZoRAKl+RVocHEfX17F2BTIvQg1OFuaLzB5w
 sV6zjjQinP65G9lITxNhbE6lMjx3kESlgtGW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=x8EY5DrwIqYCISh22w/ZjbbsN1OT/NHPAQzEZAe1lHA=;
 b=Wg5oC7hg70aw15CRiPaWt01H0seMFB3Lg4Ijby8MyYaAcf+0hBKrkHK7W9rozA5VVf
 kDe7/d6XS9t5ptaOlYKifRTgz+FkT2thAvyDEThzeOrK+0fuTkjsUCa8UGTN/D+/zE2l
 H8LT+s31Ic6DBrqV4AU7bcG7fImQXD7ulbWCW+TuZMYwUqwZ7+m18nWelQTD3OQ/l4/5
 lcoig26khiTnV1ptc040ollNcsJ+zGevo1GBfal6Y5NiXnFyiKebzVQfdGjL6FX2oshW
 qnM5pXvhMCyXz3Et/N9O0W5ah7M/JRfXfIBiRP02xsFmLKIqKWY6bdkmprLY+ZcJl5Kx
 BHTA==
X-Gm-Message-State: AOAM532WwBCbja/XssZimBDHj+hkCQE0NYFiryV4P4EwA3GsIabXqBgO
 aJHoXOLb5p9/CR6N+no38usscqbksbE=
X-Google-Smtp-Source: ABdhPJwjB3ZYz9R27zwG4SdPTcvEvD5BFuWKcak59WiEumHRIBCHUyZUT4AWRBT4ymjUKuMC0Hs2VQ==
X-Received: by 2002:a1c:3b43:: with SMTP id i64mr14109088wma.112.1592233832197; 
 Mon, 15 Jun 2020 08:10:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 50sm26874935wra.1.2020.06.15.08.10.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2020 08:10:31 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/shmem-helper: Fix obj->filp derefence
Date: Mon, 15 Jun 2020 17:10:26 +0200
Message-Id: <20200615151026.2339113-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBicm9rZSB0aGF0IGluIG15IHJlZmFjdG9yaW5nOgoKY29tbWl0IDdkMmNkNzJhOWFhM2RmMzYw
NGNhZmQxNjlhMmQ0YTUyNWFmYjY4Y2EKQXV0aG9yOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0
dGVyQGZmd2xsLmNoPgpEYXRlOiAgIEZyaSBNYXkgMjkgMTY6MDU6NDIgMjAyMCArMDIwMAoKICAg
IGRybS9zaG1lbS1oZWxwZXJzOiBTaW1wbGlmeSBkbWEtYnVmIGltcG9ydGluZwoKUmVwb3J0ZWQt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpGaXhlczogN2QyY2Q3
MmE5YWEzICgiZHJtL3NobWVtLWhlbHBlcnM6IFNpbXBsaWZ5IGRtYS1idWYgaW1wb3J0aW5nIikK
Q2M6IEJvcmlzIEJyZXppbGxvbiA8Ym9yaXMuYnJlemlsbG9uQGNvbGxhYm9yYS5jb20+CkNjOiBU
aG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IEdlcmQgSG9mZm1hbm4g
PGtyYXhlbEByZWRoYXQuY29tPgpDYzogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KQ2M6
IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgpTaWduZWQtb2ZmLWJ5OiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyB8IDIwICsrKysrKysrKysrLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3NobWVtX2hlbHBlci5jCmluZGV4IDBhN2UzYjY2NGJjMi4uM2U3ZWU0MDdhMTdjIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwpAQCAtNzAsMTUgKzcwLDE3IEBA
IF9fZHJtX2dlbV9zaG1lbV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc2l6ZV90IHNp
emUsIGJvb2wgcHJpdmF0ZSkKIAltdXRleF9pbml0KCZzaG1lbS0+dm1hcF9sb2NrKTsKIAlJTklU
X0xJU1RfSEVBRCgmc2htZW0tPm1hZHZfbGlzdCk7CiAKLQkvKgotCSAqIE91ciBidWZmZXJzIGFy
ZSBrZXB0IHBpbm5lZCwgc28gYWxsb2NhdGluZyB0aGVtCi0JICogZnJvbSB0aGUgTU9WQUJMRSB6
b25lIGlzIGEgcmVhbGx5IGJhZCBpZGVhLCBhbmQKLQkgKiBjb25mbGljdHMgd2l0aCBDTUEuIFNl
ZSBjb21tZW50cyBhYm92ZSBuZXdfaW5vZGUoKQotCSAqIHdoeSB0aGlzIGlzIHJlcXVpcmVkIF9h
bmRfIGV4cGVjdGVkIGlmIHlvdSdyZQotCSAqIGdvaW5nIHRvIHBpbiB0aGVzZSBwYWdlcy4KLQkg
Ki8KLQltYXBwaW5nX3NldF9nZnBfbWFzayhvYmotPmZpbHAtPmZfbWFwcGluZywgR0ZQX0hJR0hV
U0VSIHwKLQkJCSAgICAgX19HRlBfUkVUUllfTUFZRkFJTCB8IF9fR0ZQX05PV0FSTik7CisJaWYg
KCFwcml2YXRlKSB7CisJCS8qCisJCSAqIE91ciBidWZmZXJzIGFyZSBrZXB0IHBpbm5lZCwgc28g
YWxsb2NhdGluZyB0aGVtCisJCSAqIGZyb20gdGhlIE1PVkFCTEUgem9uZSBpcyBhIHJlYWxseSBi
YWQgaWRlYSwgYW5kCisJCSAqIGNvbmZsaWN0cyB3aXRoIENNQS4gU2VlIGNvbW1lbnRzIGFib3Zl
IG5ld19pbm9kZSgpCisJCSAqIHdoeSB0aGlzIGlzIHJlcXVpcmVkIF9hbmRfIGV4cGVjdGVkIGlm
IHlvdSdyZQorCQkgKiBnb2luZyB0byBwaW4gdGhlc2UgcGFnZXMuCisJCSAqLworCQltYXBwaW5n
X3NldF9nZnBfbWFzayhvYmotPmZpbHAtPmZfbWFwcGluZywgR0ZQX0hJR0hVU0VSIHwKKwkJCQkg
ICAgIF9fR0ZQX1JFVFJZX01BWUZBSUwgfCBfX0dGUF9OT1dBUk4pOworCX0KIAogCXJldHVybiBz
aG1lbTsKIAotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
