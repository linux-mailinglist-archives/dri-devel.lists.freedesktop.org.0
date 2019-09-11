Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27346B0760
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:12:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834046E131;
	Thu, 12 Sep 2019 04:12:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDF826E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 18:14:12 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id k1so10506653pls.11
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 11:14:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L9IbDqUTGBygNy+oR2XxFsB0ml5gSNHNj1uTpRYIros=;
 b=jNAdqRlMkQxxxZg7jCR3i5ut1QUkgwtAzP2gGqqvT/VdvwIZatWxIJOdIFDCOb/LdC
 Mkf57kQdzlr4BzAEuef3gZLrxfdgTcVBsAlgEmgDUA6BVqZjcxWzF8Xyt+w54+qbDf+T
 g+R9jFJjLJRuPZDEXDDF9u+0r53buTsBGjlwf9AO4YaCm4QmijqNXJHvx1J0rsHc8SdX
 ehltxnxypoH03tFxN3nL7+fsLSi5RKiOA4fAZ7EIaizMCMvfK/R3XchtgHhhcLPTFvDp
 ICZjU/0dlxYNcunFNnqF3h/utpMXjRUXrjMJYArLKV6AbCF8/l7W9tdDTPNhHx3V9C16
 w+/w==
X-Gm-Message-State: APjAAAVo/IBIyC5uCvBJl2Uyvp73CTJ+VyAeMkXd+bpW6mcthN+PHgNE
 ndFgoueG5YxgUtGBXbJY/9YfW91J84s=
X-Google-Smtp-Source: APXvYqwrk8BaEtJFsri5kEZloNqGAXR5GggYYG0Cm6osA9TNijyLnXfzXL/Z4rcUfYAySwW+8Rlo8A==
X-Received: by 2002:a17:902:5ac3:: with SMTP id
 g3mr40522769plm.25.1568225652289; 
 Wed, 11 Sep 2019 11:14:12 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:e9ae:bd45:1bd9:e60d])
 by smtp.gmail.com with ESMTPSA id s18sm29288578pfh.0.2019.09.11.11.14.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2019 11:14:11 -0700 (PDT)
From: David Riley <davidriley@chromium.org>
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Subject: [PATCH v4 1/2] drm/virtio: Rewrite virtio_gpu_queue_ctrl_buffer using
 fenced version.
