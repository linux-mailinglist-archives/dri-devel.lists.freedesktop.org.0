Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF0E46AF5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 22:39:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4B97898C8;
	Fri, 14 Jun 2019 20:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AED789826
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:23 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id a14so5201716edv.12
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AMBGg2Z7YsweMeAq1rHmmkQ5dcyUBkoEhk4aK1nNvr4=;
 b=aeBo3NjUkk5LWvJJiLqvSYrPDCihBtHpDjJf5qQNeJ75bR+hVJXmRavtNFiY7PYT6w
 345Woraa18Lx9QbRMKUXZuV5NwaPRL1mED8ILgC3WZxAQLjht+QRYEWna3pDxluxlerY
 WdUZyaZfOh9lAzQQhQzmySERLzHU4fdphe3D7GNDEl/bxRkHOUiM3mlRmFa3HZnJ1Nqf
 NAOX5hZgMiRbQxnoTfkc6oXZ8800iCz+uAiA8hBFqQNvlWti2W8j0jQF9kAXao1mrJYe
 XcmguuU7lRLuLjwgM1V9FkuiDkXAAZJE1DAoKr1s15zFYmHytYZFQLrx1Hipr6HI1BSQ
 mH2w==
X-Gm-Message-State: APjAAAXPlU+PbzEv/h5iiGzFMzl995gFNyF4FJ3RoJVqIbxox8bR3DiE
 zWlClHkM/g9QXs4ZWxwMVcDrpNpodik=
X-Google-Smtp-Source: APXvYqwQq8pHMCZfb0+KXE0nfKpbJZZy2u32WwxdhRAbndAEuECanoaNxnUsYKiEAM0HlhNFjZ3NYg==
X-Received: by 2002:a17:906:e204:: with SMTP id
 gf4mr42260208ejb.302.1560544640471; 
 Fri, 14 Jun 2019 13:37:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:19 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 51/59] drm/radeon: Fill out gem_object->resv
