Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A464372AFD
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:27:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 201AC6EB07;
	Tue,  4 May 2021 13:27:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C4C6EAE1
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:27:41 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id n25so10427704edr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 06:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=a00OVmFQiVFIrLKs9GtQOtW8ShxzREj5VHpB8jNiuA0=;
 b=XQ7tMDkQW45I2Nrev299RMjLvNtEC1Zpg5q2VV3uVvA8QVmq1mbHNcR8z5tp0JoX8t
 yd/5BfuESgOoFKMnuNlBkrvTyc+8LSFIg73onheZVGaYymnWpmU6sqnkT7e4B2nns1YY
 ZhBP0dorCKGh0cc+mLELtI2q00e45VW8RX0aba1lee1BreRlgxzrjyG+15OvBBJDD+ox
 WjpJAf5XZcILETJjU+yLU36L7ctBwCnJVh3i8oKeWbOu7jwlHgRzF5buzIPiSlfYHsrF
 pQi9Buep+zFiwJ/qfIaFOQS2MBjbaKf6S7WnAocLGmuTef3alViq4zFUZxBSQRQeibep
 ZBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a00OVmFQiVFIrLKs9GtQOtW8ShxzREj5VHpB8jNiuA0=;
 b=bLuaqFMSbHNHAjlqHZWrEeJAQz31FU3lLRqDSZni06IPUG5eCcdAjvqLXr3mzBymA6
 XRzN4mti5TfdJXeZYVJbNi/nmXQlh/NXQHuDZzU0XgSrvT2KIgGhCVQWrWiSjYG0m8j1
 f7k3YlZi90Ds+YkD29nnYRTxt84cCwqYgixvt7+KSoz0S8RIJ0pzuJw6X23B9JQQ/jdO
 WrP2QEe2DGCdSgNnXFECRe3cjM8qp+i0mMyRfi2u5azBP5CA2OpH/axA+ALK+/ZVr5p1
 Hm+moK5b8t/RhKdfAghPIdNBUe4i7rZEO+MzrPFIe9zeLdfBYPHoPdkh3+nXiCmgD08l
 8Ujw==
X-Gm-Message-State: AOAM533HfL6F1bCKr3FzY5ykZ0PBXeQVmX27+EaVGMhyfQF0gUatTFvc
 9oRqNgnqI5+pnsGdXse2SJv3VQW+uWk=
X-Google-Smtp-Source: ABdhPJxbu0Gra+//PHLsI4+d2fKxO/iXwotuFgpWPViyUXV4ufgYNzfr4WbkIutGWVy0HQHnt1ZWBw==
X-Received: by 2002:a05:6402:2548:: with SMTP id
 l8mr6584542edb.208.1620134859984; 
 Tue, 04 May 2021 06:27:39 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4a5c:1943:c73d:c4c9])
 by smtp.gmail.com with ESMTPSA id q18sm3114036edd.3.2021.05.04.06.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:27:39 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 12/12] drm/v3d: add DMA-buf user fence support
Date: Tue,  4 May 2021 15:27:29 +0200
Message-Id: <20210504132729.2046-13-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504132729.2046-1-christian.koenig@amd.com>
References: <20210504132729.2046-1-christian.koenig@amd.com>
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

SnVzdCBhZGQgdGhlIGNhbGwgYmVmb3JlIHRha2luZyBsb2Nrcy4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdjNkL3YzZF9nZW0uYyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2VtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdjNkL3YzZF9nZW0uYwppbmRleCA0ZWIzNTQyMjY5NzIuLjdjNDUyOTJjNjQx
YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3YzZC92M2RfZ2VtLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3YzZC92M2RfZ2VtLmMKQEAgLTM0NSw2ICszNDUsMTIgQEAgdjNkX2xvb2t1cF9i
b3Moc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAl9CiAJc3Bpbl91bmxvY2soJmZpbGVfcHJpdi0+
dGFibGVfbG9jayk7CiAKKwlmb3IgKGkgPSAwOyBpIDwgam9iLT5ib19jb3VudDsgaSsrKSB7CisJ
CXJldCA9IGRtYV9yZXN2X3N5bmNfdXNlcl9mZW5jZShqb2ItPmJvW2ldLT5yZXN2KTsKKwkJaWYg
KHJldCkKKwkJCWJyZWFrOworCX0KKwogZmFpbDoKIAlrdmZyZWUoaGFuZGxlcyk7CiAJcmV0dXJu
IHJldDsKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
