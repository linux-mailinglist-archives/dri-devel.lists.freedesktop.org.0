Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D301F8FC2
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:28:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 265126E286;
	Mon, 15 Jun 2020 07:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 847A96E142
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 06:56:19 +0000 (UTC)
Received: by mail-il1-x144.google.com with SMTP id z2so12481685ilq.0
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 23:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=TpliVuQU/7sLPsVM57NGaPTp0yUaPg8e9YE17AlDXcs=;
 b=ruCs9b9YlQlECerNcDTwY4ZAksDlHdq9kuYVhDkV1NCpUcGPSMcisPqw3OyZY3+xSC
 NLssw50CcD5BMG8oXmMvOPUqfMBZLjAKU0hslN8gofADZ7S9K2U0cq9taQRBjgKNYxIb
 D8NpUHWPP45WH/HDRaGr2larfLEPRyJ+ymOBgAMFwztfX5iDrwrV9YZkBAaAgDwBHyPB
 A1klb/6XOXwF84xLfHqjWEvTFKKP6nRAp/eIowms/lN31Wi6bdyMH2nBbz2OvbCtGJw4
 TExRz7f+x1Co/KwqSzmIMSa1ruWhttvhNsmXAGBoLh/QA70RNUuAFpo4+1QzBt0sOg4Q
 OtDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=TpliVuQU/7sLPsVM57NGaPTp0yUaPg8e9YE17AlDXcs=;
 b=GyWcJNlFFOmkwjcxBSFaWOi+2GXoW0JLZihqqvO+Gm89FMnaCvu9a381FMzHdINUom
 Rf21IQe4vUjEqeL8ygxaFfdKFNOib3lJorViVGafvPMDj5rqc9EUMSLkK6JhZQK2f0fm
 pMEOdjXQMuN3LKaenl5OZ+h4Zf2uJsTeCmlL8LgpTL/tEbVFiBR0vGFwJBSjENZtnqbS
 paDffg21270q1Ns1NcH3Y4UVF8oYRSof52SJJr5qK8Cnopsfi+yw9xpIbUe7fEsypLze
 uyYp0RfAkSN8VbxqonSrBCc/8hSwxboGyKaWQOIlV+YDCW3oCaJkvsRtnxuTBMkqYlIV
 CFuw==
X-Gm-Message-State: AOAM532M4Luhb24XiX6P+iCb13TIx0drDWOQfX/kwSNIFCSAtR/4qAxe
 ozeezbIM7L1u4egSaJ4AFFA=
X-Google-Smtp-Source: ABdhPJzCzdSi2+fMwP6dLfmzzHIJihb+qkY/Q1cEa56HUaaAiTm+jtNydLieCm1FcWQT0NimzorZ5Q==
X-Received: by 2002:a92:8b0a:: with SMTP id i10mr19990532ild.245.1592117778866; 
 Sat, 13 Jun 2020 23:56:18 -0700 (PDT)
Received: from cs-u-kase.dtc.umn.edu (cs-u-kase.cs.umn.edu. [160.94.64.2])
 by smtp.googlemail.com with ESMTPSA id c20sm5823570iot.33.2020.06.13.23.56.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 23:56:18 -0700 (PDT)
From: Navid Emamdoost <navid.emamdoost@gmail.com>
To: Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vc4: fix ref count leak in vc4_v3d_pm_get
Date: Sun, 14 Jun 2020 01:56:11 -0500
Message-Id: <20200614065611.69502-1-navid.emamdoost@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: Navid Emamdoost <navid.emamdoost@gmail.com>, emamd001@umn.edu, kjlu@umn.edu,
 wu000273@umn.edu, smccaman@umn.edu
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

in vc4_v3d_pm_get, the call to pm_runtime_get_sync increments the
counter even in case of failure, leading to incorrect
ref count. In case of failure, decrement the ref count before returning.

Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_v3d.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index cea77a21b205..bb03c1d1bb4d 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -135,6 +135,7 @@ vc4_v3d_pm_get(struct vc4_dev *vc4)
 
 		if (ret < 0) {
 			vc4->power_refcount--;
+			pm_runtime_put(&vc4->v3d->pdev->dev);
 			mutex_unlock(&vc4->power_lock);
 			return ret;
 		}
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
