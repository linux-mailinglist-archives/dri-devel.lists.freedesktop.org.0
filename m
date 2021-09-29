Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8034D41C735
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 16:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275FB6EAA2;
	Wed, 29 Sep 2021 14:50:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rivendell.lovergine.com (rivendell.lovergine.com [51.15.207.90])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3C76EAA2
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 14:50:44 +0000 (UTC)
Received: from [93.147.43.242] (helo=legolas.home.lovergine.com)
 by rivendell.lovergine.com with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <frankie@debian.org>)
 id 1mVasl-0005k7-Ck; Wed, 29 Sep 2021 14:48:29 +0000
Received: from [::1] (helo=localhost)
 by legolas.home.lovergine.com with esmtp (Exim 4.94.2)
 (envelope-from <frankie@debian.org>)
 id 1mVask-000UGu-PJ; Wed, 29 Sep 2021 16:48:26 +0200
Date: Wed, 29 Sep 2021 16:48:26 +0200
From: "Francesco P. Lovergine" <frankie@debian.org>
To: dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YVR8ulIcSXEwUY5n@legolas.home.lovergine.com>
References: <YUhseVXMsTJKAqF6@legolas.home.lovergine.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <YUhseVXMsTJKAqF6@legolas.home.lovergine.com>
X-GPG-Fingerprint: 92E4 2D44 336F DF91 5508  23D5 A453 5199 E9F2 C747
X-GPG-Info: finger frankie@db.debian.org
X-Advocacy: Those who use non-free software poison you too. Say them to stop.
X-SA-Exim-Connect-IP: 93.147.43.242
X-SA-Exim-Mail-From: frankie@debian.org
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on scw-thirsty-napier
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
 autolearn=ham autolearn_force=no version=3.4.2
Subject: [PATCH 1/1 REPOST] drm: fix colour banding on Lenovo Thinkpad L540
 panel
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on rivendell.lovergine.com)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

there is an issue with Lenovo Thinkpad L540 panel i.e. a bad looking 
color banding with dark colors mainly, very similar to that present
in other models as pointed in referenced bugs.
That happens with any kernel starting from 4.8 up to the current.

Bug: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1749420
Bug: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1788308
Reviewed-by: Alex Deucher <alexdeucher@gmail.com> 
Signed-off-by: Francesco Paolo Lovergine <frankie@debian.org>
---
  drivers/gpu/drm/drm_edid.c | 3 +++
  1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6325877c5fd6..48e06cc33e4d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -141,6 +141,9 @@ static const struct edid_quirk {
  	/* LGD panel of HP zBook 17 G2, eDP 10 bpc, but reports unknown bpc */
  	{ "LGD", 764, EDID_QUIRK_FORCE_10BPC },

+	/* LGD panel of Lenovo L540 reports 8 bpc, but is a 6 bpc panel */
+	{ "LGD", 0x038e, EDID_QUIRK_FORCE_6BPC },
+
  	/* LG Philips LCD LP154W01-A5 */
  	{ "LPL", 0, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE },
  	{ "LPL", 0x2a00, EDID_QUIRK_DETAILED_USE_MAXIMUM_SIZE },
-- 
2.30.2

-- 
Francesco P. Lovergine
