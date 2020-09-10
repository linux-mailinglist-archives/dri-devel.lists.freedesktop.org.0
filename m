Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4127C264575
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 13:49:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1274E6E90D;
	Thu, 10 Sep 2020 11:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE1A6E90D
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 11:49:11 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id gr14so8287102ejb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 04:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/0qP663GkeFRy+lHrDDdp7TlC4ah6F19H07EKpTTSDo=;
 b=P79Sd856RV0ofXUc7R70uWMV+eVUfe/XPj/8HwDrTztn42ATlC+/wvTnlnFeeZwAM7
 xNFJF3/2nA6N7WNs90qZQITF5yNohjJnvbZwQGdmozOjQxWAmXY4yYmrX2K25PgkKdO/
 LNXfOIrvFt4HRUIVU6hNRW06jJ5/PnrVS6Z4/5l17Tud3JK+G+l339g8KfH/i1SbLkGB
 Du1NTH43faxP2YZAw3q8VXE71qqZ5DCDQRXI3vgAmP3kZihbgLgPOFzHfYOA8gUwq6hK
 4dw3iZLCxORL+hI+RbPyEOtF9rAEZ8CU/3GPjZuunR5H6h6GlESz7CHOZaXGCD+EOE/z
 p4rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/0qP663GkeFRy+lHrDDdp7TlC4ah6F19H07EKpTTSDo=;
 b=ACtHCu+XIaCo9No82Do7uXnhBDtKxQCnCiOL+c5Mz9Ms7iUkuMebLOt6qWo8O+6iNf
 Eq5ErTzRB6WCMgITSOYZ6YBxekIGGTC1mAYy0YCMKWffZ98CuYfO+/pFXMUM7b/ibHvg
 Ewgju4jMbb8Ftzy/tZna4kQ+FQI0chJeKcFp4rNTHAiaFD2VaYe5Y7abEksyXfEvzPJM
 aSjcp4Kezz7GhqpT5P8tW4YmN78VI5a44qPY8L+QtaOLUe5QzaLlueYVGBYvtasnSVkD
 5hgxGsf7mYVSuSZgTzAY7BvysaRFI4Z3fefOEWN7AGMwph/YpuEqQPLjSjMKPQe/EtDB
 AyiA==
X-Gm-Message-State: AOAM530m2WFmcFs3ausvQZJ3VAJUqbLhi2d5qQ5lRhaMK1vh3/m3eNHk
 +JXHGNkngFw0oEJb8vKerQctjCudK2Q=
X-Google-Smtp-Source: ABdhPJw2lyf+rVpEL4m1q6mtROjB6NqR+l3t0tjkJ7TL9EtET5Si0Rkj13mouq4xwxviAnO1omwOFQ==
X-Received: by 2002:a17:906:fa01:: with SMTP id
 lo1mr8666461ejb.394.1599738549858; 
 Thu, 10 Sep 2020 04:49:09 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:70f6:b740:8639:ef8a])
 by smtp.gmail.com with ESMTPSA id q27sm6438007ejd.74.2020.09.10.04.49.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 04:49:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, airlied@gmail.com, bskeggs@redhat.com,
 kraxel@redhat.com
Subject: [PATCH 3/4] drm/vmwgfx: stop setting multiple domain flags
Date: Thu, 10 Sep 2020 13:49:05 +0200
Message-Id: <20200910114906.2873-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200910114906.2873-1-christian.koenig@amd.com>
References: <20200910114906.2873-1-christian.koenig@amd.com>
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

U2V0dGluZyBtb3JlIHRoYW4gb25lIHBsYWNlbWVudCBmbGFnIGlzIGlsbGVnYWwuCkZpeCB0aGlz
IGJ5IHVzaW5nIHRoZSBjdXJyZW50IGZsYWdzLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdn
Zngvdm13Z2Z4X2JvLmMgfCA1ICsrKy0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13
Z2Z4X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9iby5jCmluZGV4IDMyMjk0
NTFkMDcwNi4uMDNmNTY2MGQ4NWE0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4
L3Ztd2dmeF9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2JvLmMKQEAg
LTM1NCwxMCArMzU0LDExIEBAIHZvaWQgdm13X2JvX3Bpbl9yZXNlcnZlZChzdHJ1Y3Qgdm13X2J1
ZmZlcl9vYmplY3QgKnZibywgYm9vbCBwaW4pCiAKIAlwbC5mcGZuID0gMDsKIAlwbC5scGZuID0g
MDsKLQlwbC5mbGFncyA9IFRUTV9QTF9GTEFHX1ZSQU0gfCBWTVdfUExfRkxBR19HTVIgfCBWTVdf
UExfRkxBR19NT0IKLQkJfCBUVE1fUExfRkxBR19TWVNURU0gfCBUVE1fUExfRkxBR19DQUNIRUQ7
CisJcGwuZmxhZ3MgPSBiby0+bWVtLnBsYWNlbWVudDsKIAlpZiAocGluKQogCQlwbC5mbGFncyB8
PSBUVE1fUExfRkxBR19OT19FVklDVDsKKwllbHNlCisJCXBsLmZsYWdzICY9IH5UVE1fUExfRkxB
R19OT19FVklDVDsKIAogCW1lbXNldCgmcGxhY2VtZW50LCAwLCBzaXplb2YocGxhY2VtZW50KSk7
CiAJcGxhY2VtZW50Lm51bV9wbGFjZW1lbnQgPSAxOwotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
