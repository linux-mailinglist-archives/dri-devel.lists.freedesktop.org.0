Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE246613F0
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 08:26:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FD010E1E5;
	Sun,  8 Jan 2023 07:26:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0531A10E1E4
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Jan 2023 07:25:59 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id g13so8315787lfv.7
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 23:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bMcMgMN2h9pQ0++woqWQkTwB0DopoRxUXMW3C3/QKYc=;
 b=Ux2ciHFIvGWO6NT3TSZYAB6S//IPXOwYcprwgpxHswK6KaMc8BZXeunVEogXWh2UVX
 cJ7vCxBy+A263PXJ70ZbtZjgAmyvLdwt7weFf/UVBBNjX4smHNzB/59XIYJVLQ3XIoP7
 7GSNKGdW6PADsCLBuyKlFAp43Bq3ExEYz5msECLnIZ32SAOdnbntxtFuqGIHHs0Np1qq
 REWz9nqb/8tFhPn5GtWhYlo0C4IozI23vnHITkNfoQJgwE9uLbQQHHrspZ3mVMcsvtQ3
 cncr9HpO6q2LVNT9YUsBWYX85zkBURmWzpQ3uZnbZ/c63qqjwwWkEEw1sFsbODfNY0wI
 TpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bMcMgMN2h9pQ0++woqWQkTwB0DopoRxUXMW3C3/QKYc=;
 b=CZT7rGPqib9bPgy1Fx11niMls537j84GtvRsogFjW/VgVvWz4ABZTguuA85SvxPEBu
 lIIV9sxukrr6MX9LjTTBZspwNMNrnjbQ+eN4CW94Y0mM1yivlf/NPEvfChL9zS+90yNR
 Bttw25bcQPOE0l5lieUD8lmd52gwO83u70wrwT2wmjRulMeoPr5f5O2h8WdtlGB6wmy8
 HXHF3020cK3CsTmYKrZIevMGqlowoDHrQnrKe6JME/KNf6NzMdpt9GxxQcQi/t6L5eSg
 ARfc6Id8pU9bv2yUJP+s+kRsekKof7Y42AinkIzWii13ZwJRZhtf0dOPFPR8e48O+laq
 iE7A==
X-Gm-Message-State: AFqh2koMFBMrXSzqBSi1k8aNFBw8rPIX7B4foEJ87dAHNjj3dMOoanVo
 A1OsByNhJ9MzSZCGIzOTE1Ky1Q==
X-Google-Smtp-Source: AMrXdXuAxN4yqXdIZptsyDsJjG5Jcnv7P/pNVbSR10r89IK21J1NzuWq9lidrKNOTS4PfUYs3gfuUA==
X-Received: by 2002:ac2:5975:0:b0:4b5:8f03:a2bc with SMTP id
 h21-20020ac25975000000b004b58f03a2bcmr15713088lfp.9.1673162757318; 
 Sat, 07 Jan 2023 23:25:57 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 x2-20020a056512130200b004a8f824466bsm927414lfu.188.2023.01.07.23.25.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 23:25:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 01/12] drm/bridge: lt9611: fix sleep mode setup
Date: Sun,  8 Jan 2023 09:25:44 +0200
Message-Id: <20230108072555.2905260-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
References: <20230108072555.2905260-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On atomic_post_disable the bridge goes to the low power state. However
the code disables too much of the chip, so the HPD event is not being
detected and delivered to the host. Reduce the power saving in order to
get the HPD event.

Fixes: 23278bf54afe ("drm/bridge: Introduce LT9611 DSI to HDMI bridge")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 7c0a99173b39..2714184cc53f 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -448,12 +448,11 @@ static void lt9611_sleep_setup(struct lt9611 *lt9611)
 		{ 0x8023, 0x01 },
 		{ 0x8157, 0x03 }, /* set addr pin as output */
 		{ 0x8149, 0x0b },
-		{ 0x8151, 0x30 }, /* disable IRQ */
+
 		{ 0x8102, 0x48 }, /* MIPI Rx power down */
 		{ 0x8123, 0x80 },
 		{ 0x8130, 0x00 },
-		{ 0x8100, 0x01 }, /* bandgap power down */
-		{ 0x8101, 0x00 }, /* system clk power down */
+		{ 0x8011, 0x0a },
 	};
 
 	regmap_multi_reg_write(lt9611->regmap,
-- 
2.39.0

