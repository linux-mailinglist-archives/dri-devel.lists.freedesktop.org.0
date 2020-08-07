Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E7523EE4F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 15:37:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F74D6E9EE;
	Fri,  7 Aug 2020 13:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC23D6E9E9;
 Fri,  7 Aug 2020 13:37:03 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r4so1702558wrx.9;
 Fri, 07 Aug 2020 06:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4LVGnEnOhzHJYp7k/0jPrqpIv6dziA/YJ8laLNioGFM=;
 b=vPrchpkKsG/T8AFiA7Yn7M46PLKiPZDNi/VQkH2XagE4mkxFfqePQ0DxXi+WpJ0U+R
 6+Tigj2zd0aonU/AOQBMGGxh/7cj9dH4jhH2VUrWClb3vy1rnD1tCXk42aJL1AHYH9BG
 Q4Uz5H0srLIX9r+VyELVxP9kuxiAsEbUqq9hEoDmU5/crvFK+xwDOtq3mnLgQkLKHdLX
 ZrLAMvRodPLri/9wPmrIwsmz4cFf505+ZmWsdmEO9LLOySAhCm/VB094CFm7/MxkVVh0
 h70Gf9ij6xNTbK0wO3r9fgqqJItuYk3DK8aD5rK/6yo4wsXCG5VGzupDxsUhheb284q4
 WXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4LVGnEnOhzHJYp7k/0jPrqpIv6dziA/YJ8laLNioGFM=;
 b=app3am3td3swYga6JyQU0BbERLak1SP3PV1MQunXL6kpq0Y+LwGRFWDCYVX/O1o0ok
 3BK04QUhIESLoiFce1u+C1KyQfcOzexzGrfvG4tkkfqbHK5cQVLYQE0eg9s/oLITQwDN
 GXaidbGx8K0UgEmHWEi9jRIRdQg/ogOjqqXoaJ659lKsuqmoAQ1gC0gsT1irjYzTGQE2
 7LLM/i5AlAIuBx9jtHmohoddZhx5xYNPd59QcZ1TJPtROh2H4oUdiYqrfj03C+Nur8Gk
 PXw5Z5ANnylbuo9HyY/73fnSCQWr0gnvC9szwYUSOjOHaJXJ+JqYsFg9kCSydHE+R8pq
 F8nA==
X-Gm-Message-State: AOAM531vAkbtVk8P4sM1YmojcqsUngfBKjvBRjB6cTkZqy9fVOne2D9J
 kgabhjxW/eE1khHQVMd0Sx8csQNM
X-Google-Smtp-Source: ABdhPJyy6/1Evq0AWxcj8cS24OPjPyqAVqG2TPNcf52PUYgYZc8VHPTAJXAA/0IWvQkVVjS73ndtbw==
X-Received: by 2002:a5d:630b:: with SMTP id i11mr12856842wru.95.1596807422267; 
 Fri, 07 Aug 2020 06:37:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:8a1:e63e:700c:859e])
 by smtp.gmail.com with ESMTPSA id k126sm11084609wme.17.2020.08.07.06.37.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 06:37:01 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amdgpu: adjust the pid in the grab_id trace point
Date: Fri,  7 Aug 2020 15:36:58 +0200
Message-Id: <20200807133658.1866-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200807133658.1866-1-christian.koenig@amd.com>
References: <20200807133658.1866-1-christian.koenig@amd.com>
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
Cc: alexander.deucher@amd.com, daniel.vetter@ffwll.ch, Shashank.Sharma@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VHJhY2Ugc29tZXRoaW5nIHVzZWZ1bCBpbnN0ZWFkIG9mIHRoZSBwaWQgb2YgYSBrZXJuZWwgdGhy
ZWFkIGhlcmUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3RyYWNl
LmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90cmFjZS5oIGIvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3RyYWNlLmgKaW5kZXggNWRhMjBmYzE2NmQ5Li4wN2Y5OWVmNjlk
OTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90cmFjZS5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90cmFjZS5oCkBAIC0yMjgs
NiArMjI4LDcgQEAgVFJBQ0VfRVZFTlQoYW1kZ3B1X3ZtX2dyYWJfaWQsCiAJCQkgICAgICksCiAK
IAkgICAgVFBfZmFzdF9hc3NpZ24oCisJCQkgICBfX2VudHJ5LT5lbnQucGlkID0gdm0tPnRhc2tf
aW5mby5waWQ7CiAJCQkgICBfX2VudHJ5LT5wYXNpZCA9IHZtLT5wYXNpZDsKIAkJCSAgIF9fYXNz
aWduX3N0cihyaW5nLCByaW5nLT5uYW1lKQogCQkJICAgX19lbnRyeS0+dm1pZCA9IGpvYi0+dm1p
ZDsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
