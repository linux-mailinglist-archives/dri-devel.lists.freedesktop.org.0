Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45C9037169D
	for <lists+dri-devel@lfdr.de>; Mon,  3 May 2021 16:27:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 607326E43F;
	Mon,  3 May 2021 14:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 098886E2C0
 for <dri-devel@lists.freedesktop.org>; Mon,  3 May 2021 14:27:13 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id j28so6487434edy.9
 for <dri-devel@lists.freedesktop.org>; Mon, 03 May 2021 07:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4xGqizacbiw9MJ75uowgWIncMAnZVBASzeTU25jKJos=;
 b=mknGO4juur6Y4Lk0gzaBlVfOPvxv19mXjCay3wXCuR4XPIEhIOPv62NcN3EphvCWGu
 ozcAJbxnDnfTYNK9lMKdy6CyGjnELfqEff+dJrkRXUwPNqKuRk4rjE8Bykwo0+xBVRJL
 VN5IsVsch9u4BW3q4Qplz1btAsqUVf7mlIcQpBV6OKcJrrJjDKDpZkCxEbzOxZXAn+rx
 DuJgVgM/KBV1OeWaIHGEM10muHf7cw3iZlbFwH7a9Ij/i8anR1Yt/mX7RvQ2M9ZuIcq8
 7G5RbhIHglcJzR21xtBMw3nTWKDozvQIG6w2qfVl8tAC34zXiXNh+q8o9UPMzky1rusL
 WU6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4xGqizacbiw9MJ75uowgWIncMAnZVBASzeTU25jKJos=;
 b=jvoShBrZ3mAz6A+Vr2ZiqVxr+if16MkmRXwywN2406LNfZMXfEOe2f0WWUNHV6dnJo
 L4HvJf4uGhAmrAappbG6k0sS7k0dMSrXH0JdWNcWtHyQgkmPqw3SmM37I7vEUNHLpBUS
 Z/tI6hiH3g12ixZQ/o7LaPBR0nBqqpqMiJYB2c54QvmBpcw4lTo4ux+2T0y0E46+UCBQ
 cDwPtEKl58J0SFSsExSS+9uzfcGBoQoTyQgXcZhUhe8EvSLi7Ou99ddGHxNnPPsKFE3k
 XoYJHpm1mvltpTcL9wRQXekJcYMEdCXWNZ8LZsMA+c3+IbexhEEhl+mTrvTSyTknLYBG
 0v2Q==
X-Gm-Message-State: AOAM531ji8n4J7NHXH89YwQCgSkox40jBKXfK+aPwka+TBmYXCAb/9tV
 ZDGvWzoJ1nj6wTUW9kKvYehCI0Xq8Bw=
X-Google-Smtp-Source: ABdhPJxWqPdrPeQ9FuHON03IHhvtMbrHlQiKCZOGu4iIXGU11VI/TCzoHCfHTCqNFzFashSUd61txw==
X-Received: by 2002:aa7:c382:: with SMTP id k2mr1346617edq.189.1620052031761; 
 Mon, 03 May 2021 07:27:11 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fc25:a2b0:912e:91de])
 by smtp.gmail.com with ESMTPSA id u24sm12239599edt.85.2021.05.03.07.27.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 May 2021 07:27:11 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix warning in new sys man
Date: Mon,  3 May 2021 16:27:10 +0200
Message-Id: <20210503142710.153369-1-christian.koenig@amd.com>
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
Cc: matthew.auld@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5jbHVkZSB0aGUgaGVhZGVyIGZvciB0aGUgcHJvdG90eXBlLgoKU2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpSZXBvcnRlZC1ieToga2Vy
bmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fc3lzX21hbmFnZXIuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9zeXNfbWFuYWdlci5jIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fc3lzX21hbmFnZXIuYwppbmRleCBmNzU0ZDJjOTY1ZjEuLjQ3
NDIyMWU4NjNkMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fc3lzX21hbmFn
ZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9zeXNfbWFuYWdlci5jCkBAIC00LDYg
KzQsOCBAQAogI2luY2x1ZGUgPGRybS90dG0vdHRtX2RldmljZS5oPgogI2luY2x1ZGUgPGRybS90
dG0vdHRtX3BsYWNlbWVudC5oPgogCisjaW5jbHVkZSAidHRtX21vZHVsZS5oIgorCiBzdGF0aWMg
aW50IHR0bV9zeXNfbWFuX2FsbG9jKHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLAog
CQkJICAgICBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkJICAgICBjb25zdCBzdHJ1
Y3QgdHRtX3BsYWNlICpwbGFjZSwKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
