Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1619095153
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 01:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47C86E489;
	Mon, 19 Aug 2019 23:04:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4785C6E489
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 23:03:58 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id w16so2077896pfn.7
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 16:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=KEp0elOXwEygi2UwLXppvJt7Q3Cx6Htjn7Pk6SXSqQ8=;
 b=cei/hUcroemYB6lAtmZR5oVa8tKZpR2knBKNgvlHlIz8f1uqgV9vh3iCUlsDR9RSle
 qZIAF00WdCUpfjhjECCItGPRC+DR/So3orOb9Ac5PwzYplp9tM7h6k/t6mf+oajpydGH
 lMcmwwBoTG8YAMN13DWsSe6MrolLxsZ8u4s9ug18vcm5SBY0XIop6Qbklu4GO2VX1f/i
 hipqKDIV6/J8M0h6NplC3jaEWJfM6UdXcmJilayH5TAlhelDRXGBxDxpelaI0k29vyZA
 8m/7wcaBlMWvo7K+Gl7mjb8gzJ95bDJUYh+B4+zWZygBOjp0IC6wAZKZ254avLSvhbAn
 R87w==
X-Gm-Message-State: APjAAAXLPqSj8KdpZpQaqDJFL5jKh6UboFNFEutUWPPxBOIhp48j2yHN
 YjvSYj7eruN8+IhFLKTJ7Dm3tw==
X-Google-Smtp-Source: APXvYqzy7dL1PlN9gj3IYtPQmc4I8figOnswPtwMOyqf8D1q6BzRiYl/2/7Jcm3uza9avL8EUpXNcA==
X-Received: by 2002:a17:90a:246f:: with SMTP id
 h102mr22983749pje.125.1566255837541; 
 Mon, 19 Aug 2019 16:03:57 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 j15sm17256509pfr.146.2019.08.19.16.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 16:03:56 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 21/25] drm: kirin: Fix dev->driver_data setting
Date: Mon, 19 Aug 2019 23:03:17 +0000
Message-Id: <20190819230321.56480-22-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819230321.56480-1-john.stultz@linaro.org>
References: <20190819230321.56480-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=KEp0elOXwEygi2UwLXppvJt7Q3Cx6Htjn7Pk6SXSqQ8=;
 b=pdOoZu3g7oZCCwI/bXh7Isj1qi7y7cuAYZjlN+hZ8RJndngrGKe3jT/YScIyRDgMNT
 pYPVudymwquCht5UccK02DFM0AWhxmeVDVk9bC7pe4gffL873wQNepON+skjV6CtE8H4
 Jg6wdtOlhCm0vdb7MzFzOQehTSRG39gQQ2HOIoDeqjTWTtSr7zFMlcEs6IRu4fx7BV5Q
 Lq03F/OWNw/VyGswq7MnHya73oZtDsyq0wG/DccFS6mpab9sVNYoOxLb5pRaUtxvv1oc
 zON5zefzInYHEyMcWe3tYkxeRyKDep2/fRF21Sdmw4m/xzXqqt5c+2JIPXzMqxdukfGQ
 FUoQ==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggY2hhbmdlcyB0aGUKZGV2LT5kcml2ZXJfZGF0YSB0
byBwb2ludCB0byBhIGRybV9kZXZpY2UsIG5vdCBhZGVfZGF0YS4KClRodXMgd2Ugc2V0IHRoZSBk
cml2ZXIgZGF0YSB0byBkcm0gZGV2aWNlIGFmdGVyIGFsbG9jLgoKQ2M6IFJvbmdyb25nIFpvdSA8
em91cm9uZ3JvbmdAZ21haWwuY29tPgpDYzogWGlubGlhbmcgTGl1IDx6LmxpdXhpbmxpYW5nQGhp
c2lsaWNvbi5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5p
ZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBkcmktZGV2ZWwgPGRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkFj
a2VkLWJ5OiBYaW5saWFuZyBMaXUgPHoubGl1eGlubGlhbmdAaGlzaWxpY29uLmNvbT4KUmV2aWV3
ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KU2lnbmVkLW9mZi1ieTogWHUg
WWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgpbanN0dWx0ejogUmV3b3JkZWQgY29tbWl0
IG1lc3NhZ2VdClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxqb2huLnN0dWx0ekBsaW5hcm8u
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5j
IHwgMSAtCiBkcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9kcnYuYyB8
IDMgKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Fk
ZS5jIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMKaW5k
ZXggYTBjYzEyODU1MTJiLi5hN2ZlMmZjNTdiZjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9o
aXNpbGljb24va2lyaW4va2lyaW5fZHJtX2FkZS5jCkBAIC05OTgsNyArOTk4LDYgQEAgc3RhdGlj
IGludCBhZGVfZHJtX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAkJRFJNX0VS
Uk9SKCJmYWlsZWQgdG8gYWxsb2MgYWRlX2RhdGFcbiIpOwogCQlyZXR1cm4gLUVOT01FTTsKIAl9
Ci0JcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwgYWRlKTsKIAogCWN0eCA9IGFkZV9od19jdHhf
YWxsb2MocGRldiwgJmFkZS0+Y3J0Yy5iYXNlKTsKIAlpZiAoSVNfRVJSKGN0eCkpIHsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmMKaW5kZXggZjky
YjNmN2RlNWMwLi41NWM4ZGJiNjhiZTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9oaXNp
bGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGlj
b24va2lyaW4va2lyaW5fZHJtX2Rydi5jCkBAIC00NCw4ICs0NCw2IEBAIHN0YXRpYyBpbnQga2ly
aW5fZHJtX2ttc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiB7CiAJaW50IHJldDsKIAot
CWRldl9zZXRfZHJ2ZGF0YShkZXYtPmRldiwgZGV2KTsKLQogCS8qIGRldi0+bW9kZV9jb25maWcg
aW5pdGlhbGl6YXRpb24gKi8KIAlkcm1fbW9kZV9jb25maWdfaW5pdChkZXYpOwogCWRldi0+bW9k
ZV9jb25maWcubWluX3dpZHRoID0gMDsKQEAgLTE0MCw2ICsxMzgsNyBAQCBzdGF0aWMgaW50IGtp
cmluX2RybV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAlkcm1fZGV2ID0gZHJtX2Rldl9hbGxv
Yyhkcml2ZXJfZGF0YS0+ZHJpdmVyLCBkZXYpOwogCWlmIChJU19FUlIoZHJtX2RldikpCiAJCXJl
dHVybiBQVFJfRVJSKGRybV9kZXYpOworCWRldl9zZXRfZHJ2ZGF0YShkZXYsIGRybV9kZXYpOwog
CiAJcmV0ID0ga2lyaW5fZHJtX2ttc19pbml0KGRybV9kZXYpOwogCWlmIChyZXQpCi0tIAoyLjE3
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
