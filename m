Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B62946A74
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:38:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615D0895CA;
	Fri, 14 Jun 2019 20:37:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95B598955D
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:54 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id k8so5196805edr.11
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kl11cqZLKNVIoCSLq1T4z6E1blt5ws6QSMJdYDP8rFo=;
 b=j3ddH91WIyUuJKoq1n5cly2wSSDXLX017kAVNk15l0/+dP416fzd2gRdeSQtxj1KKI
 gKV70Fu1qM6vUUVbuMVfRa5BpRiDcQ/HfZjUmDjihimWX+o9wpv+cBEVg5eR2Zvu/IJT
 Lo4ZBmGTv5GX3t7Mu93hvCU5GnHisyhUt3Qv3HWDWqLH2YtNSnDW+Zt7pgmONSmkPsHK
 lQQPB4j0bXWpFzzo2ZaLbG+EWQcn6ouXeVJ+SFWQk2icpjCPR074YtcUnq9AU2kdXcvP
 VN3tWexivLiX+jZvUF9SApkk0LndGM9GxMOreYt7D1lRnjSL9l5on/eoG5fogNRBB5xe
 xHhA==
X-Gm-Message-State: APjAAAWHlbzIslEappq7gZfy3wowf8i0dYCa9w+1o/zI2iReSeXevjnS
 KYKQKOjMYlyUuvwO4nq+SrA2sx8h9zQ=
X-Google-Smtp-Source: APXvYqyJW7ZRxZMoGehzMOedZE2lv3ftKEGPQee9wy7+mZct/Ovqo2OEcePWE2F8tImwMp8lBLHMKg==
X-Received: by 2002:a50:9947:: with SMTP id l7mr42157954edb.305.1560544612213; 
 Fri, 14 Jun 2019 13:36:52 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:51 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 26/59] drm/rcar-du: Drop drm_gem_prime_export/import
Date: Fri, 14 Jun 2019 22:35:42 +0200
Message-Id: <20190614203615.12639-27-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Kl11cqZLKNVIoCSLq1T4z6E1blt5ws6QSMJdYDP8rFo=;
 b=NBcJIjf80TmUrTBIegjVHoFUGOlF/D8hw4ZE1QzyfrNv4QUQSHJXcT4JgHdO5xcZro
 NLzWWX32r13XWQAzC0XG7bq3Doc8Gs8gxkA6cqi5kAygbpTfDsLdrgao0gyQZssMLAkH
 WiMM4BtCJgsTlpwioTUr4Eke+8mBw8PO6WHZc=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBMYXVyZW50IFBp
bmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+CkNjOiBLaWVyYW4gQmlu
Z2hhbSA8a2llcmFuLmJpbmdoYW0rcmVuZXNhc0BpZGVhc29uYm9hcmQuY29tPgpDYzogbGludXgt
cmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUv
cmNhcl9kdV9kcnYuYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMgYi9kcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5jCmluZGV4IDgzNjg1MjUwMzE5ZC4uOWM5M2Vi
NGZhZDhiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Rydi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMKQEAgLTQ0Niw4ICs0
NDYsNiBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgcmNhcl9kdV9kcml2ZXIgPSB7CiAJLmdl
bV92bV9vcHMJCT0gJmRybV9nZW1fY21hX3ZtX29wcywKIAkucHJpbWVfaGFuZGxlX3RvX2ZkCT0g
ZHJtX2dlbV9wcmltZV9oYW5kbGVfdG9fZmQsCiAJLnByaW1lX2ZkX3RvX2hhbmRsZQk9IGRybV9n
ZW1fcHJpbWVfZmRfdG9faGFuZGxlLAotCS5nZW1fcHJpbWVfaW1wb3J0CT0gZHJtX2dlbV9wcmlt
ZV9pbXBvcnQsCi0JLmdlbV9wcmltZV9leHBvcnQJPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwKIAku
Z2VtX3ByaW1lX2dldF9zZ190YWJsZQk9IGRybV9nZW1fY21hX3ByaW1lX2dldF9zZ190YWJsZSwK
IAkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSA9IGRybV9nZW1fY21hX3ByaW1lX2ltcG9ydF9z
Z190YWJsZSwKIAkuZ2VtX3ByaW1lX3ZtYXAJCT0gZHJtX2dlbV9jbWFfcHJpbWVfdm1hcCwKLS0g
CjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
