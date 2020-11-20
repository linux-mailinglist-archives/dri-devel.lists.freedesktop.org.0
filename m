Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6932BB3EC
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 19:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5296E912;
	Fri, 20 Nov 2020 18:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E7F76E905
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 18:40:27 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0CFD8246A5;
 Fri, 20 Nov 2020 18:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605897626;
 bh=Y8kh4owvTk63yVbmvl7KFgSqNLo2VS4SK56SXLF+fBI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dop1Dk46ltomSe9RnVeh+F4JQdthkLRZGJkGbcpFRXggLCnBfNjtF6Qh30G6n3yh6
 jPfF/2qAWBAInawMufgN75RsUlg+KGdHY64wLZXOCwlNlFzof9nhzTcoZjD2RxQIQ/
 8uf1yq40dFK9D7Ue5Q/Wr4bohI0P/XZLWdzxFBlY=
Date: Fri, 20 Nov 2020 12:40:32 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Andres Salomon <dilinger@queued.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 134/141] video: fbdev: lxfb_ops: Fix fall-through warnings
 for Clang
Message-ID: <9c1dcb12aae7c7ff0907ffb99ffd227656cbe444.1605896060.git.gustavoars@kernel.org>
References: <cover.1605896059.git.gustavoars@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1605896059.git.gustavoars@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/video/fbdev/geode/lxfb_ops.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/geode/lxfb_ops.c b/drivers/video/fbdev/geode/lxfb_ops.c
index b3a041fce570..32baaf59fcf7 100644
--- a/drivers/video/fbdev/geode/lxfb_ops.c
+++ b/drivers/video/fbdev/geode/lxfb_ops.c
@@ -682,6 +682,7 @@ static void lx_restore_display_ctlr(struct lxfb_par *par)
 		case DC_DV_CTL:
 			/* set all ram to dirty */
 			write_dc(par, i, par->dc[i] | DC_DV_CTL_CLEAR_DV_RAM);
+			break;
 
 		case DC_RSVD_1:
 		case DC_RSVD_2:
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
