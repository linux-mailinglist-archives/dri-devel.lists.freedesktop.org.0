Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E452C40BB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 13:59:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCE4A6E99E;
	Wed, 25 Nov 2020 12:59:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2593888422
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 12:59:27 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id l5so2414499edq.11
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 04:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=I03ucLwtraS+/qtGvanDMZWlJBXseNP3pgM5QtvzBY0=;
 b=R7fl0kq368Ct4tD0lLkgpQJQ+JVoV2cUKF9y/GwoazxMdO3IRSQz5eVM3VuYHO6xji
 cyL3MRZez6OQc7MAP85G4yRft4Sy1RSTN3b1uECD+XX8gc9INUkeS7X497MEHeYaAr0k
 o0V5CsV7qv00iGQQb/Ryc/1gB+GitJBCAJrH9ju3v+aov26kFyr/7pH8fVcGf2JwqK2a
 8mK/t+B5LStQeCHo8bDx80Fp7Kv0MJwFnMupg3jfWrfUSMHoLdOFNzA4NIkunhffGef3
 ind/I92rdWlcs7RZpRvjFPJx9QSLGpdaT5St+va81TpYWIFfldaHIz4my6EudyzUWRkj
 pnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=I03ucLwtraS+/qtGvanDMZWlJBXseNP3pgM5QtvzBY0=;
 b=moD3XednsFShb4Cti9RyAhJ00FRhcuCZ868x+IQWMxwgXnMbeLh2bpMv1XUtdXzzMz
 ZmVNgYKC4hxFaebJ0xSI1PHatkx8415Ppy+yK9wYH1HfmqT/6I3NNv5GCS/G7WsOYbx/
 CGQDiRAlfg7lxurWg4CoS6ZAuqt3rFVKSRFvlj+02DP4N9ljjbgiCjjaHFnPO+J/zjM3
 61SE8ephYXWkiITWWoVrbXts3JMZRlbw8d2MtoohDywkmqoaP85ZWkvMJEBByUJAbHs/
 Eyr+AeHuj3QVxlmxL7Laz0dDpFzgg2VKTxz524qd22HAGca35mVzWKXGg1XPDeEU252F
 kAUw==
X-Gm-Message-State: AOAM531jU4wLy9YMBxehcIBz82A08VbhgRYjOy2L+IuWww13FWJowH3j
 YTk4YesIi1TzPP2LA8jl4Ap1rBZlNHo=
X-Google-Smtp-Source: ABdhPJzNs6h/YWTR73Nb2UWMhouRgYwu7fHoC4ATsiwP4fSDHlbaN4OSRo+BSGUblxsu645y35IWJw==
X-Received: by 2002:a05:6402:3098:: with SMTP id
 de24mr3306346edb.155.1606309165591; 
 Wed, 25 Nov 2020 04:59:25 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:87d9:eeff:99f6:84c2])
 by smtp.gmail.com with ESMTPSA id z19sm1203188ejj.101.2020.11.25.04.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 04:59:25 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/7] drm/ttm: nuke ttm_dma_tt_init
Date: Wed, 25 Nov 2020 13:59:18 +0100
Message-Id: <20201125125919.1372-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201125125919.1372-1-christian.koenig@amd.com>
References: <20201125125919.1372-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tm90IHVzZWQgYW55IG1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyB8
IDEzIC0tLS0tLS0tLS0tLS0KIGluY2x1ZGUvZHJtL3R0bS90dG1fdHQuaCAgICAgfCAgMiAtLQog
MiBmaWxlcyBjaGFuZ2VkLCAxNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV90dC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwppbmRleCBk
YTllZWZmZTBjNmQuLjc3YmE3ODQ0MjVkZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fdHQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV90dC5jCkBAIC0xNjIsMTkg
KzE2Miw2IEBAIHZvaWQgdHRtX3R0X2Zpbmkoc3RydWN0IHR0bV90dCAqdHRtKQogfQogRVhQT1JU
X1NZTUJPTCh0dG1fdHRfZmluaSk7CiAKLWludCB0dG1fZG1hX3R0X2luaXQoc3RydWN0IHR0bV90
dCAqdHRtLCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAotCQkgICAgdWludDMyX3QgcGFn
ZV9mbGFncywgZW51bSB0dG1fY2FjaGluZyBjYWNoaW5nKQotewotCXR0bV90dF9pbml0X2ZpZWxk
cyh0dG0sIGJvLCBwYWdlX2ZsYWdzLCBjYWNoaW5nKTsKLQotCWlmICh0dG1fZG1hX3R0X2FsbG9j
X3BhZ2VfZGlyZWN0b3J5KHR0bSkpIHsKLQkJcHJfZXJyKCJGYWlsZWQgYWxsb2NhdGluZyBwYWdl
IHRhYmxlXG4iKTsKLQkJcmV0dXJuIC1FTk9NRU07Ci0JfQotCXJldHVybiAwOwotfQotRVhQT1JU
X1NZTUJPTCh0dG1fZG1hX3R0X2luaXQpOwotCiBpbnQgdHRtX3NnX3R0X2luaXQoc3RydWN0IHR0
bV90dCAqdHRtLCBzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkgICB1aW50MzJfdCBw
YWdlX2ZsYWdzLCBlbnVtIHR0bV9jYWNoaW5nIGNhY2hpbmcpCiB7CmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS90dG0vdHRtX3R0LmggYi9pbmNsdWRlL2RybS90dG0vdHRtX3R0LmgKaW5kZXggZGEy
N2U5ZDhmYTY0Li42YzhlYjlhNGRlODEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1f
dHQuaAorKysgYi9pbmNsdWRlL2RybS90dG0vdHRtX3R0LmgKQEAgLTk5LDggKzk5LDYgQEAgaW50
IHR0bV90dF9jcmVhdGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgYm9vbCB6ZXJvX2Fs
bG9jKTsKICAqLwogaW50IHR0bV90dF9pbml0KHN0cnVjdCB0dG1fdHQgKnR0bSwgc3RydWN0IHR0
bV9idWZmZXJfb2JqZWN0ICpibywKIAkJdWludDMyX3QgcGFnZV9mbGFncywgZW51bSB0dG1fY2Fj
aGluZyBjYWNoaW5nKTsKLWludCB0dG1fZG1hX3R0X2luaXQoc3RydWN0IHR0bV90dCAqdHRtX2Rt
YSwgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKLQkJICAgIHVpbnQzMl90IHBhZ2VfZmxh
Z3MsIGVudW0gdHRtX2NhY2hpbmcgY2FjaGluZyk7CiBpbnQgdHRtX3NnX3R0X2luaXQoc3RydWN0
IHR0bV90dCAqdHRtX2RtYSwgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJICAgdWlu
dDMyX3QgcGFnZV9mbGFncywgZW51bSB0dG1fY2FjaGluZyBjYWNoaW5nKTsKIAotLSAKMi4yNS4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
