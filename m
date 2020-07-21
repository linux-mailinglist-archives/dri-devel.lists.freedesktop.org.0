Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CF3227987
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jul 2020 09:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28436E4A6;
	Tue, 21 Jul 2020 07:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0A36E499
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 07:32:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q5so20125642wru.6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jul 2020 00:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6ALxFJxCOsfhRpfgYUqqKk9cEKj/CcDBsKp6BwF+PGg=;
 b=Dr8EfbYkFIVxksep2YVDLtQNt1NxvjhgJs+qGgcR5PcLvVcVOwlaGf3E+LBdRIUMVC
 JSO+PLBQz6zbSX9NMR6+dFwFKaT9FONxeLlJiz456/ECEdlnMnlY2KTdVixKZx1p7oeF
 jeVdEvUNYxgDzuBBpAurwAaAZq1RKCIO5TSduIZe+5sgdEtJ1d11l74U5/p0EZiNzSJq
 UQt7XjPhL1LujA8nqdf4y3Ze2lMvoCNZ8v0Y+kwMiX3oflVDmTve8mh4hmgb9qzsiYBz
 6v1iX0RE4pPLTuf6SP328gSFa623KPvN0o0V4mH/nZs15ipX+XEg0Q4S0V4BIEm2SZNu
 x52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6ALxFJxCOsfhRpfgYUqqKk9cEKj/CcDBsKp6BwF+PGg=;
 b=oh2E1uoFJipkjpMci2f5UrAy2subw0h7eMm3VUig381KzjMA/d8QgJ6o4x9r7tpl22
 cJ49RM3x2FnrkTHsIqGbG+7UUHXyiVUounudJH9sT66XlCnt3EIcxzdSMxRzVGYYb2dp
 FdDX9Yx165uvaHws4QvKzN1EZx7oidyJO9F8C+3svbjgY/VVIL24DZGLNAFU6lkQpfGw
 RWDy45GTdQ6w5Aqk0Ws+mW6BMq2MM6hFO7KJI5UdojIdNd1pDGLjFNeNNhvRTsz3SHy8
 mp6FCaeatjfl+p5pmuFdL/4qAn9B3PStj11jm07/HkRSIxYsZClZ1TcjvNysrq9MwW+d
 iWyg==
X-Gm-Message-State: AOAM5308XGQo2Bl+6LmsCd+BVweOFK7W4N35yonOe4DZ0Hsl5CdloZNw
 dvYs2GBpGPUA9Dh17aWylE3Uelvk
X-Google-Smtp-Source: ABdhPJyLQj2kQKL53TVSgh0sTg/iIb+8R6u2A7WT83WFOreF2gn3qOZsFs2azlhNFj6MEwLXaJmfVg==
X-Received: by 2002:adf:e486:: with SMTP id i6mr11389950wrm.258.1595316774380; 
 Tue, 21 Jul 2020 00:32:54 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:5eb1:eb29:dadc:7fc5])
 by smtp.gmail.com with ESMTPSA id s4sm29740896wre.53.2020.07.21.00.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 00:32:53 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/11] drm/amdgpu: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Date: Tue, 21 Jul 2020 09:32:42 +0200
