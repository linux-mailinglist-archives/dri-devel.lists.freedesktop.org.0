Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2857270CC
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jun 2023 23:53:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907D510E552;
	Wed,  7 Jun 2023 21:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 184C610E54F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jun 2023 21:53:16 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6549df4321aso5413723b3a.2
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Jun 2023 14:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1686174796; x=1688766796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=crBZss5mF3gjKLwx/CqtOTtfgR9i9SC8rNyLPUKs7BQ=;
 b=gLEGdkrlNnvMgTTGOEdCWWcfB1i72xB3KWqQx+7tAf5HZk5n8a87dTE8cDhQijzzBu
 lAV4kwbGPWSfrKgAixZN8QhMZX1SeEOn/DLX/dhv0PRDbO0tDOlWRmyatlez7rCoDgou
 WTw7bTbJbWTLjeon8Fy7dVsLN71SI8wsOrOug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686174796; x=1688766796;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=crBZss5mF3gjKLwx/CqtOTtfgR9i9SC8rNyLPUKs7BQ=;
 b=KLhZoospZQPANGfiLnpDe6lXscRoLx5L3poqSoXCfVn9W4A7/SvzrOE8qMJgidgJlh
 LTiNkRmMsKbWA4dlWirH5MlAcObR7wGeZ7qfVt+2wXV4jwdtU/l6ApGKBh4PCw61GpDj
 Hjr2FsuzbRB0mGmbmVr6chmXjLgV14TejHIgHsl2sBMqYXcbPj0myc76WSwKsx5bf1e9
 U9+L7FDer/HtjlzdM27umx39umZ0jRPLmCbv5EFd9EH7orFXXvYqn92aMOaG0qJIqYvM
 OJKrbSqSzVr69eJcoI8fWFh2iRjNl+JW7efhE6XXhYSvliB+ZjuDHuZe2J8VxV3Y9tyX
 NyTA==
X-Gm-Message-State: AC+VfDxP/jgi2yPE49R2A5PqCBGQBGm4NOexJ5+rJCEkKbZAiCXRjVMt
 5b1nbB2pOfV/ShUEkxB/i5OGcLoPcJqU0LeIs3Y=
X-Google-Smtp-Source: ACHHUZ4vnQFYixY8jF66m21wSxp2x8lVupj/X6E4wb93LFsOExzlp2AYsSVAYdghITddglLp7a9/mQ==
X-Received: by 2002:aa7:8889:0:b0:64c:a554:f577 with SMTP id
 z9-20020aa78889000000b0064ca554f577mr8115023pfe.11.1686174795822; 
 Wed, 07 Jun 2023 14:53:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:34b2:b638:6b53:f6c2])
 by smtp.gmail.com with ESMTPSA id
 j25-20020aa78d19000000b0065dd1e7c2c1sm1376486pfe.63.2023.06.07.14.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jun 2023 14:53:15 -0700 (PDT)
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
Subject: [PATCH v2 04/10] of: property: fw_devlink: Add a devlink for panel
 followers
Date: Wed,  7 Jun 2023 14:49:26 -0700
Message-ID: <20230607144931.v2.4.Ibf8e1342b5b7906279db2365aca45e6253857bb3@changeid>
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
In-Reply-To: <20230607215224.2067679-1-dianders@chromium.org>
References: <20230607215224.2067679-1-dianders@chromium.org>
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

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Since this is so small, I'd presume it's OK for it to go through a DRM
tree with the proper Ack. That being said, this patch is just an
optimization and thus it could land completely separately from the
rest and they could all meet up in mainline.

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
2.41.0.162.gfafddb0af9-goog

