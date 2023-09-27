Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FD27B01D0
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 12:28:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583BE10E4BB;
	Wed, 27 Sep 2023 10:28:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E67810E062;
 Wed, 27 Sep 2023 10:28:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C6A401F8BF;
 Wed, 27 Sep 2023 10:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695810496; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=n3eirD9ncD10hVJJncYvjnIGqyB2POSx64ZMk3/Hgi4=;
 b=kOWaHwnn28saevkG+cZqybbfmdIPd03e7bY1ixrdTCYl/UyDMtz9KvOSyhPTuqnGkbBOD7
 QtBhVXnXRe99briC0JzaxllHF1wZFcqBX/QXAr5Wjbu8k+vNy9updUoiJhv7UNBbvQEAdY
 cIAkofHfFvmAZWwI/8x7mwqus7kzpXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695810496;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=n3eirD9ncD10hVJJncYvjnIGqyB2POSx64ZMk3/Hgi4=;
 b=0ySkuOamEQvSHpkcWqwkEGZUWcm+sl/fhIR9h7thqYVwm7v9UfgK8aVlIliceE/+qpF9Bt
 jAt0WvtsakW6w9CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 813DB13479;
 Wed, 27 Sep 2023 10:28:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0TCPHsADFGXlMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Sep 2023 10:28:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v5 0/7] drm/i915: Convert fbdev to DRM client
Date: Wed, 27 Sep 2023 12:26:45 +0200
Message-ID: <20230927102808.18650-1-tzimmermann@suse.de>
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
ad-hoc integration. The conversion includes a number of cleanups. The
patchset also enables unloading of driver modules with in-kernel DRM
clients; a feature required by i915.

As with the other drivers' fbdev emulation, fbdev in i915 is now
an in-kernel DRM client that runs after the DRM device has been
registered. This allows to remove the asynchronous initialization.

i915 is the last driver with an fbdev emulation that is not build
upon struct drm_client. Once reviewed, the patches would ideally go
into drm-misc-next, so that the old fbdev helper code can be removed.
We can also attempt to add additional in-kernel clients. A DRM-based
dmesg log or a bootsplash are commonly mentioned. DRM can then switch
easily among the existing clients if/when required.

v5:
	* style fixes (checkpatch)
v4:
	<no changes>
v3:
	* support module unloading (Jani, CI bot)
	* as before, silently ignore devices without displays (CI  bot)
v2:
	* fix error handling (Jani)
	* fix non-fbdev builds
	* various minor fixes and cleanups

Thomas Zimmermann (7):
  drm/i915: Unregister in-kernel clients
  drm/client: Do not acquire module reference
  drm/client: Export drm_client_dev_unregister()
  drm/i915: Move fbdev functions
  drm/i915: Initialize fbdev DRM client with callback functions
  drm/i915: Implement fbdev client callbacks
  drm/i915: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/drm_client.c                  |  25 +-
 drivers/gpu/drm/i915/display/intel_display.c  |   1 -
 .../drm/i915/display/intel_display_driver.c   |  19 --
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 250 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_fbdev.h    |  29 +-
 drivers/gpu/drm/i915/i915_driver.c            |  27 +-
 6 files changed, 156 insertions(+), 195 deletions(-)

-- 
2.42.0

