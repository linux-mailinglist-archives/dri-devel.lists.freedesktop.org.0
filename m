Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A07477659E7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 19:18:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7076B10E1DD;
	Thu, 27 Jul 2023 17:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D0F10E1D6
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 17:18:39 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-686efb9ee0cso1214579b3a.3
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 10:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1690478319; x=1691083119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B+sJqO38e2gNSysz3Tl3WNQ34X1K+Pprq+XQpM/wPpA=;
 b=XR79+iJg38TdqRqVksssPvqJCfRVppUDJ0SCoIzYZz9E7npJ3QbCrYBR0YtCH1Iwpz
 bh8ddXSBmExnRlwhNEaqyewsrL8WmSIwwp8P2pEYNXLOnclbvGHTfebTxUYiViXnkb3Q
 cJhn2pL+oUoG+Carw6pl4TGtM19+hj0XsDhTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690478319; x=1691083119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B+sJqO38e2gNSysz3Tl3WNQ34X1K+Pprq+XQpM/wPpA=;
 b=Art+66JXdMkt+9ylTV9BFu6cgQeFqc1ubhWIB1oK31FvcBSFoGKSn6zOqZWLX8AULd
 ivn8d9/vO1ped+rrO3JKQuEHRna/HGKR3HY98Gbgjn4E7Az6z0TQwJB4FloNtew2iT1w
 RJNLpnpiCQ5kw5+VwA29DybdEqxsjWdYbpRvGkMeq3m08bfCeEv8VpW83XDck1KTTiEs
 OwYo395S/PfCsDJRVMIh8SmV4w51c12DB8pIkQyM7a2KqpQ01yMIOEeSRGSWVio+3wqH
 5Ik3GD6DjwBQ4jaGhB9O1QguB+pDcyjaTx8m00Z05uHMWqm5IHW/NaIh/ogDbHZ9YdQZ
 Dzog==
X-Gm-Message-State: ABy/qLaTay4jJZCQTaHzK30vT5fzcvFDd0sWTgZnJnIC8IzmquCicPxs
 yJpu3nL8bKGOK0TfVNJd4alA1Q==
X-Google-Smtp-Source: APBJJlEtdcPHvIy7yXOPJnhlhZ0fZ1vrgQ0KPFYytG6arm/TebgKO/M3EPsrsa35yfXcgeHGVYzcKw==
X-Received: by 2002:a05:6a21:6d88:b0:134:4f86:7966 with SMTP id
 wl8-20020a056a216d8800b001344f867966mr7749482pzb.9.1690478319489; 
 Thu, 27 Jul 2023 10:18:39 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:2339:954b:b98f:611a])
 by smtp.gmail.com with ESMTPSA id
 17-20020aa79111000000b0064f76992905sm1702524pfh.202.2023.07.27.10.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 10:18:38 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 04/11] of: property: fw_devlink: Add a devlink for panel
 followers
Date: Thu, 27 Jul 2023 10:16:31 -0700
Message-ID: <20230727101636.v4.4.Ibf8e1342b5b7906279db2365aca45e6253857bb3@changeid>
X-Mailer: git-send-email 2.41.0.487.g6d72f3e995-goog
In-Reply-To: <20230727171750.633410-1-dianders@chromium.org>
References: <20230727171750.633410-1-dianders@chromium.org>
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
Cc: Douglas Anderson <dianders@chromium.org>, devicetree@vger.kernel.org,
 cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
 yangcong5@huaqin.corp-partner.google.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 linux-input@vger.kernel.org, hsinyi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Inform fw_devlink of the fact that a panel follower (like a
touchscreen) is effectively a consumer of the panel from the purposes
of fw_devlink.

NOTE: this patch isn't required for correctness but instead optimizes
probe order / helps avoid deferrals.

Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Since this is so small, I'd presume it's OK for it to go through a DRM
tree with the proper Ack. That being said, this patch is just an
optimization and thus it could land completely separately from the
rest and they could all meet up in mainline.

(no changes since v2)

Changes in v2:
- ("Add a devlink for panel followers") new for v2.

 drivers/of/property.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index ddc75cd50825..cf8dacf3e3b8 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1266,6 +1266,7 @@ DEFINE_SIMPLE_PROP(pwms, "pwms", "#pwm-cells")
 DEFINE_SIMPLE_PROP(resets, "resets", "#reset-cells")
 DEFINE_SIMPLE_PROP(leds, "leds", NULL)
 DEFINE_SIMPLE_PROP(backlight, "backlight", NULL)
+DEFINE_SIMPLE_PROP(panel, "panel", NULL)
 DEFINE_SUFFIX_PROP(regulators, "-supply", NULL)
 DEFINE_SUFFIX_PROP(gpio, "-gpio", "#gpio-cells")
 
@@ -1354,6 +1355,7 @@ static const struct supplier_bindings of_supplier_bindings[] = {
 	{ .parse_prop = parse_resets, },
 	{ .parse_prop = parse_leds, },
 	{ .parse_prop = parse_backlight, },
+	{ .parse_prop = parse_panel, },
 	{ .parse_prop = parse_gpio_compat, },
 	{ .parse_prop = parse_interrupts, },
 	{ .parse_prop = parse_regulators, },
-- 
2.41.0.487.g6d72f3e995-goog

