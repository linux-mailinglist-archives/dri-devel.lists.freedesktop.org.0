Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C699110206
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 741106E849;
	Tue,  3 Dec 2019 16:19:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0946E846
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:19:34 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id b18so4383483wrj.8
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9ZUbS0TeYBzQ9xk9jMtykFneTa+bnz9xud3h/IgQhWg=;
 b=l5mpN46KKeBqpFhHlsExhRBkDieygfkdWSEBkdo50FEM7snWixl73xxcfxWvx4x2EX
 8E5tiPYJGkkLlpAXl6rgEsdwJQAdhsCRi4AHaKV9vqiCYMdBq+lmnBj1PUuimvQcQkoJ
 iUjYc//HdsnUo+XW2LNAkfA4C87Q8z50U2MKNNy7dBtL7sUGRA1mIPu1z89Kv8R0GXue
 AkOjBzDvJoEuM26WrkFuRD1eZE0o1qcX0RoxBjkbF7UoQIuf5QQsbnAjPICneKwN63uo
 RA8q6IekURfr2akPh/Vs8hnfhcF6sWouKsuVteyRNWDMpxMsGyC34BJxxas7yZfuWdc4
 xIGg==
X-Gm-Message-State: APjAAAUxxbEoBse1pLo0+sOCNSuNwldWcFbiJOxl0AdnwbO7QM8xdPAc
 8pjFWjoq7DHouKX4dsxU1ek=
X-Google-Smtp-Source: APXvYqzWo0gREb/Y/VCXKo/0ClOxouv66LLO/irvpmA8yTiFb7RYnplsoFlnrS0PpVvJEFD65Slbsg==
X-Received: by 2002:a5d:630c:: with SMTP id i12mr5980329wru.350.1575389972842; 
 Tue, 03 Dec 2019 08:19:32 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id b67sm3523453wmc.38.2019.12.03.08.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:19:32 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 8/9] drm/tegra: sor: Make the +5V HDMI supply optional
Date: Tue,  3 Dec 2019 17:19:13 +0100
Message-Id: <20191203161914.1312555-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9ZUbS0TeYBzQ9xk9jMtykFneTa+bnz9xud3h/IgQhWg=;
 b=eN5IzUQCemF0bgf3FTV4edwXbi6ykbiMEJouleU81zoKuGgtGnVQLIKdjE6tEhRorq
 rInLv03umG3yQQHl1hiEEn0XyXvu6qwyF9IhnG8Js7Dj+dOTxir8buiq+YjlmBtrOZ1T
 uWXnRYPjvJYmAV9/UPpB3/P4ehCmkfhOVUbV1JK18P7ACMMH2HtYpxBT8uCpdccOiFdc
 5wd5HHR6BnP9yGXBfADW9dBbzzL5ctgWGcPsGKu8odsuuMk49/Ok3EXsQUdMzo1Ml55X
 me5sY71lOEJiGjgQ0dU91sIXl743A/0sfOoHYRv+FPYrbXXf11Kue3L/ehZRy6ccyC36
 9oMw==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBTT1Igc3VwcG9y
dHMgbXVsdGlwbGUgZGlzcGxheSBtb2RlcywgYnV0IG9ubHkgd2hlbiBkcml2aW5nIGFuIEhETUkK
bW9uaXRvciBkb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gY29udHJvbCB0aGUgKzVWIHBvd2VyIHN1cHBs
eS4gZURQIGFuZCBEUApkb24ndCBuZWVkIHRoaXMsIHNvIG1ha2UgaXQgb3B0aW9uYWwuCgpUaGlz
IGZpeGVzIGEgY3Jhc2ggb2JzZXJ2ZWQgZHVyaW5nIHN5c3RlbSBzdXNwZW5kL3Jlc3VtZS4KClJl
dmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQt
b2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMv
Z3B1L2RybS90ZWdyYS9zb3IuYyB8IDE4ICsrKysrKysrKysrKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDE2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3RlZ3JhL3Nvci5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCmluZGV4
IDIyMDBmNGNkMzk3YS4uYTY4ZDNiMzZiOTcyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
dGVncmEvc29yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCkBAIC0zOTcwLDE1
ICszOTcwLDI5IEBAIHN0YXRpYyBpbnQgdGVncmFfc29yX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBk
ZXZpY2UgKmRldikKIHN0YXRpYyBpbnQgdGVncmFfc29yX3N1c3BlbmQoc3RydWN0IGRldmljZSAq
ZGV2KQogewogCXN0cnVjdCB0ZWdyYV9zb3IgKnNvciA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwor
CWludCBlcnI7CisKKwlpZiAoc29yLT5oZG1pX3N1cHBseSkgeworCQllcnIgPSByZWd1bGF0b3Jf
ZGlzYWJsZShzb3ItPmhkbWlfc3VwcGx5KTsKKwkJaWYgKGVyciA8IDApCisJCQlyZXR1cm4gZXJy
OworCX0KIAotCXJldHVybiByZWd1bGF0b3JfZGlzYWJsZShzb3ItPmhkbWlfc3VwcGx5KTsKKwly
ZXR1cm4gMDsKIH0KIAogc3RhdGljIGludCB0ZWdyYV9zb3JfcmVzdW1lKHN0cnVjdCBkZXZpY2Ug
KmRldikKIHsKIAlzdHJ1Y3QgdGVncmFfc29yICpzb3IgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsK
KwlpbnQgZXJyOworCisJaWYgKHNvci0+aGRtaV9zdXBwbHkpIHsKKwkJZXJyID0gcmVndWxhdG9y
X2VuYWJsZShzb3ItPmhkbWlfc3VwcGx5KTsKKwkJaWYgKGVyciA8IDApCisJCQlyZXR1cm4gZXJy
OworCX0KIAotCXJldHVybiByZWd1bGF0b3JfZW5hYmxlKHNvci0+aGRtaV9zdXBwbHkpOworCXJl
dHVybiAwOwogfQogCiBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgdGVncmFfc29yX3Bt
X29wcyA9IHsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
