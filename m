Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE4529499E
	for <lists+dri-devel@lfdr.de>; Wed, 21 Oct 2020 10:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1969B6EA83;
	Wed, 21 Oct 2020 08:57:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2D26E10C
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 08:57:06 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id i1so2182898wro.1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Oct 2020 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MzLc+nXcpvkOQiq6BkCYlPPhN6+7Fey8ddI3JwNu2z0=;
 b=ExhcwVuFro8r01Sz5/fOgu0MdAgS0lDexZuz+TZgZJBaeW+gUwRZt3CgPKBk+71vuL
 YdtxzMhDjriD2GGLlLdcf06cZZ1rNKPob0lIbVsDWxLXuFz+XMa24vqfVJ3XdOaz9J4K
 zX76LvbtYA7KgjjC8Hmo9CXXR9u8aU0b4xKXM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MzLc+nXcpvkOQiq6BkCYlPPhN6+7Fey8ddI3JwNu2z0=;
 b=p9QQL4+eQH5kbcMcRXHot8gjfXrxnuyGfMqohlojwVQT5V4u+txiapz+25zZ+sPQyj
 3OGfguUxFmFYCqvIS6oR32u8lwx1gfwUGaAs7BZCg97jXVtpfO5hZa5S5fIyDlQwto8Q
 iPawKpJmwzEYRiR3jXovyQ+f9wzWo/NLIHzn1UyZ0eNH7Z0O4frHZnyAA6J08ttI9r4g
 VfPcpoCdvs9CwUj/t1oqXWqqkkFExE4B1NdqtNihtk5jmVSB4vrxkX3QyeA6n6l/VWe5
 /IlpdpcibsxgAVLTQyW0oDkLhgu5wDIUSnYYCX8jYDoaHlih8MthF/yD9+FQjHu4vNK+
 XFlA==
X-Gm-Message-State: AOAM531PomOn6Jdsj8OZ6Uva7kBK+6zCE3hGFKPpzK5EboaE6G/jclQE
 GI01w+m2Rl0Xc1+NOMPKty7FTFTn4G6Qagpw
X-Google-Smtp-Source: ABdhPJyCAH8re0IigGzSFNGR2JczHDSMi2OtGun5chATn44bOTjCNF+y6MdQtoVSvQQjUFn5n9PlOw==
X-Received: by 2002:adf:cd0c:: with SMTP id w12mr3356211wrm.305.1603270624818; 
 Wed, 21 Oct 2020 01:57:04 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q8sm2675939wro.32.2020.10.21.01.57.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 01:57:04 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 02/16] drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
Date: Wed, 21 Oct 2020 10:56:41 +0200
Message-Id: <20201021085655.1192025-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
References: <20201021085655.1192025-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Daniel Vetter <daniel.vetter@ffwll.com>,
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
Z25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYyB8IDMgKystCiAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2cyZC5jIGIvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2cyZC5jCmluZGV4IGVjZWRlNDFhZjliOS4uMWUwYzVhN2YyMDZlIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2cyZC5jCkBAIC00NzUsNyArNDc1LDgg
QEAgc3RhdGljIGRtYV9hZGRyX3QgKmcyZF91c2VycHRyX2dldF9kbWFfYWRkcihzdHJ1Y3QgZzJk
X2RhdGEgKmcyZCwKIAkJZ290byBlcnJfZnJlZTsKIAl9CiAKLQlyZXQgPSBwaW5fdXNlcl9wYWdl
c19mYXN0KHN0YXJ0LCBucGFnZXMsIEZPTExfRk9SQ0UgfCBGT0xMX1dSSVRFLAorCXJldCA9IHBp
bl91c2VyX3BhZ2VzX2Zhc3Qoc3RhcnQsIG5wYWdlcywKKwkJCQkgIEZPTExfRk9SQ0UgfCBGT0xM
X1dSSVRFIHwgRk9MTF9MT05HVEVSTSwKIAkJCQkgIGcyZF91c2VycHRyLT5wYWdlcyk7CiAJaWYg
KHJldCAhPSBucGFnZXMpIHsKIAkJRFJNX0RFVl9FUlJPUihnMmQtPmRldiwKLS0gCjIuMjguMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
