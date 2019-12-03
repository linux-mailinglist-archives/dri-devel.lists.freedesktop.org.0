Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8E8110208
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2DE6E84A;
	Tue,  3 Dec 2019 16:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E75F6E846
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:19:36 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id t14so4155824wmi.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:19:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8PwWQma+5Pqkctg0DzIuMrwRQe9FFZs9mcoeMD+RaeE=;
 b=QZ31CevArO+xRaMUNJ7ZNAed7yknB9faIw2Oafh5HEDPGuKAlvr5qm408OZjkI5AcD
 TMsXmZSlm3f5unZFYfiXpPQEafJO9F93sX3vWM/33pBLIGub8z+cjude/oWj4a8XKPrI
 nHh4wlOTf+xt4TffHFClwNqD7Ni7lj9E6jNTzJ8uARv0mkzSubvHu7mXYt67NGr+Pou1
 yUE+A7GccpXDBrzHsNmW5e7f33gOPEz1YZgGu3QqUHPQi/q24TZGuCx5lwhdgJBknCzo
 jit3Poh+x5+yNbHzu1XYBQsMRsUx/JPHUW1SQAG+SLNzO98GHy4MxVF25DlDFhRkGy8m
 t2RQ==
X-Gm-Message-State: APjAAAWHZn23F+SqHXyTlh+mn4OUOXCKePxDqzhu/kL8CAbeKr1La1s7
 7AIyE4sJL/Fb9ZnH09jVoUk=
X-Google-Smtp-Source: APXvYqxOisZqSvaS/kGDwfMGxj2Ecv3XXSg0r7See1EWGq29HYu3V+oJdlDy2Gj75UilxKxpChqpdQ==
X-Received: by 2002:a1c:6207:: with SMTP id w7mr28616534wmb.16.1575389974756; 
 Tue, 03 Dec 2019 08:19:34 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id x11sm4401057wre.68.2019.12.03.08.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:19:34 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v2 9/9] drm/tegra: Run hub cleanup on ->remove()
Date: Tue,  3 Dec 2019 17:19:14 +0100
Message-Id: <20191203161914.1312555-9-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191203161914.1312555-1-thierry.reding@gmail.com>
References: <20191203161914.1312555-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8PwWQma+5Pqkctg0DzIuMrwRQe9FFZs9mcoeMD+RaeE=;
 b=nJrGvRP1wJU1oSWsRp5EnoobaFJ9zhQsNutzeCuPChjvEsRJdyhqa6k27WUpU7Ngeq
 oipxqLhPj2//BPhuh2AJWL+zxS9rIQ2e34yD4gvHjS47boCH3c1Kr7xAfp/dYM35Ig9l
 lPCFFSXnzoZz7TtHoGpiHixngXtc7171HVpuOLaZ28CwzMFitI1Ckxwz+QLipCnaHR0y
 qOwtofLBcgmENMSFPYqgRpARIGsPzG+wrpjvkk3SZNQFyc4o1cWs8SGbUQhYMdJITL+1
 KgJ6cXYgVTtwbgTIgeyT871H2iP+ECFMdkm7AMHE4tHOmnUC5gk6oPB99Ae8h8pRbR/e
 mtrg==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClRoZSBjYWxsIHRvIHRl
Z3JhX2Rpc3BsYXlfaHViX2NsZWFudXAoKSB0aGF0IHRha2VzIGNhcmUgb2YgZGlzYWJsaW5nIHRo
ZQp3aW5kb3cgZ3JvdXBzIGlzIG1pc3NpbmcgZnJvbSB0aGUgZHJpdmVyJ3MgLT5yZW1vdmUoKSBj
YWxsYmFjay4gQ2FsbCBpdAp0byBtYWtlIHN1cmUgdGhlIHJ1bnRpbWUgUE0gcmVmZXJlbmNlIGNv
dW50cyBmb3IgdGhlIGRpc3BsYXkgY29udHJvbGxlcnMKYXJlIGJhbGFuY2VkLgoKU2lnbmVkLW9m
Zi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vdGVncmEvZHJtLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9kcm0uYyBiL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9kcm0uYwppbmRleCA3YTE2YjUxZWFhMmQuLmY0NTVjZTcxZTg1ZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RybS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90
ZWdyYS9kcm0uYwpAQCAtMTI0MSw2ICsxMjQxLDkgQEAgc3RhdGljIGludCBob3N0MXhfZHJtX3Jl
bW92ZShzdHJ1Y3QgaG9zdDF4X2RldmljZSAqZGV2KQogCWRybV9hdG9taWNfaGVscGVyX3NodXRk
b3duKGRybSk7CiAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZHJtKTsKIAorCWlmICh0ZWdyYS0+
aHViKQorCQl0ZWdyYV9kaXNwbGF5X2h1Yl9jbGVhbnVwKHRlZ3JhLT5odWIpOworCiAJZXJyID0g
aG9zdDF4X2RldmljZV9leGl0KGRldik7CiAJaWYgKGVyciA8IDApCiAJCWRldl9lcnIoJmRldi0+
ZGV2LCAiaG9zdDF4IGRldmljZSBjbGVhbnVwIGZhaWxlZDogJWRcbiIsIGVycik7Ci0tIAoyLjIz
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
