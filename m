Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 126801726D7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2020 19:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1569E6ED3A;
	Thu, 27 Feb 2020 18:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF626ECF8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 18:16:34 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id v4so4616902wrs.8
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2020 10:16:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HgHKhcPbCn8MTTH1HBBSwF6HlQrehoDXRJeIGVezNgw=;
 b=cTThDEN/WrYeKzA25bhfqOCQ1Urwm+l2H71BMrSt8OvHcU0e+U1lwVa0UVmhRHAKz8
 xcT9fjy68x8ziu6hd4aISvWCRT2h6uvjn6aKieCZYq7VV0HTeH8TygwMEsbcYUOULsS4
 kAUwqW5mIUiBIJImZCUSqn0k3ipAZQ3fPlbbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HgHKhcPbCn8MTTH1HBBSwF6HlQrehoDXRJeIGVezNgw=;
 b=PhG+C+I0GZHdCTrXf6uAnBr7x3/A5GZgfWA1d8jg6cm/lcPtHCPz0GUfoyOQlZOEU+
 JbKX7km2X1Miy4+QxUSpzDVMSloRlZr4lIgUF/eey0+pzivpwUD93YsOJsWA8hpfze01
 No/dDjgoUy+57AsHM9HfYL7yBR7t7o2yEjaLYKQxBtFZ3d7JPsFJ47X4OF5bbut5MNNJ
 FJs0BJHb+Yu2RIlwQQv4yPdKeR9y8iEQ+tTiIRTvHA2rJiYrpr/tSRSf4zFfOLgJewbs
 X38U3vqjlUPZ51WuYfBuYFT1NrSNEcmjZd+BsQ1qELn60AkfeqSoq8s/wSxkzgnKtNkI
 BV2g==
X-Gm-Message-State: APjAAAX0kZeVzLkPn7jTNAkXQZMjMPxKomrtUsayoNUTd1LRZ0cM/j4F
 1YNxRyPWxCEsbFJtZC6df/OlViLWMTM=
X-Google-Smtp-Source: APXvYqzi3LUASaEkBFGow3IHbv7zvMv6NDry6WbEb0xAuf1KtaDy9LXinsPdFkcTs7trRF+wVmu0Gg==
X-Received: by 2002:adf:ef4f:: with SMTP id c15mr143790wrp.200.1582827393239; 
 Thu, 27 Feb 2020 10:16:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q1sm8551152wrw.5.2020.02.27.10.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 10:16:32 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 50/51] drm/udl: drop drm_driver.release hook
