Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB561DF79B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 23:46:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFE46E277;
	Mon, 21 Oct 2019 21:46:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 300076E277
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 21:45:58 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id g81so12402661oib.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 14:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TsrtW/3IwxExUlY3NAEem6qIu9cq5ThxwAPMPnLEB1M=;
 b=KbcvqwPovIyI+sJBE3BeF7+xLfC1MV+hOpmlDAQuKHvSN/AnxtXzqq6x5BybGztEud
 j1m+ksI6gjEgwwP+S23aqMZpBsd94aEv0wvwBRps8uD753iZW2RaHc0+DP+jc2nB/Viv
 TfGx75LLeC2prlWqv0u0WzHItAmslmJwWoL9Z4PdFpBLwnUrn0MgYnQ4P12hcmPMBeZx
 i1aNfm5P7T9WjSxW8MeU55RD5Zx4v8lFAKN1PQWeylnbAO0duiw7ThXRRIEmmt8/LGON
 ROw/Z3LPLOYKeGc6MO9OuhLrGMCuf13oEYUjaylwvr7xotrj6A8YpNiPRL3vHnQR9fbm
 SbQg==
X-Gm-Message-State: APjAAAX+As3CG9tG8WeG3fJM+rZ+T2CrbAPM7gpXN2qq87z9qSPokJO1
 k5A1e4m5mLnUWw1y5X/Cxl3rn4Y=
X-Google-Smtp-Source: APXvYqzlUvmVTKM2zNkWI5ewyGDS0Ga/AUXcXwnS+qOaifG3c/ZJADZnnQIk2JtuB+GHcDhGYasXJg==
X-Received: by 2002:a54:4182:: with SMTP id 2mr188880oiy.148.1571694357143;
 Mon, 21 Oct 2019 14:45:57 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id u130sm4122676oib.56.2019.10.21.14.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 14:45:56 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/6] drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
Date: Mon, 21 Oct 2019 16:45:46 -0500
Message-Id: <20191021214550.1461-3-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021214550.1461-1-robh@kernel.org>
References: <20191021214550.1461-1-robh@kernel.org>
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org, Philippe Cornu <philippe.cornu@st.com>,
 Vincent Abriou <vincent.abriou@st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW50cm9kdWNlIGEgbmV3IGZsYWcsIERSTV9NT0RFX0RVTUJfS0VSTkVMX01BUCwgZm9yIHN0cnVj
