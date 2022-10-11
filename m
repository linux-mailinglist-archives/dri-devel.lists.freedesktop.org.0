Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC2665FB892
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 18:52:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D4B10E88D;
	Tue, 11 Oct 2022 16:52:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC4F10E836
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 16:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665507119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IBnOwoRDbp5lIz7DyyRGWmB6mwXxMA+2lwoGkttbDwg=;
 b=QANCQQWuaAKu9SozPKqXl5esLddROk0RozNRmhgHH+CkzWfEhR1jdGARxc38yQnvFvUs53
 hOISXCbdyPaQXc32cAgS2H2OJtCmWmYzbwM2h4iSQiaExTIocLLu00rRVrEEgg8OzGi5qq
 2DfmVY2KYzfDgAS/pNFB80DttOOPG74=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-290-FqZm6c6GON6vhcJ4ab1tRA-1; Tue, 11 Oct 2022 12:51:56 -0400
X-MC-Unique: FqZm6c6GON6vhcJ4ab1tRA-1
Received: by mail-wr1-f71.google.com with SMTP id
 p7-20020adfba87000000b0022cc6f805b1so4106150wrg.21
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 09:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IBnOwoRDbp5lIz7DyyRGWmB6mwXxMA+2lwoGkttbDwg=;
 b=NNN1z7SIyyEXLPJJSh2d1ylqF4o6B/9nEFzLxn3JhBcwt4OFUdvzKjlCZGndW0Lxn2
 0vIJ3qIQGJdoLJrI0P4Ae9KLquJfbf66tJoDagES2cMWYb/XryZvKUWTp97QtlFkRS7u
 dVIZvemzBD+dTPeE/ZAVCP9EVc2XLYmjWh0wO2QC+rEHfhloI7HlJ+LNYHPB1zwdrK3O
 ce5F99vwXcdcufiVRz7tKwD5piV2zCVOKysDVAFEHoWq9LtoFX9sdrrAgawNHFazwkEL
 +GhGgckxDjNJv79F46RtC3IMSVMnRTEkbkV6Iw5+y0CQqc8oyDJDmK1L/W08K+vQnDbc
 TZgA==
X-Gm-Message-State: ACrzQf0CMAE97DbmwWL12b/VgyvpnoTQmog1QGmjYeE2VFuxy98PDBzE
 kvvE2NIunDRqX2hNTJL885wxXIQ7NO4hoYjnWaXKBMGm6x9FNSESg+Fle6/+h5nFXgnlphIhcyo
 EPec1l+N88z7i+DNqD58+8f1doApq
X-Received: by 2002:adf:f709:0:b0:22e:327d:f147 with SMTP id
 r9-20020adff709000000b0022e327df147mr15586634wrp.240.1665507114902; 
 Tue, 11 Oct 2022 09:51:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7dY1FoQ99k7LwWCoZXgCqLmpVU8EUj6xpAdddZbJApMpnMONvuXyLssmYE8+jwEFMpfFP2QQ==
X-Received: by 2002:adf:f709:0:b0:22e:327d:f147 with SMTP id
 r9-20020adff709000000b0022e327df147mr15586620wrp.240.1665507114554; 
 Tue, 11 Oct 2022 09:51:54 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 c19-20020a05600c0a5300b003c6c76b43a1sm2025629wmq.13.2022.10.11.09.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Oct 2022 09:51:52 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] drm/ssd130x: Do not call
 drm_atomic_add_affected_planes()
Date: Tue, 11 Oct 2022 18:51:35 +0200
Message-Id: <20221011165136.469750-4-javierm@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221011165136.469750-1-javierm@redhat.com>
References: <20221011165136.469750-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's no need to add planes to the atomic state. Remove the call
to drm_atomic_add_affected_planes() from ssd130x.

On full modesets, the DRM helpers already add a CRTC's planes to the
atomic state; see drm_atomic_helper_check_modeset(). There's no reason
to call drm_atomic_add_affected_planes() unconditionally in the CRTC's
atomic_check() in ssd130x. It's also too late, as the atomic_check()
of the added planes will not be called before the commit.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

 drivers/gpu/drm/solomon/ssd130x.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 57e48355c008..0d4ab65233db 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -649,17 +649,11 @@ static int ssd130x_crtc_helper_atomic_check(struct drm_crtc *crtc,
 					    struct drm_atomic_state *new_state)
 {
 	struct drm_crtc_state *new_crtc_state = drm_atomic_get_new_crtc_state(new_state, crtc);
-	int ret;
 
 	if (!new_crtc_state->enable)
-		goto out;
-
-	ret = drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
-	if (ret)
-		return ret;
+		return 0;
 
-out:
-	return drm_atomic_add_affected_planes(new_state, crtc);
+	return drm_atomic_helper_check_crtc_primary_plane(new_crtc_state);
 }
 
 /*
-- 
2.37.3

