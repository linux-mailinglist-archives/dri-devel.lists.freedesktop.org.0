Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68906299414
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 18:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9836EA4D;
	Mon, 26 Oct 2020 17:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD5F36EA4D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 17:41:23 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id dg9so10281527edb.12
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 10:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JMGDOiAr07/HW/60oq9OmUoIMTyjwadQfEApJiO0kFQ=;
 b=BtnyTmdyHL/AXW2HDB4M0wPcAMQNlCZBreXbpaGF2sWcwjhujxjiXAwLY+ejuRS4Vt
 zfBJ/DYHnqrGQrUE/grD9LGorhsq4mp4hiHyT+JUj1L4PDb8pi1jrJTgw92aSGf++AaI
 zXuf7ifltdF7/i0mL3lBKtTcKsT2415Hs4iwUxlR13l+Npw3WD5MT5chpH1OBauVk282
 uVfoFYau+PtHiN+9ATQJkECzmpLRpy8KEvXgPw8mvPv5agK4Thbd0+uQNhKaaRs/2ybJ
 +3EF3NMrM7dth8h+AkBQeDONAcWwxJHNyyYQjEGJp0ktz7qFLGVYRM2NPnMHKDjJjLNx
 s1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JMGDOiAr07/HW/60oq9OmUoIMTyjwadQfEApJiO0kFQ=;
 b=jp1gR6s/4Qtj1De0tAi0SC3apzdKZPev1R+Jw1OAhdcpW33kYPtj/PBq+13oe5ysNW
 RBCOGs4Dpmu3QldYOV+GFN0VhbiU/JURD4GL03AmiaXztvm0UymTn5r53hrfiFb81rwC
 YsMpo4Qu7KszflRNXRiyhbLkD7DrSBe4pQYdUgJp+7oeuVN5zKPMHnY4SCqmPAlk3yJL
 UdqSkfyu7+uVyx033lBUooAirR8UYnoEF/0LGcAgkSpUQ/e6WP1aWgADvvcBwoxDfDbf
 JaCxxZLDiIo1ytUxOSoFam1FussyLFirVHhyrwJopTMrggvbLORXPIF/IzPxbVnI4llI
 UKCw==
X-Gm-Message-State: AOAM5334TW2/8L/d6p7Bmo3x4pR+72giJVU94kH589ppywbuyuSlwAT/
 hvYbLtyZ9VQRp+i/8q10AMS/ZIHiaHc=
X-Google-Smtp-Source: ABdhPJzkPF2fU0F35fysYCHXbDogS3BxKQBMZ1qzuEUGVy1aMmlYED0BcvZAu8wrFV9BAsJ6HoaM/Q==
X-Received: by 2002:a05:6402:1457:: with SMTP id
 d23mr10143821edx.311.1603734082327; 
 Mon, 26 Oct 2020 10:41:22 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:203b:21f:8891:7b14])
 by smtp.gmail.com with ESMTPSA id i14sm6227325ejy.110.2020.10.26.10.41.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 10:41:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/nouveau: switch to new allocator
Date: Mon, 26 Oct 2020 18:41:13 +0100
Message-Id: <20201026174117.2553-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201026174117.2553-1-christian.koenig@amd.com>
References: <20201026174117.2553-1-christian.koenig@amd.com>
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

