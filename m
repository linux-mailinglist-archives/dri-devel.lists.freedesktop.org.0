Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9019D92B
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 00:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2243089CC9;
	Mon, 26 Aug 2019 22:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD33A89CA8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 22:33:22 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id j7so16796116ota.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 15:33:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lr1R889MqE/Qh3k6PKpRAd6kdNCwcusZ5h2myFtwlCQ=;
 b=SJjEmL4vkkgVQ57j1c+9dJBagBCibBszmKIfAbQGjKzAyQXOI9YE/PPXHGCx/ZXd40
 rZD0VrBCVcOQwo5jynitTxcZKasgVK8HBUdPDkU1OQErGidl1ej4NMt77597dMiKWhh9
 RIjk4W9vghNfNcdOyeBD0EuieVQ0UNLJk7euhamdzlsio6MzO9wEGzdLT4dVNusyycnO
 XjSzy9vtOzQA0hhEk3XiA3qC5JmgqT7KFGTGkydW3HxBg6wChQ1uLVRiQhoi1yCbGPJF
 U+qT511W53Y3tsQfQhVvd9G5/wuDXUEFXRDOaY+SK7F8aYwJTBMEOzE6s/AoyB5Odw7V
 2k/Q==
X-Gm-Message-State: APjAAAXLQQw8tJhkga6Q0N4lRATLnofOWa45SEB0OnfdriezBXN6ovdR
 VFINlWxsnWlMlBrMUHCcB1NbFt0=
X-Google-Smtp-Source: APXvYqyERzU1vgqflOdioUmwGXf+TmL3rBTj4kE3lkSnn7VEzSl03eRsv+leakuqwCoTwAzxN+7rdg==
X-Received: by 2002:a9d:7356:: with SMTP id l22mr9274009otk.31.1566858801827; 
 Mon, 26 Aug 2019 15:33:21 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id e22sm3668959oii.7.2019.08.26.15.33.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 15:33:21 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/8] drm/panfrost: Remove unnecessary mmu->lock mutex
