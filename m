Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8612DCE9
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 14:27:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3332A6E2F8;
	Wed, 29 May 2019 12:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960736E2EB;
 Wed, 29 May 2019 12:27:10 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t5so1476941wmh.3;
 Wed, 29 May 2019 05:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=49GsfZk1dpzhJiqtUuiObPImRG0Na/QMiVlcztrt2WE=;
 b=aBnZ8MneLYdWZ5247FA5TWHGZ0xyztbpusQBKp9q1DizQHoLp6Ry4wbSRtiKi2Vc2e
 xtkSkgL8gHv6ZCrwUyqd1VKIO1ieJM1nIhG9U4EiarQywG1QHPfcxr9cDNsRDoSJ28Ph
 oHi+fycw5vQ/JgRyTF9ILyxdvO+DtmcO+LwPC6y7CpWXdEqevk6hboFAomqFAwTUdopw
 rhEd6f4zYmcKbgBuyGHnOO8jhqT2QZOqfIx/bFD3jlWltNcXiQ4iCmNwilpMcj9r/wXB
 HQYJixHH12UfxzzUSYni7gwgxakc760yAEQjjByin4q8OC9huBTf/s98F+Nt6CnWqys1
 gX1g==
X-Gm-Message-State: APjAAAUnmDYEmpNzOndQfJzM2iuQSwTPTzZ2bPI42vif731lcg81OpHw
 7uqJcxdu8DVhmS8G56jTyTiSzRSq
X-Google-Smtp-Source: APXvYqy3Z6JynDVFcYasmaU3n4RJ4qbHRZ6RJoJG3TMe9FD6R1zhD8WyBAoTiw/t6mi8qJfXcr6sPQ==
X-Received: by 2002:a1c:480a:: with SMTP id v10mr2834926wma.120.1559132828699; 
 Wed, 29 May 2019 05:27:08 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1ea:e785:ab1c:e514])
 by smtp.gmail.com with ESMTPSA id z25sm6211343wmi.5.2019.05.29.05.27.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 05:27:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/10] drm/amd/display: use ttm_eu_reserve_buffers instead of
 amdgpu_bo_reserve v2
Date: Wed, 29 May 2019 14:26:59 +0200
Message-Id: <20190529122702.13035-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190529122702.13035-1-christian.koenig@amd.com>
References: <20190529122702.13035-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=49GsfZk1dpzhJiqtUuiObPImRG0Na/QMiVlcztrt2WE=;
 b=Ebap3NrBZrxLvcmVmuMUc7oRWCenvnCAlj8rspF66oD2lcLbKUfc9X3u1hGAeAah2w
 jIjkCKbRYiYt9g6POP4d/8ooPCvjHkQh42yvPvJKfTe+5hjJajvlQJ8LSAChyS0QVdB7
 4aj250KRg5jYIjbwvbRwOsimuASn4gmKmjsAJCG9lkZlTDS7rhEB8Bizt7e7FChy8RFC
 Pewc9VQaAk7REYcJG5yuyouwiG1iXsFJWdpurX0RZfp6Rf+yWrzig0MmG6hWfykNaxu3
 66Gkml4k7kGUTnAnhG8HgRtAVT6hpyKgcZDaDSs81horSWIYqEusKstjFfg6QsnXyHWU
 5PQg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KCmFkZCB0aWNrZXQgZm9y
