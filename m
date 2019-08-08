Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9667F86D13
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 00:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A8E6ECCE;
	Thu,  8 Aug 2019 22:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4A3E6ECCD
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 22:22:05 +0000 (UTC)
Received: by mail-ot1-f66.google.com with SMTP id d17so125212836oth.5
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Aug 2019 15:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9uNhmbTEbbQrM0MoHTtlKr7OqFoVNlAP3gF7AhHdlds=;
 b=ECw8BKPPQ5uDbTNj5F4/e3xSiplHnObjxUuzE4C/mjOWZy9Y/1WJxmji6+t0pOpR2w
 mfBcWkbExlzLGua0QlLxpo2F25fjomyKG5I/Har11kFVdIjpo8mGUsFVjdIZqTvwkAQ9
 drWHdOwPeqOT4Fheg8bnkotFn+Sl8dYDlKcXAVoMGCfmwUqK1XgRWEV0E6w+qLzN0Mi1
 g3/Wvb3VkghuVJOKVDSAsLGiROeGVb/DdHyNWEvrbARHmuvI7BbF6cVIt6eNcw3eYco5
 gIft7C13Zv4RR4uIoJ2h0Kwbzn3K8hPAfISYLYJEOYzns510hCXkD4eqtYJxhmush6K+
 f1rQ==
X-Gm-Message-State: APjAAAUZ6SYkc17neWTWE2aZUsQ/ZTzbDbVZVOeCuVON7EAgX8CPB3nT
 pDgzH6SdT2rdIKCKD2C3lZJ1xZM=
X-Google-Smtp-Source: APXvYqzi0uUlWcpd9Lo56q+2OkOVVwt1gzFhVWK0S3NYmyVjrjMBhJYQyN0Xmgm+QRIe1dgNy1yRrA==
X-Received: by 2002:a02:b883:: with SMTP id p3mr19677005jam.79.1565302924703; 
 Thu, 08 Aug 2019 15:22:04 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id i4sm118528553iog.31.2019.08.08.15.22.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 15:22:04 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/9] drm/shmem: Put pages independent of a SG table being
 set
Date: Thu,  8 Aug 2019 16:21:53 -0600
Message-Id: <20190808222200.13176-3-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808222200.13176-1-robh@kernel.org>
References: <20190808222200.13176-1-robh@kernel.org>
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Robin Murphy <robin.murphy@arm.com>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgYSBkcml2ZXIgZG9lcyBpdHMgb3duIG1hbmFnZW1lbnQgb2YgcGFnZXMsIHRoZSBzaG1lbSBo
ZWxwZXIgb2JqZWN0J3MKcGFnZXMgYXJyYXkgY291bGQgYmUgYWxsb2NhdGVkIHdoZW4gYSBTRyB0
YWJsZSBpcyBub3QuIFRoZXJlJ3Mgbm90CnJlYWxseSBhbnkgIGdvb2QgcmVhc29uIHRvIHRpZSBw
dXR0aW5nIHBhZ2VzIHdpdGggaGF2aW5nIGEgU0cgdGFibGUgd2hlbgpmcmVlaW5nIHRoZSBvYmpl
Y3QsIHNvIGp1c3QgcHV0IHBhZ2VzIGlmIHRoZSBwYWdlcyBhcnJheSBpcyBwb3B1bGF0ZWQuCgpD
YzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4K
Q2M6IE1heGltZSBSaXBhcmQgPG1heGltZS5yaXBhcmRAYm9vdGxpbi5jb20+CkNjOiBTZWFuIFBh
dWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4K
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IEVyaWMgQW5ob2x0IDxlcmlj
QGFuaG9sdC5uZXQ+ClJldmlld2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0u
Y29tPgpBY2tlZC1ieTogQWx5c3NhIFJvc2VuendlaWcgPGFseXNzYS5yb3Nlbnp3ZWlnQGNvbGxh
Ym9yYS5jb20+ClNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgfCA0ICsrLS0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwppbmRleCA0YjQ0MjU3NmRlMWMuLmRmOGYyYzhhZGIyYiAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKQEAgLTExOSwxMSArMTE5LDEx
IEBAIHZvaWQgZHJtX2dlbV9zaG1lbV9mcmVlX29iamVjdChzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Km9iaikKIAkJaWYgKHNobWVtLT5zZ3QpIHsKIAkJCWRtYV91bm1hcF9zZyhvYmotPmRldi0+ZGV2
LCBzaG1lbS0+c2d0LT5zZ2wsCiAJCQkJICAgICBzaG1lbS0+c2d0LT5uZW50cywgRE1BX0JJRElS
RUNUSU9OQUwpOwotCi0JCQlkcm1fZ2VtX3NobWVtX3B1dF9wYWdlcyhzaG1lbSk7CiAJCQlzZ19m
cmVlX3RhYmxlKHNobWVtLT5zZ3QpOwogCQkJa2ZyZWUoc2htZW0tPnNndCk7CiAJCX0KKwkJaWYg
KHNobWVtLT5wYWdlcykKKwkJCWRybV9nZW1fc2htZW1fcHV0X3BhZ2VzKHNobWVtKTsKIAl9CiAK
IAlXQVJOX09OKHNobWVtLT5wYWdlc191c2VfY291bnQpOwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
