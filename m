Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD73070FF
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5725689100;
	Thu, 28 Jan 2021 08:16:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 665C66E3D0;
 Wed, 27 Jan 2021 10:51:33 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DD491042;
 Wed, 27 Jan 2021 02:51:32 -0800 (PST)
Received: from e123648.arm.com (unknown [10.57.4.29])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 78B783F66B;
 Wed, 27 Jan 2021 02:51:28 -0800 (PST)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/lima: Use delayed timer as default in devfreq profile
Date: Wed, 27 Jan 2021 10:51:21 +0000
Message-Id: <20210127105121.20345-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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
Cc: christianshewitt@gmail.com, yuq825@gmail.com, lukasz.luba@arm.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Devfreq framework supports 2 modes for monitoring devices.
Use delayed timer as default instead of deferrable timer
in order to monitor the GPU status regardless of CPU idle.

Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
---
Hi all,

I've missed the Lima driver while working on Panfrost patch for fixing
the issue with default devfreq framework polling mode. More about this
and the patch, can be found here [1].

Regards,
Lukasz Luba

[1] https://lore.kernel.org/lkml/20210105164111.30122-1-lukasz.luba@arm.com/

 drivers/gpu/drm/lima/lima_devfreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index 5686ad4aaf7c..f1c9eb3e71bd 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -81,6 +81,7 @@ static int lima_devfreq_get_dev_status(struct device *dev,
 }
 
 static struct devfreq_dev_profile lima_devfreq_profile = {
+	.timer = DEVFREQ_TIMER_DELAYED,
 	.polling_ms = 50, /* ~3 frames */
 	.target = lima_devfreq_target,
 	.get_dev_status = lima_devfreq_get_dev_status,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
