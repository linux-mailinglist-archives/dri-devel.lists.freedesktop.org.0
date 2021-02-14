Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F1E31B240
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 20:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E94716E090;
	Sun, 14 Feb 2021 19:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 247696E090
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 19:41:18 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id g20so2559798plo.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 11:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OEU9K8O8lr+3rHXwRQA55P8y6nBOsd6z61f8CIpxwRw=;
 b=F0Qgyf6v2tiZz7YJnxvZ8eJHpLZZL5anVhqVpyWbyWbL0II9dBc6u/HvOM2jr5iVe6
 72nvcuVeFokurb2dJiyhOkaW/kZ/Hz2ZMBlVZ5MY5Vn9AELfyVaA3bXomHFZdVTCZjEF
 hnwLFmiIHcOEXarki46T+SdiRs3IcxQXk2ILA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OEU9K8O8lr+3rHXwRQA55P8y6nBOsd6z61f8CIpxwRw=;
 b=bQFGK5YTQ7d9WTURExXc2Yy0AzsjxK9zgqMg0WhyeorODXPSUg8ntEqnAR2IpAOwQ0
 P7xhYqYyYLjni0MMmwMwdWossDpd5wNt8XNMRp+Xrx/6p861u5hG6limfjK8BNbsqlEI
 rUINBK24p+sdfNk4t1X6wgzkyH/HMd9LtjoiajT7gTyU29yC/Mu2T2KeAHSeZ73PuntM
 TM5h0w5mMtbDjG2IPx2dIAt0F3P/aX7ypRRpz3f+rFNELBgq7NYKOZUxe+19FpzL5fBw
 vZRTc543Cfn+4krjw0EZe5IWXWiihuoDHWPEus1tefuB3Kn2uopQtuQVpz2GwlUKFopD
 JtVw==
X-Gm-Message-State: AOAM531vFJrzD52r0eSQ6mpq4SJP0OhfGp19lynKHs0tFZaOXN9k/CPK
 nUowXqxkNRc/siFnpc0NLFBkEHdTisSJ9kIE
X-Google-Smtp-Source: ABdhPJzuRDJWAxPCuSeDZkNIGM/J3GwrRrwVFw+NjiOftQtrJh5oLckq92dQmblysU6ylnUPSswJKA==
X-Received: by 2002:a17:90a:dc82:: with SMTP id
 j2mr1522625pjv.99.1613331678340; 
 Sun, 14 Feb 2021 11:41:18 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id 125sm15129247pfu.7.2021.02.14.11.41.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 11:41:17 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 0/7] drm: sun4i: dsi: Convert drm bridge
Date: Mon, 15 Feb 2021 01:10:55 +0530
Message-Id: <20210214194102.126146-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series convert Allwinner DSI controller to full functional 
drm bridge driver for supporting slave panel, bridges.

Here, are the previous version changes[1].

The key concern about these changes is about kms hotplug which 
indeed not compatible with bridge conversion.  However, I did 
try several ways to support hotplug with the bridge but it's 
resulting in a deadlock where bind never attach bridge until 
bridge pointer found and bridge pointer cannot found until bind 
finishes. Any inputs on this would be appreciated.

[1] https://lwn.net/Articles/783127/

Any inputs?
Jagan.

Jagan Teki (7):
  drm: sun4i: dsi: Use drm_of_find_panel_or_bridge
  drm: sun4i: dsi: Add bridge support
  drm: sun4i: dsi: Convert to bridge driver
  drm: sun4i: dsi: Separate code for bridge pre_enable
  drm: bridge: Queue the bridge chain instead of stacking
  drm: sun4i: dsi: Use drm_panel_bridge, connector API
  [DO NOT MERGE] ARM: dts: sun8i: bananapi-m2m: Enable S070WV20-CT16 panel

 arch/arm/boot/dts/sun8i-r16-bananapi-m2m.dts |  85 ++++++++++++
 drivers/gpu/drm/drm_bridge.c                 |   4 +-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c       | 128 +++++++++----------
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h       |  11 +-
 4 files changed, 150 insertions(+), 78 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
