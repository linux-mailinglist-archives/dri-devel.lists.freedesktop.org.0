Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F3716850B
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 18:33:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E3A6F4E8;
	Fri, 21 Feb 2020 17:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAEF86F4EB
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 17:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582306404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ab9bcmse2JqLimkMfEvJYChivOMxMBsAXUmydjuif9k=;
 b=dLDPP8GkQcA3vzbBTdRnBvIuGKOwjrjLfT9WGP4BpfQjm28iRYaNVaqkbvuUmvOfJr+awm
 C6hMH3Cnjdf4tPTYb2cTingKXxuTEtF1c3E+iiIPdu4R5l7cbpZitKNfuJwVZJAbIMtirg
 sDCEaghlVTqstk3WMCu1FQYD2O254/M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-166-y4q0QgDzPqGVzDSgPhzGSQ-1; Fri, 21 Feb 2020 12:33:19 -0500
X-MC-Unique: y4q0QgDzPqGVzDSgPhzGSQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 353EFDBE5;
 Fri, 21 Feb 2020 17:33:18 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-116-191.ams2.redhat.com
 [10.36.116.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB35087B08;
 Fri, 21 Feb 2020 17:33:16 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <seanpaul@chromium.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Subject: [PATCH resend] drm: Add DRM_MODE_TYPE_USERDEF flag to probed modes
 matching a video= argument
Date: Fri, 21 Feb 2020 18:33:13 +0100
Message-Id: <20200221173313.510235-2-hdegoede@redhat.com>
In-Reply-To: <20200221173313.510235-1-hdegoede@redhat.com>
References: <20200221173313.510235-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_helper_probe_add_cmdline_mode() prefers using a probed mode matching
a video= argument over calculating our own timings for the user specified
mode using CVT or GTF.

But userspace code which is auto-configuring the mode may want to know that
the user has specified that mode on the kernel commandline so that it can
pick that mode over the mode which is marked as DRM_MODE_TYPE_PREFERRED.

This commit sets the DRM_MODE_TYPE_USERDEF flag on the matching mode, just
as we would do on the user-specified mode when no matching probed mode is
found.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_probe_helper.c | 2 ++
 include/drm/drm_modes.h            | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 576b4b7dcd89..466dfbba8256 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -159,6 +159,8 @@ static int drm_helper_probe_add_cmdline_mode(struct drm_connector *connector)
 				continue;
 		}
 
+		/* Mark the matching mode as being preferred by the user */
+		mode->type |= DRM_MODE_TYPE_USERDEF;
 		return 0;
 	}
 
diff --git a/include/drm/drm_modes.h b/include/drm/drm_modes.h
index e946e20c61d8..c7efb7487e9b 100644
--- a/include/drm/drm_modes.h
+++ b/include/drm/drm_modes.h
@@ -256,7 +256,8 @@ struct drm_display_mode {
 	 *  - DRM_MODE_TYPE_DRIVER: Mode created by the driver, which is all of
 	 *    them really. Drivers must set this bit for all modes they create
 	 *    and expose to userspace.
-	 *  - DRM_MODE_TYPE_USERDEF: Mode defined via kernel command line
+	 *  - DRM_MODE_TYPE_USERDEF: Mode defined or selected via the kernel
+	 *    command line.
 	 *
 	 * Plus a big list of flags which shouldn't be used at all, but are
 	 * still around since these flags are also used in the userspace ABI.
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
