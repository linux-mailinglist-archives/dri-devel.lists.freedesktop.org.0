Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD08D7BA51
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2019 09:14:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8DFB6E68C;
	Wed, 31 Jul 2019 07:13:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E077489F2A
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 08:40:38 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id s1so23380973pgr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2019 01:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=89mycYetQz5Yslqgw4Pph6ixeB6FTUjlPdQo+OF5joc=;
 b=lqs5GPI/sKntI6QeAFUnQ1gxDbWQEMBryLdTZEl7ymFoG7LOWvRE8XZH8BLCFTM7az
 Gqla4vuruwaH6dBP3kJIWiIGpf14rLMg+VV8B63NsFSf/HiElGjFrgZnGp0h3csHpPUj
 rQl8pPhUGmTQbBnjUVK6OI5YfsM0KUlR+w6eJWrND7gEV1ie18zAXkQIDf+Qvr9oAoD3
 6Rx/RE+75mzkNa6KyRlWD8vLkYn7rLvKa3JgC4iwGP9N5RtmJRtnyXHI2FKngORGJiOZ
 8zmTN+sk1K3DyLva2IVjsmdbd4clH0CGD8Y3alvRPyLvehPHsPPahpRmI2olGvB8ppXA
 88RA==
X-Gm-Message-State: APjAAAULEcWICFIakdcvVqs3ULO9JDmRKoeiHU39Hk8TnpOJqjzXzSHX
 p/9lfj0zDx9M/cmtsZIIxmk=
X-Google-Smtp-Source: APXvYqwCGMJk7lZF/xsXFdQ865XRIEZNHtSYQFSJRY9fc8zCbMdRagl6dMRC+1/yHF/RMoyVyiY/tQ==
X-Received: by 2002:a17:90a:9a83:: with SMTP id
 e3mr113839937pjp.105.1564476038528; 
 Tue, 30 Jul 2019 01:40:38 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
 by smtp.gmail.com with ESMTPSA id f14sm64869091pfn.53.2019.07.30.01.40.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 30 Jul 2019 01:40:37 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/modes: Fix unterminated strncpy
Date: Tue, 30 Jul 2019 16:40:32 +0800
Message-Id: <20190730084032.26428-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 31 Jul 2019 07:13:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=89mycYetQz5Yslqgw4Pph6ixeB6FTUjlPdQo+OF5joc=;
 b=Knht/IRU4k7wq/cQ51U9Kxl0GUJxlqbKKLjv2bcHydJTmkTGI1lgEFLzf2ku2tIMRe
 1WKKDR4H6ZH0aTu5xzGX+lYUbF9om75GP75DYAj+ry99lrHXFWJWxr6MZrp9ppXQZL0h
 uOiU81fhEolXjHRrU9XkX6YogMjGoMX2b/Gk84URoDW0XFWkHNGvyCoxQoGKNOpsdbKY
 KfSpp8Q9LSBnJf4MS3Btn/LO+55IxBE/KCEBIbGPHQcVH3SKzA8yAbMNTJF5ZcL3q7vv
 aykgAf2pBeGUIqa10lPl5i6UmtWtNfUjUFCbBGf+ryV9kturtIUcqPnjXxz8O+dPE/lh
 njXw==
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

c3RybmNweShkZXN0LCBzcmMsIHN0cmxlbihzcmMpKSBsZWFkcyB0byB1bnRlcm1pbmF0ZWQKZGVz
dCwgd2hpY2ggaXMgZGFuZ2Vyb3VzLgpGaXggaXQgYnkgdXNpbmcgc3Ryc2NweS4KClNpZ25lZC1v
ZmYtYnk6IENodWhvbmcgWXVhbiA8aHNsZXN0ZXI5NkBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2RybV9tb2Rlcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCmluZGV4IDgwZmNkNWRjMTU1OC4uMTcwZmMy
NGUwZjMxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCkBAIC0xNzcwLDcgKzE3NzAsNyBAQCBib29sIGRybV9t
b2RlX3BhcnNlX2NvbW1hbmRfbGluZV9mb3JfY29ubmVjdG9yKGNvbnN0IGNoYXIgKm1vZGVfb3B0
aW9uLAogCX0KIAogCWlmIChuYW1lZF9tb2RlKSB7Ci0JCXN0cm5jcHkobW9kZS0+bmFtZSwgbmFt
ZSwgbW9kZV9lbmQpOworCQlzdHJzY3B5KG1vZGUtPm5hbWUsIG5hbWUsIG1vZGVfZW5kICsgMSk7
CiAJfSBlbHNlIHsKIAkJcmV0ID0gZHJtX21vZGVfcGFyc2VfY21kbGluZV9yZXNfbW9kZShuYW1l
LCBtb2RlX2VuZCwKIAkJCQkJCSAgICAgIHBhcnNlX2V4dHJhcywKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
