Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA78BDC74
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 12:55:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D613A89FEA;
	Wed, 25 Sep 2019 10:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968658997A
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 10:55:33 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id m18so4319495wmc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 03:55:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tQ5re7Yj5Up3NHt/RZExCjHoI5BjDVPLoZNLZVxYDRo=;
 b=coB0u8TEHo5f7qV9hrIteA3o1WneXCQ0DKAYZen2yX9mW8RQ1khobSmTzm33QgAPrj
 r7AO14DPQO/o/InV6XEYH9iBZqmZvRAz69UTwq+9t/lEE4GctxNQEO1peWaESshhnyCN
 fE6m6DQjJ+Hw+PMcz6FejXmWDYaVgmtCE1s7bv1/CM8+4nrXwGYaqoDYvcBgVw2jDgEl
 lYVchg3UPlB6jGD7Vmu/iOBKemO0GSAWKNqTKD8VILa7T413RKb8pkLG8uUQyDLEVrzC
 lm+TO9uYGNRwueYU7paCIFhnIuz+90lq3Z1yOEKZt0q/aDuAHvWh3c88xIBrLljNU/vP
 LSWw==
X-Gm-Message-State: APjAAAUFwNo/oFyJVuuK70Zvxl7TFuxNIQXw2Slj0UY56jvbZ1Lr+WkM
 alRsrfCBCZqW5/a1b1pxdzSYNiQj
X-Google-Smtp-Source: APXvYqzJ6ZjtWVfol1NwiU2FuK4QYM1NO+PtAlNWiC47WY8/yeApk+7SbHqROrUzHVHbYidGtmaxbQ==
X-Received: by 2002:a7b:c403:: with SMTP id k3mr3695886wmi.89.1569408932291;
 Wed, 25 Sep 2019 03:55:32 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:9900:8714:bde3:bc53])
 by smtp.gmail.com with ESMTPSA id c6sm5231794wrb.60.2019.09.25.03.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 03:55:31 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: kraxel@redhat.com, daniel@ffwll.ch, thomas_os@shipmail.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/ttm: fix busy reference in ttm_mem_evict_first
Date: Wed, 25 Sep 2019 12:55:28 +0200
Message-Id: <20190925105530.2261-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tQ5re7Yj5Up3NHt/RZExCjHoI5BjDVPLoZNLZVxYDRo=;
 b=hssLmDmQvgoZt3iKlZk1j5+7X4MmHKHWKHZZKrf+WC/OvE1AW0GCwgbmjvtzvp3HUI
 YQQSYlamyfIbbCgvwr5ngTaINPb1S/cpYImg/hjMeK94i0w0pY8OnKZ88vQaH5n7ACHK
 OvwUcagMDtkME0t7+PTk6EGx5BbXadV1QtqSu36rFpc5OU5kOiguN58rhZeVwcWofebJ
 NhW89EPQPeOLdXLl936+DnyvrnGfa2jt8BzUbgCeUa+upScSSWanOk5Z8ZTSlv+75+xU
 l+KrYv7q7gC7qxZQPs9+rP+/a3prs4YK4azrGmFtO9yXrULMbZeSTjk45yFUdjrswt5p
 GpAw==
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

VGhlIGJ1c3kgQk8gbWlnaHQgYWN0dWFsbHkgYmUgYWxyZWFkeSBkZWxldGVkLApzbyBncmFiIG9u
bHkgYSBsaXN0IHJlZmVyZW5jZS4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNo
cmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
IHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCmluZGV4IDg4MWNmMjZkNjk4ZS4uMDJmMzAxZTFmZjI5IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX2JvLmMKQEAgLTg3NSwxMSArODc1LDExIEBAIHN0YXRpYyBpbnQgdHRtX21lbV9l
dmljdF9maXJzdChzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAogCWlmICghYm8pIHsKIAkJ
aWYgKGJ1c3lfYm8pCi0JCQl0dG1fYm9fZ2V0KGJ1c3lfYm8pOworCQkJa3JlZl9nZXQoJmJ1c3lf
Ym8tPmxpc3Rfa3JlZik7CiAJCXNwaW5fdW5sb2NrKCZnbG9iLT5scnVfbG9jayk7CiAJCXJldCA9
IHR0bV9tZW1fZXZpY3Rfd2FpdF9idXN5KGJ1c3lfYm8sIGN0eCwgdGlja2V0KTsKIAkJaWYgKGJ1
c3lfYm8pCi0JCQl0dG1fYm9fcHV0KGJ1c3lfYm8pOworCQkJa3JlZl9wdXQoJmJ1c3lfYm8tPmxp
c3Rfa3JlZiwgdHRtX2JvX3JlbGVhc2VfbGlzdCk7CiAJCXJldHVybiByZXQ7CiAJfQogCi0tIAoy
LjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
