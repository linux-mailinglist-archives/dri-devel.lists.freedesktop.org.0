Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB609D6312
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 14:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 366CE6E2D7;
	Mon, 14 Oct 2019 12:51:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0625E6E2D1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 12:51:24 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id y21so16640829wmi.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 05:51:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=T0xL/iDkEL+mRgHC/hRILKSEGgtjkYP7/04WXy0TU5c=;
 b=W2TJ4PPpsL7NASsagkdGmBWQuStTZmX8Czrab2i2fNMeUCWTdPI0NHEHQf8Pd40J+b
 vWNtZCAD/AVP01uX+CRWoNqJktkQArvaxDNLvRzGB3F/bDhJhL9EJ1meklMon+AktNd/
 aN4+2mvi+oGVPHjfufjTW7MjvbeEDWy9ZyXWQeMfwBhp6gir5W05biXnoPMqVA3TRjVF
 ImQODvqIAsawBr7zdy/TK5+fTJdI19UG4Z1ABiimMmhHw8OyYUXBXYR8zT0m5L+9179Q
 lnue7Rzzz/AZiglWYPMX4wZLccpiZdvAdIlk/JcAR/NskFBMcekDxFKLDHeaoqQc1u4b
 SnUQ==
X-Gm-Message-State: APjAAAVCGnKWpZcLdMdRlmy7R+cRvBXFJFIQ6MqfNXKqXzPnkI4qDZbA
 +91Z04AjJvh3rjPJLuwX1mw=
X-Google-Smtp-Source: APXvYqy4hQZbCr4bXF44azC0xINbKmfHk3TGROlTqQmbYp9gts0pMzgY0rJb683HGAO9RY464ZaW0Q==
X-Received: by 2002:a1c:f60d:: with SMTP id w13mr15847792wmc.150.1571057481904; 
 Mon, 14 Oct 2019 05:51:21 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id a192sm16440939wma.1.2019.10.14.05.51.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 05:51:20 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 14/14] drm/tegra: gem: Use sg_alloc_table_from_pages()
Date: Mon, 14 Oct 2019 14:50:49 +0200
Message-Id: <20191014125049.425101-15-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014125049.425101-1-thierry.reding@gmail.com>
References: <20191014125049.425101-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=T0xL/iDkEL+mRgHC/hRILKSEGgtjkYP7/04WXy0TU5c=;
 b=oQ2Y1lnIBaHHF4NPbEeUhTFXJAFOjbYO1SZBlITCO+R2+00RLcbPQU3SF9W5KAKV1d
 JuEtjQFDwm0IhwXV8fZ3d0Pc3sSMUnUrhyziBQKy97RFxdEGMOxENwpW8SqOuGKuDgvE
 wAUkkwB2HFFyiWo9wc5zLjuJ3ThbdZyaaEKX+JMVtf4tPpElZkZ1zr85Ymmiiz9x9tx0
 dTERRZ3SR9eL/8wzZn0yW9npRXzj5FHKao8F3ffjJEbbLs0glkFZHjmYLYE3xNa7L/pd
 ByUbsXvO6xnUXoBHvna2lv3zdugigTJ1RlC7HM7WXviadepy4eiDCETOEYzZLqId1UVG
 DujQ==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkluc3RlYWQgb2YgbWFu
dWFsbHkgY3JlYXRpbmcgdGhlIFNHIHRhYmxlIGZvciBhIGRpc2NvbnRpZ3VvdXMgYnVmZmVyLAp1
c2UgdGhlIGV4aXN0aW5nIHNnX2FsbG9jX3RhYmxlX2Zyb21fcGFnZXMoKS4gTm90ZSB0aGF0IHRo
aXMgaXMgbm90IHNhZmUKdG8gYmUgdXNlZCB3aXRoIHRoZSBBUk0gRE1BL0lPTU1VIGludGVncmF0
aW9uIGNvZGUgYmVjYXVzZSB0aGF0IHdpbGwgbm90CmVuc3VyZSB0aGF0IHRoZSB3aG9sZSBidWZm
ZXIgaXMgbWFwcGVkIGNvbnRpZ3VvdXNseS4gRGVwZW5kaW5nIG9uIHRoZQpzaXplIG9mIHRoZSBp
bmRpdmlkdWFsIGVudHJpZXMgdGhlIG1hcHBpbmcgbWF5IGVuZCB1cCBjb250YWluaW5nIGhvbGVz
CnRvIGVuc3VyZSBhbGlnbm1lbnQuCgpIb3dldmVyLCB3ZSBvbmx5IGV2ZXIgdXNlIHRoZXNlIGJ1
ZmZlcnMgd2l0aCBleHBsaWNpdCBJT01NVSBBUEkgdXNhZ2UKYW5kIGtub3cgaG93IHRvIGF2b2lk
IHRoZXNlIGhvbGVzLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZp
ZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMgfCA5ICsrLS0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEv
Z2VtLmMKaW5kZXggMDA3MDFjYWRhY2ViLi5kMmY4OGNjMzEzNGYgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS90ZWdyYS9nZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZ2VtLmMK
QEAgLTUwOCwxNCArNTA4LDkgQEAgdGVncmFfZ2VtX3ByaW1lX21hcF9kbWFfYnVmKHN0cnVjdCBk
bWFfYnVmX2F0dGFjaG1lbnQgKmF0dGFjaCwKIAkJcmV0dXJuIE5VTEw7CiAKIAlpZiAoYm8tPnBh
Z2VzKSB7Ci0JCXN0cnVjdCBzY2F0dGVybGlzdCAqc2c7Ci0JCXVuc2lnbmVkIGludCBpOwotCi0J
CWlmIChzZ19hbGxvY190YWJsZShzZ3QsIGJvLT5udW1fcGFnZXMsIEdGUF9LRVJORUwpKQorCQlp
ZiAoc2dfYWxsb2NfdGFibGVfZnJvbV9wYWdlcyhzZ3QsIGJvLT5wYWdlcywgYm8tPm51bV9wYWdl
cywKKwkJCQkJICAgICAgMCwgZ2VtLT5zaXplLCBHRlBfS0VSTkVMKSA8IDApCiAJCQlnb3RvIGZy
ZWU7Ci0KLQkJZm9yX2VhY2hfc2coc2d0LT5zZ2wsIHNnLCBiby0+bnVtX3BhZ2VzLCBpKQotCQkJ
c2dfc2V0X3BhZ2Uoc2csIGJvLT5wYWdlc1tpXSwgUEFHRV9TSVpFLCAwKTsKIAl9IGVsc2Ugewog
CQlpZiAoZG1hX2dldF9zZ3RhYmxlKGF0dGFjaC0+ZGV2LCBzZ3QsIGJvLT52YWRkciwgYm8tPmlv
dmEsCiAJCQkJICAgIGdlbS0+c2l6ZSkgPCAwKQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
