Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ACBA2C698D
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 17:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA00E6EE56;
	Fri, 27 Nov 2020 16:42:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFFF6EE5C
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 16:42:01 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id 23so6209488wrc.8
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 08:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MT1z3cj215AzOOgO3dPH+bq94VZWhyvFICSSDrawSRQ=;
 b=c21Xo6Rj7estCGPrDTj8F/i7Yj+krVWD4HRtsgjJ5HM3ti0pxKMcUeJWhEPoFRCyxm
 1A1kzXuYRFOR/X+6YDTzJXdBai011blJGvgmrkSXBVP5T5qkBuL2TX0c1GXUrVu68ZQV
 7WLP8+TYoIE1YNuaBvjxsmSVUsTBXsc/v2np0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MT1z3cj215AzOOgO3dPH+bq94VZWhyvFICSSDrawSRQ=;
 b=s2hf2FFtfYHqTXFio1AtMTBIvy5iE5h2nqL0DfBRF97WNXCQY1Ek7+rI45MB9zQSrR
 +KxuandxhA7ENWG9HnqYTs8ka8ogf14own3ubkUR+JrrwRWfqmOoE+DuFjRFbo8cs+42
 OMtWwe4xW1Frn2PpWQthbr9q2ehlVUk4xclL3qX72PN/5rR7n3r75uoP9N1GX+CiManI
 cPxMT4lgftOuU3Tb60OXfFVVrgxcwGA5NFLRIWDZUVC/u/IAD31hyrAOjGkrYTockr1U
 3gwd3fdNBCZLlVYZ8tmIMNTOwJHpRidJz9ZKzTt3oIj+bn9TaIAaNvptBvy0UV8liWpR
 q7VA==
X-Gm-Message-State: AOAM532En6TlDXrfNN7v3e1gbPVgjsbxZMlcrdxbZFrUTNtB1KNMZx1w
 c+7Pu09KLbFIK6PHvXCzMuwbKmIMNIkNrw==
X-Google-Smtp-Source: ABdhPJxJ+tJLOlH6yvpyDM4wsRPMg/i5xjzosEA83cZyFmOXcl5fGMh4eoZjxhHpFGJ3CymrXbGpNw==
X-Received: by 2002:adf:f783:: with SMTP id q3mr11568497wrp.88.1606495319838; 
 Fri, 27 Nov 2020 08:41:59 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q12sm14859078wrx.86.2020.11.27.08.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 08:41:59 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 02/17] drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
Date: Fri, 27 Nov 2020 17:41:16 +0100
Message-Id: <20201127164131.2244124-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
References: <20201127164131.2244124-1-daniel.vetter@ffwll.ch>
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Joonyoung Shim <jy0922.shim@samsung.com>, kvm@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
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
bmctc29jQHZnZXIua2VybmVsLm9yZwpDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnClNp
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2cyZC5jIHwgMyArKy0KIDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMgYi9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL2V4eW5vc19kcm1fZzJkLmMKaW5kZXggZWNlZGU0MWFmOWI5Li4xZTBjNWE3ZjIwNmUgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMKQEAgLTQ3NSw3ICs0NzUsOCBA
QCBzdGF0aWMgZG1hX2FkZHJfdCAqZzJkX3VzZXJwdHJfZ2V0X2RtYV9hZGRyKHN0cnVjdCBnMmRf
ZGF0YSAqZzJkLAogCQlnb3RvIGVycl9mcmVlOwogCX0KIAotCXJldCA9IHBpbl91c2VyX3BhZ2Vz
X2Zhc3Qoc3RhcnQsIG5wYWdlcywgRk9MTF9GT1JDRSB8IEZPTExfV1JJVEUsCisJcmV0ID0gcGlu
X3VzZXJfcGFnZXNfZmFzdChzdGFydCwgbnBhZ2VzLAorCQkJCSAgRk9MTF9GT1JDRSB8IEZPTExf
V1JJVEUgfCBGT0xMX0xPTkdURVJNLAogCQkJCSAgZzJkX3VzZXJwdHItPnBhZ2VzKTsKIAlpZiAo
cmV0ICE9IG5wYWdlcykgewogCQlEUk1fREVWX0VSUk9SKGcyZC0+ZGV2LAotLSAKMi4yOS4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
