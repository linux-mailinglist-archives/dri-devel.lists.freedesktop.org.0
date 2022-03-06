Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F074CEDBF
	for <lists+dri-devel@lfdr.de>; Sun,  6 Mar 2022 21:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD24510E655;
	Sun,  6 Mar 2022 20:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8247C10E651
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Mar 2022 20:36:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC8091F38F;
 Sun,  6 Mar 2022 20:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646598980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4QqXTDO1dt286Q8SKcRrG/QfrEqUe9zwpj1OQR8lY2I=;
 b=fEpEtRDoitD+qCyITrQmbMiBO7kxBzcjWm2FRHUuIeXson17fXe/04WNXVN4b5x6D6URnm
 QDMWS/ERS18EWZ/ix68qSvzbeSF4reOUrHsXDCK0Xm/GET2jGWrVdVMIrDfkz2tQvvnjqg
 GM+53AsomtVGUvZHhT7fcrvk5/TBZd4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646598980;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4QqXTDO1dt286Q8SKcRrG/QfrEqUe9zwpj1OQR8lY2I=;
 b=d54PQwTmNJ8AAd0fgNQjnXvQzhaoPgwM+v5Z6U1VHS3XtmNzL9mGQ15pvwABxrWDbrs1+z
 WPMZc6oa80+rD6DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A3F28134CD;
 Sun,  6 Mar 2022 20:36:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id V8mXJkQbJWJ3KAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Mar 2022 20:36:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 00/10] drm/gma500: Various cleanups to GEM code
Date: Sun,  6 Mar 2022 21:36:09 +0100
Message-Id: <20220306203619.22624-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Refactor and simplify various parts of the memory management. This
includes locking, initialization and finalizer functions, and code
organization.

Tested on Atom N2800 hardware.

Thomas Zimmermann (10):
  drm/gma500: Remove struct psb_gem_object.npage
  drm/gma500: Acquire reservation lock for GEM objects
  drm/gma500: Move GTT locking into GTT helpers
  drm/gma500: Remove struct psb_gtt.sem sempahore
  drm/gma500: Move GTT setup and restoration into helper funtions
  drm/gma500: Move GTT resume logic out of psb_gtt_init()
  drm/gma500: Cleanup GTT uninit and error handling
  drm/gma500: Split GTT init/resume/fini into GTT and GEM functions
  drm/gma500: Inline psb_gtt_restore()
  drm/gma500: Move GEM memory management functions to gem.c

 drivers/gpu/drm/gma500/gem.c         | 161 ++++++++++++++++--
 drivers/gpu/drm/gma500/gem.h         |  13 +-
 drivers/gpu/drm/gma500/gma_display.c |   8 +-
 drivers/gpu/drm/gma500/gtt.c         | 239 +++++++++++++--------------
 drivers/gpu/drm/gma500/gtt.h         |   8 +-
 drivers/gpu/drm/gma500/power.c       |   5 +-
 drivers/gpu/drm/gma500/psb_drv.c     |  13 +-
 drivers/gpu/drm/gma500/psb_drv.h     |   1 -
 8 files changed, 296 insertions(+), 152 deletions(-)


base-commit: 710a019ad85e96e66f7d75ee7f4733cdd8a2b0d0
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 6e1032c6302461624f33194c8b8f37103a3fa6ef
-- 
2.35.1

