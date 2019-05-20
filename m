Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 435CC2437C
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 00:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 880418924C;
	Mon, 20 May 2019 22:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03E68924C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 22:35:07 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id w11so26121320edl.5
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2019 15:35:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1fN+r8LppqkMfzlOD3x2+o0x5WCJ7bTH7ObkT6dNi0s=;
 b=Hn1eo37j8YDnuDUpDhbkHXzv82KpZsOdQTnuakjxwDW8XorXb+I/u7LitOY9i7+xOg
 +kmS+TQgss6IDgQFtaHRkpncUCYQoNmkHEeMzpEOAZDVNo7OQWOwjw+hwhsVXw+fbU/O
 8FCjzi6WFIrGd2auMmGGy3ZD+VdqmqaTIu+vODYIM4FFyezf5pS5CPZ4RvFUiPS1pi9T
 AiB10UkS28iN5zHxQRpPLrKI9usc1bumVxVB6h5VujboR+xOg2ZsnU6Eq3F+0Wdhy4se
 7IiaJryZV42SYv+5EaGK9izjm9ZWN75d4YIZOvG+Sda/sdyDUD4zCdON6ohebd16mQmx
 CAcw==
X-Gm-Message-State: APjAAAVBJVihWiiQ4UFwTe+Q+iYa64qpOGj6YV/mczQyRAubO4jxN0GX
 IiYpqEtSwLzjlIPND1IT5aR8xZRHcVw=
X-Google-Smtp-Source: APXvYqzLUDBblyvpznECaOb4/0tVCmXFXM9wYVhoMkRhivSR8kRM8kctX6Zgp7gtLGJEBT9G+X9rMw==
X-Received: by 2002:a50:97d6:: with SMTP id f22mr78014937edb.115.1558391706131; 
 Mon, 20 May 2019 15:35:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id s15sm5843159edm.6.2019.05.20.15.35.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 20 May 2019 15:35:05 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/vmwgfx: Don't look at state->allow_modeset
Date: Tue, 21 May 2019 00:35:00 +0200
Message-Id: <20190520223500.6032-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1fN+r8LppqkMfzlOD3x2+o0x5WCJ7bTH7ObkT6dNi0s=;
 b=O57kOemQo2FQCvuKQpRz8JRYns2WVGInwbKVWsyqGzedOIttEYaY3QnYp6nTbKX6H4
 XkcgEXBp7J5WVrV7aPH6Asr3w6Q5ChqzFxBNRSC9qcWuHGJOBg5CnE493mxGRKm4vwfM
 k7w/S9xp4/Q+sFJAW7zyJmBh02R4ctctjl5Fw=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhdCdzIHB1cmVseSBmb3IgdGhlIHVhcGkgbGF5ZXIgdG8gaW1wbGVtZW50IHRoZSBBTExPV19N
T0RFU0VUIGZsYWcuCgpEcml2ZXJzIHNob3VsZCBpbnN0ZWFkIGxvb2sgYXQgdGhlIHN0YXRlLCBl
LmcuIHRocm91Z2gKZHJtX2F0b21pY19jcnRjX25lZWRzX21vZGVzZXQoKSwgd2hpY2ggdm13Z2Z4
IGFscmVhZHkgZG9lcy4gQWxzbyByZW1vdmUKdGhlIGNvbmZ1c2luZyBjb21tZW50LCBzaW5jZSBj
aGVja2luZyBhbGxvd19tb2Rlc2V0IGlzIGF0IGJlc3QgYSBtaWNybwpvcHRpbWl6YXRpb24uCgp2
MjogUmViYXNlCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZm
d2xsLmNoPgpDYzogVk13YXJlIEdyYXBoaWNzIDxsaW51eC1ncmFwaGljcy1tYWludGFpbmVyQHZt
d2FyZS5jb20+CkNjOiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfa21zLmMgfCA4IC0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dm13Z2Z4L3Ztd2dmeF9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2ttcy5j
CmluZGV4IGI5N2JjOGU1OTQ0Yi4uMzQyODRmMGY1MDg0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdm13Z2Z4L3Ztd2dmeF9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Zt
d2dmeF9rbXMuYwpAQCAtMTcwNCwxNCArMTcwNCw2IEBAIHZtd19rbXNfYXRvbWljX2NoZWNrX21v
ZGVzZXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0Owog
Ci0JaWYgKCFzdGF0ZS0+YWxsb3dfbW9kZXNldCkKLQkJcmV0dXJuIHJldDsKLQotCS8qCi0JICog
TGVnYWN5IHBhdGggZG8gbm90IHNldCBhbGxvd19tb2Rlc2V0IHByb3Blcmx5IGxpa2UKLQkgKiBA
ZHJtX2F0b21pY19oZWxwZXJfdXBkYXRlX3BsYW5lLCBUaGlzIHdpbGwgcmVzdWx0IGluIHVubmVj
ZXNzYXJ5IGNhbGwKLQkgKiB0byB2bXdfa21zX2NoZWNrX3RvcG9sb2d5LiBTbyBleHRyYSBzZXQg
b2YgY2hlY2suCi0JICovCiAJZm9yX2VhY2hfbmV3X2NydGNfaW5fc3RhdGUoc3RhdGUsIGNydGMs
IGNydGNfc3RhdGUsIGkpIHsKIAkJaWYgKGRybV9hdG9taWNfY3J0Y19uZWVkc19tb2Rlc2V0KGNy
dGNfc3RhdGUpKQogCQkJbmVlZF9tb2Rlc2V0ID0gdHJ1ZTsKLS0gCjIuMjAuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
