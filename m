Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0A54F3FA2
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 23:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49B1010EED1;
	Tue,  5 Apr 2022 21:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7977810EECD
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 21:03:55 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id h16so258703wmd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 14:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ox4yXC0LP8o2wCPaioNRgnQjoBr7m6vhS+hT+ChhFWw=;
 b=Sgh3CF5Ckw42AeEhX78SI/d/+ee0k632GIyAmfCQa6GpzvQ/S3HANfSm4C0XKuP4+X
 v3lbVepEiDelzTwS2GE3w74y7BsywOzQ1iZjEgv3QRTaOEVvd8yMx+CnFdb/BXKoDsba
 TYH+msiuIzP7Pah2Gb87+iwP1V8fnkwyIy/jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ox4yXC0LP8o2wCPaioNRgnQjoBr7m6vhS+hT+ChhFWw=;
 b=Kbc9ZkvrkyxriDRmIGy1FdBixifUbzVzE37z7PtTYAEBYpxuv4pJbmq5I9KU3xtDPy
 nEv9WKmcDeIOwLr0zjuj9BVssQudDFI1s3m6BM0eZ0eO4No/FF3zcxwP9sDawCiUdP/b
 FKPQquQiUyOUWA4X9sc+JHHS4/dZUj9RPHHKakUCsYe3HigsNAnopWgevzEZEJtl4YAV
 GJAONMbnpaH+gkqZpJRmpnJjG9oAjmUVxZsvtG0iNWIDinvDrL0W4WZqNAxhFF60w4Wl
 KCICYitCbJNoCXhbqg7Mfpno2cMAgYTpB9AdPQo25jwDXUF1jIQova4sUPu9Wnfv+3nL
 pPZA==
X-Gm-Message-State: AOAM532U84WOplYmYGV7BdP9goTxwiXElPwp4cwAqbadBNmmcS7sG/EU
 f+gTY3Pec8u4YYhq7qX+FvjvO7v2K4zhImHXjQU=
X-Google-Smtp-Source: ABdhPJx9UpHyqbLoK0CaZyafLEEes2Y+/xKuaKuYEnp6xN7y7BE/+nbUdlvugVR72TTVLP4cXaHVHA==
X-Received: by 2002:a7b:c844:0:b0:37b:b986:7726 with SMTP id
 c4-20020a7bc844000000b0037bb9867726mr4869296wml.160.1649192634031; 
 Tue, 05 Apr 2022 14:03:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm4858569wmb.36.2022.04.05.14.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:03:53 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 13/17] fbcon: Consistently protect deferred_takeover with
 console_lock()
Date: Tue,  5 Apr 2022 23:03:31 +0200
Message-Id: <20220405210335.3434130-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
References: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Claudio Suarez <cssk@net-c.es>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This shouldn't be a problem in practice since until we've actually
taken over the console there's nothing we've registered with the
console/vt subsystem, so the exit/unbind path that check this can't
do the wrong thing. But it's confusing, so fix it by moving it a tad
later.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbcon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index cc960bf49991..4f9752ee9189 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -3227,6 +3227,9 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
 
 	console_lock();
 
+	deferred_takeover = false;
+	logo_shown = FBCON_LOGO_DONTSHOW;
+
 	for_each_registered_fb(i)
 		fbcon_fb_registered(registered_fb[i]);
 
@@ -3244,8 +3247,6 @@ static int fbcon_output_notifier(struct notifier_block *nb,
 	pr_info("fbcon: Taking over console\n");
 
 	dummycon_unregister_output_notifier(&fbcon_output_nb);
-	deferred_takeover = false;
-	logo_shown = FBCON_LOGO_DONTSHOW;
 
 	/* We may get called in atomic context */
 	schedule_work(&fbcon_deferred_takeover_work);
-- 
2.34.1

