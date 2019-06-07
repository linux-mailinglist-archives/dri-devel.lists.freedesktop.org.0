Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C01538AB1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 14:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A563B89D84;
	Fri,  7 Jun 2019 12:50:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 897C089D43;
 Fri,  7 Jun 2019 12:50:44 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id g135so1955124wme.4;
 Fri, 07 Jun 2019 05:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p9wRG1vgieI5Tw7lzVfOuELR6Jdrkf3meS0vFGCuHyY=;
 b=ng9FO8ej4UIx6gN7TdiWKzNJYc6alH490EjvlyYcjUK6huStB9bUJcw0cMSDigHtMK
 qxjgXzXWqtzU6kKvb375W1U/+gl/ErlKzzZoQky97SyROX5B2nMECBFWqJm0S4rijM+E
 EXr5iuxeriUQLtclKeRw55+2imwYNdN+fSeDRXHbJUskJ62w2wbBdlPo9eGWAZvAHA3j
 n0CVomKbmMxdNnhnLEX2Ap6QuR/sTWfpR+v0nYWufsSMPDziIiD88TuAB2xBAFbnu6fk
 MsHMXO3fR0BTSdC8lXAJiGjR6EUdXQwdNnEn3VnSRS0BbZD64zT1QGDlo/6RFt6o5ZhB
 6U6Q==
X-Gm-Message-State: APjAAAVkM+QlxaVy1aU0tYVBe3xDJLNVpWvFj/cSS8ecxaEdsB+bQidW
 H5Ja7Bh+OXVdd7i+/AEtqQ+wQu5C
X-Google-Smtp-Source: APXvYqw9hjAyrm3ZdAvHCvy35+Se2DsSZEPtM6lEDE5hdHZC1yA9gGiXS8dRbNeTrQVEgX6yGy1SoA==
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr3358312wmj.22.1559911843097;
 Fri, 07 Jun 2019 05:50:43 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c5a0:21d3:d7e7:98b7])
 by smtp.gmail.com with ESMTPSA id 32sm3923249wra.35.2019.06.07.05.50.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Jun 2019 05:50:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch
Subject: [PATCH 4/6] drm/amdgpu: use allowed_domains for exported DMA-bufs
Date: Fri,  7 Jun 2019 14:50:37 +0200
Message-Id: <20190607125039.2240-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190607125039.2240-1-christian.koenig@amd.com>
References: <20190607125039.2240-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=p9wRG1vgieI5Tw7lzVfOuELR6Jdrkf3meS0vFGCuHyY=;
 b=nKYevvOqxBT9jNvXXXgf6cw2ajXjc2TUEz3FTYb7dwd0ON0KReAtYoEtyiRg2PjWSY
 PO82Tx6JwrMhMUqA4ZMv+KzhhyXhCO2zT4xVugBBIykZ6WtoqPXbhmowd+PC7Sva9BGq
 ECi9oz0IkNWILuxiD2EBQGbUefVWiWEwUWu0Gi222n3/dqBZQ0ppfyVZjTqYUrakGpCI
 ijmVGva+zQWyV/otGwg0qh8/++h8ed7wxsQpw4PldlSJ0YzCtssPRGfiYYnIldFSNr9l
 H9mC2H0x7mguSfhowYWAAgnYeuvz0U7hL6M6qji6jllQ636KGaaXzT1fGKfy2T8AnEun
 5Txg==
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

QXZvaWQgdGhhdCB3ZSBwaW5nL3BvbmcgdGhlIGJ1ZmZlcnMgd2hlbiB3ZSBzdG9wIHRvIHBpbiBE
TUEtYnVmCmV4cG9ydHMgYnkgdXNpbmcgdGhlIGFsbG93ZWQgZG9tYWlucyBmb3IgZXhwb3J0ZWQg
YnVmZmVycy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyB8
IDUgKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9jcy5jCmluZGV4IDNlMmRhMjRjZDE3YS4u
YTU5NzgwNjU0MzM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfY3MuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfY3MuYwpAQCAt
MjYsNiArMjYsNyBAQAogICovCiAjaW5jbHVkZSA8bGludXgvcGFnZW1hcC5oPgogI2luY2x1ZGUg
PGxpbnV4L3N5bmNfZmlsZS5oPgorI2luY2x1ZGUgPGxpbnV4L2RtYS1idWYuaD4KICNpbmNsdWRl
IDxkcm0vZHJtUC5oPgogI2luY2x1ZGUgPGRybS9hbWRncHVfZHJtLmg+CiAjaW5jbHVkZSA8ZHJt
L2RybV9zeW5jb2JqLmg+CkBAIC00MTIsNyArNDEzLDkgQEAgc3RhdGljIGludCBhbWRncHVfY3Nf
Ym9fdmFsaWRhdGUoc3RydWN0IGFtZGdwdV9jc19wYXJzZXIgKnAsCiAJLyogRG9uJ3QgbW92ZSB0
aGlzIGJ1ZmZlciBpZiB3ZSBoYXZlIGRlcGxldGVkIG91ciBhbGxvd2FuY2UKIAkgKiB0byBtb3Zl
IGl0LiBEb24ndCBtb3ZlIGFueXRoaW5nIGlmIHRoZSB0aHJlc2hvbGQgaXMgemVyby4KIAkgKi8K
LQlpZiAocC0+Ynl0ZXNfbW92ZWQgPCBwLT5ieXRlc19tb3ZlZF90aHJlc2hvbGQpIHsKKwlpZiAo
cC0+Ynl0ZXNfbW92ZWQgPCBwLT5ieXRlc19tb3ZlZF90aHJlc2hvbGQgJiYKKwkgICAgKCFiby0+
Z2VtX2Jhc2UuZG1hX2J1ZiB8fAorCSAgICBsaXN0X2VtcHR5KCZiby0+Z2VtX2Jhc2UuZG1hX2J1
Zi0+YXR0YWNobWVudHMpKSkgewogCQlpZiAoIWFtZGdwdV9nbWNfdnJhbV9mdWxsX3Zpc2libGUo
JmFkZXYtPmdtYykgJiYKIAkJICAgIChiby0+ZmxhZ3MgJiBBTURHUFVfR0VNX0NSRUFURV9DUFVf
QUNDRVNTX1JFUVVJUkVEKSkgewogCQkJLyogQW5kIGRvbid0IG1vdmUgYSBDUFVfQUNDRVNTX1JF
UVVJUkVEIEJPIHRvIGxpbWl0ZWQKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
