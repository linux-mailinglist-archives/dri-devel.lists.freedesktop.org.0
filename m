Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F241101FB
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17AD66E842;
	Tue,  3 Dec 2019 16:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE2476E842
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:19:23 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p17so4164444wmi.3
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=13dFyRuLsyW17L3u2HAbZCErRk1PbJ6inYhyuChxpmg=;
 b=JhAYJvE4iZGO0d0Cbn7pJQI9L+sSupNvQtlOsu4h5SrcFTCG9QdwTqhl5wvBabzuW9
 tYGbrx5dS83zydVthgQSh1MpBCvuQtuP43T6W6g+bK9aMemzUnteF1ZLo0TBwG6xyOco
 OQ/CDj33bBxO600PzSXUrAdhySovydEaN4xci2eWZQ5BLTUDvBnfBoK2uICYOrwPFOrl
 NxXQlQbDtnQKVwhjvS6YlePrNirsFg8PHThOMu2z5rQGXCQ3LG3FS+PF+MHIWNLp86VW
 MYhELfaZAff95AyycoDbzJnCh4SesEohUn2xj0VDKdBuSmkZ5OXiAssk2uvoi2K+rg0f
 Ldjw==
X-Gm-Message-State: APjAAAXOcBuyffW0O5HPJTE9Z/r5pCEPbXWk/j7zz/tmJnDNpo2WQIpB
 q+OAY9d6PjCRY2Ut3XRYQ2U=
X-Google-Smtp-Source: APXvYqz/z7cWbhRIA/RS2LVcKFh88eK0TxN7IMSGMD/oby9NvGZZmwhcOQvVZi+xjZ4n9c13I9N4Rw==
X-Received: by 2002:a1c:1f56:: with SMTP id f83mr36446287wmf.93.1575389962291; 
 Tue, 03 Dec 2019 08:19:22 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id z13sm3619750wmi.18.2019.12.03.08.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:19:20 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 3/9] drm/tegra: gem: Remove premature import restrictions
