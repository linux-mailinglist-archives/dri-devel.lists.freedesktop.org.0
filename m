Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B777445D10
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE1D89829;
	Fri, 14 Jun 2019 12:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5083B89829;
 Fri, 14 Jun 2019 12:41:34 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id s3so2216910wms.2;
 Fri, 14 Jun 2019 05:41:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ikrEbSutjHRTcQQg/Oha1wtsctApdZhOcWN+4xePnrs=;
 b=L3FmMQhHqbEb8mA6al7x4dxT5LNe44A5arh3FYTtsBrGnbrQoKhO2aNYmxsskmXNpk
 B6L0yZl+XWD4B9D4reW+FuJvsT5+4FPQS1QxA01OBsaOUQGvWoMNdKqKY2WEmVtRcPAV
 xF4uUpvKSHu0SVxY69lebBWmNFmpoJH/pCmBgjSYZyZn7+VcuOfXFik22/jcw8/Nre6F
 tUHDpg+E7lwAyN7oJ0CIRKp8OFNfp6stMuQfRCpexTW7653qe9pXQqETEtZb4afDCAHV
 5D7J3RlN7DWBSmfx1cd/lnxLw3hjW+g2yuKpEgz1vaRu6OE9dslPTjqAlqulb6mcRPxo
 XvLw==
X-Gm-Message-State: APjAAAXg/IjrlQG1KTiMALTRrPvMeJ1qHJHBgS2OYS4NA7FhOWZHNntD
 yrvyy1DlDmMxjlpzyjwcqCs=
X-Google-Smtp-Source: APXvYqzBD/dbXM9Coe83f5O64MsEtVJFQksKIgSL9I3SUrQShnBIHgrA7EisTvPuUH3e/3GJB6jZGQ==
X-Received: by 2002:a1c:b68a:: with SMTP id g132mr8217905wmf.66.1560516092658; 
 Fri, 14 Jun 2019 05:41:32 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:e0eb:ed4e:b781:3e9f])
 by smtp.gmail.com with ESMTPSA id n1sm2648209wrx.39.2019.06.14.05.41.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 14 Jun 2019 05:41:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, yuq825@gmail.com, eric@anholt.net,
 peterz@infradead.org, thellstrom@vmware.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 etnaviv@lists.freedesktop.org, lima@lists.freedesktop.org
