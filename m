Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B897284AF
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 19:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCBE6E04E;
	Thu, 23 May 2019 17:17:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BEA66E04B
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 17:17:06 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id a17so7661756qth.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 10:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r1uMx4HlXEIWJhoxtRZuApdyrpL8kUyECxg5uM75EcQ=;
 b=YxWkwRVHRrLwV7q6R2zNUQKPb5NT3LJwWbh/uF92pQdh0k/kxwP79LlTsFs7tZcFoQ
 Cw7PHIpN9z+9T6SkE5TcN68B6D0TzsIWdoIECWZ4qbao7k03VGrhmYAej33gNitDp2I2
 NiedM+kftI2Hm+hbcD2bcnbV3eyXCW6hCrcq7YYTFq7C6wBZoGXuiGJ6W3zkHKBD3055
 ESJmTsrLCVd+grwIS4SMvMLkQIP4LtiLGNapRiohHJD83gvlgf+3OXx8AG+AeLpoaKhX
 mtGslYIuEIFHuJNZKVNCFrukWAqh8E7MZCgFOv7Csh9N58eMISSJm2/zNekTzAv7jqdB
 D+LQ==
X-Gm-Message-State: APjAAAWdFSdCrDqYGL+QbdfzR/7xO8Jj0yna4vZTl6oo1lAAZLkZDb6t
 Tbfws2VuI72XmSKKjYu/6Lb52LhzxBs=
X-Google-Smtp-Source: APXvYqw6qd2/bm3XDuds3ElkTbvU8jLAH+jx5B8lOufj9jGw5Pr4Vtmo68zBsIF6kAxsiF4lv8g0xQ==
X-Received: by 2002:ac8:193b:: with SMTP id t56mr58719700qtj.346.1558631824791; 
 Thu, 23 May 2019 10:17:04 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id v25sm662660qtv.2.2019.05.23.10.17.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 May 2019 10:17:04 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v2 3/6] drm/msm/a6xx: Check for ERR or NULL before iounmap
Date: Thu, 23 May 2019 13:16:42 -0400
Message-Id: <20190523171653.138678-3-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
In-Reply-To: <20190523171653.138678-1-sean@poorly.run>
References: <20190523171653.138678-1-sean@poorly.run>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r1uMx4HlXEIWJhoxtRZuApdyrpL8kUyECxg5uM75EcQ=;
 b=fgrbGFp7nygVomfe4EMnidETfJIB6CM+tkh7RLf66aVDXAFgEMGmyMw9ds1JnFIyH9
 aI6FZXYuBnUWJeSXtErJwiDxtWaBOW903lX4oFmcui9xjC217AaXL7s80elnz/ZASXlz
 XZc3P/lyc2al7uYbmMFJjCOXWYFVkZY/4t0Spn/qGhC8I+aINXeNmSKFHV07owyGS+mz
 JaqgNCaTQkh30BlrketQocvxAeF9TIJI7gjm3SU8Bt72QqQYRIJg7fYhmt/V/RXJ35AB
 LpSQxAIY5nnbYUCuAW6D0Nyuaqkh/sCou9XElxa/v1JhsLLD1pRS2+PNyGCEYoyNrqnM
 Rq0w==
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
bm1hcCB0aGVtLgoKQ2hhbmdlcyBpbiB2MjoKLSBOb25lCgpDYzogSm9yZGFuIENyb3VzZSA8amNy
b3VzZUBjb2RlYXVyb3JhLm9yZz4KU2lnbmVkLW9mZi1ieTogU2VhbiBQYXVsIDxzZWFucGF1bEBj
aHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyB8
IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCmluZGV4IDc0MmM4ZmY5YTYxYy4u
NzQ2NTQyM2U5YjcxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4
X2dtdS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMKQEAgLTUw
NCw4ICs1MDQsMTAgQEAgc3RhdGljIHZvaWQgYTZ4eF9nbXVfcnBtaF9pbml0KHN0cnVjdCBhNnh4
X2dtdSAqZ211KQogCXdtYigpOwogCiBlcnI6Ci0JZGV2bV9pb3VubWFwKGdtdS0+ZGV2LCBwZGNw
dHIpOwotCWRldm1faW91bm1hcChnbXUtPmRldiwgc2VxcHRyKTsKKwlpZiAoIUlTX0VSUl9PUl9O
VUxMKHBkY3B0cikpCisJCWRldm1faW91bm1hcChnbXUtPmRldiwgcGRjcHRyKTsKKwlpZiAoIUlT
X0VSUl9PUl9OVUxMKHNlcXB0cikpCisJCWRldm1faW91bm1hcChnbXUtPmRldiwgc2VxcHRyKTsK
IH0KIAogLyoKLS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9t
aXVtIE9TCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
