Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFCE4F0021
	for <lists+dri-devel@lfdr.de>; Sat,  2 Apr 2022 11:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFFB210EE3A;
	Sat,  2 Apr 2022 09:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8EE710F440
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Apr 2022 09:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648891837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z/xkAB2ZptP/5PWNusTuSxkFLE3xLuXkq6zE3coS8hI=;
 b=LMu7nbWiF5pwu4u3tufkzPN5U/zeJGX5uVZcgUQS8tkzqj41sIuhHFM4RtVR4OHTEpRpnM
 Vns1dsQvf16wqz2wzNbIzEBOgKznp2T6h//W5P/R0IsEDoJvv6aulrE6GvjiQ6yS5+zeXC
 BuPpXaRujYt/YFD4+fk4dCCGpa0nx90=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-342-aWlmQEkWOXSB1Gduh_C6DA-1; Sat, 02 Apr 2022 05:30:36 -0400
X-MC-Unique: aWlmQEkWOXSB1Gduh_C6DA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 365AD3804515;
 Sat,  2 Apr 2022 09:30:36 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 963C610EB0;
 Sat,  2 Apr 2022 09:30:31 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/1] drm/simpledrm: Add "panel orientation" property on
 non-upright mounted LCD panels
Date: Sat,  2 Apr 2022 11:30:29 +0200
Message-Id: <20220402093029.5334-2-hdegoede@redhat.com>
In-Reply-To: <20220402093029.5334-1-hdegoede@redhat.com>
References: <20220402093029.5334-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
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
Cc: Hans de Goede <hdegoede@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

commit 94fa115f7b28a3f02611499175e134f0a823b686 upstream.

Some devices use e.g. a portrait panel in a standard laptop casing made
for landscape panels. efifb calls drm_get_panel_orientation_quirk() and
sets fb_info.fbcon_rotate_hint to make fbcon rotate the console so that
it shows up-right instead of on its side.

When switching to simpledrm the fbcon renders on its side. Call the
drm_connector_set_panel_orientation_with_quirk() helper to add
a "panel orientation" property on devices listed in the quirk table,
to make the fbcon (and aware userspace apps) rotate the image to
display properly.

Cc: Javier Martinez Canillas <javierm@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20220221220045.11958-1-hdegoede@redhat.com
---
 drivers/gpu/drm/tiny/simpledrm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index d191e87a37b5..f5b8e864a5cd 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -810,6 +810,9 @@ static int simpledrm_device_init_modeset(struct simpledrm_device *sdev)
 	if (ret)
 		return ret;
 	drm_connector_helper_add(connector, &simpledrm_connector_helper_funcs);
+	drm_connector_set_panel_orientation_with_quirk(connector,
+						       DRM_MODE_PANEL_ORIENTATION_UNKNOWN,
+						       mode->hdisplay, mode->vdisplay);
 
 	formats = simpledrm_device_formats(sdev, &nformats);
 
-- 
2.35.1

