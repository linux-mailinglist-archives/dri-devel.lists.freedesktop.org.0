Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046986A2CC4
	for <lists+dri-devel@lfdr.de>; Sun, 26 Feb 2023 01:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C88EA89D9A;
	Sun, 26 Feb 2023 00:15:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2EE910E2AB
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Feb 2023 00:15:44 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id r27so3934924lfe.10
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Feb 2023 16:15:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6k75IX25C6nkOmgqNZDlRVMdo0fsKzdbKdPhKHiU8ok=;
 b=iBo50LtkN7HydvdseF6H3PVoROb4RcO0VAq2MUGq+mgZWdDiUCRwv3/nlub7shmb8Q
 RqWvbwRDI/Y15ifvkglU/5kpw0lpD3LepDMvMwSyO3NztrZy9L/w3pg3bobovswcN3rI
 j99JysZtjy0s6D5mesoyu/NNytaQI4D4eypx9afRNV+Y6Njj7LinudSQrtegeGKAcIv1
 kjbvrM0hhS+Fr5khFRUN+UXAv9Yo9X0p9+XiDS2/OyydWHadLe/0VCGvQuvFnIo4DRN9
 Wesvz//A2iNTsYzNRrd3RrApxkHMFosd1uiJ+NjbzaOSIGx5RWDeQVV1pYTuSMXqwAVA
 QgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6k75IX25C6nkOmgqNZDlRVMdo0fsKzdbKdPhKHiU8ok=;
 b=IDQCv++sogoJ+W47Dmw+g67evt7pApyTj5iF+T9KNYtnVV5/ASrZjJHDDDMT9CDE81
 qBZ6q/Hn/n17x46Di0SI1A4EqUXdmbonudm4EFVlHxTrvXdOyFm5a+Xq8pPeScgCpCaX
 RsZJNHdXgjmvf3Yrtya7UE/yahQ/P57BwaB2lvw2gFnz93u4XLvr6EazkQ45QQFlsIea
 oEJ16j7BplkqxjaBazdGX/q0afghw2IzbUOF4lY/gZB1trgOs2tGWk9IRL5m2djz4O7Y
 Tgo9SB7YxnhdYH3LhJ0YSEe9WpMu6ntoffjoy7Phygpp7bH2zKsdrktOpTbNWT0Tg90N
 7QHA==
X-Gm-Message-State: AO0yUKU78LqOP56H7tKFtrupy6NMqZAVs2Nxa194Z0QDI35ZTOHR01TK
 bcDxARDjBkbbf44P8fBqrQigkQ==
X-Google-Smtp-Source: AK7set8LYLzXNeruJqVdy3OLK25EmJ7vFXpUjajeKsvLMRTRFIsv2/N5Iz1kH4mR7ynwN8xKJjgwrw==
X-Received: by 2002:ac2:43b1:0:b0:4dd:b479:1ca1 with SMTP id
 t17-20020ac243b1000000b004ddb4791ca1mr1206124lfl.3.1677370543200; 
 Sat, 25 Feb 2023 16:15:43 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 s16-20020ac25ff0000000b004cb3e97bff8sm356238lfg.284.2023.02.25.16.15.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 16:15:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 1/2] drm/msm: drop unused ring variable in
 msm_ioctl_gem_submit()
Date: Sun, 26 Feb 2023 02:15:40 +0200
Message-Id: <20230226001541.788023-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230226001541.788023-1-dmitry.baryshkov@linaro.org>
References: <20230226001541.788023-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable ring is not used by msm_parse_deps() and
msm_ioctl_gem_submit() and thus can be dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index ac8ed731f76d..ca4569609397 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -550,8 +550,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
                                            struct drm_file *file,
                                            uint64_t in_syncobjs_addr,
                                            uint32_t nr_in_syncobjs,
-                                           size_t syncobj_stride,
-                                           struct msm_ringbuffer *ring)
+                                           size_t syncobj_stride)
 {
 	struct drm_syncobj **syncobjs = NULL;
 	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
@@ -803,7 +802,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		syncobjs_to_reset = msm_parse_deps(submit, file,
 		                                   args->in_syncobjs,
 		                                   args->nr_in_syncobjs,
-		                                   args->syncobj_stride, ring);
+		                                   args->syncobj_stride);
 		if (IS_ERR(syncobjs_to_reset)) {
 			ret = PTR_ERR(syncobjs_to_reset);
 			goto out_unlock;
-- 
2.39.1

