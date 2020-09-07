Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DEF25FB72
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 15:29:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E466E453;
	Mon,  7 Sep 2020 13:29:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CD916E44B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 13:29:37 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id c10so12814642edk.6
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 06:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6MO2mYxQ/jIAZ9PoCpHLawdBa6dxu1tRVzmVKjHhc4c=;
 b=sjNTaDbq7upfy1YxeCFI4San2Jq2cHWirPeijYjurr0uFPrpDG7c2CdEFP4GlPEP4B
 ve/HyiaYcOQ1Y3k68/l1z4cfDiqSOBHtPCfyD+JGUrwQ3Hi66Ogk7/OHI/yAwInu7L2t
 8mr/zMc5JJOiDvbRWRQUhdvnkIXtzJKdddmsekcvsTIRMvN536nuYXhfmlq6Bren3M9t
 Urh2MIQ4kaOrLMlc4EHkw1WIl6goPUi83HsxyX1NS645kjTQe9i0ffWh+Pq+IGX3lL0F
 bup+QQCx/mlXC/otgTsReAuOpFl+4lThXGApvE5OH6iOS9yRBfytTeMopGiMcnHYnriz
 D5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6MO2mYxQ/jIAZ9PoCpHLawdBa6dxu1tRVzmVKjHhc4c=;
 b=NyRFYWQrCS2Da2mw/GDrMF8OGD4g0SGsazsuTUU2PPoREB372cAbNYLv80fr7WN2Xa
 pPZYoFQAYbsb8KdxQCH6k33Lckc8yJilNVDuT32N7/n9CYgYggDomAnNLAKe8WLdX4rO
 IYEl4LevQVGgYQ8rWZbDii6CvbhjhYgQYVHrn3fgpamNQl8r7NWSUtE5io0GylrTfjMB
 UgNnLqKf2oi1IOAviy9qfoclqI4cJBKrfeekLNaC+FDcrP70Lu1kowMQZNfIsnSrusSg
 fUoNg7H7q9FfxUMn8R/LMLMZz6EXVgXyb7/ONIFJ3FbgOsgVXTH/n/XavHHCSCTrQpSl
 0pGQ==
X-Gm-Message-State: AOAM532AJy3g0UsVM6KpJ9g9kI8RrVuIs/DgsltwyOpmE0QuzVvQGlot
 47jxai8K7GBGiDQ/kLmoIUQri8cyztI=
X-Google-Smtp-Source: ABdhPJyynxzvybquv+3Y7OXN7AOcCd2tkC7/4Z50Z4XH4wslIS53qhfgeb2d1yzdxl0NuzJM+q5e2Q==
X-Received: by 2002:a05:6402:8d3:: with SMTP id
 d19mr21562300edz.68.1599485376070; 
 Mon, 07 Sep 2020 06:29:36 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b600:ca59:71b3:2cdb])
 by smtp.gmail.com with ESMTPSA id c5sm14730568edt.24.2020.09.07.06.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 06:29:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: airlied@gmail.com,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/qxl: don't touch mem.bus.offset
Date: Mon,  7 Sep 2020 15:29:32 +0200
Message-Id: <20200907132933.5401-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBpbnRlcm5hbCB0byBUVE0gYW5kIHNob3VsZCBub3QgYmUgdXNlZCBieSBkcml2ZXJz
IGRpcmVjdGx5LgoKRHJvcCB0aGUgY2FsbCB0byBxeGxfdHRtX2lvX21lbV9yZXNlcnZlKCkgYW5k
IHVzZSBtZW0tPnN0YXJ0IGluc3RlYWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmln
IDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxf
b2JqZWN0LmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3Qu
YyBiL2RyaXZlcnMvZ3B1L2RybS9xeGwvcXhsX29iamVjdC5jCmluZGV4IGY4MzhiNmQ2ODlhYS4u
YjJhMWZhNjE5MjBiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3Qu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuYwpAQCAtMTY3LDYgKzE2Nyw3
IEBAIGludCBxeGxfYm9fa21hcChzdHJ1Y3QgcXhsX2JvICpibywgdm9pZCAqKnB0cikKIHZvaWQg
KnF4bF9ib19rbWFwX2F0b21pY19wYWdlKHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2LAogCQkJICAg
ICAgc3RydWN0IHF4bF9ibyAqYm8sIGludCBwYWdlX29mZnNldCkKIHsKKwl1bnNpZ25lZCBsb25n
IG9mZnNldDsKIAl2b2lkICpycHRyOwogCWludCByZXQ7CiAJc3RydWN0IGlvX21hcHBpbmcgKm1h
cDsKQEAgLTE3OCw5ICsxNzksOCBAQCB2b2lkICpxeGxfYm9fa21hcF9hdG9taWNfcGFnZShzdHJ1
Y3QgcXhsX2RldmljZSAqcWRldiwKIAllbHNlCiAJCWdvdG8gZmFsbGJhY2s7CiAKLQlyZXQgPSBx
eGxfdHRtX2lvX21lbV9yZXNlcnZlKGJvLT50Ym8uYmRldiwgJmJvLT50Ym8ubWVtKTsKLQotCXJl
dHVybiBpb19tYXBwaW5nX21hcF9hdG9taWNfd2MobWFwLCBiby0+dGJvLm1lbS5idXMub2Zmc2V0
ICsgcGFnZV9vZmZzZXQpOworCW9mZnNldCA9IGJvLT50Ym8ubWVtLnN0YXJ0IDw8IFBBR0VfU0hJ
RlQ7CisJcmV0dXJuIGlvX21hcHBpbmdfbWFwX2F0b21pY193YyhtYXAsIG9mZnNldCArIHBhZ2Vf
b2Zmc2V0KTsKIGZhbGxiYWNrOgogCWlmIChiby0+a3B0cikgewogCQlycHRyID0gYm8tPmtwdHIg
KyAocGFnZV9vZmZzZXQgKiBQQUdFX1NJWkUpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
