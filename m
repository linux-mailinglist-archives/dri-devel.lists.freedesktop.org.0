Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F48B5C4B0
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:58:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F9E89C68;
	Mon,  1 Jul 2019 20:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F41889C89;
 Mon,  1 Jul 2019 17:39:10 +0000 (UTC)
Received: by mail-pl1-x643.google.com with SMTP id 9so6945624ple.5;
 Mon, 01 Jul 2019 10:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DQhkAGsy/6JPfkNxr2zd1jyzBxMaKFsuRKGwZutl7JA=;
 b=VDGjJs+yntemoI6xeOHSMVcLz9QyAP8a+wiOJju91YtRo4PhpLEZHv7vAEqgLctwJt
 NYrCVxQSRuKFIf/QIQatsBG36DExp0gre3ry+BXIqtx3b3lC8L5Zh1ftvbD6QGLsSZZT
 cm63ppnzbl36fS0M9t8+syOmsFQyelo882bA8EAW+JSOe515uiJ2QLpWD4DuOD13PV5p
 d7AGGLRSvSkOjV+uj+at4DJl6DefZ1nNLJsgPhzVsPEpPD3dZv8IUmNKXHpZI4j+mT8X
 kpZin9KVTQnXmiut5QUH9NUFEBgEWioBk/sQVTeAxL8+YLb36+HQUucKvPV2dvAHvX/R
 J8XQ==
X-Gm-Message-State: APjAAAVOZ/1aBdDhV+axl5huF6TZcdW/cZwrMjjFvVgE24kNFmBzfeIl
 mWqK+t4mXVePKfXA9K0GMI2V2eBy
X-Google-Smtp-Source: APXvYqwRhIXWsH30plxtznqtrwdmPDUuYj3MEWHr4h3Gg5fNdDluDo1HsfjxDICGKCzzl3XaEDGNjQ==
X-Received: by 2002:a17:902:6b0c:: with SMTP id
 o12mr29372672plk.113.1562002750002; 
 Mon, 01 Jul 2019 10:39:10 -0700 (PDT)
Received: from aw-bldr-10.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id j21sm11847091pfh.86.2019.07.01.10.39.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Jul 2019 10:39:09 -0700 (PDT)
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
To: robdclark@gmail.com, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH] drm/msm/mdp5: Use drm_device for creating gem address space
Date: Mon,  1 Jul 2019 10:39:07 -0700
Message-Id: <20190701173907.15494-1-jeffrey.l.hugo@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=DQhkAGsy/6JPfkNxr2zd1jyzBxMaKFsuRKGwZutl7JA=;
 b=vMWOV/3HGgdAF44jQmXJfaAWcFy7psRn6BhV081TbnqYfVHuWi7qeLTNGWMWGbBnNj
 ihG+iWJVihKUZUp/Njk1DMAR/86Gbx6123S+32Qmd/xMqBNn4TDFHwHHiz/VzVJhfP0m
 jze3vu1Jr9qht/LfQKtEz7pny3bb0ieCY7cmfTFxMQpxgJe0iC1BaGv6OE9a02LDABlS
 zQWGTJJNIx0qXNLVOM5AwKg/hRwbD8FDxCoqb76qeha/aK/e9L5HNkqHPsiNjfvNNSiS
 Y4DWjvViqOvQyJvQo/Wp2uMmH/FcgEurUloeS2OHUDKPItEDb1kt2VPdnoB8i7WXCdwl
 eqIw==
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
Cc: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, freedreno@lists.freedesktop.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3JlYXRpbmcgdGhlIG1zbSBnZW0gYWRkcmVzcyBzcGFjZSByZXF1aXJlcyBhIHJlZmVyZW5jZSB0
byB0aGUgZGV2IHdoZXJlCnRoZSBpb21tdSBpcyBsb2NhdGVkLiAgVGhlIGRyaXZlciBjdXJyZW50
bHkgYXNzdW1lcyB0aGlzIGlzIHRoZSBzYW1lIGFzCnRoZSBwbGF0Zm9ybSBkZXZpY2UsIHdoaWNo
IGJyZWFrcyB3aGVuIHRoZSBpb21tdSBpcyBvdXRzaWRlIG9mIHRoZQpwbGF0Zm9ybSBkZXZpY2Uu
ICBVc2UgdGhlIGRybV9kZXZpY2UgaW5zdGVhZCwgd2hpY2ggaGFwcGVucyB0byBhbHdheXMgaGF2
ZQphIHJlZmVyZW5jZSB0byB0aGUgcHJvcGVyIGRldmljZS4KClNpZ25lZC1vZmYtYnk6IEplZmZy
ZXkgSHVnbyA8amVmZnJleS5sLmh1Z29AZ21haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9t
c20vZGlzcC9tZHA1L21kcDVfa21zLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvbWRwNS9tZHA1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9r
bXMuYwppbmRleCA0YTYwZjVmY2E2YjAuLjEzNDdhNTIyMzkxOCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jCkBAIC03MDIsNyArNzAyLDcgQEAgc3RydWN0IG1zbV9r
bXMgKm1kcDVfa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldikKIAltZGVsYXkoMTYpOwog
CiAJaWYgKGNvbmZpZy0+cGxhdGZvcm0uaW9tbXUpIHsKLQkJYXNwYWNlID0gbXNtX2dlbV9hZGRy
ZXNzX3NwYWNlX2NyZWF0ZSgmcGRldi0+ZGV2LAorCQlhc3BhY2UgPSBtc21fZ2VtX2FkZHJlc3Nf
c3BhY2VfY3JlYXRlKGRldi0+ZGV2LAogCQkJCWNvbmZpZy0+cGxhdGZvcm0uaW9tbXUsICJtZHA1
Iik7CiAJCWlmIChJU19FUlIoYXNwYWNlKSkgewogCQkJcmV0ID0gUFRSX0VSUihhc3BhY2UpOwot
LSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
