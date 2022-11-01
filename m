Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CBF615462
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 22:40:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E0610E010;
	Tue,  1 Nov 2022 21:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D769F10E010;
 Tue,  1 Nov 2022 21:40:31 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id z26so1520827pff.1;
 Tue, 01 Nov 2022 14:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iWEKtw3qUiAawaOxdqPs0umv7nzkxV855xae9pF938c=;
 b=VZJNFuV6OqUqkfyPaVBqFRI+HviyopjecL9O6a9KR4Dnv8fxfloSbQqHTlU5JDSJOZ
 Pcaf0S6s8TcGkbxtKETFXAKgbzTe/IXDkokGzWw0acAPUzDDYfblLW7lLXrvM2LC0/vI
 x84dmhX0CRy3+gkufw6qBK8XWvFITUYtX0NmO61tuNL1Jjjzln3Np3G1vqLZGXwh9zId
 7OaeIm9GBk+PK8wQ+66P7wutixk0nL26IhFmix49TwTXFN+2+pWTVTT+4K5uyteDmKpn
 JuC0iT2Lrr+kGhVth0CVFVoI3rZc/YIVMeaLh2Sofc9hoEVbmuOpZEvkL+vtSlk6+Fzx
 qNUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iWEKtw3qUiAawaOxdqPs0umv7nzkxV855xae9pF938c=;
 b=Kq8iBlRngKphJzP1Amw3BdFbc3r9tGZWkN1bmaNj01jSWtVn3duNupNzBE1YyydQ4K
 2xQLFp8uZTs4vCgA+L2qALV6mrNNAXYNt9TWfx4f0mtc5peqrMazOR9nZwyi5sFRyr+f
 nEmGHWJZYIY5jhZ+lynwxOoUuPmzsNgw1wws730Q5hAf3lk9ZiETNJ4voTKhx5Wv5Wp+
 mbCsYqgHToQws9ipHnnlQ2t/iUFUzd3vlc01GNshMoyMcQGXwWL36ZQVoC/1UAitygyh
 cM6yF5JLcRdOwlHk+zzCp8ZETW4suaZtei52HXIWCdpmKhdM4rG9yObq88CzQCqsPsn0
 NnxA==
X-Gm-Message-State: ACrzQf3TTTFXU73VhYelSaNMS7ReuKddMktXd0LPbPf1a2TiLYtOuECN
 qyoMv0UWycPA8dfg1PyoJyAgdoIqUsM=
X-Google-Smtp-Source: AMsMyM7F+3y0j+vNfiWFgdOKBUcgGGtop7epjSDL2dB/w16YWgkhYtADtESEPfIDnchwayqwxrOtJg==
X-Received: by 2002:a05:6a00:224c:b0:56c:40ff:7709 with SMTP id
 i12-20020a056a00224c00b0056c40ff7709mr21623319pfu.59.1667338831058; 
 Tue, 01 Nov 2022 14:40:31 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 y5-20020aa78f25000000b005544229b992sm6964575pfr.22.2022.11.01.14.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 14:40:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Remove exclusive-fence hack
Date: Tue,  1 Nov 2022 14:40:51 -0700
Message-Id: <20221101214051.159988-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sumit Semwal <sumit.semwal@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The workaround was initially necessary due to dma_resv having only a
single exclusive fence slot, yet whe don't necessarily know what order
the gpu scheduler will schedule jobs.  Unfortunately this workaround
also has the result of forcing implicit sync, even when userspace does
not want it.

However, since commit 047a1b877ed4 ("dma-buf & drm/amdgpu: remove
dma_resv workaround") the workaround is no longer needed.  So remove
it.  This effectively reverts commit f1b3f696a084 ("drm/msm: Don't
break exclusive fence ordering")

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 5599d93ec0d2..cc48f73adadf 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -334,8 +334,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 		if (ret)
 			return ret;
 
-		/* exclusive fences must be ordered */
-		if (no_implicit && !write)
+		if (no_implicit)
 			continue;
 
 		ret = drm_sched_job_add_implicit_dependencies(&submit->base,
-- 
2.38.1

