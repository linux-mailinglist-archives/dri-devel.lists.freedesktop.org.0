Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F2C2F8CE9
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311706E55E;
	Sat, 16 Jan 2021 10:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657CC6E21D
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 11:02:31 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id u25so12562454lfc.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 03:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wuEPYvb00THpcWPvzz3ksFPPsz4liNI0RttKCB7EHKY=;
 b=qblGbMJ40vMYbhKpQrbc4FsDah0X5QR1oAKbx2AISj61mog9czmL1Ny29KgmUFtLfg
 oBEquoAPcoA+9YVC6jk8uykwmsKCq+9xUCDMUtl+9QxlffLynKaE5U56kl+oFpm5vh3W
 X98p0hV8PIXK6NhCrKRKvxt++00JaQfMV7HexFMIrrVFZmJUOBI2wBrrfvRETTHKLdvk
 VFnSAHuZ39dUwmvobdQFs31GatK0kwfAbaq1FoqtTduHqDF0LV2hLco6pzmllrDyUF6Z
 AKiOcMMxRa+qBVKa1SW9yb/C8NFKTM05ZnqrUqxumFvVH5EK6k59LaGQ+WOOY1HSpOmo
 fytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wuEPYvb00THpcWPvzz3ksFPPsz4liNI0RttKCB7EHKY=;
 b=pOZcmJin8Eg6JpANEcYq4xii224n6JiS0otUn8JfnXaKD0MFq5b8mUYf24D7yT4euJ
 BeFGOplnOD3y/7OB6nEztwvIiQDdrM/UAFrZYG2xEm3tuG1y+z/Dn0Jbo5hLWDIYjUjB
 HTBpM84u5uBOQE3gHBoeYIPTm+icBi1J4BtAvlKmwhhacSgo8f3oCI41nWB/Mc1CZSxr
 p4IoewUty0Tuy/r94uwsLYndaBVkvKtGNF6+1OZiIoMXv0DVcOn75fDOenpAn45DQhax
 EeXJdY67iG0aU83xDCUwesNMD8enOq50/HxkYbObLRTbSfsf5v3I33z3QMpLO0Rcrg4a
 w0sw==
X-Gm-Message-State: AOAM5335VxPuncMiqFprtIDCfbvffVUwApB6MVKTz7xEYEE6iXQCqwkT
 U45eLJIFovMARN/i/9qZREaessN6ZWgFQb+OF1E=
X-Google-Smtp-Source: ABdhPJzfiAqGTsgOfZLr108bLa/ESd5SXHVFC1VycR/CoM4O2zuxVK03H0BRc1A76LoxnOfVBmpB2w==
X-Received: by 2002:a19:4f4b:: with SMTP id a11mr5352739lfk.579.1610708549480; 
 Fri, 15 Jan 2021 03:02:29 -0800 (PST)
Received: from eriador.lumag.spb.ru ([188.162.64.106])
 by smtp.gmail.com with ESMTPSA id s8sm862020lfi.21.2021.01.15.03.02.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 03:02:28 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 0/3] drm/bridge/lontium-lt9611uxc: fix handling of EDID/HPD
Date: Fri, 15 Jan 2021 14:02:22 +0300
Message-Id: <20210115110225.127075-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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

Dmitry Baryshkov (3):
      drm/bridge/lontium-lt9611uxc: fix waiting for EDID to become available
      drm/bridge/lontium-lt9611uxc: fix get_edid return code
      drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 41 +++++++++++++++++++++++-------
 1 file changed, 32 insertions(+), 9 deletions(-)

Changes since v1:
 - Split first patch into two smaller patches
 - Add Fixes tags


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
