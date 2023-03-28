Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AADA26CBD35
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 13:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7738810E86A;
	Tue, 28 Mar 2023 11:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE22810E86A;
 Tue, 28 Mar 2023 11:14:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 854F01F8BA;
 Tue, 28 Mar 2023 11:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680002064; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+mdF0lyo3FnVJfYw4AygIT2zNfJJ8uGw2GZqFTHRsCI=;
 b=oXn7BiWSAKIbR7h5YZ8KmIjh7lYha8QQPkKtiFMU/5SsxZ+bzG0YHIluhP8cvBp4zoLDmX
 1d8/rozJYbobyLVuR6clRboIQNLWMhyr9j12JPZOmWF4PoN/fPD7waPV19P6dtmHxK17lt
 1EBdOa1UsXf7VvMowKmYNw8eeSsjsTM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680002064;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+mdF0lyo3FnVJfYw4AygIT2zNfJJ8uGw2GZqFTHRsCI=;
 b=FGVrsjlHmQCsX0TxETJnIYoxkUfmu4ri2W0Wt23BtEdVbXCO1vREtxzsn9O4BVJcMjt4wS
 gtLwnuU9y4uiWaCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 40EF81390B;
 Tue, 28 Mar 2023 11:14:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id m9nTDhDMImThCAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Mar 2023 11:14:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com
Subject: [PATCH 0/4] drm/i915: Convert fbdev to DRM client
Date: Tue, 28 Mar 2023 13:14:18 +0200
Message-Id: <20230328111422.23986-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
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
registered. This allows to remove the asynchronous initialization,
hopefully.

Once all drivers' fbdev emulation has been converted to struct drm_client,
we can attempt to add additional in-kernel clients. A DRM-based dmesg
log or a bootsplash are commonly mentioned. DRM can then switch easily
among the existing clients if/when required.

Tested on Intel HD 530 hardware.

Thomas Zimmermann (4):
  drm/i915: Move fbdev functions
  drm/i915: Initialize fbdev DRM client with callback functions
  drm/i915: Implement fbdev client callbacks
  drm/i915: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/i915/display/intel_display.c |  31 ---
 drivers/gpu/drm/i915/display/intel_fbdev.c   | 254 ++++++++++---------
 drivers/gpu/drm/i915/display/intel_fbdev.h   |  29 +--
 drivers/gpu/drm/i915/i915_driver.c           |  24 +-
 4 files changed, 143 insertions(+), 195 deletions(-)


base-commit: 6e5f96153989e454041848f66a5227be9bd0bbc3
-- 
2.40.0

