Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0592A2B452
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 14:05:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36AD89D8E;
	Mon, 27 May 2019 12:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD066E13D
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 18:17:38 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id 14so9476686ljj.5
 for <dri-devel@lists.freedesktop.org>; Fri, 24 May 2019 11:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AitnibXnsEfzpUu6HXlCBGqxsM7f3oVwPktBIsU9dZw=;
 b=g6UMNY4DuP6bWO9QQx2C++mO0HlAdStPk6zqy1jL6CJoYsIya+ZSGP1pRhg6Tcu7PD
 YsYbTrPrcydD8EG+jrWM3LQRamHpn/8BiCWg7mHA6/g65va0v/ymyDIqDQ+1fk0YzXwS
 ZDjyUyIB3ZmduUK7VIhlnt3k+uZJ0/Pq9oxV6AwAx/+mjJKEye8Xh+PkT45dO4B4DvcV
 SnnzFLhV8PiNNq6VXlLqpzox4xRROG2IWIGFPDP7eURYFH0HTiPIexdMKpgq0Sx6c6EM
 skR7KuuV6M0GG6cpwDbJVfa9uw7o9FMqnJ/+1ndYDCNHtMGX6tEBc6KrcXFRKj2cAMzL
 JgkQ==
X-Gm-Message-State: APjAAAV+VV7a+DtH1y/fUOv2c05j/hZAQ7fFDcj1MG+rV6dVnrEG3nT8
 v0AcVUOVjj+A5KNnOUKI82Y=
X-Google-Smtp-Source: APXvYqym2oCg9Sa/M7W+zNv55wqaTr6QqA+Mz+Ik3fwZJStiat9x7n/ys/Y1wLW0HAoJmWt9g29+CQ==
X-Received: by 2002:a2e:9f44:: with SMTP id v4mr914088ljk.85.1558721857495;
 Fri, 24 May 2019 11:17:37 -0700 (PDT)
Received: from localhost.localdomain ([94.29.35.141])
 by smtp.gmail.com with ESMTPSA id h10sm810376ljm.9.2019.05.24.11.17.36
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 11:17:36 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 1/3] drm/tegra: dc: Tune up high priority request controls
 on Tegra20
Date: Fri, 24 May 2019 21:16:25 +0300
Message-Id: <20190524181627.16490-2-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190524181627.16490-1-digetx@gmail.com>
References: <20190524181627.16490-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 27 May 2019 12:03:54 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AitnibXnsEfzpUu6HXlCBGqxsM7f3oVwPktBIsU9dZw=;
 b=Ilpl5HFlrboLQeGOD/OFT8IhSrFmaUBjQpWEez2YHvNJz2iXRZCFuerj7LEYI9bUL+
 bQXOFHbVmlw4yGuY0yc5np5xCIQj0eUMHETbqiCRtSS3us8RL4mW3kxq399lKzo46gm+
 3g06jpAbtFxdslmYgK2925qYZjFWtSKhgQyEExS1Pn4NUBPjnABQZNolsab5dHqLQR0n
 wQmjoiks1YrETORKfr6YdTsurphVXK1otj5Nb0PeoGYaVDqcAZ0KD8sS3Tsicm4jttUJ
 dZ7WvCbiek8NVkJF9FGeQ2KnHMkwFuCcDFeHksuFYu4fX6Y0GIi2BLY+zGuTaeloobOS
 zo0g==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGVncmEyMCBoYXMgYSBoaWdoIHByaW9yaXR5IHJlcXVlc3QgY29udHJvbCB0aGF0IGFsbG93IHRv
