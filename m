Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEE8CB557
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 09:40:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C1C6EAE1;
	Fri,  4 Oct 2019 07:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4130089CB2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 20:25:01 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id q1so8685888ion.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2019 13:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h3XwYxtYv4u2VULB5wvau7aH9hnk7qDjisfwQ8sIR5E=;
 b=cDwKhFLIx6OAKVmcn5HsP5pTq5lvXhm4D17BmBXu0f61G2lRZsnf3AqKBpU2VZ2QWW
 PqXqNf6VtYLOfTNihiOS0YUDSkvNkfqYWk/RLcet18yvdLABh3Vbkm+EwE4fv0RzZInO
 K8gNMCmtINwkppKphL/9/fiaRFflLoYevoN0KkFwUGimU5WhTSD5i29O86WIL2QcriDL
 GqvhlYFnkzS0S/QNFOvOvYfENAgFgaAsq+FmG4NM4K4l0pNCY/BL73EgZyJ6u/sWhT91
 RbkoJXSHxDPdPpQKAybjvG+4r/UmfZhYk4e8A0dvMqvxmwWdmQs+r941Tq9lRFcMS626
 H1Fw==
X-Gm-Message-State: APjAAAVKFWOMub+DUtS92n1VH49XZYEOajp9Wp73kaQlzuiPOadEZt0D
 KCKMnPERXyg1qna5C0vuFXkd5Q==
X-Google-Smtp-Source: APXvYqy1RUsllzXjE6tWBFhX9aZH9FfJHLIuYdqCi4+7xWP+iF2L6HHoUUbG/VbVrQ+S2JS9O2IYPg==
X-Received: by 2002:a02:7009:: with SMTP id f9mr11116753jac.81.1570134300572; 
 Thu, 03 Oct 2019 13:25:00 -0700 (PDT)
Received: from localhost ([2620:15c:183:0:82e0:aef8:11bc:24c4])
 by smtp.gmail.com with ESMTPSA id u124sm1407859ioe.63.2019.10.03.13.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2019 13:24:59 -0700 (PDT)
From: Raul E Rangel <rrangel@chromium.org>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH v3] drm/amd/display: fix struct init in update_bounding_box
Date: Thu,  3 Oct 2019 14:24:44 -0600
Message-Id: <20191003142423.v3.1.I5c52c59b731fe266252588ab2b32c0e3d4d808f1@changeid>
X-Mailer: git-send-email 2.23.0.444.g18eeb5a265-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Oct 2019 07:38:50 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h3XwYxtYv4u2VULB5wvau7aH9hnk7qDjisfwQ8sIR5E=;
 b=TUR8ASlw5kv/DytT8vmytYwx7NgMRTSkXxwMls+ZHrUgtvJKK0/pQxhmPQ0it+ePNl
 wq2EyWN6itrpDWeG2mPioyEPKViwPoAPYfktvbEkKdpH3bU8mhYNwSqopyPxycNhDb34
 YBxiCVINfBpqPJKmV5tvLDAOtGzX3NPGH5s14=
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
Cc: Charlene Liu <charlene.liu@amd.com>, Leo Li <sunpeng.li@amd.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nikola Cornij <nikola.cornij@amd.com>,
 Raul E Rangel <rrangel@chromium.org>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Jun Lei <Jun.Lei@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGNuMjBfcmVzb3VyY2UuYzoyNjM2Ojk6IGVycm9yOiBtaXNzaW5nIGJyYWNlcyBhcm91bmQgaW5p
dGlhbGl6ZXIgWy1XZXJyb3I9bWlzc2luZy1icmFjZXNdCiAgc3RydWN0IF92Y3NfZHBpX3ZvbHRh
Z2Vfc2NhbGluZ19zdCBjYWxjdWxhdGVkX3N0YXRlc1tNQVhfQ0xPQ0tfTElNSVRfU1RBVEVTXSA9
IHswfTsKICAgICAgICAgXgoKRml4ZXM6IDdlZDRlNjM1MmMxNmYgKCJkcm0vYW1kL2Rpc3BsYXk6
IEFkZCBEQ04yIEhXIFNlcXVlbmNlciBhbmQgUmVzb3VyY2UiKQoKU2lnbmVkLW9mZi1ieTogUmF1
bCBFIFJhbmdlbCA8cnJhbmdlbEBjaHJvbWl1bS5vcmc+CgotLS0KCkNoYW5nZXMgaW4gdjM6Ci0g
VXNlIG1lbXNldAoKQ2hhbmdlcyBpbiB2MjoKLSBVc2Uge3swfX0gaW5zdGVhZCBvZiB7fQoKIGRy
aXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9yZXNvdXJjZS5jIHwgNCAr
KystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX3Jlc291
cmNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3Vy
Y2UuYwppbmRleCBiOTQ5ZTIwMmQ2Y2I3Li5mNzJjMjZhZTQxZGVmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfcmVzb3VyY2UuYwpAQCAt
MjYzMyw3ICsyNjMzLDcgQEAgc3RhdGljIHZvaWQgY2FwX3NvY19jbG9ja3MoCiBzdGF0aWMgdm9p
ZCB1cGRhdGVfYm91bmRpbmdfYm94KHN0cnVjdCBkYyAqZGMsIHN0cnVjdCBfdmNzX2RwaV9zb2Nf
Ym91bmRpbmdfYm94X3N0ICpiYiwKIAkJc3RydWN0IHBwX3NtdV9udl9jbG9ja190YWJsZSAqbWF4
X2Nsb2NrcywgdW5zaWduZWQgaW50ICp1Y2xrX3N0YXRlcywgdW5zaWduZWQgaW50IG51bV9zdGF0
ZXMpCiB7Ci0Jc3RydWN0IF92Y3NfZHBpX3ZvbHRhZ2Vfc2NhbGluZ19zdCBjYWxjdWxhdGVkX3N0
YXRlc1tNQVhfQ0xPQ0tfTElNSVRfU1RBVEVTXSA9IHswfTsKKwlzdHJ1Y3QgX3Zjc19kcGlfdm9s
dGFnZV9zY2FsaW5nX3N0IGNhbGN1bGF0ZWRfc3RhdGVzW01BWF9DTE9DS19MSU1JVF9TVEFURVNd
OwogCWludCBpOwogCWludCBudW1fY2FsY3VsYXRlZF9zdGF0ZXMgPSAwOwogCWludCBtaW5fZGNm
Y2xrID0gMDsKQEAgLTI2NDEsNiArMjY0MSw4IEBAIHN0YXRpYyB2b2lkIHVwZGF0ZV9ib3VuZGlu
Z19ib3goc3RydWN0IGRjICpkYywgc3RydWN0IF92Y3NfZHBpX3NvY19ib3VuZGluZ19ib3hfCiAJ
aWYgKG51bV9zdGF0ZXMgPT0gMCkKIAkJcmV0dXJuOwogCisJbWVtc2V0KGNhbGN1bGF0ZWRfc3Rh
dGVzLCAwLCBzaXplb2YoY2FsY3VsYXRlZF9zdGF0ZXMpKTsKKwogCWlmIChkYy0+YmJfb3ZlcnJp
ZGVzLm1pbl9kY2ZjbGtfbWh6ID4gMCkKIAkJbWluX2RjZmNsayA9IGRjLT5iYl9vdmVycmlkZXMu
bWluX2RjZmNsa19taHo7CiAJZWxzZQotLSAKMi4yMy4wLjQ0NC5nMThlZWI1YTI2NS1nb29nCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
