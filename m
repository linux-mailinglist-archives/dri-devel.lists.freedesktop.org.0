Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C92D0BDD10
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 13:27:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1B46EB9C;
	Wed, 25 Sep 2019 11:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A1DF6EB9C
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 11:27:03 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id h7so6398171wrw.8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 04:27:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0WF5h1lSBtPCk2h/Ht1fp/G4WdYjC0Y/PxP17Zdhjk=;
 b=FVUFqJXu8pqGbXr5zZ/lkeZrDISLElhCh8T3bZZBcGIA1h8Mja0TGf5VCkRZIyTQZX
 hPAA/VLJX/hZ9m9RGym1m6Ev60XTKfnI3rEH2AM5B1NIJV+rxNcLbc1oA8JFZvbreE13
 eexmBnBBFvxk+YHsBctRGqYiAvYD76iNCuG3Q4dFGcWlJ9wW4FsAYuxQMVI15L6iPOZL
 fQw93vf03vjic3EIEEpirxWcRVSskHc3JWnXo7JKrZz2VXq18H6XBbPLbOwRxscnYlPu
 CIW8Wr3VqRzsLXLklnIckRQXXGiwsxkb/P9G3vlclKgba5GqAmRNSkkVcgrpUmsvDuTb
 2ClQ==
X-Gm-Message-State: APjAAAWG7kdetlXGtpl1R9qNAoR0PRk6qxdnyPLeQO3d+ZQ5RcPT0muj
 SZQfvxlzM9ptafwYt+RLd25cTZyk
X-Google-Smtp-Source: APXvYqzfSeO1Jc5PB6DVDCLULyw/rC8Lj7bqf0IsYRULTT7G7JEnyQE4bPkc+/IRB0Js83QXfyk21g==
X-Received: by 2002:adf:cd86:: with SMTP id q6mr8686098wrj.153.1569410821959; 
 Wed, 25 Sep 2019 04:27:01 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id e6sm5769427wrp.91.2019.09.25.04.27.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 04:27:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: Fix ordering of cleanup code
Date: Wed, 25 Sep 2019 13:26:59 +0200
Message-Id: <20190925112659.2048-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t0WF5h1lSBtPCk2h/Ht1fp/G4WdYjC0Y/PxP17Zdhjk=;
 b=JbiIIe8vHxTB1msl0vu72aLbYwUuIqsg48MHG3a8FZFUhyIHlChuzqrfPvMN/9VCqr
 JxJb2Pb9gnRy9z659Z5NwgN2svVaymQ7/q1c1PsD0X+UV/+tpqudQV/Tv48WWH3mha1K
 IMJi8Wlx7p1VLKDY5GFPFaLhpeMaZ1n+LwCM8jkcrBuqdgzUfmF3viABpHO18m1eM0rZ
 wJJ8uiQZuf3GBhGD5RkrLiEuoPp+81fF0fmyW9uNJuJOs4IrkXJKnbLuAfWMsY+xYcdk
 10lVlfBEFRgoWDjk0t6WZ0dO5ll4B2o2fgRrEF14SbfmP8ZTfM86dmdPc+cuC6XnNL5b
 uqpA==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkNvbW1pdCBGaXhlczog
YjlmOGIwOWNlMjU2ICgiZHJtL3RlZ3JhOiBTZXR1cCBzaGFyZWQgSU9NTVUgZG9tYWluIGFmdGVy
CmluaXRpYWxpemF0aW9uIikgY2hhbmdlZCB0aGUgaW5pdGlhbGl6YXRpb24gb3JkZXIgb2YgdGhl
IElPTU1VIHJlbGF0ZWQKYml0cyBidXQgZGlkbid0IHVwZGF0ZSB0aGUgY2xlYW51cCBwYXRoIGFj
Y29yZGluZ2x5LiBUaGlzIGFzeW1tZXRyeSBjYW4KY2F1c2UgZmFpbHVyZXMgZHVyaW5nIGVycm9y
IHJlY292ZXJ5LgoKRml4ZXM6IGI5ZjhiMDljZTI1NiAoImRybS90ZWdyYTogU2V0dXAgc2hhcmVk
IElPTU1VIGRvbWFpbiBhZnRlciBpbml0aWFsaXphdGlvbiIpClNpZ25lZC1vZmYtYnk6IFRoaWVy
cnkgUmVkaW5nIDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L2RybS5jIHwgMTQgKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2Ry
bS5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCmluZGV4IDZmYjdkNzRmZjU1My4uYmM3
Y2MzMjE0MGY4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCkBAIC0yMDEsMTkgKzIwMSwxOSBAQCBzdGF0aWMg
aW50IHRlZ3JhX2RybV9sb2FkKHN0cnVjdCBkcm1fZGV2aWNlICpkcm0sIHVuc2lnbmVkIGxvbmcg
ZmxhZ3MpCiAJaWYgKHRlZ3JhLT5odWIpCiAJCXRlZ3JhX2Rpc3BsYXlfaHViX2NsZWFudXAodGVn
cmEtPmh1Yik7CiBkZXZpY2U6Ci0JaG9zdDF4X2RldmljZV9leGl0KGRldmljZSk7Ci1mYmRldjoK
LQlkcm1fa21zX2hlbHBlcl9wb2xsX2ZpbmkoZHJtKTsKLQl0ZWdyYV9kcm1fZmJfZnJlZShkcm0p
OwotY29uZmlnOgotCWRybV9tb2RlX2NvbmZpZ19jbGVhbnVwKGRybSk7Ci0KIAlpZiAodGVncmEt
PmRvbWFpbikgewogCQltdXRleF9kZXN0cm95KCZ0ZWdyYS0+bW1fbG9jayk7CiAJCWRybV9tbV90
YWtlZG93bigmdGVncmEtPm1tKTsKIAkJcHV0X2lvdmFfZG9tYWluKCZ0ZWdyYS0+Y2FydmVvdXQu
ZG9tYWluKTsKIAkJaW92YV9jYWNoZV9wdXQoKTsKIAl9CisKKwlob3N0MXhfZGV2aWNlX2V4aXQo
ZGV2aWNlKTsKK2ZiZGV2OgorCWRybV9rbXNfaGVscGVyX3BvbGxfZmluaShkcm0pOworCXRlZ3Jh
X2RybV9mYl9mcmVlKGRybSk7Citjb25maWc6CisJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJt
KTsKIGRvbWFpbjoKIAlpZiAodGVncmEtPmRvbWFpbikKIAkJaW9tbXVfZG9tYWluX2ZyZWUodGVn
cmEtPmRvbWFpbik7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
