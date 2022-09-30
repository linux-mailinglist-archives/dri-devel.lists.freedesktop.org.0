Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCE835F06B9
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 10:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAE4A10EBD4;
	Fri, 30 Sep 2022 08:40:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CDFA10E14E
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 08:39:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A7514D5;
 Fri, 30 Sep 2022 10:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664527197;
 bh=aVKJKo2nJVr5mLmYcPaqSQUCn4Tsf1koioF3PMeiN1o=;
 h=From:To:Cc:Subject:Date:From;
 b=DVODasqOz1Y351FKwirqXBx1wgFqvRv44LNP3roa3I0EHwTvJ5L/vewYBtOWdTAIg
 uoWU/ZprWkz4nRKJzcLHtY5Otqx5HKyAUQn9Dahn50mb6c9RHI0RGGUqXXo+Frhq4r
 ihjX0On1GpYccvbiFyJ2Sg45eizxPMtnKpbeOD1c=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/4] drm: lcdif: Improve YUV support
Date: Fri, 30 Sep 2022 11:39:51 +0300
Message-Id: <20220930083955.31580-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Daniel Scally <dan.scally@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This small patch series improves YUV support in the i.MX8MP LCDIF
driver. After patches 1/4 and 2/4 that fix tiny cosmetic issues, patch
3/4 fixes YUV quantization range for the RGB to YUV conversion. Patch
4/4 addresses the other direction and adds support for YUV planes.

Compared to v3, review comments have been taken into account, and the
series has been rebased on top of drm-misc-next.

Compared to v2, review comments have been taken into account, and the
YUV to RGB coefficients in patch 4/4 have been fixed (they were
blatantly wrong due to a stupid mistake).

Please see individual patches for details and detailed changelogs.

The series has been tested on a Polyhex Debix board with the currently
out-of-tree HDMI encoder support patches developed by Lucas Stach, with
the kmstest and the libcamera 'cam' applications.

There is a know issue with the way the driver programs the format and
pitch, which produces incorrect output when testing YUV formats with the
legacy (non-atomic) KMS API, in particular with the modetest
application. The framebuffer is accessed from the plane state in
function called from the .atomic_enable() handler, which in some
circumstances results in the format and/or pitch of the old frame buffer
being used. This issue preexists, and can be triggered by selecting a
different RGB format with modetest (XR15 for instance). It should be
fixed separately, and I wouldn't consider it as a blocker for this
series as YUV formats can already be used correctly when using the KMS
atomic API.

Kieran Bingham (1):
  drm: lcdif: Add support for YUV planes

Laurent Pinchart (3):
  drm: lcdif: Fix indentation in lcdif_regs.h
  drm: lcdif: Don't use BIT() for multi-bit register fields
  drm: lcdif: Switch to limited range for RGB to YUV conversion

 drivers/gpu/drm/mxsfb/lcdif_kms.c  | 239 ++++++++++++++++++++++++++---
 drivers/gpu/drm/mxsfb/lcdif_regs.h |  37 +++--
 2 files changed, 236 insertions(+), 40 deletions(-)


base-commit: c9b48b91e2fbb74fb981aa616a6ef3c78194077f
-- 
Regards,

Laurent Pinchart