Date: Fri, 14 Jun 2019 22:36:07 +0200
Message-Id: <20190614203615.12639-52-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AMBGg2Z7YsweMeAq1rHmmkQ5dcyUBkoEhk4aK1nNvr4=;
 b=QSZdnbLuF6xsWaMaLHsA8WyfnFEMiFPU+IUmDvCawmrua9lmUu/UP5/28wUQChYlW8
 gd3Slvg2WIxF9rVUS90KdODJxtLeqNW/iqjadrOJ1HyAKLcOcVAYYrV6B0LpOEKDkBfu
 eq8Tsvpw7UYXDcLq1dpca37v34topLfUEOjjU=
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhhdCB3YXkgd2UgY2FuIGRpdGNoIG91ciBnZW1fcHJpbWVfcmVzX29iaiBpbXBsZW1lbnRhdGlv
bi4gU2luY2UgdHRtCmFic29sdXRlbHkgbmVlZHMgdGhlIHJpZ2h0IHJlc2VydmF0aW9uIG9iamVj
dCBhbGwgdGhlIGJvaWxlcnBsYXRlIGlzCmFscmVhZHkgdGhlcmUgYW5kIHdlIGp1c3QgaGF2ZSB0
byB3aXJlIGl0IHVwIGNvcnJlY3RseS4KCk5vdGUgdGhhdCBnZW0vcHJpbWUgZG9lc24ndCBjYXJl
IHdoZW4gd2UgZG8gdGhpcywgYXMgbG9uZyBhcyB3ZSBkbyBpdApiZWZvcmUgdGhlIGJvIGlzIHJl
Z2lzdGVyZWQgYW5kIHNvbWVvbmUgY2FuIGNhbGwgdGhlIGhhbmRsZTJmZCBpb2N0bApvbiBpdC4K
CkFzaWRlOiB0dG1fYnVmZmVyX29iamVjdC50dG1fcmVzdiBjb3VsZCBwcm9iYWJseSBiZSBkaXRj
aGVkIGluIGZhdm91cgpvZiBhbHdheXMgcGFzc2luZyBhIG5vbi1OVUxMIHJlc3YgdG8gdHRtX2Jv
X2luaXQoKS4gQXQgbGVhc3QgZm9yIGdlbQpkcml2ZXJzIHRoYXQgd291bGQgYXZvaWQgaGF2aW5n
IHR3byBvZiB0aGVzZSwgb24gaW4gdHRtX2J1ZmZlcl9vYmplY3QKYW5kIHRoZSBvdGhlciBpbiBk
cm1fZ2VtX29iamVjdCwgb25lIGp1c3QgdGhlcmUgZm9yIGNvbmZ1c2lvbi4KClNpZ25lZC1vZmYt
Ynk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogQWxleCBEZXVj
aGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxj
aHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CkNjOiAiRGF2aWQgKENodW5NaW5nKSBaaG91IiA8RGF2
aWQxLlpob3VAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCi0tLQog
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMgICAgfCAyIC0tCiBkcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYyB8IDEgKwogZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fcHJpbWUuYyAgfCA3IC0tLS0tLS0KIDMgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuYwppbmRl
eCA0NDAzZTc2ZTFhZTAuLmE0YTc4ZGZkZWYzNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9yYWRlb25fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
ZHJ2LmMKQEAgLTE1Miw3ICsxNTIsNiBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnJhZGVvbl9n
ZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJCQkJCQkJ
c3RydWN0IHNnX3RhYmxlICpzZyk7CiBpbnQgcmFkZW9uX2dlbV9wcmltZV9waW4oc3RydWN0IGRy
bV9nZW1fb2JqZWN0ICpvYmopOwogdm9pZCByYWRlb25fZ2VtX3ByaW1lX3VucGluKHN0cnVjdCBk
cm1fZ2VtX29iamVjdCAqb2JqKTsKLXN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKnJhZGVvbl9n
ZW1fcHJpbWVfcmVzX29iaihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKik7CiB2b2lkICpyYWRlb25f
Z2VtX3ByaW1lX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOwogdm9pZCByYWRlb25f
Z2VtX3ByaW1lX3Z1bm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaiwgdm9pZCAqdmFkZHIp
OwogCkBAIC01NjYsNyArNTY1LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGttc19kcml2
ZXIgPSB7CiAJLmdlbV9wcmltZV9leHBvcnQgPSByYWRlb25fZ2VtX3ByaW1lX2V4cG9ydCwKIAku
Z2VtX3ByaW1lX3BpbiA9IHJhZGVvbl9nZW1fcHJpbWVfcGluLAogCS5nZW1fcHJpbWVfdW5waW4g
PSByYWRlb25fZ2VtX3ByaW1lX3VucGluLAotCS5nZW1fcHJpbWVfcmVzX29iaiA9IHJhZGVvbl9n
ZW1fcHJpbWVfcmVzX29iaiwKIAkuZ2VtX3ByaW1lX2dldF9zZ190YWJsZSA9IHJhZGVvbl9nZW1f
cHJpbWVfZ2V0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0gcmFkZW9u
X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUsCiAJLmdlbV9wcmltZV92bWFwID0gcmFkZW9uX2dl
bV9wcmltZV92bWFwLApkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
b2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9vYmplY3QuYwppbmRleCAy
MWY3M2ZjODZmMzguLjdhMmJhZDg0M2Y4YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fb2JqZWN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
b2JqZWN0LmMKQEAgLTI2Miw2ICsyNjIsNyBAQCBpbnQgcmFkZW9uX2JvX2NyZWF0ZShzdHJ1Y3Qg
cmFkZW9uX2RldmljZSAqcmRldiwKIAlyID0gdHRtX2JvX2luaXQoJnJkZXYtPm1tYW4uYmRldiwg
JmJvLT50Ym8sIHNpemUsIHR5cGUsCiAJCQkmYm8tPnBsYWNlbWVudCwgcGFnZV9hbGlnbiwgIWtl
cm5lbCwgYWNjX3NpemUsCiAJCQlzZywgcmVzdiwgJnJhZGVvbl90dG1fYm9fZGVzdHJveSk7CisJ
Ym8tPmdlbV9iYXNlLnJlc3YgPSBiby0+dGJvLnJlc3Y7CiAJdXBfcmVhZCgmcmRldi0+cG0ubWNs
a19sb2NrKTsKIAlpZiAodW5saWtlbHkociAhPSAwKSkgewogCQlyZXR1cm4gcjsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ByaW1lLmMgYi9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9wcmltZS5jCmluZGV4IGRlYWZmY2U1MGEyZS4uOGNlM2U4MDQ1ZDQy
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9wcmltZS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ByaW1lLmMKQEAgLTExNywxMyArMTE3LDYg
QEAgdm9pZCByYWRlb25fZ2VtX3ByaW1lX3VucGluKHN0cnVjdCBkcm1fZ2VtX29iamVjdCAqb2Jq
KQogfQogCiAKLXN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3QgKnJhZGVvbl9nZW1fcHJpbWVfcmVz
X29iaihzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm9iaikKLXsKLQlzdHJ1Y3QgcmFkZW9uX2JvICpi
byA9IGdlbV90b19yYWRlb25fYm8ob2JqKTsKLQotCXJldHVybiBiby0+dGJvLnJlc3Y7Ci19Ci0K
IHN0cnVjdCBkbWFfYnVmICpyYWRlb25fZ2VtX3ByaW1lX2V4cG9ydChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKmdvYmosCiAJCQkJCWludCBmbGFncykKIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
