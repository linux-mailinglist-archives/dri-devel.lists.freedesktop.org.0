Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830C281392
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:37:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9C56E2A0;
	Mon,  5 Aug 2019 07:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543B36E2A0
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 07:37:00 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id x1so33403617wrr.9
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 00:37:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w/QN60Vt0lSO4F5L9iLhj5zsDNU4tZT363SVZG/LB4s=;
 b=JahKIv8sHt8umtOgRXNDT7MFyRLQxUSooXGadpnOsq5jadqZCYPKr05byoy34Nh/Rj
 VonTsFTJswxmsgp/SMRG2cb08evyFumupAhGYeYYubxjLM/N6PxmJZtQhbVj2gjclkZW
 k/wXUlRTNWrmNEWwwJMmblk7hd+wRkzrpZxbyB7AssftZKEEbfp8xE78JgqJERgA3Coq
 bgO6YE22xs14lTgD90MeYtMqrMMe/5lCOU76cVzz6pOhOdM53+JD4EmdHQ76zz+RvoSf
 0+2MKOwJU0i9rsnERMKhCpHdVtedZaV1TmOUHp4/qHElzXkEiJV6abg4ZtJPh5JuRkMI
 xbxg==
X-Gm-Message-State: APjAAAUfNTnWmNL1ULB3rPvY1rZeK6KMgfsbD17VvCr9LODwpKbH1JmS
 3MDrs9Jr7Re6ZOpQvtkB00HszP4L
X-Google-Smtp-Source: APXvYqzEDl9zf8GvzpXNvK324pzioDrot6MrB4alj+RwSZroT/ELDlHabcQhYp6Ieu5I167pS92heg==
X-Received: by 2002:adf:ed8a:: with SMTP id c10mr166003096wro.33.1564990618732; 
 Mon, 05 Aug 2019 00:36:58 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c480:69a4:bac5:2292])
 by smtp.gmail.com with ESMTPSA id x129sm84681182wmg.44.2019.08.05.00.36.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 05 Aug 2019 00:36:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, david1.zhou@amd.com,
 lionel.g.landwerlin@intel.com
Subject: [PATCH] dma-buf: fix stack corruption in dma_fence_chain_release
Date: Mon,  5 Aug 2019 09:36:57 +0200
Message-Id: <20190805073657.1389-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w/QN60Vt0lSO4F5L9iLhj5zsDNU4tZT363SVZG/LB4s=;
 b=NoyNworJOQZFagRLZacc5NloO85T2ra+tLDbO4l2Z/Ip2An5pN/ky3mY+IWA8fC7Cq
 RQGfq3GI6zrYx2RukCB2M3MZVTIjziGK0Cy4voayrNRAVMUvYSOAvty9Mrv+EMU8iTdz
 nj9UWxK9IGHI+ktHF1+7wIQpoZFm21M+mfBtYZpskK0/gRA+dBf1i6HJrzRRQvL+r7aL
 Q1ahqa81sUbCJRdoBcRYHPo0jSgnbIf5/rQiQgb7s0JG4GFGcNEl6jeCs2fVg9exHZ6d
 FgLw7G1kiT4kRX3d1ivISrc9bzwdUAn9WhqO0IM7r1dkNh/nLEviHflVD2PbSASmswmJ
 XPOw==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgY2FuJ3QgZnJlZSB1cCB0aGUgY2hhaW4gdXNpbmcgcmVjdXJzaW9uIG9yIHdlIHJ1biBpbnRv
IGEgc3RhY2sgb3ZlcmZsb3cuCgpNYW51YWxseSBmcmVlIHVwIHRoZSBkYW5nbGluZyBjaGFpbiBu
b2RlcyB0byBhdm9pZCByZWN1cnNpb24uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9kbWEtYnVmL2RtYS1mZW5j
ZS1jaGFpbi5jIHwgMjQgKysrKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
MjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtZmVuY2UtY2hhaW4uYyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2UtY2hhaW4u
YwppbmRleCBiNTA4OWY2NGJlMmEuLjQ0YTc0MTY3N2QyNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9k
bWEtYnVmL2RtYS1mZW5jZS1jaGFpbi5jCisrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtZmVuY2Ut
Y2hhaW4uYwpAQCAtMTc4LDggKzE3OCwzMCBAQCBzdGF0aWMgYm9vbCBkbWFfZmVuY2VfY2hhaW5f
c2lnbmFsZWQoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpCiBzdGF0aWMgdm9pZCBkbWFfZmVuY2Vf
Y2hhaW5fcmVsZWFzZShzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkKIHsKIAlzdHJ1Y3QgZG1hX2Zl
bmNlX2NoYWluICpjaGFpbiA9IHRvX2RtYV9mZW5jZV9jaGFpbihmZW5jZSk7CisJc3RydWN0IGRt
YV9mZW5jZSAqcHJldjsKKworCS8qIE1hbnVhbGx5IHVubGluayB0aGUgY2hhaW4gYXMgbXVjaCBh
cyBwb3NzaWJsZSB0byBhdm9pZCByZWN1cnNpb24KKwkgKiBhbmQgcG90ZW50aWFsIHN0YWNrIG92
ZXJmbG93LgorCSAqLworCXdoaWxlICgocHJldiA9IHJjdV9kZXJlZmVyZW5jZV9wcm90ZWN0ZWQo
Y2hhaW4tPnByZXYsIHRydWUpKSkgeworCQlzdHJ1Y3QgZG1hX2ZlbmNlX2NoYWluICpwcmV2X2No
YWluOworCisJCWlmIChrcmVmX3JlYWQoJnByZXYtPnJlZmNvdW50KSA+IDEpCisJCSAgICAgICBi
cmVhazsKKworCQlwcmV2X2NoYWluID0gdG9fZG1hX2ZlbmNlX2NoYWluKHByZXYpOworCQlpZiAo
IXByZXZfY2hhaW4pCisJCQlicmVhazsKKworCQkvKiBObyBuZWVkIGZvciBhdG9taWMgb3BlcmF0
aW9ucyBzaW5jZSB3ZSBob2xkIHRoZSBsYXN0CisJCSAqIHJlZmVyZW5jZSB0byBwcmV2X2NoYWlu
LgorCQkgKi8KKwkJY2hhaW4tPnByZXYgPSBwcmV2X2NoYWluLT5wcmV2OworCQlSQ1VfSU5JVF9Q
T0lOVEVSKHByZXZfY2hhaW4tPnByZXYsIE5VTEwpOworCQlkbWFfZmVuY2VfcHV0KHByZXYpOwor
CX0KKwlkbWFfZmVuY2VfcHV0KHByZXYpOwogCi0JZG1hX2ZlbmNlX3B1dChyY3VfZGVyZWZlcmVu
Y2VfcHJvdGVjdGVkKGNoYWluLT5wcmV2LCB0cnVlKSk7CiAJZG1hX2ZlbmNlX3B1dChjaGFpbi0+
ZmVuY2UpOwogCWRtYV9mZW5jZV9mcmVlKGZlbmNlKTsKIH0KLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
