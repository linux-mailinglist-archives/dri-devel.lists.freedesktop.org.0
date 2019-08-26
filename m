Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 238979D218
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 16:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC8B989FA9;
	Mon, 26 Aug 2019 14:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919EF89F43
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 14:57:36 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id k2so15653235wrq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 07:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vRxenyuPXTsYnahqRGyH5Yj5fC/fTi1KqSFOQ4JZ9Gw=;
 b=jUlPF2ezVVg/r9qkiJitbcUMfCPkAQY6H/dx9YSOi5/nLAxA8ZThQHXXbKBk++dxkZ
 GgoL1oF5mavXRjXPwSvIiqI9zPrZRBs6hXFkgYNtU/LhCP/J7Q1KPUgzZukiFAXFVCot
 bsUVIm+fP9366BOxGQvsTWDtTQbKBIpWjpTQTd9lFK8USr2rc/bS7DwAy/jqQisBOF+I
 SGBRNe6isalummNdizFtEir7H/9FZpHUXlyWIThsX96dTJ7UtIOO4iZBPXC9NDRhRCVw
 gePk/U7xQrj/pFRJcm4rnSq4qRbmo9UuoB82Vt/R5jIb8KREssIOOfz2MPjcNxGAEQic
 7Huw==
X-Gm-Message-State: APjAAAXCdXlH0HHcwI43DTNjuJi/T77OfHkp6PzKXtQ1ruDWfXyRBdxd
 GzEVghF2pDcNmuy/7fNWxXBJJQmn
X-Google-Smtp-Source: APXvYqwyavJtqHKKFG9/Pq0hDSbK0sjA/XLM8TXsnzlM+VWfYqXqebeBxy61gjNb6QCvvBU9C7spAg==
X-Received: by 2002:a5d:4f81:: with SMTP id d1mr23121481wru.177.1566831455056; 
 Mon, 26 Aug 2019 07:57:35 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0e3:7a12:98e5:ca6])
 by smtp.gmail.com with ESMTPSA id z8sm9865624wmi.7.2019.08.26.07.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Aug 2019 07:57:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 daniel.vetter@ffwll.ch, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/9] dma-buf: make to_dma_fence_array NULL safe
Date: Mon, 26 Aug 2019 16:57:24 +0200
Message-Id: <20190826145731.1725-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190826145731.1725-1-christian.koenig@amd.com>
References: <20190826145731.1725-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vRxenyuPXTsYnahqRGyH5Yj5fC/fTi1KqSFOQ4JZ9Gw=;
 b=qeKxET1vWhHPxQ4iunIz2aRkITtcG3b5AeVbzHcW4ifXzqW3KpSvJ9pZ4oqhPbCVfj
 ADPodVrn1rXgU69JzhEGWn2gJKYQbhy5XDfe80WtLei5vSkILKPpVjYn5zP8mYySNZEv
 94qANYWZD2RJtXmAPRnXDSnEctm2rJwmr8Jz3UjSCo3G380pseH+lRKpVlkXHBuF1405
 QgPwGRUQmki4DXe1SsGWAkLqIVqAuSBieDAoi1UwNGdONU9a4K+WwKkoU8LSW3aWnhfa
 ge17YnTn/9nMsItOI3esrJJKmP33xxw4WNjCBpJOAW44Iu880kH0zH6rnU3f0bfG7510
 rc8w==
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBiaXQgc3VycHJpc2luZyB0aGF0IHRoaXMgd2Fzbid0IGFscmVhZHkgdGhlIGNhc2UuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0t
LQogaW5jbHVkZS9saW51eC9kbWEtZmVuY2UtYXJyYXkuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvZG1hLWZlbmNlLWFycmF5LmggYi9pbmNsdWRlL2xpbnV4L2RtYS1mZW5jZS1hcnJheS5oCmlu
ZGV4IDMwM2RkNzEyMjIwZi4uZjk5Y2Q3ZWIyNGUwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4
L2RtYS1mZW5jZS1hcnJheS5oCisrKyBiL2luY2x1ZGUvbGludXgvZG1hLWZlbmNlLWFycmF5LmgK
QEAgLTY4LDcgKzY4LDcgQEAgc3RhdGljIGlubGluZSBib29sIGRtYV9mZW5jZV9pc19hcnJheShz
dHJ1Y3QgZG1hX2ZlbmNlICpmZW5jZSkKIHN0YXRpYyBpbmxpbmUgc3RydWN0IGRtYV9mZW5jZV9h
cnJheSAqCiB0b19kbWFfZmVuY2VfYXJyYXkoc3RydWN0IGRtYV9mZW5jZSAqZmVuY2UpCiB7Ci0J
aWYgKGZlbmNlLT5vcHMgIT0gJmRtYV9mZW5jZV9hcnJheV9vcHMpCisJaWYgKCFmZW5jZSB8fCBm
ZW5jZS0+b3BzICE9ICZkbWFfZmVuY2VfYXJyYXlfb3BzKQogCQlyZXR1cm4gTlVMTDsKIAogCXJl
dHVybiBjb250YWluZXJfb2YoZmVuY2UsIHN0cnVjdCBkbWFfZmVuY2VfYXJyYXksIGJhc2UpOwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
