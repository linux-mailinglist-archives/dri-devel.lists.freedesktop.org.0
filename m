Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7E38288C10
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 17:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6703C6ED05;
	Fri,  9 Oct 2020 15:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E9A6ED03
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 15:03:46 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id 33so9624437edq.13
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 08:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HfGOHdnl8P4UkAJXJm+asFhJ2S9PMVltmlEIidPYuz0=;
 b=aa4N1QGk9MW7oVueE84pS3IhklP/XdU7RdM9t04ujPc6+KsxPbCNzpAmnfSeiYSmsC
 KZHr/LYqlvTGsoZDC8fMF7aq5OM7PcEj+UFzb/n5MBMqNsV4HiFNcfPx+U870RxwOmLw
 GRoRXjF2T5oyi2JVye4+SIOr5LZDF+F7fqGvrZu/jXjQRTccEH+EzI3DH/xZJp/mz+yO
 OwWK8xhq3V2y4QsDyDIf+dMsxIEbHlQTRm4WK0p8lbBa0q8jYQfoCm/ZoqeSuAefFrVZ
 0MuUPGHPEXS1TyeXAZHNNS1KCQ/ZLCrRDgD86GSjDsitEqB1cZOrUExVxuVKJacSGZqs
 I2BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HfGOHdnl8P4UkAJXJm+asFhJ2S9PMVltmlEIidPYuz0=;
 b=NFw3L8WTOAU+icKig3gxPL5zj/hMUT1TJy0VpDpDfr8UA1sI0CiuMKqd5eatns/8Vt
 gJ1y244mYS9Q403QsN1/EjmD+mR3qbcdcZT3AkGrh/DkSJ6qCVSVCflj7Pa8gkbYQ7FD
 JJKY6KePvcz2qaxuBbQuXJ9ac2W9OP6RUZ33xfAdIDXOIRbJ50ufrpYUoMrTyxLFpugJ
 4iKCGjY9DRwBwCVuohjNjCFjCi2bs+5VXW5gdZY6AHbQjFIVMbbD8OoYsDTs1J2fy5OT
 uN7RusUe0qLRf5kQYR0u6qLxVouDptzk5b1o2aCDl+jJ0+suZ4WCpFu3wBht6dQFufsD
 +tcg==
X-Gm-Message-State: AOAM53168ouO3HEOXjKlHijZBp52xdLxbDOJ/CESrU/GIv8ixwxt4pP3
 HrWNENNZPBEFcaBzHaN8PC8=
X-Google-Smtp-Source: ABdhPJyibPjE78lcVPlBYyG6PW0fP1GpDj3X5Tpm1VzsO7r6v4QYdB2IMOhxokvqNlnbjQNZuzUauQ==
X-Received: by 2002:aa7:cc18:: with SMTP id q24mr8619083edt.108.1602255824666; 
 Fri, 09 Oct 2020 08:03:44 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:65f3:51d4:50d0:15b0])
 by smtp.gmail.com with ESMTPSA id v14sm789364edy.68.2020.10.09.08.03.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 08:03:43 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, chris@chris-wilson.co.uk, airlied@redhat.com,
 akpm@linux-foundation.org, daniel@ffwll.ch, sumit.semwal@linaro.org,
 willy@infradead.org, jhubbard@nvidia.com, jgg@ziepe.ca
