Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34A02155EE1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 20:51:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690E86FD85;
	Fri,  7 Feb 2020 19:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98706FD7D;
 Fri,  7 Feb 2020 19:51:16 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id q15so257551qke.9;
 Fri, 07 Feb 2020 11:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xsYrQuNh+sVpWmRpiWGT+6wWdo77wFgu3ioKldiOfbA=;
 b=dp8ZO5B5jrUIODd3uGSh47Ky7pDD4uz53BtlJpxkmI9hlp3vn3T7LAvzpj/ww+Rz58
 vqvsZe0xdokS0IWkiB4usXDp1/IurUCK/+McDXFJxlCUs+Pd2Nc8CWoIh+V0j3FtxFte
 NJAmtba+ZItC+c4PKc1b4lDQrb2hVnZcjSu8Ekdma3IIp68DeiR9lntftKXWmM2LGXdQ
 zZY+fWc3Wa+PR+dkcFF/mFzr4BwxYlNcScjQdPVbZqvOAmNOYEgfHhU+So2iB+5YFeK1
 54A3rAJTthuvVCF8WHB6m/Ra4hVeV7TcHdixkXbYbu5Sbgnoh+lfWPI1XpBiPls3LV3q
 RG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xsYrQuNh+sVpWmRpiWGT+6wWdo77wFgu3ioKldiOfbA=;
 b=q/+yn9dELB+agL9MHfwSn/+HlGpIYvwg8IXhL7FPeyfd4A0KczwenSdc2PNy6jwkt5
 yyJzoTRhwe8rwbhcmM8YHffwZ7LlB0lXSO2FMU6rIe+hh9mQRuJ8LDdvZE9OU/kRnhQN
 eD3wRViY9K9s0oSJpe7LRHW+dX6Gl2k+BGCqYeYtY+F0MOCgj95LIWoKu+K4IVQMl6mY
 oc+tndU3m+86YGKeJ5xWHzPLAiczeBNLJb9CAJTOgOYnAn98tc2OEgXGkqokuJusPW5f
 zx0UspdEkuwyZmp/iwjfXN/zIzJudrUJgIKiwGap1crOgq5AYIi8NHMvLXdVCbGhen44
 ZP5A==
X-Gm-Message-State: APjAAAXKrdczO3p1qh2VFdkNnvHM5ch2G8Larb+/U3TCH/iBMTn4wfvQ
 oakKVahybIncBBhcass2df23ciWf
X-Google-Smtp-Source: APXvYqyUHRb3UwFFbDyafl3y83rTQo56tMJSk3Fi+2DFonlCS9p6iyuZqOz2FmNWQaAG4eD+7pJTLQ==
X-Received: by 2002:a05:620a:b04:: with SMTP id t4mr533002qkg.7.1581105075476; 
 Fri, 07 Feb 2020 11:51:15 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id w16sm1752226qkj.135.2020.02.07.11.51.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 11:51:14 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/15] drm/amdgpu/display: move debugfs init into core amdgpu
 debugfs (v2)
Date: Fri,  7 Feb 2020 14:50:53 -0500
Message-Id: <20200207195058.2354-11-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207195058.2354-1-alexander.deucher@amd.com>
References: <20200207195058.2354-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gb3JkZXIgdG8gcmVtb3ZlIHRoZSBsb2FkIGFuZCB1bmxvYWQgZHJtIGNhbGxiYWNrcywKd2Ug
bmVlZCB0byByZW9yZGVyIHRoZSBpbml0IHNlcXVlbmNlIHRvIG1vdmUgYWxsIHRoZSBkcm0KZGVi
dWdmcyBmaWxlIGhhbmRsaW5nLiAgRG8gdGhpcyBmb3IgZGlzcGxheS4KCnYyOiBhZGQgY29uZmln
IGd1YXJkIGZvciBEQwoKUmV2aWV3ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFu
ZEBhbWQuY29tPiAodjEpCkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+ICh2MSkKU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIu
ZGV1Y2hlckBhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
ZWJ1Z2ZzLmMgICAgICAgfCA4ICsrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
YW1kZ3B1X2RtL2FtZGdwdV9kbS5jIHwgNSAtLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV9kZWJ1Z2ZzLmMKaW5kZXggNWJmNDNmMjBlYzMwLi5kZjM5MTllZjg4NmIgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYwpAQCAtMzIsNiArMzIsNyBA
QAogCiAjaW5jbHVkZSAiYW1kZ3B1LmgiCiAjaW5jbHVkZSAiYW1kZ3B1X3BtLmgiCisjaW5jbHVk
ZSAiYW1kZ3B1X2RtX2RlYnVnZnMuaCIKIAogLyoqCiAgKiBhbWRncHVfZGVidWdmc19hZGRfZmls
ZXMgLSBBZGQgc2ltcGxlIGRlYnVnZnMgZW50cmllcwpAQCAtMTI2MCw2ICsxMjYxLDEzIEBAIGlu
dCBhbWRncHVfZGVidWdmc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogCWlmIChy
KQogCQlEUk1fRVJST1IoInJlZ2lzdGVyaW5nIGZpcm13YXJlIGRlYnVnZnMgZmFpbGVkICglZCku
XG4iLCByKTsKIAorI2lmIGRlZmluZWQoQ09ORklHX0RSTV9BTURfREMpCisJaWYgKGFtZGdwdV9k
ZXZpY2VfaGFzX2RjX3N1cHBvcnQoYWRldikpIHsKKwkJaWYgKGR0bl9kZWJ1Z2ZzX2luaXQoYWRl
dikpCisJCQlEUk1fRVJST1IoImFtZGdwdTogZmFpbGVkIGluaXRpYWxpemUgZHRuIGRlYnVnZnMg
c3VwcG9ydC5cbiIpOworCX0KKyNlbmRpZgorCiAJcmV0dXJuIGFtZGdwdV9kZWJ1Z2ZzX2FkZF9m
aWxlcyhhZGV2LCBhbWRncHVfZGVidWdmc19saXN0LAogCQkJCQlBUlJBWV9TSVpFKGFtZGdwdV9k
ZWJ1Z2ZzX2xpc3QpKTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1k
Z3B1X2RtL2FtZGdwdV9kbS5jCmluZGV4IDUwMTM3ZGY5Y2RhZC4uODFjOGQ4YzYxZDYyIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMK
QEAgLTk5MSwxMSArOTkxLDYgQEAgc3RhdGljIGludCBhbWRncHVfZG1faW5pdChzdHJ1Y3QgYW1k
Z3B1X2RldmljZSAqYWRldikKIAkJZ290byBlcnJvcjsKIAl9CiAKLSNpZiBkZWZpbmVkKENPTkZJ
R19ERUJVR19GUykKLQlpZiAoZHRuX2RlYnVnZnNfaW5pdChhZGV2KSkKLQkJRFJNX0VSUk9SKCJh
bWRncHU6IGZhaWxlZCBpbml0aWFsaXplIGR0biBkZWJ1Z2ZzIHN1cHBvcnQuXG4iKTsKLSNlbmRp
ZgotCiAJRFJNX0RFQlVHX0RSSVZFUigiS01TIGluaXRpYWxpemVkLlxuIik7CiAKIAlyZXR1cm4g
MDsKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCg==
