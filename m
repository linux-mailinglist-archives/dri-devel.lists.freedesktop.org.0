Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D2B4D21F7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 20:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF05B10E31F;
	Tue,  8 Mar 2022 19:52:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C5510E2FF
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 19:52:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4AE9F1F37E;
 Tue,  8 Mar 2022 19:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646769144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ScVahf3C1Yi9XGjTj4mYze5Fervy2DbM9WWIQI7kwDs=;
 b=igEjQp+JQe3ppDmrnHNhFnDnL/IbrY0GFF/ejXUcj3IiSBRWqycN/GAEU7+6ywdgMwOxSg
 efHAq1cBVKvJAzxXcqGh/peLmJPS3sVi1TpX3gHwXQ6bXwa1tb4Nn3SO2/2nBOkkNPRY/C
 CDzqGZba4NLTd2NJjmugysu64YwD1zs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646769144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ScVahf3C1Yi9XGjTj4mYze5Fervy2DbM9WWIQI7kwDs=;
 b=WkncMPON7yOJZcRGTFDX+F9Afcph2cUlVzcE7XBU0JUwnGtjqMkFkQTcAcHlKSkg3ubJfL
 qspssClenq7QuJAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 227EB13CFB;
 Tue,  8 Mar 2022 19:52:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Eh+kBvizJ2KKEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Mar 2022 19:52:24 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH v2 00/12] drm/gma500: Various cleanups to GEM code
Date: Tue,  8 Mar 2022 20:52:10 +0100
Message-Id: <20220308195222.13471-1-tzimmermann@suse.de>
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

v2:
	* put common code in psb_gtt_{init,fini,resume}() into
	  helpers (Sam, Patrik)

Thomas Zimmermann (12):
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
  drm/gma500: Move GTT enable and disable code into helpers
  drm/gma500: Move GTT memory-range setup into helper

 drivers/gpu/drm/gma500/gem.c         | 161 ++++++++++++++-
 drivers/gpu/drm/gma500/gem.h         |  13 +-
 drivers/gpu/drm/gma500/gma_display.c |   8 +-
 drivers/gpu/drm/gma500/gtt.c         | 295 +++++++++++++--------------
 drivers/gpu/drm/gma500/gtt.h         |   8 +-
 drivers/gpu/drm/gma500/power.c       |   5 +-
 drivers/gpu/drm/gma500/psb_drv.c     |  13 +-
 drivers/gpu/drm/gma500/psb_drv.h     |   1 -
 8 files changed, 317 insertions(+), 187 deletions(-)


base-commit: 710a019ad85e96e66f7d75ee7f4733cdd8a2b0d0
prerequisite-patch-id: c2b2f08f0eccc9f5df0c0da49fa1d36267deb11d
prerequisite-patch-id: c67e5d886a47b7d0266d81100837557fda34cb24
prerequisite-patch-id: 6e1032c6302461624f33194c8b8f37103a3fa6ef
-- 
2.35.1

