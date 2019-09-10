Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9573EAE6C9
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 11:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA4236E875;
	Tue, 10 Sep 2019 09:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 620B46E86B;
 Tue, 10 Sep 2019 09:24:34 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l16so18575695wrv.12;
 Tue, 10 Sep 2019 02:24:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6VTFCNqi37keSqOIkP5V0mcdmUG1ydoVR8S4lznllc=;
 b=nEWJsITshde+tJ4DTqdzXEhYg53x5MlPDwVLOCs+vqRJnmIPjReHfJ80TNaJkXejkN
 HE9/qcf41l1ssngR6hWsa1VMmzshryy1JKORTyEWYdS5r35aS9Y++stTDUbkDBTILUrb
 LZGkmmAIBxfCam24neUCAjyEH8sURwUjIiwOqMVAalmfQFpl+0+IlIos1iU0u9jO28Vi
 fXiid/Kx4MYN2K6+2e4WEi74gJlNzxRvNxHzFxm0app/FvKKH0WWdjCiNhnFFuy6dQ03
 PoWZoSrqZQbCnQIoWWeRem0lcdh0Ik2ia2HjEUQKCVenRRAlI2eww0IO5AmSPL6wuDXG
 tU4Q==
X-Gm-Message-State: APjAAAVQ0sT0pnr/4xApQldilj/L5BmOCepodCtvQPQV3/Fr7BrEpYxY
 Wkt6Rb4oZLyNMkN4aJuUPYsg9Gck
X-Google-Smtp-Source: APXvYqyK8wXKlRqxk5aRFtdUg3Z6XJFDPvmzHKOSkbiyCnWJbDyFWiOx8avmaoYIinGOZo4SH3EZaA==
X-Received: by 2002:a05:6000:1c3:: with SMTP id
 t3mr26372987wrx.76.1568107472847; 
 Tue, 10 Sep 2019 02:24:32 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1cd:7d57:6942:ab1b])
 by smtp.gmail.com with ESMTPSA id e12sm6107036wrw.37.2019.09.10.02.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 02:24:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/9] drm/ttm: return -EBUSY on pipelining with no_gpu_wait
Date: Tue, 10 Sep 2019 11:24:23 +0200
Message-Id: <20190910092431.37471-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q6VTFCNqi37keSqOIkP5V0mcdmUG1ydoVR8S4lznllc=;
 b=ODftp1LngmztYylo6YQQRGvHLoStOCAxcE9ar7/BIeHd3BQaIowQscXrwo64rKjbhX
 XHpFTMtDY4hnN1KWgp4SM4DOcjYqCcT9YXEys4mTN4KTVDgSBvhFX3XrVz0Xln67e7sP
 ijpztAilbR+fFmEoFdOQn5k4YEKC48JNtllDuNJ8XPcbTcr1H8YHa3ecab1PvYyQ87wq
 4P+kd2RhIOu+45pKKgHrJUzkH6+OnAd/g0oTqVhKTIEElFnvOohrbjDKslsFT4XWfr2W
 sRCBuKZQXGzUNVeu4hKJ2Ei4UBYF/Y1QyEz8E4j1T19d3LShsnDcN29hsvKMJ2uPe9EH
 GCGQ==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2V0dGluZyB0aGUgbm9fZ3B1X3dhaXQgZmxhZyBtZWFucyB0aGF0IHRoZSBhbGxvY2F0ZSBCTyBt
