Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2B8F1F24
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2019 20:41:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8B16E2B6;
	Wed,  6 Nov 2019 19:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E236E2B6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2019 19:41:24 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id g17so1940261ybd.13
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Nov 2019 11:41:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NvgyCff0GePlerjT69t0v19TBkJEtLkh6wnpQ4SPkWU=;
 b=KCEywrcK0tuPICIGan+34wKZdUcE4CkNGeFtSTI/lsqSsLbXyeAZzy7hUNj+ZCQ1Zf
 LBGQq5iwVXEl+5Q4XhWnqGj43ZHpxmbchx1VOB6A3UfsE1RGQvjhgSox9RM9LXt30pRu
 PuQP0GDEhT126iparMIsk0fTFxKdIk+fx7ERNHu65MiVTURGHr2gI4vqwV4awocwXd2s
 3U0xEV2cK0v4CnPFIwmrMoBaKiJWGJPRAqR0QjuT28ny5deBhgrYMDG1p/X7dw5mf2RK
 +ojTCSjIRAO03UnYRkrjL+fHXmt/+bdSjCYXChHVPLJMwmhM1wpt95m5+ZOsZ0Dk5Pnn
 2QjQ==
X-Gm-Message-State: APjAAAXxwiMnGCXD4bw73NOPJDc0Nd+WuWRdKUY9aFIhtTbsEJqtzHxg
 JEyXMwWY2SLysR/8nyfhslL2nXWzjGc=
X-Google-Smtp-Source: APXvYqz+wJFvghOSJxmwhPMveDNtDIKhQ74ZzUyI9fFSSvrKhjSpPT49p1u4WaVO/0kC/necNji76w==
X-Received: by 2002:a25:d7c5:: with SMTP id o188mr3639702ybg.336.1573069283723; 
 Wed, 06 Nov 2019 11:41:23 -0800 (PST)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id p83sm1279808ywc.11.2019.11.06.11.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 11:41:22 -0800 (PST)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mst: Fix up u64 division
Date: Wed,  6 Nov 2019 14:41:15 -0500
Message-Id: <20191106194121.164458-1-sean@poorly.run>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
In-Reply-To: <20191106182813.GV1208@intel.com>
References: <20191106182813.GV1208@intel.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NvgyCff0GePlerjT69t0v19TBkJEtLkh6wnpQ4SPkWU=;
 b=PGThtIUErj59ObfRg+zcF04BYRzGGwc2Gk4aXl4+EmRwrvodHZFkfaUjwvi0UiZbXa
 7NC1sbDsu5sKNYRlcqE+uAmjl51uKBXsXdotoDrAKXKdwJsv9ZoL7Zu/SwcSSeSGFdz0
 WiQ9t/4tWs+U6iOYvc7TaB1LomvCQrhuaL3mlKVAADRHmp114zpHfBVGZ22zjAH+r7tL
 ArMlSo9oG+l4q+LgwS5lQIlvYlCYOWb6VFakO3dwSD0aehAO2IeYgPi6V4bEFcBubwhI
 wJSO/SCsL9gUmexPWRSi7mobeBHUAM7sQy+a622fM1nLm/UqXokvwOuCMsqUqpbx4EXK
 7FjA==
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <seanpaul@chromium.org>,
 Juston Li <juston.li@intel.com>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpDaGFuZ2UgcmVtX25zZWMg
dG8gdTMyIHNpbmNlIHRoYXQncyB3aGF0IGRvX2RpdiByZXR1cm5zLCB0aGlzIGF2b2lkcyB0aGUK
dTY0IGRpdmlkZSBpbiB0aGUgZHJtX3ByaW50IGFyZ3MuCgpDaGFuZ2VzIGluIHYyOgotIEluc3Rl
YWQgb2YgZG9pbmcgZG9fZGl2IGluIGRybV9wcmludCwgbWFrZSByZW1fbnNlYyB1MzIgKFZpbGxl
KQoKTGluayB0byB2MTogaHR0cHM6Ly9wYXRjaHdvcmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoL21z
Z2lkLzIwMTkxMTA2MTczNjIyLjE1NTczLTEtc2VhbkBwb29ybHkucnVuCgpGaXhlczogMTJhMjgw
YzcyODY4ICgiZHJtL2RwX21zdDogQWRkIHRvcG9sb2d5IHJlZiBoaXN0b3J5IHRyYWNraW5nIGZv
ciBkZWJ1Z2dpbmciKQpDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29tPgpDYzogSW1y
ZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5z
eXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBhbWQu
Y29tPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IFNlYW4g
UGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4K
Q2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+
CkNjOiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+CkNjOiBEYXZpZCBBaXJsaWUg
PGFpcmxpZWRAbGludXguaWU+CkNjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+CkNj
OiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnClNpZ25lZC1vZmYtYnk6IFNlYW4gUGF1
bCA8c2VhbnBhdWxAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0
X3RvcG9sb2d5LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKaW5kZXggMTFh
ZGM0YjZjY2ZlLi5hZTU4MDlhMWYxOWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xv
Z3kuYwpAQCAtMTUwNywxMiArMTUwNywxMiBAQCBfX2R1bXBfdG9wb2xvZ3lfcmVmX2hpc3Rvcnko
c3RydWN0IGRybV9kcF9tc3RfdG9wb2xvZ3lfcmVmX2hpc3RvcnkgKmhpc3RvcnksCiAJCXVsb25n
ICplbnRyaWVzOwogCQl1aW50IG5yX2VudHJpZXM7CiAJCXU2NCB0c19uc2VjID0gZW50cnktPnRz
X25zZWM7Ci0JCXU2NCByZW1fbnNlYyA9IGRvX2Rpdih0c19uc2VjLCAxMDAwMDAwMDAwKTsKKwkJ
dTMyIHJlbV9uc2VjID0gZG9fZGl2KHRzX25zZWMsIDEwMDAwMDAwMDApOwogCiAJCW5yX2VudHJp
ZXMgPSBzdGFja19kZXBvdF9mZXRjaChlbnRyeS0+YmFja3RyYWNlLCAmZW50cmllcyk7CiAJCXN0
YWNrX3RyYWNlX3NucHJpbnQoYnVmLCBQQUdFX1NJWkUsIGVudHJpZXMsIG5yX2VudHJpZXMsIDQp
OwogCi0JCWRybV9wcmludGYoJnAsICIgICVkICVzcyAobGFzdCBhdCAlNWxsdS4lMDZsbHUpOlxu
JXMiLAorCQlkcm1fcHJpbnRmKCZwLCAiICAlZCAlc3MgKGxhc3QgYXQgJTVsbHUuJTA2dSk6XG4l
cyIsCiAJCQkgICBlbnRyeS0+Y291bnQsCiAJCQkgICB0b3BvbG9neV9yZWZfdHlwZV90b19zdHIo
ZW50cnktPnR5cGUpLAogCQkJICAgdHNfbnNlYywgcmVtX25zZWMgLyAxMDAwLCBidWYpOwotLSAK
U2VhbiBQYXVsLCBTb2Z0d2FyZSBFbmdpbmVlciwgR29vZ2xlIC8gQ2hyb21pdW0gT1MKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
