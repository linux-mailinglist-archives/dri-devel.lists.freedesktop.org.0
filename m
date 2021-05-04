Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7DD372AFC
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96BA6EADF;
	Tue,  4 May 2021 13:27:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BC06EADF
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:27:40 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id i24so10402706edy.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 06:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dVwThiEn/ljuoFVcp5Ylewu+yy+mhLucc4UosPxJTJ0=;
 b=GySvzkbL3w4GDn251M6dCBfVoD37VcycNTbwnNg2KNtfMRimlwCNXjFUj6lp24fJyP
 zyYukTuAF9HardZKPUcdSinSSfYYF9JX8iRptwsIyMJ9tbevn3SNblL2DgGJkFHY7sPG
 cF8QkvCyMWbsbEFh/pYGy6TMjzoKmPyMGw13cq/klsLa44Xs6+4YzQDjL6zL4InqTpT7
 iueqUIuCfE/j4DPQx/HgUOKBxdO1UYsZ6Apy02CuWo6YCb2U5SEOPw+gRRsq3sFw9YRQ
 BwzQuaXq0GxNTCGpiWUTItjG7XPMEoRiWlytGdTx7Qc/rCM1d5e1qujgO+/EGFVbJ3UB
 jsrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dVwThiEn/ljuoFVcp5Ylewu+yy+mhLucc4UosPxJTJ0=;
 b=GiOTxaMuSRkTd1A7a5L0QUdEsfW1vsGzTOa5vwfOFfNhqypvivNOyTN76CNgltxsk6
 vb7W4sDExdN3bcJNXikGxrb2BErIt01Y4749sPnhwwKoqAZaYiLEWkMZ2/8CVtHwf0WB
 P2aNMaUqCadVjQRzf5mVckDYBoU0LcV+S4ftXRuwm8Zuk9Yfm9e1SFAPgEVuwnEVF0Jm
 x/L/STt6rOtD5X3eQEYVlA+CmbnC16KVT1kFFJmTpGiZS8W/9t+fIsPBKM5+qYP4Rdd2
 aywYEwss5k9oTGqkrI4ZG3d9h2nHZKEjM54/n1yGEciugvQBV5+HQakDKr6fxdkJ5War
 IlUA==
X-Gm-Message-State: AOAM532H4SeSVvMJhh/EVsMkyRKWpW8Kp2TFB1n8/ezSqKa5GSeLS3ap
 leJdqqhUI48s5No2LhdKnCUmXmfA3N4=
X-Google-Smtp-Source: ABdhPJww4CaAjZkAo9y1uOJucDJ0djXm9W+Zlx8BKhpvYG3VjbjiNWY+YzRZ/KZxecRME8abJcBWVQ==
X-Received: by 2002:a05:6402:b55:: with SMTP id
 bx21mr26328761edb.281.1620134859081; 
 Tue, 04 May 2021 06:27:39 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4a5c:1943:c73d:c4c9])
 by smtp.gmail.com with ESMTPSA id q18sm3114036edd.3.2021.05.04.06.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:27:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/12] drm/radeon: add DMA-buf user fence support
Date: Tue,  4 May 2021 15:27:28 +0200
Message-Id: <20210504132729.2046-12-christian.koenig@amd.com>
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
dS9kcm0vcmFkZW9uL3JhZGVvbl9jcy5jICAgICAgfCA2ICsrKysrKwogZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZGlzcGxheS5jIHwgNCArKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9j
cy5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fY3MuYwppbmRleCAwNTk0MzE2ODlj
MmQuLmZiMGUyMzg1MzVmMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9jcy5jCkBAIC0xODks
NiArMTg5LDEyIEBAIHN0YXRpYyBpbnQgcmFkZW9uX2NzX3BhcnNlcl9yZWxvY3Moc3RydWN0IHJh
ZGVvbl9jc19wYXJzZXIgKnApCiAJCQkJICAgICAgcHJpb3JpdHkpOwogCX0KIAorCWZvciAoaSA9
IDA7IGkgPCBwLT5ucmVsb2NzOyBpKyspIHsKKwkJciA9IGRtYV9yZXN2X3N5bmNfdXNlcl9mZW5j
ZShwLT5yZWxvY3NbaV0udHYuYm8tPmJhc2UucmVzdik7CisJCWlmIChyKQorCQkJcmV0dXJuIHI7
CisJfQorCiAJcmFkZW9uX2NzX2J1Y2tldHNfZ2V0X2xpc3QoJmJ1Y2tldHMsICZwLT52YWxpZGF0
ZWQpOwogCiAJaWYgKHAtPmNzX2ZsYWdzICYgUkFERU9OX0NTX1VTRV9WTSkKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYwppbmRleCA2NTJhZjdhMTM0YmQuLjc1ZWJkMjMzODgw
OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZGlzcGxheS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rpc3BsYXkuYwpAQCAtNTE5LDYgKzUx
OSwxMCBAQCBzdGF0aWMgaW50IHJhZGVvbl9jcnRjX3BhZ2VfZmxpcF90YXJnZXQoc3RydWN0IGRy
bV9jcnRjICpjcnRjLAogCURSTV9ERUJVR19EUklWRVIoImZsaXAtaW9jdGwoKSBjdXJfcmJvID0g
JXAsIG5ld19yYm8gPSAlcFxuIiwKIAkJCSB3b3JrLT5vbGRfcmJvLCBuZXdfcmJvKTsKIAorCXIg
PSBkbWFfcmVzdl9zeW5jX3VzZXJfZmVuY2UobmV3X3Jiby0+dGJvLmJhc2UucmVzdik7CisJaWYg
KHVubGlrZWx5KHIgIT0gMCkpCisJCWdvdG8gY2xlYW51cDsKKwogCXIgPSByYWRlb25fYm9fcmVz
ZXJ2ZShuZXdfcmJvLCBmYWxzZSk7CiAJaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsKIAkJRFJNX0VS
Uk9SKCJmYWlsZWQgdG8gcmVzZXJ2ZSBuZXcgcmJvIGJ1ZmZlciBiZWZvcmUgZmxpcFxuIik7Ci0t
IAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
