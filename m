Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A58BC372B00
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41FA26EB08;
	Tue,  4 May 2021 13:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C08A26EADE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:27:39 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id g14so10417039edy.6
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3btEsmLTilUPtyBakr3FBUicMoZVn4WGzuTm981fE28=;
 b=uv0+ttDbjAP2gv69Pv1bUldIxykUwMJMcQH4FQF4jzqoo6j72yhsO1qa/wAUsL9FEg
 SPmgKWi5keRFBXzUvhvL3ht4bqy5I0dUxFl5n+d7jjCWFhqzSNsff4cpXWcydhk62H6p
 odC5OeDfoNWl5/Lp85yrz46ItwXUdc8QCWJ6b0sbvnsSjCqbHacqI6FXhyy4H8xhvCse
 FP1nyo+4zujaESgnd0DdZlEhjGvodQEXK4K3uPvKebV9zV3EkOrlVRLwYsSEQnEBqELS
 gXapI0oo7KIJXATdMDKi4AyteDl/6Q/vkboXE4rItApx9nXgOs21hMhdG6fj2x7SkXXy
 QiSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3btEsmLTilUPtyBakr3FBUicMoZVn4WGzuTm981fE28=;
 b=P4uPbG73YR38HSiJU5I72Ri8TrWg/N03hKDXPObZS3rr+8lI9/6c0/JKNVvnfffXu8
 U2GbEk52WT9pC+qSDgCkMadnb282IJJfzyoNC//EiLteE9Md2CVwY1AW16MX1Di7xFl1
 xLL+QIPxz2A/wUYiCkgMttD0bMDvjy98kftvTj23oGHW9TplrkML+zPdTfOBJos6N/SK
 L6vSZJsHeRjIZAQ9OAWy1t4nbd9Ccc5iue3HYKIdpkUfgi9pEzadhV7HqbyLOZ0WPYg+
 80ayYdOUs2C5mmGAkE+KN9dw/fkxNNDHedza/5kY2cvkFY5c0GKHmDd2TepSCTbhq1Q5
 IZvg==
X-Gm-Message-State: AOAM531+PVfBZLlg5I8+518UXSaQxOsZhb7747vQmRrCegvgzFi1VKPM
 eYre4wiKdEBtfZy/Ocdd50FdgszM1eQ=
X-Google-Smtp-Source: ABdhPJxgohc+ZI0uW+mjnyHeCI7C30U96eG+w9AzGzxgLklIizxH9hBFbVrjhuR0gZAYobru76nFuA==
X-Received: by 2002:aa7:cf8d:: with SMTP id z13mr26491797edx.104.1620134858507; 
 Tue, 04 May 2021 06:27:38 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4a5c:1943:c73d:c4c9])
 by smtp.gmail.com with ESMTPSA id q18sm3114036edd.3.2021.05.04.06.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:27:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/12] drm/panfrost: add DMA-buf user fence support
Date: Tue,  4 May 2021 15:27:27 +0200
Message-Id: <20210504132729.2046-11-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504132729.2046-1-christian.koenig@amd.com>
References: <20210504132729.2046-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBhZGQgdGhlIGNhbGwgYmVmb3JlIHRha2luZyBsb2Nrcy4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vcGFuZnJvc3QvcGFuZnJvc3Rfam9iLmMgfCAxNiArKysrKysrKysrKysrKysrCiAxIGZp
bGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9qb2IuYwppbmRleCA2MDAzY2ZlYjEzMjIuLjkxNzRjZWIxZDE2ZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X2pvYi5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9qb2IuYwpAQCAtMjE2LDYgKzIxNiwxOCBAQCBzdGF0aWMg
dm9pZCBwYW5mcm9zdF9hdHRhY2hfb2JqZWN0X2ZlbmNlcyhzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Kipib3MsCiAJCWRtYV9yZXN2X2FkZF9leGNsX2ZlbmNlKGJvc1tpXS0+cmVzdiwgZmVuY2UpOwog
fQogCitzdGF0aWMgaW50IHBhbmZyb3N0X3N5bmNfdXNlcl9mZW5jZXMoc3RydWN0IGRybV9nZW1f
b2JqZWN0ICoqYm9zLCBpbnQgYm9fY291bnQpCit7CisJaW50IGksIHJldDsKKworCWZvciAoaSA9
IDA7IGkgPCBib19jb3VudDsgaSsrKSB7CisJCXJldCA9IGRtYV9yZXN2X3N5bmNfdXNlcl9mZW5j
ZShib3NbaV0tPnJlc3YpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwl9CisJcmV0dXJu
IDA7Cit9CisKIGludCBwYW5mcm9zdF9qb2JfcHVzaChzdHJ1Y3QgcGFuZnJvc3Rfam9iICpqb2Ip
CiB7CiAJc3RydWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYgPSBqb2ItPnBmZGV2OwpAQCAtMjI0
LDYgKzIzNiwxMCBAQCBpbnQgcGFuZnJvc3Rfam9iX3B1c2goc3RydWN0IHBhbmZyb3N0X2pvYiAq
am9iKQogCXN0cnVjdCB3d19hY3F1aXJlX2N0eCBhY3F1aXJlX2N0eDsKIAlpbnQgcmV0ID0gMDsK
IAorCXJldCA9IHBhbmZyb3N0X3N5bmNfdXNlcl9mZW5jZXMoam9iLT5ib3MsIGpvYi0+Ym9fY291
bnQpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAltdXRleF9sb2NrKCZwZmRldi0+c2No
ZWRfbG9jayk7CiAKIAlyZXQgPSBkcm1fZ2VtX2xvY2tfcmVzZXJ2YXRpb25zKGpvYi0+Ym9zLCBq
b2ItPmJvX2NvdW50LAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
