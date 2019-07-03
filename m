Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB6D5F38A
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2019 09:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509BA6E28A;
	Thu,  4 Jul 2019 07:25:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13EB6E130;
 Wed,  3 Jul 2019 13:14:38 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y15so1274049pfn.5;
 Wed, 03 Jul 2019 06:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=X6GDzktbtJ+VqVECtvxe0dHO4mFvJx9Nj4EzNU7DPGw=;
 b=Jk4aMD36pzQNGXxeVFpRnUQJ7blbfDiTqoBhiRdVKHRglAbs80Q1PQPr7xTmPBNy5l
 gnU8OcWppBezpT+J8ThT9mrjRUNi+WbEgid8PLgQhVAoI/Y4r6ICM5P1kn67AMzUNZxx
 ci3WNH/qAciha80Jqgz37mF+HjOxQ/Fwi/LL47os+5Kr5CYBxuJSjtIcrq2ILZGOwepW
 /pLhHLLCpZASBN0MXtwBWbh54LwfIFaTqIS8ZU1E4lSCIvIh+bYuMz6aJIn888OiXsmB
 rerAAF81O4wX1iEvmI+1UgvvP2mP4p7b8PULHauM2M7b+jWZnxavEsYXHR719TRRq4Fs
 fTpA==
X-Gm-Message-State: APjAAAVBC0abgcjzPBmuEjAIpYyC4XqhhcMn6K/2CQDGIOj7+76y5IW1
 b05ZEt2Gd5r0elOAxPVUwuc=
X-Google-Smtp-Source: APXvYqzu5gmEESyUNZwvYG2VbKFqz1Zzy9LdbFGjMWscl9/DLNVf7tLVBbQLx9ycrNljkAMf+YgGXg==
X-Received: by 2002:a17:90a:1b4c:: with SMTP id
 q70mr12402173pjq.69.1562159678447; 
 Wed, 03 Jul 2019 06:14:38 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id h11sm2292897pfn.170.2019.07.03.06.14.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Jul 2019 06:14:38 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH 07/30] drm/i915: use kmemdup rather than duplicating its
 implementation
Date: Wed,  3 Jul 2019 21:14:26 +0800
Message-Id: <20190703131426.24993-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Thu, 04 Jul 2019 07:25:13 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=X6GDzktbtJ+VqVECtvxe0dHO4mFvJx9Nj4EzNU7DPGw=;
 b=ZMtCA6al7suQi26fqBMax2hJdFeqaPpONJNbcH+S93TSY01pPyOP9s7HifnrW8VYhv
 bsgu4M2GWMz10qI4MQ7WTg8+TyD1Nchequ/U6pqQ3nqu+UDgfcpIw+fRtPU2nt4SsIia
 w8pAuIrJqEq+aEfXux6x2Xs17EyBd6X0BdsiH0UIz2igWAtUFmYAYzp62JlKvfV/dNQs
 YIwTTIFMosX/jEM/pQFLWrOlZc+S0qCCSzruIVFF4Nmxox962RythsWk498NbXvmj/fe
 9+7OrIpqlQzdA2rkZ0XiInHmZo1MheBVSW4VUjYNpMznUiMTdOyI1BLFLO+l9sglu/EG
 2thw==
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
Cc: dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Fuqian Huang <huangfq.daxian@gmail.com>,
 intel-gvt-dev@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

a21lbWR1cCBpcyBpbnRyb2R1Y2VkIHRvIGR1cGxpY2F0ZSBhIHJlZ2lvbiBvZiBtZW1vcnkgaW4g
YSBuZWF0IHdheS4KUmF0aGVyIHRoYW4ga21hbGxvYy9remFsbG9jICsgbWVtc2V0LCB3aGljaCB0
aGUgcHJvZ3JhbW1lciBuZWVkcyB0bwp3cml0ZSB0aGUgc2l6ZSB0d2ljZSAoc29tZXRpbWVzIGxl
YWQgdG8gbWlzdGFrZXMpLCBrbWVtZHVwIGltcHJvdmVzCnJlYWRhYmlsaXR5LCBsZWFkcyB0byBz
bWFsbGVyIGNvZGUgYW5kIGFsc28gcmVkdWNlIHRoZSBjaGFuY2VzIG9mIG1pc3Rha2VzLgpTdWdn
ZXN0aW9uIHRvIHVzZSBrbWVtZHVwIHJhdGhlciB0aGFuIHVzaW5nIGttYWxsb2Mva3phbGxvYyAr
IG1lbXNldC4KClNpZ25lZC1vZmYtYnk6IEZ1cWlhbiBIdWFuZyA8aHVhbmdmcS5kYXhpYW5AZ21h
aWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d2dC9kbWFidWYuYyB8IDMgKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jIGIvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ3Z0L2RtYWJ1Zi5jCmluZGV4IDQxYzhlYmM2MGM2My4uZmU2ZmE5NzlmMjJhIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndnQvZG1hYnVmLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZ3Z0L2RtYWJ1Zi5jCkBAIC00MTEsMTQgKzQxMSwxMyBAQCBpbnQgaW50ZWxfdmdw
dV9xdWVyeV9wbGFuZShzdHJ1Y3QgaW50ZWxfdmdwdSAqdmdwdSwgdm9pZCAqYXJncykKIAkJZ290
byBvdXQ7CiAJfQogCi0JZG1hYnVmX29iai0+aW5mbyA9IGttYWxsb2Moc2l6ZW9mKHN0cnVjdCBp
bnRlbF92Z3B1X2ZiX2luZm8pLAorCWRtYWJ1Zl9vYmotPmluZm8gPSBrbWVtZHVwKCZmYl9pbmZv
LCBzaXplb2Yoc3RydWN0IGludGVsX3ZncHVfZmJfaW5mbyksCiAJCQkJICAgR0ZQX0tFUk5FTCk7
CiAJaWYgKHVubGlrZWx5KCFkbWFidWZfb2JqLT5pbmZvKSkgewogCQlndnRfdmdwdV9lcnIoImFs
bG9jYXRlIGludGVsIHZncHUgZmIgaW5mbyBmYWlsZWRcbiIpOwogCQlyZXQgPSAtRU5PTUVNOwog
CQlnb3RvIG91dF9mcmVlX2RtYWJ1ZjsKIAl9Ci0JbWVtY3B5KGRtYWJ1Zl9vYmotPmluZm8sICZm
Yl9pbmZvLCBzaXplb2Yoc3RydWN0IGludGVsX3ZncHVfZmJfaW5mbykpOwogCiAJKChzdHJ1Y3Qg
aW50ZWxfdmdwdV9mYl9pbmZvICopZG1hYnVmX29iai0+aW5mbyktPm9iaiA9IGRtYWJ1Zl9vYmo7
CiAKLS0gCjIuMTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
