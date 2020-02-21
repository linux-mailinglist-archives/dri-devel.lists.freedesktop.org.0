Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD761688A9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652BB6F53B;
	Fri, 21 Feb 2020 21:04:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B906F52D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:03:50 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id s10so3166529wmh.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mt0LsOXPHC2Mb9wycvJ+FxYXLYhKToWbMHDbBuIFXi8=;
 b=OwAeQBHoXmiqL3qM86BYvSS3mnCumn3/StXzTr+Vtds22QcaVo1o7AFJ84T+zcxoBu
 K5ZW3TEsMs87VyFy/0nbRZIZNnteigaSa+cbYw62oAsp346lzKGDQ6VIqqZYM4BswuNm
 bXYD3fZyZs7zhUopDumdB46088eRTH8MXrHWY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mt0LsOXPHC2Mb9wycvJ+FxYXLYhKToWbMHDbBuIFXi8=;
 b=YASqP1zARaALokwEs2i+qCK8rdp7W4tTovkML5Hi+GeE5CFybz3wzKgTyrFA1FUfD9
 uMWSOWTpXg1+2t235fbny67Dz7juUoBCvs/QdgTn3jSxuxoRBTsQ7cBW0wdho5zcj7Df
 C/cgbfw2NzE8Lz0iVHC++rn1zg9TPJyR2Hp0dCpRLLTr5RcnFPD5BdVUtltAE6/E2zh8
 YxmduK2uymJNB+WDc2fWCGOE3F09PWUTs5ctasBKPtbkLCJQiZF8dVYWEnyejH+x9HP9
 FvP8MNA4f4PrWp/awl+aLXciMpvFaCHPtYFjxkBz53kMFiWA/bHrk6Hv1WAC/tURhcJe
 Y+lA==
X-Gm-Message-State: APjAAAUruIu4hH2GoyTWjru5HowW3es6EmvGFAZAxRhnORYYbTmffeMx
 mhUfZ0609MDuMODy/r20Aw/Ifg/gr3A=
X-Google-Smtp-Source: APXvYqz2IOfRGizBBQqJEEbmC6Q2Got/tMih3FC8thww8AbrFTm4Vu1e4ml0JQkFYQDcWLGqPZ/YQg==
X-Received: by 2002:a1c:e388:: with SMTP id a130mr5606572wmh.176.1582319028854; 
 Fri, 21 Feb 2020 13:03:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.03.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:03:48 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/51] drm/repaper: Use drmm_add_final_kfree
Date: Fri, 21 Feb 2020 22:02:43 +0100
Message-Id: <20200221210319.2245170-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
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

V2l0aCB0aGlzIHdlIGNhbiBkcm9wIHRoZSBmaW5hbCBrZnJlZSBmcm9tIHRoZSByZWxlYXNlIGZ1
bmN0aW9uLgoKUmV2aWV3ZWQtYnk6IE5vcmFsZiBUcsO4bm5lcyA8bm9yYWxmQHRyb25uZXMub3Jn
PgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
Q2M6ICJOb3JhbGYgVHLDuG5uZXMiIDxub3JhbGZAdHJvbm5lcy5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3RpbnkvcmVwYXBlci5jIHwgNSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlu
eS9yZXBhcGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMKaW5kZXggZjVlYmNh
ZjdlZTNhLi5kZjU2NTRlZjUzZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3Jl
cGFwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMKQEAgLTMxLDYgKzMx
LDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0v
ZHJtX2dlbV9jbWFfaGVscGVyLmg+CiAjaW5jbHVkZSA8ZHJtL2RybV9nZW1fZnJhbWVidWZmZXJf
aGVscGVyLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9tYW5hZ2VkLmg+CiAjaW5jbHVkZSA8ZHJtL2Ry
bV9tb2Rlcy5oPgogI2luY2x1ZGUgPGRybS9kcm1fcmVjdC5oPgogI2luY2x1ZGUgPGRybS9kcm1f
cHJvYmVfaGVscGVyLmg+CkBAIC05MTAsMTMgKzkxMSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9tb2RlX2NvbmZpZ19mdW5jcyByZXBhcGVyX21vZGVfY29uZmlnX2Z1bmNzID0gewogCiBz
dGF0aWMgdm9pZCByZXBhcGVyX3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKIHsKLQlz
dHJ1Y3QgcmVwYXBlcl9lcGQgKmVwZCA9IGRybV90b19lcGQoZHJtKTsKLQogCURSTV9ERUJVR19E
UklWRVIoIlxuIik7CiAKIAlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkcm0pOwogCWRybV9kZXZf
ZmluaShkcm0pOwotCWtmcmVlKGVwZCk7CiB9CiAKIHN0YXRpYyBjb25zdCB1aW50MzJfdCByZXBh
cGVyX2Zvcm1hdHNbXSA9IHsKQEAgLTEwMjQsNiArMTAyMiw3IEBAIHN0YXRpYyBpbnQgcmVwYXBl
cl9wcm9iZShzdHJ1Y3Qgc3BpX2RldmljZSAqc3BpKQogCQlrZnJlZShlcGQpOwogCQlyZXR1cm4g
cmV0OwogCX0KKwlkcm1tX2FkZF9maW5hbF9rZnJlZShkcm0sIGVwZCk7CiAKIAlkcm1fbW9kZV9j
b25maWdfaW5pdChkcm0pOwogCWRybS0+bW9kZV9jb25maWcuZnVuY3MgPSAmcmVwYXBlcl9tb2Rl
X2NvbmZpZ19mdW5jczsKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
