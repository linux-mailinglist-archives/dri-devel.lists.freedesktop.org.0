Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 311931766F1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 23:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0947C6E86B;
	Mon,  2 Mar 2020 22:26:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF4416E86E
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2020 22:26:50 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y17so1857805wrn.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Mar 2020 14:26:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WRBxH0UCFajRt6MVgdCo43fKAPtVFRLlI7EEwc3+Zq0=;
 b=jXYlYRLy+N/HxfLo1E2oesc7ekl588Hs1A9jj1h3j2jszmyUvfjWJJTFJ/rQ29ZJPn
 L+aWJHlsMR7FoQ8erNLgXWlobtJlXC6DRN5rumnpIZWzXjmxUs+l/V2Rb6SpTN3tnAO5
 LZZr8npFjPKIOc3MIWSL74QkkWw/0kmwnb3zk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WRBxH0UCFajRt6MVgdCo43fKAPtVFRLlI7EEwc3+Zq0=;
 b=M1ErKbUwWy/hYe6a70YajYcif0BetfoGSqBLkxQCX6SdEnizH6mmk/MymZ2RvYT+2+
 oqBVj1+tssBK2jVKxQiuHf0uWM+0NLlzc/SZpqM1Kt7IDdfYBsrjz9uUABkqPIhOcd/c
 XIdDUIWybCo8liwcEFxGsd+73VuJYYYcYAmjX34cPpXPAxGR9acFNWzm/7BSftlPcm76
 0A8WxH/YhY+xWSG/f9MFVt3PH/IO3+gM8nLtym0/FngVy5iygrH/qWDsCPHzCqSe/TZW
 rFaa6KWcmXWKl2ts+qyge7APHNGSkiiuXrVCGgNuPbDn05s3tF4IEqRsOH3zMYXdZ88r
 Z88g==
X-Gm-Message-State: ANhLgQ1t8rr/Sm2fMWFmJqYuRAkMey1K9QgEl9qw+rCnbdFk9g7tOj2V
 xkC+xIEdeRxSeKnZxWCYyWVUNnHuLsc=
X-Google-Smtp-Source: ADFU+vvY3T2tq/AXrfwd3VMdtrhHM9eziC+dY1f7z0SuK5J1FC2Ljf374dAPE/tGGSAE8rtAlWI7uQ==
X-Received: by 2002:a5d:6284:: with SMTP id k4mr1653787wru.398.1583188009204; 
 Mon, 02 Mar 2020 14:26:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o18sm26114589wrv.60.2020.03.02.14.26.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Mar 2020 14:26:48 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 06/51] drm/udl: Use drmm_add_final_kfree
Date: Mon,  2 Mar 2020 23:25:46 +0100
Message-Id: <20200302222631.3861340-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
References: <20200302222631.3861340-1-daniel.vetter@ffwll.ch>
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
Cc: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Dave Airlie <airlied@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2l0aCB0aGlzIHdlIGNhbiBkcm9wIHRoZSBmaW5hbCBrZnJlZSBmcm9tIHRoZSByZWxlYXNlIGZ1
bmN0aW9uLgoKdjI6IFdlIG5lZWQgZHJtX2Rldl9wdXQgdG8gdW5yb2xsIHRoZSBkcml2ZXIgY3Jl
YXRpb24gKG9uY2UKZHJtX2Rldl9pbml0IGFuZCBkcm1tX2FkZF9maW5hbF9rZnJlZSBzdWNlZWRl
ZCksIG90aGVyd2lzZQp0aGUgZHJtbV8gbWFnaWMgZG9lc24ndCBoYXBwZW4uCgp2MzogQWN0dWFs
bHkgc3F1YXNoIGluIHRoZSBmaXh1cCAoTGF1cmVudCkuCgpBY2tlZC1ieTogU2FtIFJhdm5ib3Jn
IDxzYW1AcmF2bmJvcmcub3JnPgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwu
dmV0dGVyQGludGVsLmNvbT4KQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRA
aWRlYXNvbmJvYXJkLmNvbT4KQ2M6IERhdmUgQWlybGllIDxhaXJsaWVkQHJlZGhhdC5jb20+CkNj
OiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPgpDYzogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5j
b20+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpDYzogIk5vcmFs
ZiBUcsO4bm5lcyIgPG5vcmFsZkB0cm9ubmVzLm9yZz4KQ2M6IFRob21hcyBHbGVpeG5lciA8dGds
eEBsaW51dHJvbml4LmRlPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3VkbC91ZGxfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYwppbmRl
eCBlNmMxY2Q3N2Q0ZDQuLjZhNTU5NDk0NjA5NiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3VkbC91ZGxfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMKQEAgLTEw
LDYgKzEwLDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPgogI2luY2x1ZGUgPGRy
bS9kcm1fZmlsZS5oPgogI2luY2x1ZGUgPGRybS9kcm1fZ2VtX3NobWVtX2hlbHBlci5oPgorI2lu
Y2x1ZGUgPGRybS9kcm1fbWFuYWdlZC5oPgogI2luY2x1ZGUgPGRybS9kcm1faW9jdGwuaD4KICNp
bmNsdWRlIDxkcm0vZHJtX3Byb2JlX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQu
aD4KQEAgLTM4LDcgKzM5LDYgQEAgc3RhdGljIHZvaWQgdWRsX2RyaXZlcl9yZWxlYXNlKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYpCiAJdWRsX2ZpbmkoZGV2KTsKIAl1ZGxfbW9kZXNldF9jbGVhbnVw
KGRldik7CiAJZHJtX2Rldl9maW5pKGRldik7Ci0Ja2ZyZWUoZGV2KTsKIH0KIAogc3RhdGljIHN0
cnVjdCBkcm1fZHJpdmVyIGRyaXZlciA9IHsKQEAgLTc3LDExICs3NywxMSBAQCBzdGF0aWMgc3Ry
dWN0IHVkbF9kZXZpY2UgKnVkbF9kcml2ZXJfY3JlYXRlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICpp
bnRlcmZhY2UpCiAKIAl1ZGwtPnVkZXYgPSB1ZGV2OwogCXVkbC0+ZHJtLmRldl9wcml2YXRlID0g
dWRsOworCWRybW1fYWRkX2ZpbmFsX2tmcmVlKCZ1ZGwtPmRybSwgdWRsKTsKIAogCXIgPSB1ZGxf
aW5pdCh1ZGwpOwogCWlmIChyKSB7Ci0JCWRybV9kZXZfZmluaSgmdWRsLT5kcm0pOwotCQlrZnJl
ZSh1ZGwpOworCQlkcm1fZGV2X3B1dCgmdWRsLT5kcm0pOwogCQlyZXR1cm4gRVJSX1BUUihyKTsK
IAl9CiAKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