dApkcm1fbW9kZV9jcmVhdGVfZHVtYi4gVGhpcyBmbGFnIGlzIGZvciBpbnRlcm5hbCBrZXJuZWwg
dXNlIHRvIGluZGljYXRlCmlmIGR1bWIgYnVmZmVyIGFsbG9jYXRpb24gbmVlZHMgYSBrZXJuZWwg
bWFwcGluZy4gVGhpcyBpcyBuZWVkZWQgb25seSBmb3IKQ01BIHdoZXJlIGNyZWF0aW5nIGEga2Vy
bmVsIG1hcHBpbmcgb3Igbm90IGhhcyB0byBiZSBkZWNpZGVkIGF0IGFsbG9jYXRpb24KdGltZSBi
ZWNhdXNlIGNyZWF0aW5nIGEgbWFwcGluZyBvbiBkZW1hbmQgKHdpdGggdm1hcCgpKSBpcyBub3Qg
Z3VhcmFudGVlZAp0byB3b3JrLiBTZXZlcmFsIGRyaXZlcnMgYXJlIHVzaW5nIENNQSwgYnV0IG5v
dCB0aGUgQ01BIGhlbHBlcnMgYmVjYXVzZQp0aGV5IGRpc3Rpbmd1aXNoIGJldHdlZW4ga2VybmVs
IGFuZCB1c2Vyc3BhY2UgYWxsb2NhdGlvbnMgdG8gY3JlYXRlIGEKa2VybmVsIG1hcHBpbmcgb3Ig
bm90LgoKVXBkYXRlIHRoZSBjYWxsZXJzIG9mIGRybV9tb2RlX2R1bWJfY3JlYXRlKCkgdG8gc2V0
CmRybV9tb2RlX2R1bWJfY3JlYXRlLmZsYWdzIHRvIGFwcHJvcHJpYXRlIGRlZmF1bHRzLiBDdXJy
ZW50bHksIGZsYWdzIGNhbgpiZSBzZXQgdG8gYW55dGhpbmcgYnkgdXNlcnNwYWNlLCBidXQgaXMg
dW51c2VkIHdpdGhpbiB0aGUga2VybmVsLiBMZXQncwpmb3JjZSBmbGFncyB0byB6ZXJvIChubyBr
ZXJuZWwgbWFwcGluZykgZm9yIHVzZXJzcGFjZSBjYWxsZXJzIGJ5IGRlZmF1bHQuCkZvciBpbiBr
ZXJuZWwgY2xpZW50cywgc2V0IERSTV9NT0RFX0RVTUJfS0VSTkVMX01BUCBieSBkZWZhdWx0LiBE
cml2ZXJzCmNhbiBvdmVycmlkZSB0aGlzIGFzIG5lZWRlZC4KCkNjOiBEYXZpZCBBaXJsaWUgPGFp
cmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBN
YWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgpDYzog
TWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBv
b3JseS5ydW4+ClNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnQuYyAgICAgICB8IDEgKwogZHJpdmVycy9ncHUv
ZHJtL2RybV9kdW1iX2J1ZmZlcnMuYyB8IDUgKysrKy0KIGluY2x1ZGUvdWFwaS9kcm0vZHJtX21v
ZGUuaCAgICAgICAgfCAyICsrCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50LmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jCmluZGV4IGQ5YTJlMzY5NTUyNS4uZGJmYzgwNjFi
MzkyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudC5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fY2xpZW50LmMKQEAgLTI2NCw2ICsyNjQsNyBAQCBkcm1fY2xpZW50X2J1
ZmZlcl9jcmVhdGUoc3RydWN0IGRybV9jbGllbnRfZGV2ICpjbGllbnQsIHUzMiB3aWR0aCwgdTMy
IGhlaWdodCwgdQogCWR1bWJfYXJncy53aWR0aCA9IHdpZHRoOwogCWR1bWJfYXJncy5oZWlnaHQg
PSBoZWlnaHQ7CiAJZHVtYl9hcmdzLmJwcCA9IGluZm8tPmNwcFswXSAqIDg7CisJZHVtYl9hcmdz
LmZsYWdzID0gRFJNX01PREVfRFVNQl9LRVJORUxfTUFQOwogCXJldCA9IGRybV9tb2RlX2NyZWF0
ZV9kdW1iKGRldiwgJmR1bWJfYXJncywgY2xpZW50LT5maWxlKTsKIAlpZiAocmV0KQogCQlnb3Rv
IGVycl9kZWxldGU7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2R1bWJfYnVmZmVy
cy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1ZmZlcnMuYwppbmRleCBkMThhNzQwZmUw
ZjEuLjc0YTEzZjE0YzE3MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kdW1iX2J1
ZmZlcnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2R1bWJfYnVmZmVycy5jCkBAIC05Nyw3
ICs5NywxMCBAQCBpbnQgZHJtX21vZGVfY3JlYXRlX2R1bWIoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwKIGludCBkcm1fbW9kZV9jcmVhdGVfZHVtYl9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAogCQkJICAgICAgIHZvaWQgKmRhdGEsIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2KQogewot
CXJldHVybiBkcm1fbW9kZV9jcmVhdGVfZHVtYihkZXYsIGRhdGEsIGZpbGVfcHJpdik7CisJc3Ry
dWN0IGRybV9tb2RlX2NyZWF0ZV9kdW1iICphcmdzID0gZGF0YTsKKworCWFyZ3MtPmZsYWdzID0g
MDsKKwlyZXR1cm4gZHJtX21vZGVfY3JlYXRlX2R1bWIoZGV2LCBhcmdzLCBmaWxlX3ByaXYpOwog
fQogCiAvKioKZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCBiL2luY2x1
ZGUvdWFwaS9kcm0vZHJtX21vZGUuaAppbmRleCA3MzVjOGNmZGFhYTEuLjAyNzEyZjQ2Yjk0YyAx
MDA2NDQKLS0tIGEvaW5jbHVkZS91YXBpL2RybS9kcm1fbW9kZS5oCisrKyBiL2luY2x1ZGUvdWFw
aS9kcm0vZHJtX21vZGUuaApAQCAtNzk2LDYgKzc5Niw4IEBAIHN0cnVjdCBkcm1fbW9kZV9jcnRj
X3BhZ2VfZmxpcF90YXJnZXQgewogCV9fdTY0IHVzZXJfZGF0YTsKIH07CiAKKyNkZWZpbmUgRFJN
X01PREVfRFVNQl9LRVJORUxfTUFQCSgxPDwwKQkvKiBGb3IgaW50ZXJuYWwga2VybmVsIHVzZSAq
LworCiAvKiBjcmVhdGUgYSBkdW1iIHNjYW5vdXQgYnVmZmVyICovCiBzdHJ1Y3QgZHJtX21vZGVf
Y3JlYXRlX2R1bWIgewogCV9fdTMyIGhlaWdodDsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
