Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C97AB46C41D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:03:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F2D6EEA8;
	Tue,  7 Dec 2021 20:03:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA6F76EEA8
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 20:03:53 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id k4so51680pgb.8
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 12:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6EkS8Nvrc0mLwPSTwo7vPbxig6A1y6814RHQt01NTVI=;
 b=AsljNNwj8qOWOVE9bmXhbXKiE4Esi4ccz46SPr/aK5d7tMGE6rDcC4aKxX/q7MdIAR
 6eqc5s0Usx+36Nl9Cr0WGDSMqUIP5YS0o99r5FWTOCZYtjiJ2BTQh06CUWxc3zUgjDv4
 4/MyXIJm3jrZI8JBT7iPhzxh+TmfeS39lhLcyCCVIqB24rGA/XV1hwMCT1zp1FLkQL8w
 nMLripi8OnnUNFuRqWYwX1U7uYNYW5PNCEuWjUe7zToBLcU73oHJSrQ0/W7Qo6EcASf1
 y/doPuhW7FDx3CKSmm7AzlyJ2BuZOS1kGyvumFIr/5psmfHxya/4oyYw5qnz1mIRnD9s
 wadw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6EkS8Nvrc0mLwPSTwo7vPbxig6A1y6814RHQt01NTVI=;
 b=YafCUSJ/srkpGBPsxFww4uBPgUWb07Q3byI/iltwb9ZJvC+j5MeIFs0IW2PX5NVruk
 yW8BkxXD7BZcoNDfRIY6u4wa7Vst5ei+benSFKyF+pA1IN7fRQ9/GZIC2zZQA1Y6tMTg
 lEoUL8sAFqX73Hzy2CNb3rTtbkRVSihawInAxOBdky8D5VKSIBmUyZbv8HR7oDXNvvAt
 amLOsOrk71G/4XfE1lBk/fEydFz8BdwYkoUzJCUDCY3LdRIgh2eQySHSzc4FJEHVq4w1
 Nwy61JLGwt5KUfby2HTHt7SAHxm2TqGZftIXcXr/3L2YVfuCu2YGyLXzwVTSbRxC+eew
 ZUnA==
X-Gm-Message-State: AOAM530BHDRcIHEFThidCpCFuptH2GpFrEDImeZoad6gbGdoB5TyWGX0
 0+SEVC1HNXgAtO8KU7OuL/qDB1q9TMY=
X-Google-Smtp-Source: ABdhPJyDZzLVyupTsP3jSm1uQ1TVGy9Yo7iWxipVefr/je0F5T82/yBDGk6mtlZOAUTLteBzHa6PTw==
X-Received: by 2002:a62:1909:0:b0:4a7:e88c:286b with SMTP id
 9-20020a621909000000b004a7e88c286bmr1270023pfz.26.1638907431667; 
 Tue, 07 Dec 2021 12:03:51 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 d20sm563648pfl.88.2021.12.07.12.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 12:03:50 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/bridge: sn65dsi86: defer if there is no dsi host
Date: Tue,  7 Dec 2021 12:09:06 -0800
Message-Id: <20211207200906.609673-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
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
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Douglas Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 open list <linux-kernel@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Otherwise we don't get another shot at it if the bridge probes before
the dsi host is registered.  It seems like this is what *most* (but not
all) of the other bridges do.

It looks like this was missed in the conversion to attach dsi host at
probe time.

Fixes: c3b75d4734cb ("drm/bridge: sn65dsi86: Register and attach our DSI device at probe")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 02b490671f8f..3684e12fbac3 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -716,7 +716,7 @@ static int ti_sn_attach_host(struct ti_sn65dsi86 *pdata)
 	host = of_find_mipi_dsi_host_by_node(pdata->host_node);
 	if (!host) {
 		DRM_ERROR("failed to find dsi host\n");
-		return -ENODEV;
+		return -EPROBE_DEFER;
 	}
 
 	dsi = devm_mipi_dsi_device_register_full(dev, host, &info);
-- 
2.33.1

