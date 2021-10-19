Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 225F74340F1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 23:58:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7F289ECB;
	Tue, 19 Oct 2021 21:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BCE89ECB
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 21:58:53 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 o24-20020a05600c511800b0030d9da600aeso5799411wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 14:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UTdIsdP9DoyG3Sn5cCb/sgu7yaV7F/mWMfz6X41RVl8=;
 b=ci4doC7W+ulH1LId8uCX/KLVftrH6c1lQ2Uhb+Q1IXZt2lJriH8SULXr+9gSN8hmdk
 MRf3y21oreaoiAj2YIeKCJ7EONutAYlb20VX5Yas+C5oHXr5jDSX9snKyxvJoWv/6Bkn
 snQgFNdbpaNRMdU2rGqDAicm/IShCiitHFIIMfGp8x0BQwE3/Q6UmzcDOzNXEyI1dTIL
 /EgyLVXrXsN1SfbDKqDhGJz4+7vVcuIJfisMPpu697lqM14YHV5NTdxOhPYQgJTTG51u
 GFdLBSYKWo2R/OUmmZR2RjWWHJbaZjl+OXGsvRzRX43etdKTYjH76CQlb+0+QhIkY3l9
 2XjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UTdIsdP9DoyG3Sn5cCb/sgu7yaV7F/mWMfz6X41RVl8=;
 b=P9J004wZZzPaB2g6/h/VmmRwTV9MDLSB+pX9uGXUVQUb4fZQj1ZMq+SyUozmvYifcE
 gcQaWpMWiyXTlEprAuJ3p7zu9lSE5XpH9q5hV/2rSnIn/YbbwKKwQS2VRKLZKsIMbGtF
 +v2FUvLLI0D4xfvYMsqymnIG84KD5qN0MTjpLuwnBeSw5LH/toONU7I4qllJqjkMjeiQ
 5eo3Db9A8jkkSENw9QF/2yrnd9cP7L536PsMNvQBSEzx5fBucXeLXhGwU7oNUUnsGneT
 hq7n1D5TTvC6iq3mxJ/Q2jp0Vl69Vhg8JuKaFJAGvUqCjLKYPjl1HbJxakrScx1KB3QZ
 mYKQ==
X-Gm-Message-State: AOAM532UqwczIAg3UFwTxvID96lX1qiRfesbmmjY5dILxmKgbbXrAmT0
 U4l4ezWQAeaHXIiibSYnmdE=
X-Google-Smtp-Source: ABdhPJzbYFOuHPDh0OCrLYmRLSUPFkOFXTgrQJckuKVyqgF4rnehpCz35C3R1facpylD00JH0DzSOw==
X-Received: by 2002:a1c:4d15:: with SMTP id o21mr9187365wmh.167.1634680731408; 
 Tue, 19 Oct 2021 14:58:51 -0700 (PDT)
Received: from apple.sigmaris.info (ebrouter.sigmaris.info. [82.69.107.165])
 by smtp.gmail.com with ESMTPSA id s3sm178540wrm.40.2021.10.19.14.58.50
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 19 Oct 2021 14:58:50 -0700 (PDT)
From: Hugh Cole-Baker <sigmaris@gmail.com>
To: heiko@sntech.de,
	hjc@rock-chips.com
Cc: dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, ezequiel@collabora.com,
 Hugh Cole-Baker <sigmaris@gmail.com>
Subject: [PATCH v2 0/3] drm/rockchip: support gamma control on RK3399
Date: Tue, 19 Oct 2021 22:58:40 +0100
Message-Id: <20211019215843.42718-1-sigmaris@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This extends the Rockchip VOP driver to support setting the gamma LUT on the
RK3399 SoC. Previously, the driver supported gamma control for the RK3288
only. On the RK3399 the method for updating the LUT is slightly different.
This implementation was based on the code and description from the vendor
kernel [1].

The RK3399 also has the address resources for the VOP general registers and
the gamma LUT located adjacent to each other, not on either side of the IOMMU
address as on the RK3288, but for simplicity this series follows the existing
DT binding which requires the gamma LUT as a second address resource.

This should enable gamma control and "night mode" on all RK3399-based devices
such as the Pinebook Pro, it has been tested using the "redshift" app and
GNOME's "Night Light" feature on a RockPro64 SBC. The changes should not
affect RK3288 gamma support using the existing code path, testing on RK3288
would be welcome.

Changes from v1: Moved the vop_crtc_gamma_set call to the end of
vop_crtc_atomic_enable after the clocks and CRTC are enabled; otherwise VOP
regs are written to before the VOP's clocks are enabled which is a no-no and
can cause a hang if re-enabling the CRTC after gamma has been set.

Hugh Cole-Baker (3):
  drm/rockchip: define gamma registers for RK3399
  drm/rockchip: support gamma control on RK3399
  arm64: dts: rockchip: enable gamma control on RK3399

 arch/arm64/boot/dts/rockchip/rk3399.dtsi    |   4 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 105 +++++++++++++-------
 drivers/gpu/drm/rockchip/rockchip_drm_vop.h |   2 +
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c |  24 ++++-
 drivers/gpu/drm/rockchip/rockchip_vop_reg.h |   1 +
 5 files changed, 98 insertions(+), 38 deletions(-)

-- 
2.24.3 (Apple Git-128)

