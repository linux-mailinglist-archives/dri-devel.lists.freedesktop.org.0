Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA591453A
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 09:28:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8387B8935A;
	Mon,  6 May 2019 07:28:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC536892CB
 for <dri-devel@lists.freedesktop.org>; Sun,  5 May 2019 17:39:49 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id v1so7555524lfg.5
 for <dri-devel@lists.freedesktop.org>; Sun, 05 May 2019 10:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XT2iXDlEU6v0lNteGjb1DNAvzBwb+KsZ+Jk4cl51M84=;
 b=m83i9bSH4zZ2M7+EP24fXxyLAk1YAf1ooxJfHaqqAsv4vvt7NSxVjuSHOqqH239igc
 Wj8YX6AtDypBR76nM2LJmszyuwsoWPGz4P5qq7cZ82853Gfndm/86V/3YcvDoQnxcXoO
 f7YlNcvFNISI/e8ZNyk3Kl88ieTbiMcLfkxyxeGTUFL0BY4rzOhu+9JCOMUo2irQ3p4V
 0Bi+zY3su2wjqfoqHyeQ15dttln+49LBXpSq1rKpu3gWMhCSjvwmgrIQTwIX06p1HYZU
 4hUpr2Y3w8jNhljj0YrfTE96lfF0I5MFWW7Rp3Nj8Oyb/mZq5G+UQWu6YZsGdUodyC85
 3IKg==
X-Gm-Message-State: APjAAAXJ5nMzTW2OuzWyQ9qDnDr1hmBE/PGbjN+qdg1lu+8ETC7oFeka
 Ebl6zvKyxin4q3172MDA8ZQ=
X-Google-Smtp-Source: APXvYqyZocWedZVqGZOQeo8alH8Z9CYdqk1a+SwfInq6p9vkKQaTkWK0V8kDAlOnjWuK9P1JbC4MxQ==
X-Received: by 2002:ac2:5446:: with SMTP id d6mr217591lfn.47.1557077988165;
 Sun, 05 May 2019 10:39:48 -0700 (PDT)
Received: from localhost.localdomain (ppp94-29-35-107.pppoe.spdop.ru.
 [94.29.35.107])
 by smtp.gmail.com with ESMTPSA id z17sm1626938lja.26.2019.05.05.10.39.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 05 May 2019 10:39:47 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1 1/3] drm/tegra: dc: Tune up high priority request controls
 on Tegra20
Date: Sun,  5 May 2019 20:37:05 +0300
Message-Id: <20190505173707.29282-2-digetx@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190505173707.29282-1-digetx@gmail.com>
References: <20190505173707.29282-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 06 May 2019 07:27:59 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XT2iXDlEU6v0lNteGjb1DNAvzBwb+KsZ+Jk4cl51M84=;
 b=K8fENxB2VacBBLP3NUMvI7fVRVLSi7lZ3CIlki2EKyKs1L4awSmyH2lUMDfqO2WJTK
 KGTLrCsVUD1m4ISqtQFbZDWv94ylMr2qHtVRW6WgXPpHpZ2W0kD6KIalKko5l0SO5nxx
 sJVjYzaCnZ0gnkAglz0ScVSz44aS2srC28DXpiXQ1Z0v9u40wH6nE833LzDapt/BKQcP
 IEP1iCnG5l7ARQqiwXlN5sOTNDhRMDW0CHq6JHjQC90MmEaIvXiZxS3aqdNWGK89SbnB
 hZyRONX5NPvXm5SCCYmWdjySuBn7lAlIaKZ4IONG3fbr6k2VgE+rM6UZSgniHvGdLI0n
 0BxQ==
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
ZGV4IDYwN2E2ZWExN2VjYy4uY2Y2MjJhMDdlOWI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZGMuYwpAQCAtMTgzMywx
MiArMTgzMywxMiBAQCBzdGF0aWMgdm9pZCB0ZWdyYV9jcnRjX2F0b21pY19lbmFibGUoc3RydWN0
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