Subject: [PATCH 1/6] mm: mmap: fix fput in error path
Date: Fri,  9 Oct 2020 17:03:37 +0200
Message-Id: <20201009150342.1979-1-christian.koenig@amd.com>
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
YXJvdW5kIGFuZCBwcm9wZXIgZml4IHRoaXMgaW4gbW1hcF9yZWdpb24uCgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9kbWEtYnVmL2RtYS1idWYuYyB8IDIyICsrKysrLS0tLS0tLS0tLS0tLS0tLS0KIG1tL21tYXAu
YyAgICAgICAgICAgICAgICAgfCAgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMo
KyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVm
LmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCmluZGV4IGE2YmE0ZDU5OGYwZS4uZWRkNTc0
MDJhNDhhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jCisrKyBiL2RyaXZl
cnMvZG1hLWJ1Zi9kbWEtYnVmLmMKQEAgLTExNDMsOSArMTE0Myw2IEBAIEVYUE9SVF9TWU1CT0xf
R1BMKGRtYV9idWZfZW5kX2NwdV9hY2Nlc3MpOwogaW50IGRtYV9idWZfbW1hcChzdHJ1Y3QgZG1h
X2J1ZiAqZG1hYnVmLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAkJIHVuc2lnbmVkIGxv
bmcgcGdvZmYpCiB7Ci0Jc3RydWN0IGZpbGUgKm9sZGZpbGU7Ci0JaW50IHJldDsKLQogCWlmIChX
QVJOX09OKCFkbWFidWYgfHwgIXZtYSkpCiAJCXJldHVybiAtRUlOVkFMOwogCkBAIC0xMTYzLDIy
ICsxMTYwLDEzIEBAIGludCBkbWFfYnVmX21tYXAoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCXJldHVybiAtRUlOVkFMOwogCiAJLyogcmVhZGp1
c3QgdGhlIHZtYSAqLwotCWdldF9maWxlKGRtYWJ1Zi0+ZmlsZSk7Ci0Jb2xkZmlsZSA9IHZtYS0+
dm1fZmlsZTsKLQl2bWEtPnZtX2ZpbGUgPSBkbWFidWYtPmZpbGU7Ci0Jdm1hLT52bV9wZ29mZiA9
IHBnb2ZmOworCWlmICh2bWEtPnZtX2ZpbGUpCisJCWZwdXQodm1hLT52bV9maWxlKTsKIAotCXJl
dCA9IGRtYWJ1Zi0+b3BzLT5tbWFwKGRtYWJ1Ziwgdm1hKTsKLQlpZiAocmV0KSB7Ci0JCS8qIHJl
c3RvcmUgb2xkIHBhcmFtZXRlcnMgb24gZmFpbHVyZSAqLwotCQl2bWEtPnZtX2ZpbGUgPSBvbGRm
aWxlOwotCQlmcHV0KGRtYWJ1Zi0+ZmlsZSk7Ci0JfSBlbHNlIHsKLQkJaWYgKG9sZGZpbGUpCi0J
CQlmcHV0KG9sZGZpbGUpOwotCX0KLQlyZXR1cm4gcmV0OworCXZtYS0+dm1fZmlsZSA9IGdldF9m
aWxlKGRtYWJ1Zi0+ZmlsZSk7CisJdm1hLT52bV9wZ29mZiA9IHBnb2ZmOwogCisJcmV0dXJuIGRt
YWJ1Zi0+b3BzLT5tbWFwKGRtYWJ1Ziwgdm1hKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGRtYV9i
dWZfbW1hcCk7CiAKZGlmZiAtLWdpdCBhL21tL21tYXAuYyBiL21tL21tYXAuYwppbmRleCA0MDI0
OGQ4NGFkNWYuLjNhMjY3MGQ3MzM1NSAxMDA2NDQKLS0tIGEvbW0vbW1hcC5jCisrKyBiL21tL21t
YXAuYwpAQCAtMTg1Miw4ICsxODUyLDggQEAgdW5zaWduZWQgbG9uZyBtbWFwX3JlZ2lvbihzdHJ1
Y3QgZmlsZSAqZmlsZSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCXJldHVybiBhZGRyOwogCiB1bm1h
cF9hbmRfZnJlZV92bWE6CisJZnB1dCh2bWEtPnZtX2ZpbGUpOwogCXZtYS0+dm1fZmlsZSA9IE5V
TEw7Ci0JZnB1dChmaWxlKTsKIAogCS8qIFVuZG8gYW55IHBhcnRpYWwgbWFwcGluZyBkb25lIGJ5
IGEgZGV2aWNlIGRyaXZlci4gKi8KIAl1bm1hcF9yZWdpb24obW0sIHZtYSwgcHJldiwgdm1hLT52
bV9zdGFydCwgdm1hLT52bV9lbmQpOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
