Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6821C412
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 09:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E73389254;
	Tue, 14 May 2019 07:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from onstation.org (onstation.org [52.200.56.107])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C385C89235;
 Mon, 13 May 2019 23:41:20 +0000 (UTC)
Received: from localhost.localdomain (c-98-239-145-235.hsd1.wv.comcast.net
 [98.239.145.235])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: masneyb)
 by onstation.org (Postfix) with ESMTPSA id CB82E45029;
 Mon, 13 May 2019 23:41:19 +0000 (UTC)
From: Brian Masney <masneyb@onstation.org>
To: robdclark@gmail.com,
	sean@poorly.run
Subject: [PATCH 2/2] drm/msm: correct attempted NULL pointer dereference in
 debugfs
Date: Mon, 13 May 2019 19:41:05 -0400
Message-Id: <20190513234105.7531-2-masneyb@onstation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190513234105.7531-1-masneyb@onstation.org>
References: <20190513234105.7531-1-masneyb@onstation.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 14 May 2019 07:40:44 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=onstation.org; s=default; t=1557790880;
 bh=AgbXz/pOeFm7SB3WM30G8MU/5/skIhEBOhYSZdjZNCs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bXb+LlLhIA1NFT3uLoziGtEwWeRt0BRj3A+aZb9cRHInlFyoGZNvSOLw+TzdTOXIE
 FKgAvAeC1BS6j9LWu5jYZ/TYFA7Vnlwa7rIZXPY4WslOGA9zwDzUor+SJbpTUK1ToS
 rqM8Fc5XQa13Q2o9hXLA06WvOlvh6Ce9kGLquWZo=
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
Cc: jonathan@marek.ca, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bXNtX2dlbV9kZXNjcmliZSgpIHdvdWxkIGF0dGVtcHQgdG8gZGVyZWZlcmVuY2UgYSBOVUxMIHBv
aW50ZXIgdmlhIHRoZQphZGRyZXNzIHNwYWNlIHBvaW50ZXIgd2hlbiBubyBJT01NVSBpcyBwcmVz
ZW50LiBDb3JyZWN0IHRoaXMgYnkgYWRkaW5nCnRoZSBhcHByb3ByaWF0ZSBjaGVjay4KClNpZ25l
ZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24ub3JnPgpGaXhlczogNTc1
ZjA0ODU1MDhiICgiZHJtL21zbTogQ2xlYW4gdXAgYW5kIGVuaGFuY2UgdGhlIG91dHB1dCBvZiB0
aGUgJ2dlbScgZGVidWdmcyBub2RlIikKLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0u
YyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL21zbV9nZW0uYwppbmRleCAzMWQ1YTc0NGQ4NGYuLjM1ZjU1ZGQyNTk5NCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL21zbS9tc21fZ2VtLmMKQEAgLTgwMyw3ICs4MDMsOCBAQCB2b2lkIG1zbV9nZW1fZGVzY3Jp
YmUoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmosIHN0cnVjdCBzZXFfZmlsZSAqbSkKIAkJc2Vx
X3B1dHMobSwgIiAgICAgIHZtYXM6Iik7CiAKIAkJbGlzdF9mb3JfZWFjaF9lbnRyeSh2bWEsICZt
c21fb2JqLT52bWFzLCBsaXN0KQotCQkJc2VxX3ByaW50ZihtLCAiIFslczogJTA4bGx4LCVzLGlu
dXNlPSVkXSIsIHZtYS0+YXNwYWNlLT5uYW1lLAorCQkJc2VxX3ByaW50ZihtLCAiIFslczogJTA4
bGx4LCVzLGludXNlPSVkXSIsCisJCQkJdm1hLT5hc3BhY2UgIT0gTlVMTCA/IHZtYS0+YXNwYWNl
LT5uYW1lIDogTlVMTCwKIAkJCQl2bWEtPmlvdmEsIHZtYS0+bWFwcGVkID8gIm1hcHBlZCIgOiAi
dW5tYXBwZWQiLAogCQkJCXZtYS0+aW51c2UpOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
