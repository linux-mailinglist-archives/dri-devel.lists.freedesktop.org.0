Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAA8475FC9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 18:49:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B9110F5A3;
	Wed, 15 Dec 2021 17:49:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF0D110F59F;
 Wed, 15 Dec 2021 17:49:33 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id y8so17120686plg.1;
 Wed, 15 Dec 2021 09:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5TKn9BEzW+NQEp96roozEjZVgCiZc4QtW5+v79OS1QU=;
 b=nGDCosfqZCu/zS/RAlfY8elb53ao7fxGZPqQw0tWcg5ogCCqlzg+UdxtJhGTgyf0aQ
 ufbS+/DJdChk2dD2DiarbEQicN+vgumN4cA36W92TZywuANIlIj5h3conY79G8hJ1ZJE
 YrZz1jleDN8f2gnsGXE00YLIIEb50fxeQShvOXqeRDZTlW/ACxqJFU0AtuxpyN+8LlYo
 5qhiuhDiy86MFNHil1YdxetlB+BRgGF9g/i6vCxo+4S3lwP2SY6x2GkbDXBD5VmL3Fzz
 17qi37CJt3OY/er5jljgspVCpFpzKSSnVqVEuRDOSuXN8XefhSNFO0jBVjtwCp2rFSfC
 QNZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5TKn9BEzW+NQEp96roozEjZVgCiZc4QtW5+v79OS1QU=;
 b=0ODJ8k0QrIk63PPllREUYzHBdl2egobtMaCJmDTi2pbk09WOQrvTZFuYU+Idqq6PPc
 2PqcuJt+7GzAlTYkpYU+wRtsoZjP7+AwW5RqcUxYkc0VTc68UecCI7vxleuKqBqPkLH8
 /wsl1yPRTxInMhUwY72cPpfYizDJM4HkZXEM6NRRi0egUUZq7ah9qcXmGn/MQrmn3sFn
 12kghhC3CxAmX1DVhm8+YHCi5DtVAcMbaCYlqDvTqrjAYevxcfZP/jRmELiyaCvdTxp2
 pe/3yMgRqYb1J/GlzaPGoxee7iQEpGZAQnnvjb+l+B2V7ETLdDlqEqeSmOMVSiXhEN/7
 9WLg==
X-Gm-Message-State: AOAM532S30hRJCGFzyJ7eHRp58czknElLMFvuiIyx4/62N78UmPnUDjA
 0VGCRCi6K9UkPvZFHzlMucciYr2D+EQ=
X-Google-Smtp-Source: ABdhPJwIokaKODcNaYVxdUhtojJD2kgv43r1kdDbhVUxeVvjlOIrG+/EfYyaui0AYEGeRB6RlSOggw==
X-Received: by 2002:a17:902:c215:b0:148:af14:6e96 with SMTP id
 21-20020a170902c21500b00148af146e96mr2284357pll.80.1639590572674; 
 Wed, 15 Dec 2021 09:49:32 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 k91sm3853810pja.1.2021.12.15.09.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 09:49:31 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm/msm/disp: Export helper for capturing snapshot
Date: Wed, 15 Dec 2021 09:45:07 -0800
Message-Id: <20211215174524.1742389-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215174524.1742389-1-robdclark@gmail.com>
References: <20211215174524.1742389-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Guo Zhengkui <guozhengkui@vivo.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Doug Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Alexey Dobriyan <adobriyan@gmail.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

We'll re-use this for debugfs.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c | 28 +++++++++++++++-----
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h | 10 +++++++
 2 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
index a4a7cb06bc87..580ea01b13ab 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -28,29 +28,43 @@ static ssize_t __maybe_unused disp_devcoredump_read(char *buffer, loff_t offset,
 	return count - iter.remain;
 }
 
-static void _msm_disp_snapshot_work(struct kthread_work *work)
+struct msm_disp_state *
+msm_disp_snapshot_state_sync(struct msm_kms *kms)
 {
-	struct msm_kms *kms = container_of(work, struct msm_kms, dump_work);
 	struct drm_device *drm_dev = kms->dev;
 	struct msm_disp_state *disp_state;
-	struct drm_printer p;
+
+	WARN_ON(!mutex_is_locked(&kms->dump_mutex));
 
 	disp_state = kzalloc(sizeof(struct msm_disp_state), GFP_KERNEL);
 	if (!disp_state)
-		return;
+		return ERR_PTR(-ENOMEM);
 
 	disp_state->dev = drm_dev->dev;
 	disp_state->drm_dev = drm_dev;
 
 	INIT_LIST_HEAD(&disp_state->blocks);
 
-	/* Serialize dumping here */
-	mutex_lock(&kms->dump_mutex);
-
 	msm_disp_snapshot_capture_state(disp_state);
 
+	return disp_state;
+}
+
+static void _msm_disp_snapshot_work(struct kthread_work *work)
+{
+	struct msm_kms *kms = container_of(work, struct msm_kms, dump_work);
+	struct drm_device *drm_dev = kms->dev;
+	struct msm_disp_state *disp_state;
+	struct drm_printer p;
+
+	/* Serialize dumping here */
+	mutex_lock(&kms->dump_mutex);
+	disp_state = msm_disp_snapshot_state_sync(kms);
 	mutex_unlock(&kms->dump_mutex);
 
+	if (IS_ERR(disp_state))
+		return;
+
 	if (MSM_DISP_SNAPSHOT_DUMP_IN_CONSOLE) {
 		p = drm_info_printer(disp_state->drm_dev->dev);
 		msm_disp_state_print(disp_state, &p);
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
index 31ad68be3391..b5f452bd7ada 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -84,6 +84,16 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev);
  */
 void msm_disp_snapshot_destroy(struct drm_device *drm_dev);
 
+/**
+ * msm_disp_snapshot_state_sync - synchronously snapshot display state
+ * @kms:  the kms object
+ *
+ * Returns state or error
+ *
+ * Must be called with &kms->dump_mutex held
+ */
+struct msm_disp_state *msm_disp_snapshot_state_sync(struct msm_kms *kms);
+
 /**
  * msm_disp_snapshot_state - trigger to dump the display snapshot
  * @drm_dev:	handle to drm device
-- 
2.33.1

