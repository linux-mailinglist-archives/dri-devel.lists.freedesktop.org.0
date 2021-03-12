Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79483388CE
	for <lists+dri-devel@lfdr.de>; Fri, 12 Mar 2021 10:38:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 887286E57E;
	Fri, 12 Mar 2021 09:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C31C6E57E
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 09:38:13 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ci14so51960653ejc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Mar 2021 01:38:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S9ZbltjTOGN2YLnKCqAYFDgHOSileUx9fmrdpxMQkVw=;
 b=GJsX3ik5s5ZX9ct38RF6Q/gpizbBLPR2z5Y2i/lIjr+yTuQmsr1PqX8DrPpTO7pnLQ
 Rk1QBBK6VY3b9NW5PWkBTeqCW+LqQKrnRs76rQ3ibOgesRuwSnvK1NDBT0cLwpVM2wpG
 DIvv3qsOU8o+YjthSyrFotcSFGJ9gqL03J+h3RahYUOJplF89M/T7NaOZblrOjKz02EI
 tQwb9s0ERGWymswDOQraVwnCojN7vQnD0U7ajNT3skz9WYgLTYxSN0bXmIZ3FvcfNUwp
 YNWayCSoyyjXWnyzqy9ZIhZlFnVKrF9ljVphtSxxjCjqn+yL2wh3cX9yjEnLZhlWH6C2
 z56Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S9ZbltjTOGN2YLnKCqAYFDgHOSileUx9fmrdpxMQkVw=;
 b=PC1gsuxppMHHQDp/1+4tkqnx9bDdSuRmC2O8280EOvPb9wCfg7RnrFyyEoC8Ajx0yX
 d3yyKJEYShHn4bqnJT0dV2jzIMcdw1+NV6MTsuj1rIIiglHCRVdObdbaGrLvNgciyEZB
 GfrAl+JbvdChyobqLqTPGHVnqbKkHuiNAVCsG4oxA32SYOW1fo8sBK5x27kn7lLUCAUV
 GX4Z6HoDwdO5vps0EN7cEFBTrlw2GVw9VeKUPdZcuiYfmBMVXzxCwg21VCzwDLZ8xlzH
 TTYdtvOaEbr6qQSVStN5EdJwjszEzr8Q/sTV33VQ9Y5L2EWD8R5hXdyHW/RtLspwfQBu
 qJ+g==
X-Gm-Message-State: AOAM532crkunBl2FzvVns5ZiNdt5OGxRAKcvn9KT8SICu84PYf9mRNI9
 sXTGX7T9ylKbqbehWl2qplW1QN/ftas=
X-Google-Smtp-Source: ABdhPJwqS1rLIS5+HfZXJt7pXOmleCm1Q2YX20mmHGcgWXCKDSPbFjhlaZjqR0F5AXGSbhwwO9D5tw==
X-Received: by 2002:a17:906:cb0a:: with SMTP id
 lk10mr2877135ejb.479.1615541891864; 
 Fri, 12 Mar 2021 01:38:11 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1155:c428:4aae:3d65])
 by smtp.gmail.com with ESMTPSA id i10sm2514914ejv.106.2021.03.12.01.38.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 01:38:11 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: make ttm_bo_unpin more defensive
Date: Fri, 12 Mar 2021 10:38:10 +0100
Message-Id: <20210312093810.2202-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugc2VlbSB0byBoYXZlIHNvbWUgbW9yZSBkcml2ZXIgYnVncyB0aGFuIHRob3VnaHQuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0t
LQogaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUv
ZHJtL3R0bS90dG1fYm9fYXBpLmggYi9pbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oCmluZGV4
IDRmYjUyM2RmYWIzMi4uZGY5ZmU1OTZlN2M1IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS90dG0v
dHRtX2JvX2FwaS5oCisrKyBiL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKQEAgLTYwMyw5
ICs2MDMsMTEgQEAgc3RhdGljIGlubGluZSB2b2lkIHR0bV9ib19waW4oc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibykKIHN0YXRpYyBpbmxpbmUgdm9pZCB0dG1fYm9fdW5waW4oc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibykKIHsKIAlkbWFfcmVzdl9hc3NlcnRfaGVsZChiby0+YmFzZS5y
ZXN2KTsKLQlXQVJOX09OX09OQ0UoIWJvLT5waW5fY291bnQpOwogCVdBUk5fT05fT05DRSgha3Jl
Zl9yZWFkKCZiby0+a3JlZikpOwotCS0tYm8tPnBpbl9jb3VudDsKKwlpZiAoYm8tPnBpbl9jb3Vu
dCkKKwkJLS1iby0+cGluX2NvdW50OworCWVsc2UKKwkJV0FSTl9PTl9PTkNFKHRydWUpOwogfQog
CiBpbnQgdHRtX21lbV9ldmljdF9maXJzdChzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwKLS0gCjIu
MjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
