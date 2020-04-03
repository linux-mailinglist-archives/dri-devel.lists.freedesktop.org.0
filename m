Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C98AB19D83F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 15:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D616EBBC;
	Fri,  3 Apr 2020 13:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC8466EBC2
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Apr 2020 13:58:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h9so8655441wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Apr 2020 06:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b4Axr3m19ZDHJDwp000pScLk3nGy1qLEpIOvDG8OyFo=;
 b=YBBM8Ad40h1R8ei+rTrQvBqJD3cc/AUcAT6FxA3t6vEoR3Mp7i6CbQrXZ6IxSmY5RD
 JkVVoODrY86ZGGPSWDfmaSnxwcPZM2qX8WvCensrDXDtcZE4WajuFIUPJWwybLe/TZkX
 x5UY/ACefIWNPNZrTHA7uGIU/qRe54suYfbcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b4Axr3m19ZDHJDwp000pScLk3nGy1qLEpIOvDG8OyFo=;
 b=fi9Y4IwV15ZM+VYfhJgraD67I/o6jnJTwgo13ASCQ20CAwEWkILgsjuKVTvF1WESq8
 T/oYvRBFIcDfUhOaq8rENM14DBMt+hOJxUA4mDajJFE57M9it4urGXKU6EOhqMvxGfaS
 hFj6EoDKbFgKK/N2KPVgb8euP7M/CP77koFzWVLsXVW7HiPUu6rU7df8oP7qIoAGDf/H
 N+6Bhzw5D2gWIWDTrCvFDlZ/uwcNyVHf8z20pKbVG0n6uifQYrSD6Q3n3QJhzhTlOfw4
 A0idgr4ThS0NwAwq4ZxahErL3NKcFmmXsaOxHIgDJwe4+d7XM0n+qwJetUh6rVcfVuB0
 yvQQ==
X-Gm-Message-State: AGi0PuaB5NQeCIVmxIjATKNe9Il0AVU0ncJOn7pAPfLqMOPH1HHwwHUW
 YExM1DvZrnrqgc0xgWbDZYJTNX8tenASWw==
X-Google-Smtp-Source: APiQypLA2zdUAjnSGpahQLdmA413bK5A1SuHc9iqEhDOKjQvWH8GFXShIo/XJbv70BnhLSECGMIzQg==
X-Received: by 2002:adf:a350:: with SMTP id d16mr7598987wrb.277.1585922336942; 
 Fri, 03 Apr 2020 06:58:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f141sm11783919wmf.3.2020.04.03.06.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 06:58:56 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 19/44] drm/repaper: Use devm_drm_dev_alloc
Date: Fri,  3 Apr 2020 15:58:03 +0200
Message-Id: <20200403135828.2542770-20-daniel.vetter@ffwll.ch>
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
L2dwdS9kcm0vdGlueS9yZXBhcGVyLmMgfCAxNCArKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3RpbnkvcmVwYXBlci5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvcmVwYXBlci5j
CmluZGV4IDg2MmMzZWU2MDU1ZC4uMWMwZTcxNjk1NDViIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdGlueS9yZXBhcGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvcmVwYXBlci5j
CkBAIC0xMDAyLDE5ICsxMDAyLDEzIEBAIHN0YXRpYyBpbnQgcmVwYXBlcl9wcm9iZShzdHJ1Y3Qg
c3BpX2RldmljZSAqc3BpKQogCQl9CiAJfQogCi0JZXBkID0ga3phbGxvYyhzaXplb2YoKmVwZCks
IEdGUF9LRVJORUwpOwotCWlmICghZXBkKQotCQlyZXR1cm4gLUVOT01FTTsKKwllcGQgPSBkZXZt
X2RybV9kZXZfYWxsb2MoZGV2LCAmcmVwYXBlcl9kcml2ZXIsCisJCQkJIHN0cnVjdCByZXBhcGVy
X2VwZCwgZHJtKTsKKwlpZiAoSVNfRVJSKGVwZCkpCisJCXJldHVybiBQVFJfRVJSKGVwZCk7CiAK
IAlkcm0gPSAmZXBkLT5kcm07CiAKLQlyZXQgPSBkZXZtX2RybV9kZXZfaW5pdChkZXYsIGRybSwg
JnJlcGFwZXJfZHJpdmVyKTsKLQlpZiAocmV0KSB7Ci0JCWtmcmVlKGVwZCk7Ci0JCXJldHVybiBy
ZXQ7Ci0JfQotCWRybW1fYWRkX2ZpbmFsX2tmcmVlKGRybSwgZXBkKTsKLQogCXJldCA9IGRybW1f
bW9kZV9jb25maWdfaW5pdChkcm0pOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7Ci0tIAoyLjI1
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
