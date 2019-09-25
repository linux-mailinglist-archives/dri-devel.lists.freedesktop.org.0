Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B0EBD8F1
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 09:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69ABD8997E;
	Wed, 25 Sep 2019 07:19:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B96E6E832
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 04:30:42 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id r26so10141114ioh.8
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 21:30:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Een0CpGnMmjlIwv6SGvcNYXFPmeEyRahY8Cx/ZLw6Cs=;
 b=OTfEPup+VvBKxOsc6iFmaH7teCyw6zGfCRMeJ4/oqg9dr2v8pxLpDSWJdIl3EIJruZ
 FnPvlAgiG1T1n7iDqykMAohdjflQJMH2yIxh+OGKMZt9SG0bxzAXrSJAV9VU7mV7DysX
 mQeovAfX0sk93teLLQ1SqeXjMEdkghEWuOyZYrwxx8ur4Ckim5PZvHxCT4nblznKEK7H
 qd5aZPO4NJr/nLdGow50AQIBbSCFcfFAcz6AMC/aFMuPpgMlu1z316vg5ovtobamjMd7
 IYXqrUnex2dXdjIJxoEwAiNoIE5Utwe7CKqZvQOEdLUgMwDNcyRmqrVHOlVo1sVva/VN
 8arg==
X-Gm-Message-State: APjAAAWoDKzIRj06mNB/8ifK5Dx+T6qSWk/BUoz587amaWe4Q6x6CocM
 Yq8jzH4Bhw/13Gz3f/rMjWUHSZsPtww=
X-Google-Smtp-Source: APXvYqzEomJ2P1aN8yp1bKMYaBxSHch+LNln2o811DhB87lddkLKVluZBUQPiHMnHUBd6N5Ipj+Bdw==
X-Received: by 2002:a5d:8f92:: with SMTP id l18mr4766636iol.143.1569385841381; 
 Tue, 24 Sep 2019 21:30:41 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id o16sm42508ilf.80.2019.09.24.21.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 21:30:40 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Subject: [PATCH] drm/komeda: prevent memory leak in komeda_wb_connector_add
Date: Tue, 24 Sep 2019 23:30:30 -0500
Message-Id: <20190925043031.32308-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 25 Sep 2019 07:19:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Een0CpGnMmjlIwv6SGvcNYXFPmeEyRahY8Cx/ZLw6Cs=;
 b=DLSdyfZ7jMpKvSBsDSe7mOpAysxnrw6UY6qtMxOjDFe9vauIc1eUtuQkHTRe9saurj
 sUUAYFB/R+ae8fTscfHi6/muabc8G1gFEydiAZM8qAqKnIxbvOuYB4zWpWzmt9dQiYCE
 rHDv6db0OavUV30UpKkXkowxibuS6fjz5+1ud3L9CgQ0m2xMRGx8ql7XaNFC3ywAWJxV
 MjsC0INc0XpGuC+YgC328Pz2Y5IssNWwN2PemFjnEHftVZXdB0E7Z7Bh2Qoc6d/CVvEM
 HtPD+XfgI0bE4VSspBvxxDJiFwSp1CbmHP0WelXA5DBSZjSwCHfGBS/rIRcjOaSnlrHm
 TFiA==
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu,
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, emamd001@umn.edu,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, smccaman@umn.edu,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4ga29tZWRhX3diX2Nvbm5lY3Rvcl9hZGQgaWYgZHJtX3dyaXRlYmFja19jb25uZWN0b3JfaW5p
dCBmYWlscyB0aGUKYWxsb2NhdGVkIG1lbW9yeSBmb3Iga3diX2Nvbm4gc2hvdWxkIGJlIHJlbGVh
c2VkLgoKU2lnbmVkLW9mZi1ieTogTmF2aWQgRW1hbWRvb3N0IDxuYXZpZC5lbWFtZG9vc3RAZ21h
aWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hcm0vZGlzcGxheS9rb21lZGEva29tZWRhX3di
X2Nvbm5lY3Rvci5jIHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tv
bWVkYS9rb21lZGFfd2JfY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXJtL2Rpc3BsYXkv
a29tZWRhL2tvbWVkYV93Yl9jb25uZWN0b3IuYwppbmRleCAyODUxY2FjOTRkODYuLjc1MTMzZjk2
N2ZkYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVkYS9rb21l
ZGFfd2JfY29ubmVjdG9yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FybS9kaXNwbGF5L2tvbWVk
YS9rb21lZGFfd2JfY29ubmVjdG9yLmMKQEAgLTE2Niw4ICsxNjYsMTAgQEAgc3RhdGljIGludCBr
b21lZGFfd2JfY29ubmVjdG9yX2FkZChzdHJ1Y3Qga29tZWRhX2ttc19kZXYgKmttcywKIAkJCQkJ
ICAgJmtvbWVkYV93Yl9lbmNvZGVyX2hlbHBlcl9mdW5jcywKIAkJCQkJICAgZm9ybWF0cywgbl9m
b3JtYXRzKTsKIAlrb21lZGFfcHV0X2ZvdXJjY19saXN0KGZvcm1hdHMpOwotCWlmIChlcnIpCisJ
aWYgKGVycikgeworCQlrZnJlZShrd2JfY29ubik7CiAJCXJldHVybiBlcnI7CisJfQogCiAJZHJt
X2Nvbm5lY3Rvcl9oZWxwZXJfYWRkKCZ3Yl9jb25uLT5iYXNlLCAma29tZWRhX3diX2Nvbm5faGVs
cGVyX2Z1bmNzKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