Message-Id: <20200721073245.2484-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200721073245.2484-1-christian.koenig@amd.com>
References: <20200721073245.2484-1-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com, michael.j.ruhl@intel.com, tzimmermann@suse.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRyaXZlciBkb2VzIHN1cHBvcnQgc29tZSBub3QtbWFwYWJsZSByZXNvdXJjZXMsIGJ1dAp0
aG9zZSBhcmUgYWxyZWFkeSBoYW5kbGVkIGNvcnJlY3RseSBpbiB0aGUgc3dpdGNoL2Nhc2UKc3Rh
dGVtZW50IGluIHRoZSBjb2RlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyB8IDExICsrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25z
KCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0u
YwppbmRleCA0NGZhOGJjNDlkMTguLjBkZDVlODAyMDkxZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2FtZGdwdV90dG0uYwpAQCAtODQsNyArODQsNyBAQCBzdGF0aWMgaW50IGFtZGdwdV9p
bml0X21lbV90eXBlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAog
CXN3aXRjaCAodHlwZSkgewogCWNhc2UgVFRNX1BMX1NZU1RFTToKIAkJLyogU3lzdGVtIG1lbW9y
eSAqLwotCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19NQVBQQUJMRTsKKwkJbWFuLT5m
bGFncyA9IDA7CiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfTUFTS19DQUNISU5H
OwogCQltYW4tPmRlZmF1bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsKIAkJYnJlYWs7
CkBAIC05MywxMyArOTMsMTIgQEAgc3RhdGljIGludCBhbWRncHVfaW5pdF9tZW1fdHlwZShzdHJ1
Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgdWludDMyX3QgdHlwZSwKIAkJbWFuLT5mdW5jID0gJmFt
ZGdwdV9ndHRfbWdyX2Z1bmM7CiAJCW1hbi0+YXZhaWxhYmxlX2NhY2hpbmcgPSBUVE1fUExfTUFT
S19DQUNISU5HOwogCQltYW4tPmRlZmF1bHRfY2FjaGluZyA9IFRUTV9QTF9GTEFHX0NBQ0hFRDsK
LQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7CisJCW1hbi0+ZmxhZ3Mg
PSAwOwogCQlicmVhazsKIAljYXNlIFRUTV9QTF9WUkFNOgogCQkvKiAiT24tY2FyZCIgdmlkZW8g
cmFtICovCiAJCW1hbi0+ZnVuYyA9ICZhbWRncHVfdnJhbV9tZ3JfZnVuYzsKLQkJbWFuLT5mbGFn
cyA9IFRUTV9NRU1UWVBFX0ZMQUdfRklYRUQgfAotCQkJICAgICBUVE1fTUVNVFlQRV9GTEFHX01B
UFBBQkxFOworCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRDsKIAkJbWFuLT5h
dmFpbGFibGVfY2FjaGluZyA9IFRUTV9QTF9GTEFHX1VOQ0FDSEVEIHwgVFRNX1BMX0ZMQUdfV0M7
CiAJCW1hbi0+ZGVmYXVsdF9jYWNoaW5nID0gVFRNX1BMX0ZMQUdfV0M7CiAJCWJyZWFrOwpAQCAt
Nzk2LDcgKzc5NSw2IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2JvX21vdmUoc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibywgYm9vbCBldmljdCwKICAqLwogc3RhdGljIGludCBhbWRncHVfdHRtX2lv
X21lbV9yZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX21lbV9y
ZWcgKm1lbSkKIHsKLQlzdHJ1Y3QgdHRtX21lbV90eXBlX21hbmFnZXIgKm1hbiA9ICZiZGV2LT5t
YW5bbWVtLT5tZW1fdHlwZV07CiAJc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYgPSBhbWRncHVf
dHRtX2FkZXYoYmRldik7CiAJc3RydWN0IGRybV9tbV9ub2RlICptbV9ub2RlID0gbWVtLT5tbV9u
b2RlOwogCkBAIC04MDUsOCArODAzLDcgQEAgc3RhdGljIGludCBhbWRncHVfdHRtX2lvX21lbV9y
ZXNlcnZlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgdHRtX21lbV8KIAltZW0t
PmJ1cy5zaXplID0gbWVtLT5udW1fcGFnZXMgPDwgUEFHRV9TSElGVDsKIAltZW0tPmJ1cy5iYXNl
ID0gMDsKIAltZW0tPmJ1cy5pc19pb21lbSA9IGZhbHNlOwotCWlmICghKG1hbi0+ZmxhZ3MgJiBU
VE1fTUVNVFlQRV9GTEFHX01BUFBBQkxFKSkKLQkJcmV0dXJuIC1FSU5WQUw7CisKIAlzd2l0Y2gg
KG1lbS0+bWVtX3R5cGUpIHsKIAljYXNlIFRUTV9QTF9TWVNURU06CiAJCS8qIHN5c3RlbSBtZW1v
cnkgKi8KLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
