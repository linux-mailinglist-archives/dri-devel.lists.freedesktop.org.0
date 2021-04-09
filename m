Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16681359F73
	for <lists+dri-devel@lfdr.de>; Fri,  9 Apr 2021 15:01:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02066E49D;
	Fri,  9 Apr 2021 13:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FD286EC18
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Apr 2021 13:01:16 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id g17so5753336ejp.8
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Apr 2021 06:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kk8CYvoO7IlHoMfqxYXIXVHq7Bdmy/3a8ila7aVfSws=;
 b=LX3oaEHEGcb5geyYns9EmLQRAcO1z9Cg5pOe0ryqg0c9+fyVr3GjtGdLQHGLLxI2W8
 ztQYtLqzL0klCmJCGli9erEMHCPJH7exqb9hhbtEyP/KwdzfWIxUz+r+IyCJQHvwh4Q6
 pU/TzdP/f4K1Hg586DzSOMjPW9F1Z7RivmtzcoVYMHC9d7dN36LDxq9MyX9AqJm7Ey18
 rNDergfdOteeCVMH43ZvFk4X9CYSTduGmn2o3TuxfPUXxuWb537WEjqIHSB5jiBs7HWY
 XTYqq6OcQGNeJekZGvA5AdOcX7Z5N+fuBA3CwthSccIXY7HPdx1GeJns0XXjBNP1z9JT
 DYiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kk8CYvoO7IlHoMfqxYXIXVHq7Bdmy/3a8ila7aVfSws=;
 b=XDkZ7a7iKuMCbH5FLY0ImAzit45tDQwfIvz+U5pO9aiyVV52MjCRGobZ8Fm3fm+ott
 QsR0iKnL5xdopFPJ9bK7JAtfJwbqtAFxQPWCwszX+F1ZvAvt5gyF+dOKvDWfpeEASEDK
 WpeOt7uGmXrATdoh1uxLrzDOee2CmPfhAm39XfzzVhiLrualdo4J+Ci6vFLPlHq/eSbd
 liBN8mewGTiL7whZvkRgVG/vuxnSO6p/SucJ//b0FGKvybNjToMGdgefQdyXya7yUJWI
 2I9yf7uESckKlKoaPrNNPbiVI3tHN4aHX+LYK9puD7ZSO7rAT87xVsHM4EbBXEreJDce
 HpSw==
X-Gm-Message-State: AOAM532YW28UrQiGIMvxDggJheWf9zZa/L1vRYqVUDuLw0+Y4ohCvmYZ
 VJceyPCOdoJFFO//Y2ufVBDBrOIG5IA=
X-Google-Smtp-Source: ABdhPJzfy47eT2e9pPlzXnvM+vRalLrFvXbrsXlr6KRUKhcrsHHjRnOcC9E2hMhCD2qyA2FBkR2+vA==
X-Received: by 2002:a17:906:d284:: with SMTP id
 ay4mr16187216ejb.448.1617973275068; 
 Fri, 09 Apr 2021 06:01:15 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:228e:f109:19e6:f9c6])
 by smtp.gmail.com with ESMTPSA id r17sm1455072edx.1.2021.04.09.06.01.13
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 06:01:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/ttm: fix return value check
Date: Fri,  9 Apr 2021 15:01:12 +0200
Message-Id: <20210409130113.1459-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGZ1bmN0aW9uIHJldHVybnMgdGhlIG51bWJlciBvZiBzd2FwcGVkIHBhZ2VzIGhlcmUuIE9u
bHkgYWJvcnQgd2hlbiB3ZSBnZXQKYSBuZWdhdGl2ZSBlcnJvciBjb2RlLgoKU2lnbmVkLW9mZi1i
eTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX3R0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV90dC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwppbmRleCA3ZGNkM2ZiNjk0OTUu
LjdkNDc5MDk1ZGNmOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCkBAIC0zMjYsNyArMzI2LDcgQEAgaW50
IHR0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwKIAkgICAgICAgdHRtX2Rt
YTMyX3BhZ2VzX2xpbWl0KSB7CiAKIAkJcmV0ID0gdHRtX2dsb2JhbF9zd2Fwb3V0KGN0eCwgR0ZQ
X0tFUk5FTCk7Ci0JCWlmIChyZXQpCisJCWlmIChyZXQgPCAwKQogCQkJZ290byBlcnJvcjsKIAl9
CiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
