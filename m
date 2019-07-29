Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFACD7860F
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:17:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 413C389C69;
	Mon, 29 Jul 2019 07:17:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9851289BAC
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 05:33:56 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id p184so27385017pfp.7
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 22:33:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pIe2gKl7IS9bEEUigYBrn5UMc4ulaKfTb5ZjeayByNk=;
 b=Uqm2pvSe8/181NCSK9oEhBt9oym8Jwo9rQa+ufV4uXVsp+9CEInbSiADPQW6svUfl+
 Lq6B4d5VqkEMRAC5h53XhHnx58I10W0Lv+MBaLb5VlobM5v/6NppQHisFIpzutP5J7Nk
 w4kOD2/XswWiCNOEC5ZAtDyatspcKhmPk9fyFAk1fD8+6pm5Z8vPOzeVhH+GZXXCf0HI
 eK/T9u0BhFPIa/0BoC951IgqzmcQn7pV6szBIauBt6JHuBjCOyCX7CWfe0yWPg8cWAIh
 uwoHauoqMyYM3dcwdVevoSRypNgRr8flL4tCcbCCU9PD7JnntuRx0NAq7I3pDk/Gni5C
 KbhA==
X-Gm-Message-State: APjAAAXo3fQJSlu7FENW3MI9mGY0PpqraB4kCVEhLSiXzDUCJDz7iUja
 glAh8rSvW5BSCcDyv+7bIHJlQQ==
X-Google-Smtp-Source: APXvYqx5JaT8+LjEPcm4XYg0mKRR4psCkXVJ2pN1v1DRnW7hKdBb53kqVkzPlXZkzj4x6gfpuX+l7w==
X-Received: by 2002:aa7:85d8:: with SMTP id z24mr26224715pfn.218.1564378436289; 
 Sun, 28 Jul 2019 22:33:56 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:4:4:9712:8cf1:d0f:7d33])
 by smtp.gmail.com with ESMTPSA id z4sm93792810pfg.166.2019.07.28.22.33.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 28 Jul 2019 22:33:55 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthias Brugger <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH v2 1/2] drm/mediatek: use correct device to import PRIME
 buffers
Date: Mon, 29 Jul 2019 14:33:34 +0900
Message-Id: <20190729053335.251379-2-acourbot@chromium.org>
X-Mailer: git-send-email 2.22.0.709.g102302147b-goog
In-Reply-To: <20190729053335.251379-1-acourbot@chromium.org>
References: <20190729053335.251379-1-acourbot@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pIe2gKl7IS9bEEUigYBrn5UMc4ulaKfTb5ZjeayByNk=;
 b=JyPymr7EMJYfUCgqnJBNuymWkG668Al0+SCUrWpz/v5wCJZIOBsjRTa3gy0SrxcoKG
 Bhek67JgDhIS5UHC12lqf6Znlw4JRqGiw7KYcuVaYymDH0Nqfykb5RHltiCt+tD/IXk3
 FuUQETUxDxxj6fYlgN3LhukDLCa6qrcA3WsHU=
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
Cc: Alexandre Courbot <acourbot@chromium.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UFJJTUUgYnVmZmVycyBzaG91bGQgYmUgaW1wb3J0ZWQgdXNpbmcgdGhlIERNQSBkZXZpY2UuIFRv
IHRoaXMgZW5kLCB1c2UKYSBjdXN0b20gaW1wb3J0IGZ1bmN0aW9uIHRoYXQgbWltaWNzIGRybV9n
ZW1fcHJpbWVfaW1wb3J0X2RldigpLCBidXQKcGFzc2VzIHRoZSBjb3JyZWN0IGRldmljZS4KCkZp
eGVzOiAxMTlmNTE3MzYyOGFhICgiZHJtL21lZGlhdGVrOiBBZGQgRFJNIERyaXZlciBmb3IgTWVk
aWF0ZWsgU29DIE1UODE3My4iKQpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNv
dXJib3RAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJt
X2Rydi5jIHwgMTQgKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwpp
bmRleCA5NWZkYmQwZmJjYWMuLjhiMThhMDBhNThjNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVr
L210a19kcm1fZHJ2LmMKQEAgLTMyMCw2ICszMjAsMTggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBm
aWxlX29wZXJhdGlvbnMgbXRrX2RybV9mb3BzID0gewogCS5jb21wYXRfaW9jdGwgPSBkcm1fY29t
cGF0X2lvY3RsLAogfTsKIAorLyoKKyAqIFdlIG5lZWQgdG8gb3ZlcnJpZGUgdGhpcyBiZWNhdXNl
IHRoZSBkZXZpY2UgdXNlZCB0byBpbXBvcnQgdGhlIG1lbW9yeSBpcworICogbm90IGRldi0+ZGV2
LCBhcyBkcm1fZ2VtX3ByaW1lX2ltcG9ydCgpIGV4cGVjdHMuCisgKi8KK3N0cnVjdCBkcm1fZ2Vt
X29iamVjdCAqbXRrX2RybV9nZW1fcHJpbWVfaW1wb3J0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
CisJCQkJCQlzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1ZikKK3sKKwlzdHJ1Y3QgbXRrX2RybV9wcml2
YXRlICpwcml2YXRlID0gZGV2LT5kZXZfcHJpdmF0ZTsKKworCXJldHVybiBkcm1fZ2VtX3ByaW1l
X2ltcG9ydF9kZXYoZGV2LCBkbWFfYnVmLCBwcml2YXRlLT5kbWFfZGV2KTsKK30KKwogc3RhdGlj
IHN0cnVjdCBkcm1fZHJpdmVyIG10a19kcm1fZHJpdmVyID0gewogCS5kcml2ZXJfZmVhdHVyZXMg
PSBEUklWRVJfTU9ERVNFVCB8IERSSVZFUl9HRU0gfCBEUklWRVJfUFJJTUUgfAogCQkJICAgRFJJ
VkVSX0FUT01JQywKQEAgLTMzMSw3ICszNDMsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIg
bXRrX2RybV9kcml2ZXIgPSB7CiAJLnByaW1lX2hhbmRsZV90b19mZCA9IGRybV9nZW1fcHJpbWVf
aGFuZGxlX3RvX2ZkLAogCS5wcmltZV9mZF90b19oYW5kbGUgPSBkcm1fZ2VtX3ByaW1lX2ZkX3Rv
X2hhbmRsZSwKIAkuZ2VtX3ByaW1lX2V4cG9ydCA9IGRybV9nZW1fcHJpbWVfZXhwb3J0LAotCS5n
ZW1fcHJpbWVfaW1wb3J0ID0gZHJtX2dlbV9wcmltZV9pbXBvcnQsCisJLmdlbV9wcmltZV9pbXBv
cnQgPSBtdGtfZHJtX2dlbV9wcmltZV9pbXBvcnQsCiAJLmdlbV9wcmltZV9nZXRfc2dfdGFibGUg
PSBtdGtfZ2VtX3ByaW1lX2dldF9zZ190YWJsZSwKIAkuZ2VtX3ByaW1lX2ltcG9ydF9zZ190YWJs
ZSA9IG10a19nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfbW1hcCA9IG10
a19kcm1fZ2VtX21tYXBfYnVmLAotLSAKMi4yMi4wLjcwOS5nMTAyMzAyMTQ3Yi1nb29nCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
