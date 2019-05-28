Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C50DD2CBD5
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:26:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1AF6E243;
	Tue, 28 May 2019 16:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741D66E229;
 Tue, 28 May 2019 16:26:06 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h1so6796771wro.4;
 Tue, 28 May 2019 09:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=49GsfZk1dpzhJiqtUuiObPImRG0Na/QMiVlcztrt2WE=;
 b=bvYwUWHqAc7UK0Cx0aeVtUYK4f1Pnxv+bR75WqsjdlNyL/aZnyVpTwfBAGml9v3AWN
 TWJIFkYAAwrbIUU4R4+C9LDlUmR9PnEwan83prm/OD/cgEgJBAN5vureFKrP+USL2H17
 5UCzsI/J4fQZcOOFPA+WaQO5RfZTKaXpvcRB9H4qwcI4c9RjfLwZNz6c8ok2RyoaUlR4
 EGID4hu5a8oyrV4QPI67hdG2lZkh4vSrbH0nfO2UetOSag2+xdrg3JAneRaZeqibK2dG
 ooeI8nkaQTcUPyQzEF+oUA6+HIwwhyRAQdveztDidg7kSNqjvoEJcwHPDAxL1k/P4tT6
 QdvQ==
X-Gm-Message-State: APjAAAWXJMYpmY89i8FJo5Y5ZYeu9eK9RNQzmWP8J9CtPqrYCjpo+/9k
 ghnkmBAZkKgVwrFzYYAxkllpchfb
X-Google-Smtp-Source: APXvYqw4N1Vl8KcqDy83MYGdz7C63z4nvPGc1kbS9aJOtiSvswfPnj+PNenLrrAYccqUN7tJq9ZbLw==
X-Received: by 2002:a5d:6406:: with SMTP id z6mr36852259wru.87.1559060765145; 
 Tue, 28 May 2019 09:26:05 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3163:ab92:73d9:6693])
 by smtp.gmail.com with ESMTPSA id f10sm28835470wrg.24.2019.05.28.09.26.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 09:26:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: David1.Zhou@amd.com, Marek.Olsak@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 07/10] drm/amd/display: use ttm_eu_reserve_buffers instead of
 amdgpu_bo_reserve v2
Date: Tue, 28 May 2019 18:25:54 +0200
Message-Id: <20190528162557.1280-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528162557.1280-1-christian.koenig@amd.com>
References: <20190528162557.1280-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=49GsfZk1dpzhJiqtUuiObPImRG0Na/QMiVlcztrt2WE=;
 b=PwwzXaiE2ghr+kOP/DbhLrhRh/E/6W6JfNUJ4Z3tq1JCCrgGkDoib8XIcoe724EjeO
 AVi+ee5i837C3Hz5lWZ2ZUjP83rtwYeAY3MXLQBbDSS90/6RulqnSbWQzCH+lA/u31mr
 cDd9e819G12iN+YOXTRZ0fqPv9LVxyaKkXQwrowZP1v88gvmv37NooIUhKoZfg8DOFOo
 TTTMvAEhYjbmRaMBzyPv0ktO8lNsQmyXcNemRRCJxKpXy1HRJxVGkPNIUN3pvVFfDw/M
 OqBLndbRuVVi9k78XOaQF3faFDpDp1cFWYGGbVFq9wgXKAF/m/SZDWKTFF4SF7HK/INe
 gxag==
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
