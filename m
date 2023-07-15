Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7690D754B30
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jul 2023 20:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE5F310E1C9;
	Sat, 15 Jul 2023 18:54:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DD310E180;
 Sat, 15 Jul 2023 18:53:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A8CE31FD67;
 Sat, 15 Jul 2023 18:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689447230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7Mpa+i5zVgwFyEUu/qFO3pmfeFq7myykbLWTHzzTXc=;
 b=FKXRk9Rs0p/wWygeIwcofCSMLcvh3D+HZRevzxln0Q9nv0hzyaa2BjZyC8bgRiXvrhpd/D
 nwQnSRB7LIFVZhB9gvdDuKZQp5s85400bWwXiKV7Nj/M7EnZxkMrJixADCwRbKZM5agq+j
 9fN21b9/zQMyJzS+04n+ZKUe+zHBk6E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689447230;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q7Mpa+i5zVgwFyEUu/qFO3pmfeFq7myykbLWTHzzTXc=;
 b=1ikzy2+ncpFn+AxbrKecbjenm1ztTvNEgh++r4yJKXhqXpuUDOGFhEJVh6taETEvUh26oz
 EqUdeNHw5yPVf/BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3D076133F7;
 Sat, 15 Jul 2023 18:53:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QKT+DT7rsmQCBwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sat, 15 Jul 2023 18:53:50 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, javierm@redhat.com, geert@linux-m68k.org,
 dan.carpenter@linaro.org
Subject: [PATCH v4 11/18] media: Remove flag FBINFO_FLAG_DEFAULT from fbdev
 drivers
Date: Sat, 15 Jul 2023 20:51:53 +0200
Message-ID: <20230715185343.7193-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230715185343.7193-1-tzimmermann@suse.de>
References: <20230715185343.7193-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, Andy Walls <awalls@md.metrocast.net>,
 kvm@vger.kernel.org, linux-hyperv@vger.kernel.org, linux-sh@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-geode@lists.infradead.org,
 Hans Verkuil <hverkuil@xs4all.nl>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org,
 linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The flag FBINFO_FLAG_DEFAULT is 0 and has no effect, as struct
fbinfo.flags has been allocated to zero by kzalloc(). So do not
set it.

Flags should signal differences from the default values. After cleaning
up all occurrences of FBINFO_DEFAULT, the token will be removed.

v2:
	* fix commit message (Miguel)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hverkuil@xs4all.nl>
---
 drivers/media/pci/ivtv/ivtvfb.c              | 1 -
 drivers/media/test-drivers/vivid/vivid-osd.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtvfb.c b/drivers/media/pci/ivtv/ivtvfb.c
index 0aeb9daaee4c..23c8c094e791 100644
--- a/drivers/media/pci/ivtv/ivtvfb.c
+++ b/drivers/media/pci/ivtv/ivtvfb.c
@@ -1048,7 +1048,6 @@ static int ivtvfb_init_vidmode(struct ivtv *itv)
 	/* Generate valid fb_info */
 
 	oi->ivtvfb_info.node = -1;
-	oi->ivtvfb_info.flags = FBINFO_FLAG_DEFAULT;
 	oi->ivtvfb_info.par = itv;
 	oi->ivtvfb_info.var = oi->ivtvfb_defined;
 	oi->ivtvfb_info.fix = oi->ivtvfb_fix;
diff --git a/drivers/media/test-drivers/vivid/vivid-osd.c b/drivers/media/test-drivers/vivid/vivid-osd.c
index ec25edc679b3..051f1805a16d 100644
--- a/drivers/media/test-drivers/vivid/vivid-osd.c
+++ b/drivers/media/test-drivers/vivid/vivid-osd.c
@@ -310,7 +310,6 @@ static int vivid_fb_init_vidmode(struct vivid_dev *dev)
 	/* Generate valid fb_info */
 
 	dev->fb_info.node = -1;
-	dev->fb_info.flags = FBINFO_FLAG_DEFAULT;
 	dev->fb_info.par = dev;
 	dev->fb_info.var = dev->fb_defined;
 	dev->fb_info.fix = dev->fb_fix;
-- 
2.41.0

