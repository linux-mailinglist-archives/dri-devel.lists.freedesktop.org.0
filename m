Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA1C16AD0D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 18:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A6A89C5E;
	Tue, 16 Jul 2019 16:44:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECDC989C5E
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 16:44:35 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id c2so10375020plz.13
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 09:44:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rb6z0J3PnQNVPmOTs37Tflmgb6ZXxYF+gFUGTKgihdQ=;
 b=QPzjXmHDMRA2zBGivg5J0uL+bUDcX8c+RowaOsbrB7h0MNBKMij0NYhitLCjXW4NxZ
 HZj8cTM42G1VLbEg+P5dkf8Uw4xRW6XzoIJUJXn2oVTnIYyhHqPaRXfNS3OnRr9CMZTp
 kinehyDGNl4r6GRq8BTspyV1PUjVDko+gqHazWfo6jIk4Mlgog1QQnmLDeOLHCllzYnM
 ry48jLgsgqbkUQpmMoGBabANrmVySCMra2RLO4ujzCBl+JpRS4caKKS/mQsvWuPpS7dm
 gXHu4lKrk3x+j2laVvnQSOsRCCSGUNt9TpN2udh8LncLfB2Mj7b70Zv77CFqviBpmPsa
 PrQA==
X-Gm-Message-State: APjAAAUHcKMllS+VeEcH5DHu/iUIOOnI2rSGPUaNV8op7LMoSdNeyksu
 71LS00rFDODE+uQw9RBoYgR3vYYowGc=
X-Google-Smtp-Source: APXvYqxTAsYzSCitipMj3Cnq0cvgAncM8UVtX6Ejrg+BX45WfDVl8GCsx0zL734z9ppZ7Wol6eewNA==
X-Received: by 2002:a17:902:2865:: with SMTP id
 e92mr36404429plb.264.1563295475103; 
 Tue, 16 Jul 2019 09:44:35 -0700 (PDT)
Received: from localhost ([100.118.89.203])
 by smtp.gmail.com with ESMTPSA id s66sm22096485pfs.8.2019.07.16.09.44.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 16 Jul 2019 09:44:34 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/gem: don't force writecombine mmap'ing
Date: Tue, 16 Jul 2019 09:42:14 -0700
Message-Id: <20190716164221.15436-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rb6z0J3PnQNVPmOTs37Tflmgb6ZXxYF+gFUGTKgihdQ=;
 b=KIfFA/lE08lYJlpZaOeKEpNHMdJmBcI/Rdit44CXjk9OkyMhhGLdG5UBq8epzlm8bj
 ptjHK+IPA2iaF0Hr1jGnU6aMHQtkoZ1q15W6sTsheinHenMfRYr2W9LO5EoBUeVSd7pj
 0Ug7z9PwL9TZQRvfXf2okOT4CBOvHsjgRKlV9byJ6PUBqKj/D4p2jkpmPquO2U1jh/IF
 cxU9LZQ0pPRF7COOUriw86shNoalNtUJDqa0VICFYSF59B4XuaHdn2f24Dy9OjlUfV+L
 byEfj4ULxRNvtLBtRz4r5VsPWHMV21S0nzNajZ+/kRX1pwECo3ZmIKfRpf6723slxf3F
 f8LQ==
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
Cc: Rob Clark <robdclark@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, linux-kernel@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKVGhlIGRyaXZlciBzaG91
bGQgYmUgaW4gY29udHJvbCBvZiB0aGlzLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2Jk
Y2xhcmtAY2hyb21pdW0ub3JnPgotLS0KSXQgaXMgcG9zc2libGUgdGhhdCB0aGlzIHdhcyBtYXNr
aW5nIGJ1Z3MgKGllLiBub3Qgc2V0dGluZyBhcHByb3ByaWF0ZQpwZ3Byb3QpIGluIGRyaXZlcnMu
ICBJIGRvbid0IGhhdmUgYSBwYXJ0aWN1bGFybHkgZ29vZCBpZGVhIGZvciB0cmFja2luZwp0aG9z
ZSBkb3duIChzaW5jZSBJIGRvbid0IGhhdmUgdGhlIGh3IGZvciBtb3N0IGRyaXZlcnMpLiAgVW5s
ZXNzIHNvbWVvbmUKaGFzIGEgYmV0dGVyIGlkZWEsIG1heWJlIGxhbmQgdGhpcyBhbmQgbGV0IGRy
aXZlciBtYWludGFpbmVycyBmaXggYW55CnBvdGVudGlhbCBmYWxsb3V0IGluIHRoZWlyIGRyaXZl
cnM/CgpUaGlzIGlzIG5lY2Vzc2FyeSBmb3IgdGhlIG5leHQgcGF0Y2ggdG8gZml4IFZHRU0gYnJv
a2VubmVzcyBvbiBhcm0uCgogZHJpdmVycy9ncHUvZHJtL2RybV9nZW0uYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbS5jCmluZGV4
IDhhNTVmNzEzMjViMS4uN2Q2MjQyY2M2OWYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtLmMKQEAgLTExMTAsNyArMTEx
MCw3IEBAIGludCBkcm1fZ2VtX21tYXBfb2JqKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqLCB1
bnNpZ25lZCBsb25nIG9ial9zaXplLAogCiAJdm1hLT52bV9mbGFncyB8PSBWTV9JTyB8IFZNX1BG
Tk1BUCB8IFZNX0RPTlRFWFBBTkQgfCBWTV9ET05URFVNUDsKIAl2bWEtPnZtX3ByaXZhdGVfZGF0
YSA9IG9iajsKLQl2bWEtPnZtX3BhZ2VfcHJvdCA9IHBncHJvdF93cml0ZWNvbWJpbmUodm1fZ2V0
X3BhZ2VfcHJvdCh2bWEtPnZtX2ZsYWdzKSk7CisJdm1hLT52bV9wYWdlX3Byb3QgPSB2bV9nZXRf
cGFnZV9wcm90KHZtYS0+dm1fZmxhZ3MpOwogCXZtYS0+dm1fcGFnZV9wcm90ID0gcGdwcm90X2Rl
Y3J5cHRlZCh2bWEtPnZtX3BhZ2VfcHJvdCk7CiAKIAkvKiBUYWtlIGEgcmVmIGZvciB0aGlzIG1h
cHBpbmcgb2YgdGhlIG9iamVjdCwgc28gdGhhdCB0aGUgZmF1bHQKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
