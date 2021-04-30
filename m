Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B14B36F7DB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 11:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE836F50C;
	Fri, 30 Apr 2021 09:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F0D6F508
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 09:25:18 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id u17so104338721ejk.2
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 02:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gUAvKxvD/sLpoSx+hHmo3rbgcgIylVoMEK7bh2Nyg3c=;
 b=pW3vbojOXp199phYf2HX2507Kc62RBq3wKkFuyf8lfT31Y/R223xgO4QBVtQl1tF85
 SRokeWNhKNYmOhB9262rZUVE+r94qARqQnMW4aGne8LJ5PUV46c7qNC5xOxmeCnJuSuI
 vM3qSfnRLt0ip2DQHtDS1yvq880MXR55Ody3d/SJqDYzO+gyG1WL5keWPyzg8BYB0Zru
 LJYZI/7uATsvCbH3X7dc/06B/WdW4YYaoDoTfj8bUx+RerUZikpT8DjFMsMdL6Xig1Nv
 Koe+TAnprgvx3DS3Y2ZlWgfggsxNP5eF37MG1CoCSnmsqsw1Rp7pAq0XoA1pXOGhWxrE
 9wwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gUAvKxvD/sLpoSx+hHmo3rbgcgIylVoMEK7bh2Nyg3c=;
 b=d38olixDqkBmerZYqITf4S1am5oQaBG0Kl9Qf0jLd+yVabwLH27ZL5j8/I2C9rx1DU
 5cMMcpPlcO9KI3o6Y/HBT7FFrI4DnrSNL1vjs1ZhOQOd0nvvu4M/URAgyTrLjEoCdUgb
 VzZnKGYMQrdZqNhMZMGk0Frs+o1QHfwEH2Wa6T96N3tXtIoDznmRjlfVRgxA52+I/zFV
 uI/7EE3M6oPdM5HM6jQiHSdfHFqIETL3O+pZWWhm+JmTPogqsenux0qr/vq0O5EMXW4D
 msBZYTxtQDY+fk1c7+K88vXPJbyXxXoks3Cy1SoPTwOs3zqQr7s0+byO8AGkS2gWKWQ3
 Nigw==
X-Gm-Message-State: AOAM530yFm3H5nDBvlmTbFu/SBD2WdkM8QUAnbEavvNHUF/ROHj+ELfX
 gHusYLKpiO2K7WIQZq7S+Ol5hAcrMIo=
X-Google-Smtp-Source: ABdhPJzoZpgwTiZJK/QoJAUvoXPD2fge6WS6FVqJl+HbknM0VqXA11MwcYU90MDJBUqfZKuq8NCcFQ==
X-Received: by 2002:a17:906:7206:: with SMTP id
 m6mr3272835ejk.281.1619774717108; 
 Fri, 30 Apr 2021 02:25:17 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d08c:9633:b7a2:37e2])
 by smtp.gmail.com with ESMTPSA id h23sm1550959ejx.90.2021.04.30.02.25.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 02:25:16 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/13] drm/nouveau: switch the TTM backends to self alloc
Date: Fri, 30 Apr 2021 11:25:06 +0200
Message-Id: <20210430092508.60710-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430092508.60710-1-christian.koenig@amd.com>
References: <20210430092508.60710-1-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch, matthew.william.auld@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2ltaWxhciB0byB0aGUgVFRNIHJhbmdlIG1hbmFnZXIuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9tZW0uaCB8IDEgKwogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV90dG0uYyB8IDQgKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X21lbS5oIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9tZW0uaAppbmRleCA3ZGYzODQ4ZTg1YWEuLjNhNmEx
YmUyZWQ1MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9tZW0u
aAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X21lbS5oCkBAIC0xMyw2ICsx
Myw3IEBAIG5vdXZlYXVfbWVtKHN0cnVjdCB0dG1fcmVzb3VyY2UgKnJlZykKIH0KIAogc3RydWN0
IG5vdXZlYXVfbWVtIHsKKwlzdHJ1Y3QgdHRtX3Jlc291cmNlIGJhc2U7CiAJc3RydWN0IG5vdXZl
YXVfY2xpICpjbGk7CiAJdTgga2luZDsKIAl1OCBjb21wOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfdHRtLmMKaW5kZXggMTVjNzYyN2Y4ZjU4Li41ZTVjZTJlYzg5ZjAgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV90dG0uYwpAQCAtNTksNiArNTksOCBAQCBub3V2ZWF1X3ZyYW1f
bWFuYWdlcl9uZXcoc3RydWN0IHR0bV9yZXNvdXJjZV9tYW5hZ2VyICptYW4sCiAJaWYgKHJldCkK
IAkJcmV0dXJuIHJldDsKIAorCXR0bV9yZXNvdXJjZV9pbml0KGJvLCBwbGFjZSwgcmVnLT5tbV9u
b2RlKTsKKwogCXJldCA9IG5vdXZlYXVfbWVtX3ZyYW0ocmVnLCBudmJvLT5jb250aWcsIG52Ym8t
PnBhZ2UpOwogCWlmIChyZXQpIHsKIAkJbm91dmVhdV9tZW1fZGVsKHJlZyk7CkBAIC04Nyw2ICs4
OSw3IEBAIG5vdXZlYXVfZ2FydF9tYW5hZ2VyX25ldyhzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFn
ZXIgKm1hbiwKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCisJdHRtX3Jlc291cmNlX2luaXQo
Ym8sIHBsYWNlLCByZWctPm1tX25vZGUpOwogCXJlZy0+c3RhcnQgPSAwOwogCXJldHVybiAwOwog
fQpAQCAtMTEyLDYgKzExNSw3IEBAIG52MDRfZ2FydF9tYW5hZ2VyX25ldyhzdHJ1Y3QgdHRtX3Jl
c291cmNlX21hbmFnZXIgKm1hbiwKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCisJdHRtX3Jl
c291cmNlX2luaXQoYm8sIHBsYWNlLCByZWctPm1tX25vZGUpOwogCXJldCA9IG52aWZfdm1tX2dl
dCgmbWVtLT5jbGktPnZtbS52bW0sIFBURVMsIGZhbHNlLCAxMiwgMCwKIAkJCSAgIChsb25nKXJl
Zy0+bnVtX3BhZ2VzIDw8IFBBR0VfU0hJRlQsICZtZW0tPnZtYVswXSk7CiAJaWYgKHJldCkgewot
LSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
