Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 213B5298ADA
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 11:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0756E0F3;
	Mon, 26 Oct 2020 10:58:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A60F06E0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 10:58:29 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j7so11841051wrt.9
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 03:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VujIMeu4s9glQHD7csuDCyNoNKl6Zu7MMMJFOASMnXs=;
 b=Ghd448QeH/JpCHvVE51pHD/gv1aq9xL/1owNFBCiwBZSBWw36ulRGro2rbjavW8HCm
 tpvgHYSA74mCT5+uyBNL8JCAIV8+TSzuSAdovyibD14KcIKytMRX6O8hoK25tjhehc2D
 7GZJatk+wlASdgpbFnGrN0Wke1bO/fVz4YTuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VujIMeu4s9glQHD7csuDCyNoNKl6Zu7MMMJFOASMnXs=;
 b=nD4sGNHoP84wQXZ0Q6+as3PiLwK+032N7f53HX1B6dtV+Tl9LoSIgJ/LSfuPlgeJUe
 3g9zmEs0V1BIuWLDTk2/0pKvOSemDr+98wlU5aeUjcMDrbQCr98sGKa/ckcEMz5e4ZR/
 RVYvPLwdocILtcIk2mFZBBZFaacSqbxMrfOSuigWELrISQA411LJF3fs52VBp/DD6jbs
 uMDbfomf+hflv4IAfFCQUCuz2Z8FxksLgw40LIWjD1W+vH5I4aTZ4IB0JkkTbU0uXkb6
 3+712sp2BvH9EOdStBLiBg5nZD4v37OON3/NVj6AJZL0RdjwEd4+IO3RUIDvKAJLMbCg
 qsLg==
X-Gm-Message-State: AOAM533C+UFXDaGGVQzwzpuf2RHyHXt+rmGBXmyg6pMtu7ThAmVRTC98
 Rb30Mj7v1n+QB8RF2bHIYB0CMZ6vNxG4USsK
X-Google-Smtp-Source: ABdhPJypi/6Cbees0NGq1yum4JVfOyvtLJ54ljnHY5mG0+HM7dRuCdSdcl5NsPm+FmtB0NGqEYAv1Q==
X-Received: by 2002:adf:f3cb:: with SMTP id g11mr18176883wrp.210.1603709908008; 
 Mon, 26 Oct 2020 03:58:28 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w83sm21165156wmg.48.2020.10.26.03.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 03:58:27 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 02/15] drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
Date: Mon, 26 Oct 2020 11:58:05 +0100
Message-Id: <20201026105818.2585306-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
References: <20201026105818.2585306-1-daniel.vetter@ffwll.ch>
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
cmV0ICE9IG5wYWdlcykgewogCQlEUk1fREVWX0VSUk9SKGcyZC0+ZGV2LAotLSAKMi4yOC4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
