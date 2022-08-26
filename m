Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 871F75A24AC
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:40:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8DC210E7D6;
	Fri, 26 Aug 2022 09:39:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2454B10E7E2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 09:39:35 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id n15so1294664lfe.3
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 02:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=XJBZo86NwzlYcDfKiueYzUkDbZYleRySpVsik2jGH+A=;
 b=qpR7kKD1V3xBxJwj/wDBDO/SFHHHvlDYnlDrpv2aTla7l7Bj4pq1d8enTjpRnpHyOL
 JFrcTElR51YXfx7D8/A5baErgAx6mSa6V5OxSBF67SGUvWDHF18O423UGhbIXXi3Daen
 mcgUicIXXgq/Tek4pesS7vw4IHg30mihFUX/+hJ/dacuXegYwujWZeQ6q3HhUC260bnb
 4RaGeovYLe/gjJz1VSubMQHyrHAttkgcGqA5/qVDk1ZdzQZVD0ludYmRI3rIbO2Y+11k
 o8m2ent+YZyehIkednJG0R0ssgYxtNqK8lG3pT+qI9tH5UlZJ2Xv8VPLm5QKzP6zYeDo
 j0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=XJBZo86NwzlYcDfKiueYzUkDbZYleRySpVsik2jGH+A=;
 b=Cv0MwEGBkiBbGjx8jUc+n8zIRMapdoxhkmbfIrdMyvxQsSX4dNK7haGkXe8mnCN0rk
 zjTdxbMITO1u8GvdIOXiH9wp5b8Gk+9XZz11VLRQhFf/buH+sy7jlUVlfk7FlIPFw7rD
 btBBpHcDtZLaYVDTzbkdaHoSndSJtbamrhKP84cDOphUJopRT5bHMP59N4uv23GvSHut
 egWOrJFybZZcpA7ld/R32ngpTeAOAYRYTqE5g2uxfk3a5D/GVyUci8dZBUCQ7crVMGWy
 e83UsuZN4S08yGJLx9Wpx4e6dLS1OenGjpr91RRRld36wr7ONCMp3vLr4OApkWvCwqsH
 VX9A==
X-Gm-Message-State: ACgBeo3fp/L/GWQaO3qgSQ9NUuAD21G18QuezuiqnQveYw7ePsjpnPqR
 Hv2RlWAZtf0bTXtqQEiBxDUZZQ==
X-Google-Smtp-Source: AA6agR5dRIkH6udc5pKFMe1bhIYgbLLZvNUngMjDNapUvHnC/ilmRHVTVwwJnT4S7oGbP+Stft24mw==
X-Received: by 2002:a05:6512:acd:b0:492:b8e0:2ef4 with SMTP id
 n13-20020a0565120acd00b00492b8e02ef4mr2091002lfu.360.1661506773119; 
 Fri, 26 Aug 2022 02:39:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 m6-20020a195206000000b004886508ca5csm329055lfb.68.2022.08.26.02.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 02:39:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 4/5] drm/msm/hdmi: don't take extra reference on PHY device
Date: Fri, 26 Aug 2022 12:39:26 +0300
Message-Id: <20220826093927.851597-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
References: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The of_find_device_by_node() already increments the device's usage
count, so there is no need to increment it again using get_device().
Drop this extra get_device().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index c298a36f3b42..926274eeee25 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -106,7 +106,7 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
 		return -EPROBE_DEFER;
 	}
 
-	hdmi->phy_dev = get_device(&phy_pdev->dev);
+	hdmi->phy_dev = &phy_pdev->dev;
 
 	return 0;
 }
-- 
2.35.1

