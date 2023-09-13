Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E30DC79EC03
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 17:04:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D70A10E0D9;
	Wed, 13 Sep 2023 15:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E632910E0D9;
 Wed, 13 Sep 2023 15:04:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A5B9F1F385;
 Wed, 13 Sep 2023 15:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694617468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aL/bukbP7Bk+ZmHI+B1BUbs0vTjSv75KRRo6YUZVjqQ=;
 b=gSfJT6InQwjudzY/SdfMkLYztfiZHw3TtQTi6FsjjVzw2KtfisKQihV3hgvND/qQ1LRfw8
 cPdpnUa/jRqimsKAVDtj5IR422pw0KUT/WRJv9pvUXLz2V3xGmS6LWgTdZFM3zX4oP3HZH
 JjFWEsdmbKh5h2yFfqPxpvzh7QVjTUQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694617468;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aL/bukbP7Bk+ZmHI+B1BUbs0vTjSv75KRRo6YUZVjqQ=;
 b=GgSKonoB/J8lKXTa/X7eiGyROviXI7X12+iH9q+Mle6Infmw2GELBBaNbO6OZ0Lz5J0PrJ
 uvTSXJckBy7vQzCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5893513440;
 Wed, 13 Sep 2023 15:04:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3iB9FHzPAWXEdAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 13 Sep 2023 15:04:28 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v2 0/4] drm/i915: Convert fbdev to DRM client
Date: Wed, 13 Sep 2023 16:58:40 +0200
Message-ID: <20230913150425.5742-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
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

Convert i915's fbdev code to struct drm_client. Replaces the current
ad-hoc integration. The conversion includes a number of cleanups.

As with most other driver's fbdev emulation, fbdev in i915 is now
just another DRM client that runs after the DRM device has been
registered. This allows to remove the asynchronous initialization.

I've long wanted to send out an update for this patchset. i915
is the last driver with an fbdev emulation that is not build upon
struct drm_client. Once reviewed, the patches would ideally go
into drm-misc-next, so that the old fbdev helper code can be removed.
We can also attempt to add additional in-kernel clients. A DRM-based
dmesg log or a bootsplash are commonly mentioned. DRM can then switch
easily among the existing clients if/when required.

v2:
	* fix error handling (Jani)
	* fix non-fbdev builds
	* various minor fixes and cleanups

Thomas Zimmermann (4):
  drm/i915: Move fbdev functions
  drm/i915: Initialize fbdev DRM client with callback functions
  drm/i915: Implement fbdev client callbacks
  drm/i915: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/i915/display/intel_display.c  |   1 -
 .../drm/i915/display/intel_display_driver.c   |  19 --
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 250 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_fbdev.h    |  29 +-
 drivers/gpu/drm/i915/i915_driver.c            |  24 +-
 5 files changed, 139 insertions(+), 184 deletions(-)


base-commit: f8d21cb17a99b75862196036bb4bb93ee9637b74
-- 
2.42.0

