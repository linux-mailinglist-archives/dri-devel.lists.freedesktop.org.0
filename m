Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 317F92864D2
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 18:44:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7539F6E949;
	Wed,  7 Oct 2020 16:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 309376E23D
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 16:44:40 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e2so3153860wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 09:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xCribZCwI3aUgI2eueSnhSAx0iK7WRTlleTX9tsbcR8=;
 b=AEi0JhgJ/wano87gBRhR1tEZu/2EKduKDu6Ltn89c4up88D2DvP8uOVpNqsDXBFtnE
 uBotxUV1Gtcupqn+vwnQ//qkEuBYFfn9hAA4wfcNAvQjAmgdjCuFhd1GGP6T/Ewlm2E/
 JGXPzVAxru77FUj56UyGwJmL4Ut534V3QbOHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xCribZCwI3aUgI2eueSnhSAx0iK7WRTlleTX9tsbcR8=;
 b=V1GNkaLpaS1ns2CPuYpUQV8usTQp23xs0SY7LcYw+/J54euidqy98CNp4Az3XcqPsY
 9wp9A372itjesfwN1F2yf7cqEGsJY2lgMYsYNGtxE1FmGROFwUhHxotp6edMklwZxoE8
 Go5V4+rTmt+SoT835X4kEI4j9AjtsFqnAKO1mVmqY+b0Dw+P2zVHQ4mCgxSYHa+D1uZ9
 CITGBeX+Y2O6RI2aKgCdQG2amwTIP6GVUs5gYhAh/Eom3JVvaMQT7XBLGyEUsUEykl3I
 1H/GdNXhfcXIJdrFIeNvAzCSNbGkiO6RVEzkWnRahpM2HAl6LgfoL/CvBJasDXstmyGD
 mE4Q==
X-Gm-Message-State: AOAM530y558aSJj1Ijv2uPQTnIy5RIipDF3yTqXbR40v/ajx0lsw9CNW
 R4a2CBPD0/6NeRi1Iw/Z587dDyBFSzvAO2wp
X-Google-Smtp-Source: ABdhPJyKKkQ5Sn3LlEIAOp+pYCQMLBXLV3Rqf2bnTEOKXc6oZdqFUt1FUSyG1jw/hndeOdOxOW/8zw==
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr4194920wma.70.1602089075637; 
 Wed, 07 Oct 2020 09:44:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z191sm3332280wme.40.2020.10.07.09.44.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 09:44:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 02/13] drm/exynos: Use FOLL_LONGTERM for g2d cmdlists
Date: Wed,  7 Oct 2020 18:44:15 +0200
Message-Id: <20201007164426.1812530-3-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
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
ZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMKaW5kZXggYzgzZjZmYWFjOWRlLi41MTRmZDAwMGZlYjEg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9nMmQuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZzJkLmMKQEAgLTQ3OCw3ICs0Nzgs
OCBAQCBzdGF0aWMgZG1hX2FkZHJfdCAqZzJkX3VzZXJwdHJfZ2V0X2RtYV9hZGRyKHN0cnVjdCBn
MmRfZGF0YSAqZzJkLAogCQlnb3RvIGVycl9mcmVlOwogCX0KIAotCXJldCA9IHBpbl91c2VyX3Bh
Z2VzX2Zhc3Qoc3RhcnQsIG5wYWdlcywgRk9MTF9GT1JDRSB8IEZPTExfV1JJVEUsCisJcmV0ID0g
cGluX3VzZXJfcGFnZXNfZmFzdChzdGFydCwgbnBhZ2VzLAorCQkJCSAgRk9MTF9GT1JDRSB8IEZP
TExfV1JJVEUgfCBGT0xMX0xPTkdURVJNLAogCQkJCSAgZzJkX3VzZXJwdHItPnBhZ2VzKTsKIAlp
ZiAocmV0ICE9IG5wYWdlcykgewogCQlEUk1fREVWX0VSUk9SKGcyZC0+ZGV2LAotLSAKMi4yOC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
