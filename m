Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61E43F7739
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 15:58:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7290D6E923;
	Mon, 11 Nov 2019 14:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA23A6E91F;
 Mon, 11 Nov 2019 14:58:37 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id s5so3888628wrw.2;
 Mon, 11 Nov 2019 06:58:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=umxr/o7YkJzRl4KSzSKpUJC0S2lJKtpLSvVTgJK/5Eg=;
 b=WYYpHpopmPk/kq8TqP30j22GOUTcCu6itnyzXlOgRifg6HLnObCpBtC2LlebdUJXEh
 PVsVFWA2eBUYS+CpDiDF6wHkg027thnn29KhgzwJXSlJNTz+3/lV4SaT9AOlmfEll+ul
 O01xeMGmplMwcPkZ/d23LIp6tE9qXocSdm518yxaSiM+RLliUVYMeQ2qPxLmg5tCTme5
 k/RKYhPnwHkSQX4zA4U1abXWGT34c6eHmQ/eM6MYhzFUG8Btbjloycif12a1bSXX8miC
 4YXANZEGM/eEJZPfuNOFLg/q2oFVtdZ7XNE8FhEsDQN1qEvyvhDhdBOe3BPnTb+4JC9N
 PfTw==
X-Gm-Message-State: APjAAAWYOC9N3ujBy72Z6htfMmYt2ufzZEn4plHGZRzS1ETRIjnavxD1
 QoFNRN0r7MCBMga5qWkuqxQ=
X-Google-Smtp-Source: APXvYqz9A3tlK61dycPB1m6PcZsxBe51ilvZe1jfpiBiE1QcTblcam9xcnEWkzERPkj5WfugWyphXg==
X-Received: by 2002:adf:f005:: with SMTP id j5mr5437600wro.295.1573484316479; 
 Mon, 11 Nov 2019 06:58:36 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:5d5a:1834:5ed:1958])
 by smtp.gmail.com with ESMTPSA id t185sm22967069wmf.45.2019.11.11.06.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Nov 2019 06:58:36 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Kevin1.Wang@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/ttm: replace dma_resv object on deleted BOs
Date: Mon, 11 Nov 2019 15:58:32 +0100
Message-Id: <20191111145832.37320-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191111145832.37320-1-christian.koenig@amd.com>
References: <20191111145832.37320-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=umxr/o7YkJzRl4KSzSKpUJC0S2lJKtpLSvVTgJK/5Eg=;
 b=S6cTcgcI0KlsXyH88OcgCyQCBG3bN5abgL68xI2O07SuuvdTRuSn1fWds2fMpCUQaV
 wnB9AaGzJ2xYDk6O55eUj9Jj9RpANftxi/kjLDijM3AbXH9T+uwzgl7SNNqJIYnfiP9G
 bSOMTdbEG+eWW23I7eX1/xnP0lvmZxCdtf52I6BLjAIvXsOuAU9mNsLTu2UJ2Cg2ccii
 0TrEesxgJAxjnPuDZ5Zx+VwRAWGsF79SVk+96Z+UKg8gLSycK0fsTqMuofE8tyM/iHlu
 PFPftah+evR8MnuVYtmvGW699ZeynWFjUMyhRKv3oQWHGhZpcKLNjXXHUwy29KxIY/8H
 Y1yQ==
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

V2hlbiBub24taW1wb3J0ZWQgQk9zIGFyZSByZXN1cnJlY3RlZCBmb3IgZGVsYXllZCBkZWxldGUg
d2UgcmVwbGFjZQp0aGUgZG1hX3Jlc3Ygb2JqZWN0IHRvIGFsbG93IGZvciBlYXN5IHJlY2xhaW1p
bmcgb2YgdGhlIHJlc291cmNlcy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
IHwgNCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX2JvLmMKaW5kZXggNTcwYjBlMTA4OWI3Li41NTA1NzRmZjQ5MGYgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fYm8uYwpAQCAtNTk5LDYgKzU5OSw4IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19yZWxl
YXNlKHN0cnVjdCBrcmVmICprcmVmKQogCQl9CiAKIAkJc3Bpbl9sb2NrKCZ0dG1fYm9fZ2xvYi5s
cnVfbG9jayk7CisJCWlmIChiby0+dHlwZSAhPSB0dG1fYm9fdHlwZV9zZykKKwkJCWJvLT5iYXNl
LnJlc3YgPSAmYm8tPmJhc2UuX3Jlc3Y7CiAJCWtyZWZfaW5pdCgmYm8tPmtyZWYpOwogCQlsaXN0
X2FkZF90YWlsKCZiby0+ZGRlc3Ryb3ksICZiZGV2LT5kZGVzdHJveSk7CiAJCXNwaW5fdW5sb2Nr
KCZ0dG1fYm9fZ2xvYi5scnVfbG9jayk7CkBAIC03MjUsNyArNzI3LDcgQEAgc3RhdGljIGJvb2wg
dHRtX2JvX2V2aWN0X3N3YXBvdXRfYWxsb3dhYmxlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8sCiAKIAlpZiAoYm8tPmJhc2UucmVzdiA9PSBjdHgtPnJlc3YpIHsKIAkJZG1hX3Jlc3ZfYXNz
ZXJ0X2hlbGQoYm8tPmJhc2UucmVzdik7Ci0JCWlmIChjdHgtPmZsYWdzICYgVFRNX09QVF9GTEFH
X0FMTE9XX1JFU19FVklDVCB8fCBiby0+ZGVsZXRlZCkKKwkJaWYgKGN0eC0+ZmxhZ3MgJiBUVE1f
T1BUX0ZMQUdfQUxMT1dfUkVTX0VWSUNUKQogCQkJcmV0ID0gdHJ1ZTsKIAkJKmxvY2tlZCA9IGZh
bHNlOwogCQlpZiAoYnVzeSkKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
