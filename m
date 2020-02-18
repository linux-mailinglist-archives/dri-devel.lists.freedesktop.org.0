Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC2B163ED5
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 09:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A0F6EB1B;
	Wed, 19 Feb 2020 08:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBA26E3AC;
 Tue, 18 Feb 2020 18:02:32 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w15so25089524wru.4;
 Tue, 18 Feb 2020 10:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SkMYoetILOEv+7/xvoq38HUxhCYQWFNpKsVv8JzZk4k=;
 b=JbpY4xyN8RLPl/9Obb7Akx//7SVyp7GAdBYVO1TbYHvp9Te2IV5wIyJ9Na3j+3ofpE
 BViVvzMNPM3qWUAtpAL5VwlJlgud8WTR7kp4rJf5C7xu1dYmWlpKNRkj/hXJqATZ81KQ
 PASqtwoeKeD339PFeS93Ot9dnHI08/fEyYl65ozUXDilHp0/pn6aK/GRv1f61XzrVR+T
 BxtbB5yBevO/PcQbCH07XdChqcjNl+e4aiOAwW1rKmTBJ2IGfCa2W3eI6UINfQ+twypH
 nYHHIUSsz5a3luJwOT1Pca/82RYpCtZpmfoyfSlcwQMvKxG1/6yfom2ovi4fzhcaofPQ
 EIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SkMYoetILOEv+7/xvoq38HUxhCYQWFNpKsVv8JzZk4k=;
 b=iIcoi4WwVP7uuoQKhqbxg89NDMAMVFFDk/B/Wx1S5jRKPxoQJeGhPbi5PPriIWZSDa
 P8/uQWWbNsmMaQvrUG7AQVKV83xuifcuPDpKGVHvrCaBJU55iA7FHzpfU6f8Ft2npZ/r
 9DM61jlKu59diIxtYBJwNvO5iaw1Qqz8djnmXMAtHI1JSmAt9mhN/Z8+JLzEiW7aTuzg
 0QaAosFHvxQhMBO7WQasWFFiiegpiLHAFNo07Tai7e652EIcmg9+5WeBTJuCSwSIA/9J
 RygKzka3upa2pDXiVePina+mb4LktWTKRAPE64S5YrMojAvmCQu39bkvVPLnAH7mEN9E
 6sgg==
X-Gm-Message-State: APjAAAXFJ7oSNgRxXSuLiiTDcZ/xLAmFUlJexEVc7phmCoN5kI7g0lxu
 r8ZKI6ZrjKo8CAS4KTrl6gTChe/8D8+A0g==
X-Google-Smtp-Source: APXvYqzX7QnOSG7Blk/2WrM68V3hAUUDv+pINKll2m20uNpQ9lO8BD50iUedKg3U2+hJJl79iSdgSw==
X-Received: by 2002:a5d:4847:: with SMTP id n7mr29957242wrs.30.1582048950575; 
 Tue, 18 Feb 2020 10:02:30 -0800 (PST)
Received: from brihaspati.fritz.box
 (p200300C58F2CE900751228326401B174.dip0.t-ipconnect.de.
 [2003:c5:8f2c:e900:7512:2832:6401:b174])
 by smtp.gmail.com with ESMTPSA id d16sm7872733wrg.27.2020.02.18.10.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 10:02:30 -0800 (PST)
From: Nirmoy Das <nirmoy.aiemd@gmail.com>
X-Google-Original-From: Nirmoy Das <nirmoy.das@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/8] drm/bochs: use drm_gem_vram_offset to get bo offset
Date: Tue, 18 Feb 2020 19:04:53 +0100
Message-Id: <20200218180454.81866-8-nirmoy.das@amd.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200218180454.81866-1-nirmoy.das@amd.com>
References: <20200218180454.81866-1-nirmoy.das@amd.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Feb 2020 08:19:59 +0000
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
Cc: thellstrom@vmware.com, airlied@linux.ie, kenny.ho@amd.com,
 brian.welty@intel.com, amd-gfx@lists.freedesktop.org, nirmoy.das@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 alexander.deucher@amd.com, sean@poorly.run, christian.koenig@amd.com,
 kraxel@redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U3dpdGNoIG92ZXIgdG8gR0VNIFZSQU0ncyBpbXBsZW1lbnRhdGlvbiB0byByZXRyaWV2ZSBiby0+
b2Zmc2V0CgpTaWduZWQtb2ZmLWJ5OiBOaXJtb3kgRGFzIDxuaXJtb3kuZGFzQGFtZC5jb20+CkFj
a2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JvY2hzL2JvY2hzX2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hzX2ttcy5j
CmluZGV4IDgwNjZkN2QzNzBkNS4uYjhlMTA3OWYwNzdlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYm9jaHMvYm9jaHNfa21zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JvY2hzL2JvY2hz
X2ttcy5jCkBAIC0zOCw3ICszOCw3IEBAIHN0YXRpYyB2b2lkIGJvY2hzX3BsYW5lX3VwZGF0ZShz
dHJ1Y3QgYm9jaHNfZGV2aWNlICpib2NocywKIAkJCSBzdGF0ZS0+Y3J0Y194LAogCQkJIHN0YXRl
LT5jcnRjX3ksCiAJCQkgc3RhdGUtPmZiLT5waXRjaGVzWzBdLAotCQkJIHN0YXRlLT5mYi0+b2Zm
c2V0c1swXSArIGdiby0+Ym8ub2Zmc2V0KTsKKwkJCSBzdGF0ZS0+ZmItPm9mZnNldHNbMF0gKyBk
cm1fZ2VtX3ZyYW1fb2Zmc2V0KGdibykpOwogCWJvY2hzX2h3X3NldGZvcm1hdChib2Nocywgc3Rh
dGUtPmZiLT5mb3JtYXQpOwogfQogCi0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