SXQgc2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlIGFsbCBjYXNlcyBub3cuCgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jICB8IDMwICsrLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaCB8ICAxIC0KIDIg
ZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKaW5kZXggNzVmZGRiY2Q3ODMyLi43NDZjMDZlZDE5NWIg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKQEAgLTEzMjcsMjUgKzEzMjcsMTMg
QEAgbm91dmVhdV90dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJ
ZHJtID0gbm91dmVhdV9iZGV2KGJkZXYpOwogCWRldiA9IGRybS0+ZGV2LT5kZXY7CiAKLSNpZiBJ
U19FTkFCTEVEKENPTkZJR19BR1ApCi0JaWYgKGRybS0+YWdwLmJyaWRnZSkgewotCQlyZXR1cm4g
dHRtX3Bvb2xfcG9wdWxhdGUodHRtLCBjdHgpOwotCX0KLSNlbmRpZgotCi0jaWYgSVNfRU5BQkxF
RChDT05GSUdfU1dJT1RMQikgJiYgSVNfRU5BQkxFRChDT05GSUdfWDg2KQotCWlmIChzd2lvdGxi
X25yX3RibCgpKSB7Ci0JCXJldHVybiB0dG1fZG1hX3BvcHVsYXRlKCh2b2lkICopdHRtLCBkZXYs
IGN0eCk7Ci0JfQotI2VuZGlmCi0JcmV0dXJuIHR0bV9wb3B1bGF0ZV9hbmRfbWFwX3BhZ2VzKGRl
diwgdHRtX2RtYSwgY3R4KTsKKwlyZXR1cm4gdHRtX3Bvb2xfYWxsb2MoJmRybS0+dHRtLmJkZXYu
cG9vbCwgdHRtLCBjdHgpOwogfQogCiBzdGF0aWMgdm9pZAogbm91dmVhdV90dG1fdHRfdW5wb3B1
bGF0ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAkJCSAgc3RydWN0IHR0bV90dCAqdHRt
KQogewotCXN0cnVjdCB0dG1fdHQgKnR0bV9kbWEgPSAodm9pZCAqKXR0bTsKIAlzdHJ1Y3Qgbm91
dmVhdV9kcm0gKmRybTsKIAlzdHJ1Y3QgZGV2aWNlICpkZXY7CiAJYm9vbCBzbGF2ZSA9ICEhKHR0
bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cpOwpAQCAtMTM1NiwyMSArMTM0NCw3IEBA
IG5vdXZlYXVfdHRtX3R0X3VucG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJ
ZHJtID0gbm91dmVhdV9iZGV2KGJkZXYpOwogCWRldiA9IGRybS0+ZGV2LT5kZXY7CiAKLSNpZiBJ
U19FTkFCTEVEKENPTkZJR19BR1ApCi0JaWYgKGRybS0+YWdwLmJyaWRnZSkgewotCQl0dG1fcG9v
bF91bnBvcHVsYXRlKHR0bSk7Ci0JCXJldHVybjsKLQl9Ci0jZW5kaWYKLQotI2lmIElTX0VOQUJM
RUQoQ09ORklHX1NXSU9UTEIpICYmIElTX0VOQUJMRUQoQ09ORklHX1g4NikKLQlpZiAoc3dpb3Rs
Yl9ucl90YmwoKSkgewotCQl0dG1fZG1hX3VucG9wdWxhdGUoKHZvaWQgKil0dG0sIGRldik7Ci0J
CXJldHVybjsKLQl9Ci0jZW5kaWYKLQotCXR0bV91bm1hcF9hbmRfdW5wb3B1bGF0ZV9wYWdlcyhk
ZXYsIHR0bV9kbWEpOworCXJldHVybiB0dG1fcG9vbF9mcmVlKCZkcm0tPnR0bS5iZGV2LnBvb2ws
IHR0bSk7CiB9CiAKIHN0YXRpYyB2b2lkCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYu
aAppbmRleCBiODAyNTUwN2E5ZTQuLjlkMDRkMWIzNjQzNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2Rydi5oCkBAIC01Niw3ICs1Niw2IEBACiAjaW5jbHVkZSA8ZHJtL3R0bS90dG1f
cGxhY2VtZW50Lmg+CiAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fbWVtb3J5Lmg+CiAjaW5jbHVkZSA8
ZHJtL3R0bS90dG1fbW9kdWxlLmg+Ci0jaW5jbHVkZSA8ZHJtL3R0bS90dG1fcGFnZV9hbGxvYy5o
PgogCiAjaW5jbHVkZSA8ZHJtL2RybV9hdWRpb19jb21wb25lbnQuaD4KIAotLSAKMi4xNy4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
