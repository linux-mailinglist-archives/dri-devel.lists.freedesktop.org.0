Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0ACF5FA259
	for <lists+dri-devel@lfdr.de>; Mon, 10 Oct 2022 19:02:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E2410E688;
	Mon, 10 Oct 2022 17:02:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F24F710E68C
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 17:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665421336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I8yaCP9ce66rAwzKDzbvHaA4XIfJFeHvOc66mwQOMSw=;
 b=Ish7IujUkvYklivIpEuHb+sZMe7ZHRv/osePyAougDSjKtvGwhQCADaaEJ/qG0J4bMTRel
 3TNIkYl8e2ATwdkOV168J8fSqvKBUeL0E8iMSLpBm7WaHo2HWw8ujXU4nKmFevJb3x4q8u
 XF+lrw9JeS/3hAFIykGDJIW0aiHaN2E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-154-67xLh28TOki7BbIGaMIrXQ-1; Mon, 10 Oct 2022 13:02:15 -0400
X-MC-Unique: 67xLh28TOki7BbIGaMIrXQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 m20-20020adfa3d4000000b0022e2fa93dd1so2930675wrb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Oct 2022 10:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I8yaCP9ce66rAwzKDzbvHaA4XIfJFeHvOc66mwQOMSw=;
 b=6CdacgUelhDPKrHlQqy4bzLoVDcuLPqjsRRsl4VCggY/qEH42mLvxDHp+H8n+jyI0j
 0Z+GqpVezSdV22vtrkSPklsau5drL/0RM9xh26hlH6t+mgwPFSrSMiLBMl/O74ggFkBz
 jG/9WQEPXwEhFxxI5QLaIVEfJGygs5WARI43ZT1c2sTSkGZHkXn7r4Eg69W3C/FGGeQQ
 RXMjBW7j+FH28r4cDNZrAJQer5Mf+WQ20Nr79rIGQJ8jkZXmoKewPsp5FR4Vv8lBeLNw
 ikP+3ukzbhrnocVbqqi1kIjaRTOgcRL0OIbnNHwWjOwzFg4AX0ayTXaGHhuobYmVhXq7
 rcMw==
X-Gm-Message-State: ACrzQf1ciw2uOjsqubd8CbfitYbuqFzm6e1uyPoKLdXGWcRoQEuIIQLw
 QY5i/k6DB23Md5jAShbfVnz1z15amchdnkepB4bVqnNgNFCFsvs2HEvJieTwIHpfLuSr/7X1JIA
 HoZciSPM2F4yWnLNSVtGIJLaM49/Q
X-Received: by 2002:a05:600c:474a:b0:3b4:cb3f:2f5f with SMTP id
 w10-20020a05600c474a00b003b4cb3f2f5fmr20670167wmo.8.1665421333926; 
 Mon, 10 Oct 2022 10:02:13 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7uoZMFHRFdDBTfXNtCkF5Ow1u9w/7KAhe9C2I3BrwodOqtSA6YYTQBJx7Lw3zEPjHmeE9VwQ==
X-Received: by 2002:a05:600c:474a:b0:3b4:cb3f:2f5f with SMTP id
 w10-20020a05600c474a00b003b4cb3f2f5fmr20670150wmo.8.1665421333696; 
 Mon, 10 Oct 2022 10:02:13 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z5-20020a056000110500b0022b11a27e39sm9160551wrw.1.2022.10.10.10.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:02:13 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] drm/ssd130x: Do not call drm_atomic_add_affected_planes()
Date: Mon, 10 Oct 2022 19:02:02 +0200
Message-Id: <20221010170203.274949-3-javierm@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010170203.274949-1-javierm@redhat.com>
References: <20221010170203.274949-1-javierm@redhat.com>
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
---

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

