Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B57891A94A2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 09:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46E6C6E898;
	Wed, 15 Apr 2020 07:41:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 016E66E889
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 07:40:57 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id u13so17380941wrp.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 00:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gDDP7NsiEuHDLtSxInpBIsyvk8+l345exaglngsgh2M=;
 b=IdsblrJcZuUoqytLva0JAsO+RG3d/wCPNJDQbYowvBG/rZ0pUZLingQgFvExL1ic84
 0N3V0IZJ831yUtmKK/Ihltp/PRs9O0FSjMDoJniSVpBipajuJPX0q0hzLt5z77mBL94n
 Y7dCUtH/CXu6ZOguJt7wiLv+6GJOWvrLZz9qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gDDP7NsiEuHDLtSxInpBIsyvk8+l345exaglngsgh2M=;
 b=Mh+IumZSGD620TxW/b25NV8CKTzWGAdjxWYasgDumfWLwlwGBgz7zKVR4PmKEDVbIG
 5n1WFPyDy2xzzeRpC96F7Aco0sWe2GzP2OZDtaXaiCvQ4CpCtFRI31Jhn/Xq8VBIMdo+
 gPBcw0BMh4K7WuVoY2RVD5rGii3kZMKhW6404RYGDvEWqb8g/cSIQJDg4OA7f70uoGlm
 Z966V994RnpsqacCRx0zYzJyFNx3OnyGUmwOYgFuNdkbc/WgnreoD6/6zEQM+lJ+u26T
 5cCpjcisMPFm0JaNu+3eSTfQ3J5YmNMB5vgd7L40iGAEN0+9vyzKCkHbgzJGZZlQOBPm
 jh8g==
X-Gm-Message-State: AGi0PuZ8mb2Ne+GEgQap0DXze+r8lYDnozNFvkIcgUHvQ9HXHsgBB/Cy
 NhNQugHnM1sGb0HeW0awHJm/3A==
X-Google-Smtp-Source: APiQypKInRdx1NLE/rKAKhthJ4kgwq4DhMiFXkWGTnshXM7f29oAiUch8FZHTwyrBcvRTInWQwn8IQ==
X-Received: by 2002:a5d:4ed1:: with SMTP id s17mr22727628wrv.310.1586936456539; 
 Wed, 15 Apr 2020 00:40:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u30sm1878552wru.13.2020.04.15.00.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 00:40:56 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Subject: [PATCH 15/59] drm/repaper: Use devm_drm_dev_alloc
Date: Wed, 15 Apr 2020 09:39:50 +0200
Message-Id: <20200415074034.175360-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxyZWFkeSB1c2luZyBkZXZtX2RybV9kZXZfaW5pdCwgc28gdmVyeSBzaW1wbGUgcmVwbGFjbWVu
dC4KCkFja2VkLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KQWNrZWQt
Ynk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiAiTm9yYWxmIFRyw7hubmVzIiA8
bm9yYWxmQHRyb25uZXMub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIuYyB8
IDE0ICsrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMKaW5kZXggODYyYzNlZTYwNTVkLi4xYzBl
NzE2OTU0NWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMKQEAgLTEwMDIsMTkgKzEwMDIsMTMgQEAg
c3RhdGljIGludCByZXBhcGVyX3Byb2JlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCiAJCX0KIAl9
CiAKLQllcGQgPSBremFsbG9jKHNpemVvZigqZXBkKSwgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFlcGQp
Ci0JCXJldHVybiAtRU5PTUVNOworCWVwZCA9IGRldm1fZHJtX2Rldl9hbGxvYyhkZXYsICZyZXBh
cGVyX2RyaXZlciwKKwkJCQkgc3RydWN0IHJlcGFwZXJfZXBkLCBkcm0pOworCWlmIChJU19FUlIo
ZXBkKSkKKwkJcmV0dXJuIFBUUl9FUlIoZXBkKTsKIAogCWRybSA9ICZlcGQtPmRybTsKIAotCXJl
dCA9IGRldm1fZHJtX2Rldl9pbml0KGRldiwgZHJtLCAmcmVwYXBlcl9kcml2ZXIpOwotCWlmIChy
ZXQpIHsKLQkJa2ZyZWUoZXBkKTsKLQkJcmV0dXJuIHJldDsKLQl9Ci0JZHJtbV9hZGRfZmluYWxf
a2ZyZWUoZHJtLCBlcGQpOwotCiAJcmV0ID0gZHJtbV9tb2RlX2NvbmZpZ19pbml0KGRybSk7CiAJ
aWYgKHJldCkKIAkJcmV0dXJuIHJldDsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
