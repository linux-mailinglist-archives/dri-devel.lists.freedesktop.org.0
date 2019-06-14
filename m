Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C23E845D0C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC5B89622;
	Fri, 14 Jun 2019 12:41:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B8038935B;
 Fri, 14 Jun 2019 12:41:32 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id x15so2212244wmj.3;
 Fri, 14 Jun 2019 05:41:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5qK3v8M0/COPEJ7SsWz/6CEIKUUGZmlWZtaz7Lhp+Ls=;
 b=iZpkiq0SeXjov8CZMW2ZeKMIMbqPiwLSx1JIh4V1jh1cBKlo0NOjFkS8XLMGDQZfwz
 GZGm0XStoox88TU9PXieEg5Pm0rFfX7JlxHCZr7Q5dRC375gXqFWbmuzcG5EjzFfVgPa
 uF9M74xa59L8OqEDUmynd1dw6gQmFM5knNlTus8Ki7yTfFLZ3Z4g1EfLmSaYVRWOc03T
 kYtpsK+w7x7EuIzh5iOdtyv+maKxT2a2cxfGxEQfoGBxGVtBo/JRt20xITGrBy/xBrhd
 huzUYYCXR2BXElCgn0YGhk4N9JWmtS7Szgy7HTqg+SjSZkm+J6zA3912yMbLSbtnzsRR
 SV+g==
X-Gm-Message-State: APjAAAVZCm8H+ifAyRGXtjNOPiZgFWNtw/+M0WsZoNCNsI0IpRBNDnB2
 Vu+oIu0vrVUax6Uk9otjEZ8=
X-Google-Smtp-Source: APXvYqx3TdkTr2PERaWPaBgxNyn5HROu2JC1tdlF95OhuMaMEztonewEfp/JX5KXsP6wDZyP4C46VA==
X-Received: by 2002:a1c:7d4e:: with SMTP id y75mr7935115wmc.169.1560516090704; 
 Fri, 14 Jun 2019 05:41:30 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e0eb:ed4e:b781:3e9f])
 by smtp.gmail.com with ESMTPSA id n1sm2648209wrx.39.2019.06.14.05.41.29
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 05:41:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, yuq825@gmail.com, eric@anholt.net,
 peterz@infradead.org, thellstrom@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH 3/6] drm/gem: use new ww_mutex_(un)lock_for_each macros
Date: Fri, 14 Jun 2019 14:41:22 +0200
Message-Id: <20190614124125.124181-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190614124125.124181-1-christian.koenig@amd.com>
References: <20190614124125.124181-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=5qK3v8M0/COPEJ7SsWz/6CEIKUUGZmlWZtaz7Lhp+Ls=;
 b=PdP8kCT5pZ4KuRLTSoxZDOpMV9pdkl9OgGbCB5RREx+hw6lGRrZeeEjtwwZX2q7vN3
 QHlwzO/9Feq+CAo1OidLVlETLzyZ3/F1BoGXW/ESOq77VmJoQbfgTow6jbZpg0ncFkCN
 3E4OMqjqtCGnXGW0fPe139Q5uvVm1LtbwPEEzy3SWD4JEXg5rHZbMl1+8DSwpDaye8ob
 xJ/yxsr0KAGGq16zjraeEe0RRQBNEf7YO/xyoBgg4ZtptfRKqW1mpgPBbgwbtXHYQUjq
 fZ4xVaTOHSsjfkOm3zOCoRTeFZPiiM5hZ0EXVdSc/gv1/EorkEtXNZBOqinC2C9icEFl
 saQg==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHRoZSBwcm92aWRlZCBtYWNyb3MgaW5zdGVhZCBvZiBpbXBsZW1lbnRpbmcgZGVhZGxvY2sg
