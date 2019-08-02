Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 463CF80163
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 21:52:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B8C76ED66;
	Fri,  2 Aug 2019 19:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CC16E5BB
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 19:51:56 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id f4so154739285ioh.6
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Aug 2019 12:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DsLdLXwkKyVix7l/rZud1QvU7xBYPQX9vimqxkDxj0k=;
 b=CIK59CFgeIDT/zt4QFu0YkOt1SJAjpKzzwJ5pVJkE6pDf7z3nepcoR+rVcPptjVIfV
 2oNM9Wzn3c3Y3IelgX3jQOLeNSxd9tm9sBQhgmkeeEPxlG8baNB9c59qKSkmtuxV4nuc
 KlD3HJSmBah2XM3f2AD/zPVjmMYMq8cJiTnknsQw11nEDYjybA6WeV4feyDapYS98J2G
 gqgDP8AaM/uOcG1Bru+d12zPSBCfz9Nk6BIWbUsMWuBkObqCw/kOYowdqmZsQHLwfj+b
 a4VCsMvf0WO9NBKusBlVjldni/N08Gy1CqIeSk4FuiEzLW+EaSg8In2Uiv1E4aRFi1et
 VSNQ==
X-Gm-Message-State: APjAAAVUvnXUDA6GzrR+PmdbrYiAd6oWILLKOAU3D2H1Bhr5Bje+ncgS
 R01I5SftEM2Jcm/CMDBHGxEP1bI=
X-Google-Smtp-Source: APXvYqxzn8xIzhaPMLmVArazKpQrQrJ8Pe7pi0pQPzYtC7zAJO6yyXbuGdwNJyCOQpZPp9Ib6zSktg==
X-Received: by 2002:a05:6602:1d2:: with SMTP id
 w18mr9841177iot.157.1564775515011; 
 Fri, 02 Aug 2019 12:51:55 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id s4sm98419934iop.25.2019.08.02.12.51.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 02 Aug 2019 12:51:54 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/8] drm/shmem: Put pages independent of a SG table being
 set
Date: Fri,  2 Aug 2019 13:51:44 -0600
Message-Id: <20190802195150.23207-3-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802195150.23207-1-robh@kernel.org>
References: <20190802195150.23207-1-robh@kernel.org>
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
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 Steven Price <steven.price@arm.com>, David Airlie <airlied@linux.ie>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
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
ZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwppbmRleCAyZjY0NjY3YWM4MDUuLjQ3N2U0Y2M1MGY3YSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKQEAgLTExOCwxMSArMTE4LDEx
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