Subject: [PATCH 5/6] drm/lima: use new ww_mutex_(un)lock_for_each macros
Date: Fri, 14 Jun 2019 14:41:24 +0200
Message-Id: <20190614124125.124181-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190614124125.124181-1-christian.koenig@amd.com>
References: <20190614124125.124181-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ikrEbSutjHRTcQQg/Oha1wtsctApdZhOcWN+4xePnrs=;
 b=J4wmh8s2eFE78lNG3SgNS9fKgrTvJi8/54g0IibJPJZZLJSZZroXgvM3cDQBfax8gC
 BI0uYyZq8q5SE+NG2+C8YcNagSzCtbkp1rHtnOpRlGdSUODFpU5nfNb3iC9TX9wPwyew
 43aXDF8/CA9PR86IJm8dsl6uzj4ZyRKba312BUdmjUrVObB2pOxgt4h/veMHB3y3LuvR
 vbWfh1k0LPuH0co5IF4onLQmH0BxKNWm6j/T2nqQUKLYlM1wkSyYqdj2/+K53Kl2RcS9
 dZEpfI1sRPZhEdIDHoHIDrD4gMlw9sWFF9uDD2bdNzXIWFkXcSMnkaggJHataqIUW5+W
 Jycg==
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
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbGltYS9saW1hX2dl
bS5jIHwgNDEgKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTEgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2xpbWEvbGltYV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9saW1hL2xpbWFfZ2Vt
LmMKaW5kZXggNDc3YzBmNzY2NjYzLi42YTUxZjEwMGMyOWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9saW1hL2xpbWFfZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2xpbWEvbGltYV9n
ZW0uYwpAQCAtMTUxLDQzICsxNTEsMjQgQEAgc3RhdGljIGludCBsaW1hX2dlbV9zeW5jX2JvKHN0
cnVjdCBsaW1hX3NjaGVkX3Rhc2sgKnRhc2ssIHN0cnVjdCBsaW1hX2JvICpibywKIHN0YXRpYyBp
bnQgbGltYV9nZW1fbG9ja19ib3Moc3RydWN0IGxpbWFfYm8gKipib3MsIHUzMiBucl9ib3MsCiAJ
CQkgICAgIHN0cnVjdCB3d19hY3F1aXJlX2N0eCAqY3R4KQogewotCWludCBpLCByZXQgPSAwLCBj
b250ZW5kZWQsIHNsb3dfbG9ja2VkID0gLTE7CisJc3RydWN0IHd3X211dGV4ICpjb250ZW5kZWQ7
CisJaW50IGksIHJldCA9IDA7CiAKIAl3d19hY3F1aXJlX2luaXQoY3R4LCAmcmVzZXJ2YXRpb25f
d3dfY2xhc3MpOwogCi1yZXRyeToKLQlmb3IgKGkgPSAwOyBpIDwgbnJfYm9zOyBpKyspIHsKLQkJ
aWYgKGkgPT0gc2xvd19sb2NrZWQpIHsKLQkJCXNsb3dfbG9ja2VkID0gLTE7Ci0JCQljb250aW51
ZTsKLQkJfQotCi0JCXJldCA9IHd3X211dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgmYm9zW2ldLT5n
ZW0ucmVzdi0+bG9jaywgY3R4KTsKLQkJaWYgKHJldCA8IDApIHsKLQkJCWNvbnRlbmRlZCA9IGk7
Ci0JCQlnb3RvIGVycjsKLQkJfQotCX0KKwl3d19tdXRleF9sb2NrX2Zvcl9lYWNoKGZvciAoaSA9
IDA7IGkgPCBucl9ib3M7IGkrKyksCisJCQkgICAgICAgJmJvc1tpXS0+Z2VtLnJlc3YtPmxvY2ss
IGNvbnRlbmRlZCwgcmV0LCB0cnVlLAorCQkJICAgICAgIGN0eCkKKwkJaWYgKHJldCkKKwkJCWdv
dG8gZXJyb3I7CiAKIAl3d19hY3F1aXJlX2RvbmUoY3R4KTsKLQlyZXR1cm4gMDsKIAotZXJyOgot
CWZvciAoaS0tOyBpID49IDA7IGktLSkKLQkJd3dfbXV0ZXhfdW5sb2NrKCZib3NbaV0tPmdlbS5y
ZXN2LT5sb2NrKTsKLQotCWlmIChzbG93X2xvY2tlZCA+PSAwKQotCQl3d19tdXRleF91bmxvY2so
JmJvc1tzbG93X2xvY2tlZF0tPmdlbS5yZXN2LT5sb2NrKTsKKwlyZXR1cm4gMDsKIAotCWlmIChy
ZXQgPT0gLUVERUFETEspIHsKLQkJLyogd2UgbG9zdCBvdXQgaW4gYSBzZXFubyByYWNlLCBsb2Nr
IGFuZCByZXRyeS4uICovCi0JCXJldCA9IHd3X211dGV4X2xvY2tfc2xvd19pbnRlcnJ1cHRpYmxl
KAotCQkJJmJvc1tjb250ZW5kZWRdLT5nZW0ucmVzdi0+bG9jaywgY3R4KTsKLQkJaWYgKCFyZXQp
IHsKLQkJCXNsb3dfbG9ja2VkID0gY29udGVuZGVkOwotCQkJZ290byByZXRyeTsKLQkJfQotCX0K
K2Vycm9yOgorCXd3X211dGV4X3VubG9ja19mb3JfZWFjaChmb3IgKGkgPSAwOyBpIDwgbnJfYm9z
OyBpKyspLAorCQkJCSAmYm9zW2ldLT5nZW0ucmVzdi0+bG9jaywgY29udGVuZGVkKTsKIAl3d19h
Y3F1aXJlX2ZpbmkoY3R4KTsKIAogCXJldHVybiByZXQ7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
