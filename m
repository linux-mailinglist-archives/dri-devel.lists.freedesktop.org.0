Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A935F94F8C7
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 23:15:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5FF510E076;
	Mon, 12 Aug 2024 21:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=cristian.ciocaltea@collabora.com header.b="XkdwHxAG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241F610E076
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 21:15:51 +0000 (UTC)
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1723497340; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=lLM8Nabp4cPHVThFZTVOq5Bd+gc6p2PC79wIMbKRl9Hcr0l1ujTJk78kaSHIbYBwcmGJmKxjmUOqKA/Sspoh29t4RCcWW+iV6tXGn9l1N8tZkh+KK98LcCsn1B65enUBdDhZX8s9QWkaESpu+C4bJPK6H5V7e2d4BcVVfRinMOQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1723497340;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=nI08eMuuYklw9xaxXgCwGjyVvNmHkByhpTj6sj4w9O4=; 
 b=dzuBH1QtKNU2bABQNS2za1JhS+n6HtYzV3crBzYqBCovMDer2XumU9a0oAbt7u9WsM2BSqu2Q1yCdX9PPJ5iobd7zZbb7byViJWPKz+AwJl4Vo4Ndeg7uQMGn8FteUcKuXz0biy1j7NxlSuQ++2AMQk4OLTxc0WYNbAoIauyuzY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=cristian.ciocaltea@collabora.com;
 dmarc=pass header.from=<cristian.ciocaltea@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723497340; 
 s=zohomail; d=collabora.com; i=cristian.ciocaltea@collabora.com;
 h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
 bh=nI08eMuuYklw9xaxXgCwGjyVvNmHkByhpTj6sj4w9O4=;
 b=XkdwHxAGvcxLoBbNv/2+Qtr/rFlGZr+zlG22nw+JFQeMFdFU/os8KSBsqV29YdEb
 gWIf6HpQeYvzTQGslOVVGZ07PApOnhm0KB+XE8GBrOE89iq2wHRLw+9Ry4vqjtc5AsU
 6ONUJ0om1NrFJhf3OAd0ksQXPgxsxjE9t7kWR1M4=
Received: by mx.zohomail.com with SMTPS id 1723497338310681.7662889692687;
 Mon, 12 Aug 2024 14:15:38 -0700 (PDT)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH 0/4] Rockchip DW HDMI driver cleanup/improvements
Date: Tue, 13 Aug 2024 00:15:07 +0300
Message-Id: <20240813-dw-hdmi-rockchip-cleanup-v1-0-b3e73b5f4fd6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFt7umYC/x3MSQqEMBBA0atIrbvAxAHxKtKLWClNYXcMCQ4g3
 t3g8i3+vyBxFE7QFxdE3iXJ6jPUpwByxs+MYrNBl7ouO6XRHujsXzCutJCTgPRj47eAVTV2pNq
 pbYgh5yHyJOe7Hr73/QBMFmeOagAAAA==
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.1
X-ZohoMailClient: External
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

This series provides a few patches to cleanup/improve the Rockchip DW
HDMI platform driver.

Note the patches were initially sent as part of [1], in an attempt to
add support for the RK3588 HDMI TX Controller, but were removed in the
next revision as the patchset followed a different development path,
i.e. not relying on the existing driver anymore.

[1] https://lore.kernel.org/all/20240601-b4-rk3588-bridge-upstream-v1-0-f6203753232b@collabora.com/

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Cristian Ciocaltea (4):
      drm/rockchip: dw_hdmi: Use modern drm_device based logging
      drm/rockchip: dw_hdmi: Simplify clock handling
      drm/rockchip: dw_hdmi: Use devm_regulator_get_enable()
      drm/rockchip: dw_hdmi: Drop superfluous assignments of mpll_cfg, cur_ctr and phy_config

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 92 ++++++++---------------------
 1 file changed, 26 insertions(+), 66 deletions(-)
---
base-commit: 9e6869691724b12e1f43655eeedc35fade38120c
change-id: 20240812-dw-hdmi-rockchip-cleanup-33b8c16f65ce

