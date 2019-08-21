Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CDF2985BC
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 22:38:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FAA6E995;
	Wed, 21 Aug 2019 20:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD5B6E99C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 20:38:42 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m44so4499532edd.9
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 13:38:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4E3pN/VpjnxuWkGoVFSEqKlxnE8wCbBL/AFkctiChC4=;
 b=JULaToSVJHboP7MJtaqZXOt+gjw8DnABzPWmqlWzYldUSl7rBBN6lsLOoVnw9q57Ph
 Q+tGsflr0hE95W19M0fb/pcvPESAN7jk0pS81IUW9HNwfNSFoMY3Hc2vlqqPaLJFuNmU
 iZhFtN6caQPsl3dW53kgE4ySPpxrwAem79bCL7xKRBH+tY6sEbZN1AwXbQjDyllS0djl
 yfEc4SDRJ/ysnQa3XlIoeWkMKO4g0wqwghIHehBYXBpbu/LctHnkhEnK0aWS4tzA8oZg
 cEEuacaoR8DToHm58hC5nH4Ck1fy2zL/AzlJeXhZSjhtkGlCy9D5Bp5comSbFyqfs1Bw
 zpuw==
X-Gm-Message-State: APjAAAUsPLQ9Wb46rmTDy+/mzxZdD923hO7gniR83S31v8y/ifYnZk7Z
 Bj0qPu9FminjQi6TCJ5Xs7AIVt26HquukA==
X-Google-Smtp-Source: APXvYqx9vUAFM4B2qs6Tg3WFE79ZNZz85Uup3au5EnvJ+0Xy61dVDvPfZaT02V0wQu5XYZTPzN7wpg==
X-Received: by 2002:a50:dec8:: with SMTP id d8mr38224047edl.76.1566419921179; 
 Wed, 21 Aug 2019 13:38:41 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id p5sm4321165edr.72.2019.08.21.13.38.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Aug 2019 13:38:40 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/crc: Actually allow to change the crc source
Date: Wed, 21 Aug 2019 22:38:35 +0200
Message-Id: <20190821203835.18314-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.23.0.rc1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4E3pN/VpjnxuWkGoVFSEqKlxnE8wCbBL/AFkctiChC4=;
 b=NguFl8qgrRPLFG7mlSKjVHhEoWigr5Hpfl39tRE0DdfGIJ5FWhiU0YbePWe3I8BYN+
 T3tUM4MmymKcHLfvkxOUfvGsKoY8XDGo8IDjR7mtLF80zEi0VFMaCKIXoZU2Zm+VUSk+
 Dvnp4NOLnWxW7mysq8FAdelx9PTLMwxNZT5kk=
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T29wcy4KCkZpeGVzOiA5ZWRiZjFmYTYwMGEgKCJkcm06IEFkZCBBUEkgZm9yIGNhcHR1cmluZyBm
cmFtZSBDUkNzIikKQ2M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5jb20+
CkNjOiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgpDYzogQmVuamFt
aW4gR2FpZ25hcmQgPGJlbmphbWluLmdhaWduYXJkQGxpbmFyby5vcmc+ClNpZ25lZC1vZmYtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9kcm1fZGVidWdmc19jcmMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVi
dWdmc19jcmMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwppbmRleCBiZTFi
N2JhOTJmZmUuLjZmZTY5M2VlMTVmOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
ZWJ1Z2ZzX2NyYy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19jcmMuYwpAQCAt
MzY5LDcgKzM2OSw3IEBAIHZvaWQgZHJtX2RlYnVnZnNfY3J0Y19jcmNfYWRkKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YykKIAogCWNyY19lbnQgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoImNyYyIsIGNydGMt
PmRlYnVnZnNfZW50cnkpOwogCi0JZGVidWdmc19jcmVhdGVfZmlsZSgiY29udHJvbCIsIFNfSVJV
R08sIGNyY19lbnQsIGNydGMsCisJZGVidWdmc19jcmVhdGVfZmlsZSgiY29udHJvbCIsIFNfSVJV
R08gfCBTX0lXVVNSLCBjcmNfZW50LCBjcnRjLAogCQkJICAgICZkcm1fY3J0Y19jcmNfY29udHJv
bF9mb3BzKTsKIAlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJkYXRhIiwgU19JUlVHTywgY3JjX2VudCwg
Y3J0YywKIAkJCSAgICAmZHJtX2NydGNfY3JjX2RhdGFfZm9wcyk7Ci0tIAoyLjIzLjAucmMxCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
