Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C90109772
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 02:11:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64E96E1D5;
	Tue, 26 Nov 2019 01:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C746E1CD
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2019 01:11:27 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id e6so8084259pgi.11
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 17:11:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CYXA6kZl83KUkaRjWD+JnO5e82OiZcDqxj3GwOxeRBY=;
 b=iqEH2cR4dJDe1GObdkyS0FD7aF3sKd4LjStKKRM2ODrRXcn4DRa9rPSe+w6sMEu2Jl
 yb7Iit8Hf8HtAN36W+2NqVBtd26z7DdyalM4LA8t6TQGysrN0iaH5HoBnKbUAkaeMPxz
 wPA16Lj/kBLl0bgbYu9jBVi01L+pYV6ELqDwOkVc0drAq1zqkJJwbwgnNxjuOpBxK/5f
 dFeCAlLYJPXtdqKZd0Svw0l4RG2PmO69C5RkkH41e1/G8YR+iWk5wnj1GyghUh+IatgY
 UTS/UMj0nc6n9q/p6VYQ3oLloe5c4LWA/koWK/qXG7+gw8j/cBNcJTm7r864At18XfIb
 Nx7Q==
X-Gm-Message-State: APjAAAXUb3jkm0F4sl3D5xgQk3Kw4d3pLlMWK5ift7bsDnDP19KmK1T7
 BEmVzN3tNjKTbTnzl1KhskFv4CT/Z54=
X-Google-Smtp-Source: APXvYqzlyN/MCu+DrmSpqR7YLQUp4bzlhPY64TLP0MkSXLWhsf/u/1XCaFm0y1S9airAT5joPOJsbQ==
X-Received: by 2002:a62:1454:: with SMTP id 81mr37846295pfu.86.1574730687027; 
 Mon, 25 Nov 2019 17:11:27 -0800 (PST)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id z10sm9672903pgg.39.2019.11.25.17.11.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 25 Nov 2019 17:11:26 -0800 (PST)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/5] udmabuf: add a pointer to the miscdevice in dma-buf
 private data
Date: Mon, 25 Nov 2019 17:10:54 -0800
Message-Id: <20191126011056.67928-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191126011056.67928-1-gurchetansingh@chromium.org>
References: <20191126011056.67928-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CYXA6kZl83KUkaRjWD+JnO5e82OiZcDqxj3GwOxeRBY=;
 b=j7iti68QtnuSNuDgccVp4afXbu157fbYcx9OC/PLMkVz6Iq5pgNGbzZ1jGtJl3fOGk
 dzxTqhAtFVFmun2MK7Q98ovXuqklQZMTvFd7BM/DplHIMeousQKDHK2Gk0caEdV84S/Z
 t73z4ZdEibBRzwBx55nDIiGKQITUI4tYb4Oy8=
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
Cc: Gurchetan Singh <gurchetansingh@chromium.org>, kraxel@redhat.com,
 hch@lst.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2lsbCBiZSB1c2VkIGxhdGVyLgoKdjI6IHJlbmFtZSAndWRtYWJ1Zl9taXNjJyB0byAnZGV2aWNl
