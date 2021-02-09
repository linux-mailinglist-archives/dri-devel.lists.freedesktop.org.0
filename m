Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C183A315A5B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 00:58:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7C9C6EC0F;
	Tue,  9 Feb 2021 23:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E7AD6E120;
 Tue,  9 Feb 2021 23:48:26 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id e17so460597ljl.8;
 Tue, 09 Feb 2021 15:48:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4swNihDJsoYDJ0JsyJpoLdvvdULpyc/j+WuCFDkGmdk=;
 b=DvGasgA0cBZxp10arB0pzHAA1elBFCn6tbSXE+bUO9kNl0dcAlRLjHFfTwTid6UkaK
 ClaJs+JwM2OWf+ysSQ20FVEj7J9jqethm5mXLVh0iSq+LzI7Pzcdt3rHTpW63cetSWZ3
 KJr+a0sLR97wkDBDC+XBvIGpXAjuG+PvVkRJYHQbiOY53uzGHMsJu7V7DOhQpXkLGD/s
 vrm34aGpfgT7XqPa4R+lUh9iVnPdg76XWg8R2juQt8BJ2nmOUyvV6qcTisw1T16Ai3Dk
 06i80KyIlv934deDzVPavbqkNr+08UtlVJkz4Jm75gmnHuvGPP2bMCYoWEGVT57datxG
 4MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4swNihDJsoYDJ0JsyJpoLdvvdULpyc/j+WuCFDkGmdk=;
 b=EBRHuN0oTSalxtNQ6Edj1jGrPoYEvu4nvfWwTKwFvk1Czc7X8zsOvU05tfNm/yzFUT
 A+6Xddwkod9/+/Q2fW4deAgoEjhPiWu1AWzPCDjd17guT7XOicOtDsDe37JG7cx9cdYh
 IO1MGLOLtzoo4m2h+6K8K6s24MMJzMs0zlbNxaS7nToLuZRR1VNwmL05IFSIIKBMZlIh
 VHXDMZ6fuBBY2CAeL7CrYjeyG/Ah4JLWm1+NgMqSNw22VmcnEc9A9jdtLTCjWgwTN9QL
 EXuxnKr88HIvdvfhwcwNPa4K4mm7vXGL9hp/PB35SOZvBJXE5Xwnswbq1slHY13OT5Kg
 fRFQ==
X-Gm-Message-State: AOAM530ZF9+8VEITKZugzUMNl3L8y0f1bwGYHqzzGjwk2uwvBPWeAWd5
 4DwIUXNm8mtVM58kRd4kyWc=
X-Google-Smtp-Source: ABdhPJwgJMwrUJpmjPdiN4LhVY8dzLtZOmK+2j8dd/eOrcdGwk+wfMPJmghCa/fXf9neZoI5z8dCSQ==
X-Received: by 2002:a2e:804d:: with SMTP id p13mr164131ljg.177.1612914504481; 
 Tue, 09 Feb 2021 15:48:24 -0800 (PST)
Received: from localhost.localdomain (h-158-174-22-164.NA.cust.bahnhof.se.
 [158.174.22.164])
 by smtp.gmail.com with ESMTPSA id c25sm23779lja.131.2021.02.09.15.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 15:48:23 -0800 (PST)
From: Rikard Falkeborn <rikard.falkeborn@gmail.com>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] drm/amdgpu/ttm: constify static vm_operations_struct
Date: Wed, 10 Feb 2021 00:48:15 +0100
Message-Id: <20210209234817.55112-2-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210209234817.55112-1-rikard.falkeborn@gmail.com>
References: <20210209234817.55112-1-rikard.falkeborn@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 09 Feb 2021 23:58:03 +0000
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
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Likun Gao <Likun.Gao@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The only usage of amdgpu_ttm_vm_ops is to assign its address to the
vm_ops field in the vm_area_struct struct. Make it const to allow the
compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 29cfb0809634..a785acc09f20 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -2002,7 +2002,7 @@ static vm_fault_t amdgpu_ttm_fault(struct vm_fault *vmf)
 	return ret;
 }
 
-static struct vm_operations_struct amdgpu_ttm_vm_ops = {
+static const struct vm_operations_struct amdgpu_ttm_vm_ops = {
 	.fault = amdgpu_ttm_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
