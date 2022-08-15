Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 757475935FB
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 21:01:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DC9CD25E6;
	Mon, 15 Aug 2022 19:00:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2B1DCAD02
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 18:59:49 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id fy5so15059681ejc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 11:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=AdvFut0rh/uAXAtDtXUY+tZD5YgCj1fQLBVIkWg1+DY=;
 b=RgSVVDv9ex5/MCPn8FHgzf/MUryraeV0+Nf8f5TDGaf1eTv8FPrVYKCaKFmDfCn+Tb
 qFdvpaQ8uHmX/Dcn3kwvWGjwSItnp0FcP92yUdJJlQnS7VNqL5oPMmo+VtYP3Sh2V3UU
 drJpXOXbgQClLubPBmSo7Flxfz1L831BkN3rv0jKHky+yAQJXMLQMcIeoTlVBtAyJXSx
 IpNUF5aRVN20m5H1D9Jsymux7sHkTlYEdEwr0OlyW1SlJEh3IsZTDfuIvYZYOOk2/144
 zIzz22GYe0O52ER0VslV2VuJtOiD5EOEawP1MSSDZopVlYsewHIdi/c3behTMJHlISyz
 kWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AdvFut0rh/uAXAtDtXUY+tZD5YgCj1fQLBVIkWg1+DY=;
 b=yBMDajJEbcwmJh0WZ7JWNxXFTRuWnLQHraHM2QQ+bZdeGeR/stVQ4wv5jEc2dZzvLE
 v7rzWW07OIWNKZP6+VHIHodrrJyCwX6g2CHpv+LPizNWIrq97LXoXhuAcsqyIw+mJqAe
 6GlRwykGBH+VdYWmYDC2pixRtcy/ZhbvlWoMru4wllbyE4sjZKczc6Be0gfldhDPwpaD
 EVpRXGsNI2urmMssgYTQnygTSuZfs3udKCBQ8Aefmitb6vadEQ0+HjZUoCiZjQhvWjlu
 5UKjdV4qWfznok2r9eGbSAk8TBcEuBBcau2hW9ZN5fxdslCq1SmFG8oc5UfH0tq2+9fa
 bNbA==
X-Gm-Message-State: ACgBeo3jXdc3BOjMPo2+N1A6WHLsXjSuxbtAr/HJUFtQ3SCmjSijPlBc
 VOZDHSq5ikzUFnPB8Dg1JknmdlPDV0k=
X-Google-Smtp-Source: AA6agR4tAryyDv0dRp0xcsokaIrVd7cn5zYI7MEN1TKTmwu1PHmQpqLpuNauZH5NlL/soqxnWNvZFw==
X-Received: by 2002:a17:907:7b95:b0:72f:9c64:4061 with SMTP id
 ne21-20020a1709077b9500b0072f9c644061mr11138809ejc.351.1660589988220; 
 Mon, 15 Aug 2022 11:59:48 -0700 (PDT)
Received: from able.fritz.box (p57b0bd9f.dip0.t-ipconnect.de. [87.176.189.159])
 by smtp.gmail.com with ESMTPSA id
 d10-20020a170906304a00b00731745a7e62sm3553805ejd.28.2022.08.15.11.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 11:59:47 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/10] drm/amdgpu: remove SRIOV and MCBP dependencies from the
 CS
Date: Mon, 15 Aug 2022 20:59:35 +0200
Message-Id: <20220815185940.4744-6-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815185940.4744-1-christian.koenig@amd.com>
References: <20220815185940.4744-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We should not have any different CS constrains based
on the execution environment.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
index b9de631a66a3..dfb7b4f46bc3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
@@ -323,8 +323,7 @@ static int amdgpu_cs_p2_ib(struct amdgpu_cs_parser *p,
 		return -EINVAL;
 
 	if (chunk_ib->ip_type == AMDGPU_HW_IP_GFX &&
-	    chunk_ib->flags & AMDGPU_IB_FLAG_PREEMPT &&
-	    (amdgpu_mcbp || amdgpu_sriov_vf(p->adev))) {
+	    chunk_ib->flags & AMDGPU_IB_FLAG_PREEMPT) {
 		if (chunk_ib->flags & AMDGPU_IB_FLAG_CE)
 			(*ce_preempt)++;
 		else
@@ -1084,7 +1083,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
 	if (r)
 		return r;
 
-	if (amdgpu_mcbp || amdgpu_sriov_vf(adev)) {
+	if (fpriv->csa_va) {
 		bo_va = fpriv->csa_va;
 		r = amdgpu_vm_bo_update(adev, bo_va, false);
 		if (r)
-- 
2.25.1

