Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BF6FD8B4
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 10:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198736E24B;
	Fri, 15 Nov 2019 09:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C29F6E20B
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 09:21:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f3so9529875wmc.5
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 01:21:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7bn7YokeAeXm5BBJ6T/lvBeGEKknPiOWxZqo9r4HuKg=;
 b=bRgXXweJmvqhioBqY56Ws1yBYvY4LIKlQ7EgoOdL9EphmK3KHCYVRVf+RENeCoQn0N
 Dvx5yw6YCD4RfkrwBGcMm8d0VRULKVoHZAr3r59pvfDTisjUE1txDYHumV1fVR2iATBX
 ZSwDRaWN7ENXaQB/jCN8QP8oHfIiugvGRsKdOQtPdMd4tBcHmBiCWKsjzgY7QOgjpGuh
 XWXPLxynvbq4A8a9IQ7eZjfwjsM0jqx2yg44gFTXMBM/lJT6o+AEZ2TrV+Nx/oWTManS
 qh0L2x1UZIxnMoRtGd9a4EoxM0H/AD/DtEyG/+pvvZfJKAmJFoz8GWQ8/2DVpHTKGOhz
 eI1w==
X-Gm-Message-State: APjAAAWCMj7n/1fdjU4+mn3RNTX66dieP3EJCsWsieN5iZo0U5aSc0jn
 0AUQj+ALBmHAM8lE+lgOaEArmXSu/N4=
X-Google-Smtp-Source: APXvYqw5pA6Z4/To2HtwhxA8s+cQMEm12J+4VegYlzVpaDN9QcIFr5+3oidjgBd15trxx9d517+bhw==
X-Received: by 2002:a1c:62c5:: with SMTP id w188mr13020645wmb.77.1573809693584; 
 Fri, 15 Nov 2019 01:21:33 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id 11sm8987506wmi.8.2019.11.15.01.21.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2019 01:21:32 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/8] drm/xen: Simplify fb_create
Date: Fri, 15 Nov 2019 10:21:18 +0100
Message-Id: <20191115092120.4445-7-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
References: <20191115092120.4445-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7bn7YokeAeXm5BBJ6T/lvBeGEKknPiOWxZqo9r4HuKg=;
 b=iPsLs/5cfYIlrdmZTkqsrS08Xzs+mb1WigGIc8UF9mWaopmOt67NMkE/lXX4F+eOoG
 sp3k+sinSMfKknbC2E/NHc0xpYuS/w/dMw/+BuJ86EZXz8bPRSoOq9QAXYjPCB1Yvifq
 U2y8J/LVbYpFVejCPFSt7NoNf07QSjEGvzgEU=
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
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 xen-devel@lists.xenproject.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGN1cnJlbnQgY29kZSBpcyBhIHByZXR0eSBnb29kIHd0ZiBtb21lbnQsIHNpbmNlIHdlIGRy
b3AgdGhlCnJlZmVyZW5jZSBiZWZvcmUgd2UgdXNlIGl0LiBJdCdzIG5vdCBhIGJpZyBkZWFsLCBi
ZWNhdXNlIGEpIHdlIG9ubHkKdXNlIHRoZSBwb2ludGVyLCBzbyBkb2Vzbid0IGJsb3cgdXAgYW5k
IHRoZSByZWFsIHJlYXNvbiBiKSBmYi0+b2JqWzBdCmFscmVhZHkgaG9sZHMgYSBmdWxsIHJlZmVy
ZW5jZSBmb3IgdXMuCgpNaWdodCBhcyB3ZWxsIHRha2UgdGhlIHJlYWwgcG9pbnRlciBpbnMndCBv
ZiBjb21wbGljYXRlZCBnYW1lcyB0aGF0CmJhZmZsZS4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBW
ZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29tPgpDYzogT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgpDYzogeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL3hlbi94ZW5fZHJtX2Zyb250X2tt
cy5jIHwgOSArLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgOCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRf
a21zLmMgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJvbnRfa21zLmMKaW5kZXggZmY1
MDZiYzk5NDE0Li40ZjM0YzUyMDgxODAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZW4v
eGVuX2RybV9mcm9udF9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0veGVuL3hlbl9kcm1fZnJv
bnRfa21zLmMKQEAgLTYzLDE0ICs2Myw3IEBAIGZiX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHAsCiAJaWYgKElTX0VSUl9PUl9OVUxMKGZiKSkKIAkJ
cmV0dXJuIGZiOwogCi0JZ2VtX29iaiA9IGRybV9nZW1fb2JqZWN0X2xvb2t1cChmaWxwLCBtb2Rl
X2NtZC0+aGFuZGxlc1swXSk7Ci0JaWYgKCFnZW1fb2JqKSB7Ci0JCURSTV9FUlJPUigiRmFpbGVk
IHRvIGxvb2t1cCBHRU0gb2JqZWN0XG4iKTsKLQkJcmV0ID0gLUVOT0VOVDsKLQkJZ290byBmYWls
OwotCX0KLQotCWRybV9nZW1fb2JqZWN0X3B1dF91bmxvY2tlZChnZW1fb2JqKTsKKwlnZW1fb2Jq
ID0gZmItPm9ialswXTsKIAogCXJldCA9IHhlbl9kcm1fZnJvbnRfZmJfYXR0YWNoKGRybV9pbmZv
LT5mcm9udF9pbmZvLAogCQkJCSAgICAgIHhlbl9kcm1fZnJvbnRfZGJ1Zl90b19jb29raWUoZ2Vt
X29iaiksCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
