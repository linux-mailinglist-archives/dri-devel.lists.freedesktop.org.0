Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B873640846
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 15:21:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BC6810E05D;
	Fri,  2 Dec 2022 14:21:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2F2710E05D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 14:20:56 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a02:2f08:4503:c400:e6b9:7aff:febb:e612])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: mvlad)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C58536602BC2;
 Fri,  2 Dec 2022 14:20:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1669990855;
 bh=JwDOxpdwp4ybLptjJG370wNtc5u0F8yOKAMa4QzPeWs=;
 h=From:To:Cc:Subject:Date:From;
 b=aDDakGbBcss4/bcli0EtdKenaVSwycBU2h1AusOW6+eizJ0C60/ZdQzXHy4LIZVNS
 Ovz7aDPuM+m0Bomm/JxT/Oyadx6LkLHLggkM/hKOzb5QtutRrsN3REPDoVLNcNIS9P
 492Mv0tJ8kZEluMrN6coSpN6vzysYJnCQ+5vEpfnKgpMv0BtfNEwj/q13FpO6dSk0K
 IReXj5z00tmz3p2zaiBUHsQEtxp6k8ib/QQSQCb4+YfCe7micDUEBzFhhxmrRhAmk7
 HXhQxLYZcvn2KWEi1SQXeOMUXBHz2EOgC1GwG3/sL6O2ATCy+mqFy/KapNCH5e68Xg
 aicaKJmRjkM7w==
From: Marius Vlad <marius.vlad@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] vkms: Add support for multiple connectors
Date: Fri,  2 Dec 2022 16:20:49 +0200
Message-Id: <20221202142051.136651-1-marius.vlad@collabora.com>
X-Mailer: git-send-email 2.35.1
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
Cc: mwen@igalia.com, rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 marius.vlad@collabora.com, igormtorrente@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With multiple outputs available we can perform management of outputs at
a more granular level, such that we're able to turn off or on, several
outputs at a time, or combinations that arise from doing that. 

The Weston project use VKMS when running its test suite in CI, and we
have now uses cases which would need to ability to set-up the outputs
DPMS/state individually, rather than globally -- which would affect all
outputs. This an attempt on fixing that by giving the possibility to
create more than one output, and thus allowing to run tests that could
exercise code paths in the compositor related to management of outputs.

Marius Vlad (2):
  vkms: Pass the correct bitmask for possible crtcs
  vkms: Add support for multiple connectors

 drivers/gpu/drm/vkms/vkms_crtc.c      |  3 +--
 drivers/gpu/drm/vkms/vkms_drv.c       | 26 ++++++++++++++++++++++----
 drivers/gpu/drm/vkms/vkms_drv.h       |  8 +++++---
 drivers/gpu/drm/vkms/vkms_output.c    |  7 +++----
 drivers/gpu/drm/vkms/vkms_writeback.c | 18 ++++++++----------
 5 files changed, 39 insertions(+), 23 deletions(-)

-- 
2.35.1

