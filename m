Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E7C2793CE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 23:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6C3C6ED65;
	Fri, 25 Sep 2020 21:55:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB496ED67
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 21:55:34 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id u21so3640574ljl.6
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 14:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SeTL0c/7JNOZbHDDafGIj2Lq9RezRDqi3GjRLXy3MsM=;
 b=pVGittCTqyTKqdvnYw2YphLU++ysqA22ptlbtdIiK4INItNg77NscljoTBoNwuQF9G
 lq4iY831pPMXw1xmkRNDWa3VzqlQe9Q4x+HwoNYH8C2Q4rgVpA+pSXs9VGq8zrCsjZDe
 ds5Bd0uh20DgrUA7XfoKF+/Z4q3UstXzX+RD8c1rPxSd4E97oDiExrezqx4XZUUYqcAE
 g1+/xJHNi+MlZRO1wb+g2TKz350ARMIBcDM2cMsk9vqus0iFKA+vDmJ5tMQDWa9ekXv/
 kKI21HYapqXBDQVv46R3+M1H6L0+brO4XWTpVRhCYVqKtHEUEvYCZWGgXF0IQ3DdDmMO
 t4RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SeTL0c/7JNOZbHDDafGIj2Lq9RezRDqi3GjRLXy3MsM=;
 b=KNkq7zRVsI72FLpf8sRM0h2RbjPfafQPwbdl0DsA3ViP5SCHYsF0ivuRc8lBcTUuoL
 +fB5A0CX2p92DYF3yXx4LvIKyTObnCYabJyAzxqtbgLo1PlkynuQ45osczuxLqDuCnpA
 KaWvjvzLOL4xUgBAE/u0Po4u1PU84Mqz7vb2W7OsLrmTrh336VtuRx5eZ233VaJgPS+0
 7p5yKKcRI5ni1h6LiL+c07hdED2K2cCaxsS2rtS+URU3gFs6Rk8H45qsnhu9X+YJ2Rg8
 qf/pMyahTFIEI0SqbP6BF01BZz8t1cQiQIGZiF56ij7NjuSx0gR3GtchA4RvfxKodXRN
 6/8g==
X-Gm-Message-State: AOAM531OfA8i5UqYkFbEywI5tV0qB9wf3JsyYdKvxGCbnx7Lkxl7POXV
 8VfOjFs5matTwISiydI6T19KE1D9+upa+w==
X-Google-Smtp-Source: ABdhPJx6ytnXJvCZhen05QP8JCFosKED8273RviYERaPsmA21OzhS4aeWsWvQ4UgzSKTTJs019juqg==
X-Received: by 2002:a05:651c:1188:: with SMTP id
 w8mr2131504ljo.344.1601070933023; 
 Fri, 25 Sep 2020 14:55:33 -0700 (PDT)
Received: from saturn.localdomain ([2a00:fd00:805f:db00:3926:b59a:e618:9f9c])
 by smtp.gmail.com with ESMTPSA id
 j8sm261277lfr.80.2020.09.25.14.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 14:55:32 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Heiko Stuebner <heiko@sntech.de>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v1 1/2] drm/rockchip: fix build due to undefined
 drm_gem_cma_vm_ops
Date: Fri, 25 Sep 2020 23:55:23 +0200
Message-Id: <20200925215524.2899527-2-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200925215524.2899527-1-sam@ravnborg.org>
References: <20200925215524.2899527-1-sam@ravnborg.org>
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
Cc: Sandy Huang <hjc@rock-chips.com>, stable@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29tbWl0IDBkNTkwYWYzMTQwZCAoImRybS9yb2NrY2hpcDogQ29udmVydCB0byBkcm1fZ2VtX29i
amVjdF9mdW5jcyIpCmludHJvZHVjZWQgdGhlIGZvbGxvd2luZyBidWlsZCBlcnJvcjoKCnJvY2tj
aGlwX2RybV9nZW0uYzozMDQ6MTM6IGVycm9yOiDigJhkcm1fZ2VtX2NtYV92bV9vcHPigJkgdW5k
ZWNsYXJlZCBoZXJlCiAgMzA0IHwgIC52bV9vcHMgPSAmZHJtX2dlbV9jbWFfdm1fb3BzLAogICAg
ICB8ICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fgogICAgICB8ICAgICAgICAgICAgIGRy
bV9nZW1fbW1hcF9vYmoKCkZpeGVkIGJ5IGFkZGluZyBtaXNzaW5nIGluY2x1ZGUgZmlsZS4KClNp
Z25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KQ2M6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogU2FuZHkgSHVhbmcgPGhqY0Byb2Nr
LWNoaXBzLmNvbT4KQ2M6ICJIZWlrbyBTdMO8Ym5lciIgPGhlaWtvQHNudGVjaC5kZT4KQ2M6IGxp
bnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZwpDYzogbGludXgtcm9ja2NoaXBAbGlz
dHMuaW5mcmFkZWFkLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9k
cm1fZ2VtLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZ2VtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2dlbS5jCmluZGV4IGJiMzU3ODQ2OWIwMy4u
NmRhMTVmYWYwMTkyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2No
aXBfZHJtX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1f
Z2VtLmMKQEAgLTEwLDYgKzEwLDcgQEAKIAogI2luY2x1ZGUgPGRybS9kcm0uaD4KICNpbmNsdWRl
IDxkcm0vZHJtX2dlbS5oPgorI2luY2x1ZGUgPGRybS9kcm1fZ2VtX2NtYV9oZWxwZXIuaD4KICNp
bmNsdWRlIDxkcm0vZHJtX3ByaW1lLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV92bWFfbWFuYWdlci5o
PgogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
