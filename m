Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC67181A3D
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 14:52:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846306E461;
	Wed, 11 Mar 2020 13:52:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46EA26E430;
 Wed, 11 Mar 2020 13:52:04 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m3so2233298wmi.0;
 Wed, 11 Mar 2020 06:52:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xEoFbydtA55bQRoTqtzVl54mwFx3SL0wixHy09grPa0=;
 b=r7MESjrLBguiuqkJWV5+QhG2ZuQSFkodxlA1aWbNaIXYzGHoRgec96ylrOYaaeMcSQ
 h3g9fCl8X+vf4W9OEJNZUn97AGKgc4JTxzWK6LeWdFf8qVMDJy6wwf2J9IDxPUc5D5ft
 jAMp5egEe2WKoUAqyLz7AcTr6SpCm0tBpbPcUClXcPRp9xyWSqv3I6ueKAnu8wfJnCey
 57rUV5EWInn60cNMUJyI7KBKwAED8wMsCk1fC7Lu+WyPgfyn/9+AhRGeF+USeM1U9nZN
 YmMp41PV9WE/HlSyIkO2hHfqLJjZr0sHHqv5N1TC593JyqRaj2XMKu3KAlFNnQDvZ4hr
 oq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xEoFbydtA55bQRoTqtzVl54mwFx3SL0wixHy09grPa0=;
 b=Tcx+QQmX+jp+dby+FxLcDeaYzzuc7yLZ2/aMtGhx5pa09iByfNsTd+vdCO9t/F0kGx
 8nnz6xcrTNcKhPg7PJRcwotK9F8/AkpS8JB9jSTPTw/LRxUlZKPOPk3lWiOjBLxaVby9
 pJCiMZ67s0mYoCxSceX7dpkgKyARJDa3c2Ko4cdzEXymhD3Hrg8bu/yUnvZROqstSd76
 qrcbQMOOCfWJweFAHW8pU5fz1JR1wtFaTCtKiV9HGXFpJdsMeldhhLr4GD5xeTW6qH7X
 CzEbMZnHT85ydeT3pYTYYn6fYCO4oEnkx4jAn3+TT1E+3sP31wrsSjNEEc8JvAtD8Nw5
 Icag==
X-Gm-Message-State: ANhLgQ02zU4TCmXRr5p2BaEy7904Mq12pjHkbPVvk8nzpeN1p8eIq0YL
 MszTnCKqtMtm1hPwb7bkqZs=
X-Google-Smtp-Source: ADFU+vuIhHcOqb5hYvyJLF0VXhRNUC5gsOSa+CkV8rcXv1Lmvo1T20WArTWant8WOU2t0Mvf9O7HNQ==
X-Received: by 2002:a05:600c:4013:: with SMTP id
 i19mr2532147wmm.28.1583934722955; 
 Wed, 11 Mar 2020 06:52:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8dc:e796:e7da:a319])
 by smtp.gmail.com with ESMTPSA id 138sm3183811wmb.21.2020.03.11.06.52.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 06:52:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: David1.Zhou@amd.com, hch@infradead.org, jgg@ziepe.ca, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/6] dma-buf: add peer2peer flag
Date: Wed, 11 Mar 2020 14:51:54 +0100
Message-Id: <20200311135158.3310-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200311135158.3310-1-christian.koenig@amd.com>
References: <20200311135158.3310-1-christian.koenig@amd.com>
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