Date: Mon, 26 Aug 2019 17:33:12 -0500
Message-Id: <20190826223317.28509-4-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826223317.28509-1-robh@kernel.org>
References: <20190826223317.28509-1-robh@kernel.org>
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyBubyBuZWVkIHRvIHNlcmlhbGl6ZSBpby1wZ3RhYmxlIGNhbGxzIGFuZCB0aGUgYXNf
bG9jayBpcwpzdWZmaWNpZW50IHRvIHNlcmlhbGl6ZSBmbHVzaCBvcGVyYXRpb25zLCBzbyB3ZSBj
YW4gcmVtb3ZlIHRoZSBwZXIKcGFnZSB0YWJsZSBsb2NrLgoKRml4ZXM6IDcyODJmNzY0NWQwNiAo
ImRybS9wYW5mcm9zdDogSW1wbGVtZW50IHBlciBGRCBhZGRyZXNzIHNwYWNlcyIpClN1Z2dlc3Rl
ZC1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4KQ2M6IFRvbWV1IFZpem9z
byA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+CkNjOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5w
cmljZUBhcm0uY29tPgpDYzogQWx5c3NhIFJvc2VuendlaWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNv
bGxhYm9yYS5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+Ci0tLQp2MzoKIC0gbmV3IHBhdGNoCgogZHJpdmVycy9ncHUvZHJtL3Bh
bmZyb3N0L3BhbmZyb3N0X2RldmljZS5oIHwgMSAtCiBkcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3Qv
cGFuZnJvc3RfbW11LmMgICAgfCA5IC0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxMCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rf
ZGV2aWNlLmggYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfZGV2aWNlLmgKaW5k
ZXggZjUwM2M1NjZlOTlmLi5iN2ZhMDhlZDNhMjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9kZXZpY2UuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJv
c3QvcGFuZnJvc3RfZGV2aWNlLmgKQEAgLTEwNCw3ICsxMDQsNiBAQCBzdHJ1Y3QgcGFuZnJvc3Rf
ZGV2aWNlIHsKIHN0cnVjdCBwYW5mcm9zdF9tbXUgewogCXN0cnVjdCBpb19wZ3RhYmxlX2NmZyBw
Z3RibF9jZmc7CiAJc3RydWN0IGlvX3BndGFibGVfb3BzICpwZ3RibF9vcHM7Ci0Jc3RydWN0IG11
dGV4IGxvY2s7CiAJaW50IGFzOwogCWF0b21pY190IGFzX2NvdW50OwogCXN0cnVjdCBsaXN0X2hl
YWQgbGlzdDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9t
bXUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYwppbmRleCA4NDJi
ZGQ3Y2Y2YmUuLjNhOGJjZmE3ZTdiNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmZy
b3N0L3BhbmZyb3N0X21tdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9z
dF9tbXUuYwpAQCAtMjI4LDggKzIyOCw2IEBAIHN0YXRpYyBpbnQgbW11X21hcF9zZyhzdHJ1Y3Qg
cGFuZnJvc3RfZGV2aWNlICpwZmRldiwgc3RydWN0IHBhbmZyb3N0X21tdSAqbW11LAogCXN0cnVj
dCBpb19wZ3RhYmxlX29wcyAqb3BzID0gbW11LT5wZ3RibF9vcHM7CiAJdTY0IHN0YXJ0X2lvdmEg
PSBpb3ZhOwoKLQltdXRleF9sb2NrKCZtbXUtPmxvY2spOwotCiAJZm9yX2VhY2hfc2coc2d0LT5z
Z2wsIHNnbCwgc2d0LT5uZW50cywgY291bnQpIHsKIAkJdW5zaWduZWQgbG9uZyBwYWRkciA9IHNn
X2RtYV9hZGRyZXNzKHNnbCk7CiAJCXNpemVfdCBsZW4gPSBzZ19kbWFfbGVuKHNnbCk7CkBAIC0y
NDksOCArMjQ3LDYgQEAgc3RhdGljIGludCBtbXVfbWFwX3NnKHN0cnVjdCBwYW5mcm9zdF9kZXZp
Y2UgKnBmZGV2LCBzdHJ1Y3QgcGFuZnJvc3RfbW11ICptbXUsCiAJbW11X2h3X2RvX29wZXJhdGlv
bihwZmRldiwgbW11LCBzdGFydF9pb3ZhLCBpb3ZhIC0gc3RhcnRfaW92YSwKIAkJCSAgICBBU19D
T01NQU5EX0ZMVVNIX1BUKTsKCi0JbXV0ZXhfdW5sb2NrKCZtbXUtPmxvY2spOwotCiAJcmV0dXJu
IDA7CiB9CgpAQCAtMzA0LDggKzMwMCw2IEBAIHZvaWQgcGFuZnJvc3RfbW11X3VubWFwKHN0cnVj
dCBwYW5mcm9zdF9nZW1fb2JqZWN0ICpibykKIAlpZiAocmV0IDwgMCkKIAkJcmV0dXJuOwoKLQlt
dXRleF9sb2NrKCZiby0+bW11LT5sb2NrKTsKLQogCXdoaWxlICh1bm1hcHBlZF9sZW4gPCBsZW4p
IHsKIAkJc2l6ZV90IHVubWFwcGVkX3BhZ2U7CiAJCXNpemVfdCBwZ3NpemUgPSBnZXRfcGdzaXpl
KGlvdmEsIGxlbiAtIHVubWFwcGVkX2xlbik7CkBAIC0zMjEsOCArMzE1LDYgQEAgdm9pZCBwYW5m
cm9zdF9tbXVfdW5tYXAoc3RydWN0IHBhbmZyb3N0X2dlbV9vYmplY3QgKmJvKQogCW1tdV9od19k
b19vcGVyYXRpb24ocGZkZXYsIGJvLT5tbXUsIGJvLT5ub2RlLnN0YXJ0IDw8IFBBR0VfU0hJRlQs
CiAJCQkgICAgYm8tPm5vZGUuc2l6ZSA8PCBQQUdFX1NISUZULCBBU19DT01NQU5EX0ZMVVNIX1BU
KTsKCi0JbXV0ZXhfdW5sb2NrKCZiby0+bW11LT5sb2NrKTsKLQogCXBtX3J1bnRpbWVfbWFya19s
YXN0X2J1c3kocGZkZXYtPmRldik7CiAJcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQocGZkZXYt
PmRldik7CiAJYm8tPmlzX21hcHBlZCA9IGZhbHNlOwpAQCAtMzU2LDcgKzM0OCw2IEBAIGludCBw
YW5mcm9zdF9tbXVfcGd0YWJsZV9hbGxvYyhzdHJ1Y3QgcGFuZnJvc3RfZmlsZV9wcml2ICpwcml2
KQogCXN0cnVjdCBwYW5mcm9zdF9tbXUgKm1tdSA9ICZwcml2LT5tbXU7CiAJc3RydWN0IHBhbmZy
b3N0X2RldmljZSAqcGZkZXYgPSBwcml2LT5wZmRldjsKCi0JbXV0ZXhfaW5pdCgmbW11LT5sb2Nr
KTsKIAlJTklUX0xJU1RfSEVBRCgmbW11LT5saXN0KTsKIAltbXUtPmFzID0gLTE7CgotLQoyLjIw
LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
