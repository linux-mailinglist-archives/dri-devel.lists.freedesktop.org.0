Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD4928B093
	for <lists+dri-devel@lfdr.de>; Mon, 12 Oct 2020 10:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E21C46E0CD;
	Mon, 12 Oct 2020 08:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA1C6E054
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 08:52:06 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id e22so22126925ejr.4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Oct 2020 01:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yMIANltJzggMKevCuA/64ylJ5xrfMe99CRAziEtSDMY=;
 b=lw+tUQcX6E58leo0iNUqUuxVirmooB9X9E28JBa9u2lgsb0RDv0+NxJBs03bTu7r0B
 D5EPdSramySPYUis9ltXlotS4rQuxBR+Lpg3kMC59NVAL4HKTGbhmk92F5o8LIbmtzv7
 iMpjDgh6fHILhflZmN61tUTEN+tVt4sHxRVmsmlXUWFTWigpqtu+/NNfdmgb6t9xuYQJ
 UR1KOZokmCcW8f1eYTtWvUlJrfmNcsSSOy5zYIB6J+97c1BT/O3HLomn+xovaPPdAKVB
 dQVqbzeDFYRKcQP3MlkRlIElHDn3nkr52Yh/OQIpwBDSFtHpuLbXkazdkd5l455I7zZ6
 nJlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yMIANltJzggMKevCuA/64ylJ5xrfMe99CRAziEtSDMY=;
 b=OktbIDr6Zsf7R1/1MvvUQ1/hruyk2Q49LFP1qzM/uoSdvttD1T81h2kaOwX5bgG1Qw
 VWYG4MBA/NKOrLOlJVQRqiDdDq3vP/CErvgExUK1fnHP8qOsqxWdd8Zbc7qeQ/933OnN
 LQ0THKOm0BtOsykcgCp1dFiIs1zMhU7gwzk311iN42nVzwXxIbSflMFhNbwi+FDWco1V
 hHpY7m8yCR5oSVfPilLfcJaamgjhHl12/N1mVfiVCfXUfoR0q3HSMCunnhon/GSdcidt
 MyxC9bYcabGD9TwTJSSigN4h4eqzVwhLu0fWJhqypME3jpXorS6X1kmgW3rzy1J+0QAJ
 q32Q==
X-Gm-Message-State: AOAM532uK04xCA6iaQrFXxqOxeEycxNvGsHhx1Pi2qog0v0giGwvv0gj
 iG39VWR3/9mZNqLyF2nIvq7ZH2Ms2R4=
X-Google-Smtp-Source: ABdhPJxnwEuylsU7eSmkWOtF42j8bglh0/rf5pkHlz0ZkTIK1CSAgwpiELeW85OngsabmXKbddLIWw==
X-Received: by 2002:a17:906:95c5:: with SMTP id
 n5mr27686729ejy.111.1602492725376; 
 Mon, 12 Oct 2020 01:52:05 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6a6c:c67:2644:1d74])
 by smtp.gmail.com with ESMTPSA id o35sm8622988edd.4.2020.10.12.01.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 01:52:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 chris@chris-wilson.co.uk, airlied@redhat.com, daniel@ffwll.ch,
 sumit.semwal@linaro.org, willy@infradead.org, jhubbard@nvidia.com,
 jgg@ziepe.ca, linmiaohe@huawei.com
Subject: [PATCH 1/2] mm: mmap: fix fput in error path v2
Date: Mon, 12 Oct 2020 10:52:02 +0200
Message-Id: <20201012085203.56119-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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

