Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1555326600
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 16:38:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C507689B65;
	Wed, 22 May 2019 14:36:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 928EC89193;
 Mon, 20 May 2019 18:57:17 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id r18so7109932pls.13;
 Mon, 20 May 2019 11:57:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=8Lt7rSnSkayzVvx67ZsDNX8yUH1XBDbeQw+L9abvZe8=;
 b=C+9WLhW0V3zVwjbWut4yTbOjgXsp81OYlfN89kfQv/2yaZVLI5BYYLAHcegAIMgNhQ
 EMErSDPL6DTREjipKLHkuvZjC+N0ZxexSqtqTBXQV8O0E4LQvFtGav+updtMX+B0zzkB
 oOSWdSU9TC0DPlmBuV6d3p48iPFqx9CDgWcBDlRTpwtr68vcPtLGX0SAjzTf6xACWamJ
 hgd/G8gk4qW8j3xqXEN8CIoaMXWAGmLjD+KBgdB6z2ieHTc2+3zmn6JKzMdk/YMPsanX
 9FG1+4eYSqro08WhH9TVMU4+ZG+RBjLdB/EOkEsjro4F+XmUROhXj1i7oCetAMBrkhMk
 sE2g==
X-Gm-Message-State: APjAAAVl6e+pA8iTkflGIYd9gRoTEwrYDt2lWIG6Kt3Im4izvE6Ivj1J
 T5cXc3ZpVkNeBhe18UC+ShE=
X-Google-Smtp-Source: APXvYqxVlxI+C53z9BfpApHBqX5Bh4zPMCrVSRk4CROsV3Nz+iH6IjFXfgCxjIhzf4CaBiwwWe3nUw==
X-Received: by 2002:a17:902:d896:: with SMTP id
 b22mr64516718plz.40.1558378637077; 
 Mon, 20 May 2019 11:57:17 -0700 (PDT)
Received: from jordon-HP-15-Notebook-PC.domain.name ([106.51.23.153])
 by smtp.gmail.com with ESMTPSA id k30sm13607075pgl.89.2019.05.20.11.57.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Mon, 20 May 2019 11:57:15 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: bskeggs@redhat.com, airlied@linux.ie, daniel@ffwll.ch, jglisse@redhat.com
Subject: [PATCH] drm/nouveau/svm: Convert to use hmm_range_fault()
Date: Tue, 21 May 2019 00:31:58 +0530
Message-Id: <1558378918-25279-1-git-send-email-jrdr.linux@gmail.com>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Wed, 22 May 2019 14:35:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=8Lt7rSnSkayzVvx67ZsDNX8yUH1XBDbeQw+L9abvZe8=;
 b=MmIoi8oqygXCLZy6E+9vNzH0H+XcQpdYN8P2HUH/MXWiF0urxOgo5E08QftQCPg6bx
 1YJ4p50CDP1Nph8zBNIQc7mL2PqtMChBUcWCTbJHNH43+tC3C1Hcm/mFCySjP+ImYnbV
 qqKhTuMgWXz3s3Shx9KcZqWOf4mvchFNq3FD48g3ALRHMHPOOOnUM++tgvnQ62pEGzsm
 h3USo901W3k+/b5bFvdhmwdDI9eZ3nfLz9t+1+L9qbtHHC6PUXRSkdgEu7bEGDiDbHjt
 /BMp2HqmwC7azDnhJNtLO3dnHe9f4mzljiAuXqMIROzSpk+Td5PadV9Kb9DQSDTZzkeS
 0msQ==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Souptick Joarder <jrdr.linux@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCB0byB1c2UgaG1tX3JhbmdlX2ZhdWx0KCkuCgpTaWduZWQtb2ZmLWJ5OiBTb3VwdGlj
ayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X3N2bS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
LCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9zdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKaW5kZXgg
OTNlZDQzYy4uOGQ1NmJkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9zdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCkBA
IC02NDksNyArNjQ5LDcgQEAgc3RydWN0IG5vdXZlYXVfc3ZtbSB7CiAJCXJhbmdlLnZhbHVlcyA9
IG5vdXZlYXVfc3ZtX3Bmbl92YWx1ZXM7CiAJCXJhbmdlLnBmbl9zaGlmdCA9IE5WSUZfVk1NX1BG
Tk1BUF9WMF9BRERSX1NISUZUOwogYWdhaW46Ci0JCXJldCA9IGhtbV92bWFfZmF1bHQoJnJhbmdl
LCB0cnVlKTsKKwkJcmV0ID0gaG1tX3JhbmdlX2ZhdWx0KCZyYW5nZSwgdHJ1ZSk7CiAJCWlmIChy
ZXQgPT0gMCkgewogCQkJbXV0ZXhfbG9jaygmc3ZtbS0+bXV0ZXgpOwogCQkJaWYgKCFobW1fdm1h
X3JhbmdlX2RvbmUoJnJhbmdlKSkgewotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
