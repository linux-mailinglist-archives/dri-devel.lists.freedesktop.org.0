Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E935ED24D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 02:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4BF10E0BD;
	Wed, 28 Sep 2022 00:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10AFA10E0BD
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 00:58:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4AD5047C;
 Wed, 28 Sep 2022 02:58:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664326694;
 bh=fvPuQ/Y+US5xtb7ESyB03XslFbcNDWdjL91Qb/QFKK8=;
 h=From:To:Cc:Subject:Date:From;
 b=J7U9OO81gZt6Oe25orEMZMdKUVn1xghI9Ar4QiF1lU7+nkb+g1vPJfTdZRsm3l0Kl
 DUXoYiKqLzlA0xgCK+m64LsiXu5F39cVF8FHL57nkYK6F4WYxMQWcXyBi0xZF8jkBa
 5nv0C0wOsGJW6HtR1cWNcCYmb3438IQHZhSzRNWs=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] drm: lcdif: Improve YUV support
Date: Wed, 28 Sep 2022 03:58:08 +0300
Message-Id: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
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
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This small patch series improves YUV support in the i.MX8MP LCDIF
driver. After patches 1/4 and 2/4 that fix tiny cosmetic issues, patch
3/4 fixes YUV quantization range for the RGB to YUV conversion. Patch
4/4 addresses the other direction and adds support for YUV planes.

Please see individual patches for details.

The series has been tested on a Polyhex Debix board with the currently
out-of-tree HDMI encoder support patches developed by Lucas Stach.

Kieran Bingham (1):
  drm: lcdif: Add support for YUV planes

Laurent Pinchart (3):
  drm: lcdif: Fix indentation in lcdif_regs.h
  drm: lcdif: Don't use BIT() for multi-bit register fields
  drm: lcdif: Switch to limited range for RGB to YUV conversion

 drivers/gpu/drm/mxsfb/lcdif_kms.c  | 183 +++++++++++++++++++++++++----
 drivers/gpu/drm/mxsfb/lcdif_regs.h |  37 +++---
 2 files changed, 180 insertions(+), 40 deletions(-)

-- 
Regards,

Laurent Pinchart

