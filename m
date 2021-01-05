Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E022EB264
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jan 2021 19:23:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE663893DB;
	Tue,  5 Jan 2021 18:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 855B1893DB;
 Tue,  5 Jan 2021 18:23:11 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id q75so434755wme.2;
 Tue, 05 Jan 2021 10:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XbsqBUoZzkjorKTH3umIQHuh6+k2QQ/7n59Ix1PhJD0=;
 b=bJGem1lDKecIaABSnPwBHtiIiy8vq9BJVCuRKqxAeQa9HXwXTekjgYSkZLqwe2zBoI
 V1NUaY2VRfIee75FuHGNgKCWAb03cpjuTy0dfywbslJauOLOF2xAo6+lJcYu8ZnWSc3r
 fjIoia7yCXIdolosNdGbdxeUjtyhz63PNNMzzysIiyrFUBD77lhA8vYvN+HxGqUDDsGx
 +673sosttQVLZEznUTckWqjENemS8W7ay4vkDL8wExM/C6PlozkSxrgKOqxsprPs4reO
 ysKotjDx9fhRboJYvqVA9Xl85aYbyrTmiuUs9A6FzdYk/WC27Yz267fj9NnaoIZ1C2YV
 dA9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XbsqBUoZzkjorKTH3umIQHuh6+k2QQ/7n59Ix1PhJD0=;
 b=Z+XUyiawbRvDngawO0cVC4w5oS2F8gdvHUuhH380/lFCMCZ7BsyQrolxwMGXwwwlip
 a0QvhZG9Uop2VCRsZAFIGmAbAhmiUq06n1amNwl3Grzx8nz+z2StFnExBKasL/SXPBaZ
 kIHMDXu+XbotfrjqIin74TivrK9VQ+6LDdaVYkztxu7E6gipX2bo6v/LaALX2D+844FE
 lU9NcK9H8yiyx179rYtZr8raK0TWsluJ5JOO88t3PhpyeBP2EdOnGn0/fKyL1OHgYswz
 3fzHGC6viYuGbdJFgItUA9iEXVR0xxdg8dHhng4eHb2EI4hRZHjAkKGGppuURoEDsUKH
 1dOg==
X-Gm-Message-State: AOAM532PA+tJg1tyuwmxYREjhYfduzwabjdGMFt788cNgxh12FVQD8Z9
 +w5Pqi4/WdfAyZP8KCLZDQY=
X-Google-Smtp-Source: ABdhPJy0arRNhltgt3OzLnTabxsGG2YIa0NoidVOctCDHTGRzC1bg9XMjzTZVCye/saVCG16uTfPQw==
X-Received: by 2002:a1c:f70f:: with SMTP id v15mr391756wmh.38.1609870990293;
 Tue, 05 Jan 2021 10:23:10 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:bc55:70b5:dce4:a5cb])
 by smtp.gmail.com with ESMTPSA id d9sm844587wrc.87.2021.01.05.10.23.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 10:23:09 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: bp@alien8.de,
	ray.huang@amd.com
Subject: [PATCH 1/2] drm/radeon: stop re-init the TTM page pool
Date: Tue,  5 Jan 2021 19:23:08 +0100
Message-Id: <20210105182309.1362-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RHJpdmVycyBhcmUgbm90IHN1cHBvc2VkIHRvIGluaXQgdGhlIHBhZ2UgcG9vbCBkaXJlY3RseSBh
bnkgbW9yZS4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyB8IDMg
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFk
ZW9uX3R0bS5jCmluZGV4IGQ0MzI4ZmY1Nzc1Ny4uMzViNzE1ZjgyZWQ4IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl90dG0uYwpAQCAtNzI5LDkgKzcyOSw2IEBAIGludCByYWRlb25fdHRtX2lu
aXQoc3RydWN0IHJhZGVvbl9kZXZpY2UgKnJkZXYpCiAJfQogCXJkZXYtPm1tYW4uaW5pdGlhbGl6
ZWQgPSB0cnVlOwogCi0JdHRtX3Bvb2xfaW5pdCgmcmRldi0+bW1hbi5iZGV2LnBvb2wsIHJkZXYt
PmRldiwgcmRldi0+bmVlZF9zd2lvdGxiLAotCQkgICAgICBkbWFfYWRkcmVzc2luZ19saW1pdGVk
KCZyZGV2LT5wZGV2LT5kZXYpKTsKLQogCXIgPSByYWRlb25fdHRtX2luaXRfdnJhbShyZGV2KTsK
IAlpZiAocikgewogCQlEUk1fRVJST1IoIkZhaWxlZCBpbml0aWFsaXppbmcgVlJBTSBoZWFwLlxu
Iik7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
