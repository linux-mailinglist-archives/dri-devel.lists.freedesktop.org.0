Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9181C8C6
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 14:32:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E235892FD;
	Tue, 14 May 2019 12:31:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBD5892EA;
 Tue, 14 May 2019 12:31:40 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id r7so1179393wrr.13;
 Tue, 14 May 2019 05:31:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GdOA44SxirHkAVChdVGJp77SKGhHA/5hptKvFRyO/X0=;
 b=ax0ydjYLjiy8zhO9cgyeg3ffcjpyK0Z1Qo+VsNR2pWaYsq/F9guSQ2QLikBwT0tFpA
 EyuYrTu1ngoRZyv2AMIHCiVfA9m4rgLMdUT/nQjJwaSIVIyTcH3qSocODgqIJhDN1Wd2
 mFQOYLUqgA5SYGU+7nmSttItTOSFXA33ov48PY9e0jrftI0MMYrx5DmhSv8OJsavAZUy
 KphRdwgxFTPWl1PmPFy3RuZdzs3L/2SnwBMAAGq9hu2j2PrdwmUKN4UGOCAmtwi5yzck
 d2+KnxGrk2jHaqUFQNQznDhAIjf2p8e2BMs6WCHoepZsXAJWTzcNqOPO57GprAWiFlqx
 8MxA==
X-Gm-Message-State: APjAAAU9kKxiKV3gQKlW+Woi1QY7sp/CIk+BOZQAtVNWQe+mgT5ZNg61
 86Un2ysOzGnTtZniGaKwAmPSwW12
X-Google-Smtp-Source: APXvYqxnGRtDv+871tYkXE3Ka3/ijWZ++g5NFmEZo4pvRVnMeY8ep3zi9JLdeB5OkksH0V6z4XgzTw==
X-Received: by 2002:a5d:65d1:: with SMTP id e17mr20890954wrw.65.1557837098495; 
 Tue, 14 May 2019 05:31:38 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7d94:f6f9:368b:5a3b])
 by smtp.gmail.com with ESMTPSA id n4sm6128704wmb.22.2019.05.14.05.31.37
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 05:31:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 10/11] drm/amd/display: use ttm_eu_reserve_buffers instead of
 amdgpu_bo_reserve v2
Date: Tue, 14 May 2019 14:31:26 +0200
Message-Id: <20190514123127.1650-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514123127.1650-1-christian.koenig@amd.com>
References: <20190514123127.1650-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=GdOA44SxirHkAVChdVGJp77SKGhHA/5hptKvFRyO/X0=;
 b=HVjqNk5ezU/QU9z41bITraauzTh/MBEcPW/zxU8fr8YIDBFTMbsgN4B+DkKt5wvx/k
 MsIeB+buta7Nm10p8YdaRk6feOSG9ogrMag3EIhfmSQDsHUjnPMI3vSpmvfc0s7p+hU/
 kR1FHvNMxDADEVA+2LauxydizEy9LkwbpDHEhDTaQGmsi4MBM2n9xUtD/w+CHdeprrWQ
 +nCN9Ktnlw6PjOEiQbhb8dvZKnEPZ6dtxWxDB8EGtXeFnu8jFxG18ZLkyYfwEx1rqWn1
 22hg9OiIwppdpwbLRsqAOJfSLeArfJcaZAwTirYPRPDd3IpnYyJA+BKwDu4gnjGAKhHS
 yPUw==
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
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IGQ3ZjlkMzk5ODY0MS4uMWM4NWVkNzcyMTYxIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9k
bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2Rt
LmMKQEAgLTQxNzYsNiArNDE3Niw5IEBAIHN0YXRpYyBpbnQgZG1fcGxhbmVfaGVscGVyX3ByZXBh
cmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFk
ZXY7CiAJc3RydWN0IGFtZGdwdV9ibyAqcmJvOwogCXN0cnVjdCBkbV9wbGFuZV9zdGF0ZSAqZG1f
cGxhbmVfc3RhdGVfbmV3LCAqZG1fcGxhbmVfc3RhdGVfb2xkOworCXN0cnVjdCBsaXN0X2hlYWQg
bGlzdDsKKwlzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZlciB0djsKKwlzdHJ1Y3Qgd3dfYWNxdWly
ZV9jdHggdGlja2V0OwogCXVpbnQ2NF90IHRpbGluZ19mbGFnczsKIAl1aW50MzJfdCBkb21haW47
CiAJaW50IHI7CkBAIC00MTkyLDkgKzQxOTUsMTcgQEAgc3RhdGljIGludCBkbV9wbGFuZV9oZWxw
ZXJfcHJlcGFyZV9mYihzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKIAlvYmogPSBuZXdfc3RhdGUt
PmZiLT5vYmpbMF07CiAJcmJvID0gZ2VtX3RvX2FtZGdwdV9ibyhvYmopOwogCWFkZXYgPSBhbWRn
cHVfdHRtX2FkZXYocmJvLT50Ym8uYmRldik7Ci0JciA9IGFtZGdwdV9ib19yZXNlcnZlKHJibywg
ZmFsc2UpOwotCWlmICh1bmxpa2VseShyICE9IDApKQorCUlOSVRfTElTVF9IRUFEKCZsaXN0KTsK
KworCXR2LmJvID0gJnJiby0+dGJvOworCXR2Lm51bV9zaGFyZWQgPSAxOworCWxpc3RfYWRkKCZ0
di5oZWFkLCAmbGlzdCk7CisKKwlyID0gdHRtX2V1X3Jlc2VydmVfYnVmZmVycygmdGlja2V0LCAm
bGlzdCwgZmFsc2UsIE5VTEwsIHRydWUpOworCWlmIChyKSB7CisJCWRldl9lcnIoYWRldi0+ZGV2
LCAiZmFpbCB0byByZXNlcnZlIGJvICglZClcbiIsIHIpOwogCQlyZXR1cm4gcjsKKwl9CiAKIAlp
ZiAocGxhbmUtPnR5cGUgIT0gRFJNX1BMQU5FX1RZUEVfQ1VSU09SKQogCQlkb21haW4gPSBhbWRn
cHVfZGlzcGxheV9zdXBwb3J0ZWRfZG9tYWlucyhhZGV2KTsKQEAgLTQyMDUsMjEgKzQyMTYsMjEg
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
