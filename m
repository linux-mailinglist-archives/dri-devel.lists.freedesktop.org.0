Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEA169EE25
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 06:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1609110E177;
	Wed, 22 Feb 2023 05:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FCDB10E177
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 05:06:27 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 691264E1;
 Wed, 22 Feb 2023 06:06:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1677042385;
 bh=2fUkWqUZ1ev2NS7cgswhfkQRKA3zoZl8RqK48MXGMRA=;
 h=From:To:Cc:Subject:Date:From;
 b=SON0MJi6iGvR2dQ+vxeLD+KXRajL9wgRCMo4zlbPfFZW1TuHKwIiw03Dd6kOmspn1
 wi5b9U2GzclVo2jymJUqNOgbqSO7N7LcZtOqFEBQZASa46ImsndQrSMGxu7fyDtclm
 tAKzHwGZQXw6Tygqf87pJkj8rm1MSHASXCbu2si0=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm: rcar-du: Avoid writing reserved register fields
Date: Wed, 22 Feb 2023 07:06:21 +0200
Message-Id: <20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
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

This patch series addresses writes to reserved register fields or
reserved registers.

Depending on the DU variant, some registers or register fields are
marked as reserved, but the rcar-du driver writes them unconditionally.
There is a high chance that those registers and fields are simply
ignored, as shown by the lack of known issue. However, high chances
don't satisfy functional safety requirements when they don't match the
documentation.

As there is no chance of datasheet updates that will document these
reserved fields as safe to be written with non-zero values, update the
driver to comply with the documentation.

Laurent Pinchart (2):
  drm: rcar-du: Don't write unimplemented ESCR and OTAR registers on
    Gen3
  drm: rcar-du: Disable alpha blending for DU planes used with VSP

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 17 +++++++++++++++--
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c  |  2 +-
 2 files changed, 16 insertions(+), 3 deletions(-)

-- 
Regards,

Laurent Pinchart

