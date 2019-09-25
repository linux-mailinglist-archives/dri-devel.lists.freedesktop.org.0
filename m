Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960E0BD8FF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 09:20:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8A46EB35;
	Wed, 25 Sep 2019 07:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BB66E832
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 04:38:16 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id u8so10216734iom.5
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2019 21:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=5BDuZ4+Y3X5laJQOvw+qSCT7xhGoru1+k46cwYao5zs=;
 b=hqPO2mS5EfZKmnLeIk1g1AAE+1oL0Q7dREuT6KrAB6Sg5fyMvf8V/omaKb5t3rpq8P
 utWBnlYe0jh/yX+jOMoQf8+FvePnXBOCUFUlTnzgsnZ9DggX+JuBgAgC/SDPehKlFScy
 N8ygoym8SLgyAV9yPHNkiddiVimR9Mta9RbrEaABgKbei4ozVgTWwuPv4i0RczM+y9Hh
 KWkelMxdrMfv7vRdFqzPjfQYkDblj5Be3jB25w3JtpBmTI8Zj29REk9yb/voqjss4ZOE
 44ru+a01GiJu3zph4YuzSJVgRAv1M1FNP66W0lm/SI+whxoBjJoDceUAy/fVKO83TQ8p
 U5Lw==
X-Gm-Message-State: APjAAAXU78bffZbnWrtevx2tg+y2jU+YZMj4kVRq2wHsykUFDkac5eFC
 1jNX4St0ZGbupV8SSkYhxko=
X-Google-Smtp-Source: APXvYqzXt01BRxpe/Gpokn+Qqg4SqkmVtkWH3lUoq+gLxw/pva1ap3tM1cq/kabrKnKblef4yAbfsA==
X-Received: by 2002:a5d:8ac4:: with SMTP id e4mr8009350iot.185.1569386295248; 
 Tue, 24 Sep 2019 21:38:15 -0700 (PDT)
Received: from cs-dulles.cs.umn.edu (cs-dulles.cs.umn.edu. [128.101.35.54])
 by smtp.googlemail.com with ESMTPSA id g68sm33489ilh.88.2019.09.24.21.38.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Sep 2019 21:38:14 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: 
Subject: [PATCH] drm/vmwgfx: prevent memory leak in vmw_cmdbuf_res_add
Date: Tue, 24 Sep 2019 23:37:58 -0500
Message-Id: <20190925043800.726-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 25 Sep 2019 07:19:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=5BDuZ4+Y3X5laJQOvw+qSCT7xhGoru1+k46cwYao5zs=;
 b=mDXySTkDaQZsdqKg5+tkUpytcg3n00Lh6czbxsojHEwUp/Jd/Z26hPuo8nvxOck/EP
 I5hHoTiv4HuWD4+eMmDb1xEVFPDc/3H3RESpudOWjFsM8piowjdRO7XbTiF/sjHBjAXZ
 usQmXob+UkL9ysO1USfkRgoN7EzuYamxCMNxiMkOnIUmstzaW6Fw7orms/3Yq70boRl+
 BI0jEaXeJ4PHupSRsujX1ZF/68hTpmEVh3UpAdYli410sqwNEsJP/FKmvgyhCxJqyFq3
 cqnC3WaK/+zLvqCVRCSX2Ie3+6uVJyTxl72LKAwSjM3ZYavhs0N8WRtNVwUVosfpEiMi
 Ml/g==
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

SW4gdm13X2NtZGJ1Zl9yZXNfYWRkIGlmIGRybV9odF9pbnNlcnRfaXRlbSBmYWlscyB0aGUgYWxs
b2NhdGVkIG1lbW9yeQpmb3IgY3JlcyBzaG91bGQgYmUgcmVsZWFzZWQuCgpTaWduZWQtb2ZmLWJ5
OiBOYXZpZCBFbWFtZG9vc3QgPG5hdmlkLmVtYW1kb29zdEBnbWFpbC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY21kYnVmX3Jlcy5jIHwgNCArKystCiAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY21kYnVmX3Jlcy5jIGIvZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfY21kYnVmX3Jlcy5jCmluZGV4IDRhYzU1ZmMyYmY5Ny4uNDRkODU4Y2U0Y2U3
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWZfcmVzLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfY21kYnVmX3Jlcy5jCkBAIC0yMDks
OCArMjA5LDEwIEBAIGludCB2bXdfY21kYnVmX3Jlc19hZGQoc3RydWN0IHZtd19jbWRidWZfcmVz
X21hbmFnZXIgKm1hbiwKIAogCWNyZXMtPmhhc2gua2V5ID0gdXNlcl9rZXkgfCAocmVzX3R5cGUg
PDwgMjQpOwogCXJldCA9IGRybV9odF9pbnNlcnRfaXRlbSgmbWFuLT5yZXNvdXJjZXMsICZjcmVz
LT5oYXNoKTsKLQlpZiAodW5saWtlbHkocmV0ICE9IDApKQorCWlmICh1bmxpa2VseShyZXQgIT0g
MCkpIHsKKwkJa2ZyZWUoY3Jlcyk7CiAJCWdvdG8gb3V0X2ludmFsaWRfa2V5OworCX0KIAogCWNy
ZXMtPnN0YXRlID0gVk1XX0NNREJVRl9SRVNfQUREOwogCWNyZXMtPnJlcyA9IHZtd19yZXNvdXJj
ZV9yZWZlcmVuY2UocmVzKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
