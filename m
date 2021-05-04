Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDA9372AF9
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35C6B6EADC;
	Tue,  4 May 2021 13:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B9C66EAD8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:27:37 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id i24so10402504edy.8
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 06:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tOgYSPyPOlKl0RTyqRKg4CGK0U8z64tQlkHCj/Bl6Hg=;
 b=b3QHsgsMuO4W5MK4OH1yxaOkerC1+6qUw0/uWXb4lTrKuH2rfm51ckKXuqZZwLFcNs
 GfFm5cdZmMfVRfwxvi/gIf0d1Mi+Z+t7tWQvjJZl9OEoJLebOsxhjOBoS9RgapOwFkdD
 zpJSStyuFU3dNIl4H1T+WY/aQ6kDEzbxVFTtB5NxwZdfCZliZN0ndqCSf8hHl3kosNyC
 phtTppxEhypL9iZzsPOqfQv/FboLMFljrXMjng8G2H/oXbtn/hBGKtoAMXp8dHPA0A1K
 26p9dwlWSk4oQFLSgMcYgTENAf31+n/G1rzu4rVZyr0nBD3IYmyvuUMrP3GgX4UVvQZM
 Dgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tOgYSPyPOlKl0RTyqRKg4CGK0U8z64tQlkHCj/Bl6Hg=;
 b=Jg8NJNEfv0Kc/cGFzkgXTMovNIE+ln/rgJTWMkOcNfVw88VRaAzYkydDgbBQzWQ4J6
 DITPL1hb37Cfc2hCpfZgAYjaRUhlg4c0TgoEMDqQNgox3ARtVSy47hgHXV72ljX4Tgda
 Jg6zvghMcDkThrxZLHpcLbBM0aEl8OGozgvXd+Q5K3DcCUGsq0x0A4WNlc88fgU8HUdE
 /vQiOEpfO2u/no/LY4mDyH2TLCl75oRDiwf1L+ldICcTy2NBUrLEZhjVftY++1Zx8oDx
 gUJISN8beVmF8xXUB6b8k6P9i3RZrBm8nNWB7aqHkjNTytR06JR+P+iPzB5iKkqRwTMG
 3gSg==
X-Gm-Message-State: AOAM5313dlbZeD397Ev5BelUF4KbwDxe2CMmQMaJyfFihyLYkjt83Xo2
 ueQJZteIvqP7753ZIgIvFJTTsJk2fsQ=
X-Google-Smtp-Source: ABdhPJw1Ykk1mNo23umXsdtYbBADHX2NdxSCrn1dCkrEg1fhWlV6AkfLsSbMwYlUSERQspeeqyU8Fw==
X-Received: by 2002:a05:6402:35c9:: with SMTP id
 z9mr25953026edc.94.1620134855932; 
 Tue, 04 May 2021 06:27:35 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4a5c:1943:c73d:c4c9])
 by smtp.gmail.com with ESMTPSA id q18sm3114036edd.3.2021.05.04.06.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:27:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/12] drm/i915: add DMA-buf user fence support
Date: Tue,  4 May 2021 15:27:23 +0200
Message-Id: <20210504132729.2046-7-christian.koenig@amd.com>
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
dS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jIHwgNiArKysrKysKIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5
MTVfZ2VtX2V4ZWNidWZmZXIuYwppbmRleCA1OTY0ZTY3YzdkMzYuLjI0YzU3NWQ3NjJkYiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2V4ZWNidWZmZXIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZXhlY2J1ZmZlci5jCkBAIC04
NzIsNiArODcyLDEyIEBAIHN0YXRpYyBpbnQgZWJfbG9va3VwX3ZtYXMoc3RydWN0IGk5MTVfZXhl
Y2J1ZmZlciAqZWIpCiAJCQlnb3RvIGVycjsKIAkJfQogCisJCWVyciA9IGRtYV9yZXN2X3N5bmNf
dXNlcl9mZW5jZSh2bWEtPm9iai0+YmFzZS5yZXN2KTsKKwkJaWYgKHVubGlrZWx5KGVycikpIHsK
KwkJCWk5MTVfdm1hX3B1dCh2bWEpOworCQkJZ290byBlcnI7CisJCX0KKwogCQllYl9hZGRfdm1h
KGViLCBpLCBiYXRjaCwgdm1hKTsKIAogCQlpZiAoaTkxNV9nZW1fb2JqZWN0X2lzX3VzZXJwdHIo
dm1hLT5vYmopKSB7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
