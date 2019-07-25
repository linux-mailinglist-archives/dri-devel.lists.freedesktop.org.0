Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49257742C4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 03:10:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD9DC6E2D1;
	Thu, 25 Jul 2019 01:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3946E2D1
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jul 2019 01:10:09 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id j6so18497643ioa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 18:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7wo6KKh0OlJFgHNJTysz7wNQAp+MWYAtsandKNyFgTE=;
 b=MhGqhTlAi6o9ewT2IapteV84Tmn0FK1ChG4gvsNT1UG915Eqyu7xozXaCyZJvMzMqg
 Qg5RAguL+nt8mJSo1V80d0gto1tUPPEKwrsIDUtu+CzdH1XAXcdKDPYm1HtLR35Z/GRk
 6JNCmP18kTNtBuakyYsVo6huxmHvD0+EKE6A407E0P2mcyqQmSayXiXUwAqPTQDMWBs2
 JKdybEV/Np7+sZvOY0pUOaiaQ0m8nvdNDc5Y1BXvfG9Q2uM4oAHP1mam7EhiqJZByxsF
 Zz/6bUsSbho5uOkS34fQraXluZBchgJrhMqAkZsYAiPfsbUvojy7myBGTSDniREZ2i1c
 LNgw==
X-Gm-Message-State: APjAAAV4QNDAdB5wmbw0jMYDuDJXiJ1B9Rucz7E+a5n3ticKrsK9Di/P
 tCJQK0bDtOFuwcW3OVbugOHyxMM=
X-Google-Smtp-Source: APXvYqx6jPMEPlzSWfukF3T2W4jPBEerkmCAFbd1wCm/3z5ooE5kHuZi4Sefcb28it2DDgCNj9Qs4Q==
X-Received: by 2002:a02:b609:: with SMTP id h9mr84902773jam.36.1564017008474; 
 Wed, 24 Jul 2019 18:10:08 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.254])
 by smtp.googlemail.com with ESMTPSA id o7sm40675924ioo.81.2019.07.24.18.10.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 24 Jul 2019 18:10:07 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/shmem: Put pages independent of a SG table being
 set
Date: Wed, 24 Jul 2019 19:09:58 -0600
Message-Id: <20190725011003.30837-3-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190725011003.30837-1-robh@kernel.org>
References: <20190725011003.30837-1-robh@kernel.org>
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
QGFuaG9sdC5uZXQ+ClNpZ25lZC1vZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+
Ci0tLQp2MjoKIC0gbmV3IHBhdGNoCgogZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVs
cGVyLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVy
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYwppbmRleCAyZjY0NjY3
YWM4MDUuLjQ3N2U0Y2M1MGY3YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1f
c2htZW1faGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVy
LmMKQEAgLTExOCwxMSArMTE4LDExIEBAIHZvaWQgZHJtX2dlbV9zaG1lbV9mcmVlX29iamVjdChz
dHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKIAkJaWYgKHNobWVtLT5zZ3QpIHsKIAkJCWRtYV91
bm1hcF9zZyhvYmotPmRldi0+ZGV2LCBzaG1lbS0+c2d0LT5zZ2wsCiAJCQkJICAgICBzaG1lbS0+
c2d0LT5uZW50cywgRE1BX0JJRElSRUNUSU9OQUwpOwotCi0JCQlkcm1fZ2VtX3NobWVtX3B1dF9w
YWdlcyhzaG1lbSk7CiAJCQlzZ19mcmVlX3RhYmxlKHNobWVtLT5zZ3QpOwogCQkJa2ZyZWUoc2ht
ZW0tPnNndCk7CiAJCX0KKwkJaWYgKHNobWVtLT5wYWdlcykKKwkJCWRybV9nZW1fc2htZW1fcHV0
X3BhZ2VzKHNobWVtKTsKIAl9CgogCVdBUk5fT04oc2htZW0tPnBhZ2VzX3VzZV9jb3VudCk7Ci0t
CjIuMjAuMQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
