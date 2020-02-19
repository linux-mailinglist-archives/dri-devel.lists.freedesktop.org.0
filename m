Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C81BE1641BD
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 11:23:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811056EB97;
	Wed, 19 Feb 2020 10:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEB16EB86
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:22:28 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id r11so27487478wrq.10
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 02:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lIaP46HNJqsV2xcSO1/Lcgf0ktGtkKF9adts2it9DSM=;
 b=lQFV2ZR16yH4Q+Xk9P1EFMs/dlrjmIRgnHCx9Q6BkvPOvHE9n9JVxsGm8/q/mILnl8
 cZ913ejm/eFFpav58dXEZWcW28O+xQTbzMkjvt/2EDCz2M9sMPxAS0Ec1npGm1xb78dq
 j9VQBtL+UZXzKByez/VEVnr/tJusupalsLuOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lIaP46HNJqsV2xcSO1/Lcgf0ktGtkKF9adts2it9DSM=;
 b=T5XPZOy/An2H4wM+llCvu1IrN1WBTcpbEZVo3SP8czkvLv8mevrwQVu2bwgTx4NbMF
 3zRht4M6yj/lRInk7m5XqdiypS16uFqaoHI7zKEw9QC2/k6l9v5WZSbub8EKuCexSPYx
 G9xoAg0c6gh6VG/XJBSub5F2ci0MKdZZBaIXdgDe5tls6EQ3aI+edG8XFYWr84B5xSGh
 zlEqh9///+rls/W8mwyjSM7BkE3oCaxopu6HN8tz8dSGjW6kj/UBdsEOlGAeb9CbrAcN
 /ARFbX0Qr1I2qRTPkxjSk3yxMcU0HahCicWwbpspuXrJ23PxA9RsgXx/Z1JvR/yZ8jG7
 NQhA==
X-Gm-Message-State: APjAAAUgt2sAwdDF7pGZEkDxlmchK0rJhmb86pu1nsuesjafP3NiswA2
 kFYAIxMmlsZ5nULwMMrAJf66hATWo2o=
X-Google-Smtp-Source: APXvYqzN5joCkR1iKQ8phrZJL7c16LaWsGd/6eMQJSMXl5TnxwaA+CzLiMPo9UawpgHinn+J2OPcQA==
X-Received: by 2002:adf:c54e:: with SMTP id s14mr33823657wrf.385.1582107747046; 
 Wed, 19 Feb 2020 02:22:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s23sm2370339wra.15.2020.02.19.02.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 02:22:26 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 47/52] drm/repaper: Drop explicit drm_mode_config_cleanup call
Date: Wed, 19 Feb 2020 11:21:17 +0100
Message-Id: <20200219102122.1607365-48-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
References: <20200219102122.1607365-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3dzIHVzIHRvIGRyb3AgdGhlIGRybV9kcml2ZXIucmVsZWFzZSBjYWxsYmFjay4KClNpZ25l
ZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogIk5v
cmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
dGlueS9yZXBhcGVyLmMgfCA4IC0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdGlueS9yZXBhcGVyLmMKaW5kZXggNDc0MWZmNjcwZWM5Li4yZjcwZmIxYmUyMDAg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIuYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vdGlueS9yZXBhcGVyLmMKQEAgLTkwOSwxMyArOTA5LDYgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBkcm1fbW9kZV9jb25maWdfZnVuY3MgcmVwYXBlcl9tb2RlX2NvbmZpZ19mdW5jcyA9
IHsKIAkuYXRvbWljX2NvbW1pdCA9IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdCwKIH07CiAKLXN0
YXRpYyB2b2lkIHJlcGFwZXJfcmVsZWFzZShzdHJ1Y3QgZHJtX2RldmljZSAqZHJtKQotewotCURS
TV9ERUJVR19EUklWRVIoIlxuIik7Ci0KLQlkcm1fbW9kZV9jb25maWdfY2xlYW51cChkcm0pOwot
fQotCiBzdGF0aWMgY29uc3QgdWludDMyX3QgcmVwYXBlcl9mb3JtYXRzW10gPSB7CiAJRFJNX0ZP
Uk1BVF9YUkdCODg4OCwKIH07CkBAIC05NTMsNyArOTQ2LDYgQEAgREVGSU5FX0RSTV9HRU1fQ01B
X0ZPUFMocmVwYXBlcl9mb3BzKTsKIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciByZXBhcGVyX2Ry
aXZlciA9IHsKIAkuZHJpdmVyX2ZlYXR1cmVzCT0gRFJJVkVSX0dFTSB8IERSSVZFUl9NT0RFU0VU
IHwgRFJJVkVSX0FUT01JQywKIAkuZm9wcwkJCT0gJnJlcGFwZXJfZm9wcywKLQkucmVsZWFzZQkJ
PSByZXBhcGVyX3JlbGVhc2UsCiAJRFJNX0dFTV9DTUFfVk1BUF9EUklWRVJfT1BTLAogCS5uYW1l
CQkJPSAicmVwYXBlciIsCiAJLmRlc2MJCQk9ICJQZXJ2YXNpdmUgRGlzcGxheXMgUmVQYXBlciBl
LWluayBwYW5lbHMiLAotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