Date: Wed, 11 Sep 2019 11:14:02 -0700
Message-Id: <20190911181403.40909-2-davidriley@chromium.org>
X-Mailer: git-send-email 2.23.0.237.gc6a4ce50a0-goog
In-Reply-To: <20190829212417.257397-1-davidriley@chromium.org>
References: <20190829212417.257397-1-davidriley@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L9IbDqUTGBygNy+oR2XxFsB0ml5gSNHNj1uTpRYIros=;
 b=MhC7MN/apPQSoFA8X1UHoVchEHf+GZPkz3MgJqtM2HORK887vTnLMk7NLBjfOXS+VN
 sKTuF7MuJbbC6Oxd3wYiwhBVVhjsvZB+aIaJp2v5itq3fmCByv2MaptiY/SQkI00Q8Pa
 fBeFLKUkPcVMdadxPYSsrybRpDuaP6qLeH7/Q=
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RmFjdG9yIGZ1bmN0aW9uIGluIHByZXBhcmF0aW9uIHRvIGdlbmVyYXRpbmcgc2NhdHRlcmxpc3Qg
cHJpb3IgdG8gbG9ja2luZy4KClNpZ25lZC1vZmYtYnk6IERhdmlkIFJpbGV5IDxkYXZpZHJpbGV5
QGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYyB8
IDIwICsrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCsp
LCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfdnEuYyBiL2RyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV92cS5jCmluZGV4IDdm
ZDI4NTFmN2I5Ny4uNWE2NGM3NzYxMzhkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmly
dGlvL3ZpcnRncHVfdnEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEu
YwpAQCAtMzAyLDE4ICszMDIsNiBAQCBzdGF0aWMgYm9vbCB2aXJ0aW9fZ3B1X3F1ZXVlX2N0cmxf
YnVmZmVyX2xvY2tlZChzdHJ1Y3QgdmlydGlvX2dwdV9kZXZpY2UgKnZnZGV2LAogCXJldHVybiBu
b3RpZnk7CiB9CiAKLXN0YXRpYyB2b2lkIHZpcnRpb19ncHVfcXVldWVfY3RybF9idWZmZXIoc3Ry
dWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKLQkJCQkJIHN0cnVjdCB2aXJ0aW9fZ3B1X3Zi
dWZmZXIgKnZidWYpCi17Ci0JYm9vbCBub3RpZnk7Ci0KLQlzcGluX2xvY2soJnZnZGV2LT5jdHJs
cS5xbG9jayk7Ci0Jbm90aWZ5ID0gdmlydGlvX2dwdV9xdWV1ZV9jdHJsX2J1ZmZlcl9sb2NrZWQo
dmdkZXYsIHZidWYpOwotCXNwaW5fdW5sb2NrKCZ2Z2Rldi0+Y3RybHEucWxvY2spOwotCWlmIChu
b3RpZnkpCi0JCXZpcnRxdWV1ZV9ub3RpZnkodmdkZXYtPmN0cmxxLnZxKTsKLX0KLQogc3RhdGlj
IHZvaWQgdmlydGlvX2dwdV9xdWV1ZV9mZW5jZWRfY3RybF9idWZmZXIoc3RydWN0IHZpcnRpb19n
cHVfZGV2aWNlICp2Z2RldiwKIAkJCQkJCXN0cnVjdCB2aXJ0aW9fZ3B1X3ZidWZmZXIgKnZidWYs
CiAJCQkJCQlzdHJ1Y3QgdmlydGlvX2dwdV9jdHJsX2hkciAqaGRyLApAQCAtMzM5LDcgKzMyNyw3
IEBAIHN0YXRpYyB2b2lkIHZpcnRpb19ncHVfcXVldWVfZmVuY2VkX2N0cmxfYnVmZmVyKHN0cnVj
dCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsCiAJCWdvdG8gYWdhaW47CiAJfQogCi0JaWYgKGZl
bmNlKSB7CisJaWYgKGhkciAmJiBmZW5jZSkgewogCQl2aXJ0aW9fZ3B1X2ZlbmNlX2VtaXQodmdk
ZXYsIGhkciwgZmVuY2UpOwogCQlpZiAodmJ1Zi0+b2JqcykgewogCQkJdmlydGlvX2dwdV9hcnJh
eV9hZGRfZmVuY2UodmJ1Zi0+b2JqcywgJmZlbmNlLT5mKTsKQEAgLTM1Miw2ICszNDAsMTIgQEAg
c3RhdGljIHZvaWQgdmlydGlvX2dwdV9xdWV1ZV9mZW5jZWRfY3RybF9idWZmZXIoc3RydWN0IHZp
cnRpb19ncHVfZGV2aWNlICp2Z2RldiwKIAkJdmlydHF1ZXVlX25vdGlmeSh2Z2Rldi0+Y3RybHEu
dnEpOwogfQogCitzdGF0aWMgdm9pZCB2aXJ0aW9fZ3B1X3F1ZXVlX2N0cmxfYnVmZmVyKHN0cnVj
dCB2aXJ0aW9fZ3B1X2RldmljZSAqdmdkZXYsCisJCQkJCSBzdHJ1Y3QgdmlydGlvX2dwdV92YnVm
ZmVyICp2YnVmKQoreworCXZpcnRpb19ncHVfcXVldWVfZmVuY2VkX2N0cmxfYnVmZmVyKHZnZGV2
LCB2YnVmLCBOVUxMLCBOVUxMKTsKK30KKwogc3RhdGljIHZvaWQgdmlydGlvX2dwdV9xdWV1ZV9j
dXJzb3Ioc3RydWN0IHZpcnRpb19ncHVfZGV2aWNlICp2Z2RldiwKIAkJCQkgICAgc3RydWN0IHZp
cnRpb19ncHVfdmJ1ZmZlciAqdmJ1ZikKIHsKLS0gCjIuMjMuMC4xNjIuZzBiOWZiYjM3MzQtZ29v
ZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
