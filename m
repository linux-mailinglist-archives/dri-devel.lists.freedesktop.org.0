Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02664DD19F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 01:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF7110E8D4;
	Fri, 18 Mar 2022 00:07:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9DED10E8DB
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 00:07:33 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id t187so3870677pgb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 17:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1i8tHBCz0yGUnXTP63evaW8shC/1FTv22ymAKssO43g=;
 b=Ur+HSlhkoIDLHekqpPNSXAVLlxD5+T81ff6OBaHTxdXzokDkA8qnnVLDj9q0QAArhQ
 8B28qd/JYP4jKNuPGjkNF8Z9JI3moyBARf9Nk/nhV0r4cLAzMLmI/7ti/9uugVGYGR/J
 4cAJHw+XO9GiplYxM7ZZn9UlMuvIuvwPzTl/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1i8tHBCz0yGUnXTP63evaW8shC/1FTv22ymAKssO43g=;
 b=ThdbrHBcezDFlfpicoyl1D/lBxYnOqyV14iyHKyNroUQZukO/N49WyWhaWHWkbGIaq
 +SKbzKIG1flAaZxtSiylCVqOoryU67FOYOxUJEX1mh814B28M6wTqfyO5caN6e/zFmXB
 JTMGnFV3BBiyoUMiWV6hrt2lERzrfKD4yEGzyTChB1GPfWPT0qgA2256u24t+dSHOXfV
 qnbz/xMW4KWYoHDQg+uZb+nZ+P12xBgxbCe6Y/svCOxLdHIDNd53WCRaV/qApcmEqdvE
 Y7tvzXmQUHy7ZtWocYcSykWp+WPosn03ALl8viHsG8Lbq5YZgshM6TfZMdiUzxbo/Wzb
 qpwA==
X-Gm-Message-State: AOAM532zoafvW3o51EkSm4It/z1CHYTuLt2JVsNehBrmEY7PjsPGsHVg
 KejlXiMdVDew9JYNOKhqF7/jEQ==
X-Google-Smtp-Source: ABdhPJxx5b5fjDNUn/yUMHMvPSEd5Y6joMRanwaFw9+NHRmy92bdTzHYRpjmt7wsM7IX3PrGoD3Btw==
X-Received: by 2002:a05:6a00:815:b0:4f6:ee04:30af with SMTP id
 m21-20020a056a00081500b004f6ee0430afmr7183021pfk.15.1647562053324; 
 Thu, 17 Mar 2022 17:07:33 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:49cf:7701:359e:b28f])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a056a0015c500b004f76735be68sm8280640pfu.216.2022.03.17.17.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 17:07:33 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Subject: [PATCH] drm/msm/dsi: Use connector directly in
 msm_dsi_manager_connector_init()
Date: Thu, 17 Mar 2022 17:07:31 -0700
Message-Id: <20220318000731.2823718-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The member 'msm_dsi->connector' isn't assigned until
msm_dsi_manager_connector_init() returns (see msm_dsi_modeset_init() and
how it assigns the return value). Therefore this pointer is going to be
NULL here. Let's use 'connector' which is what was intended.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <seanpaul@chromium.org>
Fixes: 6d5e78406991 ("drm/msm/dsi: Move dsi panel init into modeset init path")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

I don't know if this is superseeded by something else but I found this
while trying to use the connector from msm_dsi in this function.

 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 0c1b7dde377c..9f6af0f0fe00 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -638,7 +638,7 @@ struct drm_connector *msm_dsi_manager_connector_init(u8 id)
 	return connector;
 
 fail:
-	connector->funcs->destroy(msm_dsi->connector);
+	connector->funcs->destroy(connector);
 	return ERR_PTR(ret);
 }
 

base-commit: 05afd57f4d34602a652fdaf58e0a2756b3c20fd4
-- 
https://chromeos.dev

