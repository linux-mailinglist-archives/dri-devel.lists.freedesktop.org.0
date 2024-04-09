Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B33CD89D3CA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 10:10:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5901112B6E;
	Tue,  9 Apr 2024 08:10:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.b="d6VHIrI5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tvJlpUqX";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="d6VHIrI5";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tvJlpUqX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E32112B67;
 Tue,  9 Apr 2024 08:10:33 +0000 (UTC)
Received: from imap2.dmz-prg2.suse.org (imap2.dmz-prg2.suse.org [10.150.64.98])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 17F442087F;
 Tue,  9 Apr 2024 08:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712650232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NSQZ6fWBKatUDWf7NqolXGcHzoq0ZQuzggLmEGpex14=;
 b=d6VHIrI5uLZHSiq141CdJ6SuokKwlW0BJKxoWaS0KLxdDUgy6wHfG6mAKAnp4J6bj/7+Cy
 QbRlYHWXWShFauxol5u2p787jIa4nIVFyAwYKNIpnxQ66l4aWMjsoDemd55/p7bE7Y6eHN
 p50mxTwpQqx7LeFCQbAdkpJOJIq4E74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712650232;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NSQZ6fWBKatUDWf7NqolXGcHzoq0ZQuzggLmEGpex14=;
 b=tvJlpUqXXZtTJwtwYjY+M7HONOxr0Z12DXCHOdKoYAmTBnsNXLM82QhWu3HRfnw9pZI5ot
 /PmvGKXr3cKSOvDQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1712650232; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NSQZ6fWBKatUDWf7NqolXGcHzoq0ZQuzggLmEGpex14=;
 b=d6VHIrI5uLZHSiq141CdJ6SuokKwlW0BJKxoWaS0KLxdDUgy6wHfG6mAKAnp4J6bj/7+Cy
 QbRlYHWXWShFauxol5u2p787jIa4nIVFyAwYKNIpnxQ66l4aWMjsoDemd55/p7bE7Y6eHN
 p50mxTwpQqx7LeFCQbAdkpJOJIq4E74=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1712650232;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NSQZ6fWBKatUDWf7NqolXGcHzoq0ZQuzggLmEGpex14=;
 b=tvJlpUqXXZtTJwtwYjY+M7HONOxr0Z12DXCHOdKoYAmTBnsNXLM82QhWu3HRfnw9pZI5ot
 /PmvGKXr3cKSOvDQ==
Received: from imap2.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap2.dmz-prg2.suse.org (Postfix) with ESMTPS id 9B9E113253;
 Tue,  9 Apr 2024 08:10:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([10.150.64.162])
 by imap2.dmz-prg2.suse.org with ESMTPSA id INMrJPf3FGbWNAAAn2gu4w
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Apr 2024 08:10:31 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, jouni.hogander@intel.com, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, lucas.demarchi@intel.com,
 ogabbay@kernel.org, thomas.hellstrom@linux.intel.com
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v8 0/6] drm/{i915,xe}: Convert fbdev to DRM client
Date: Tue,  9 Apr 2024 10:04:22 +0200
Message-ID: <20240409081029.17843-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00]; BAYES_HAM(-3.00)[100.00%];
 NEURAL_HAM_LONG(-1.00)[-1.000]; MID_CONTAINS_FROM(1.00)[];
 NEURAL_HAM_SHORT(-0.20)[-1.000]; MIME_GOOD(-0.10)[text/plain];
 MIME_TRACE(0.00)[0:+];
 FREEMAIL_TO(0.00)[linux.intel.com,intel.com,redhat.com,gmail.com,ffwll.ch,kernel.org];
 ARC_NA(0.00)[]; RCPT_COUNT_TWELVE(0.00)[17];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FUZZY_BLOCKED(0.00)[rspamd.com]; FROM_EQ_ENVFROM(0.00)[];
 FROM_HAS_DN(0.00)[]; TO_DN_SOME(0.00)[]; RCVD_TLS_ALL(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; RCVD_COUNT_TWO(0.00)[2];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap2.dmz-prg2.suse.org:helo,
 imap2.dmz-prg2.suse.org:rdns]
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(was: drm/i915: Convert fbdev to DRM client)

Convert i915's fbdev code to struct drm_client. Replaces the current
ad-hoc integration. The conversion includes a number of cleanups. Also
update the xe driver accordingly.

As with the other drivers' fbdev emulation, fbdev in i915 is now
an in-kernel DRM client that runs after the DRM device has been
registered. This allows to remove the asynchronous initialization.

i915 and xe are the final drivers with an fbdev emulation that is not
build upon struct drm_client. Once reviewed, the patches would ideally go
into drm-misc-next, so that the old fbdev helper code can be removed.

We can also attempt to add additional in-kernel clients. A DRM-based
dmesg log or a bootsplash are commonly mentioned. DRM can then switch
easily among the existing clients if/when required.

v8:
- do setup and cleanup in intel_display_driver_{register,unregister}()
  (Jani, Jouni)
- mention xe in several commit messages (Rodrigo, Jani)
- resort patches to put driver-independent changes first
- slightly reword cover letter

v7:
- update xe driver

v6:
- reorder patches to fix build (Jouni)
- remove unnecessary handling of non-atomic commits (Jouni, Ville)
- return errors from callbacks (Jouni)
- various minor fixes

v5:
- style fixes (checkpatch)
	
v4:
<no changes>
		
v3:
- support module unloading (Jani, CI bot)
- as before, silently ignore devices without displays (CI  bot)

v2:		
- fix error handling (Jani)
- fix non-fbdev builds
- various minor fixes and cleanups

Thomas Zimmermann (6):
  drm/client: Export drm_client_dev_unregister()
  drm/i915: Move fbdev functions
  drm/i915: Initialize fbdev DRM client with callback functions
  drm/{i915,xe}: Unregister in-kernel clients
  drm/{i915,xe}: Implement fbdev client callbacks
  drm/{i915,xe}: Implement fbdev emulation as in-kernel client

 drivers/gpu/drm/drm_client.c                  |  13 +
 drivers/gpu/drm/i915/display/intel_display.c  |   1 -
 .../drm/i915/display/intel_display_driver.c   |  24 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    | 265 ++++++++++--------
 drivers/gpu/drm/i915/display/intel_fbdev.h    |  29 +-
 drivers/gpu/drm/i915/i915_driver.c            |  22 --
 drivers/gpu/drm/xe/display/xe_display.c       |  11 -
 drivers/gpu/drm/xe/xe_device.c                |   1 +
 8 files changed, 167 insertions(+), 199 deletions(-)

-- 
2.44.0

