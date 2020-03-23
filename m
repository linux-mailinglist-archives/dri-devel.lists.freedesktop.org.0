Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC7618F745
	for <lists+dri-devel@lfdr.de>; Mon, 23 Mar 2020 15:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757D46E134;
	Mon, 23 Mar 2020 14:50:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05BF6E157
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 14:50:18 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id p10so5018098wrt.6
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Mar 2020 07:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CnrDbQekDB7si/RVFG2Y571WOueuzxIpWjPING9WLdI=;
 b=ZvTYmfu9dotOhChR2B1NaGlgqH+bAKyGU0L+YfU6ZwZNGwk/GU1fhRlNc/zkD/12FA
 z2XoCiXBx+wtAbWpq6De7ut0FZR5mK2+MJoroczee4twG99ve0Y68Zmg//gQb4EwCAEO
 LhLKwFtqFLFItXI+/jjuR9Biwilkry9p2iWyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CnrDbQekDB7si/RVFG2Y571WOueuzxIpWjPING9WLdI=;
 b=QK8OuN4AZWlovf62Wg99oG11sDTUEun2znuAAUM2d6AccHLZvU/rKJ9rtXOj6m8Qpw
 kRnQzPaGM7sGckZVbxatrouv50Q7A9zvEGBc0FcOVZEdizW3AgrsnZjKk4+AFOTA8K/9
 stYuzL5itBuZvmXw53IvT6J+RO5CoUbYA/i8eE8Kmk+XoFG9A6y3oH7jtnqr8yKqkpV2
 7aBJSvQQmkYsiYUDoNi0kYxU2ZaMttdaUR8/huS13n7XK1IKMo2Ba9+Xc4fjwqYpDM2D
 qrYqMpV1m1Rdxn2vC7HK65n9dghDvqtLBGb5BOnqgYnoRKHjU6TvRVbIIvNJsR0vEUd1
 PXMA==
X-Gm-Message-State: ANhLgQ0txmVyfb6P9NGL+lCOfkuizTmM8j6RvaWu4JEp0j3owMyxFaaV
 2EeWptuv3NKI11qquOI7AUNsC8AIR365SA==
X-Google-Smtp-Source: ADFU+vtLPmuLx3QRbNxecSZKgO1Cpq9Ss9kGZ4edWqUAQnjKeFuWVO2a0ErZMb5x9a4O9Ep3kFyHAg==
X-Received: by 2002:a05:6000:1212:: with SMTP id
 e18mr32132470wrx.371.1584975017113; 
 Mon, 23 Mar 2020 07:50:17 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s22sm20376522wmc.16.2020.03.23.07.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2020 07:50:16 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/51] drm/repaper: Use drmm_add_final_kfree
Date: Mon, 23 Mar 2020 15:49:14 +0100
Message-Id: <20200323144950.3018436-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
References: <20200323144950.3018436-1-daniel.vetter@ffwll.ch>
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
 Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGlzIHdlIGNhbiBkcm9wIHRoZSBmaW5hbCBrZnJlZSBmcm9tIHRoZSByZWxlYXNlIGZ1
bmN0aW9uLgoKQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KUmV2aWV3
ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3JnPgpTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6ICJOb3JhbGYgVHLD
uG5uZXMiIDxub3JhbGZAdHJvbm5lcy5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RpbnkvcmVw
YXBlci5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMKaW5kZXggZjVlYmNhZjdlZTNhLi5kZjU2NTRl
ZjUzZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMKQEAgLTMxLDYgKzMxLDcgQEAKICNpbmNsdWRl
IDxkcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9jbWFfaGVs
cGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmg+CisjaW5j
bHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9tb2Rlcy5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fcmVjdC5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJvYmVfaGVscGVyLmg+
CkBAIC05MTAsMTMgKzkxMSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZp
Z19mdW5jcyByZXBhcGVyX21vZGVfY29uZmlnX2Z1bmNzID0gewogCiBzdGF0aWMgdm9pZCByZXBh
cGVyX3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKIHsKLQlzdHJ1Y3QgcmVwYXBlcl9l
cGQgKmVwZCA9IGRybV90b19lcGQoZHJtKTsKLQogCURSTV9ERUJVR19EUklWRVIoIlxuIik7CiAK
IAlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkcm0pOwogCWRybV9kZXZfZmluaShkcm0pOwotCWtm
cmVlKGVwZCk7CiB9CiAKIHN0YXRpYyBjb25zdCB1aW50MzJfdCByZXBhcGVyX2Zvcm1hdHNbXSA9
IHsKQEAgLTEwMjQsNiArMTAyMiw3IEBAIHN0YXRpYyBpbnQgcmVwYXBlcl9wcm9iZShzdHJ1Y3Qg
c3BpX2RldmljZSAqc3BpKQogCQlrZnJlZShlcGQpOwogCQlyZXR1cm4gcmV0OwogCX0KKwlkcm1t
X2FkZF9maW5hbF9rZnJlZShkcm0sIGVwZCk7CiAKIAlkcm1fbW9kZV9jb25maWdfaW5pdChkcm0p
OwogCWRybS0+bW9kZV9jb25maWcuZnVuY3MgPSAmcmVwYXBlcl9tb2RlX2NvbmZpZ19mdW5jczsK
LS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
