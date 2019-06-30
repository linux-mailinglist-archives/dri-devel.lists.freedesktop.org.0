Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0625AFD1
	for <lists+dri-devel@lfdr.de>; Sun, 30 Jun 2019 14:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EF088F9A;
	Sun, 30 Jun 2019 12:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8120488F06;
 Sun, 30 Jun 2019 12:47:46 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id r6so8925876qkc.0;
 Sun, 30 Jun 2019 05:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t3NBRelcVNRRw+RFPngDYC9BWfE+P0zgYLat4rYCV1Q=;
 b=ThPKW2A2sC34wQOrFKWOFWPfMttKuHMr7WEMUfIu/UqwzLFhDjedMECmryjLGm0q/R
 A6aFfbk167SfIKYzLnSWfvI3InZgcaj2H2H9yqT48UjNNJbtWCOdu2qemk45xUU2jJVM
 t1P5swbdPat1peSPIGU//EB8LAxM4GbaW0w3rPUQ1AK6PFeRjCXKAjGKbjSFVxJWIHBd
 bDQABUJ7trmuOFTDw7ZrwXxXQEoR+j6/QuWvx5GU+8R1DJTK1/02ppOtzMArkcXAOsJn
 +fvcMyETiNx5TmzDDxevO8kONTDJObUabXybG5GRQ8PGPrfKn71dWKNqqFLsLj3KZLzL
 xguA==
X-Gm-Message-State: APjAAAWJZk//OseBAfjhxcKVhM95JBLNi213TMy0SAPXPRoIG04Ia2Mt
 gKGG4y9tREd8ndm+POsMBz6TvGbGT4c=
X-Google-Smtp-Source: APXvYqyIyUYukkDxRx7t79cs57tG26rWbuzJPdYsR1pGolt/m1xirpeDO6OapATzvjaB5ZgubI9puw==
X-Received: by 2002:a37:a247:: with SMTP id l68mr15234079qke.89.1561898865197; 
 Sun, 30 Jun 2019 05:47:45 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id d17sm3388167qtp.84.2019.06.30.05.47.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 05:47:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: stop abusing dma_map/unmap for cache
Date: Sun, 30 Jun 2019 05:47:22 -0700
Message-Id: <20190630124735.27786-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t3NBRelcVNRRw+RFPngDYC9BWfE+P0zgYLat4rYCV1Q=;
 b=p+x7qPUHCxUv2jRoxomZbQsK2Iigsp9wix/13yErFTnhyS6qq5QjWt+mOLP2OfEpXq
 w302DafhUYJ4TYKN9yctny6hYLZgUjbdBC5IrdfE2jrP5bnP7oDuoOynwoCplHkWGNDr
 kY9eiSxtMyGO/INb/4uddNWepnoRhVOpb85nHVid/fPe8QfQBz9wVYldoExXDTAWjum+
 xbJbqAeoOFRyw1e37Aw4PJ7OgJy2TlSHNnIeglb3RwLZvU/SeSUliDsMHM78zzShC94J
 7UbZBWxunzSpK3RtSy0ei5INFdm5MSyRzch3h8k+86nK9C46IUhn15pWhISA2g4GxX7t
 NRWA==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKUmVjZW50bHkgc3BsYXRz
