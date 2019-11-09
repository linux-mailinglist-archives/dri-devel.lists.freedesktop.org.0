Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 654A9F6CAD
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 03:29:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9966E81F;
	Mon, 11 Nov 2019 02:29:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CA856E13C
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Nov 2019 07:54:28 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id d7so3446944pls.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Nov 2019 23:54:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=veiAcMlIgcLHjJxd0QNhUHza9s431ffRaEJpWcEHXlA=;
 b=dF08QzVbu2yYhpf6zfJ0PJ01r+9DTSNHafPSYQIF+2Ajtkq3W3ZAAx11WAqbquhlQl
 VlTWxNS0lWliy99dYqvROwnDRIyKeTH4iar+gVhb19VtBpGQj6PEUImHf2cUp0DwFASH
 53Y8GWSHv6GPQyVRCM8/uPoM2p29rn+qhukELR+zxeYHgvBc7/P8ewXiJChjr2PmDGi3
 GuaZTrskRehjRw5a0umfoO+pFsRHCT7c5OR853jNbeDX4Vyuxmbzx9rDe5qFjQwHZZYH
 dZHtsnm7MRtT+ET7yE83dMtODr49TM7f51LU4/zT1k5UDYxdZXWqJoI1MGyfF9ZJwISW
 k71Q==
X-Gm-Message-State: APjAAAX4Vte9s6ps/eNM9o6L3FHDRAypRphaFejULxfnlonvimV3gsNU
 g3rkC/Qi/aLiz/TtPsnRTto=
X-Google-Smtp-Source: APXvYqxvItN9OnqheTvov4hpS8eX99Ly+f08T42CJNk7Az9Z5y+C87MbZqWmuka9RwkjJGMYYz+pvw==
X-Received: by 2002:a17:902:6802:: with SMTP id
 h2mr14901704plk.135.1573286068169; 
 Fri, 08 Nov 2019 23:54:28 -0800 (PST)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.gmail.com with ESMTPSA id y1sm9578671pfq.138.2019.11.08.23.54.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2019 23:54:27 -0800 (PST)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH] drm/virtgpu: fix double unregistration
Date: Sat,  9 Nov 2019 15:54:17 +0800
Message-Id: <20191109075417.29808-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 11 Nov 2019 02:29:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=veiAcMlIgcLHjJxd0QNhUHza9s431ffRaEJpWcEHXlA=;
 b=ZrcVhD0E25ufPrmCCfZ8MdFHm7QQe97Zw1uyYMICsTUBdeTTZku7sXrCkCp00Y8WTj
 ssQNLd0wY4j5kVeBQOlyt+J8HxJQUV2+ZycfVCAFWt7NyqBsvWB60WV5wR8rfkQ2VY2N
 0K8O05POwFRF8UJTOljz9j40NxSX5E+k/TK+lMU7/7BG+Vfszm9WfoA7Kd13lSB/6FiK
 lOOu0ERBepCRgVwSyr/vXyegHkDjSp5ve0mC23B5Ju5n21ilfXQILL7E5RNlxV5IHaoC
 y95+fHo5YQQJQAT9NgMuHZ3tNSjwcx/qcRUnusSjy3QvTQpKL3rs+v2rC60U/EZI5Ozg
 4njw==
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
Cc: David Airlie <airlied@linux.ie>, Chuhong Yuan <hslester96@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX3B1dF9kZXYgYWxzbyBjYWxscyBkcm1fZGV2X3VucmVnaXN0ZXIsIHNvIGRldiB3aWxsIGJl
IHVucmVnaXN0ZXJlZAp0d2ljZS4KUmVwbGFjZSBpdCB3aXRoIGRybV9kZXZfcHV0IHRvIGZpeCBp
dC4KClNpZ25lZC1vZmYtYnk6IENodWhvbmcgWXVhbiA8aHNsZXN0ZXI5NkBnbWFpbC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92
aXJ0Z3B1X2Rydi5jCmluZGV4IDBmYzMyZmEwYjNjMC4uZmNjYzI0ZTIxYWY4IDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3ZpcnRpby92aXJ0Z3B1X2Rydi5jCkBAIC0xMzgsNyArMTM4LDcgQEAgc3RhdGljIHZvaWQg
dmlydGlvX2dwdV9yZW1vdmUoc3RydWN0IHZpcnRpb19kZXZpY2UgKnZkZXYpCiAKIAlkcm1fZGV2
X3VucmVnaXN0ZXIoZGV2KTsKIAl2aXJ0aW9fZ3B1X2RlaW5pdChkZXYpOwotCWRybV9wdXRfZGV2
KGRldik7CisJZHJtX2Rldl9wdXQoZGV2KTsKIH0KIAogc3RhdGljIHZvaWQgdmlydGlvX2dwdV9j
b25maWdfY2hhbmdlZChzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRldikKLS0gCjIuMjMuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
