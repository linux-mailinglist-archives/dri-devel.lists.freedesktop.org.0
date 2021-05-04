Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F381D372AF8
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAAFF6EADA;
	Tue,  4 May 2021 13:27:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71E46EAD8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:27:35 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id y7so13137014ejj.9
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 06:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WUcVEis7oDZVB8B/Vgbzd7sRE0ZSWXdYuxqzatXSEm0=;
 b=PPcqN2EY3uLAib3npEIbqmcrXKxUGnQ7fev/0GlX6Cxrlw6mdMu8swAU3DNsQAemUK
 xaacoblDZuzq2M1ZV9CGPcg4vlEKe8vWKe+dMd8X3i1BC7hpq8KqRkWa9/fgQhk/VYxN
 A6Ugqk2AQsTmBpRaaF/tQjIYFP3HisMiNZvg8ag0sZJcbajQOBzMQuafMgFw01l/6rly
 U/lj8upOGTQPghu5nRoPJX+u4+IS4Gj6aqfP5UMx/O8LOetkMKli7dz5r4W1iGBZvJZn
 a3h1r6WfQbQZF0z+TPIACjskgZzTG+j+5tN925dUEAOrOM1C9PwWQb8h0pGzgzS/+CHa
 Najw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUcVEis7oDZVB8B/Vgbzd7sRE0ZSWXdYuxqzatXSEm0=;
 b=lCpnfl/Ouh68CiBImDKrOdOF+IS7HNXlmYKGj/1d8KtJ+zKOx9VdlaYxWw5UX+pi57
 e3SQ0ltSQVQCHOQp21RIGkX5B2CUVcpAQ/iddqrPINU1S8YWCIYeBB3ccqaMJfP7+rdj
 XXzaVXBS6f0A5JMFhlwjaD+3fem1fuAo1hsWMMKmd3eNiK356WR8ypa0QhtJ3j5WuXSt
 2h2yH0AKCO1KqZzJ0UdM6rMgzcsCUeb7BI+Aml+sbtIEDmpaba+8T+mIRfFC9VXrt1B7
 yD3hN5ni2FpUpl4VsA87Bd/+awXpJgLOiURF480fJu3xte9WH7oNh/OYTUZ3HF9O77Gn
 j7Zg==
X-Gm-Message-State: AOAM532KoT94JR3QcFS+9h/i2XrhX9OI3Teb1QuNG15rG+3I3zhVC6xG
 avEG8DrVU7iPhiJZItwr/xnxYS2la1w=
X-Google-Smtp-Source: ABdhPJzqTL82/5SokWUULmWQkPIiV8oDDJymcOLYBuRc4fXPdLY9wNA4yFCWtmxG0EzFIF/cyeudew==
X-Received: by 2002:a17:906:685:: with SMTP id
 u5mr22072878ejb.449.1620134854627; 
 Tue, 04 May 2021 06:27:34 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4a5c:1943:c73d:c4c9])
 by smtp.gmail.com with ESMTPSA id q18sm3114036edd.3.2021.05.04.06.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:27:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/12] drm/gem: dd DMA-buf user fence support for the atomic
 helper
Date: Tue,  4 May 2021 15:27:21 +0200
Message-Id: <20210504132729.2046-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504132729.2046-1-christian.koenig@amd.com>
References: <20210504132729.2046-1-christian.koenig@amd.com>
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

SnVzdCBhZGQgdGhlIGNhbGwgYmVmb3JlIHRha2luZyBsb2Nrcy4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2dlbV9hdG9taWNfaGVscGVyLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9hdG9t
aWNfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9hdG9taWNfaGVscGVyLmMKaW5k
ZXggYTAwNWM1YTBiYTQ2Li5mZTBkMTg0ODY2NDMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtX2F0b21pY19oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9h
dG9taWNfaGVscGVyLmMKQEAgLTE0MiwxMSArMTQyLDE1IEBAIGludCBkcm1fZ2VtX3BsYW5lX2hl
bHBlcl9wcmVwYXJlX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLCBzdHJ1Y3QgZHJtX3BsYW5l
X3N0CiB7CiAJc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmo7CiAJc3RydWN0IGRtYV9mZW5jZSAq
ZmVuY2U7CisJaW50IHJldDsKIAogCWlmICghc3RhdGUtPmZiKQogCQlyZXR1cm4gMDsKIAogCW9i
aiA9IGRybV9nZW1fZmJfZ2V0X29iaihzdGF0ZS0+ZmIsIDApOworCXJldCA9IGRtYV9yZXN2X3N5
bmNfdXNlcl9mZW5jZShvYmotPnJlc3YpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CiAJZmVu
Y2UgPSBkbWFfcmVzdl9nZXRfZXhjbF9yY3Uob2JqLT5yZXN2KTsKIAlkcm1fYXRvbWljX3NldF9m
ZW5jZV9mb3JfcGxhbmUoc3RhdGUsIGZlbmNlKTsKIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
