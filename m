Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B44BB2F9B2F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 09:25:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F3B6E11F;
	Mon, 18 Jan 2021 08:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF8789B03
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jan 2021 00:23:58 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id 23so18780820lfg.10
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jan 2021 16:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Jk4A9FOCp2DyHnXydTrDuuZ1YyYaDOR8NdDMm+cUsI=;
 b=a+DTCqyrhAjbZAurA0t2Ty8uGwXfEgkKNcDoRSisJM2VIOqXwTKIVFp90KmzyvSxad
 S9VzI9pyCyUAxU567qAM0AhOBclY/z2JZopJgrCcJrDkevsNYljg+DQ01IxhxoJi3LQS
 rcySTUdpUT5EJmtj4hn/qZfn0EMMsis7AzlR47kTgxrjORVPiDSGyRqWl7cQropxe+7k
 +e+n3ABl3jIxD1/Mb9rTejnVcY/kHH+SA7NjL9kpFpSrr69zhpUd+ThryEk/kRq3ETAF
 zveBnVxUOu2LO1CoN1dipYmGPunBlBrllmsknQgg8ji4e6Bj1cho/OICVH7iitHhz6zY
 N1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/Jk4A9FOCp2DyHnXydTrDuuZ1YyYaDOR8NdDMm+cUsI=;
 b=DtCawc3Lsg5Zcp+mVvAXMX+79LmnqzdlqxBjHxOmX4au1sULcF6bbQRv1ubxjUMvSW
 /hvsEdWr6ORGNTce6NYYUXt2oKKwaj5I9rB+nbwHSI2QLujts/HPOIY77CTMyuEXSshS
 tYggUtOiY1eyAMbUlyMjmaSM5xG1YbeLhZGS64t+LD1z4d59Eu0HLEul+l1UuPWaukQM
 mG/ZtcqjgFy0zuw4rJcrr9XfJXKgFOlthABbRIvkRJJofXlEUEEyd5L2sRNmDRIcs6+X
 EXqCvXExPo25B8CfHAyWTryMxgCiv3qTPulwU8pDbuO+1PMd5MZ696B68CAGqdVw64gb
 MGDQ==
X-Gm-Message-State: AOAM530lQ3AW696Y6C2RJlapkhTrpdSFV7F8Vs+46dM1g3bQfiUNLKGr
 2CA8gi4nYp29/CilEyXJIsG7a+b55tA2fns3
X-Google-Smtp-Source: ABdhPJztiPlj+sIVQy5p/4XKh8Ofta8tWsk+VZjL7nUft0CBVO9Ga8CALGyI94EiwwLbAf/JD40V+Q==
X-Received: by 2002:a19:3d5:: with SMTP id 204mr7994701lfd.21.1610843036723;
 Sat, 16 Jan 2021 16:23:56 -0800 (PST)
Received: from eriador.lumag.spb.ru ([94.25.228.101])
 by smtp.gmail.com with ESMTPSA id q1sm962468lfu.48.2021.01.16.16.23.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jan 2021 16:23:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 0/3] drm/bridge/lontium-lt9611uxc: fix handling of EDID/HPD
Date: Sun, 17 Jan 2021 03:23:52 +0300
Message-Id: <20210117002355.435860-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Jan 2021 08:25:29 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Neil Armstrong <narmstrong@baylibre.com>,
 Andrzej Hajda <a.hajda@samsung.com>, Vinod Koul <vkoul@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These three patches provide fixes for HPD handling and EDID readout for
Lontium lt9611uxc DSI-to-HDMI bridge driver.

Changes since v2:
 - Declare lt9611uxc_hpd_work as static

Changes since v1:
 - Split first patch into two smaller patches
 - Add Fixes tags

Dmitry Baryshkov (3):
      drm/bridge/lontium-lt9611uxc: fix waiting for EDID to become available
      drm/bridge/lontium-lt9611uxc: fix get_edid return code
      drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 41 +++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 9 deletions(-)


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
