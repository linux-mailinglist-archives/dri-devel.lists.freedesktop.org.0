Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 779F4D6306
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:51:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052896E2BE;
	Mon, 14 Oct 2019 12:51:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBBFA6E2BE
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:51:09 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 3so16642412wmi.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:51:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FwBg+ebSJP5mRjr900RF+E/RqOvjOLM24+kI7t4VvUg=;
 b=W7TSqNSQGooR9UfpXzx0ErKRfVaorgOS0eKSr6hY+K28v1Gk1BuXX7OSy+IqRYRehf
 mStEFV9D1D80xeO5aoqTJ79eSJRdUlaJXBAIRA97jXAAXTvDi2upCnxip8iy1os3OsPP
 BmKvsjanpebsERn0YN4MIOutg5BQ5ZQvmqJ3xqqElLSs7RfsRHdniMG4Wgtm2dVhpNzs
 WZsa3/uLHnSZed218fyJpJquZbkgi4oLNKDyIZaQYKL/ek404Wc5B1oG1hu4+l8UKMCE
 IW4ATuUbN8nt3qXK218a976PRey38OvPQSm6pudePKYh7PYOaodjE5ez+9QjsY5J49Dk
 EL+g==
X-Gm-Message-State: APjAAAU+wGuJ8o2ty5p7K3pnEX+ZcYGXoncz6XhFdzzTHwNZqFBxmK6c
 hHf7p2KXS+dcbrCiDtla5mk=
X-Google-Smtp-Source: APXvYqzXG6B2Rb+gy/AW++lSmQzs70JeEvfgo03vNOj77BcGg0/KS5QnmwfcvAVFWiTYXiMXWp9RYw==
X-Received: by 2002:a1c:f011:: with SMTP id a17mr14486354wmb.18.1571057468225; 
 Mon, 14 Oct 2019 05:51:08 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id x5sm23902742wrt.75.2019.10.14.05.51.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:51:07 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 08/14] drm/tegra: vic: Inherit DMA mask from host1x
Date: Mon, 14 Oct 2019 14:50:43 +0200
Message-Id: <20191014125049.425101-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FwBg+ebSJP5mRjr900RF+E/RqOvjOLM24+kI7t4VvUg=;
 b=DOlLanNaCmwuTEm1kbAzhv1PC8LkEv4wn3LmSmiRgU3vG4Zq6lTTq3lyOHwRdqjBTc
 cJKq6Q+3ujIHy9JzOxO9uocKYFPbl3Qjr3mowd4Xd5ArqjQOj4KWpEzp1AZD6OpieOVz
 /teKSxf4EUaDQqHGV7XcG8d6oC1CHCUlXZtKRni9c/6S8tlm/T65HnODIvS3hF/hNWUy
 bs0U5xLavIhEF0B9SUJq+Q4Di9V3SmjB/BfazUpyM5D2tZRduplXBsAGrLFoWyD1Kcii
 IEOMTliZ+HpghdKrlwru4q2t2jEKiAFt57B41S1GL0679eNejylsL2Ht1DKfYYs8rSkX
 9xLw==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClZJQywganVzdCBsaWtl
IGFsbCBvdGhlciBob3N0MXggY2xpZW50cywgaGFzIHRoZSBzYW1lIGFkZHJlc3NpbmcgcmFuZ2UK
YXMgaXRzIHBhcmVudCBob3N0MXggZGV2aWNlLiBJbmhlcml0IHRoZSBETUEgbWFzayB0byByZWZs
ZWN0IHRoYXQuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEu
Y29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYyB8IDcgKysrKysrKwogMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS92aWMuYyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYwppbmRleCA3NDg3OThmMmNk
YzguLmQ2MGU0NzljZGU5MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS92aWMuYwpAQCAtMzg1LDYgKzM4NSwxMyBAQCBz
dGF0aWMgaW50IHZpY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVj
dCB2aWMgKnZpYzsKIAlpbnQgZXJyOwogCisJLyogaW5oZXJpdCBETUEgbWFzayBmcm9tIGhvc3Qx
eCBwYXJlbnQgKi8KKwllcnIgPSBkbWFfY29lcmNlX21hc2tfYW5kX2NvaGVyZW50KGRldiwgKmRl
di0+cGFyZW50LT5kbWFfbWFzayk7CisJaWYgKGVyciA8IDApIHsKKwkJZGV2X2VycigmcGRldi0+
ZGV2LCAiZmFpbGVkIHRvIHNldCBETUEgbWFzazogJWRcbiIsIGVycik7CisJCXJldHVybiBlcnI7
CisJfQorCiAJdmljID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCp2aWMpLCBHRlBfS0VSTkVM
KTsKIAlpZiAoIXZpYykKIAkJcmV0dXJuIC1FTk9NRU07Ci0tIAoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
