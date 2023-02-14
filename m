Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE4869556D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Feb 2023 01:37:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F7410E7B4;
	Tue, 14 Feb 2023 00:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF1210E7B4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Feb 2023 00:37:39 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4313B3D7;
 Tue, 14 Feb 2023 01:37:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1676335057;
 bh=oK9K1dHY0egTuw0eGZmS4ldHFcwlutfiU1zfyIs4blc=;
 h=From:To:Cc:Subject:Date:From;
 b=UPRbdST860cxRD6yjMX35G6xfTIRVdQFCLIcnBe0mtHpNS3SPnyRVUrn9SofaYm4o
 ws95NaL1tvJ1/5Jroy1uiFnCAl4o4qyHgVPdTTCn0c0s2EGWlFtdwO/7iBg5oYNWFY
 p1tO0Za8jMmqVDXR556mkYX9ILf3x2ScyzJxfTY8=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm: rcar-du: Fix vblank wait timeout when stopping LVDS
 output
Date: Tue, 14 Feb 2023 02:37:33 +0200
Message-Id: <20230214003736.18871-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.1
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
Cc: linux-renesas-soc@vger.kernel.org,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series fixes an issue on the R-Car D3 and E3 SoCs, which
causes a vertical blanking wait timeout when stopping an LVDS output.
Patches 1/3 and 2/3 perform preparatory refactoring, and patch 3/3 fixes
the problem. Please see the commit message of the last patch for a
detailed explanation of the issue.

Laurent Pinchart (3):
  drm: rcar-du: lvds: Call function directly instead of through pointer
  drm: rcar-du: lvds: Move LVDS enable code to separate code section
  drm: rcar-du: lvds: Fix LVDS PLL disable on D3/E3

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c |  18 +--
 drivers/gpu/drm/rcar-du/rcar_lvds.c    | 176 ++++++++++++++-----------
 drivers/gpu/drm/rcar-du/rcar_lvds.h    |  12 +-
 3 files changed, 118 insertions(+), 88 deletions(-)


base-commit: 48075a66fca613477ac1969b576a93ef5db0164f
-- 
Regards,

Laurent Pinchart

