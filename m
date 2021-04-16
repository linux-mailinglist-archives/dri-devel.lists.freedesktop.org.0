Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7658636229C
	for <lists+dri-devel@lfdr.de>; Fri, 16 Apr 2021 16:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 049096EBA8;
	Fri, 16 Apr 2021 14:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46183880C6
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 14:38:05 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id r12so42511706ejr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Apr 2021 07:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZGyBouBX1Ggemr68Q6SGgePttKsGtb3+vFBnPKj0XKk=;
 b=zjKlrXCCCLp6PJd5mtBzTp6pYWfRMDUvqt2BWn+2iebcYzB4ncO09SI9ON5trK0Mam
 CjIjMhDYpJVSXmm7/T0jadBr3NikpYMCeaOhRFojpAVKzAabEx/CVte0Gsuqae2S6xdV
 m3ofbSyWJjul6HlGEexA3HzhJU5ERte6rjduLZpYCQX0D4qDhYvh11cZADkRRa7D7mVt
 VaRx3PHxNHgjRg+6O+QBVcbacEUXpPkop3e7KMFlSAGu8MI7ygi2QSXMBTeRYbMul+4O
 INtlWgVewA6b6Z4apPq07djKAEmY/3meppvazfhHplENudSCo2rSXtEgAI631O5pEX09
 HbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZGyBouBX1Ggemr68Q6SGgePttKsGtb3+vFBnPKj0XKk=;
 b=VaYq9FkAxKpFa0wOYsEdavdUHETY3xMCsXLVGaYNcskHWuN3ttAza4P/JEunMf1aFZ
 8J8ZJ/st2+AFWRwA6jVRLaeubjDc7Ffhio/B2MMbYgUgH1/kwOl2Kd6ori1Ve36fZCMc
 dhCVgSu0u4Tp+lgT0ESbrLkqPsXs9+U585AJ/zhEagi/4m2A6ge0eEZALsP3noZYecFi
 tHNAUWNUPsMS0cmkIG55oYLwByFDJeiAL3nSdLf7uMZBMm/LvVrb0EA4m8NDOkd2ghxV
 nyB8tETuVgV+IMSb4iXJLFLsm5bDiDWThudcmephw/4Pd5C/pR0A1rCSC2C4oY8RSJ4X
 iJWA==
X-Gm-Message-State: AOAM531OVVv0zqcnWocI7+1CA5Mfv8XET2PNpgyvbQXx3dJze4+iZ1l+
 AqB7UIgWjlUd2814k87rVnQOeA==
X-Google-Smtp-Source: ABdhPJws+FLe7plPr6Ort0gG8DuAX1ky+aZQxssJs5xmE11JaLd6HoX6Enf722QkwyFmK8phDKpX0Q==
X-Received: by 2002:a17:906:a20c:: with SMTP id
 r12mr8482174ejy.554.1618583883851; 
 Fri, 16 Apr 2021 07:38:03 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:38:03 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 32/40] drm/amd/amdgpu/amdgpu_ttm: Fix incorrectly documented
 function 'amdgpu_ttm_copy_mem_to_mem()'
Date: Fri, 16 Apr 2021 15:37:17 +0100
Message-Id: <20210416143725.2769053-33-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Jerome Glisse <glisse@freedesktop.org>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jOjMxMTogd2FybmluZzogZXhwZWN0aW5n
IHByb3RvdHlwZSBmb3IgYW1kZ3B1X2NvcHlfdHRtX21lbV90b19tZW0oKS4gUHJvdG90eXBlIHdh
cyBmb3IgYW1kZ3B1X3R0bV9jb3B5X21lbV90b19tZW0oKSBpbnN0ZWFkCgpDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXgu
aWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNjOiBTdW1pdCBTZW13YWwg
PHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnPgpDYzogSmVyb21lIEdsaXNzZSA8Z2xpc3NlQGZyZWVk
ZXNrdG9wLm9yZz4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkNjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcK
Q2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZwpTaWduZWQtb2ZmLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRleCAz
YmVmMDQzMmNhYzJmLi44NTkzMTRjMGQ2YTM5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jCkBAIC0yODgsNyArMjg4LDcgQEAgc3RhdGljIGludCBhbWRncHVfdHRtX21h
cF9idWZmZXIoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIH0KIAogLyoqCi0gKiBhbWRn
cHVfY29weV90dG1fbWVtX3RvX21lbSAtIEhlbHBlciBmdW5jdGlvbiBmb3IgY29weQorICogYW1k
Z3B1X3R0bV9jb3B5X21lbV90b19tZW0gLSBIZWxwZXIgZnVuY3Rpb24gZm9yIGNvcHkKICAqIEBh
ZGV2OiBhbWRncHUgZGV2aWNlCiAgKiBAc3JjOiBidWZmZXIvYWRkcmVzcyB3aGVyZSB0byByZWFk
IGZyb20KICAqIEBkc3Q6IGJ1ZmZlci9hZGRyZXNzIHdoZXJlIHRvIHdyaXRlIHRvCi0tIAoyLjI3
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