JyAoa3JheGVsKQoKU2lnbmVkLW9mZi1ieTogR3VyY2hldGFuIFNpbmdoIDxndXJjaGV0YW5zaW5n
aEBjaHJvbWl1bS5vcmc+Ci0tLQogZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyB8IDEyICsrKysr
KysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5jIGIvZHJpdmVycy9kbWEtYnVm
L3VkbWFidWYuYwppbmRleCBjZTljYWFhYTllNGIuLjllNmZkZDJiYzk3OSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYworKysgYi9kcml2ZXJzL2RtYS1idWYvdWRtYWJ1Zi5j
CkBAIC0xOSw2ICsxOSw3IEBAIHN0cnVjdCB1ZG1hYnVmIHsKIAl1MzIgZmxhZ3M7CiAJcGdvZmZf
dCBwYWdlY291bnQ7CiAJc3RydWN0IHBhZ2UgKipwYWdlczsKKwlzdHJ1Y3QgbWlzY2RldmljZSAq
ZGV2aWNlOwogfTsKIAogc3RhdGljIHZtX2ZhdWx0X3QgdWRtYWJ1Zl92bV9mYXVsdChzdHJ1Y3Qg
dm1fZmF1bHQgKnZtZikKQEAgLTEyNyw4ICsxMjgsOSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRt
YV9idWZfb3BzIHVkbWFidWZfb3BzID0gewogI2RlZmluZSBTRUFMU19XQU5URUQgKEZfU0VBTF9T
SFJJTkspCiAjZGVmaW5lIFNFQUxTX0RFTklFRCAoRl9TRUFMX1dSSVRFKQogCi1zdGF0aWMgbG9u
ZyB1ZG1hYnVmX2NyZWF0ZShjb25zdCBzdHJ1Y3QgdWRtYWJ1Zl9jcmVhdGVfbGlzdCAqaGVhZCwK
LQkJCSAgIGNvbnN0IHN0cnVjdCB1ZG1hYnVmX2NyZWF0ZV9pdGVtICpsaXN0KQorc3RhdGljIGxv
bmcgdWRtYWJ1Zl9jcmVhdGUoc3RydWN0IG1pc2NkZXZpY2UgKmRldmljZSwKKwkJCSAgIHN0cnVj
dCB1ZG1hYnVmX2NyZWF0ZV9saXN0ICpoZWFkLAorCQkJICAgc3RydWN0IHVkbWFidWZfY3JlYXRl
X2l0ZW0gKmxpc3QpCiB7CiAJREVGSU5FX0RNQV9CVUZfRVhQT1JUX0lORk8oZXhwX2luZm8pOwog
CXN0cnVjdCBmaWxlICptZW1mZCA9IE5VTEw7CkBAIC0yMDAsNiArMjAyLDggQEAgc3RhdGljIGxv
bmcgdWRtYWJ1Zl9jcmVhdGUoY29uc3Qgc3RydWN0IHVkbWFidWZfY3JlYXRlX2xpc3QgKmhlYWQs
CiAJZXhwX2luZm8uZmxhZ3MgPSBPX1JEV1I7CiAKIAl1YnVmLT5mbGFncyA9IGhlYWQtPmZsYWdz
OworCXVidWYtPmRldmljZSA9IGRldmljZTsKKwogCWJ1ZiA9IGRtYV9idWZfZXhwb3J0KCZleHBf
aW5mbyk7CiAJaWYgKElTX0VSUihidWYpKSB7CiAJCXJldCA9IFBUUl9FUlIoYnVmKTsKQEAgLTIz
Nyw3ICsyNDEsNyBAQCBzdGF0aWMgbG9uZyB1ZG1hYnVmX2lvY3RsX2NyZWF0ZShzdHJ1Y3QgZmls
ZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCiAJbGlzdC5vZmZzZXQgPSBjcmVhdGUub2Zmc2V0
OwogCWxpc3Quc2l6ZSAgID0gY3JlYXRlLnNpemU7CiAKLQlyZXR1cm4gdWRtYWJ1Zl9jcmVhdGUo
JmhlYWQsICZsaXN0KTsKKwlyZXR1cm4gdWRtYWJ1Zl9jcmVhdGUoZmlscC0+cHJpdmF0ZV9kYXRh
LCAmaGVhZCwgJmxpc3QpOwogfQogCiBzdGF0aWMgbG9uZyB1ZG1hYnVmX2lvY3RsX2NyZWF0ZV9s
aXN0KHN0cnVjdCBmaWxlICpmaWxwLCB1bnNpZ25lZCBsb25nIGFyZykKQEAgLTI1Niw3ICsyNjAs
NyBAQCBzdGF0aWMgbG9uZyB1ZG1hYnVmX2lvY3RsX2NyZWF0ZV9saXN0KHN0cnVjdCBmaWxlICpm
aWxwLCB1bnNpZ25lZCBsb25nIGFyZykKIAlpZiAoSVNfRVJSKGxpc3QpKQogCQlyZXR1cm4gUFRS
X0VSUihsaXN0KTsKIAotCXJldCA9IHVkbWFidWZfY3JlYXRlKCZoZWFkLCBsaXN0KTsKKwlyZXQg
PSB1ZG1hYnVmX2NyZWF0ZShmaWxwLT5wcml2YXRlX2RhdGEsICZoZWFkLCBsaXN0KTsKIAlrZnJl
ZShsaXN0KTsKIAlyZXR1cm4gcmV0OwogfQotLSAKMi4yNC4wLjQzMi5nOWQzZjVmNWI2My1nb29n
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
