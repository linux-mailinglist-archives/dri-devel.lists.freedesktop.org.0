Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01AD32EB9E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 13:52:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCBAA6EB72;
	Fri,  5 Mar 2021 12:51:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 133C86EB6C;
 Fri,  5 Mar 2021 12:51:59 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id e19so3239535ejt.3;
 Fri, 05 Mar 2021 04:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5+MEzouCAMXKhWa9DB1nA2mB6wC+MMPpqVR3AD5SMWQ=;
 b=F6S1ERaCNwBPDwWJWujtt+7uXdfe0s/5LTeo17S+6tjnmSroPJS2M/va8o8ex36tKD
 IzuOGskPrWduikpTfepi8yLd7rOA2KE6KmHZ2FLud0iTDfpKzzXifcJVljmGSdYqOxmd
 ciKemTeM2//FD3jFTjmTKRJyvFoygo2nwSqrhHwHCypguw83tn21X/b/Pqznztbw6gLX
 mta4xDHSS5qaZjFWt72a+3P8adk4Kq6PCK2SgpTH7pkBxB4iLjN4l1vuNf2k6fhuCMBn
 cboIth3SPcDejbJAnomeqLswM8De2og4ZDVAfNnMFTIjAS9djvD3GmFHKWo4so+lYZki
 EyOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5+MEzouCAMXKhWa9DB1nA2mB6wC+MMPpqVR3AD5SMWQ=;
 b=X44/PpinxhaRzlrgfU+6PCAR8cvIn5cNzle5Lq6PQ2/XyuWRVC9fU5wuVf/F77/SH4
 Vktt/71KlfbeGEtKZ5poUF1VIzfEoDGqshPYjD1Ae3Eew2P+x18eHG8SZEEq/shgyK+I
 nsfwDfSmHi95nUJ1azTF1Yqa8SBkHReK6ob1wqBfyaNhoEgH8VRPWOsVSi/TccDVHm2H
 L4kd6Xx9S5slxMIqxKQD6u/iinPmC8jD5Ni5UcK7oWknxTaVR2c4VR1HedqN9HOQO5kJ
 dFyDieyGemXZVhxXQb+Kp2QE1JrhomZRhEmpZilaPPtTzV+y11fa2/tXttljpAgDE4en
 z3/A==
X-Gm-Message-State: AOAM531b1vpxZel5ZCB1Ql+34lztJyz99dLd0+w9MtXIJlcriGCat5fb
 YjO2i6tcAToXXjKG4WzdRJJv8o9OVvBmWA==
X-Google-Smtp-Source: ABdhPJzM+RViHYCYdOi4t1ad2gEnzXlkSSOzNd8NcMxY+RZ6whfOQAF3HLkHx5IoUt0EnHjtNao3UQ==
X-Received: by 2002:a17:906:e0d6:: with SMTP id
 gl22mr2071088ejb.444.1614948717801; 
 Fri, 05 Mar 2021 04:51:57 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d4b7:8d5:a72a:f704])
 by smtp.gmail.com with ESMTPSA id si7sm1433909ejb.84.2021.03.05.04.51.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 04:51:57 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/sched: select new rq even if there is only one v3
Date: Fri,  5 Mar 2021 13:51:54 +0100
Message-Id: <20210305125155.2312-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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
Cc: sonny.jiang@amd.com, Leo.Liu@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBpcyBuZWNlc3Nhcnkgd2hlbiBjaGFuZ2luZyBwcmlvcml0aWVzIG9mIGFuIGVudGl0eS4K
CnYyOiB0ZXN0IHRoZSBzY2hlZF9saXN0IGluc3RlYWQgb2YgbnVtX3NjaGVkLgp2Mzogc2V0IHRo
ZSBzY2hlZF9saXN0IHRvIE5VTEwgd2hlbiB0aGVyZSBpcyBvbmx5IG9uZSBlbnRyeQoKU2lnbmVk
LW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9zY2hlZHVsZXIvc2NoZWRfZW50aXR5LmMgfCA2ICsrKystLQogMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHkuYwppbmRleCA5MmQ5NjViNjI5YzYuLmYwNzkwZTk0
NzFkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NjaGVkdWxlci9zY2hlZF9lbnRpdHku
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vc2NoZWR1bGVyL3NjaGVkX2VudGl0eS5jCkBAIC00NTMs
NyArNDUzLDcgQEAgdm9pZCBkcm1fc2NoZWRfZW50aXR5X3NlbGVjdF9ycShzdHJ1Y3QgZHJtX3Nj
aGVkX2VudGl0eSAqZW50aXR5KQogCXN0cnVjdCBkcm1fZ3B1X3NjaGVkdWxlciAqc2NoZWQ7CiAJ
c3RydWN0IGRybV9zY2hlZF9ycSAqcnE7CiAKLQlpZiAoc3BzY19xdWV1ZV9jb3VudCgmZW50aXR5
LT5qb2JfcXVldWUpIHx8IGVudGl0eS0+bnVtX3NjaGVkX2xpc3QgPD0gMSkKKwlpZiAoc3BzY19x
dWV1ZV9jb3VudCgmZW50aXR5LT5qb2JfcXVldWUpIHx8ICFlbnRpdHktPnNjaGVkX2xpc3QpCiAJ
CXJldHVybjsKIAogCWZlbmNlID0gUkVBRF9PTkNFKGVudGl0eS0+bGFzdF9zY2hlZHVsZWQpOwpA
QCAtNDY3LDggKzQ2NywxMCBAQCB2b2lkIGRybV9zY2hlZF9lbnRpdHlfc2VsZWN0X3JxKHN0cnVj
dCBkcm1fc2NoZWRfZW50aXR5ICplbnRpdHkpCiAJCWRybV9zY2hlZF9ycV9yZW1vdmVfZW50aXR5
KGVudGl0eS0+cnEsIGVudGl0eSk7CiAJCWVudGl0eS0+cnEgPSBycTsKIAl9Ci0KIAlzcGluX3Vu
bG9jaygmZW50aXR5LT5ycV9sb2NrKTsKKworCWlmIChlbnRpdHktPm51bV9zY2hlZF9saXN0ID09
IDEpCisJCWVudGl0eS0+c2NoZWRfbGlzdCA9IE5VTEw7CiB9CiAKIC8qKgotLSAKMi4yNS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