IGxpa2UgdGhpcyBzdGFydGVkIHNob3dpbmcgdXA6CgogICBXQVJOSU5HOiBDUFU6IDQgUElEOiAy
NTEgYXQgZHJpdmVycy9pb21tdS9kbWEtaW9tbXUuYzo0NTEgX19pb21tdV9kbWFfdW5tYXArMHhi
OC8weGMwCiAgIE1vZHVsZXMgbGlua2VkIGluOiBhdGgxMGtfc25vYyBhdGgxMGtfY29yZSBmdXNl
IG1zbSBhdGggbWFjODAyMTEgdXZjdmlkZW8gY2ZnODAyMTEgdmlkZW9idWYyX3ZtYWxsb2Mgdmlk
ZW9idWYyX21lbW9wcyB2aWRlCiAgIENQVTogNCBQSUQ6IDI1MSBDb21tOiBrd29ya2VyL3UxNjo0
IFRhaW50ZWQ6IEcgICAgICAgIFcgICAgICAgICA1LjIuMC1yYzUtbmV4dC0yMDE5MDYxOSsgIzIz
MTcKICAgSGFyZHdhcmUgbmFtZTogTEVOT1ZPIDgxSkwvTE5WTkIxNjEyMTYsIEJJT1MgOVVDTjIz
V1coVjEuMDYpIDEwLzI1LzIwMTgKICAgV29ya3F1ZXVlOiBtc20gbXNtX2dlbV9mcmVlX3dvcmsg
W21zbV0KICAgcHN0YXRlOiA4MGMwMDAwNSAoTnpjdiBkYWlmICtQQU4gK1VBTykKICAgcGMgOiBf
X2lvbW11X2RtYV91bm1hcCsweGI4LzB4YzAKICAgbHIgOiBfX2lvbW11X2RtYV91bm1hcCsweDU0
LzB4YzAKICAgc3AgOiBmZmZmMDAwMDExOWFiY2UwCiAgIHgyOTogZmZmZjAwMDAxMTlhYmNlMCB4
Mjg6IDAwMDAwMDAwMDAwMDAwMDAKICAgeDI3OiBmZmZmODAwMWY5OTQ2NjQ4IHgyNjogZmZmZjgw
MDFlYzI3MTA2OAogICB4MjU6IDAwMDAwMDAwMDAwMDAwMDAgeDI0OiBmZmZmODAwMWVhMzU4MGE4
CiAgIHgyMzogZmZmZjgwMDFmOTViYTAxMCB4MjI6IGZmZmY4MDAxOGU4M2JhODgKICAgeDIxOiBm
ZmZmODAwMWU1NDhmMDAwIHgyMDogZmZmZmZmZmZmZmZmZjAwMAogICB4MTk6IDAwMDAwMDAwMDAw
MDEwMDAgeDE4OiAwMDAwMDAwMGMwMDAwMWZlCiAgIHgxNzogMDAwMDAwMDAwMDAwMDAwMCB4MTY6
IDAwMDAwMDAwMDAwMDAwMDAKICAgeDE1OiBmZmZmMDAwMDE1YjcwMDY4IHgxNDogMDAwMDAwMDAw
MDAwMDAwNQogICB4MTM6IDAwMDMxNDJjYzFiZTE3NjggeDEyOiAwMDAwMDAwMDAwMDAwMDAxCiAg
IHgxMTogZmZmZjgwMDFmNmRlOTEwMCB4MTA6IDAwMDAwMDAwMDAwMDAwMDkKICAgeDkgOiBmZmZm
MDAwMDE1Yjc4MDAwIHg4IDogMDAwMDAwMDAwMDAwMDAwMAogICB4NyA6IDAwMDAwMDAwMDAwMDAw
MDEgeDYgOiBmZmZmZmZmZmZmZmZmMDAwCiAgIHg1IDogMDAwMDAwMDAwMDAwMGZmZiB4NCA6IGZm
ZmYwMDAwMTA2NWRiYzgKICAgeDMgOiAwMDAwMDAwMDAwMDAwMDBkIHgyIDogMDAwMDAwMDAwMDAw
MTAwMAogICB4MSA6IGZmZmZmZmZmZmZmZmYwMDAgeDAgOiAwMDAwMDAwMDAwMDAwMDAwCiAgIENh
bGwgdHJhY2U6CiAgICBfX2lvbW11X2RtYV91bm1hcCsweGI4LzB4YzAKICAgIGlvbW11X2RtYV91
bm1hcF9zZysweDk4LzB4YjgKICAgIHB1dF9wYWdlcysweDVjLzB4ZjAgW21zbV0KICAgIG1zbV9n
ZW1fZnJlZV93b3JrKzB4MTBjLzB4MTUwIFttc21dCiAgICBwcm9jZXNzX29uZV93b3JrKzB4MWUw
LzB4MzMwCiAgICB3b3JrZXJfdGhyZWFkKzB4NDAvMHg0MzgKICAgIGt0aHJlYWQrMHgxMmMvMHgx
MzAKICAgIHJldF9mcm9tX2ZvcmsrMHgxMC8weDE4CiAgIC0tLVsgZW5kIHRyYWNlIGFmYzBkYzVh
YjgxYTA2YmYgXS0tLQoKTm90IHF1aXRlIHN1cmUgd2hhdCB0cmlnZ2VyZWQgdGhhdCwgYnV0IHdl
IHJlYWxseSBzaG91bGRuJ3QgYmUgYWJ1c2luZwpkbWFfe21hcCx1bm1hcH1fc2coKSBmb3IgY2Fj
aGUgbWFpbnQuCgpTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5v
cmc+CkNjOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL21zbS9tc21fZ2VtLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21f
Z2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0uYwppbmRleCBkMzFkOWY5Mjc4ODcu
LjNiODRjYmRjYWZhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMKQEAgLTEwOCw3ICsxMDgsNyBAQCBz
dGF0aWMgc3RydWN0IHBhZ2UgKipnZXRfcGFnZXMoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmop
CiAJCSAqIGJlY2F1c2UgZGlzcGxheSBjb250cm9sbGVyLCBHUFUsIGV0Yy4gYXJlIG5vdCBjb2hl
cmVudDoKIAkJICovCiAJCWlmIChtc21fb2JqLT5mbGFncyAmIChNU01fQk9fV0N8TVNNX0JPX1VO
Q0FDSEVEKSkKLQkJCWRtYV9tYXBfc2coZGV2LT5kZXYsIG1zbV9vYmotPnNndC0+c2dsLAorCQkJ
ZG1hX3N5bmNfc2dfZm9yX2RldmljZShkZXYtPmRldiwgbXNtX29iai0+c2d0LT5zZ2wsCiAJCQkJ
CW1zbV9vYmotPnNndC0+bmVudHMsIERNQV9CSURJUkVDVElPTkFMKTsKIAl9CiAKQEAgLTEzOCw3
ICsxMzgsNyBAQCBzdGF0aWMgdm9pZCBwdXRfcGFnZXMoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
YmopCiAJCQkgKiBHUFUsIGV0Yy4gYXJlIG5vdCBjb2hlcmVudDoKIAkJCSAqLwogCQkJaWYgKG1z
bV9vYmotPmZsYWdzICYgKE1TTV9CT19XQ3xNU01fQk9fVU5DQUNIRUQpKQotCQkJCWRtYV91bm1h
cF9zZyhvYmotPmRldi0+ZGV2LCBtc21fb2JqLT5zZ3QtPnNnbCwKKwkJCQlkbWFfc3luY19zZ19m
b3JfY3B1KG9iai0+ZGV2LT5kZXYsIG1zbV9vYmotPnNndC0+c2dsLAogCQkJCQkgICAgIG1zbV9v
YmotPnNndC0+bmVudHMsCiAJCQkJCSAgICAgRE1BX0JJRElSRUNUSU9OQUwpOwogCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