Date: Thu, 27 Feb 2020 19:15:21 +0100
Message-Id: <20200227181522.2711142-51-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
References: <20200227181522.2711142-1-daniel.vetter@ffwll.ch>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, m.felsch@pengutronix.de,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dave Airlie <airlied@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlcmUncyBvbmx5IHR3byBmdW5jdGlvbnMgY2FsbGVkIGZyb20gdGhhdDoKZHJtX2ttc19oZWxw
ZXJfcG9sbF9maW5pKCkgYW5kIHVkbF9mcmVlX3VyYl9saXN0KCkuIEJvdGggb2YgdGhlc2UgYXJl
CmFsc28gY2FsbGVkIGZyb20gdGhlIHVic19kcml2ZXItPmRpc2Nvbm5lY3QgaG9vaywgc28gZW50
aXJlbHkKcG9pbnRsZXNzIHRvIGRvIHRoZSBzYW1lIGFnYWluIGluIHRoZSAtPnJlbGVhc2UgaG9v
ay4KCkZ1cnRoZXJtb3JlIGJ5IHRoZSB0aW1lIHdlIGNsZWFuIHVwIHRoZSBkcm1fZHJpdmVyIHdl
IHJlYWxseSBzaG91bGRuJ3QKYmUgdG91Y2hpbmcgaGFyZHdhcmUgYW55bW9yZSwgc28gc3RvcHBp
bmcgdGhlIHBvbGwgd29ya2VyIGFuZCBmcmVlaW5nCnRoZSB1cmIgYWxsb2NhdGlvbnMgaW4gLT5k
aXNjb25uZWN0IGlzIHRoZSByaWdodCB0aGluZyB0byBkby4KCk5vdyBkaXNjb25uZWN0IHN0aWxs
IGNsZWFucyB0aGluZ3MgdXAgYmVmb3JlIHVucmVnaXN0ZXJpbmcgdGhlIGRyaXZlciwKYnV0IHRo
YXQncyBhIGRpZmZlcmVudCBpc3N1ZS4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRh
bmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNv
bT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogRGFuaWVsIFZldHRlciA8ZGFu
aWVsLnZldHRlckBmZndsbC5jaD4KQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPgpDYzogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+CkNjOiBH
ZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KQ2M6ICJOb3JhbGYgVHLDuG5uZXMiIDxu
b3JhbGZAdHJvbm5lcy5vcmc+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+CkNj
OiBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25peC5kZT4KQ2M6IEFsZXggRGV1Y2hlciA8
YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9k
cnYuYyAgfCAgNiAtLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oICB8ICAxIC0K
IGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYyB8IDEwIC0tLS0tLS0tLS0KIDMgZmlsZXMg
Y2hhbmdlZCwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Vk
bC91ZGxfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYwppbmRleCBiNDQ3ZmIw
NTNlNzguLjdmMTQwODk4ZGYzZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxf
ZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMKQEAgLTM0LDE0ICszNCw4
IEBAIHN0YXRpYyBpbnQgdWRsX3VzYl9yZXN1bWUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVy
ZmFjZSkKIAogREVGSU5FX0RSTV9HRU1fRk9QUyh1ZGxfZHJpdmVyX2ZvcHMpOwogCi1zdGF0aWMg
dm9pZCB1ZGxfZHJpdmVyX3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldikKLXsKLQl1ZGxf
ZmluaShkZXYpOwotfQotCiBzdGF0aWMgc3RydWN0IGRybV9kcml2ZXIgZHJpdmVyID0gewogCS5k
cml2ZXJfZmVhdHVyZXMgPSBEUklWRVJfQVRPTUlDIHwgRFJJVkVSX0dFTSB8IERSSVZFUl9NT0RF
U0VULAotCS5yZWxlYXNlID0gdWRsX2RyaXZlcl9yZWxlYXNlLAogCiAJLyogZ2VtIGhvb2tzICov
CiAJLmdlbV9jcmVhdGVfb2JqZWN0ID0gdWRsX2RyaXZlcl9nZW1fY3JlYXRlX29iamVjdCwKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJt
L3VkbC91ZGxfZHJ2LmgKaW5kZXggMWRlN2ViMWI2YWFjLi4yNjQyZjk0YTYzZmMgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS91
ZGwvdWRsX2Rydi5oCkBAIC03Niw3ICs3Niw2IEBAIGludCB1ZGxfc3VibWl0X3VyYihzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgdXJiICp1cmIsIHNpemVfdCBsZW4pOwogdm9pZCB1ZGxf
dXJiX2NvbXBsZXRpb24oc3RydWN0IHVyYiAqdXJiKTsKIAogaW50IHVkbF9pbml0KHN0cnVjdCB1
ZGxfZGV2aWNlICp1ZGwpOwotdm9pZCB1ZGxfZmluaShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsK
IAogaW50IHVkbF9yZW5kZXJfaGxpbmUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IGxvZ19i
cHAsIHN0cnVjdCB1cmIgKip1cmJfcHRyLAogCQkgICAgIGNvbnN0IGNoYXIgKmZyb250LCBjaGFy
ICoqdXJiX2J1Zl9wdHIsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWlu
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMKaW5kZXggNTM4NzE4OTE5OTE2Li5m
NWQyN2YyYTU2NTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMKQEAgLTM1MSwxMyArMzUxLDMgQEAg
aW50IHVkbF9kcm9wX3VzYihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQogCXVkbF9mcmVlX3VyYl9s
aXN0KGRldik7CiAJcmV0dXJuIDA7CiB9Ci0KLXZvaWQgdWRsX2Zpbmkoc3RydWN0IGRybV9kZXZp
Y2UgKmRldikKLXsKLQlzdHJ1Y3QgdWRsX2RldmljZSAqdWRsID0gdG9fdWRsKGRldik7Ci0KLQlk
cm1fa21zX2hlbHBlcl9wb2xsX2ZpbmkoZGV2KTsKLQotCWlmICh1ZGwtPnVyYnMuY291bnQpCi0J
CXVkbF9mcmVlX3VyYl9saXN0KGRldik7Ci19Ci0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
