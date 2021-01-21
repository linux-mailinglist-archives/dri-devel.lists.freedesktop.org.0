Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4981D2FFE89
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864376E9CF;
	Fri, 22 Jan 2021 08:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DEDB6E979
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 23:33:09 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id a8so5019055lfi.8
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 15:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V6TNPYLJ/iTyhc4r9Xcvd9mWakKDvfSC0jfUqMNIv0I=;
 b=xDLeMku/suleSBlyaJI8VCb98rqZT5n7zloXMr0s4hjlYwxAMh6jU9eP9V0Dg0jBOB
 aJOa9mDJ+obXgxCwOoxVZRUXk3BIArQHWmpxYCfcuj2xoNJk2OwSWt4bfUKo+D8JW4/k
 WojIq+xhCo3UW4ETF+NnJbfyho8A7Aw84vHfLoJrTOFHLL68eWVmAzy5r7SZXVK31wdo
 bfa3vO+g7d4J7CfFu9dIDnLUd8s3y75P9Lh+sHHekVo+lvLpC7bG10tQl4c5k0qE7htG
 ZxkwHtyH8+/EWrRTEbWZwH2WJ7ep2ckyl/2ublNeWvTumoe6fTvShqlG6ds5AWHEs6//
 EOUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V6TNPYLJ/iTyhc4r9Xcvd9mWakKDvfSC0jfUqMNIv0I=;
 b=JHdlYF6tvMDarXJUqIYZ1gq4vP7w9O7eAb01X/+zP08KrD1e6QK7ZAjZO+p3POR+eB
 JTKrsSdyUQ0IrORvRXPGzDHjLdjAx3PMl3A3hML9LmWMwgsNYPN++mhLd0WGxUNiXJc4
 eVLfEdRiwbyNz23Uil34bv5bMCS4PSWZ+KsJvM34W9bp8Dkl9EkAPQqUX5Dei2mEglK+
 yuPY2bGnuxnfDBnSdNpiCansp7gq/jaf0LKHNV0vt5REoc+okHeKviIOjbAo0hqXM2bZ
 XuSPDh85ysMC5MGpxEISoTOQCQtlPGinUhnqGpqSzpUHPMNnIKuaSA6xuoK7RnOi2ARR
 effg==
X-Gm-Message-State: AOAM532fcgI7LVIp1ALTXHrIQ7SYQV9Z/RCKdVWj70otcI1liPH0b7q/
 rnbbbqtx7lnWL2FoInJH2YU6F8aKTLGPKTVv
X-Google-Smtp-Source: ABdhPJwsdWbtbJtOtXvFD0vfg/VHE1WKYeMUXeN2ZJo8MM+gyoIui3wEyNDP67qjC817StoRNRGlpQ==
X-Received: by 2002:ac2:5dd1:: with SMTP id x17mr276362lfq.252.1611271987142; 
 Thu, 21 Jan 2021 15:33:07 -0800 (PST)
Received: from eriador.lan ([188.162.64.145])
 by smtp.gmail.com with ESMTPSA id l28sm726969ljb.42.2021.01.21.15.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 15:33:06 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: dri-devel@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v4 0/3] drm/bridge/lontium-lt9611uxc: fix handling of EDID/HPD
Date: Fri, 22 Jan 2021 02:33:00 +0300
Message-Id: <20210121233303.1221784-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
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

Changes since v3:
 - Protect hdmi_connected using ocm_mutex
 - Remove !! conversion from int to boolean
 - Add missing Reviewed-by tags.

Changes since v2:
 - Declare lt9611uxc_hpd_work as static

Changes since v1:
 - Split first patch into two smaller patches
 - Add Fixes tags

Dmitry Baryshkov (3):
      drm/bridge/lontium-lt9611uxc: fix waiting for EDID to become available
      drm/bridge/lontium-lt9611uxc: fix get_edid return code
      drm/bridge/lontium-lt9611uxc: move HPD notification out of IRQ handler


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