IGRpc3BsYXkgYm8sIHNvIHRoYXQgaXQgY2FuIHByZWVtcHQgYnVzeSBiby4KCnYyOiBmaXggc3R1
cGlkIHJlYmFzZSBlcnJvcgoKQ2hhbmdlLUlkOiBJOWYwMzFjZGNjODI2N2RlMDBlODE5YWUzMDNi
YWEwYTUyZGY4ZWJiOQpTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBh
bWQuY29tPgpSZXZpZXdlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0Bh
bWQuY29tPgotLS0KIC4uLi9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0u
YyB8IDIxICsrKysrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlz
cGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDRhMTc1NWJjZTk2Yy4uNTZmMzIwZjNmZDcyIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKQEAgLTQxODIsNiArNDE4Miw5IEBAIHN0YXRpYyBpbnQgZG1fcGxhbmVfaGVscGVyX3ByZXBh
cmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXY7CiAJc3RydWN0IGFtZGdwdV9ibyAqcmJvOwogCXN0cnVjdCBkbV9wbGFuZV9zdGF0ZSAqZG1f
cGxhbmVfc3RhdGVfbmV3LCAqZG1fcGxhbmVfc3RhdGVfb2xkOworCXN0cnVjdCBsaXN0X2hlYWQg
bGlzdDsKKwlzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZlciB0djsKKwlzdHJ1Y3Qgd3dfYWNxdWly
ZV9jdHggdGlja2V0OwogCXVpbnQ2NF90IHRpbGluZ19mbGFnczsKIAl1aW50MzJfdCBkb21haW47
CiAJaW50IHI7CkBAIC00MTk4LDkgKzQyMDEsMTcgQEAgc3RhdGljIGludCBkbV9wbGFuZV9oZWxw
ZXJfcHJlcGFyZV9mYihzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAlvYmogPSBuZXdfc3RhdGUt
PmZiLT5vYmpbMF07CiAJcmJvID0gZ2VtX3RvX2FtZGdwdV9ibyhvYmopOwogCWFkZXYgPSBhbWRn
cHVfdHRtX2FkZXYocmJvLT50Ym8uYmRldik7Ci0JciA9IGFtZGdwdV9ib19yZXNlcnZlKHJibywg
ZmFsc2UpOwotCWlmICh1bmxpa2VseShyICE9IDApKQorCUlOSVRfTElTVF9IRUFEKCZsaXN0KTsK
KworCXR2LmJvID0gJnJiby0+dGJvOworCXR2Lm51bV9zaGFyZWQgPSAxOworCWxpc3RfYWRkKCZ0
di5oZWFkLCAmbGlzdCk7CisKKwlyID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmdGlja2V0LCAm
bGlzdCwgZmFsc2UsIE5VTEwsIHRydWUpOworCWlmIChyKSB7CisJCWRldl9lcnIoYWRldi0+ZGV2
LCAiZmFpbCB0byByZXNlcnZlIGJvICglZClcbiIsIHIpOwogCQlyZXR1cm4gcjsKKwl9CiAKIAlp
ZiAocGxhbmUtPnR5cGUgIT0gRFJNX1BMQU5FX1RZUEVfQ1VSU09SKQogCQlkb21haW4gPSBhbWRn
cHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucyhhZGV2KTsKQEAgLTQyMTEsMjEgKzQyMjIsMjEg
QEAgc3RhdGljIGludCBkbV9wbGFuZV9oZWxwZXJfcHJlcGFyZV9mYihzdHJ1Y3QgZHJtX3BsYW5l
ICpwbGFuZSwKIAlpZiAodW5saWtlbHkociAhPSAwKSkgewogCQlpZiAociAhPSAtRVJFU1RBUlRT
WVMpCiAJCQlEUk1fRVJST1IoIkZhaWxlZCB0byBwaW4gZnJhbWVidWZmZXIgd2l0aCBlcnJvciAl
ZFxuIiwgcik7Ci0JCWFtZGdwdV9ib191bnJlc2VydmUocmJvKTsKKwkJdHRtX2V1X2JhY2tvZmZf
cmVzZXJ2YXRpb24oJnRpY2tldCwgJmxpc3QpOwogCQlyZXR1cm4gcjsKIAl9CiAKIAlyID0gYW1k
Z3B1X3R0bV9hbGxvY19nYXJ0KCZyYm8tPnRibyk7CiAJaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsK
IAkJYW1kZ3B1X2JvX3VucGluKHJibyk7Ci0JCWFtZGdwdV9ib191bnJlc2VydmUocmJvKTsKKwkJ
dHRtX2V1X2JhY2tvZmZfcmVzZXJ2YXRpb24oJnRpY2tldCwgJmxpc3QpOwogCQlEUk1fRVJST1Io
IiVwIGJpbmQgZmFpbGVkXG4iLCByYm8pOwogCQlyZXR1cm4gcjsKIAl9CiAKIAlhbWRncHVfYm9f
Z2V0X3RpbGluZ19mbGFncyhyYm8sICZ0aWxpbmdfZmxhZ3MpOwogCi0JYW1kZ3B1X2JvX3VucmVz
ZXJ2ZShyYm8pOworCXR0bV9ldV9iYWNrb2ZmX3Jlc2VydmF0aW9uKCZ0aWNrZXQsICZsaXN0KTsK
IAogCWFmYi0+YWRkcmVzcyA9IGFtZGdwdV9ib19ncHVfb2Zmc2V0KHJibyk7CiAKLS0gCjIuMTcu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
