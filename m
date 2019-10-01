Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88197C3FDD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 20:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEBB6E878;
	Tue,  1 Oct 2019 18:30:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598456E878
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 18:29:40 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id k7so5912063pll.1
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 11:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=xnyZjNCbO2ap2oxzis7QRBMw3/itYSPcHMr8ypFsW4s=;
 b=LqyF3k/ZKAON3WmqII4sih2tyfEpv6WiaHfuSnEXE+rnFXGEgGt/+zs3MCRLCn1wj5
 RxLlmsdYGtTocqay+fe6wTe4vPzIU1Bz8F2nXvYYuS88xUre4hrL2gFCJ2GJr+aLaJOg
 i3l7wYrbHmnaIenQoTUJwK6uTQ4VBd4IgKPlsQD6klSFuEIkfmS/CRPgCYlf/UBcF/5l
 TUpGgcQeFZ1pfnkY/BfPB+jmt/4W0PjxeCrmaRdpwvr3t5HLuXpOkUz6T5/B9w1LOL6L
 eXSZa8c1D5mZREdLmOIyvy4/ofhlebiNBQP6vPKebcfNwvj6YUdyMOc8cJBG71zEhfc1
 77yQ==
X-Gm-Message-State: APjAAAVGP4HQu2OIn5swRpvbECeK7CVttb1wnEqR+8tMi+NWm4vywCSe
 j/4Kxol3MPYaUSYAexalePkOMw==
X-Google-Smtp-Source: APXvYqyRbXISq3SO34OqGRk8drfBkKPU3mD55VSiIQPo3ZwrS0eL4A9EHXkMC5c+SdGyZCp4LNxRBQ==
X-Received: by 2002:a17:902:a413:: with SMTP id
 p19mr25389237plq.210.1569954579845; 
 Tue, 01 Oct 2019 11:29:39 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 e10sm18189221pfh.77.2019.10.01.11.29.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Oct 2019 11:29:39 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: lima: Add support for multiple reset lines
Date: Tue,  1 Oct 2019 18:29:27 +0000
Message-Id: <20191001182927.70448-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=xnyZjNCbO2ap2oxzis7QRBMw3/itYSPcHMr8ypFsW4s=;
 b=EDl7kJK+Gu6PPzl7r1r30j5jzkLc7XveE/hrfDIc7KKwn7fy7suEKGSogHMdKjOd00
 yzcV94dCp+XLbLJis3rCbnPcYAS711/Ww8/+QjGhEg0kSJZ5iz/d5tdK6bX9JBBoUX9O
 yc4DDEUpP8g1EQg/LtRUKyG10i2hRG9v/Ap4b2HKb+/JnAuNq0Mk+/OYuuTIes0uU1Lf
 rEtVzLU3kBNTfc4URdkmz5wkQd50NZqtmJVf0z6lIEhKfOQV5WM9QmYblnsbcJfLVIH1
 SIa1r+a+Ujn/fcA1PgwtC/5T80nlbwOZi0CVKOBHlBjdcJJFRGu7rPo84QIE0r31U2Gx
 mS0Q==
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Peter Griffin <peter.griffin@linaro.org>,
 Qiang Yu <yuq825@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGV0ZXIgR3JpZmZpbiA8cGV0ZXIuZ3JpZmZpbkBsaW5hcm8ub3JnPgoKU29tZSBTb0Nz
IGxpa2UgSGlLZXkgaGF2ZSAyIHJlc2V0IGxpbmVzLCBzbyB1cGRhdGUKdG8gdXNlIHRoZSBkZXZt
X3Jlc2V0X2NvbnRyb2xfYXJyYXlfKiB2YXJpYW50IG9mIHRoZQpBUEkgc28gdGhhdCBtdWx0aXBs
ZSByZXNldHMgY2FuIGJlIHNwZWNpZmllZCBpbiBEVC4KCkNjOiBRaWFuZyBZdSA8eXVxODI1QGdt
YWlsLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKQ2M6IGxpbWFAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IFBldGVyIEdy
aWZmaW4gPHBldGVyLmdyaWZmaW5AbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBTdHVs
dHogPGpvaG4uc3R1bHR6QGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2xpbWEvbGlt
YV9kZXZpY2UuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2Uu
YyBiL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2aWNlLmMKaW5kZXggZDg2YjhkODFhNDgz
Li5lM2UwY2ExMTM4MmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZGV2
aWNlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9kZXZpY2UuYwpAQCAtMTA1LDcg
KzEwNSw4IEBAIHN0YXRpYyBpbnQgbGltYV9jbGtfaW5pdChzdHJ1Y3QgbGltYV9kZXZpY2UgKmRl
dikKIAlpZiAoZXJyKQogCQlnb3RvIGVycm9yX291dDA7CiAKLQlkZXYtPnJlc2V0ID0gZGV2bV9y
ZXNldF9jb250cm9sX2dldF9vcHRpb25hbChkZXYtPmRldiwgTlVMTCk7CisJZGV2LT5yZXNldCA9
IGRldm1fcmVzZXRfY29udHJvbF9hcnJheV9nZXRfb3B0aW9uYWxfc2hhcmVkKGRldi0+ZGV2KTsK
KwogCWlmIChJU19FUlIoZGV2LT5yZXNldCkpIHsKIAkJZXJyID0gUFRSX0VSUihkZXYtPnJlc2V0
KTsKIAkJaWYgKGVyciAhPSAtRVBST0JFX0RFRkVSKQotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
