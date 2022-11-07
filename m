Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E54E261F3C4
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 13:53:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CD810E307;
	Mon,  7 Nov 2022 12:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B8710E305
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 12:53:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id BC1B9223CC;
 Mon,  7 Nov 2022 12:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667825614; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06+zVmavQJnMUZA7QqsHPE4JMAuHnxhzTintlwlRnUM=;
 b=zud4uxu7gk8PO0C/+jsCquFLZcpC+dXBzpOAC2O5rtZ6Kza3T1MXnNViIdZMHRTPeJbLLD
 lAaqqcA4V58W+FSsLXcbQ1NNpgsLMrP+TjZesQJmEsuIYOzA3+xZj8FbaeajgL/vZUK12W
 QtxzXVSSon7DULQ+MqIMa0NCpjTAowI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667825614;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06+zVmavQJnMUZA7QqsHPE4JMAuHnxhzTintlwlRnUM=;
 b=URs5fYUndMm3PNv0ocQ06zv97EmxU+OM41l5ScarRI/hy4Mlu9WJH+oXEcUeG9XiFzr+E2
 yR8kMLm/+/n4inBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7A4C213ADB;
 Mon,  7 Nov 2022 12:53:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id wM3mHM7/aGMDRwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Nov 2022 12:53:34 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, jstultz@google.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com
Subject: [PATCH 3/3] drm/fb-helper: Document struct
 drm_fb_helper.hint_leak_smem_start
Date: Mon,  7 Nov 2022 13:53:29 +0100
Message-Id: <20221107125329.12842-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221107125329.12842-1-tzimmermann@suse.de>
References: <20221107125329.12842-1-tzimmermann@suse.de>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document the new field smem_start in struct drm_fb_helper and avoid
a compile-time warning. An error message is shown below and the bug
report is at [1].

  include/drm/drm_fb_helper.h:204: warning: Function parameter or member 'hint_leak_smem_start' not described in 'drm_fb_helper'

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: e7c5c29a9eb1 ("drm/fb-helper: Set flag in struct drm_fb_helper for leaking physical addresses")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Link: https://lore.kernel.org/dri-devel/20221107143858.0253a8ff@canb.auug.org.au/T/#u # [1]
---
 include/drm/drm_fb_helper.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index ecfcd2c56d95a..b111dc7ada78d 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -200,6 +200,13 @@ struct drm_fb_helper {
 	 */
 	int preferred_bpp;
 
+	/**
+	 * @hint_leak_smem_start:
+	 *
+	 * Hint to the fbdev emulation to store the framebuffer's physical
+	 * address in struct &fb_info.fix.smem_start. If the hint is unset,
+	 * the smem_start field should always be cleared to zero.
+	 */
 	bool hint_leak_smem_start;
 };
 
-- 
2.38.0

