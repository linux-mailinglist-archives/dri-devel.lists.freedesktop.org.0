Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 650C32A03CC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 12:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745656EDBA;
	Fri, 30 Oct 2020 11:13:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5CC6EDBA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 11:13:04 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id bn26so8046650ejb.6
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Oct 2020 04:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pOW3vGKBRnjjFvjvmnRK3Bz+jI8Oxj9l9KBtdUt/uOs=;
 b=CxYfotzWGSQV4n18twMJLyZsD9vKNMqi0n1lJ6ZJMvHKxhGx3ChIRg5O/vQSnVcfoU
 2eVIeMnHrUkLxmbkskw/bCwx7WgM+WUdnDVHub+/muilIuWYSp+YrHWN8RjeTwTcvDDH
 MVfZQNcd3X/2Fmsgqm2y+kYI3WFHJRDZE7i6pAqRKUHyUb/pHojmb/3YJSvQS0SFRzuA
 2rLDG8ypzawB5ZiIiGGsNxGUzAwVGknc0xMOPJB/8jc/PXIYj9f3zm7oK1cSgSOk3sji
 wN5nLLQUoaF2KwoCdaZBQZjQoQxzJcVe5DS/ei32hbIQ1oRhBqhVP9e+qLLAdSs47IXT
 9Z9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pOW3vGKBRnjjFvjvmnRK3Bz+jI8Oxj9l9KBtdUt/uOs=;
 b=sNUbvx2+Ift6t/p4OGBRW4aKIWIoI3lpckM4dM/+ooGU7VNn9WbFRhk8IeemCY4R4e
 HFcfVvWkimSsioc7V0EkQsZV2XvNVeU+G625JCSGICu4zgqf2pivnP7eicagq6NYLRfT
 mGy0d3+fnQoPiC7SmthqDh3ftTPIjOr0+DOjOo/R+vVZYr6XH3dWeCc3tvli/b+RAYx9
 a867Ex3u2pWse8N3Vy8dEHgpGBon1kcGfNmX/dF1fA5DWDSZK3zhJPCC2nyVbAtnPvWr
 ZDVwFTy9QHHodtVgJrNP7p80uB+/AHfzWJdoMZrvElCzKJXJ96jedW03q3JrkYa6Y9Jl
 KNrw==
X-Gm-Message-State: AOAM531FOSSMY0Qw1MPaXgf/4tuMrVUVftnmb6EjkHpmoxXsF+LRErLr
 T7+Zmhg0MRlnDVx4JyPs1+oSGSzTTSI=
X-Google-Smtp-Source: ABdhPJxe2DImzlAqfx7WG0yXkUmAMNNn987fElrUt4oyXff0SbcswnSCN8+txFWQ/b1z5BHO3/MrAA==
X-Received: by 2002:a17:906:d7b9:: with SMTP id
 pk25mr1856264ejb.486.1604056382520; 
 Fri, 30 Oct 2020 04:13:02 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:19c6:1a14:8b0e:14ec])
 by smtp.gmail.com with ESMTPSA id y1sm2971657edj.76.2020.10.30.04.13.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Oct 2020 04:13:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/nouveu: fix swiotlb include
Date: Fri, 30 Oct 2020 12:13:01 +0100
Message-Id: <20201030111301.13458-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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
Cc: sfr@canb.auug.org.au
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNoZWNrIGZvciBzd2lvdGxiIGhhcyBtb3ZlZCB0byBub3V2ZXVfdHRtLmMsIGJ1dCB3ZSBm
b3Jnb3QgdG8gbW92ZQp0aGUgaW5jbHVkZSBhcyB3ZWxsLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfYm8uYyAgfCAxIC0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfdHRtLmMgfCAzICsrKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKaW5kZXggNzQ2YzA2
ZWQxOTViLi44MTMzMzc3ZDg2NWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfYm8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMK
QEAgLTI4LDcgKzI4LDYgQEAKICAqLwogCiAjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBpbmcuaD4K
LSNpbmNsdWRlIDxsaW51eC9zd2lvdGxiLmg+CiAKICNpbmNsdWRlICJub3V2ZWF1X2Rydi5oIgog
I2luY2x1ZGUgIm5vdXZlYXVfY2hhbi5oIgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRt
LmMKaW5kZXggZDY5NmQ4ODJjOWViLi4yYmYzNjIyOWRkNTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV90dG0uYwpAQCAtMjIsNiArMjIsOSBAQAogICogT1RIRVJXSVNFLCBBUklTSU5H
IEZST00sIE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRQog
ICogVVNFIE9SIE9USEVSIERFQUxJTkdTIElOIFRIRSBTT0ZUV0FSRS4KICAqLworCisjaW5jbHVk
ZSA8bGludXgvc3dpb3RsYi5oPgorCiAjaW5jbHVkZSAibm91dmVhdV9kcnYuaCIKICNpbmNsdWRl
ICJub3V2ZWF1X2dlbS5oIgogI2luY2x1ZGUgIm5vdXZlYXVfbWVtLmgiCi0tIAoyLjE3LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
