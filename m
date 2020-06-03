Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B27911EDDBC
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:12:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BF446E261;
	Thu,  4 Jun 2020 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1518 seconds by postgrey-1.36 at gabe;
 Wed, 03 Jun 2020 12:59:08 UTC
Received: from www413.your-server.de (www413.your-server.de [88.198.28.140])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57A989BFF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 12:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=cyberus-technology.de; s=default1911; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WLXbW7eXUFsbHAU7HjXMcrh7C07cQvd1bw2Aquc/MMQ=; b=STO4UMrdwTubX7v2omyrFeJGM
 qq1ZY5ooXteqYoYSLnmjaa26PlLavdzZlWh+u8ynyZLVI3Q0Uaxf402CkZy/RE4ZV18Od2J2uywZL
 0B1rHQHjfnHHqiKmwIQUqAiEY2G1DFCmNHqEkClSgIVtDaUl7JOuXXw/PE64bbxZMJNcUEKZW0nmg
 pWFa9cHKM35fG6Czz9iSJcJUasT2242nsmibkiyGYkBZnDBs8dKH+356OK5Ea5pSGrX0D4tO+G9VV
 vXtnD3cxWfSWGQHS08JTJ9+oCPvGgxMazUqgZxj8wjIXX0mWAqPmTQ0ufTVzJaFMBwt5o5FVOQ7J+
 8AQnbtzRA==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www413.your-server.de with esmtpsa (TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256)
 (Exim 4.89_1)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jgSaZ-0000IJ-Jk; Wed, 03 Jun 2020 14:33:48 +0200
Received: from [2001:16b8:5718:c600:5706:3182:8b16:9ba] (helo=linux.fritz.box)
 by sslproxy01.your-server.de with esmtpsa
 (TLSv1:ECDHE-RSA-AES256-SHA:256) (Exim 4.92)
 (envelope-from <julian.stecklina@cyberus-technology.de>)
 id 1jgSaZ-000LTO-DG; Wed, 03 Jun 2020 14:33:47 +0200
From: Julian Stecklina <julian.stecklina@cyberus-technology.de>
To: intel-gvt-dev@lists.freedesktop.org
Subject: [PATCH] drm/i915/gvt: print actionable error message when gm runs out
Date: Wed,  3 Jun 2020 14:33:21 +0200
Message-Id: <20200603123321.263895-1-julian.stecklina@cyberus-technology.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Authenticated-Sender: julian.stecklina@cyberus-technology.de
X-Virus-Scanned: Clear (ClamAV 0.102.2/25831/Tue Jun  2 14:41:03 2020)
X-Mailman-Approved-At: Thu, 04 Jun 2020 07:11:42 +0000
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
Cc: Julian Stecklina <julian.stecklina@cyberus-technology.de>,
 Thomas Prescher <thomas.prescher@cyberus-technology.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a user tries to allocate too many or too big vGPUs and runs out
of graphics memory, the resulting error message is not actionable and
looks like an internal error.

Change the error message to clearly point out what actions a user can
take to resolve this situation.

Cc: Thomas Prescher <thomas.prescher@cyberus-technology.de>
Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Signed-off-by: Julian Stecklina <julian.stecklina@cyberus-technology.de>
---
 drivers/gpu/drm/i915/gvt/aperture_gm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/aperture_gm.c b/drivers/gpu/drm/i915/gvt/aperture_gm.c
index 0d6d598713082..5c5c8e871dae2 100644
--- a/drivers/gpu/drm/i915/gvt/aperture_gm.c
+++ b/drivers/gpu/drm/i915/gvt/aperture_gm.c
@@ -69,9 +69,12 @@ static int alloc_gm(struct intel_vgpu *vgpu, bool high_gm)
 				  start, end, flags);
 	mmio_hw_access_post(gt);
 	mutex_unlock(&gt->ggtt->vm.mutex);
-	if (ret)
-		gvt_err("fail to alloc %s gm space from host\n",
-			high_gm ? "high" : "low");
+	if (ret) {
+		gvt_err("vgpu%d: failed to allocate %s gm space from host\n",
+			vgpu->id, high_gm ? "high" : "low");
+		gvt_err("vgpu%d: destroying vGPUs, decreasing vGPU memory size or increasing GPU aperture size may resolve this\n",
+			vgpu->id);
+	}
 
 	return ret;
 }
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
