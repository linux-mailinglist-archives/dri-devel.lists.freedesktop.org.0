Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66F11BE7D9
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 21:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4CD6F39A;
	Wed, 29 Apr 2020 19:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FA46F39E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 19:55:12 +0000 (UTC)
Received: by mail-qk1-x741.google.com with SMTP id s63so3368352qke.4
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Apr 2020 12:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4q6U9bQnNCsGSz0OpbbB1aaXw9FBRB2ZVtrZWl9IhSU=;
 b=SP/x0BkMwZpqM0y/UROarNzLq5L7flAHJIxrIT6BOkp8iKFksJqYo0PN/rw3Aad7tf
 02P+QUbHIICSiO/22dSE+I899n3t0wNdf/t///9lu5mbRC1Ddbe4/j2uwP10O6cFTB6E
 rZnDKMIwzhe0SE1yKM2JkhEl8mKUZdI7ofkADhz1rbGn92ta6P91p5cSXDJ8V1P4xiHa
 vKyNVn3QI5kbCQd4ZA/rM7ggNbYbufcwohW1dkS0nM0ZCtJSTLrPHYJABt46aDr6bv2g
 maWyMX6GCqs3thpy+1mqu2jgl3+63VgFoofF4EYNrHMjyCHpga7cM8JQI0XjIHnKUNkv
 bROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4q6U9bQnNCsGSz0OpbbB1aaXw9FBRB2ZVtrZWl9IhSU=;
 b=ra24Nm55EI1lg8jyWTICXbAQPHwDNpGx4j6gz1DOq6jqDq/ovbZw1bP+/3C54T6P7d
 Xz+djh1O1HWKHJM5tEVhTTylG9+uTYjAc/UKQ2vTWe2xau7OyUoA/ONqOovzewrM5WuJ
 /DDnmzNcvrTM+ky8YTAar9o8tX460s4C1J7O+/td9XDMaxS83M23y22Xgm0HoU2qjbd3
 7JLBMPMqxKW40/yt3yJRFLl6vJJ3h6tRpd2G6KtARxnnhY+Hrn3hmqM47T/1fqE09bkZ
 c/FpkMUJiJ2EGc3sDxyPQGfj1mZC4ld12dZZr7D1mntLGwWzP+mmdXMT5on6ekV1kaTg
 D08g==
X-Gm-Message-State: AGi0PuaA8gbdioIwuBSdsPG55Qgf5thtecDqxLzQmofVZ2VpeO8JFf2J
 fcpmrDzcDDomNdnXLVz8TQYNrk+lEHg=
X-Google-Smtp-Source: APiQypI76PolNXrJ/BpqdWa0H/H9CIVOQqumkq4vgTCAPgV2vCOuRTvedG6UGr+Xe+wYKz6RwVxaRg==
X-Received: by 2002:a37:62d7:: with SMTP id w206mr106790qkb.406.1588190109538; 
 Wed, 29 Apr 2020 12:55:09 -0700 (PDT)
Received: from localhost (mobile-166-170-55-34.mycingular.net. [166.170.55.34])
 by smtp.gmail.com with ESMTPSA id h6sm158820qtd.79.2020.04.29.12.55.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 29 Apr 2020 12:55:09 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 03/16] drm/i915: WARN if HDCP signalling is enabled upon
 disable
Date: Wed, 29 Apr 2020 15:54:49 -0400
Message-Id: <20200429195502.39919-4-sean@poorly.run>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200429195502.39919-1-sean@poorly.run>
References: <20200429195502.39919-1-sean@poorly.run>
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
Cc: daniel.vetter@ffwll.ch, seanpaul@chromium.org, juston.li@intel.com,
 rodrigo.vivi@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpIRENQIHNpZ25hbGxpbmcg
c2hvdWxkIG5vdCBiZSBsZWZ0IG9uLCBXQVJOIGlmIGl0IGlzCgpDYzogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+ClJldmlld2VkLWJ5OiBSYW1hbGluZ2FtIEMgPHJhbWFsaW5nYW0u
Y0BpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1bCA8c2VhbnBhdWxAY2hyb21pdW0u
b3JnPgpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQv
MjAxOTEyMTIxOTAyMzAuMTg4NTA1LTQtc2VhbkBwb29ybHkucnVuICN2MgpMaW5rOiBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAyMDAxMTcxOTMxMDMuMTU2
ODIxLTQtc2VhbkBwb29ybHkucnVuICN2MwpMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVz
a3RvcC5vcmcvcGF0Y2gvbXNnaWQvMjAyMDAyMTgyMjAyNDIuMTA3MjY1LTQtc2VhbkBwb29ybHku
cnVuICN2NApMaW5rOiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvcGF0Y2gvbXNn
aWQvMjAyMDAzMDUyMDEyMzYuMTUyMzA3LTQtc2VhbkBwb29ybHkucnVuICN2NQoKQ2hhbmdlcyBp
biB2MjoKLUFkZGVkIHRvIHRoZSBzZXQgaW4gbGlldSBvZiBqdXN0IGNsZWFyaW5nIHRoZSBiaXQK
Q2hhbmdlcyBpbiB2MzoKLU5vbmUKQ2hhbmdlcyBpbiB2NDoKLU5vbmUKQ2hhbmdlcyBpbiB2NToK
LUNoYW5nZSBXQVJOX09OIHRvIGRybV9XQVJOX09OCkNoYW5nZXMgaW4gdjY6Ci1Ob25lCi0tLQog
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyB8IDIgKysKIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2RkaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9kZGkuYwppbmRleCA1NjAxNjczYzNmMzAuLjA4ODQ0YmE5ZGNiNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCkBAIC0xNjYzLDYgKzE2NjMsOCBAQCB2b2lkIGlu
dGVsX2RkaV9kaXNhYmxlX3RyYW5zY29kZXJfZnVuYyhjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19z
dGF0ZSAqY3J0Y19zdGF0ZQogCiAJY3RsID0gaW50ZWxfZGVfcmVhZChkZXZfcHJpdiwgVFJBTlNf
RERJX0ZVTkNfQ1RMKGNwdV90cmFuc2NvZGVyKSk7CiAKKwlkcm1fV0FSTl9PTihjcnRjLT5iYXNl
LmRldiwgY3RsICYgVFJBTlNfRERJX0hEQ1BfU0lHTkFMTElORyk7CisKIAljdGwgJj0gflRSQU5T
X0RESV9GVU5DX0VOQUJMRTsKIAogCWlmIChJU19HRU5fUkFOR0UoZGV2X3ByaXYsIDgsIDEwKSkK
LS0gClNlYW4gUGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
