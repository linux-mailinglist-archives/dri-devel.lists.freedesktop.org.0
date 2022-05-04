Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F6C51A122
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 15:40:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63E9010F07A;
	Wed,  4 May 2022 13:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A42810ECF4
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 13:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651671652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=047UOCkrYFZCSjX4CpFAuwPal31R26+i0OJZNjPXjXg=;
 b=ZjQDVo2Lsa0i44V9L0RKIM7T99ns26Nl5NfWgLmzyHZfliZ6+4DBMV0NaNRwLOmFPYf1xi
 Myc3H19htaMEnsXb1iGpoaETV7HunTU7cQh3PaIxTHsS8NDbjLYX9OWXDv8H0vUiN3N1HR
 LVna37Jj3kKPc+HIcOsRiPqnk1hYptA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-331-fyBGEmiqOTOq5oBWH3vhug-1; Wed, 04 May 2022 09:40:49 -0400
X-MC-Unique: fyBGEmiqOTOq5oBWH3vhug-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3921229AB40C;
 Wed,  4 May 2022 13:40:49 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.180])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2ED6EC28111;
 Wed,  4 May 2022 13:40:48 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
	lyude@redhat.com,
	tzimmermann@suse.de
Subject: [PATCH v2 1/3] mgag200: Add FB_DAMAGE_CLIPS support
Date: Wed,  4 May 2022 15:40:24 +0200
Message-Id: <20220504134026.283417-2-jfalempe@redhat.com>
In-Reply-To: <20220504134026.283417-1-jfalempe@redhat.com>
References: <20220504134026.283417-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver does support damage clips, but doesn't advertise it.
So when running gnome/wayland on Matrox hardware, the full frame is
copied to the slow Matrox memory, which leads to very poor performances.

Add drm_plane_enable_fb_damage_clips() to advertise this capability to
userspace.

With this patch, gnome/wayland becomes usable on Matrox GPU.

Suggested-by: Jonas Ådahl <jadahl@gmail.com>
Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 6e18d3bbd720..cff2e76f3fa0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1107,6 +1107,8 @@ int mgag200_modeset_init(struct mga_device *mdev)
 		return ret;
 	}
 
+	drm_plane_enable_fb_damage_clips(&pipe->plane);
+
 	/* FIXME: legacy gamma tables; convert to CRTC state */
 	drm_mode_crtc_set_gamma_size(&pipe->crtc, MGAG200_LUT_SIZE);
 
-- 
2.35.1

