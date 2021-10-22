Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEE34377E0
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 15:28:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D5D6ED8F;
	Fri, 22 Oct 2021 13:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 934D66ED8A
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Oct 2021 13:28:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E639B212C2;
 Fri, 22 Oct 2021 13:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634909310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8PF+NmcBhYV+PDWBiDl9gHTMkST01e3jTJPJz8m7QFU=;
 b=OJLC+/bGT5ZFnKA8A4XtcxruHktUxXzm90cdtR1k3LcWI5EG/pLWD/a1zyY9IFkE1PfgCm
 KVdDVamYQEnBv5QvQ6GctbV1zJusw6I6TqxiVZ4qvkyAk8FQCgg+ctvOwSXhGNL9keMzWf
 K3fC686CfXHRWVW+y/SqOnvwWHvy75A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634909310;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=8PF+NmcBhYV+PDWBiDl9gHTMkST01e3jTJPJz8m7QFU=;
 b=md0VLayZrw4DfHfc0aBZk5FdWDVsSFBdmUqihqqM8Ps808umtpsC6UgVHfisqCmJ19szmr
 Xw9bnWZcGxa39DDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 78E4913CDA;
 Fri, 22 Oct 2021 13:28:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id dtKHHH68cmEwXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 22 Oct 2021 13:28:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, noralf@tronnes.org,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com,
 michael+lkml@stapelberg.ch, aros@gmx.com, joshua@stroblindustries.com,
 arnd@arndb.de
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/9] drm/simpledrm: Enable damage clips and virtual screens
Date: Fri, 22 Oct 2021 15:28:20 +0200
Message-Id: <20211022132829.7697-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable FB_DAMAGE_CLIPS with simpledrm for improved performance and/or
less overhead. With this in place, add support for virtual screens
(i.e., framebuffers that are larger than the display resolution). This
also enables fbdev panning and page flipping.

After the discussion and bug fixing wrt to fbdev overallocation, I
decided to add full support for this to simpledrm. Patches #1 to #5
change the format-helper functions accordingly. Destination buffers
are now clipped by the caller and all functions support a similar
feature set. This has some fallout in various drivers.

Patch #6 change fbdev emulation to support overallocation with
shadow buffers, even if the hardware buffer would be too small.

Patch #7 and #8 update simpledrm to enable damage clipping and virtual
screen sizes. Both feature go hand in hand, sort of. For shadow-
buffered planes, the DRM framebuffer lives in system memory. So the
maximum size of the virtual screen is somewhat arbitrary. We add two
constants for resonable maximum width and height of 4096 each.

Patch #9 adds documentation and a TODO item.

Tested with simpledrm. I also ran the recently posted fbdev panning
tests to make sure that the fbdev overallocation works correctly. [1]

[1] https://lists.freedesktop.org/archives/igt-dev/2021-October/036642.html

Thomas Zimmermann (9):
  drm/format-helper: Export drm_fb_clip_offset()
  drm/format-helper: Rework format-helper memcpy functions
  drm/format-helper: Add destination-buffer pitch to drm_fb_swab()
  drm/format-helper: Rework format-helper conversion functions
  drm/format-helper: Streamline blit-helper interface
  drm/fb-helper: Allocate shadow buffer of surface height
  drm/simpledrm: Enable FB_DAMAGE_CLIPS property
  drm/simpledrm: Support virtual screen sizes
  drm: Clarify semantics of struct
    drm_mode_config.{min,max}_{width,height}

 Documentation/gpu/todo.rst                  |  15 ++
 drivers/gpu/drm/drm_fb_helper.c             |   2 +-
 drivers/gpu/drm/drm_format_helper.c         | 236 ++++++++++----------
 drivers/gpu/drm/drm_mipi_dbi.c              |   6 +-
 drivers/gpu/drm/gud/gud_pipe.c              |  14 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c |   5 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c      |   4 +-
 drivers/gpu/drm/tiny/cirrus.c               |  24 +-
 drivers/gpu/drm/tiny/repaper.c              |   2 +-
 drivers/gpu/drm/tiny/simpledrm.c            |  41 +++-
 drivers/gpu/drm/tiny/st7586.c               |   2 +-
 include/drm/drm_format_helper.h             |  58 ++---
 include/drm/drm_gem_atomic_helper.h         |  18 ++
 include/drm/drm_mode_config.h               |  13 ++
 14 files changed, 254 insertions(+), 186 deletions(-)

--
2.33.0

