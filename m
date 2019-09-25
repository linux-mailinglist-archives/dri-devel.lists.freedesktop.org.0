Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DD1BD907
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 09:20:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811C86EB47;
	Wed, 25 Sep 2019 07:19:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50EA56E832
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 04:46:40 +0000 (UTC)
Received: by mail-io1-xd43.google.com with SMTP id n197so10229620iod.9
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 21:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=L0m69X+LQ4frLVby8EeJS1EQVq3OI3wT8S733h98iBY=;
 b=QaUVCwvP4tT4Pi5b9mcQX3E4GAk0evFYlo/TeU5pznDQHj3N9dF+A0CYpMgK5yYWtS
 ey94NXvf+jjWBCWy0sXZmc9S8oMyb9Kj93HP5CXFMhzdcjfgIWEluXhU8hWJlNevpIP7
 xtPZuXHXdZ8UVYxe4OM3xrH4tVC0It8HxtHL9lCNh1SQA7DtC7H8jnNxfaVYzYQR5T9e
 VdXfyNw7b/3Nnn2ZCGsLbPx59rzGnnUeXcsEaKqM0Kyi2mF+vJbk/jgUxCLuIZuJbMiE
 lU4gchmONq9u/HSk9PshmQFXEMcaSHpaew0MVMDja5y/Xp6uKRoXiQDSEwgGKoHphmxO
 On6A==
X-Gm-Message-State: APjAAAVcx8GFuDGhKFKvvt2zFswMmcJAEI319aj7GsWG/jK5460Ob6eA
 UXXlNbn0Oo91T7W08ypdgoc=
X-Google-Smtp-Source: APXvYqyKT3ovdvw1fI5/3vLGvl5AkjEDbTc6sYb0NhOsx0Hd+zOXARsy+Js8tagkLvrb+17Hr4LvtA==
X-Received: by 2002:a6b:210:: with SMTP id 16mr8335610ioc.104.1569386799583;
 Tue, 24 Sep 2019 21:46:39 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id t4sm42107iln.82.2019.09.24.21.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 21:46:39 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Subject: [PATCH] drm/vmwgfx: prevent memory leak in vmw_context_define
Date: Tue, 24 Sep 2019 23:46:26 -0500
Message-Id: <20190925044627.2476-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 25 Sep 2019 07:19:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=L0m69X+LQ4frLVby8EeJS1EQVq3OI3wT8S733h98iBY=;
 b=abELyR7FeIlVGJPkjZn9UpCopVU8AQ5F05bm6IeSz1xSMYAXnSpiotzDBDceHJQPEW
 ULcSyUQ7JjYrkFgsySjVXZcGtRWhTZi1aSQ9Lv+TYLvHvFI5wZrevpNyDbWkWtBZDBDq
 kKcg9WddnobR24uaUfYlf3VjfzCiE4OcUYEocPl20BWzTkNFGZYQ6fYcBVFpQTFK3gdi
 e1hH8VDbBkG6fXLNpGPTfgwpU35GBB+OHcEHKjhFe9nS5cYteJLubBJIl7ucnW0mji5y
 xUoDIRLmcuvwceWv2iZx3Afo9OD9T70H7d5GQ0mU0Hq2LhZnprpFf3nkzU1rEFzB3jQy
 cpnw==
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, David Airlie <airlied@linux.ie>,
 kjlu@umn.edu, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 emamd001@umn.edu, VMware Graphics <linux-graphics-maintainer@vmware.com>,
 smccaman@umn.edu, Navid Emamdoost <navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gdm13X2NvbnRleHRfZGVmaW5lIGlmIHZtd19jb250ZXh0X2luaXQgZmFpbHMgdGhlIGFsbG9j
YXRlZCByZXNvdXJjZQpzaG91bGQgYmUgdW5yZWZlcmVuY2VkLiBUaGUgZ290byBsYWJlbCB3YXMg
Zml4ZWQuCgpTaWduZWQtb2ZmLWJ5OiBOYXZpZCBFbWFtZG9vc3QgPG5hdmlkLmVtYW1kb29zdEBn
bWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY29udGV4dC5jIHwg
MiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY29udGV4dC5jIGIvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY29udGV4dC5jCmluZGV4IGE1NmM5ZDgwMjM4Mi4uYWM0
MmY4YTZhY2YwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jb250
ZXh0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY29udGV4dC5jCkBAIC03
NzMsNyArNzczLDcgQEAgc3RhdGljIGludCB2bXdfY29udGV4dF9kZWZpbmUoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAogCXJldCA9IHZtd19jb250ZXh0X2luaXQoZGV2X3By
aXYsIHJlcywgdm13X3VzZXJfY29udGV4dF9mcmVlLCBkeCk7CiAJaWYgKHVubGlrZWx5KHJldCAh
PSAwKSkKLQkJZ290byBvdXRfdW5sb2NrOworCQlnb3RvIG91dF9lcnI7CiAKIAl0bXAgPSB2bXdf
cmVzb3VyY2VfcmVmZXJlbmNlKCZjdHgtPnJlcyk7CiAJcmV0ID0gdHRtX2Jhc2Vfb2JqZWN0X2lu
aXQodGZpbGUsICZjdHgtPmJhc2UsIGZhbHNlLCBWTVdfUkVTX0NPTlRFWFQsCi0tIAoyLjE3LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