dXN0IGJlIGF2YWlsYWJsZQppbW1lZGlhdGVseSBhbmQgd2UgY2FuJ3Qgd2FpdCBmb3IgYW55IEdQ
VSBvcGVyYXRpb24gdG8gZmluaXNoLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpBY2tlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4
Lkt1ZWhsaW5nQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDQz
ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDI1
IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCmluZGV4IDIw
NzBlOGE1N2VkOC4uMjg5OTcwMjEzOWZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKQEAgLTkyNCw3ICs5
MjQsOCBAQCBFWFBPUlRfU1lNQk9MKHR0bV9ib19tZW1fcHV0KTsKICAqLwogc3RhdGljIGludCB0
dG1fYm9fYWRkX21vdmVfZmVuY2Uoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJCQkg
c3RydWN0IHR0bV9tZW1fdHlwZV9tYW5hZ2VyICptYW4sCi0JCQkJIHN0cnVjdCB0dG1fbWVtX3Jl
ZyAqbWVtKQorCQkJCSBzdHJ1Y3QgdHRtX21lbV9yZWcgKm1lbSwKKwkJCQkgYm9vbCBub193YWl0
X2dwdSkKIHsKIAlzdHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZTsKIAlpbnQgcmV0OwpAQCAtOTMzLDE5
ICs5MzQsMjIgQEAgc3RhdGljIGludCB0dG1fYm9fYWRkX21vdmVfZmVuY2Uoc3RydWN0IHR0bV9i
dWZmZXJfb2JqZWN0ICpibywKIAlmZW5jZSA9IGRtYV9mZW5jZV9nZXQobWFuLT5tb3ZlKTsKIAlz
cGluX3VubG9jaygmbWFuLT5tb3ZlX2xvY2spOwogCi0JaWYgKGZlbmNlKSB7Ci0JCXJlc2VydmF0
aW9uX29iamVjdF9hZGRfc2hhcmVkX2ZlbmNlKGJvLT5yZXN2LCBmZW5jZSk7CisJaWYgKCFmZW5j
ZSkKKwkJcmV0dXJuIDA7CiAKLQkJcmV0ID0gcmVzZXJ2YXRpb25fb2JqZWN0X3Jlc2VydmVfc2hh
cmVkKGJvLT5yZXN2LCAxKTsKLQkJaWYgKHVubGlrZWx5KHJldCkpIHsKLQkJCWRtYV9mZW5jZV9w
dXQoZmVuY2UpOwotCQkJcmV0dXJuIHJldDsKLQkJfQorCWlmIChub193YWl0X2dwdSkKKwkJcmV0
dXJuIC1FQlVTWTsKKworCXJlc2VydmF0aW9uX29iamVjdF9hZGRfc2hhcmVkX2ZlbmNlKGJvLT5y
ZXN2LCBmZW5jZSk7CiAKLQkJZG1hX2ZlbmNlX3B1dChiby0+bW92aW5nKTsKLQkJYm8tPm1vdmlu
ZyA9IGZlbmNlOworCXJldCA9IHJlc2VydmF0aW9uX29iamVjdF9yZXNlcnZlX3NoYXJlZChiby0+
cmVzdiwgMSk7CisJaWYgKHVubGlrZWx5KHJldCkpIHsKKwkJZG1hX2ZlbmNlX3B1dChmZW5jZSk7
CisJCXJldHVybiByZXQ7CiAJfQogCisJZG1hX2ZlbmNlX3B1dChiby0+bW92aW5nKTsKKwliby0+
bW92aW5nID0gZmVuY2U7CiAJcmV0dXJuIDA7CiB9CiAKQEAgLTk3NCw3ICs5NzgsNyBAQCBzdGF0
aWMgaW50IHR0bV9ib19tZW1fZm9yY2Vfc3BhY2Uoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bywKIAkJCXJldHVybiByZXQ7CiAJfSB3aGlsZSAoMSk7CiAKLQlyZXR1cm4gdHRtX2JvX2FkZF9t
b3ZlX2ZlbmNlKGJvLCBtYW4sIG1lbSk7CisJcmV0dXJuIHR0bV9ib19hZGRfbW92ZV9mZW5jZShi
bywgbWFuLCBtZW0sIGN0eC0+bm9fd2FpdF9ncHUpOwogfQogCiBzdGF0aWMgdWludDMyX3QgdHRt
X2JvX3NlbGVjdF9jYWNoaW5nKHN0cnVjdCB0dG1fbWVtX3R5cGVfbWFuYWdlciAqbWFuLApAQCAt
MTExNiwxMyArMTEyMCwxNiBAQCBpbnQgdHRtX2JvX21lbV9zcGFjZShzdHJ1Y3QgdHRtX2J1ZmZl
cl9vYmplY3QgKmJvLAogCQlpZiAodW5saWtlbHkocmV0KSkKIAkJCWdvdG8gZXJyb3I7CiAKLQkJ
aWYgKG1lbS0+bW1fbm9kZSkgewotCQkJcmV0ID0gdHRtX2JvX2FkZF9tb3ZlX2ZlbmNlKGJvLCBt
YW4sIG1lbSk7Ci0JCQlpZiAodW5saWtlbHkocmV0KSkgewotCQkJCSgqbWFuLT5mdW5jLT5wdXRf
bm9kZSkobWFuLCBtZW0pOwotCQkJCWdvdG8gZXJyb3I7Ci0JCQl9Ci0JCQlyZXR1cm4gMDsKKwkJ
aWYgKCFtZW0tPm1tX25vZGUpCisJCQljb250aW51ZTsKKworCQlyZXQgPSB0dG1fYm9fYWRkX21v
dmVfZmVuY2UoYm8sIG1hbiwgbWVtLCBjdHgtPm5vX3dhaXRfZ3B1KTsKKwkJaWYgKHVubGlrZWx5
KHJldCkpIHsKKwkJCSgqbWFuLT5mdW5jLT5wdXRfbm9kZSkobWFuLCBtZW0pOworCQkJaWYgKHJl
dCA9PSAtRUJVU1kpCisJCQkJY29udGludWU7CisKKwkJCWdvdG8gZXJyb3I7CiAJCX0KIAl9CiAK
LS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
