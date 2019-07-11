Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE30765278
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2019 09:24:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BB36E0C8;
	Thu, 11 Jul 2019 07:24:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F054789BC0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2019 03:10:30 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id o13so2167487pgp.12
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 20:10:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rIHV6cPDPKhX9jkZyhvnHZiEyAQlrV5sCTvAq/yF72U=;
 b=roYbzFzlvOeenNZbTxapzeJieTcVHMTFFI5tRmoalEyO4/ec4JNXTYWIsJ/R4gwMwH
 6Vuq2mNUKQRIESjdeXe4/IUJ691UlzbvJMsw5+t30JMd7kDuq146+EIP1ldou4ss497m
 MnoIaiEbYgDmoqkvJf44xtkJ62Acn+iEnEQJr2Oq+NJ8l/HsQH7MRgRkSvX2iY8W9VUR
 xrdZKpzrl4UWPYrt79Roy3qOj8SCry1FR/N9Dqajweic9tQkadKWhmy6Fhp2//TQyc1Q
 SgsrV3SXDFo64Pn6CvLtjmdFfPgSNG6G3FNL+w+bSClR8U3n/N0jGXh2ZPP5tCuhobP0
 m01Q==
X-Gm-Message-State: APjAAAVeQiUKLainK0b+sisXKG6dl2MN2fI395DQYorrz5mWlzOy/JwC
 nHOzxz7xC7jQlmBgJD8w/Zs=
X-Google-Smtp-Source: APXvYqxvo8BxIF61S1ZT84fFK4re4Ii9aN+zdDpPdZpPAiFOokGPgqqw0oTyzCS7WT7S/oCgl7+G2A==
X-Received: by 2002:a17:90a:23a4:: with SMTP id
 g33mr2077739pje.115.1562814630577; 
 Wed, 10 Jul 2019 20:10:30 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id 65sm4043082pff.148.2019.07.10.20.10.27
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Jul 2019 20:10:29 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH 1/2] drm/ttm: use the same attributes when freeing
 d_page->vaddr
Date: Thu, 11 Jul 2019 11:10:21 +0800
Message-Id: <20190711031021.23512-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
X-Mailman-Approved-At: Thu, 11 Jul 2019 07:23:58 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=rIHV6cPDPKhX9jkZyhvnHZiEyAQlrV5sCTvAq/yF72U=;
 b=gEJ2OiHD3xfsyfhhrIHY7acOsv6Qmhq6okCyaEE6s5QGewpmPiMaVqagAoR5/gZE6R
 gGoOxfOGyeeT0QzUltFU3Z4VTps64FBwoPj7DswM5ZiwD9XcG5qcPLhM1URwPJLSibWp
 Xx5mt9DSFkUnFcfXbXS//GfIi46AfHy/Bg5kHjHL2Wr+CDUpgpeFbGYKGLiP4Kt8xvLg
 06zNoJiw+kAAm50bmLvuALPrWB0YCutV3YMeywHvZyQqaaXLlpdMVL897OxRjBoNJqEx
 Rb9UriVejde7CpAhZ/6hPnRFchFtkO2c3j56UTY0GP6NAPi1I+dMR6JkIMLXMiQN7s4C
 +z1A==
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Fuqian Huang <huangfq.daxian@gmail.com>,
 Huang Rui <ray.huang@amd.com>, Junwei Zhang <Jerry.Zhang@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gZnVuY3Rpb24gX190dG1fZG1hX2FsbG9jX3BhZ2UoKSwgZF9wYWdlLT5hZGRyIGlzIGFsbG9j
YXRlZApieSBkbWFfYWxsb2NfYXR0cnMoKSBidXQgZnJlZWQgd2l0aCB1c2UgZG1hX2ZyZWVfY29o
ZXJlbnQoKSBpbgpfX3R0bV9kbWFfZnJlZV9wYWdlKCkuClVzZSB0aGUgY29ycmVjdCBkbWFfZnJl
ZV9hdHRycygpIHRvIGZyZWUgZF9wYWdlLT52YWRkci4KClNpZ25lZC1vZmYtYnk6IEZ1cWlhbiBI
dWFuZyA8aHVhbmdmcS5kYXhpYW5AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX3BhZ2VfYWxsb2NfZG1hLmMgfCA2ICsrKysrLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX3BhZ2VfYWxsb2NfZG1hLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9j
X2RtYS5jCmluZGV4IGQ1OTRmNzUyMGI3Yi4uN2Q3OGU2ZGVhYzg5IDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9wYWdlX2FsbG9jX2RtYS5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX3BhZ2VfYWxsb2NfZG1hLmMKQEAgLTI4NSw5ICsyODUsMTMgQEAgc3RhdGljIGlu
dCB0dG1fc2V0X3BhZ2VzX2NhY2hpbmcoc3RydWN0IGRtYV9wb29sICpwb29sLAogCiBzdGF0aWMg
dm9pZCBfX3R0bV9kbWFfZnJlZV9wYWdlKHN0cnVjdCBkbWFfcG9vbCAqcG9vbCwgc3RydWN0IGRt
YV9wYWdlICpkX3BhZ2UpCiB7CisJdW5zaWduZWQgbG9uZyBhdHRycyA9IDA7CiAJZG1hX2FkZHJf
dCBkbWEgPSBkX3BhZ2UtPmRtYTsKIAlkX3BhZ2UtPnZhZGRyICY9IH5WQUREUl9GTEFHX0hVR0Vf
UE9PTDsKLQlkbWFfZnJlZV9jb2hlcmVudChwb29sLT5kZXYsIHBvb2wtPnNpemUsICh2b2lkICop
ZF9wYWdlLT52YWRkciwgZG1hKTsKKwlpZiAocG9vbC0+dHlwZSAmIElTX0hVR0UpCisJCWF0dHJz
ID0gRE1BX0FUVFJfTk9fV0FSTjsKKworCWRtYV9mcmVlX2F0dHJzKHBvb2wtPmRldiwgcG9vbC0+
c2l6ZSwgKHZvaWQgKilkX3BhZ2UtPnZhZGRyLCBkbWEsIGF0dHJzKTsKIAogCWtmcmVlKGRfcGFn
ZSk7CiAJZF9wYWdlID0gTlVMTDsKLS0gCjIuMTEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
