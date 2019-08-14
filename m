Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA03F8DD64
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 20:48:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D5A16E802;
	Wed, 14 Aug 2019 18:47:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDD606E7F1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 18:47:41 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id 4so44065075pld.10
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 11:47:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=LsxdKXlIE7uZ+/6eqxu7c+cok0i20/tbrH/8RDl0m7Y=;
 b=h1dXDm1RZBVJr2Po4q9eAD82AOmiRhrMZmif2Stbdu5rjT8MQgveBmSvK76+0W9uCB
 zqJ6kAtL8ootH1cuY1bpggx4xk7p17xBztutAInsa25gYq2QnETzlF5k0uu0NxiGzaHs
 RwmSKPKWOWc3X0NGeZ1Q6AA6ZrerPMqUETgEwFhtd1hCu4Oz8+rJyNGmcUCxd9DkEt57
 vQwauC552Cb5mSkNZ0gcz3lG4UT1j/GNWQNc+tpldo7bruVwgtbv9AjhtAPCHNE9H3mS
 Fw8WuhE2nz3pSIqxzbt7o4RC8ywHM9oLhfktQ8n9Lylfju+m0qYWkeVFJPpWZzzpwgLL
 wY4A==
X-Gm-Message-State: APjAAAWXNfRXOx40chRg0Pi4BptKPX1O750xTvIvjOgsCe3RjagFnPYP
 JKsxBwmswsMJrA1gNcF6O/ljoA==
X-Google-Smtp-Source: APXvYqymhPQykXI8DyJnBWC3/2rfVnNZjSgYqV5xd4FwvmcqNtbeI6JIWHdpBIWAZKL/sL2ccjFXXA==
X-Received: by 2002:a17:902:2f24:: with SMTP id
 s33mr734052plb.314.1565808461082; 
 Wed, 14 Aug 2019 11:47:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y16sm610855pfc.36.2019.08.14.11.47.39
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 11:47:40 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [RESEND][PATCH v3 22/26] drm: kirin: Fix dev->driver_data setting
Date: Wed, 14 Aug 2019 18:46:58 +0000
Message-Id: <20190814184702.54275-23-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190814184702.54275-1-john.stultz@linaro.org>
References: <20190814184702.54275-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=LsxdKXlIE7uZ+/6eqxu7c+cok0i20/tbrH/8RDl0m7Y=;
 b=phHUUaiCNqUXb2OQDy2PL5HiT4EhT3jgLrPghrja3apIV/sP47ECUK+syGDP5dxS4A
 u+j4PGs/2h04W3SConQAkYMRWPkN+ePriNra7FScCzMkt73oDq1S0URnJY56t67cEP8L
 6Kde0bxm6ML74X5v2uYA4015JBOAg83kGePtdvjL3cba7JLAtSvNzHe++HBCOCCTGQ7M
 SdC5xiGI5kyWlBMRbN+p0GHUTH0QG9Kgu13fRBviu4FHdV9f6YQcgZcIwfyqaPamriYd
 cEKPVXU80fB+TBz/Yiz15pMIdJJF1l+oRZmcJ68sbU8zBUbcVVaqT7RShmx2KXd9TI3D
 cE3w==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggY2hhbmdlcyB0aGUKZGV2LT5kcml2ZXJfZGF0YSB0
byBwb2ludCB0byBhIGRybV9kZXZpY2UsIG5vdCBhZGVfZGF0YS4KClRodXMgd2Ugc2V0IHRoZSBk
cml2ZXIgZGF0YSB0byBkcm0gZGV2aWNlIGFmdGVyIGFsbG9jLgoKQ2M6IFJvbmdyb25nIFpvdSA8
em91cm9uZ3JvbmdAZ21haWwuY29tPgpDYzogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhp
c2lsaWNvbi5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClJl
dmlld2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClNpZ25lZC1vZmYtYnk6
IFh1IFlpUGluZyA8eHV5aXBpbmdAaGlzaWxpY29uLmNvbT4KW2pzdHVsdHo6IFJld29yZGVkIGNv
bW1pdCBtZXNzYWdlXQpTaWduZWQtb2ZmLWJ5OiBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpAbGlu
YXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9h
ZGUuYyB8IDEgLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2
LmMgfCAzICstLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2Ry
bV9hZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5j
CmluZGV4IDBiZGNhYzk4MWQ4Yi4uMDlkYzJjMDc1MzNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYwpAQCAtOTk4LDcgKzk5OCw2IEBAIHN0
YXRpYyBpbnQgYWRlX2RybV9pbml0KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJCURS
TV9FUlJPUigiZmFpbGVkIHRvIGFsbG9jIGFkZV9kYXRhXG4iKTsKIAkJcmV0dXJuIC1FTk9NRU07
CiAJfQotCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGFkZSk7CiAKIAljdHggPSBhZGVfaHdf
Y3R4X2FsbG9jKHBkZXYsICZhZGUtPmNydGMuYmFzZSk7CiAJaWYgKElTX0VSUihjdHgpKSB7CmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYu
YyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5jCmluZGV4
IDFjOTY1OGU5NTY1ZS4uZjE4NTNiODRhYjU4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
aGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaGlz
aWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYwpAQCAtNDMsOCArNDMsNiBAQCBzdGF0aWMgaW50
IGtpcmluX2RybV9rbXNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogewogCWludCByZXQ7
CiAKLQlkZXZfc2V0X2RydmRhdGEoZGV2LT5kZXYsIGRldik7Ci0KIAkvKiBkZXYtPm1vZGVfY29u
ZmlnIGluaXRpYWxpemF0aW9uICovCiAJZHJtX21vZGVfY29uZmlnX2luaXQoZGV2KTsKIAlkZXYt
Pm1vZGVfY29uZmlnLm1pbl93aWR0aCA9IDA7CkBAIC0xMzksNiArMTM3LDcgQEAgc3RhdGljIGlu
dCBraXJpbl9kcm1fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJZHJtX2RldiA9IGRybV9kZXZf
YWxsb2MoZHJpdmVyX2RhdGEtPmRyaXZlciwgZGV2KTsKIAlpZiAoSVNfRVJSKGRybV9kZXYpKQog
CQlyZXR1cm4gUFRSX0VSUihkcm1fZGV2KTsKKwlkZXZfc2V0X2RydmRhdGEoZGV2LCBkcm1fZGV2
KTsKIAogCXJldCA9IGtpcmluX2RybV9rbXNfaW5pdChkcm1fZGV2KTsKIAlpZiAocmV0KQotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
