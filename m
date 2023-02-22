Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5816769FFB2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 00:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A038C10E465;
	Wed, 22 Feb 2023 23:42:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A97CC10E465
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 23:42:15 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C25BA25;
 Thu, 23 Feb 2023 00:42:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1677109334;
 bh=gCMAwIH0zLLLlggmNKPdgNSuCPZbcYroWdm2MwM5M+0=;
 h=From:To:Cc:Subject:Date:From;
 b=PXgz8eq8xi05svtYBl3hfiDYPpPFC+DzPzHcoHe6iOh26PSU3deltF20GOjFpC0QC
 4mhiR2FaLZlNgNRjH67BjB6w47NvgG7XwS4ITBaG8wcuBcN85//XnAVLWi52iO3xkk
 XA1wZ6BbJX8NnmCN4ingvWevH0F6TyKrqLzj89eM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm: rcar-du: Fix more invalid register writes
Date: Thu, 23 Feb 2023 01:42:10 +0200
Message-Id: <20230222234212.5461-1-laurent.pinchart+renesas@ideasonboard.com>
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

Following the "[PATCH 0/2] drm: rcar-du: Avoid writing reserved register
fields" series ([1]), this series addresses more invalid register
writes in the R-Car DU driver. Patch 1/2 first renames some register
field macros to increase readability, and patch 2/2 fixes the invalid
writes.

The rationale is the same as for the previous series: the current
implementation is likely fine, but doesn't pass the functional safety
requirements as it doesn't match the documentation.

The series supersedes the patch "[PATCH] drm: rcar-du: Write correct
values in DORCR reserved fields" ([2]) that I have just sent, which was
messing the 1/2 dependency. Patch 2/2 is otherwise identical to [2].

[1] https://lore.kernel.org/dri-devel/20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com/T/#t
[2] https://lore.kernel.org/dri-devel/20230222233113.4737-1-laurent.pinchart+renesas@ideasonboard.com/T/#u

Laurent Pinchart (2):
  drm: rcar-du: Rename DORCR fields to make them 0-based
  drm: rcar-du: Write correct values in DORCR reserved fields

 drivers/gpu/drm/rcar-du/rcar_du_group.c | 16 +++++++++++----
 drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 26 ++++++++++++-------------
 2 files changed, 25 insertions(+), 17 deletions(-)

-- 
Regards,

Laurent Pinchart

