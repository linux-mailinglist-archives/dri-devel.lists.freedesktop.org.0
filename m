Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C68A24AB1AB
	for <lists+dri-devel@lfdr.de>; Sun,  6 Feb 2022 20:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2461010F2E6;
	Sun,  6 Feb 2022 19:29:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DD510E203
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Feb 2022 19:29:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 20671210EC;
 Sun,  6 Feb 2022 19:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644175779; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EE0dsbqXYhjzztfikcUp1KSQyxSJq7ecm+aajQB84oc=;
 b=B7710XX67t6TziSAX5A7s206Q7+u0n3e2yk6MlfnUfDzGrTeEmxRYYM6YDeANCeuTpEEia
 GAstHcK4IUFxPqCmUrm0vcWlr4KvEVevSqwDYy/ZtTC7DZj7gJwpJSdarRWlbeMMF7OnTE
 KlBqoAwH9/W1qfQeGSDdWYkcY3q+3IE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644175779;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=EE0dsbqXYhjzztfikcUp1KSQyxSJq7ecm+aajQB84oc=;
 b=cKSy3bPDBe9QTwHy02HEBomRMMIyGt21UqhLctL5DArnTnDaHCFt0XCWtnxScGqNh4wTol
 yOhWd0wnkpgUjqAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D5885139EF;
 Sun,  6 Feb 2022 19:29:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UCtcMqIhAGLlJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 06 Feb 2022 19:29:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, javierm@redhat.com, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH 0/5] drm/fb-helper: Fix and improve fbdevio clipping
Date: Sun,  6 Feb 2022 20:29:30 +0100
Message-Id: <20220206192935.24645-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
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

This is one of several patchset s to improve fb deferred I/O and
DRM's use of it. THe patches fix several problems with the current
helpers and add some easy improvements.

Deferred I/O tracks dirty pages of the screen buffer, from which
DRM calculates a bounding box of the damaged area. Patches 1 and 2
resolve bugs in the computation. Speifically, it makes the damage
handling work with overallocation and panning enabled.

Patches 3 to 5 add an easy performance improvement. Instead of
damaging the whole viewport after a write operation, only damage
the written area. For large writes the area consists of multiple
scanlines, for small writes the area might consist of only a few
pixels on a single scanline. Write operations now also work correctly
with overallocation and panning enabled.

Thomas Zimmermann (5):
  drm/fb-helper: Fix clip rectangle height
  drm/fb-helper: Fix vertical damage clipping
  drm/fb-helper: Calculate damaged area in separate helper
  drm/fb-helper: Clip damage area to written memory range
  drm/fb-helper: Clip damage area horizontally

 drivers/gpu/drm/drm_fb_helper.c | 69 ++++++++++++++++++++++++++-------
 1 file changed, 54 insertions(+), 15 deletions(-)


base-commit: 0bb81b5d6db5f689b67f9d8b35323235c45e890f
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 8e52143a6cd7b8fb789e656208f6edde71d0f499
prerequisite-patch-id: 4b0e798cb2990b553d44e1bc39634d72d172ea7b
-- 
2.34.1

