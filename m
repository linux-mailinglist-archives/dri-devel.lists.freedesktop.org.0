Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92682474FF
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:02:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E67189265;
	Sun, 16 Jun 2019 14:02:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A079C892FE;
 Fri, 14 Jun 2019 11:28:20 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id x15so1305472pfq.0;
 Fri, 14 Jun 2019 04:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=T6oFXDd7RFgkDhvVzkPX+FeD473fViFpef2JxosV0BQ=;
 b=mVCZWu32aC5k8LEC6gLKbTb7i3PIEuf2le/kPYBCGxl1cNJG3Pn9A/pyaIJIuSnpHf
 mLAcw9p8kt3wA45FjOQvtbSiu6xwLEPwJ6caO54/UWeN6PBA3Lo8cPUuVlLkjr4GxEf7
 xT+ExzafSe8t2GDAARFSPK8iDPPlYKQ7kNntRVNFOG1hAP6D1KoLVUIsxKUtxo2huBP+
 hilMP4HlKzbbu3deTvuaRa1gB7yczsX1MDjpDBOuGTV2AHpD49CVtRotXUesMQ+z/ZOt
 M/l8vhS/xnD9BCoO4JAIJIECtmwChFu1hLPTxrEV8plDyqTSHGUjg3lE7MmZhQKIzHRQ
 Egtg==
X-Gm-Message-State: APjAAAWSZxo48m7efSjK42Odkf7FQft8iknAjXMW1bj+eOdJAJfpERbT
 RhF0J1e2HBxNzT3Vi0OCS6I=
X-Google-Smtp-Source: APXvYqwPYqScXoW9ZuO5k06QZdNzmPdYb8Qc3R9ESnIh+b5Es9GZM2ARs5/8AIxFKMBcfwZjbTq/4w==
X-Received: by 2002:a17:90a:23a4:: with SMTP id
 g33mr10930800pje.115.1560511700146; 
 Fri, 14 Jun 2019 04:28:20 -0700 (PDT)
Received: from xy-data.openstacklocal ([159.138.22.150])
 by smtp.gmail.com with ESMTPSA id t11sm2205147pgp.1.2019.06.14.04.28.17
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Fri, 14 Jun 2019 04:28:19 -0700 (PDT)
From: Young Xiao <92siuyang@gmail.com>
To: alexander.deucher@amd.com, christian.koenig@amd.com, David1.Zhou@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/amd: fix hotplug race at startup
Date: Fri, 14 Jun 2019 19:29:23 +0800
Message-Id: <1560511763-2140-1-git-send-email-92siuyang@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=T6oFXDd7RFgkDhvVzkPX+FeD473fViFpef2JxosV0BQ=;
 b=Tm1TfpZUG6v9dqJ7S/nLPcnNLBnUCudYbvvrro2nNlyeCF4TQk2uwU39x1Sk/qQ6G2
 ccDCBEyvTxYmQplnoOReO+BeCl84+2vjjuKYS/Mp/5NqsaS3xLgg9nsGJPJES6apYWjJ
 sBwlJKmbueYj4cW2R0fw3IJk7GNJKZfbnkWK+IvOaStZbBQY6jNbQbgHkZVXYIwR10F1
 pKdG/SESJeRKdzjy8XIKgSipH4KiO7bl8MtyYebSWvR+SqWyj/3ZnazLzd4zTrDnJ17G
 SHZn/5pnV6eQ46Kyk3ZWfRK0e+pdlx1zZLsbkVYotTrOdwMFnN8IbMm8wHM537Pb0ULL
 WYxg==
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
Cc: Young Xiao <92siuyang@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2Ugc2hvdWxkIGNoZWNrIG1vZGVfY29uZmlnX2luaXRpYWxpemVkIGZsYWcgaW4gYW1kZ3B1X2hv
dHBsdWdfd29ya19mdW5jLgoKU2VlIGNvbW1pdCA3Zjk4Y2E0NTRhZDMgKCJkcm0vcmFkZW9uOiBm
aXggaG90cGx1ZyByYWNlIGF0IHN0YXJ0dXAiKSBmb3IgZGV0YWlscy4KClNpZ25lZC1vZmYtYnk6
IFlvdW5nIFhpYW8gPDkyc2l1eWFuZ0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X2lycS5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJx
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfaXJxLmMKaW5kZXggYWY0YzNi
MS4uMTMxODZkNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2lycS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pcnEuYwpAQCAt
ODUsNiArODUsOSBAQCBzdGF0aWMgdm9pZCBhbWRncHVfaG90cGx1Z193b3JrX2Z1bmMoc3RydWN0
IHdvcmtfc3RydWN0ICp3b3JrKQogCXN0cnVjdCBkcm1fbW9kZV9jb25maWcgKm1vZGVfY29uZmln
ID0gJmRldi0+bW9kZV9jb25maWc7CiAJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcjsK
IAorCWlmICghYWRldi0+bW9kZV9pbmZvLm1vZGVfY29uZmlnX2luaXRpYWxpemVkKQorCQlyZXR1
cm47CisKIAltdXRleF9sb2NrKCZtb2RlX2NvbmZpZy0+bXV0ZXgpOwogCWxpc3RfZm9yX2VhY2hf
ZW50cnkoY29ubmVjdG9yLCAmbW9kZV9jb25maWctPmNvbm5lY3Rvcl9saXN0LCBoZWFkKQogCQlh
bWRncHVfY29ubmVjdG9yX2hvdHBsdWcoY29ubmVjdG9yKTsKLS0gCjIuNy40CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
