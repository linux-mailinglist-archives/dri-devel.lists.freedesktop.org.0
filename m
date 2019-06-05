Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BB8364E7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 21:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBAF89722;
	Wed,  5 Jun 2019 19:46:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F8D89718
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 19:46:04 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id m10so7399198edv.6
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 12:46:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=noy1sq32ZRx0pAV3/YkawbBtMmDX0p6/ParQtLpWWAg=;
 b=ETbzwXsOiPbUBt6viYC6Uv6DWJ/nhNO4Vk5VcRbv/4f4Em8F4U94XqBtr5PCctXJXt
 XoYHvGGNH0VcVvDr+7rGYyKhgDSyt8ZbRM05dMY1yzBYtPOP1QO2ySPAyqzU60nkArew
 DHAj76XvuuUBEtNFO54Q7UBsWDDFnaAuO0tCuM3IbqwyHAfTm6lgFj3K+71qvmsMGd0w
 LRdmQJmDE/b6HIxARprKnyO1ktH6ozmD1uOlFwVUKf1z4AZLV7kDdUiSIAzxNsHNUk6u
 ZpqoUXmVCbX9tmbsDDZCbAdjfUsoNOpYRXhzZssBC4hAmVIzEl0WLrvgiNrae0NX7OKi
 7xQg==
X-Gm-Message-State: APjAAAXg3Z2/fO1KbpygJPe3aVpXY1IuTgqY36vbtPhIh+2cObz/tm3p
 SlT18Ghif6dbUjYY5eYpUDnmQkvFBtM=
X-Google-Smtp-Source: APXvYqz2Hwpn/bWAjhV+WowFc/+3J1vx01omxIXqT90LWtoEn1PmwTm0PSyiWR5MzupSf1Z51eVhmQ==
X-Received: by 2002:a17:906:4e0f:: with SMTP id
 z15mr6577912eju.101.1559763962824; 
 Wed, 05 Jun 2019 12:46:02 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y5sm128449edo.77.2019.06.05.12.46.01
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 05 Jun 2019 12:46:02 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/crc-debugfs: User irqsafe spinlock in
 drm_crtc_add_crc_entry
Date: Wed,  5 Jun 2019 21:45:56 +0200
Message-Id: <20190605194556.16744-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=noy1sq32ZRx0pAV3/YkawbBtMmDX0p6/ParQtLpWWAg=;
 b=WoUJt1DBJTAijf+Ebqm15YfZBJu8TsbQPYSxUwdnSVgtxPsduZxJcmmp6Y7/Pu9kQv
 BZQN7w+7Cw/zPxq9a5ooJ11g41vj6+UljqUxBkRd5pK86pcYMmrPrVwPL5MPBvyucOQu
 auHV8akNrMuq4yKMTNdrE2xCLzCVpEZXL2tqQ=
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
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2UgY2FuIGJlIGNhbGxlZCBmcm9tIGFueSBjb250ZXh0LCB3ZSBuZWVkIHRvIGJlIHByZXBhcmVk
LgoKTm90aWNlZCB0aGlzIHdoaWxlIGhhY2tpbmcgb24gdmttcywgd2hpY2ggY2FsbHMgdGhpcyBm
dW5jdGlvbiBmcm9tIGEKbm9ybWFsIHdvcmtlci4gV2hpY2ggcmVhbGx5IHVwc2V0cyBsb2NrZGVw
LgoKQ2M6IFJvZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29tPgpD
YzogVG9tZXUgVml6b3NvIDx0b21ldS52aXpvc29AY29sbGFib3JhLmNvbT4KQ2M6IEVtaWwgVmVs
aWtvdiA8ZW1pbC52ZWxpa292QGNvbGxhYm9yYS5jb20+CkNjOiBCZW5qYW1pbiBHYWlnbmFyZCA8
YmVuamFtaW4uZ2FpZ25hcmRAbGluYXJvLm9yZz4KU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRl
ciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kZWJ1
Z2ZzX2NyYy5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3Jj
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKaW5kZXggNTg1MTY5ZjBkY2M1
Li43ZjM1YjViYTE5MjQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmc19j
cmMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnNfY3JjLmMKQEAgLTM5Niw4ICsz
OTYsOSBAQCBpbnQgZHJtX2NydGNfYWRkX2NyY19lbnRyeShzdHJ1Y3QgZHJtX2NydGMgKmNydGMs
IGJvb2wgaGFzX2ZyYW1lLAogCXN0cnVjdCBkcm1fY3J0Y19jcmMgKmNyYyA9ICZjcnRjLT5jcmM7
CiAJc3RydWN0IGRybV9jcnRjX2NyY19lbnRyeSAqZW50cnk7CiAJaW50IGhlYWQsIHRhaWw7CisJ
dW5zaWduZWQgbG9uZyBmbGFnczsKIAotCXNwaW5fbG9jaygmY3JjLT5sb2NrKTsKKwlzcGluX2xv
Y2tfaXJxc2F2ZSgmY3JjLT5sb2NrLCBmbGFncyk7CiAKIAkvKiBDYWxsZXIgbWF5IG5vdCBoYXZl
IG5vdGljZWQgeWV0IHRoYXQgdXNlcnNwYWNlIGhhcyBzdG9wcGVkIHJlYWRpbmcgKi8KIAlpZiAo
IWNyYy0+ZW50cmllcykgewpAQCAtNDI4LDcgKzQyOSw3IEBAIGludCBkcm1fY3J0Y19hZGRfY3Jj
X2VudHJ5KHN0cnVjdCBkcm1fY3J0YyAqY3J0YywgYm9vbCBoYXNfZnJhbWUsCiAJaGVhZCA9ICho
ZWFkICsgMSkgJiAoRFJNX0NSQ19FTlRSSUVTX05SIC0gMSk7CiAJY3JjLT5oZWFkID0gaGVhZDsK
IAotCXNwaW5fdW5sb2NrKCZjcmMtPmxvY2spOworCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmNy
Yy0+bG9jaywgZmxhZ3MpOwogCiAJd2FrZV91cF9pbnRlcnJ1cHRpYmxlKCZjcmMtPndxKTsKIAot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
