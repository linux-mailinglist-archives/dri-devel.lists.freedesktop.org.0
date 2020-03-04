Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8830B17A0FC
	for <lists+dri-devel@lfdr.de>; Thu,  5 Mar 2020 09:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6AEB6EB9A;
	Thu,  5 Mar 2020 08:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs31.siol.net [185.57.226.222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 604976E11E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2020 23:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 48B575235DD;
 Thu,  5 Mar 2020 00:25:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta11.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta11.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id EXGg_K0T1SsA; Thu,  5 Mar 2020 00:25:32 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id F060252273A;
 Thu,  5 Mar 2020 00:25:31 +0100 (CET)
Received: from localhost.localdomain (cpe-194-152-20-232.static.triera.net
 [194.152.20.232]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id 749F35235DD;
 Thu,  5 Mar 2020 00:25:29 +0100 (CET)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: a.hajda@samsung.com,
	narmstrong@baylibre.com
Subject: [PATCH v2 0/4] drm/bridge: dw-hdmi: Various updates
Date: Thu,  5 Mar 2020 00:25:08 +0100
Message-Id: <20200304232512.51616-1-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 05 Mar 2020 08:14:30 +0000
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
Cc: jernej.skrabec@siol.net, jonas@kwiboo.se, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series fixes multiple issues I found out.
Patch 1 fixes reporting colorimetry in AVI frame.
Patch 2 sets scan mode to underscan which is in line with most other
hdmi drivers.
Patch 3 aligns RGB quantization to CEA 861 standard.
Patch 4 reworks is_color_space_conversion(). Now it checks only if
color space conversion is required. Patch adds separate function for
checking if any kind of conversion is required.

Please take a look.

Best regards,
Jernej

Changes from v2:
- added tags
- replaced patch 2 with patch 4
- renamed rgb conversion matrix and make hex lowercase
- move logic for checking if rgb full to limited range conversion is
  needed to is_color_space_conversion()
- reworked logic for csc matrix selection

Jernej Skrabec (3):
  drm/bridge: dw-hdmi: fix AVI frame colorimetry
  drm/bridge: dw-hdmi: Add support for RGB limited range
  drm/bridge: dw-hdmi: rework csc related functions

Jonas Karlman (1):
  drm/bridge: dw-hdmi: do not force "none" scan mode

 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 132 ++++++++++++++--------
 1 file changed, 88 insertions(+), 44 deletions(-)

-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