Date: Tue,  3 Dec 2019 17:19:08 +0100
Message-Id: <20191203161914.1312555-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=13dFyRuLsyW17L3u2HAbZCErRk1PbJ6inYhyuChxpmg=;
 b=vb9/WSWv8RFWMt8ae7K+046gviWArn2nCvSELxg/IJxynNXa3TtXmebq1XvZbHPCP1
 jLXCrm5krgUzUg+7uBVkbRisQdlgOvUof2Kp5S6k3EYLs0INzTFzvXtnib953Ux1OF9q
 6gQ6JYKRnB/RJxRRBbDdjMDDfWdT4EOEM0gznGBHwV+7uYsZXUUFlG+vPJXUnsRh7alD
 mOS5PxV1j8UbhhcocaSLNnHSSPAlcMUe5cgadKt8exOK+T2J3acdj2JbofI4zapdJmVy
 w35Oc6R+jWs+H2GtnizeznUQxFmLtopdWeCE9FQNm1YF4wBFfEqXIWvo6hkO5AZYdyMU
 UVsw==
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkFsbCB0aGUgZGlzcGxh
eSByZWxhdGVkIGJsb2NrcyBvbiBUZWdyYSByZXF1aXJlIGNvbnRpZ3VvdXMgbWVtb3J5LiBVc2lu
Zwp0aGUgRE1BIEFQSSwgdGhlcmUgaXMgbm8ga25vd2luZyBhdCBpbXBvcnQgdGltZSB3aGljaCBk
ZXZpY2Ugd2lsbCBlbmQgdXAKdXNpbmcgdGhlIGJ1ZmZlciwgc28gaXQncyBub3Qga25vd24gd2hl
dGhlciBvciBub3QgYW4gSU9NTVUgd2lsbCBiZSB1c2VkCnRvIG1hcCB0aGUgYnVmZmVyLgoKTW92
ZSB0aGUgY2hlY2sgZm9yIG5vbi1jb250aWd1b3VzIGJ1ZmZlcnMvbWFwcGluZ3MgdG8gdGhlIHRl
Z3JhX2RjX3BpbigpCmZ1bmN0aW9uIHdoaWNoIGlzIG5vdyB0aGUgZWFybGllc3QgcG9pbnQgd2hl
cmUgaXQgaXMga25vd24gaWYgYSBETUEgQlVGCmNhbiBiZSB1c2VkIGJ5IHRoZSBnaXZlbiBkZXZp
Y2Ugb3Igbm90LgoKdjI6IGFkZCBjaGVjayBmb3IgY29udGlndW91cyBidWZmZXIvbWFwcGluZyBp
biB0ZWdyYV9kY19waW4oKQoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5nIDx0cmVkaW5nQG52aWRp
YS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jICAgfCAgNyAtLS0tLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdGVncmEvcGxhbmUuYyB8IDExICsrKysrKysrKysrCiAyIGZpbGVzIGNo
YW5nZWQsIDExIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jCmlu
ZGV4IDZkZmFkNTZlZWUyYi4uYmMxNWI0MzAxNTZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vdGVncmEvZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2dlbS5jCkBAIC00NDAs
MTMgKzQ0MCw2IEBAIHN0YXRpYyBzdHJ1Y3QgdGVncmFfYm8gKnRlZ3JhX2JvX2ltcG9ydChzdHJ1
Y3QgZHJtX2RldmljZSAqZHJtLAogCQllcnIgPSB0ZWdyYV9ib19pb21tdV9tYXAodGVncmEsIGJv
KTsKIAkJaWYgKGVyciA8IDApCiAJCQlnb3RvIGRldGFjaDsKLQl9IGVsc2UgewotCQlpZiAoYm8t
PnNndC0+bmVudHMgPiAxKSB7Ci0JCQllcnIgPSAtRUlOVkFMOwotCQkJZ290byBkZXRhY2g7Ci0J
CX0KLQotCQliby0+aW92YSA9IHNnX2RtYV9hZGRyZXNzKGJvLT5zZ3QtPnNnbCk7CiAJfQogCiAJ
Ym8tPmdlbS5pbXBvcnRfYXR0YWNoID0gYXR0YWNoOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL3RlZ3JhL3BsYW5lLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvcGxhbmUuYwppbmRleCAx
NjNiNTkwYmUyMjQuLmNhZGNkZDllYTQyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL3BsYW5lLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3BsYW5lLmMKQEAgLTEyOSw2
ICsxMjksMTcgQEAgc3RhdGljIGludCB0ZWdyYV9kY19waW4oc3RydWN0IHRlZ3JhX2RjICpkYywg
c3RydWN0IHRlZ3JhX3BsYW5lX3N0YXRlICpzdGF0ZSkKIAkJCQlnb3RvIHVucGluOwogCQkJfQog
CisJCQkvKgorCQkJICogVGhlIGRpc3BsYXkgY29udHJvbGxlciBuZWVkcyBjb250aWd1b3VzIG1l
bW9yeSwgc28KKwkJCSAqIGZhaWwgaWYgdGhlIGJ1ZmZlciBpcyBkaXNjb250aWd1b3VzIGFuZCB3
ZSBmYWlsIHRvCisJCQkgKiBtYXAgaXRzIFNHIHRhYmxlIHRvIGEgc2luZ2xlIGNvbnRpZ3VvdXMg
Y2h1bmsgb2YKKwkJCSAqIEkvTyB2aXJ0dWFsIG1lbW9yeS4KKwkJCSAqLworCQkJaWYgKGVyciA+
IDEpIHsKKwkJCQllcnIgPSAtRUlOVkFMOworCQkJCWdvdG8gdW5waW47CisJCQl9CisKIAkJCXN0
YXRlLT5pb3ZhW2ldID0gc2dfZG1hX2FkZHJlc3Moc2d0LT5zZ2wpOwogCQkJc3RhdGUtPnNndFtp
XSA9IHNndDsKIAkJfSBlbHNlIHsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
