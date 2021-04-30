Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D7636F7D9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 11:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653296F508;
	Fri, 30 Apr 2021 09:25:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E076F50C
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 09:25:15 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id y26so2195912eds.4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 02:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r6aEW97fOMPUkgP+EB/ycjpi8gPt+rTAkpJNrZPAF7I=;
 b=s4PUX8Nll2ZO40VRQ4c9ltnAxPeU1kqsV2MnIGorBQhkGXx2Jh5RBU0sdzThb9At+r
 /DzucuBuajjiP+KMKGD+4/Wpa9p8aEV+CmYfJlzksmvSz3tISnkMv0a8FoVlEHreJbgZ
 4h8+OisglrHEgcNX7nY+ie3D8C9GAKoq4Gbf9o0v2qryHC9G/Jkeg7ubXwa7lbjI5POl
 +d6bER1Nnl3xvNAumOIsnz2MPSO7QsgVtUMXsk/ENFN+d6ELKhEM7aDX0/7x4wdaRSvA
 J94KFeHmeMTos1oYDjt+J7pV+iS+dX2W4vvZh0Z+8OzWF7dky//3LNuFizZecAaFFg86
 NLNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r6aEW97fOMPUkgP+EB/ycjpi8gPt+rTAkpJNrZPAF7I=;
 b=cMhBCRPzP1w7mWD0HKkKoWSX7xVD5dLRJCAcfAcVlb/j8dqOkZuJw1VNsR8GUoPKJN
 38Qpz5erYWJ3u6G1kC8aECrhFQ1lv7JIbvDgSC6kSuvyD2JwTCj77rNmUW/cNoeSKynl
 mq0AOM0a4mugknEHLeS9qhLRnTb/A9A5V5n2Pl5r7lXh3wXqDxNg/pNXx9h2SZINOMIF
 2ALMNzCM3bAIxjb+rjdpdyqlLzVqu4k+DUPWsmJIDO63GpQ0C1HJreMT58x5pww3wQPy
 izRNW5l6ueQ8s+jIgV+cehuPtt4+BObAhCorwVWMUQ8RgYeY71LJRY2Wo/+CaxpwTVzm
 SFqg==
X-Gm-Message-State: AOAM53154ADy+gXJopqoIQnwlAm/0KkmByuqiO7hpNLL7BaZpjMN2jMC
 a15cA17aPeJAt0nLWDkwr2dpyTWq8Qc=
X-Google-Smtp-Source: ABdhPJyqetnaiLB/gS0Avv1WDrUI1n+tRnU0dqt6CIOqrDWG1Dud2veJkNB4wqAwKhMugWHczT5UWg==
X-Received: by 2002:a05:6402:10c9:: with SMTP id
 p9mr4733175edu.268.1619774714472; 
 Fri, 30 Apr 2021 02:25:14 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d08c:9633:b7a2:37e2])
 by smtp.gmail.com with ESMTPSA id h23sm1550959ejx.90.2021.04.30.02.25.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 02:25:14 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/13] drm/ttm: flip over the sys manager to self allocated
 nodes
Date: Fri, 30 Apr 2021 11:25:02 +0200
Message-Id: <20210430092508.60710-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210430092508.60710-1-christian.koenig@amd.com>
References: <20210430092508.60710-1-christian.koenig@amd.com>
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
Cc: daniel.vetter@ffwll.ch, matthew.william.auld@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TWFrZSBzdXJlIHRvIGFsbG9jYXRlIGEgcmVzb3VyY2Ugb2JqZWN0IGhlcmUuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fc3lzX21hbmFnZXIuYyB8IDcgKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX3N5c19tYW5hZ2VyLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9zeXNfbWFuYWdlci5j
CmluZGV4IGVkOTI2MTUyMTRlMy4uYTkyNjExNGVkZmU1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9zeXNfbWFuYWdlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X3N5c19tYW5hZ2VyLmMKQEAgLTMsMTggKzMsMjUgQEAKICNpbmNsdWRlIDxkcm0vdHRtL3R0bV9y
ZXNvdXJjZS5oPgogI2luY2x1ZGUgPGRybS90dG0vdHRtX2RldmljZS5oPgogI2luY2x1ZGUgPGRy
bS90dG0vdHRtX3BsYWNlbWVudC5oPgorI2luY2x1ZGUgPGxpbnV4L3NsYWIuaD4KIAogc3RhdGlj
IGludCB0dG1fc3lzX21hbl9hbGxvYyhzdHJ1Y3QgdHRtX3Jlc291cmNlX21hbmFnZXIgKm1hbiwK
IAkJCSAgICAgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJCSAgICAgY29uc3Qgc3Ry
dWN0IHR0bV9wbGFjZSAqcGxhY2UsCiAJCQkgICAgIHN0cnVjdCB0dG1fcmVzb3VyY2UgKm1lbSkK
IHsKKwltZW0tPm1tX25vZGUgPSBremFsbG9jKHNpemVvZigqbWVtKSwgR0ZQX0tFUk5FTCk7CisJ
aWYgKCFtZW0tPm1tX25vZGUpCisJCXJldHVybiAtRU5PTUVNOworCisJdHRtX3Jlc291cmNlX2lu
aXQoYm8sIHBsYWNlLCBtZW0tPm1tX25vZGUpOwogCXJldHVybiAwOwogfQogCiBzdGF0aWMgdm9p
ZCB0dG1fc3lzX21hbl9mcmVlKHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLAogCQkJ
ICAgICBzdHJ1Y3QgdHRtX3Jlc291cmNlICptZW0pCiB7CisJa2ZyZWUobWVtLT5tbV9ub2RlKTsK
IH0KIAogc3RhdGljIGNvbnN0IHN0cnVjdCB0dG1fcmVzb3VyY2VfbWFuYWdlcl9mdW5jIHR0bV9z
eXNfbWFuYWdlcl9mdW5jID0gewotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
