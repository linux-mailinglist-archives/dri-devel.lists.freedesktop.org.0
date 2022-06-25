Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B795855AD09
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E06E10E302;
	Sat, 25 Jun 2022 22:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89B910E302;
 Sat, 25 Jun 2022 22:55:00 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id t21so5687745pfq.1;
 Sat, 25 Jun 2022 15:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=b9AQXf/WNrNc7N52p1TXe/6XsOcmDEDaje1UkHX1E8o=;
 b=okxVvZPaPPWukgtMjoQ2zV2MOXVKhOwgEQOvy9s8dCC6F7E0d7C4RjjeWQUWzwZAkm
 HbgBHZeHh0rktafpVgdIjgiSpmmOqw6xg9YkCjTrPLgusIAG2HJs/PA8era9WpIh93Nt
 z+8xYrS0D9c7kB3yJ0kSruPdVZNGl/y00bgLEScL7cZxATvRwI2y+GxE69koJf33oyJo
 PlR4+li5IUTvUqMQVruUfcPoE25FkgSHT5zi9AICxEUBmH2KbCO2hbzvJRXUehRP8H2i
 SfIsa5IIuErdOtEu8xGLJBrd9pLz2FRkhenzvHZtjjN8UHlbhAKkBF4nxFdCTymjt0Qi
 B+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=b9AQXf/WNrNc7N52p1TXe/6XsOcmDEDaje1UkHX1E8o=;
 b=aF1IbkUqdxA6Y0BP3/8KuojxBSKSxK6eUNJ5qVaxy3uoZU7mRuRYex/3JJi8x9MZvg
 GW6g2xH4PFeBClRDY44KBVTBv1iHaZHvON5BD9DV/OeV1c3tjCRnPnEPIxUbvM1WCVew
 YYMQrp4gARdbNTCHoooFbv2Jq2XeYlbvOioiiPFFCa3e+DMauj6pT7YAzF8iH2/DRkJo
 YRpSCUtfpsuq4sjdFKXS3VIHI9TcaiPKjBZ7ooMu3ECyzPPH03vw3+l3Q5oeE30GD9U3
 eE5FF/GPzubzDOPqSLmFYeDfSQFgEFFGVev1HnOpTeyzq20kH+0/hCS8p6VRE6pzsgFV
 8OBA==
X-Gm-Message-State: AJIora96gsJuan6LUtM6fsrOhawFKWjBfGXrUtDr6btJdRtB3/88kH3G
 El4FAN9yIkRRsZIYL0uCrStz6AC5SN0=
X-Google-Smtp-Source: AGRyM1uZ3CwKWuR6uDhS+F4l+oftGA9Xv00IBSUo91DHn+OXfWfzgkeYBrHk2SEcfJPI7kLktGC3UA==
X-Received: by 2002:a05:6a00:2312:b0:525:392a:73c3 with SMTP id
 h18-20020a056a00231200b00525392a73c3mr6465551pfh.67.1656197699690; 
 Sat, 25 Jun 2022 15:54:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id
 h6-20020a170902680600b00163ffe73300sm4205641plk.137.2022.06.25.15.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:54:58 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/15] drm/msm: Switch to pfn mappings
Date: Sat, 25 Jun 2022 15:54:36 -0700
Message-Id: <20220625225454.81039-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220625225454.81039-1-robdclark@gmail.com>
References: <20220625225454.81039-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

I'm not entirely sure why we were using VM_MIXEDMAP.  These are never
CoW mappings.  Let's switch to be more consistent with what other
drivers and the GEM shmem helpers do.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index ad7da2ca35ab..8ddbd2e001d4 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -259,7 +259,8 @@ static vm_fault_t msm_gem_fault(struct vm_fault *vmf)
 	VERB("Inserting %p pfn %lx, pa %lx", (void *)vmf->address,
 			pfn, pfn << PAGE_SHIFT);
 
-	ret = vmf_insert_mixed(vma, vmf->address, __pfn_to_pfn_t(pfn, PFN_DEV));
+	ret = vmf_insert_pfn(vma, vmf->address, pfn);
+
 out_unlock:
 	msm_gem_unlock(obj);
 out:
@@ -1051,7 +1052,7 @@ static int msm_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 
-	vma->vm_flags |= VM_IO | VM_MIXEDMAP | VM_DONTEXPAND | VM_DONTDUMP;
+	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
 	vma->vm_page_prot = msm_gem_pgprot(msm_obj, vm_get_page_prot(vma->vm_flags));
 
 	return 0;
-- 
2.36.1

