Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7832433F1
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 08:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379446E28A;
	Thu, 13 Aug 2020 06:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0246E28A;
 Thu, 13 Aug 2020 06:21:23 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id v12so4890440ljc.10;
 Wed, 12 Aug 2020 23:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ic1tOm+qheUq6zWKsHFH8/lisv9bz4c0DNj333ORfFc=;
 b=O9T+cO7yS6RByinXxGlmLnMuw8UB7Uq04JQ4MQH8ZaRBOREswU+LwInwis5NeFpWMP
 6b4afB4V0u8+vl74/ktAUqv/5NLckdOirqGtDWy0DnfLDzw0F9uS9oFATKIZak9LD0cR
 EIe1i7j7ul/9h7WHFujo40DWgSI49tHQOpChP2CPy1NIu2Q0p4IeMhjKIPe7GW9sQJzq
 d5c/3lf54qiYjopAmeFXxgIvsdX3ue0RCxavzsT6hs7ZHte2Ni4c0+gpVNyxj8MAJSIz
 jWGfGy0Vt9wMXRy75BmyDOX3dfHEFPWVj3RohotOBYiovpXcbaa+zZho0FsfhquQPZ8v
 IpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ic1tOm+qheUq6zWKsHFH8/lisv9bz4c0DNj333ORfFc=;
 b=Zamr7zQhFo2BTiczKu8VIHW/jzcMDGP3pPfl1n4Ih/keQDSRS77Bg0mRu3KhVdTy2k
 KY7bb6hZ146RbY2BeO7FbUQQCd0uyHwSHrqUATq8GkCyX29yxhTpsVt18zjJ76fXwEYx
 UoPTSTuEuY6BDBCEyj306GwLcIvimZ9zAronD28Fa/3f3Y0owGQlTIPAccCJ0kwjaF4a
 H3s2NEV9om2KdUWYaWud15AGH+u54EhEPNWzjDSBZ8GK4MniksrkWQUfxvyBLRPbMm5y
 /QbgMNpeT1/GlOzzU528bvE5fE7+wniymsBflQHKbIw/I57tOaZfexqyg9TPBGi/QwNb
 IGLg==
X-Gm-Message-State: AOAM531T0KtUrx1qARJsZhsF4tQDbUvxN4z1k4AxA6pO3kVxA3Cihmzi
 y+WMsf57WV7t6Y2PyZB+RvE=
X-Google-Smtp-Source: ABdhPJyX+MvFXLa7uDXAhUUkCxsqv4e8xQyC/os7RXs2QYFFoTANe4fzaGRUHzioE6sQe5EkReoukQ==
X-Received: by 2002:a2e:8144:: with SMTP id t4mr1368074ljg.100.1597299682024; 
 Wed, 12 Aug 2020 23:21:22 -0700 (PDT)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id f14sm964060lfd.2.2020.08.12.23.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 23:21:21 -0700 (PDT)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, boris.ostrovsky@oracle.com, jgross@suse.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 5/5] drm/xen-front: Pass dumb buffer data offset to the
 backend
Date: Thu, 13 Aug 2020 09:21:13 +0300
Message-Id: <20200813062113.11030-6-andr2000@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200813062113.11030-1-andr2000@gmail.com>
References: <20200813062113.11030-1-andr2000@gmail.com>
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
Cc: intel-gfx@lists.freedesktop.org, sstabellini@kernel.org,
 dan.carpenter@oracle.com,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVw
