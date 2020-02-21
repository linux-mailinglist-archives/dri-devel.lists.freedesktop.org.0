Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 290F5168889
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 22:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF816F51F;
	Fri, 21 Feb 2020 21:03:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC436F511
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 21:03:38 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e8so3532878wrm.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 13:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gKWR/t9h5ZQ8oC0csntnZ62otqvVOekkZh+S0/SdzhE=;
 b=TzE+QYA5e4H1ERPWfuNEF+gpqabhL1tTjGYtGrBHv2QC7+C17e+i0CGwnVa1MBePf+
 qdLwXvYZOyRG+Mu5dhKjn12Ef+R/3LCk0I4hc8iFs5wx0FxzHL7jbCJMXH+NVxm/MIGm
 YOoWrJL2GRxeePzFVXN8UGPfqCdmusjN7Pm+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gKWR/t9h5ZQ8oC0csntnZ62otqvVOekkZh+S0/SdzhE=;
 b=IhBP7m9Oq2u99/0ZMQe7dRFQq8trXm364s2PZQRPoXRUkfM4d4KZWCOUMDBnhYg4wo
 e5k0sZv30Ic92DUJS0OJJGLMs4IZyZ4U3mvqZRtEFlbPmjonuhnfm3tsiba+fFSLXhrH
 3eV619A0luW9fCVZZvSezIlBNVVY/JkwDrK5wjgY9rt/66It03pJOEgxgs7NOO5BPBG5
 5reTZVVtkFIe1jlvCal4iDfi5znamZhdpwgudAF7hUeX6kkNsfQJely7pex6F1M7fxyo
 EEXpwtRPpujL+5zzTdynnawI51Fzbm23gtskuRpgLYJh3g26dNeWALumJYsH5ufF5t8x
 6gcQ==
X-Gm-Message-State: APjAAAXL9J4bTg1GHso5Dky6W8Rxnq2tYSAV3FOah/uSnWeLMiHPB/O/
 zW+sUTxerhhg5Hj8fbLE0qS32gIw3ho=
X-Google-Smtp-Source: APXvYqwHS3wNfXJc+el08SanFXgdvHDfR4f/8UZJNgK8WmMARaRphlMxSQx0jCyDS4QaJjAPlpOJdg==
X-Received: by 2002:adf:e8ca:: with SMTP id k10mr47662067wrn.50.1582319016492; 
 Fri, 21 Feb 2020 13:03:36 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm5483930wrw.36.2020.02.21.13.03.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2020 13:03:35 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/51] drm/udl: Use drmm_add_final_kfree
Date: Fri, 21 Feb 2020 22:02:34 +0100
Message-Id: <20200221210319.2245170-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
References: <20200221210319.2245170-1-daniel.vetter@ffwll.ch>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGlzIHdlIGNhbiBkcm9wIHRoZSBmaW5hbCBrZnJlZSBmcm9tIHRoZSByZWxlYXNlIGZ1
bmN0aW9uLgoKdjI6IFdlIG5lZWQgZHJtX2Rldl9wdXQgdG8gdW5yb2xsIHRoZSBkcml2ZXIgY3Jl
YXRpb24gKG9uY2UKZHJtX2Rldl9pbml0IGFuZCBkcm1tX2FkZF9maW5hbF9rZnJlZSBzdWNlZWRl
ZCksIG90aGVyd2lzZQp0aGUgZHJtbV8gbWFnaWMgZG9lc24ndCBoYXBwZW4uCgp2MzogQWN0dWFs
bHkgc3F1YXNoIGluIHRoZSBmaXh1cCAoTGF1cmVudCkuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxh
dXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVk
QHJlZGhhdC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IFRob21hcyBa
aW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgpDYzogRW1pbCBWZWxpa292IDxlbWlsLmwu
dmVsaWtvdkBnbWFpbC5jb20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xs
LmNoPgpDYzogIk5vcmFsZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9yZz4KQ2M6IFRob21h
cyBHbGVpeG5lciA8dGdseEBsaW51dHJvbml4LmRlPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2
bmJvcmcub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jIHwgNiArKystLS0K
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRs
L3VkbF9kcnYuYwppbmRleCBlNmMxY2Q3N2Q0ZDQuLjZhNTU5NDk0NjA5NiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91
ZGxfZHJ2LmMKQEAgLTEwLDYgKzEwLDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5o
PgogI2luY2x1ZGUgPGRybS9kcm1fZmlsZS5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX3NobWVt
X2hlbHBlci5oPgorI2luY2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPgogI2luY2x1ZGUgPGRybS9k
cm1faW9jdGwuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgogI2luY2x1ZGUg
PGRybS9kcm1fcHJpbnQuaD4KQEAgLTM4LDcgKzM5LDYgQEAgc3RhdGljIHZvaWQgdWRsX2RyaXZl
cl9yZWxlYXNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJdWRsX2ZpbmkoZGV2KTsKIAl1ZGxf
bW9kZXNldF9jbGVhbnVwKGRldik7CiAJZHJtX2Rldl9maW5pKGRldik7Ci0Ja2ZyZWUoZGV2KTsK
IH0KIAogc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGRyaXZlciA9IHsKQEAgLTc3LDExICs3Nywx
MSBAQCBzdGF0aWMgc3RydWN0IHVkbF9kZXZpY2UgKnVkbF9kcml2ZXJfY3JlYXRlKHN0cnVjdCB1
c2JfaW50ZXJmYWNlICppbnRlcmZhY2UpCiAKIAl1ZGwtPnVkZXYgPSB1ZGV2OwogCXVkbC0+ZHJt
LmRldl9wcml2YXRlID0gdWRsOworCWRybW1fYWRkX2ZpbmFsX2tmcmVlKCZ1ZGwtPmRybSwgdWRs
KTsKIAogCXIgPSB1ZGxfaW5pdCh1ZGwpOwogCWlmIChyKSB7Ci0JCWRybV9kZXZfZmluaSgmdWRs
LT5kcm0pOwotCQlrZnJlZSh1ZGwpOworCQlkcm1fZGV2X3B1dCgmdWRsLT5kcm0pOwogCQlyZXR1
cm4gRVJSX1BUUihyKTsKIAl9CiAKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
