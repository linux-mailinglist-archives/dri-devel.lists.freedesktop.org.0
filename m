Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A704B26931
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 19:37:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FA189C82;
	Wed, 22 May 2019 17:37:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2D289C83
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 17:37:12 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j53so3357879qta.9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 10:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tZML6VkciB7AuKKei7Kqbg+e3K02ODJFh5iugoLa3GU=;
 b=CGywsh2hn6i+sPuRpy9YVxdxumiL8POq6hoq4Ym986Eo54Il/hDr4lbu2UNfvi++Y9
 +i3AzqH29NlR7CDDuBkIqcHUCSuUKPsmhWJvUtDz10OCi5IGEw58Yhz5my3jGTmG2kCU
 ltDKEKr3I5rkoRNlb0ik/e3sGUyubfwG3Gb+NdtFg2R7z401+uT/Xk7+F7Im1vl/kty9
 tOarKVBom/B2HiYGfpUyjDdm4lLQ7mpTqQZ84leIJ9Rmi71viHKcRbnxt4OW68gVLQg1
 oKG+ySVxGS1Y3m7O2+Vv5Q9wknB1MJwheVLk50HUoG73YMgCgDxvhNHuF37EhB5Tzn7d
 VIWA==
X-Gm-Message-State: APjAAAXGwTvB98mxAGLBmcgyZUW/ORKqB1Q5xouEFOaa8XuX0Fu3dYnL
 4u3VK/ClMfXhovx6xmJNvYX0P9AHY8s=
X-Google-Smtp-Source: APXvYqwACFZKaEuG6C4xoOxKoLMhDaml3NRoW801dp1Y62ESCBRpNtQDuDaIvLMtGBgUu36tBg0bUg==
X-Received: by 2002:a0c:8a8d:: with SMTP id 13mr40433344qvv.88.1558546631511; 
 Wed, 22 May 2019 10:37:11 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id w143sm10692969qka.22.2019.05.22.10.37.10
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 10:37:11 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 3/5] drm/msm/a6xx: Check for ERR or NULL before iounmap
Date: Wed, 22 May 2019 13:36:42 -0400
Message-Id: <20190522173656.162006-3-sean@poorly.run>
X-Mailer: git-send-email 2.21.0.1020.gf2820cf01a-goog
In-Reply-To: <20190522173656.162006-1-sean@poorly.run>
References: <20190522173656.162006-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tZML6VkciB7AuKKei7Kqbg+e3K02ODJFh5iugoLa3GU=;
 b=ZqJTTf89H8OWeKKoOJtmynNFXV7rb0e8QnxtvOdBncJjlCKAjY5K6UH3wifhFNrxJv
 ZzgggAfAs3fPRzOXGjd4/ATy83o1+RXlJjPzYFGav7o4ceZ3ecFJgK212EbeR08ZP8Fp
 Gu6ydgPk2bHvWeCaGIfKaK1OTNwD3myVndjGq+fSg1zFMegrAbBGaJFsjntpcNc2GaMy
 1JToWMTj5pmkBFLwKSuoWx6omWw3ELLOOG7g1giTX5hl6YuZebD24oCpGfMq886Le+EK
 EsmBH60VpYZauQbkPDSqVRjqvwuDHIzAME53Cxu34mLZI9yu0GStY03HJk+DEdPmS/dy
 5gtg==
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
Cc: Sean Paul <sean@poorly.run>, Sean Paul <seanpaul@chromium.org>,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpwZGNwdHIgYW5kIHNlcXB0
ciBhcmVuJ3QgbmVjZXNzYXJpbHkgdmFsaWQsIGNoZWNrIHRoZW0gYmVmb3JlIHRyeWluZyB0bwp1
bm1hcCB0aGVtLgoKU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5v
cmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyB8IDYgKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCmluZGV4IDc0MmM4ZmY5YTYxYy4uNzQ2NTQyM2U5
YjcxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMKQEAgLTUwNCw4ICs1MDQs
MTAgQEAgc3RhdGljIHZvaWQgYTZ4eF9nbXVfcnBtaF9pbml0KHN0cnVjdCBhNnh4X2dtdSAqZ211
KQogCXdtYigpOwogCiBlcnI6Ci0JZGV2bV9pb3VubWFwKGdtdS0+ZGV2LCBwZGNwdHIpOwotCWRl
dm1faW91bm1hcChnbXUtPmRldiwgc2VxcHRyKTsKKwlpZiAoIUlTX0VSUl9PUl9OVUxMKHBkY3B0
cikpCisJCWRldm1faW91bm1hcChnbXUtPmRldiwgcGRjcHRyKTsKKwlpZiAoIUlTX0VSUl9PUl9O
VUxMKHNlcXB0cikpCisJCWRldm1faW91bm1hcChnbXUtPmRldiwgc2VxcHRyKTsKIH0KIAogLyoK
LS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
