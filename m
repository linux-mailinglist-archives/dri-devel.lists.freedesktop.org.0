Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41248181A45
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 14:52:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77CE6E98E;
	Wed, 11 Mar 2020 13:52:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3316E987;
 Wed, 11 Mar 2020 13:52:08 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id s5so2734086wrg.3;
 Wed, 11 Mar 2020 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=flGhpt37sp9XD/VKJktequW1z/Op/EL2iIAVEZzSQBY=;
 b=oiScoyoPXcSLytkyJFtKR4RMXZnOUT43vPO6N1orKuuu8dPRVMLBJVk7aEKXvnNZy6
 6R4LyIBXhaLIPUbvls7Ix/3hJooN/+SVPeQ9W285fZX3GdvVYmPktv3rKvuzBV0HjC6i
 B+j8ze0EEgWt1wjvyy3mwyZ4kS0+yPcOGyq4jGWrnai/HUtrmCv8oBWcpcqFf7Kg4+a1
 hwOstEbOSSyJCV4Oa+UgABp4O+/h37vl7/EsFLeM66M6hpvW8ib6CKfEJ+bQvAxz/uEy
 uyvdk+xPLLIy1nnFcUU4jn/pdPDYj2/dllCAo4PQjw7pL/yTkzwroIUc2Ll13s5Qes15
 WKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=flGhpt37sp9XD/VKJktequW1z/Op/EL2iIAVEZzSQBY=;
 b=kfVE2w+HHAX6tGTrLFEjqloHbrkHuPx8Q+ka2cygQQd6rh8GlTc79JlTrSud9lxsAP
 gMJOv+UyCG8bFM+X9yay6Yr28hkgqOvBuDBsaH8gdzuiaA9/tpaY3IzG42AYSd9KPeWu
 jt78FMZfyj8+M/K1XvxVVQsI3FTCfXb0mSHjMHsH3lxUPHAyfNPcmccedToZxkFEJHQJ
 MTRLEcP7KbcsmGQZu1CJVWtw8hw+3862mdN0wSe0tIZfTlBCjBAP+xgAggvTpG+lbJDJ
 F0zq1vcyo66MwMq+Odkr9Ysgj9eWi3mVUI8G/hKApvlXLxVgkGD5ntE5R1E4gyGH0ZPj
 5wdw==
X-Gm-Message-State: ANhLgQ0l0RYCxH8yvK4F+879TBsPVTKE56fkjEoRFv1fYLuAjtqmJk9v
 omSx2uWyDs+2NW4FvdbJ6A4=
X-Google-Smtp-Source: ADFU+vvgmw4fd1NqGTYZeiUuoJEPOPj4Kn4u889b6V+DZSy4sQjKVUikTia6D/Jj32pCHPGIgHy5mA==
X-Received: by 2002:adf:c449:: with SMTP id a9mr4615828wrg.366.1583934727345; 
 Wed, 11 Mar 2020 06:52:07 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8dc:e796:e7da:a319])
 by smtp.gmail.com with ESMTPSA id 138sm3183811wmb.21.2020.03.11.06.52.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 06:52:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: David1.Zhou@amd.com, hch@infradead.org, jgg@ziepe.ca, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/6] drm/amdgpu: improve amdgpu_gem_info debugfs file
Date: Wed, 11 Mar 2020 14:51:58 +0100
Message-Id: <20200311135158.3310-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311135158.3310-1-christian.koenig@amd.com>
References: <20200311135158.3310-1-christian.koenig@amd.com>
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

Tm90ZSBpZiBhIGJ1ZmZlciB3YXMgaW1wb3J0ZWQgdXNpbmcgcGVlcjJwZWVyLgoKU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyB8IDQgKysrLQogMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV9nZW0uYwppbmRleCA0Mjc3MTI1YTc5ZWUuLmU0MjYwODExNWM5OSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2dlbS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYwpAQCAtMjksNiArMjksNyBAQAog
I2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3BhZ2VtYXAuaD4KICNp
bmNsdWRlIDxsaW51eC9wY2kuaD4KKyNpbmNsdWRlIDxsaW51eC9kbWEtYnVmLmg+CiAKICNpbmNs
dWRlIDxkcm0vYW1kZ3B1X2RybS5oPgogI2luY2x1ZGUgPGRybS9kcm1fZGVidWdmcy5oPgpAQCAt
ODU0LDcgKzg1NSw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RlYnVnZnNfZ2VtX2JvX2luZm8oaW50
IGlkLCB2b2lkICpwdHIsIHZvaWQgKmRhdGEpCiAJYXR0YWNobWVudCA9IFJFQURfT05DRShiby0+
dGJvLmJhc2UuaW1wb3J0X2F0dGFjaCk7CiAKIAlpZiAoYXR0YWNobWVudCkKLQkJc2VxX3ByaW50
ZihtLCAiIGltcG9ydGVkIGZyb20gJXAiLCBkbWFfYnVmKTsKKwkJc2VxX3ByaW50ZihtLCAiIGlt
cG9ydGVkIGZyb20gJXAlcyIsIGRtYV9idWYsCisJCQkgICBhdHRhY2htZW50LT5wZWVyMnBlZXIg
PyAiIFAyUCIgOiAiIik7CiAJZWxzZSBpZiAoZG1hX2J1ZikKIAkJc2VxX3ByaW50ZihtLCAiIGV4
cG9ydGVkIGFzICVwIiwgZG1hX2J1Zik7CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
