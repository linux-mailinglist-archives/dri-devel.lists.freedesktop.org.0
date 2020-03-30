Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E2E197DA4
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 15:55:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 875CB6E3A0;
	Mon, 30 Mar 2020 13:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 404836E391;
 Mon, 30 Mar 2020 13:55:40 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id w10so21805258wrm.4;
 Mon, 30 Mar 2020 06:55:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=EdSiddoWJSbLr+HoD/rzQuDxDnh96tXalnlSTnjDyNk=;
 b=l3+HdNQM8KOBL4+BQ0/ZA8SPXSICm4rLXynvef3cSzENnkbpooxCU7lzs5/aPaAKTc
 CIy8DhjFXJ2vbi+57h+hCmwrI9iW5Ka0n7rEwgaA5fQk4AXZlCrt5nWyeWITJpYnl/Mr
 /huXAByyWhIgOUxJILXl49ITCm81M3Qh1z4ryvpjgngHx9pKhEuCDHZtuUv5BedgHL+I
 cl0kUGNNOY/tm7/mwipJHasjGqWChbmegoSOY24gJ7BOArzmmGCmcEqOEdiwHXvr0OkW
 E8a9dNKMX5wiRx30Me667daqvhiTjAEu4daLgoJBc5H83ufFl5GpyJ/R3XVWgjBsmu1/
 D5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EdSiddoWJSbLr+HoD/rzQuDxDnh96tXalnlSTnjDyNk=;
 b=hu7ujMwQfOLVAtG6AUOtEP7g97Kfp6IEtRf3n1+3/DTKVAnkkiNUFNoOcU4KmOB8iB
 jRahONRtzZ2hMSvGn4Q7bsCF8f3ZqP+ZkXrKMbdtEV3eyTOBkpzFjS0nElItBZUdNvRR
 D0L6isgGouUgLEikJyr+8oD1kAYDwKlT/4Irh6Hii1cXQUQhbHFSCVzwkINc/81WYya6
 zpfkl5MpRAPaiQpETEMxl0MDfpqLh/H64sBg3tQYSf+R0l1AzmDJAip8lNiWPeJSvpZL
 1LXWu0Cu7t9GyS+1N9fNxGkNcpMACUq0YYBLQiLEdaIBhIOdrmgvv8nL9n+rIZl3Gn5Q
 9c+Q==
X-Gm-Message-State: ANhLgQ0jZURV2R5Aj7j9u0rX+KRI+p95+baG+198NFvYTOS2uo2+wjjj
 h6LIL2lDUpXNQHHCAVQUNs1B8tsZ
X-Google-Smtp-Source: ADFU+vvO0yYRajU2wnE5wh9U/t37IlY1BuHmMDnNO6Yjq6An9UxsoaauhbR9y1pGuUew9w2/V+koBg==
X-Received: by 2002:adf:904a:: with SMTP id h68mr14131311wrh.291.1585576538791; 
 Mon, 30 Mar 2020 06:55:38 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:f999:5819:bfe0:10e8])
 by smtp.gmail.com with ESMTPSA id z16sm22267660wrr.56.2020.03.30.06.55.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 06:55:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 daniel@ffwll.ch
Subject: [PATCH 3/6] drm/amdgpu: note that we can handle peer2peer DMA-buf
Date: Mon, 30 Mar 2020 15:55:33 +0200
Message-Id: <20200330135536.2997-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200330135536.2997-1-christian.koenig@amd.com>
References: <20200330135536.2997-1-christian.koenig@amd.com>
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

SW1wb3J0aW5nIHNob3VsZCB3b3JrIG91dCBvZiB0aGUgYm94LgoKU2lnbmVkLW9mZi1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kbWFfYnVmLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1
Zi5jCmluZGV4IGZmZWIyMGYxMWMwNy4uYWVmMTJlZTJmMWUzIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKQEAgLTUxNCw2ICs1MTQsNyBAQCBhbWRncHVf
ZG1hX2J1Zl9tb3ZlX25vdGlmeShzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2htZW50ICphdHRhY2gpCiB9
CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZG1hX2J1Zl9hdHRhY2hfb3BzIGFtZGdwdV9kbWFfYnVm
X2F0dGFjaF9vcHMgPSB7CisJLmFsbG93X3BlZXIycGVlciA9IHRydWUsCiAJLm1vdmVfbm90aWZ5
ID0gYW1kZ3B1X2RtYV9idWZfbW92ZV9ub3RpZnkKIH07CiAKLS0gCjIuMTcuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
