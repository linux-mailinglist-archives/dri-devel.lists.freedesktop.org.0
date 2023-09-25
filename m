Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EEC7AD1B8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 09:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F350A10E1E7;
	Mon, 25 Sep 2023 07:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38FA10E0A0;
 Mon, 25 Sep 2023 07:33:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A77321F45F;
 Mon, 25 Sep 2023 07:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695627198; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+B2r43AsY1MpUlcIkWgDsbKGsgW1AJ3CwORFM/+UW0=;
 b=dte1FiobPAcsq8iY8yqK9R0oPtvc5sYFNOjvO24eyIMK5iAHoxytFLIMuI64J6/QdW2s6O
 UMiItruuB71IzkJfDp9Clt3szPM799h1ApCWa/0bDRCVqRK3Z96YJMSs1PB6K7wkbwfjTg
 k6tzXxWRqlyL1EOnDkAkasUI188rF0Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695627198;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q+B2r43AsY1MpUlcIkWgDsbKGsgW1AJ3CwORFM/+UW0=;
 b=+xnE4QlMt2XV1lYycQ7i5Htex8TTobMozsjQoFrHhl9GG0UdCJfFD1mZHAMd+RQtrOOXzd
 06WTW3IlIFsrz5BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6B6ED13A8D;
 Mon, 25 Sep 2023 07:33:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SMRrGb43EWVyPQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Sep 2023 07:33:18 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 1/7] drm/i915: Unregister in-kernel clients
Date: Mon, 25 Sep 2023 09:26:37 +0200
Message-ID: <20230925073315.11627-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925073315.11627-1-tzimmermann@suse.de>
References: <20230925073315.11627-1-tzimmermann@suse.de>
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Unregister all in-kernel clients before unloading the i915 driver. For
other drivers, drm_dev_unregister() does this automatically. As i915
does not use this helper, it has to perform the call by itself.

Note that there are currently no in-kernel clients in i915. The patch
prepares the driver for a related update of its fbdev support.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/i915/i915_driver.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index d50347e5773a3..de19197d2e052 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -41,6 +41,7 @@
 
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_client.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
@@ -855,6 +856,8 @@ void i915_driver_remove(struct drm_i915_private *i915)
 {
 	intel_wakeref_t wakeref;
 
+	drm_client_dev_unregister(&i915->drm);
+
 	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
 
 	i915_driver_unregister(i915);
-- 
2.42.0

