Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF9519D840
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A294E6EBBE;
	Fri,  3 Apr 2020 13:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76A26EBCB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:58:59 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j17so8571721wru.13
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=otIrhwZjoFpvWNzNejn5R22CMdP0/kgQJt8widdx7Ho=;
 b=dWvuqheKmGOa21IayDbnPnK4nPH1vpdeovUtpDXD0mM5n7uFIAK+7x762lQZDKyM4Y
 9I4DM8oYVYglevu7qB170Jy0zqqCgNqVsDqD9eDONwZnq4t7KKgSTwAhGZUFxcuI1av2
 8SVyFn60lDzyz059rDf+/YSwq2UJy4kp9gcts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=otIrhwZjoFpvWNzNejn5R22CMdP0/kgQJt8widdx7Ho=;
 b=X4d4M8jTa7OLsV0oKlzVYOJZWVR3CKz/+eYKRi6Yp5CGt2Q6LvtcfmLRK0184B57O1
 731dw1+dDoWeXSs+yRu7AU073P3StEjD1C4Qn+Xpx+Uo6VQrqpHYcYWbugjeMgiwMi1K
 vbttFFio8HFd9d2VROmRY+xGavp6ux/6esLTVGc+lumxjQp+pJPt+YdCYHxJL3pL6em1
 c5f/4CDsga3r68z3JPfjvjhJRW80ebBLLdjtxvbFBCXMeSLn5JtKSpWnQXyZAgpSIQ2f
 oXDdjS7iRNBnD/tfHjMIFXUJ1uv1CPRcB4ndAjjcg6irVZVj4AinKpn9ONFz5Xs3yVPk
 I/tg==
X-Gm-Message-State: AGi0PuZ6aA0f50G4OXW/yHR9ldMQgwyLoxIvJ044b6jq7MgBUDoYzRVk
 7XVzZrhRi5UDGdK9MIuL0XqXPrZA452toQ==
X-Google-Smtp-Source: APiQypKW65YqGixRuX3K90+2HCF1vQh4514XACGmSsIVKNhsrbSsR4h+PQWdvpZISH0CcxNM3nDa4g==
X-Received: by 2002:adf:f1c4:: with SMTP id z4mr9773093wro.342.1585922338038; 
 Fri, 03 Apr 2020 06:58:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:58:57 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 20/44] drm/mi0283qt: Use devm_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:58:04 +0200
Message-Id: <20200403135828.2542770-21-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
References: <20200403135828.2542770-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxyZWFkeSB1c2luZyBkZXZtX2RybV9kZXZfaW5pdCwgc28gdmVyeSBzaW1wbGUgcmVwbGFjbWVu
dC4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29t
PgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vdGlueS9taTAyODNxdC5jIHwgMTMgKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdGlueS9taTAyODNxdC5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvbWkwMjgzcXQu
YwppbmRleCBkZWNhZjU3MDUzZmYuLjA4YWM1NDlhYjBmNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL3RpbnkvbWkwMjgzcXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9taTAyODNx
dC5jCkBAIC0xODcsMTggKzE4NywxMyBAQCBzdGF0aWMgaW50IG1pMDI4M3F0X3Byb2JlKHN0cnVj
dCBzcGlfZGV2aWNlICpzcGkpCiAJdTMyIHJvdGF0aW9uID0gMDsKIAlpbnQgcmV0OwogCi0JZGJp
ZGV2ID0ga3phbGxvYyhzaXplb2YoKmRiaWRldiksIEdGUF9LRVJORUwpOwotCWlmICghZGJpZGV2
KQotCQlyZXR1cm4gLUVOT01FTTsKKwlkYmlkZXYgPSBkZXZtX2RybV9kZXZfYWxsb2MoZGV2LCAm
bWkwMjgzcXRfZHJpdmVyLAorCQkJCSAgICBzdHJ1Y3QgbWlwaV9kYmlfZGV2LCBkcm0pOworCWlm
IChJU19FUlIoZGJpZGV2KSkKKwkJcmV0dXJuIFBUUl9FUlIoZGJpZGV2KTsKIAogCWRiaSA9ICZk
YmlkZXYtPmRiaTsKIAlkcm0gPSAmZGJpZGV2LT5kcm07Ci0JcmV0ID0gZGV2bV9kcm1fZGV2X2lu
aXQoZGV2LCBkcm0sICZtaTAyODNxdF9kcml2ZXIpOwotCWlmIChyZXQpIHsKLQkJa2ZyZWUoZGJp
ZGV2KTsKLQkJcmV0dXJuIHJldDsKLQl9Ci0JZHJtbV9hZGRfZmluYWxfa2ZyZWUoZHJtLCBkYmlk
ZXYpOwogCiAJZGJpLT5yZXNldCA9IGRldm1fZ3Bpb2RfZ2V0X29wdGlvbmFsKGRldiwgInJlc2V0
IiwgR1BJT0RfT1VUX0hJR0gpOwogCWlmIChJU19FUlIoZGJpLT5yZXNldCkpIHsKLS0gCjIuMjUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
