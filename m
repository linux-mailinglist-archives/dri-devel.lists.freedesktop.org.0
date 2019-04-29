Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF79EC78
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 00:08:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4768934F;
	Mon, 29 Apr 2019 22:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81278892E4
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 22:08:29 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id b3so5727848plr.7
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Apr 2019 15:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DSXLhD7wHCaSgLKFWGmhSkyMj1YNvbI1NjkgvBf+Kws=;
 b=WT6H5IJqK7HrDEeb83NjHhArmxqDjJVoALSubzRqLTqyLzPlWNzN5+X3i73Kfa6zBQ
 pVG3uW7uNr772j1WrOroztVKWTEJ4v0pdtnVJ8PL19dc5OmelOUTxidytN25b2MpX0vj
 6HWRJfYse3mfzqqXte0veoKwrcodKUiAqgyvZ9xNPxBkkHgh7MMXORYIZ1BVsr0az4yX
 G4/9SkmDiB11M75QRcvlBP6rrWyAqXILV9OuN//n7St6sKic/PAHc57LmYWwmFiun4RR
 XxxXAFQnCFKTmM/nLmsOKk+FyI7+Uza6NR8O7tinURKHwtxEUhRCBDm//Ekzd9NHU0+v
 n9dQ==
X-Gm-Message-State: APjAAAWmYSWPuTgc/3VKTnv+5CgUS8W6kXKatLAAFAcbAOeeNqCQ0n9a
 /fPgOFMH37GpHAY6WgijPApfu5gp
X-Google-Smtp-Source: APXvYqyy0lG7vVgK77wDJ8wX1L9TblWrlFg5ViAqpVt78Ksd3Y8r5fRZraYxR8/CUn4f5iJsq4AXwQ==
X-Received: by 2002:a17:902:2cc1:: with SMTP id
 n59mr1834391plb.22.1556575708781; 
 Mon, 29 Apr 2019 15:08:28 -0700 (PDT)
Received: from olv0.mtv.corp.google.com
 ([2620:15c:202:201:9649:82d6:f889:b307])
 by smtp.gmail.com with ESMTPSA id g3sm14828635pfm.167.2019.04.29.15.08.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 29 Apr 2019 15:08:28 -0700 (PDT)
From: Chia-I Wu <olvaffe@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/virtio: trace drm_fence_emit
Date: Mon, 29 Apr 2019 15:08:24 -0700
Message-Id: <20190429220825.156644-2-olvaffe@gmail.com>
X-Mailer: git-send-email 2.21.0.593.g511ec345e18-goog
In-Reply-To: <20190429220825.156644-1-olvaffe@gmail.com>
References: <20190429220825.156644-1-olvaffe@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=DSXLhD7wHCaSgLKFWGmhSkyMj1YNvbI1NjkgvBf+Kws=;
 b=KjKueBg4FXrmLVN1N9isYalx6Up4cfpJx2Hgj6YyqLlwSk/w7J3DmFW64HSk88ueuS
 LRPJl1E3BP+D0MLJV0m6eCzVEp1Y1j5lUNCCXKy2Z4XzgFWLfXUe0Vcg6RElKyrW/AxU
 Y9o+pyc5u8/c3bZoCgabMVWvgiikDnvTTPe79QPlr+6Hfnf5kAVgcjHa4Z8LZ0v2JYSo
 LjS+Wo1/pepADGo9jaVTBd7WWbGJujO5jaysCkcL2XkwAJAmfQGjcLQ4rQiaa5Li9nce
 Tuv4ts/nJniA2jKquNTnt8DqKNKUGpkYikCYl/wgRbcGbITR5ftpbeYN+M+HdFifD/Aq
 Jb4g==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rm9yIG1vc3QgZHJpdmVycywgZHJtX2ZlbmNlX2luaXQgaXMgZm9sbG93ZWQgYnkgZHJtX2ZlbmNl
X2VtaXQKaW1tZWRpYXRlbHkuICBCdXQgZm9yIG91ciBkcml2ZXIsIHRoZXkgYXJlIGRvbmUgc2Vw
YXJhdGVseS4gIFdlIGFsc28KZG9uJ3Qga25vdyB0aGUgZmVuY2Ugc2Vxbm8gdW50aWwgZHJtX2Zl
bmNlX2VtaXQuCgpTaWduZWQtb2ZmLWJ5OiBDaGlhLUkgV3UgPG9sdmFmZmVAZ21haWwuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9mZW5jZS5jIHwgMyArKysKIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfZmVuY2UuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9m
ZW5jZS5jCmluZGV4IDcyYjRmNzU2MTQzMi4uZTIyOTE4Y2E2MjFiIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfZmVuY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfZmVuY2UuYwpAQCAtMjQsNiArMjQsNyBAQAogICovCiAKICNpbmNsdWRl
IDxkcm0vZHJtUC5oPgorI2luY2x1ZGUgPHRyYWNlL2V2ZW50cy9kbWFfZmVuY2UuaD4KICNpbmNs
dWRlICJ2aXJ0Z3B1X2Rydi5oIgogCiBzdGF0aWMgY29uc3QgY2hhciAqdmlydGlvX2dldF9kcml2
ZXJfbmFtZShzdHJ1Y3QgZG1hX2ZlbmNlICpmKQpAQCAtOTcsNiArOTgsOCBAQCBpbnQgdmlydGlv
X2dwdV9mZW5jZV9lbWl0KHN0cnVjdCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsCiAJbGlzdF9h
ZGRfdGFpbCgmZmVuY2UtPm5vZGUsICZkcnYtPmZlbmNlcyk7CiAJc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmZHJ2LT5sb2NrLCBpcnFfZmxhZ3MpOwogCisJdHJhY2VfZG1hX2ZlbmNlX2VtaXQoJmZl
bmNlLT5mKTsKKwogCWNtZF9oZHItPmZsYWdzIHw9IGNwdV90b19sZTMyKFZJUlRJT19HUFVfRkxB
R19GRU5DRSk7CiAJY21kX2hkci0+ZmVuY2VfaWQgPSBjcHVfdG9fbGU2NChmZW5jZS0+Zi5zZXFu
byk7CiAJcmV0dXJuIDA7Ci0tIAoyLjIxLjAuNTkzLmc1MTFlYzM0NWUxOC1nb29nCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
