Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD42CCB38
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212DF6E3A4;
	Sat,  5 Oct 2019 16:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7C1A6EC1C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 19:09:51 +0000 (UTC)
Received: by mail-io1-xd41.google.com with SMTP id z19so15966408ior.0
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2019 12:09:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7XAUCdbkHP+3qeD8IAi87BfnaeBU6yWduxm7aN24lrc=;
 b=EHkk2cILZfPtV6F4FEN1uNp2e5g9h7bpWGOZTTsl0fNW2++UBIl4c3ORg0qB1VjbPv
 KXO+TvIkqAS+YT2uKnqaiws3FhCpmlKfC0HuZbF0OzcHgko+drnaERu3qBk7AnIjRTAa
 ANo+H9pHfBLkRh51Dv7rissnCXn+7UpU9wFWOCrzx/hS7vb5h4R4y7NqzMIj0xhSsPUb
 rcjIQ+tUQDFD+inlt1zHRC0PvTCn4Cw5t9g6JuB6u8h13UrnCBnFUQ1UzW2TkjKdXLJF
 +Zs22uheV1P3mpEBWfcdvByl5BoR0jH0Yie2oJZwQk3cHQEiO40ikmb7PafJea7FyYbF
 Oqdg==
X-Gm-Message-State: APjAAAXTfI7WUJu6YfL5cTWFPG9F53O5oRz1E6/6SUhKzuO64vl1l5DD
 CtREGSYAgxH7aKHmtRQR2xR3vsPGPNw=
X-Google-Smtp-Source: APXvYqxEP0qwOKKETCDmhwNirLOgrLxBuE1ywrf9+wtD9KLEnWuQcbFxVGAfRcVq1nneGNqxdqVLNQ==
X-Received: by 2002:a6b:3bc9:: with SMTP id i192mr2438459ioa.295.1570216190936; 
 Fri, 04 Oct 2019 12:09:50 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id i26sm2722087iol.84.2019.10.04.12.09.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2019 12:09:50 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Subject: [PATCH] drm/imx: fix memory leak in imx_pd_bind
Date: Fri,  4 Oct 2019 14:09:33 -0500
Message-Id: <20191004190938.15353-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:37:28 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=7XAUCdbkHP+3qeD8IAi87BfnaeBU6yWduxm7aN24lrc=;
 b=PIZU3DOCNHkv//gcgVRRCWke4OqJTknwSMnrMGdlNMOQk5+OAk2CU4eRA34YoyeI4i
 gHzd0EfCXxavyvjfJn0MEx83fyTJBpGqHOYEwYVHvak3hPaPlD8CYK2VMCI3j6k8KkUO
 4qYEotBxrvW3HOa00czkUrEfMxl0WQVCa/f+/TEFQG2xBwyaOa+0MscWPyTZOwaG6g6Q
 Xa0RkY7Hqn/tViO/qtkRply5N8osvwqlWLW7HB5etrBY4jZGqLwS4Q1UWa1QuiSjCLqj
 bK1scbdu/XQLmH5D4kn6Zkup5bU3uv06GghskxHr+l57gDDzh5PhGchgmewNS0NDI6Pp
 qrbA==
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
Cc: David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 emamd001@umn.edu, NXP Linux Team <linux-imx@nxp.com>, smccaman@umn.edu,
 Shawn Guo <shawnguo@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gaW14X3BkX2JpbmQsIHRoZSBkdXBsaWNhdGVkIG1lbW9yeSBmb3IgaW14cGQtPmVkaWQgdmlh
IGttZW1kdXAgc2hvdWxkCmJlIHJlbGVhc2VkIGluIGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRn
ZSBvciBpbXhfcGRfcmVnaXN0ZXIgZmFpbC4KCkZpeGVzOiBlYmM5NDQ2MTM1NjcgKCJkcm06IGNv
bnZlcnQgZHJpdmVycyB0byB1c2UgZHJtX29mX2ZpbmRfcGFuZWxfb3JfYnJpZGdlIikKRml4ZXM6
IDE5MDIyYWFhZTY3NyAoInN0YWdpbmc6IGRybS9pbXg6IEFkZCBwYXJhbGxlbCBkaXNwbGF5IHN1
cHBvcnQiKQpTaWduZWQtb2ZmLWJ5OiBOYXZpZCBFbWFtZG9vc3QgPG5hdmlkLmVtYW1kb29zdEBn
bWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMgfCA4
ICsrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2lteC9wYXJhbGxlbC1kaXNwbGF5LmMKaW5kZXggZTdjZTE3NTAzYWUx
Li45NTIyZDJjYjBhZDUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwt
ZGlzcGxheS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbXgvcGFyYWxsZWwtZGlzcGxheS5jCkBA
IC0yMjcsMTQgKzIyNywxOCBAQCBzdGF0aWMgaW50IGlteF9wZF9iaW5kKHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCB2b2lkICpkYXRhKQogCiAJLyogcG9ydEAxIGlz
IHRoZSBvdXRwdXQgcG9ydCAqLwogCXJldCA9IGRybV9vZl9maW5kX3BhbmVsX29yX2JyaWRnZShu
cCwgMSwgMCwgJmlteHBkLT5wYW5lbCwgJmlteHBkLT5icmlkZ2UpOwotCWlmIChyZXQgJiYgcmV0
ICE9IC1FTk9ERVYpCisJaWYgKHJldCAmJiByZXQgIT0gLUVOT0RFVikgeworCQlrZnJlZShpbXhw
ZC0+ZWRpZCk7CiAJCXJldHVybiByZXQ7CisJfQogCiAJaW14cGQtPmRldiA9IGRldjsKIAogCXJl
dCA9IGlteF9wZF9yZWdpc3Rlcihkcm0sIGlteHBkKTsKLQlpZiAocmV0KQorCWlmIChyZXQpIHsK
KwkJa2ZyZWUoaW14cGQtPmVkaWQpOwogCQlyZXR1cm4gcmV0OworCX0KIAogCWRldl9zZXRfZHJ2
ZGF0YShkZXYsIGlteHBkKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
