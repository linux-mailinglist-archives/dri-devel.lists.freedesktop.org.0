Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D852F8CE3
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jan 2021 11:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96D96E584;
	Sat, 16 Jan 2021 10:44:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 751FD6E488
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jan 2021 19:12:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 06B02ACAC;
 Fri, 15 Jan 2021 19:12:18 +0000 (UTC)
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: mripard@kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/vc4: Unify PCM card's driver_name
Date: Fri, 15 Jan 2021 20:12:09 +0100
Message-Id: <20210115191209.12852-1-nsaenzjulienne@suse.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 16 Jan 2021 10:44:40 +0000
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
Cc: stefan.wahren@i2se.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 tiwai@suse.com, broonie@kernel.org,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

User-space ALSA matches a card's driver name against an internal list of
aliases in order to select the correct configuration for the system.
When the driver name isn't defined, the match is performed against the
card's name.

With the introduction of RPi4 we now have two HDMI ports with two
distinct audio cards. This is reflected in their names, making them
different from previous RPi versions. With this, ALSA ultimately misses
the board's configuration on RPi4.

In order to avoid this, set "card->driver_name" to "vc4-hdmi"
unanimously.

Signed-off-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Fixes: f437bc1ec731 ("drm/vc4: drv: Support BCM2711")
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 97f368bc1c67..4bdc8e71b5e5 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -1404,6 +1404,7 @@ static int vc4_hdmi_audio_init(struct vc4_hdmi *vc4_hdmi)
 	card->dai_link = dai_link;
 	card->num_links = 1;
 	card->name = vc4_hdmi->variant->card_name;
+	card->driver_name = "vc4-hdmi";
 	card->dev = dev;
 	card->owner = THIS_MODULE;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
