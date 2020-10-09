Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A32288441
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 10:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CE06EC73;
	Fri,  9 Oct 2020 07:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EF7B6EC71
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:59:56 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id e17so9218721wru.12
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Oct 2020 00:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CNwEMjRKpk0SNHMR2BpU3eb5Lf8l12dJx2AoEHa9QRQ=;
 b=PAvIUQEM+RSj/4UjBMWApQJ5nylKvJGTUg+Uh2yOaH8fLVYPb51F1RYcc3SKKbcMgH
 sNy9tR823nuhLT3FMHNBrkfbaR1mpR4LJTMWp7qDAwAkb8Ezuarc2ddb75FNEEnxTKTH
 juj5nI/ojaXlobnL7do1JNcmBlcydYDbNdEWg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CNwEMjRKpk0SNHMR2BpU3eb5Lf8l12dJx2AoEHa9QRQ=;
 b=YGi9PgEbvPX2OLw+g0D2fl+0fLvRo6bEzLRzY0ffmsdqfYLZsrRviuuCWOmoyso0hf
 LvkZw0JXvWGRcmwbZQKR7KbeTeFNzTstMsA/np+Aq9gYYemMStMcCb79QLu96s/oExCB
 P1ALUNB3J8V1ZtHKsYiuhcas01mvEUMz0agCQ+H2QUcWMejHpKCN84Y1o1+8n0qZZ5FE
 rbtb3LdkGS8gsmiOiTJrKMiZj1nzFQk2UnzymBGoI455ALC28aQv8jfMo6uot+tHH96z
 wwwhiNAE4DD6ay9tdefKipuT9AxM4Zu7EgrPme4SZnvI+cGqXdYUrV3a5v/R2ttizrdz
 DHsw==
X-Gm-Message-State: AOAM533tjVfvMBUvwH6ArDWlAjSqD9OFGjht792MiWUWDjPDKzq/Z6gp
 /YtueP8wA+LEH+jgjv52WWN5wloMRLWksumX
X-Google-Smtp-Source: ABdhPJyUKAqGcidqsbNLuUZKjhqRIBOtVRIIm3edqNHeTh3Stywq8z0kGb9uG6SgLPE2j0/bA4O3dQ==
X-Received: by 2002:a5d:40c3:: with SMTP id b3mr14820571wrq.157.1602230394741; 
 Fri, 09 Oct 2020 00:59:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u17sm11634118wri.45.2020.10.09.00.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Oct 2020 00:59:54 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 02/17] drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
Date: Fri,  9 Oct 2020 09:59:19 +0200
Message-Id: <20201009075934.3509076-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
References: <20201009075934.3509076-1-daniel.vetter@ffwll.ch>
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, Joonyoung Shim <jy0922.shim@samsung.com>,
 kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-mm@kvack.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGV4eW5vcyBnMmQgaW50ZXJmYWNlIGlzIHZlcnkgdW51c3VhbCwgYnV0IGl0IGxvb2tzIGxp
a2UgdGhlCnVzZXJwdHIgb2JqZWN0cyBhcmUgcGVyc2lzdGVudC4gSGVuY2UgdGhleSBuZWVkIEZP
TExfTE9OR1RFUk0uCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGludGVsLmNvbT4KQ2M6IEphc29uIEd1bnRob3JwZSA8amdnQHppZXBlLmNhPgpDYzogSW5raSBE
YWUgPGlua2kuZGFlQHNhbXN1bmcuY29tPgpDYzogSm9vbnlvdW5nIFNoaW0gPGp5MDkyMi5zaGlt
QHNhbXN1bmcuY29tPgpDYzogU2V1bmctV29vIEtpbSA8c3cwMzEyLmtpbUBzYW1zdW5nLmNvbT4K
Q2M6IEt5dW5nbWluIFBhcmsgPGt5dW5nbWluLnBhcmtAc2Ftc3VuZy5jb20+CkNjOiBLdWtqaW4g
S2ltIDxrZ2VuZUBrZXJuZWwub3JnPgpDYzogS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJu
ZWwub3JnPgpDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KQ2M6
IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KQ2M6IErDqXLDtG1lIEdsaXNzZSA8
amdsaXNzZUByZWRoYXQuY29tPgpDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KQ2M6IERhbiBX
aWxsaWFtcyA8ZGFuLmoud2lsbGlhbXNAaW50ZWwuY29tPgpDYzogbGludXgtbW1Aa3ZhY2sub3Jn
CkNjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKQ2M6IGxpbnV4LXNhbXN1
bmctc29jQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCi0t
LQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2cyZC5jIHwgMyArKy0KIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMKaW5kZXggZWNlZGU0MWFmOWI5Li4xZTBjNWE3ZjIwNmUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMKQEAgLTQ3NSw3ICs0NzUs
OCBAQCBzdGF0aWMgZG1hX2FkZHJfdCAqZzJkX3VzZXJwdHJfZ2V0X2RtYV9hZGRyKHN0cnVjdCBn
MmRfZGF0YSAqZzJkLAogCQlnb3RvIGVycl9mcmVlOwogCX0KIAotCXJldCA9IHBpbl91c2VyX3Bh
Z2VzX2Zhc3Qoc3RhcnQsIG5wYWdlcywgRk9MTF9GT1JDRSB8IEZPTExfV1JJVEUsCisJcmV0ID0g
cGluX3VzZXJfcGFnZXNfZmFzdChzdGFydCwgbnBhZ2VzLAorCQkJCSAgRk9MTF9GT1JDRSB8IEZP
TExfV1JJVEUgfCBGT0xMX0xPTkdURVJNLAogCQkJCSAgZzJkX3VzZXJwdHItPnBhZ2VzKTsKIAlp
ZiAocmV0ICE9IG5wYWdlcykgewogCQlEUk1fREVWX0VSUk9SKGcyZC0+ZGV2LAotLSAKMi4yOC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
