Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6DF11E92A
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 18:26:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A994F6EB6B;
	Fri, 13 Dec 2019 17:26:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DB206EB6B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 17:26:29 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q6so242318wro.9
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=viKraVC/bKAlbkdKhupkC+IBXqisO/o7XMPk0rhWWxg=;
 b=Tu7zU7lw/Vey0KJWrWKmUAFmKGC6stwk9BGu+WtQpewM0dRJkhbeThnQRNgsiaChkw
 pSvt5frmolgc4ZfquqpOt1MH/KOAXLKzp5TJW8aQzRi95IiCEJT6Q9YTIaDwN8rcwJTv
 NS8ESyNH3YHaShXtVpvH1EeULGrwLzQGGIZds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=viKraVC/bKAlbkdKhupkC+IBXqisO/o7XMPk0rhWWxg=;
 b=G44a+U6YRHQXpeIYrauSeCKuXARmjlqH8tGaI9IK5Ec+2NvRt47fBNN7nEX7mbgX/A
 FeRghgmOmejtIEupmtBQaYVTbIEaDe2y3mKLHIFBQTvqBJ73caAOWByqY8cbZq5nSvrN
 y/iXnpKCFjekVmo8zuKNuaYXw7qrDaC8bTTbz7s/gqu54LueM5d2ZI0pC0pIrx2z6BX6
 nkLCvvnPR+ZhdKAwSVMepENw9/oTtybCJ6Bhy/lrOfPmPdmKk183i/77ttf1Ncuwsl/h
 LGtef800cfdjFYFxmFJ1pNc2G3ych/sjuqzAB3KrvbEbUoOohBEqetYk4oGWdKH8MlSD
 vtXw==
X-Gm-Message-State: APjAAAWP+HLD8/XkHPY31GtTSaUu2VbUk8r090Yf1TAPveSgFZ9YQAPE
 BAopGocSMwzqZv5LiywmNZUZbZ33xGk=
X-Google-Smtp-Source: APXvYqxQ+9PUz1RLVtYW3x8gEY6ZNC8xm3VQgmhZhPklJpiTVmquy0AuRMifB3HU1bSstQNujn0OsA==
X-Received: by 2002:adf:f8c4:: with SMTP id f4mr13713640wrq.243.1576257987713; 
 Fri, 13 Dec 2019 09:26:27 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id q15sm10689669wrr.11.2019.12.13.09.26.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 09:26:26 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 09/10] drm/vkms: plane_state->fb iff plane_state->crtc
Date: Fri, 13 Dec 2019 18:26:11 +0100
Message-Id: <20191213172612.1514842-9-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Checking both is one too much, so wrap a WARN_ON around it to stope
the copypasta.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 5fc8f85aaf3d..6d31265a2ab7 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -117,7 +117,7 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
 	bool can_position = false;
 	int ret;
 
-	if (!state->fb | !state->crtc)
+	if (!state->fb || WARN_ON(!state->crtc))
 		return 0;
 
 	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
