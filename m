Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1574972A829
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jun 2023 04:12:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D66910E172;
	Sat, 10 Jun 2023 02:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B882510E172
 for <dri-devel@lists.freedesktop.org>; Sat, 10 Jun 2023 02:12:08 +0000 (UTC)
Received: by mail-pj1-f49.google.com with SMTP id
 98e67ed59e1d1-25bb2c4c2c0so34377a91.3
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jun 2023 19:12:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686363128; x=1688955128;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uono/nwyy6EGIB3S/PXdMtEwaggYlfpIknOEvbCtnJ4=;
 b=CtUSTxLdt5PQhioqilOWRrRSMhf7Gf8G5FOTagTrmeoHPMYC7e76AbK87+m2i8/bp4
 jen8ooHaiVmRPGez8WfOghlmP3g/qSGsp05ziW2BMdzETf91MiM6jrQvtc38FPZAGDpY
 wN/jf3gWwg0jA/LQwnBTE/pDSs/Lp+mOz13j6emg1gxZJ7jxbfRTBuYzUxS0Elp98wvJ
 0MK3hLVPOR6DSmbeWAADvZCAsbvOiRDFXmTs7zFZ1tcqj1nxvxmeIrUOel/nU/AaqaB4
 sCX0Is92Q1uwMVsSALd3OLNY/mlu54kTpJ4cOKZV1a2SMcVeyRRc1aEa9R5ZbkNeFtFz
 7sqg==
X-Gm-Message-State: AC+VfDzdoRcbHC2RpSjArSTmYT/Lfpm0jlnYuewrujf+AO1DSiyV1K+V
 fshDFvMF+j0Kk9PS6QQxNGg=
X-Google-Smtp-Source: ACHHUZ7kZJrNmG7xjdOyI7pxuUk8NTtD/i0/zWXZuSVbn+d7hXEyrJ5OvyyJkKllNX9KQXL6tEPrWA==
X-Received: by 2002:a17:90a:7104:b0:255:d878:704a with SMTP id
 h4-20020a17090a710400b00255d878704amr2882029pjk.4.1686363127368; 
 Fri, 09 Jun 2023 19:12:07 -0700 (PDT)
Received: from dev-linux.lan (cpe-70-95-21-110.san.res.rr.com. [70.95.21.110])
 by smtp.gmail.com with ESMTPSA id
 pq8-20020a17090b3d8800b00258bb7e8b47sm5251594pjb.50.2023.06.09.19.12.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jun 2023 19:12:07 -0700 (PDT)
From: Sukrut Bellary <sukrut.bellary@linux.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, Oded Gabbay <ogabbay@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Subject: [PATCH] accel/qaic: Fix dereferencing freed memory
Date: Fri,  9 Jun 2023 19:12:00 -0700
Message-Id: <20230610021200.377452-1-sukrut.bellary@linux.com>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-arm-msm@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Sukrut Bellary <sukrut.bellary@linux.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

smatch warning:
	drivers/accel/qaic/qaic_data.c:620 qaic_free_object() error:
		dereferencing freed memory 'obj->import_attach'

obj->import_attach is detached and freed using dma_buf_detach().
But used after free to decrease the dmabuf ref count using
dma_buf_put().

Fixes: ff13be830333 ("accel/qaic: Add datapath")
Signed-off-by: Sukrut Bellary <sukrut.bellary@linux.com>
---
 drivers/accel/qaic/qaic_data.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/qaic/qaic_data.c b/drivers/accel/qaic/qaic_data.c
index e42c1f9ffff8..7cba4d680ea8 100644
--- a/drivers/accel/qaic/qaic_data.c
+++ b/drivers/accel/qaic/qaic_data.c
@@ -613,11 +613,13 @@ static int qaic_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struc
 static void qaic_free_object(struct drm_gem_object *obj)
 {
 	struct qaic_bo *bo = to_qaic_bo(obj);
+	struct dma_buf *dmabuf;
 
 	if (obj->import_attach) {
 		/* DMABUF/PRIME Path */
+		dmabuf = obj->import_attach->dmabuf;
 		dma_buf_detach(obj->import_attach->dmabuf, obj->import_attach);
-		dma_buf_put(obj->import_attach->dmabuf);
+		dma_buf_put(dmabuf);
 	} else {
 		/* Private buffer allocation path */
 		qaic_free_sgt(bo->sgt);
-- 
2.34.1