YW0uY29tPgoKV2hpbGUgaW1wb3J0aW5nIGEgZG1hYnVmIGl0IGlzIHBvc3NpYmxlIHRoYXQgdGhl
IGRhdGEgb2YgdGhlIGJ1ZmZlcgppcyBwdXQgd2l0aCBvZmZzZXQgd2hpY2ggaXMgaW5kaWNhdGVk
IGJ5IHRoZSBTR1Qgb2Zmc2V0LgpSZXNwZWN0IHRoZSBvZmZzZXQgdmFsdWUgYW5kIGZvcndhcmQg
aXQgdG8gdGhlIGJhY2tlbmQuCgpTaWduZWQtb2ZmLWJ5OiBPbGVrc2FuZHIgQW5kcnVzaGNoZW5r
byA8b2xla3NhbmRyX2FuZHJ1c2hjaGVua29AZXBhbS5jb20+CkFja2VkLWJ5OiBOb3JhbGYgVHLD
uG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9k
cm1fZnJvbnQuYyAgICAgfCA2ICsrKystLQogZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zy
b250LmggICAgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2dlbS5j
IHwgMyArKy0KIDMgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jIGIvZHJp
dmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250LmMKaW5kZXggNTE4MThlNzZmYWNkLi4zZGQ1
Njc5NDU5M2EgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5jCkBAIC0xNTcsNyArMTU3
LDggQEAgaW50IHhlbl9kcm1fZnJvbnRfbW9kZV9zZXQoc3RydWN0IHhlbl9kcm1fZnJvbnRfZHJt
X3BpcGVsaW5lICpwaXBlbGluZSwKIAogaW50IHhlbl9kcm1fZnJvbnRfZGJ1Zl9jcmVhdGUoc3Ry
dWN0IHhlbl9kcm1fZnJvbnRfaW5mbyAqZnJvbnRfaW5mbywKIAkJCSAgICAgIHU2NCBkYnVmX2Nv
b2tpZSwgdTMyIHdpZHRoLCB1MzIgaGVpZ2h0LAotCQkJICAgICAgdTMyIGJwcCwgdTY0IHNpemUs
IHN0cnVjdCBwYWdlICoqcGFnZXMpCisJCQkgICAgICB1MzIgYnBwLCB1NjQgc2l6ZSwgdTMyIG9m
ZnNldCwKKwkJCSAgICAgIHN0cnVjdCBwYWdlICoqcGFnZXMpCiB7CiAJc3RydWN0IHhlbl9kcm1f
ZnJvbnRfZXZ0Y2hubCAqZXZ0Y2hubDsKIAlzdHJ1Y3QgeGVuX2RybV9mcm9udF9kYnVmICpkYnVm
OwpAQCAtMTk0LDYgKzE5NSw3IEBAIGludCB4ZW5fZHJtX2Zyb250X2RidWZfY3JlYXRlKHN0cnVj
dCB4ZW5fZHJtX2Zyb250X2luZm8gKmZyb250X2luZm8sCiAJcmVxLT5vcC5kYnVmX2NyZWF0ZS5n
cmVmX2RpcmVjdG9yeSA9CiAJCQl4ZW5fZnJvbnRfcGdkaXJfc2hidWZfZ2V0X2Rpcl9zdGFydCgm
ZGJ1Zi0+c2hidWYpOwogCXJlcS0+b3AuZGJ1Zl9jcmVhdGUuYnVmZmVyX3N6ID0gc2l6ZTsKKwly
ZXEtPm9wLmRidWZfY3JlYXRlLmRhdGFfb2ZzID0gb2Zmc2V0OwogCXJlcS0+b3AuZGJ1Zl9jcmVh
dGUuZGJ1Zl9jb29raWUgPSBkYnVmX2Nvb2tpZTsKIAlyZXEtPm9wLmRidWZfY3JlYXRlLndpZHRo
ID0gd2lkdGg7CiAJcmVxLT5vcC5kYnVmX2NyZWF0ZS5oZWlnaHQgPSBoZWlnaHQ7CkBAIC00MDgs
NyArNDEwLDcgQEAgc3RhdGljIGludCB4ZW5fZHJtX2Rydl9kdW1iX2NyZWF0ZShzdHJ1Y3QgZHJt
X2ZpbGUgKmZpbHAsCiAJcmV0ID0geGVuX2RybV9mcm9udF9kYnVmX2NyZWF0ZShkcm1faW5mby0+
ZnJvbnRfaW5mbywKIAkJCQkJeGVuX2RybV9mcm9udF9kYnVmX3RvX2Nvb2tpZShvYmopLAogCQkJ
CQlhcmdzLT53aWR0aCwgYXJncy0+aGVpZ2h0LCBhcmdzLT5icHAsCi0JCQkJCWFyZ3MtPnNpemUs
CisJCQkJCWFyZ3MtPnNpemUsIDAsCiAJCQkJCXhlbl9kcm1fZnJvbnRfZ2VtX2dldF9wYWdlcyhv
YmopKTsKIAlpZiAocmV0KQogCQlnb3RvIGZhaWxfYmFja2VuZDsKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5oIGIvZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5f
ZHJtX2Zyb250LmgKaW5kZXggZjkyYzI1ODM1MGNhLi41NDQ4NmQ4OTY1MGUgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udC5oCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS94ZW4veGVuX2RybV9mcm9udC5oCkBAIC0xNDUsNyArMTQ1LDcgQEAgaW50IHhlbl9kcm1fZnJv
bnRfbW9kZV9zZXQoc3RydWN0IHhlbl9kcm1fZnJvbnRfZHJtX3BpcGVsaW5lICpwaXBlbGluZSwK
IAogaW50IHhlbl9kcm1fZnJvbnRfZGJ1Zl9jcmVhdGUoc3RydWN0IHhlbl9kcm1fZnJvbnRfaW5m
byAqZnJvbnRfaW5mbywKIAkJCSAgICAgIHU2NCBkYnVmX2Nvb2tpZSwgdTMyIHdpZHRoLCB1MzIg
aGVpZ2h0LAotCQkJICAgICAgdTMyIGJwcCwgdTY0IHNpemUsIHN0cnVjdCBwYWdlICoqcGFnZXMp
OworCQkJICAgICAgdTMyIGJwcCwgdTY0IHNpemUsIHUzMiBvZmZzZXQsIHN0cnVjdCBwYWdlICoq
cGFnZXMpOwogCiBpbnQgeGVuX2RybV9mcm9udF9mYl9hdHRhY2goc3RydWN0IHhlbl9kcm1fZnJv
bnRfaW5mbyAqZnJvbnRfaW5mbywKIAkJCSAgICB1NjQgZGJ1Zl9jb29raWUsIHU2NCBmYl9jb29r
aWUsIHUzMiB3aWR0aCwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9m
cm9udF9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2RybV9mcm9udF9nZW0uYwppbmRl
eCA0ZWM4YTQ5MjQxZTEuLjM5ZmY5NWI3NTM1NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3hlbi94ZW5fZHJtX2Zyb250X2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZW4veGVuX2Ry
bV9mcm9udF9nZW0uYwpAQCAtMjEwLDcgKzIxMCw4IEBAIHhlbl9kcm1fZnJvbnRfZ2VtX2ltcG9y
dF9zZ190YWJsZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCiAJcmV0ID0geGVuX2RybV9mcm9u
dF9kYnVmX2NyZWF0ZShkcm1faW5mby0+ZnJvbnRfaW5mbywKIAkJCQkJeGVuX2RybV9mcm9udF9k
YnVmX3RvX2Nvb2tpZSgmeGVuX29iai0+YmFzZSksCi0JCQkJCTAsIDAsIDAsIHNpemUsIHhlbl9v
YmotPnBhZ2VzKTsKKwkJCQkJMCwgMCwgMCwgc2l6ZSwgc2d0LT5zZ2wtPm9mZnNldCwKKwkJCQkJ
eGVuX29iai0+cGFnZXMpOwogCWlmIChyZXQgPCAwKQogCQlyZXR1cm4gRVJSX1BUUihyZXQpOwog
Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
