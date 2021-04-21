Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1248366C85
	for <lists+dri-devel@lfdr.de>; Wed, 21 Apr 2021 15:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F20386E15F;
	Wed, 21 Apr 2021 13:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94866E15F
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 13:20:15 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id cq11so5699466edb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Apr 2021 06:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bV2+iaLvlgLHnb19R4rIgUB8ivM93pPvuTJSfa7AbgI=;
 b=rlTaaspvH5ESqX5Dez3Dr9A313tLebI5kAtlZ98klePruheU5m62tFcekoRd8KKvxF
 pOGL3lJa3LG0JadS5qxWN7ZDak2MJGNybVsmlQ2lQuns4CiWUzAAVEaIopwQsDZU8DfY
 0bSaMK9lavqsqu9OsQOmye8Gityd2ImMIGtAqeO8TESQ3FWnVAqGpCl2YURd40CAnkVa
 rjOZTzFzlZUa0bKWp/kFAdwVp4w2OM2GSnC7JdizxlAz4F98kW3ihkU2vf2H89SLb+iG
 uQGn0QSBC+R+WAFg7MfZpKhM9NC/MrD0jsqlb+lXRk8aDh9x229qIf0wAdRevunZTlq+
 rrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bV2+iaLvlgLHnb19R4rIgUB8ivM93pPvuTJSfa7AbgI=;
 b=MXK0ZcPIyOE59YUV8/WfdrWZkq41l8AjzP5MvTCFbDGKmVJBcUefTWzrWaxDq6AmDh
 uVKFBDq2R4wLwz1Y+uev9xhl9FvkWunr8tlGRL7kxfY7iL/7tW32xolgyv6wEwRd5Xbn
 deu1wN8bgzMaHfJkAofkLIguhMn8NXv3Uhxt2VFVcTYpwaSKDLyGZhBolIi+e3rm20+V
 35wrheYo+yZUuZ2v4n4yb0dZ1g0XZmQRM8xEDz8nEBvUxjXfOl5M5iU+LF6FP5rJhAEw
 9QdxSRC7rooxrVCyFyGRF9sjGK4m00TCMc+BF3RaW+lCyE683w9nt4TWwmUgC1rG+10E
 igtg==
X-Gm-Message-State: AOAM5338Bp99bU4hRmF1R0+ceUA93Q/Vf4Dn5+LFLov1BypimZ8Y7leH
 OFDEfFLGk2+KSOXiKayl7ts=
X-Google-Smtp-Source: ABdhPJySPVd6U0P9NUSv/L7Jn+1Vhfvq2VSBMPTWo7It//ZrkXlXzknjxJRQeMu/dUU8gywj8dxpHQ==
X-Received: by 2002:a05:6402:51cd:: with SMTP id
 r13mr38568119edd.116.1619011214441; 
 Wed, 21 Apr 2021 06:20:14 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6d51:959c:b29c:d1fe])
 by smtp.gmail.com with ESMTPSA id k9sm3504463edv.69.2021.04.21.06.20.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 06:20:13 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linux-kernel@vger.kernel.org, linux-unionfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] coda: fix reference counting in coda_file_mmap error path
Date: Wed, 21 Apr 2021 15:20:11 +0200
Message-Id: <20210421132012.82354-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: jgg@ziepe.ca, jaharkes@cs.cmu.edu, akpm@linux-foundation.org,
 miklos@szeredi.hu, coda@cs.cmu.edu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

bW1hcF9yZWdpb24oKSBub3cgY2FsbHMgZnB1dCgpIG9uIHRoZSB2bWEtPnZtX2ZpbGUuCgpTbyB3
ZSBuZWVkIHRvIGRyb3AgdGhlIGV4dHJhIHJlZmVyZW5jZSBvbiB0aGUgY29kYSBmaWxlIGluc3Rl
YWQgb2YgdGhlCmhvc3QgZmlsZS4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KRml4ZXM6IDE1MjdmOTI2ZmQwNCAoIm1tOiBtbWFwOiBm
aXggZnB1dCBpbiBlcnJvciBwYXRoIHYyIikKQ0M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyA1
LjExKwotLS0KIGZzL2NvZGEvZmlsZS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZnMvY29kYS9maWxlLmMg
Yi9mcy9jb2RhL2ZpbGUuYwppbmRleCAxMjhkNjNkZjViZmIuLmVmNWNhMjJiZmIzZSAxMDA2NDQK
LS0tIGEvZnMvY29kYS9maWxlLmMKKysrIGIvZnMvY29kYS9maWxlLmMKQEAgLTE3NSwxMCArMTc1
LDEwIEBAIGNvZGFfZmlsZV9tbWFwKHN0cnVjdCBmaWxlICpjb2RhX2ZpbGUsIHN0cnVjdCB2bV9h
cmVhX3N0cnVjdCAqdm1hKQogCXJldCA9IGNhbGxfbW1hcCh2bWEtPnZtX2ZpbGUsIHZtYSk7CiAK
IAlpZiAocmV0KSB7Ci0JCS8qIGlmIGNhbGxfbW1hcCBmYWlscywgb3VyIGNhbGxlciB3aWxsIHB1
dCBjb2RhX2ZpbGUgc28gd2UKLQkJICogc2hvdWxkIGRyb3AgdGhlIHJlZmVyZW5jZSB0byB0aGUg
aG9zdF9maWxlIHRoYXQgd2UgZ290LgorCQkvKiBpZiBjYWxsX21tYXAgZmFpbHMsIG91ciBjYWxs
ZXIgd2lsbCBwdXQgaG9zdF9maWxlIHNvIHdlCisJCSAqIHNob3VsZCBkcm9wIHRoZSByZWZlcmVu
Y2UgdG8gdGhlIGNvZGFfZmlsZSB0aGF0IHdlIGdvdC4KIAkJICovCi0JCWZwdXQoaG9zdF9maWxl
KTsKKwkJZnB1dChjb2RhX2ZpbGUpOwogCQlrZnJlZShjdm1fb3BzKTsKIAl9IGVsc2UgewogCQkv
KiBoZXJlIHdlIGFkZCByZWRpcmVjdHMgZm9yIHRoZSBvcGVuL2Nsb3NlIHZtX29wZXJhdGlvbnMg
Ki8KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
