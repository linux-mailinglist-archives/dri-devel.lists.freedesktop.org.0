Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B5AC3E3593
	for <lists+dri-devel@lfdr.de>; Sat,  7 Aug 2021 15:35:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866906E041;
	Sat,  7 Aug 2021 13:35:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1716E041;
 Sat,  7 Aug 2021 13:35:30 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id j1so20885572pjv.3;
 Sat, 07 Aug 2021 06:35:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lfpqGuV3FkgsE6sIJlZN1/FnF/i4KwLJkZg8SrqlLBg=;
 b=n2yE//5GuABT5nJx6KwgalyRToS6ZZWdRPUkGs4bCn5D8fqIc02FzVrQC0dGN4IhfH
 oHotltPkWGNezyC/HUjIJJi5E5RvQnfzrcZ1wDOZM7F97ZVyZPjJ3JV6AGlrfizyM2wm
 Lxvi5Ofp7/XjInhXGInEfBl3UwIBQTMx2L3k3bNJkdlGOS4sx2VHTDO+XywlHK0yWzT2
 ZcHVn0VeyTqyFQoGftZQO7MopnOCAbY2s6Fe/l4glECvldZ2Q9ZqaEq2zqlGW6eTmXWk
 maqxSLbcGAEnBIoTESH+O7hEK5nsuVWKby7CHjRmrhxUo/P/OTfdqHf1MB5Mn4X/gj4H
 7S1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lfpqGuV3FkgsE6sIJlZN1/FnF/i4KwLJkZg8SrqlLBg=;
 b=lfHWLzxjXB5msCDtzvBGaOa10kRqAxw1f2gnGntJZfwtizdbTcgWPHxTOWK3zvAe4O
 /TMZoFbSBZsMbdLcGRnxaMGNTXYo02Jy6s25zVGN4nsv8U7qPcqAsHqeymFKYdeclAiC
 Q80pg7+pIGz5FSHLxQayxaAUgKv1DOYGZCtiSaz7Ekjgu5IeJciJi6SbtOfCV6a6E7H1
 DfHlZ7jcGdYtm7NixThelEqBrypT9keLsXrTmfnLbq49Iqj7Bva0Nyp2Tq8t3bA1D7dC
 pOZHKz0Jmluf+APsXlgHsw/JkfXNCOhAMLt4mQfv68xKGd0cbu2sGj4YzP8A532C8EqX
 7yAw==
X-Gm-Message-State: AOAM530G3QWWHZT7wpZYcSmWJzYSvGtds5U7K/4hOgc0fQ4ncltXdPea
 FF3fkuzzgfmfGNPQHoy+biM=
X-Google-Smtp-Source: ABdhPJzbVausotJitV6ge4yNPA7o0Hk53NaWfOlofLSePiuEcrn4dtEvTiUa50T0wpMbQr4qucxIKw==
X-Received: by 2002:a17:902:c3cb:b029:12c:a426:164a with SMTP id
 j11-20020a170902c3cbb029012ca426164amr12991599plj.81.1628343330316; 
 Sat, 07 Aug 2021 06:35:30 -0700 (PDT)
Received: from localhost.localdomain ([45.135.186.87])
 by smtp.gmail.com with ESMTPSA id cu12sm15967183pjb.5.2021.08.07.06.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 06:35:29 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, lee.jones@linaro.org, trix@redhat.com, Chris.Park@amd.com,
 Ashley.Thomas2@amd.com, Charlene.Liu@amd.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 Tuo Li <islituo@gmail.com>, TOTE Robot <oslab@tsinghua.edu.cn>
Subject: [PATCH] drm/amd/display/dc/dce112/dce112_resource: Drop redundant
 null-pointer check in bw_calcs_data_update_from_pplib()
Date: Sat,  7 Aug 2021 06:35:06 -0700
Message-Id: <20210807133506.243629-1-islituo@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable dc->bw_vbios is guaranteed to be not NULL by its callers.
Thus the null-pointer check can be dropped.

Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
index ee55cda854bf..3fc8e6b664f9 100644
--- a/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
+++ b/drivers/gpu/drm/amd/display/dc/dce112/dce112_resource.c
@@ -1064,7 +1064,7 @@ static void bw_calcs_data_update_from_pplib(struct dc *dc)
 	struct dm_pp_clock_levels clks = {0};
 	int memory_type_multiplier = MEMORY_TYPE_MULTIPLIER_CZ;
 
-	if (dc->bw_vbios && dc->bw_vbios->memory_type == bw_def_hbm)
+	if (dc->bw_vbios->memory_type == bw_def_hbm)
 		memory_type_multiplier = MEMORY_TYPE_HBM;
 
 	/*do system clock  TODO PPLIB: after PPLIB implement,
-- 
2.25.1