UGF0Y2ggIjQ5NWMxMGNjMWMwYyBDSFJPTUlVTTogZG1hLWJ1ZjogcmVzdG9yZSBhcmdzLi4uIgph
ZGRzIGEgd29ya2Fyb3VuZCBmb3IgYSBidWcgaW4gbW1hcF9yZWdpb24uCgpBcyB0aGUgY29tbWVu
dCBzdGF0ZXMgLT5tbWFwKCkgY2FsbGJhY2sgY2FuIGNoYW5nZQp2bWEtPnZtX2ZpbGUgYW5kIHNv
IHdlIG1pZ2h0IGNhbGwgZnB1dCgpIG9uIHRoZSB3cm9uZyBmaWxlLgoKUmV2ZXJ0IHRoZSB3b3Jr
YXJvdW5kIGFuZCBwcm9wZXIgZml4IHRoaXMgaW4gbW1hcF9yZWdpb24uCgp2MjogZHJvcCB0aGUg
ZXh0cmEgaWYgaW4gZG1hX2J1Zl9tbWFwIGFzIHdlbGwKClNpZ25lZC1vZmYtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEphc29uIEd1
bnRob3JwZSA8amdnQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYyB8
IDIwICsrKy0tLS0tLS0tLS0tLS0tLS0tCiBtbS9tbWFwLmMgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVmL2Rt
YS1idWYuYwppbmRleCBhNmJhNGQ1OThmMGUuLjA4NjMwZDA1N2NmMiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9kbWEtYnVmL2RtYS1idWYuYworKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCkBA
IC0xMTQzLDkgKzExNDMsNiBAQCBFWFBPUlRfU1lNQk9MX0dQTChkbWFfYnVmX2VuZF9jcHVfYWNj
ZXNzKTsKIGludCBkbWFfYnVmX21tYXAoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IHZt
X2FyZWFfc3RydWN0ICp2bWEsCiAJCSB1bnNpZ25lZCBsb25nIHBnb2ZmKQogewotCXN0cnVjdCBm
aWxlICpvbGRmaWxlOwotCWludCByZXQ7Ci0KIAlpZiAoV0FSTl9PTighZG1hYnVmIHx8ICF2bWEp
KQogCQlyZXR1cm4gLUVJTlZBTDsKIApAQCAtMTE2MywyMiArMTE2MCwxMSBAQCBpbnQgZG1hX2J1
Zl9tbWFwKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
LAogCQlyZXR1cm4gLUVJTlZBTDsKIAogCS8qIHJlYWRqdXN0IHRoZSB2bWEgKi8KLQlnZXRfZmls
ZShkbWFidWYtPmZpbGUpOwotCW9sZGZpbGUgPSB2bWEtPnZtX2ZpbGU7Ci0Jdm1hLT52bV9maWxl
ID0gZG1hYnVmLT5maWxlOworCWZwdXQodm1hLT52bV9maWxlKTsKKwl2bWEtPnZtX2ZpbGUgPSBn
ZXRfZmlsZShkbWFidWYtPmZpbGUpOwogCXZtYS0+dm1fcGdvZmYgPSBwZ29mZjsKIAotCXJldCA9
IGRtYWJ1Zi0+b3BzLT5tbWFwKGRtYWJ1Ziwgdm1hKTsKLQlpZiAocmV0KSB7Ci0JCS8qIHJlc3Rv
cmUgb2xkIHBhcmFtZXRlcnMgb24gZmFpbHVyZSAqLwotCQl2bWEtPnZtX2ZpbGUgPSBvbGRmaWxl
OwotCQlmcHV0KGRtYWJ1Zi0+ZmlsZSk7Ci0JfSBlbHNlIHsKLQkJaWYgKG9sZGZpbGUpCi0JCQlm
cHV0KG9sZGZpbGUpOwotCX0KLQlyZXR1cm4gcmV0OwotCisJcmV0dXJuIGRtYWJ1Zi0+b3BzLT5t
bWFwKGRtYWJ1Ziwgdm1hKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGRtYV9idWZfbW1hcCk7CiAK
ZGlmZiAtLWdpdCBhL21tL21tYXAuYyBiL21tL21tYXAuYwppbmRleCA0MDI0OGQ4NGFkNWYuLjNh
MjY3MGQ3MzM1NSAxMDA2NDQKLS0tIGEvbW0vbW1hcC5jCisrKyBiL21tL21tYXAuYwpAQCAtMTg1
Miw4ICsxODUyLDggQEAgdW5zaWduZWQgbG9uZyBtbWFwX3JlZ2lvbihzdHJ1Y3QgZmlsZSAqZmls
ZSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCXJldHVybiBhZGRyOwogCiB1bm1hcF9hbmRfZnJlZV92
bWE6CisJZnB1dCh2bWEtPnZtX2ZpbGUpOwogCXZtYS0+dm1fZmlsZSA9IE5VTEw7Ci0JZnB1dChm
aWxlKTsKIAogCS8qIFVuZG8gYW55IHBhcnRpYWwgbWFwcGluZyBkb25lIGJ5IGEgZGV2aWNlIGRy
aXZlci4gKi8KIAl1bm1hcF9yZWdpb24obW0sIHZtYSwgcHJldiwgdm1hLT52bV9zdGFydCwgdm1h
LT52bV9lbmQpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
