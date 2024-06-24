Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE306915879
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 23:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA6A10E0BF;
	Mon, 24 Jun 2024 21:13:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="H1c0Ls24";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334B410E0BF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 21:13:49 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52ce12707d9so1936902e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 14:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719263627; x=1719868427; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QnAQMhTqxkoTHi2sUlyi5iGRZ0J/13FG1QGdqL66JnI=;
 b=H1c0Ls24pBWbza95IZz24Kux9UdhDmyuOxhL//0Yfe9ATTSmSe/KuA2u/ZboZhuJuG
 Bcb81oo3IF+fEpruQBDh0n/27897xVpO5awEDL6YycdouuZSJShinXrbB2URBSTGiWRF
 4NLTh06EZygfNc7+kWBLcdBtcyAdSyArn0LDAqkfJOZaiZjF+ViuOBMQZ3g7/gvC78+j
 J5TW5uoY75hZ0DlmbiNCS3qdvdcKfUt7Q4KFqikon4FQWt7AGHxfqBS4lasByeOPrqj6
 CFS3yorcTZe0yp0ethBBW7oXeqZJVZeea1Ucy5Y+rhYJTnhVu1DelnfjFzBWnjdwVUkr
 9R4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719263627; x=1719868427;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QnAQMhTqxkoTHi2sUlyi5iGRZ0J/13FG1QGdqL66JnI=;
 b=aIwUhV/XjywEoooglohDDii46nNzl9xZbBVZcMjqBz0m/dqSGTbGvMQPm9kpYguHQT
 cnjcsVxEVy7QbcvI0LP3JZhLrybABzn5n+AhGGCpco65TrmEaFgR35i2UFcY+WGvmKLN
 gYc4vqscHIznBqwWxLlleXR6K4fG8RqB0ierUM6+h92ayqrxb8Bnz3vQyqskGMwL9WWE
 xt15rHJsUwKDbCaDWOhmzekz4I+6P3wjyy25AMtkqgecTh/FHgT0WhqenE6XFcM+aYYD
 2qIQJLAYJk2rCmgqoyQRK2OJqphdaaklkXFnSAsRehSCvweO2uSNnC1EctFGVPWt04Pi
 PYSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPwejbktmRxFdizrFa8C8HQGyaIB9efgBRJAFVPsINCSH3lLAvplZKNHmn3y60sOfdvT537KfMPLa/nAywkGOF6QV7CtLZ1rZqFEBPj5lg
X-Gm-Message-State: AOJu0Yx+NZOzpWCrUSasBPzZyI8245XqxjG+/JuncZwMoJxlgDlh3H8t
 XbQz8x2EBHXyzHzanA52nFDJ4Uk5I4AlJc27nh5j3NWpuH7bvNCRmLIw/AiPWqU=
X-Google-Smtp-Source: AGHT+IEdpZ5JYDr7V8Znxppu0fFUyD+kco0q7CJPmsFD4ZDNHTS3te8ASnZiqa38kdut6xCS5YBoLA==
X-Received: by 2002:ac2:54b3:0:b0:52c:c6a0:575c with SMTP id
 2adb3069b0e04-52ce064e939mr3488507e87.33.1719263627046; 
 Mon, 24 Jun 2024 14:13:47 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 14:13:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:41 +0300
Subject: [PATCH v5 01/16] drm/msm/dpu: cleanup FB if
 dpu_format_populate_layout fails
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-1-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=CRnQPNrk6tMn0RWlkSywOwQLtsZdvuYbpLeYPQfOvOQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGHkTKUSFhd/esJT4kU4yqcOeXPY/1aZhwhY
 ouCUfW6jveJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhhwAKCRCLPIo+Aiko
 1dHEB/4lCSfYAUpyuj9p97n0YydfifdA+CLqgrCwyumcCOIrtmqy/DjWUSMdZpNrUqoUVziJ5cF
 97Cy3Mkr6RVsi3TUv4Z1ZlHOFuLar3WeXhdnncJ0L56qv4HlBfafsZ9wjYbsF2itRhQoEgT7LzV
 6e8jnQRkDXI6YXZiQBazKSE1GOK9nvy/0swaShEgrWrXsVm8vY29MXK5zCCYSyNlRHNhHV/v++p
 b4PxUXta9So50jIrejN+9NxvhwCQLD3gpfhcbHXkGhWkmQI8ieVdo84VfJDas8gFeqZ3C8dcRaT
 ZuYbZ7L04qdfRC5QXnM+EG7unCb24AQpNEc/IrW6ZjSEztDO
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

If the dpu_format_populate_layout() fails, then FB is prepared, but not
cleaned up. This ends up leaking the pin_count on the GEM object and
causes a splat during DRM file closure:

msm_obj->pin_count
WARNING: CPU: 2 PID: 569 at drivers/gpu/drm/msm/msm_gem.c:121 update_lru_locked+0xc4/0xcc
[...]
Call trace:
 update_lru_locked+0xc4/0xcc
 put_pages+0xac/0x100
 msm_gem_free_object+0x138/0x180
 drm_gem_object_free+0x1c/0x30
 drm_gem_object_handle_put_unlocked+0x108/0x10c
 drm_gem_object_release_handle+0x58/0x70
 idr_for_each+0x68/0xec
 drm_gem_release+0x28/0x40
 drm_file_free+0x174/0x234
 drm_release+0xb0/0x160
 __fput+0xc0/0x2c8
 __fput_sync+0x50/0x5c
 __arm64_sys_close+0x38/0x7c
 invoke_syscall+0x48/0x118
 el0_svc_common.constprop.0+0x40/0xe0
 do_el0_svc+0x1c/0x28
 el0_svc+0x4c/0x120
 el0t_64_sync_handler+0x100/0x12c
 el0t_64_sync+0x190/0x194
irq event stamp: 129818
hardirqs last  enabled at (129817): [<ffffa5f6d953fcc0>] console_unlock+0x118/0x124
hardirqs last disabled at (129818): [<ffffa5f6da7dcf04>] el1_dbg+0x24/0x8c
softirqs last  enabled at (129808): [<ffffa5f6d94afc18>] handle_softirqs+0x4c8/0x4e8
softirqs last disabled at (129785): [<ffffa5f6d94105e4>] __do_softirq+0x14/0x20

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 1c3a2657450c..eabc4813c649 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -680,6 +680,9 @@ static int dpu_plane_prepare_fb(struct drm_plane *plane,
 			new_state->fb, &layout);
 	if (ret) {
 		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
+		if (pstate->aspace)
+			msm_framebuffer_cleanup(new_state->fb, pstate->aspace,
+						pstate->needs_dirtyfb);
 		return ret;
 	}
 

-- 
2.39.2