aGFuZGxpbmcgb24gb3VyIG93bi4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jIHwg
NDkgKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgMzcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKaW5kZXggNTBk
ZTEzOGM4OWUwLi42ZTQ2MjNkM2JlZTIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYwpAQCAtMTMwNyw1MSArMTMwNywy
NiBAQCBpbnQKIGRybV9nZW1fbG9ja19yZXNlcnZhdGlvbnMoc3RydWN0IGRybV9nZW1fb2JqZWN0
ICoqb2JqcywgaW50IGNvdW50LAogCQkJICBzdHJ1Y3Qgd3dfYWNxdWlyZV9jdHggKmFjcXVpcmVf
Y3R4KQogewotCWludCBjb250ZW5kZWQgPSAtMTsKKwlzdHJ1Y3Qgd3dfbXV0ZXggKmNvbnRlbmRl
ZDsKIAlpbnQgaSwgcmV0OwogCiAJd3dfYWNxdWlyZV9pbml0KGFjcXVpcmVfY3R4LCAmcmVzZXJ2
YXRpb25fd3dfY2xhc3MpOwogCi1yZXRyeToKLQlpZiAoY29udGVuZGVkICE9IC0xKSB7Ci0JCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqID0gb2Jqc1tjb250ZW5kZWRdOwotCi0JCXJldCA9IHd3
X211dGV4X2xvY2tfc2xvd19pbnRlcnJ1cHRpYmxlKCZvYmotPnJlc3YtPmxvY2ssCi0JCQkJCQkg
ICAgICAgYWNxdWlyZV9jdHgpOwotCQlpZiAocmV0KSB7Ci0JCQl3d19hY3F1aXJlX2RvbmUoYWNx
dWlyZV9jdHgpOwotCQkJcmV0dXJuIHJldDsKLQkJfQotCX0KLQotCWZvciAoaSA9IDA7IGkgPCBj
b3VudDsgaSsrKSB7Ci0JCWlmIChpID09IGNvbnRlbmRlZCkKLQkJCWNvbnRpbnVlOwotCi0JCXJl
dCA9IHd3X211dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgmb2Jqc1tpXS0+cmVzdi0+bG9jaywKLQkJ
CQkJCSAgYWNxdWlyZV9jdHgpOwotCQlpZiAocmV0KSB7Ci0JCQlpbnQgajsKLQotCQkJZm9yIChq
ID0gMDsgaiA8IGk7IGorKykKLQkJCQl3d19tdXRleF91bmxvY2soJm9ianNbal0tPnJlc3YtPmxv
Y2spOwotCi0JCQlpZiAoY29udGVuZGVkICE9IC0xICYmIGNvbnRlbmRlZCA+PSBpKQotCQkJCXd3
X211dGV4X3VubG9jaygmb2Jqc1tjb250ZW5kZWRdLT5yZXN2LT5sb2NrKTsKLQotCQkJaWYgKHJl
dCA9PSAtRURFQURMSykgewotCQkJCWNvbnRlbmRlZCA9IGk7Ci0JCQkJZ290byByZXRyeTsKLQkJ
CX0KLQotCQkJd3dfYWNxdWlyZV9kb25lKGFjcXVpcmVfY3R4KTsKLQkJCXJldHVybiByZXQ7Ci0J
CX0KLQl9CisJd3dfbXV0ZXhfbG9ja19mb3JfZWFjaChmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkr
KyksCisJCQkgICAgICAgJm9ianNbaV0tPnJlc3YtPmxvY2ssIGNvbnRlbmRlZCwgcmV0LCB0cnVl
LAorCQkJICAgICAgIGFjcXVpcmVfY3R4KQorCQlpZiAocmV0KQorCQkJZ290byBlcnJvcjsKIAog
CXd3X2FjcXVpcmVfZG9uZShhY3F1aXJlX2N0eCk7CiAKIAlyZXR1cm4gMDsKKworZXJyb3I6CisJ
d3dfbXV0ZXhfdW5sb2NrX2Zvcl9lYWNoKGZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSwKKwkJ
CQkgJm9ianNbaV0tPnJlc3YtPmxvY2ssIGNvbnRlbmRlZCk7CisJd3dfYWNxdWlyZV9kb25lKGFj
cXVpcmVfY3R4KTsKKwlyZXR1cm4gcmV0OwogfQogRVhQT1JUX1NZTUJPTChkcm1fZ2VtX2xvY2tf
cmVzZXJ2YXRpb25zKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
