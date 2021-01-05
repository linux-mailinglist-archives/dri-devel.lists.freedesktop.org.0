Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E79252EBB5D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jan 2021 09:53:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BCB89D99;
	Wed,  6 Jan 2021 08:52:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 95A1989B67
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jan 2021 16:41:29 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9D4F11D4;
 Tue,  5 Jan 2021 08:41:28 -0800 (PST)
Received: from e123648.arm.com (unknown [10.57.0.99])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C6AA13F70D;
 Tue,  5 Jan 2021 08:41:26 -0800 (PST)
From: Lukasz Luba <lukasz.luba@arm.com>
To: linux-kernel@vger.kernel.org, airlied@linux.ie, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/panfrost: Use delayed timer as default in devfreq profile
Date: Tue,  5 Jan 2021 16:41:11 +0000
Message-Id: <20210105164111.30122-1-lukasz.luba@arm.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 06 Jan 2021 08:52:53 +0000
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
Cc: alyssa.rosenzweig@collabora.com, tomeu.vizoso@collabora.com,
 steven.price@arm.com
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

This is just a simple change but has impact on reliable polling mode
with guaranteed sampling rate. The devfreq framework has 2 modes for
checking the device status which updates the statistics. When the
default mode is used (deferred work) it could happen that the
framework won't check the device, if the CPU which was running devfreq
code went idle. In deferred mode, the deferred timer is not fired,
thus framework won't check the device status.

The log below is taken when glxgears was running. It can be seen that
periodic checks are missing (should be every 50ms).

----------------------------------------------------------------------

[  128.046555] panfrost ff9a0000.gpu: busy 18029406 total 67940380 26 % freq 200 MHz
[  128.110538] panfrost ff9a0000.gpu: busy 7975930 total 63980997 12 % freq 200 MHz
[  128.210606] panfrost ff9a0000.gpu: busy 21148792 total 100074440 21 % freq 200 MHz
[  128.594638] panfrost ff9a0000.gpu: busy 53739467 total 384032219 13 % freq 200 MHz
[  129.178749] panfrost ff9a0000.gpu: busy 89206245 total 584111500 15 % freq 200 MHz
[  129.294601] panfrost ff9a0000.gpu: busy 16446118 total 115852915 14 % freq 200 MHz
[  129.762616] panfrost ff9a0000.gpu: busy 71481587 total 468015722 15 % freq 200 MHz
[  129.874762] panfrost ff9a0000.gpu: busy 15614112 total 112139938 13 % freq 200 MHz
[  130.026585] panfrost ff9a0000.gpu: busy 21397620 total 151821546 14 % freq 200 MHz
[  130.110536] panfrost ff9a0000.gpu: busy 21429365 total 83952016 25 % freq 200 MHz
[  130.178524] panfrost ff9a0000.gpu: busy 16458197 total 67989072 24 % freq 200 MHz
[  130.246528] panfrost ff9a0000.gpu: busy 9876225 total 68004030 14 % freq 200 MHz
[  130.310529] panfrost ff9a0000.gpu: busy 9211725 total 64000524 14 % freq 200 MHz
[  130.410528] panfrost ff9a0000.gpu: busy 21780828 total 99999250 21 % freq 200 MHz

----------------------------------------------------------------------

It has impact on devfreq cooling and thermal governor. They rely on these
statistics, but sometimes the data is stale.

This patch switches to more reliable devfreq mode, which uses delayed work.

Regards,
Lukasz


 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index f44d28fad085..56b3f5935703 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -76,6 +76,7 @@ static int panfrost_devfreq_get_dev_status(struct device *dev,
 }
 
 static struct devfreq_dev_profile panfrost_devfreq_profile = {
+	.timer = DEVFREQ_TIMER_DELAYED,
 	.polling_ms = 50, /* ~3 frames */
 	.target = panfrost_devfreq_target,
 	.get_dev_status = panfrost_devfreq_get_dev_status,
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
