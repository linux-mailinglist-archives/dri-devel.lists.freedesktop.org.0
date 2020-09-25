Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F53A278B60
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 16:55:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DAA6ED11;
	Fri, 25 Sep 2020 14:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 508AA6ED19
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 14:55:43 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id r7so3993247ejs.11
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RutlKtRpt9bk66pnLU8lxpgIYD/UbI40WUX9sv8pWns=;
 b=RzhC6wA0ggFbV2knXHtPkjmdo+pTzvSSFMcX7WtJ4v+fcGwMkpvtySYqT5Mvxr3eP1
 TNrJHHh55btiqU4q8ELI0+FVefHvFh70DJ0+Dg0kJcXqcbMIPL7Frj7zNE6wlIHrcozN
 mhdVGeeHXdEqnF10zGK4D8IqcaL1dNmQ23VE9xuV8zIh5yZliyeD2JQXUHd35JNCCMtw
 BsJQS7bP9RAuVOZtIxuMjFedQmZobAGpzZnIwdwCTmpBiu+Wj6gUhhZkvWXUatKppH4P
 w7qRSrSb/ugaMK89Fd2O0nTbbtGBTSqU+MQ55P+Lq7YKF92xkgv5el7jji7DKPNWMApa
 B5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RutlKtRpt9bk66pnLU8lxpgIYD/UbI40WUX9sv8pWns=;
 b=h7Z8ZVi3KB1yD1l/9n/1vV/IbPyDHNgzPu9nKSLUaOXOEJj35dvkOZDTin6QkGZ1mt
 mvRZ/6mYdtJI8jjrnGLqehWlIOZNcyvr/ns0HDIQnE/yFWcCQbO3ocGEI+i5Cc3DpTZp
 ONruTPKcDmNm3L420NCxZC3r1Wvks7ewjai1A6BZYBLT5AdeFnbZr3BVet9Vx/573z/Z
 rDldCXGI8DdjRaebzQdlzFITU1E1uxGFPBuhcc/yl73lY5b7IiWoj6Rns8Fz00AB+B2m
 hifgWjx47e9+Q9mWuA0PsOvy7s/qZNnbNwX2Ks5mNFd+tbmSYeNcfum7GB5Nkh44HupD
 +4Gw==
X-Gm-Message-State: AOAM532RY5FAnK1Sg88qKx6NHSXfQ0ifynJki415RFyDnRBA9yS3gkSI
 IYzSytD6NGwsTIaH5AdJd/0wX0eEVww=
X-Google-Smtp-Source: ABdhPJx0urppDAWkRmaf0XOK2xK5D6Zcpn05F94lE3ulVwiWCgUQ9PM+An+rJjMi3auKmA1Yv7O6wQ==
X-Received: by 2002:a17:906:b784:: with SMTP id
 dt4mr3295119ejb.376.1601045741724; 
 Fri, 25 Sep 2020 07:55:41 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c75e:403f:87d4:6d00])
 by smtp.gmail.com with ESMTPSA id lo25sm2029990ejb.53.2020.09.25.07.55.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 07:55:41 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	ray.huang@amd.com,
	airlied@redhat.com
Subject: [PATCH 1/5] drm/ttm: move SG flag check into ttm_bo_vm_reserve
Date: Fri, 25 Sep 2020 16:55:36 +0200
Message-Id: <20200925145540.1214-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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

SnVzdCBjaGVjayBlYXJsaWVyIGlmIGEgQk8gY2FuIGJlIHBhZ2UgZmF1bHRlZCBpbiB0aGUgZmly
c3QgcGxhY2UuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29l
bmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8IDE2ICsr
KysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDcgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyBiL2Ry
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKaW5kZXggOThhMDA2ZmMzMGE1Li45OTFlZjEz
MmUxMDggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYwpAQCAtMTU3LDYgKzE1NywxNSBAQCB2bV9m
YXVsdF90IHR0bV9ib192bV9yZXNlcnZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJ
CQlyZXR1cm4gVk1fRkFVTFRfTk9QQUdFOwogCX0KIAorCS8qCisJICogUmVmdXNlIHRvIGZhdWx0
IGltcG9ydGVkIHBhZ2VzLiBUaGlzIHNob3VsZCBiZSBoYW5kbGVkCisJICogKGlmIGF0IGFsbCkg
YnkgcmVkaXJlY3RpbmcgbW1hcCB0byB0aGUgZXhwb3J0ZXIuCisJICovCisJaWYgKGJvLT50dG0g
JiYgKGJvLT50dG0tPnBhZ2VfZmxhZ3MgJiBUVE1fUEFHRV9GTEFHX1NHKSkgeworCQlkbWFfcmVz
dl91bmxvY2soYm8tPmJhc2UucmVzdik7CisJCXJldHVybiBWTV9GQVVMVF9TSUdCVVM7CisJfQor
CiAJcmV0dXJuIDA7CiB9CiBFWFBPUlRfU1lNQk9MKHR0bV9ib192bV9yZXNlcnZlKTsKQEAgLTI4
MSwxMyArMjkwLDYgQEAgdm1fZmF1bHRfdCB0dG1fYm9fdm1fZmF1bHRfcmVzZXJ2ZWQoc3RydWN0
IHZtX2ZhdWx0ICp2bWYsCiAJdm1fZmF1bHRfdCByZXQgPSBWTV9GQVVMVF9OT1BBR0U7CiAJdW5z
aWduZWQgbG9uZyBhZGRyZXNzID0gdm1mLT5hZGRyZXNzOwogCi0JLyoKLQkgKiBSZWZ1c2UgdG8g
ZmF1bHQgaW1wb3J0ZWQgcGFnZXMuIFRoaXMgc2hvdWxkIGJlIGhhbmRsZWQKLQkgKiAoaWYgYXQg
YWxsKSBieSByZWRpcmVjdGluZyBtbWFwIHRvIHRoZSBleHBvcnRlci4KLQkgKi8KLQlpZiAoYm8t
PnR0bSAmJiAoYm8tPnR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cpKQotCQlyZXR1
cm4gVk1fRkFVTFRfU0lHQlVTOwotCiAJaWYgKGJkZXYtPmRyaXZlci0+ZmF1bHRfcmVzZXJ2ZV9u
b3RpZnkpIHsKIAkJc3RydWN0IGRtYV9mZW5jZSAqbW92aW5nID0gZG1hX2ZlbmNlX2dldChiby0+
bW92aW5nKTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
