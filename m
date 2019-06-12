Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E594278D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 15:30:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E148909C;
	Wed, 12 Jun 2019 13:30:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D6838909C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 13:30:45 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id a21so15116373ljh.7
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 06:30:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zOJC9llcXSmmT03g3kIZ1KIg2eqxtvX5nA/fmUTxK9s=;
 b=Cg1CQg4+95wafZj8mKwIR5HU2OTS37wq60UwgHmDcKsP8OdMwyuh07/hLn+43LVIaq
 zb06Ae4hRyIwzPMSwDyp9Ca3LTv4LqKssFcx9+Znx1BmVKyrE2zjvIU8gv5o39fIgwd1
 CCrGX3qSAS8/i5qwaUXvPAwkrFpt+COQxCJFIribxgT8RhdVmM7YRvMrI1jyAAv2Ka/L
 Dne9710kPIjXb28mRY5FwHoOYbV3IRGRpSM0Kt+lCaAZRxWt3OLWWnj/2/fp14i4Za9K
 jQKRG+sEcigtJ9Glpj7LrDjhQtsKzdm6IWkJkajRX4QhznDQlZqqhbYldpdqBhDFOSkW
 VCpQ==
X-Gm-Message-State: APjAAAXMygwvAokF9gF1LmXMym+E5veJU+gu44HMmVNoAXVyc0I/+f9E
 IBs2BvwxiwvUlvHwSWFuJgHY5We3v4I=
X-Google-Smtp-Source: APXvYqwX6KxgL33+MY/QH9VsU3hPzaj5iVpor7Fy2bFkBvnkwyJisL6ZNoC76MU1vXUBK45OUO6IJQ==
X-Received: by 2002:a2e:894a:: with SMTP id b10mr12543185ljk.99.1560346243732; 
 Wed, 12 Jun 2019 06:30:43 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
 by smtp.gmail.com with ESMTPSA id w1sm3923261ljm.81.2019.06.12.06.30.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 06:30:42 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/mcde: Fix uninitialized variable
Date: Wed, 12 Jun 2019 15:30:38 +0200
Message-Id: <20190612133038.5522-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zOJC9llcXSmmT03g3kIZ1KIg2eqxtvX5nA/fmUTxK9s=;
 b=rAEPeMUC7ZuZ7okUYsti/xIXf6d6flBHRMfTsFDmmOZEUfVJ4UiZDK4KDWJuvY8D/r
 p8noSLNhV6qd7pNWG/zMW7TEdOI3sonyLu9h5I0PccbsZsVw5bemsnky9K2PTLF65BHA
 EJtnoYBJsSvk2YSG1G0NpuEvnlm+oWyl4q/hTQqKXzWJIl1JoSEa7iffC8TodKtbv9ZC
 ZeKQOs21741JBOGTjLslQxx/Hm2/4uxc70tKAxdpdZ08k608tNvKeriV+7U98A2m7smw
 ML1rhsHfpGwPxSGZcgtgnzTLkusUWdE3kWkpjVxGLS6XSSUzyr7GHE+cKvA8dOha7RJP
 0kRw==
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
Cc: Dan Carpenter <dan.carpenter@oracle.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgbmVlZCB0byBoYW5kbGUgdGhlIGNhc2Ugd2hlbiBvZl9kcm1fZmluZF9icmlkZ2UoKSByZXR1
cm5zCk5VTEwuCgpSZXBvcnRlZC1ieTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFj
bGUuY29tPgpDYzogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWNkZS9tY2RlX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kcnYuYwpp
bmRleCBiYWY2M2ZiNjg1MGEuLmJjMTFjNDQ2ZTU5NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21jZGUvbWNkZV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbWNkZS9tY2RlX2Rydi5j
CkBAIC0zMTksNyArMzE5LDcgQEAgc3RhdGljIGludCBtY2RlX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiAJc3RydWN0IGRldmljZSAqZGV2ID0gJnBkZXYtPmRldjsKIAlzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtOwogCXN0cnVjdCBtY2RlICptY2RlOwotCXN0cnVjdCBjb21wb25l
bnRfbWF0Y2ggKm1hdGNoOworCXN0cnVjdCBjb21wb25lbnRfbWF0Y2ggKm1hdGNoID0gTlVMTDsK
IAlzdHJ1Y3QgcmVzb3VyY2UgKnJlczsKIAl1MzIgcGlkOwogCXUzMiB2YWw7CkBAIC00ODUsNyAr
NDg1LDcgQEAgc3RhdGljIGludCBtY2RlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiAJCX0KIAkJcHV0X2RldmljZShwKTsKIAl9Ci0JaWYgKElTX0VSUihtYXRjaCkpIHsKKwlp
ZiAoSVNfRVJSX09SX05VTEwobWF0Y2gpKSB7CiAJCWRldl9lcnIoZGV2LCAiY291bGQgbm90IGNy
ZWF0ZSBjb21wb25lbnQgbWF0Y2hcbiIpOwogCQlyZXQgPSBQVFJfRVJSKG1hdGNoKTsKIAkJZ290
byBjbGtfZGlzYWJsZTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
