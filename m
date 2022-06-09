Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DE7E544BE7
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jun 2022 14:24:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 724D311BE7E;
	Thu,  9 Jun 2022 12:24:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACF4D11BE5D
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jun 2022 12:24:04 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id b12so14971542ljq.3
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jun 2022 05:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ui0unneZE7BMiOaLERLPySBQhcdhLuTjLknA7+UsfE0=;
 b=HPByxhGaDalzJm58MrIWMB9jh++xSbzG0pze660M++vV7YBptqiyHE7Kv8DvdHYyKC
 D5i1QxFWzRN/reF17ukqawcCVmgoYxwNACV4DFhOxKEmX42sg2jg/cv3BTfaBcP6ytIW
 kgJLm3HLqv/BUpW+AnzAxg+NZLLHNLF/2MgNHjlyQ18Ty32UoKgM9TdfX1AGi4OXIKYg
 jgt1aCqItL16U4xdprVkJ8QPBH2UdQESCLcUpqjuYgIu0LiKgEY1ay49HZdhQAcM05I2
 idO4vQoiOwh5PVwcvGTcdRlWmg8wIpur40xd9Hpoz+SzyFjXsjo9lzEHyAUaVat/9J43
 HgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ui0unneZE7BMiOaLERLPySBQhcdhLuTjLknA7+UsfE0=;
 b=gNqcSGH4lpBsva5kn3FB4f0J7FgAhCSP53r3ir8oWlykC7YFBHxqDpvapOd/JB6yBy
 30VkpXkq+IXabvKnh6yGbFYI6GEpkQ+ZoihQB4s7iN5QDi29zQfKH+kZPBXjQwAjsR0q
 GjbXJEeuBxkHCjHenkT423V8XBjj2bb4byWSTJ9G8AiHdePshncyPx0rgIhat7nSuC7D
 zeab2UWHxAcwOehpCE6fnJNPF4yfMFWr1oH6n0H7GvczqYFkL0WPbL6nfguOyf7vx2OH
 ArifiEr/FpKDHwXt2V1nzWYV/prUMHY9GR/3AjJ8FgmNWs6tvALkG7qGBc67VoFwT/QF
 vPAQ==
X-Gm-Message-State: AOAM532BblT/NcVAXVO9s8eg0t8lqZfTnboLFUB4nntcC1C/SfWEVpny
 xWxOgSZ8WEuZkEUqouyMQpeLqg==
X-Google-Smtp-Source: ABdhPJy5DBd7PT4mmZ37b4F3q+VMB9zFcQ/NWR65+MFjedI07n2lBGt5XNmj4fYaLMAyx3QzJb8kOA==
X-Received: by 2002:a2e:151d:0:b0:255:6b9e:98ec with SMTP id
 s29-20020a2e151d000000b002556b9e98ecmr22885480ljd.444.1654777442607; 
 Thu, 09 Jun 2022 05:24:02 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:24:02 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v3 12/14] drm/msm/hdmi-phy: populate 8x60 HDMI PHY requirements
Date: Thu,  9 Jun 2022 15:23:48 +0300
Message-Id: <20220609122350.3157529-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Declare that 8x60 HDMI PHY uses the core-vdda regulator and slave_iface
clock (this is the same config as is used by the 8960).

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
index 95f2928cb2cb..1d97640d8c24 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
@@ -122,8 +122,20 @@ static void hdmi_phy_8x60_powerdown(struct hdmi_phy *phy)
 		       HDMI_8x60_PHY_REG2_PD_DESER);
 }
 
+static const char * const hdmi_phy_8x60_reg_names[] = {
+	"core-vdda",
+};
+
+static const char * const hdmi_phy_8x60_clk_names[] = {
+	"slave_iface",
+};
+
 const struct hdmi_phy_cfg msm_hdmi_phy_8x60_cfg = {
 	.type = MSM_HDMI_PHY_8x60,
 	.powerup = hdmi_phy_8x60_powerup,
 	.powerdown = hdmi_phy_8x60_powerdown,
+	.reg_names = hdmi_phy_8x60_reg_names,
+	.num_regs = ARRAY_SIZE(hdmi_phy_8x60_reg_names),
+	.clk_names = hdmi_phy_8x60_clk_names,
+	.num_clks = ARRAY_SIZE(hdmi_phy_8x60_clk_names),
 };
-- 
2.35.1

