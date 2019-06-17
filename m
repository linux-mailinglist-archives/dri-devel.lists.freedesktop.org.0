Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD6B4910A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 22:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451D96E093;
	Mon, 17 Jun 2019 20:13:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F516E092
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 20:13:27 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id i125so7043760qkd.6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 13:13:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D9vtTE1uu7WSSe5bzXxeqh5Pv0FUN5RIu6vYbEXrF8A=;
 b=iJ+J4N/Fvqqwu5SV9r5QgUvtOmASBxXPWHcYBxYsyB1T7hQjnlp5RU6f3RLf41rQtC
 5eP4vSNzmp6FHZACKBg3s2i+CSaM9V6q6BJBmG0jNm3NVuxnMVOrlrA3N1zij8bFKyzL
 2bDs3NeOsz4N5+yVw3K5JEOjKX1HUvJ167ZtxTBjawHO1XtZiyh4XNNL5vtNH8HmMR68
 s9DXRKyrl/LmxzZ8pGyamSgMz6GbpDay0NOqulBFTAfQPzy9a0JO0G2/0jG5q0L7peh6
 lOiJv6M4wTE72s0MX2iEWxn7jxA5ScCWyci28Hsl9wpJy9ks5p0lZT2hbKHx/683fuej
 ixhQ==
X-Gm-Message-State: APjAAAWSDPjICQrjDkSq3jP2LiLtHikJ9b1eKRVD2XqPEOK+VgdKfjV2
 AgDLYldtN4dBU7xWdhB4sliPSdOd8h0=
X-Google-Smtp-Source: APXvYqwRttgaGQFTtNVWoB5PmdoUs3ejqU2sykdk+7qCjJiTQMBg5n+8PdNRbeKOTmjf13lBs2t1qQ==
X-Received: by 2002:a37:e409:: with SMTP id y9mr3320964qkf.109.1560802406629; 
 Mon, 17 Jun 2019 13:13:26 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([100.100.175.19])
 by smtp.gmail.com with ESMTPSA id r36sm7071563qte.71.2019.06.17.13.13.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 17 Jun 2019 13:13:26 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 06/13] drm/msm: Depopulate platform on probe failure
Date: Mon, 17 Jun 2019 16:12:51 -0400
Message-Id: <20190617201301.133275-3-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190617201301.133275-1-sean@poorly.run>
References: <20190617200405.131843-1-sean@poorly.run>
 <20190617201301.133275-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D9vtTE1uu7WSSe5bzXxeqh5Pv0FUN5RIu6vYbEXrF8A=;
 b=fpd+XlVHxuYShYaEvyip30CxvwKcR0saECXTR4hqh332wfxPDlqHVxiftFD6mMr/+b
 QnrtlgIxMp9OgSi2jCgHZpN2axclpw+fdiqs2nqOjT2k/PSyb7PWQQ10X+19NKoJgcGA
 22XOkETtu7qGUZ0fPveEILO+TxrB6X26yjwYxHpkfAKBYC32FGuuoGCCPW06klLd6tiK
 UT6kFoymg9yakYGmDy4RE0djd0ePY/bYBi0PM5wvHAKDcQlkRkvI3KyDyL/YtnNLrHWX
 1z/tup9VjhNqHhDtRACg8LqF4IiQy1sUR3EVIIMxDFE3ZNCY88qeMHjSbKX2puf18ctg
 bTXQ==
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sean Paul <seanpaul@chromium.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgphZGRfZGlzcGxheV9jb21w
b25lbnRzKCkgY2FsbHMgb2ZfcGxhdGZvcm1fcG9wdWxhdGUsIGFuZCB3ZSBkZXBvcGx1YXRlCm9u
IHBkZXYgcmVtb3ZlLCBidXQgbm90IHdoZW4gcHJvYmUgZmFpbHMuIFNvIGlmIHdlIGdldCBhIHBy
b2JlIGRlZmVycmFsCmluIG9uZSBvZiB0aGUgY29tcG9uZW50cywgd2Ugd29uJ3QgZGVwb3B1bGF0
ZSB0aGUgcGxhdGZvcm0uIFRoaXMgY2F1c2VzCnRoZSBjb3JlIHRvIGtlZXAgcmVmZXJlbmNlcyB0
byBkZXZpY2VzIHdoaWNoIHNob3VsZCBiZSBkZXN0cm95ZWQsIHdoaWNoCmNhdXNlcyBpc3N1ZXMg
d2hlbiB0aG9zZSBzYW1lIGRldmljZXMgdHJ5IHRvIHJlLWluaXRpYWxpemUgb24gdGhlIG5leHQK
cHJvYmUgYXR0ZW1wdC4KCkkgdGhpbmsgdGhpcyBpcyB0aGUgcmVhc29uIHdlIGhhZCBpc3N1ZXMg
d2l0aCB0aGUgZ211J3MgZGV2aWNlLW1hbmFnZWQKcmVzb3VyY2VzIG9uIGRlZmVycmFsICh3b3Jr
ZWQgYXJvdW5kIGluIGNvbW1pdCA5NGUzYTE3ZjMzYTUpLgoKU2lnbmVkLW9mZi1ieTogU2VhbiBQ
YXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21f
ZHJ2LmMgfCAxNCArKysrKysrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMo
KyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21f
ZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYwppbmRleCAzMWRlYjg3YWJmYzYu
LmJmOTllZTEzODYwMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKQEAgLTEzMTcsMTYgKzEzMTcsMjQg
QEAgc3RhdGljIGludCBtc21fcGRldl9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQogCiAJcmV0ID0gYWRkX2dwdV9jb21wb25lbnRzKCZwZGV2LT5kZXYsICZtYXRjaCk7CiAJaWYg
KHJldCkKLQkJcmV0dXJuIHJldDsKKwkJZ290byBmYWlsOwogCiAJLyogb24gYWxsIGRldmljZXMg
dGhhdCBJIGFtIGF3YXJlIG9mLCBpb21tdSdzIHdoaWNoIGNhbiBtYXAKIAkgKiBhbnkgYWRkcmVz
cyB0aGUgY3B1IGNhbiBzZWUgYXJlIHVzZWQ6CiAJICovCiAJcmV0ID0gZG1hX3NldF9tYXNrX2Fu
ZF9jb2hlcmVudCgmcGRldi0+ZGV2LCB+MCk7CiAJaWYgKHJldCkKLQkJcmV0dXJuIHJldDsKKwkJ
Z290byBmYWlsOworCisJcmV0ID0gY29tcG9uZW50X21hc3Rlcl9hZGRfd2l0aF9tYXRjaCgmcGRl
di0+ZGV2LCAmbXNtX2RybV9vcHMsIG1hdGNoKTsKKwlpZiAocmV0KQorCQlnb3RvIGZhaWw7CiAK
LQlyZXR1cm4gY29tcG9uZW50X21hc3Rlcl9hZGRfd2l0aF9tYXRjaCgmcGRldi0+ZGV2LCAmbXNt
X2RybV9vcHMsIG1hdGNoKTsKKwlyZXR1cm4gMDsKKworZmFpbDoKKwlvZl9wbGF0Zm9ybV9kZXBv
cHVsYXRlKCZwZGV2LT5kZXYpOworCXJldHVybiByZXQ7CiB9CiAKIHN0YXRpYyBpbnQgbXNtX3Bk
ZXZfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCi0tIApTZWFuIFBhdWwsIFNv
ZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
