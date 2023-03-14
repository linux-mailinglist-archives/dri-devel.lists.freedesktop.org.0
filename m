Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488126B99AC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 16:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 157D110EAA5;
	Tue, 14 Mar 2023 15:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9A7610E14E
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 15:35:53 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id by8so16435459ljb.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 08:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T8AY2x4RlliuFkg2Z8nj7IhCEeLlc7LNImyvgGViYUQ=;
 b=NAwJRccVG8PhOICMTTBlwaMgBHAML3Sr6mgGnOX7C0iWCU6Nn3eHZ2EZZSWtBrq4Cr
 K9HY0eUZevEgvyLAx/rKaZP6kbHL7o0zGfT8l3qirIgEYPAFfNC1yswZjS2LEaCqUPtz
 7zCtEnB52iBBgSB7aDCahvPyM3KRQtFr68fKre8Cnbv0+DtfO+hvdQAPqJ+3/SPdzE8S
 XJdTg/OFy7AYDOn1edJJ4Gfkiuc6NmbyvV950470oIztA3VSkJQXkKcLOdWIcNUuyWit
 sDvAaT0jKq02eA/KmzVR0/TSlZd33F2p7xvQVY2WNphLkBVycLyPYc1ooJu9nZlp9MI6
 vINA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808153;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T8AY2x4RlliuFkg2Z8nj7IhCEeLlc7LNImyvgGViYUQ=;
 b=bumKiELVsfQfHCxVHP/dXTaEFviJ/x1I9w3d2srOHCm9pG1fN3lHrmSPKa0+S8DwsH
 tVpDXIh05wcqFn11y+6X7XTo075Kl7OWggVpBa/lY8QvvfRXhkcOdlK61MZVAYVso3dt
 VWAsAQ/nHtueSUiB85q2lVPTLGVgJuPAIu1FliE4hdexphIyvr5esI85ty1nOFoSjOVf
 KKcJPgF84S8EcW8Y7fXdt1fvlZhZVVw5p3E8NCe+UbXRrx87qADDm30S7NTGlOiW6rPX
 fC5hew4TeX1kVMDCNsJ/0gQ4jV0vrxZAIVj/3RJqTFEVwd+xPADhGro5lIWoXZDvUlOT
 R0mQ==
X-Gm-Message-State: AO0yUKW5FUtBxsH7o0rT/uhwtVqDsKrPpvXEHuMRaQfOL/smmtE46yYS
 KHvEE+8c1xB0d+FjbY6vtuMXHQ==
X-Google-Smtp-Source: AK7set8drnYJdNNAOTEFe8xSf353UXYmHIurctxJXtUdLMlnNv6nbwCZggbnrfx0Lz7da4bgRMPVyQ==
X-Received: by 2002:a2e:9217:0:b0:298:9d0c:ad65 with SMTP id
 k23-20020a2e9217000000b002989d0cad65mr1024286ljg.4.1678808153515; 
 Tue, 14 Mar 2023 08:35:53 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:35:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v6 10/32] drm/msm/dpu: clean up SRC addresses when setting up
 SSPP for solid fill
Date: Tue, 14 Mar 2023 18:35:23 +0300
Message-Id: <20230314153545.3442879-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
References: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
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

Set SSPP_SRCn_ADDR registers to 0 while setting up solid fill, as we can
not be sure that the previous address is still valid.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 3030cd3b253a..0a43c5682b2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -563,11 +563,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
+	struct dpu_hw_sspp_cfg cfg;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
+	/* cleanup source addresses */
+	memset(&cfg, 0, sizeof(cfg));
+	ctx->ops.setup_sourceaddress(pipe, &cfg);
+
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
 	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
-- 
2.30.2

