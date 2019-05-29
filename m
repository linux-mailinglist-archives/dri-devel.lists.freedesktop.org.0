Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AC52DBAA
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 13:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 051866E2DC;
	Wed, 29 May 2019 11:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A52146E0E2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 10:26:48 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w34so1095041pga.12
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 03:26:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zkf9FoxdryyDt1X+5P+GJSoX1FiD3J3GXj2LP0N8rdU=;
 b=rxRmjHvXX+pLNrDAbUg02PXyXZQgeOBIAl5b1vwiwdCbkuBI5SpdAopT1XufJbQE+T
 HAcr51KHmuOcWRZeI4SmfJpb6fMVXZBFG0BTsRDJN8HB0IxEpoJ2tAbpwxypI7+CqZWz
 IElPHvZ96EmZsWdkHg/wQR0Aj+aGzc4v2jnw6iT7FICVm0YU68xXIr5P67Z2cYQ88PcV
 /sX/Yifyop6zBLinmUH3Su+FDHRbOeoMgehEXWyoNJcAi8G2IlvcZD3W08+RcX5auau+
 EEFFlzkTnXBCK51YbLZMRDip+acTh2PzHLkUsguTsdp4RpzDrGE8PbSg0J6oGxt9p/AW
 O0JA==
X-Gm-Message-State: APjAAAUx/+6SkLb6GyJH6V7FSVxE0j66koSWUADWU9+5qWNshRj/iUUK
 UTo+5PPSUzAlcO1WRyQbB8zzqw==
X-Google-Smtp-Source: APXvYqwnrc9pdx47YY9TRS/DoiPhrNWvI1W5hjidPKQ2diP8prk0BV504pPU4kJBaFleNW4weG407w==
X-Received: by 2002:a62:d244:: with SMTP id
 c65mr111971351pfg.173.1559125608082; 
 Wed, 29 May 2019 03:26:48 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id e12sm18992183pfl.122.2019.05.29.03.26.46
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 29 May 2019 03:26:47 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 3/4] drm: mediatek: call drm_atomic_helper_shutdown() when
 unbinding driver
Date: Wed, 29 May 2019 18:25:54 +0800
Message-Id: <20190529102555.251579-4-hsinyi@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190529102555.251579-1-hsinyi@chromium.org>
References: <20190529102555.251579-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 29 May 2019 11:20:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zkf9FoxdryyDt1X+5P+GJSoX1FiD3J3GXj2LP0N8rdU=;
 b=KrJR7S9O4TEFHPeGH3rkqlofANGLf5xPlPIkRdAwYAC4yHaXwn/r/L5YxrLyP6L7K5
 qaAvmgB0+oizqOfAJqwCXO6Bb570+HJHpI4ecYCXN0wEWCx0ClL1x6NMDWXAVOfvHBRR
 rfpWfc3r/oA8m007TQhh7sV5qE4QAleSuWEsI=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c2h1dGRvd24gYWxsIENSVEMgd2hlbiB1bmJpbmRpbmcgZHJtIGRyaXZlci4KCkZpeGVzOiAxMTlm
NTE3MzYyOGEgKCJkcm0vbWVkaWF0ZWs6IEFkZCBEUk0gRHJpdmVyIGZvciBNZWRpYXRlayBTb0Mg
TVQ4MTczLiIpClNpZ25lZC1vZmYtYnk6IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9y
Zz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDEgKwogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Ry
bV9kcnYuYwppbmRleCBlNzM2MmJkYWZhODIuLjg3MThkMTIzY2NhYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMKQEAgLTMxMSw2ICszMTEsNyBAQCBzdGF0aWMgaW50IG10
a19kcm1fa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKIHN0YXRpYyB2b2lkIG10a19k
cm1fa21zX2RlaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQogewogCWRybV9rbXNfaGVscGVy
X3BvbGxfZmluaShkcm0pOworCWRybV9hdG9taWNfaGVscGVyX3NodXRkb3duKGRybSk7CiAKIAlj
b21wb25lbnRfdW5iaW5kX2FsbChkcm0tPmRldiwgZHJtKTsKIAlkcm1fbW9kZV9jb25maWdfY2xl
YW51cChkcm0pOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
