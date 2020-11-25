Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 725E72C40BA
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 13:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E270189333;
	Wed, 25 Nov 2020 12:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4759D6E8BD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 12:59:23 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id cq7so2450244edb.4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 04:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W/r11/6WCUQwqv3h1vsW8+kmBFrqaZ5NXUcw4FbTqSY=;
 b=Gu5njetBTbyLxOu5KAhuXCozMP1tuHY1MByyDF0zUpI6D2KXXCMuUgME/ECPzWO0Ye
 2oVfH/dBXGEvg8oiRpVfasVrxIar0a4FS5GI8EijK3rI1gfzZo0shAvhkwKiv5PTfD2L
 JYMaC+4ah2wn0rka32p0s6WQ7ICCKmLYGPzzayYPqRa1vn2XMYkeMeN4qPom6vE76wUd
 aGxhwtdHNqNXNOWv/X07u6/Z6xGSTdpHmfmKuwFNrfE5XEo7JZN884fi025EjSkfyb++
 HzUxBvdbD29wQkCE4tQ96adfS3pu2v69lxVUYueNIggtj9EyCiyRoX8EL9I/TwtrN0M6
 shOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=W/r11/6WCUQwqv3h1vsW8+kmBFrqaZ5NXUcw4FbTqSY=;
 b=N6ziEJNC5/lOAE4pFJ9gK0s9df0r5sZQjIjrHnme9O86V49Qr+szcy20pbWZWrajvq
 /e31BjsIBY8RYw+DZfKggXImqbsoxZ9DtXqamPJSK5y3Wij3/MyJuKILYIl0EuKHEMyi
 1vx2ZIj/2iO0jdADCPvDamrBg8U99yGR1r0rQmQI569eQegp/y2KJcjfPI14kEV3HYnh
 a5uCrRtuk5HEog0RPL/ziEY8HL7zLCSpqL4rE4tcQhM3rAfX//TeHwJWRyaJEzSjzmgN
 02DrsmsqpyxB47NOFf8SqWKRJZzjY2r0bAasxKghIAW8JGrtZASNnGlu39q6nw8ao5Uu
 1keQ==
X-Gm-Message-State: AOAM530Pmhkq/zxvDcWPCaIpB12vfN00z8/p7rC8ZeKEYBpzxkq++bZB
 wPzwmNCQ6q3lWKRWkExmqS34wV5zMro=
X-Google-Smtp-Source: ABdhPJzfL3OzL3CbOVEixqdcez8o/0mHkPUVT9Xj7Jfej2MIwuHGkfa2f6mZnfOtF1m/HlPX6HSVPA==
X-Received: by 2002:a50:9518:: with SMTP id u24mr3358083eda.124.1606309161691; 
 Wed, 25 Nov 2020 04:59:21 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:87d9:eeff:99f6:84c2])
 by smtp.gmail.com with ESMTPSA id z19sm1203188ejj.101.2020.11.25.04.59.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 04:59:21 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm/amdgpu: stop using pages with
 drm_prime_sg_to_page_addr_arrays
Date: Wed, 25 Nov 2020 13:59:14 +0100
Message-Id: <20201125125919.1372-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125125919.1372-1-christian.koenig@amd.com>
References: <20201125125919.1372-1-christian.koenig@amd.com>
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

VGhpcyBpcyBkZXByZWNhdGVkLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRl
eCBjNDM4ZDI5MGE2ZGIuLjAyNzQ4ZTAzMDMyMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYwpAQCAtOTE4LDggKzkxOCw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3R0bV90
dF9waW5fdXNlcnB0cihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAkJZ290byByZWxlYXNl
X3NnOwogCiAJLyogY29udmVydCBTRyB0byBsaW5lYXIgYXJyYXkgb2YgcGFnZXMgYW5kIGRtYSBh
ZGRyZXNzZXMgKi8KLQlkcm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyh0dG0tPnNnLCB0
dG0tPnBhZ2VzLAotCQkJCQkgZ3R0LT50dG0uZG1hX2FkZHJlc3MsIHR0bS0+bnVtX3BhZ2VzKTsK
Kwlkcm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyh0dG0tPnNnLCBOVUxMLCBndHQtPnR0
bS5kbWFfYWRkcmVzcywKKwkJCQkJIHR0bS0+bnVtX3BhZ2VzKTsKIAogCXJldHVybiAwOwogCkBA
IC0xMjY0LDcgKzEyNjQsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV90dG1fdHRfcG9wdWxhdGUoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJCQl0dG0tPnNnID0gc2d0OwogCQl9CiAKLQkJZHJt
X3ByaW1lX3NnX3RvX3BhZ2VfYWRkcl9hcnJheXModHRtLT5zZywgdHRtLT5wYWdlcywKKwkJZHJt
X3ByaW1lX3NnX3RvX3BhZ2VfYWRkcl9hcnJheXModHRtLT5zZywgTlVMTCwKIAkJCQkJCSBndHQt
PnR0bS5kbWFfYWRkcmVzcywKIAkJCQkJCSB0dG0tPm51bV9wYWdlcyk7CiAJCXJldHVybiAwOwot
LSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