QWRkIGEgcGVlcjJwZWVyIGZsYWcgbm90aW5nIHRoYXQgdGhlIGltcG9ydGVyIGNhbiBkZWFsIHdp
dGggZGV2aWNlCnJlc291cmNlcyB3aGljaCBhcmUgbm90IGJhY2tlZCBieSBwYWdlcy4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0t
CiBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgIDIgKysKIGluY2x1ZGUvbGludXgvZG1hLWJ1
Zi5oICAgfCAxMCArKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVm
L2RtYS1idWYuYwppbmRleCBmNGFjZTlhZjIxOTEuLmY5MjIwOTI4ZWM5MCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9kbWEtYnVmL2RtYS1idWYuYworKysgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5j
CkBAIC02ODksNiArNjg5LDggQEAgZG1hX2J1Zl9keW5hbWljX2F0dGFjaChzdHJ1Y3QgZG1hX2J1
ZiAqZG1hYnVmLCBzdHJ1Y3QgZGV2aWNlICpkZXYsCiAKIAlhdHRhY2gtPmRldiA9IGRldjsKIAlh
dHRhY2gtPmRtYWJ1ZiA9IGRtYWJ1ZjsKKwlpZiAoaW1wb3J0ZXJfb3BzKQorCQlhdHRhY2gtPnBl
ZXIycGVlciA9IGltcG9ydGVyX29wcy0+YWxsb3dfcGVlcjJwZWVyOwogCWF0dGFjaC0+aW1wb3J0
ZXJfb3BzID0gaW1wb3J0ZXJfb3BzOwogCWF0dGFjaC0+aW1wb3J0ZXJfcHJpdiA9IGltcG9ydGVy
X3ByaXY7CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oIGIvaW5jbHVkZS9s
aW51eC9kbWEtYnVmLmgKaW5kZXggMWFkZTQ4NmZjMmJiLi44MmUwYTRhNjQ2MDEgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oCisrKyBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5o
CkBAIC0zMzQsNiArMzM0LDE0IEBAIHN0cnVjdCBkbWFfYnVmIHsKICAqIEF0dGFjaG1lbnQgb3Bl
cmF0aW9ucyBpbXBsZW1lbnRlZCBieSB0aGUgaW1wb3J0ZXIuCiAgKi8KIHN0cnVjdCBkbWFfYnVm
X2F0dGFjaF9vcHMgeworCS8qKgorCSAqIEBhbGxvd19wZWVyMnBlZXI6CisJICoKKwkgKiBJZiB0
aGlzIGlzIHNldCB0byB0cnVlIHRoZSBpbXBvcnRlciBtdXN0IGJlIGFibGUgdG8gaGFuZGxlIHBl
ZXIKKwkgKiByZXNvdXJjZXMgd2l0aG91dCBzdHJ1Y3QgcGFnZXMuCisJICovCisJYm9vbCBhbGxv
d19wZWVyMnBlZXI7CisKIAkvKioKIAkgKiBAbW92ZV9ub3RpZnkKIAkgKgpAQCAtMzYyLDYgKzM3
MCw3IEBAIHN0cnVjdCBkbWFfYnVmX2F0dGFjaF9vcHMgewogICogQG5vZGU6IGxpc3Qgb2YgZG1h
X2J1Zl9hdHRhY2htZW50LCBwcm90ZWN0ZWQgYnkgZG1hX3Jlc3YgbG9jayBvZiB0aGUgZG1hYnVm
LgogICogQHNndDogY2FjaGVkIG1hcHBpbmcuCiAgKiBAZGlyOiBkaXJlY3Rpb24gb2YgY2FjaGVk
IG1hcHBpbmcuCisgKiBAcGVlcjJwZWVyOiB0cnVlIGlmIHRoZSBpbXBvcnRlciBjYW4gaGFuZGxl
IHBlZXIgcmVzb3VyY2VzIHdpdGhvdXQgcGFnZXMuCiAgKiBAcHJpdjogZXhwb3J0ZXIgc3BlY2lm
aWMgYXR0YWNobWVudCBkYXRhLgogICogQGltcG9ydGVyX29wczogaW1wb3J0ZXIgb3BlcmF0aW9u
cyBmb3IgdGhpcyBhdHRhY2htZW50LCBpZiBwcm92aWRlZAogICogZG1hX2J1Zl9tYXAvdW5tYXBf
YXR0YWNobWVudCgpIG11c3QgYmUgY2FsbGVkIHdpdGggdGhlIGRtYV9yZXN2IGxvY2sgaGVsZC4K
QEAgLTM4Miw2ICszOTEsNyBAQCBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50IHsKIAlzdHJ1Y3Qg
bGlzdF9oZWFkIG5vZGU7CiAJc3RydWN0IHNnX3RhYmxlICpzZ3Q7CiAJZW51bSBkbWFfZGF0YV9k
aXJlY3Rpb24gZGlyOworCWJvb2wgcGVlcjJwZWVyOwogCWNvbnN0IHN0cnVjdCBkbWFfYnVmX2F0
dGFjaF9vcHMgKmltcG9ydGVyX29wczsKIAl2b2lkICppbXBvcnRlcl9wcml2OwogCXZvaWQgKnBy
aXY7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