IGNvbmZpZ3VyZQp3aGVuIGRpc3BsYXkncyBtZW1vcnkgY2xpZW50IHNob3VsZCBwZXJmb3JtIHJl
YWQgcmVxdWVzdHMgd2l0aCBhIGhpZ2hlcgpwcmlvcml0eSAoVGVncmEzMCsgdXNlcyBvdGhlciBt
ZWFucykuIFNldCB1cCB0aGUgY29udHJvbHMgZm9yIGEgbW9yZQphZ2dyZXNzaXZlIHByZWZldGNo
aW5nIHRvIHJlbGlhYmx5IGF2b2lkIEZJRk8gdW5kZXJmbG93IG9uIGEgbG93ZXIgbWVtb3J5CmZy
ZXF1ZW5jeSwgdGhpcyBhbGxvdyB0byBzYWZlbHkgZHJvcCB0aGUgbWVtb3J5IGJhbmR3aWR0aCBy
ZXF1aXJlbWVudCBieQphYm91dCB0d28gdGltZXMgaW4gYSBtb3N0IHBvcHVsYXIgY2FzZXMgKG9u
bHkgb25lIGRpc3BsYXkgYWN0aXZlLCB2aWRlbwpvdmVybGF5IGluYWN0aXZlLCBubyBzY2FsaW5n
IGlzIGRvbmUpLgoKU2lnbmVkLW9mZi1ieTogRG1pdHJ5IE9zaXBlbmtvIDxkaWdldHhAZ21haWwu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jIHwgOCArKysrLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jCmlu
ZGV4IDA3OTI1MGM4NTczMy4uM2UxMzk0OGRjZGNkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwpAQCAtMTgyOCwx
MiArMTgyOCwxMiBAQCBzdGF0aWMgdm9pZCB0ZWdyYV9jcnRjX2F0b21pY19lbmFibGUoc3RydWN0
IGRybV9jcnRjICpjcnRjLAogCQl0ZWdyYV9kY193cml0ZWwoZGMsIHZhbHVlLCBEQ19DTURfSU5U
X1BPTEFSSVRZKTsKIAogCQkvKiBpbml0aWFsaXplIHRpbWVyICovCi0JCXZhbHVlID0gQ1VSU09S
X1RIUkVTSE9MRCgwKSB8IFdJTkRPV19BX1RIUkVTSE9MRCgweDIwKSB8Ci0JCQlXSU5ET1dfQl9U
SFJFU0hPTEQoMHgyMCkgfCBXSU5ET1dfQ19USFJFU0hPTEQoMHgyMCk7CisJCXZhbHVlID0gQ1VS
U09SX1RIUkVTSE9MRCgwKSB8IFdJTkRPV19BX1RIUkVTSE9MRCgweDcwKSB8CisJCQlXSU5ET1df
Ql9USFJFU0hPTEQoMHgzMCkgfCBXSU5ET1dfQ19USFJFU0hPTEQoMHg3MCk7CiAJCXRlZ3JhX2Rj
X3dyaXRlbChkYywgdmFsdWUsIERDX0RJU1BfRElTUF9NRU1fSElHSF9QUklPUklUWSk7CiAKLQkJ
dmFsdWUgPSBDVVJTT1JfVEhSRVNIT0xEKDApIHwgV0lORE9XX0FfVEhSRVNIT0xEKDEpIHwKLQkJ
CVdJTkRPV19CX1RIUkVTSE9MRCgxKSB8IFdJTkRPV19DX1RIUkVTSE9MRCgxKTsKKwkJdmFsdWUg
PSBDVVJTT1JfVEhSRVNIT0xEKDApIHwgV0lORE9XX0FfVEhSRVNIT0xEKDApIHwKKwkJCVdJTkRP
V19CX1RIUkVTSE9MRCgwKSB8IFdJTkRPV19DX1RIUkVTSE9MRCgwKTsKIAkJdGVncmFfZGNfd3Jp
dGVsKGRjLCB2YWx1ZSwgRENfRElTUF9ESVNQX01FTV9ISUdIX1BSSU9SSVRZX1RJTUVSKTsKIAog
CQl2YWx1ZSA9IFZCTEFOS19JTlQgfCBXSU5fQV9VRl9JTlQgfCBXSU5fQl9VRl9JTlQgfCBXSU5f
Q19VRl9JTlQgfAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
