Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1C82222DF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jul 2020 14:51:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44B846EC50;
	Thu, 16 Jul 2020 12:50:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974396E2EC
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 12:50:46 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f18so6984345wrs.0
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jul 2020 05:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IFMOG655Ti9NMGS2tDb2JhdFfKlPgj5sYYJYCoYBG4Q=;
 b=Oxm5yE6JkSBCUChmx7B7ZBz7w+cpymhnCI7cj9IAG4bwF0gR3brNhnI/G/C7ybXpVV
 3F03uetQVVc6B9iEc0KNEqrEa+5SXub0Xk2vVePBWR5orPvxu/WEm2Up9OqEvYzsHlHR
 B/3MkWz66+T5lKpOFaJkEcxqGDAQV9i8lGJ61sg9q4k2fRuGLq3ojpsdivU4XkJOozHW
 HNmGVJ/XuwuP8rUD+wowE3bLjMNXmYAhci/1lfA/agNHLsYyzYnBgZblNBp7lqiFpr72
 9TcwjiYFaxDRjf1PB8anLwIBGxHgW4+tY81XZHSEccUmrl2fyU7B1l8lZ5vri/gpPZgW
 H2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IFMOG655Ti9NMGS2tDb2JhdFfKlPgj5sYYJYCoYBG4Q=;
 b=ME9gpxcsIziUyDtpkYeJvo10SOi+rFkdlssGP8A+PcpyqkiTtVl65ZP+mphLNFX2x8
 6hugySETBYd0I8uLYTiN4RjrpFdGev1+wAStI7yHOtWCEOgXqVog+L+FFftu6lxZ61x5
 8PX8dld8IxQdWKY9SAsd7E4Yr4OkPEKpZkDrAK7JV53lmJjcV0oINUWg4w7vQtYQwH+I
 qzf6UmRRJbrSDDGgU5q8rtwFbeCrjzyZE+yXwQx00IecTqmMYoqr9PBJRLiUMSaMXRV9
 ppLhBGPysQrsxzpyLXdu/8+3uobvtLemBv1loo6EgZrOOn/74t65j85jOL798AhK+y0G
 mLyg==
X-Gm-Message-State: AOAM533t3XTvaoAWXEnRR74KUmu7bz+2HeR8L+9kmcMi9fAgOZxu+d8v
 afPPSBRCNAJhRhhAjfdqAF0DaG0/
X-Google-Smtp-Source: ABdhPJzm2lUXMZjlxdZwhGftYnOa6r8Dag8ExPxABFiOBsGjfzEQRDgrZBHe7tt1tnBEDPhbrpgWZw==
X-Received: by 2002:a05:6000:86:: with SMTP id
 m6mr4866768wrx.173.1594903845113; 
 Thu, 16 Jul 2020 05:50:45 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:efc1:eb01:18eb:bff2])
 by smtp.gmail.com with ESMTPSA id z25sm7669872wmk.28.2020.07.16.05.50.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 05:50:44 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 7/8] drm/vram-helper: stop using TTM_MEMTYPE_FLAG_MAPPABLE
Date: Thu, 16 Jul 2020 14:50:36 +0200
Message-Id: <20200716125037.67437-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200716125037.67437-1-christian.koenig@amd.com>
References: <20200716125037.67437-1-christian.koenig@amd.com>
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
Cc: Madhav.Chauhan@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGhlbHBlciBkb2Vzbid0IGV4cG9zZSBhbnkgbm90LW1hcGFibGUgbWVtb3J5IHJlc291cmNl
cy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgOSArKy0t
LS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKaW5kZXggZTYyYTJiNjhmZTNhLi5iNmU0
ZTQ5MDI3YWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVy
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYwpAQCAtMTAxNywx
NCArMTAxNywxMyBAQCBzdGF0aWMgaW50IGJvX2RyaXZlcl9pbml0X21lbV90eXBlKHN0cnVjdCB0
dG1fYm9fZGV2aWNlICpiZGV2LCB1aW50MzJfdCB0eXBlLAogewogCXN3aXRjaCAodHlwZSkgewog
CWNhc2UgVFRNX1BMX1NZU1RFTToKLQkJbWFuLT5mbGFncyA9IFRUTV9NRU1UWVBFX0ZMQUdfTUFQ
UEFCTEU7CisJCW1hbi0+ZmxhZ3MgPSAwOwogCQltYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRN
X1BMX01BU0tfQ0FDSElORzsKIAkJbWFuLT5kZWZhdWx0X2NhY2hpbmcgPSBUVE1fUExfRkxBR19D
QUNIRUQ7CiAJCWJyZWFrOwogCWNhc2UgVFRNX1BMX1ZSQU06CiAJCW1hbi0+ZnVuYyA9ICZ0dG1f
Ym9fbWFuYWdlcl9mdW5jOwotCQltYW4tPmZsYWdzID0gVFRNX01FTVRZUEVfRkxBR19GSVhFRCB8
Ci0JCQkgICAgIFRUTV9NRU1UWVBFX0ZMQUdfTUFQUEFCTEU7CisJCW1hbi0+ZmxhZ3MgPSBUVE1f
TUVNVFlQRV9GTEFHX0ZJWEVEOwogCQltYW4tPmF2YWlsYWJsZV9jYWNoaW5nID0gVFRNX1BMX0ZM
QUdfVU5DQUNIRUQgfAogCQkJCQkgVFRNX1BMX0ZMQUdfV0M7CiAJCW1hbi0+ZGVmYXVsdF9jYWNo
aW5nID0gVFRNX1BMX0ZMQUdfV0M7CkBAIC0xMDY3LDEyICsxMDY2LDggQEAgc3RhdGljIHZvaWQg
Ym9fZHJpdmVyX21vdmVfbm90aWZ5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiBzdGF0
aWMgaW50IGJvX2RyaXZlcl9pb19tZW1fcmVzZXJ2ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRl
diwKIAkJCQkgICAgc3RydWN0IHR0bV9tZW1fcmVnICptZW0pCiB7Ci0Jc3RydWN0IHR0bV9tZW1f
dHlwZV9tYW5hZ2VyICptYW4gPSBiZGV2LT5tYW4gKyBtZW0tPm1lbV90eXBlOwogCXN0cnVjdCBk
cm1fdnJhbV9tbSAqdm1tID0gZHJtX3ZyYW1fbW1fb2ZfYmRldihiZGV2KTsKIAotCWlmICghKG1h
bi0+ZmxhZ3MgJiBUVE1fTUVNVFlQRV9GTEFHX01BUFBBQkxFKSkKLQkJcmV0dXJuIC1FSU5WQUw7
Ci0KIAltZW0tPmJ1cy5hZGRyID0gTlVMTDsKIAltZW0tPmJ1cy5zaXplID0gbWVtLT5udW1fcGFn
ZXMgPDwgUEFHRV9TSElGVDsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwK
