Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88E83BBCFE
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 14:45:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D61289862;
	Mon,  5 Jul 2021 12:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B02D897EE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 12:45:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 063431FE6D;
 Mon,  5 Jul 2021 12:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625489117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DrjLbgR68JkIiWllke+ZVdy/oK2BKZmLmBWdUHlDpPc=;
 b=Quy1yCvSVfTFxX++D2CJ1/wk9t/4P2ZpmbegStFvsAb+Kvl3EQPaUzasAZaxMK+GYy+CKX
 oqka7QTJaqMWtokGQ5xKkY6u1A4O9CVJJCDk0q6j84gDggC5Zd11NPlfQ/z1Rnsn1HRSGU
 8GojDhUclShgP/g3T0DgQ0B2H9T1a6A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625489117;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=DrjLbgR68JkIiWllke+ZVdy/oK2BKZmLmBWdUHlDpPc=;
 b=lC2iHVYTcrWDm0nXzP0JhixOtrAm4w/rw17Dz3kwRs1zMs1HXH3hFWMnEmABVaTyXQs4sr
 xfbC3Y0ZE37T6cDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C4F3D139F6;
 Mon,  5 Jul 2021 12:45:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ehl0Ltz+4mDkcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Jul 2021 12:45:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@redhat.com, sam@ravnborg.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 emil.velikov@collabora.com, John.p.donnelly@oracle.com
Subject: [PATCH 00/12] mgag200: Refactor PLL setup
Date: Mon,  5 Jul 2021 14:45:03 +0200
Message-Id: <20210705124515.27253-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.32.0
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

Split the PLL setup code into computation and update functions; compute
the PLL values during atomic checks, update the PLL during atomic commits;
cleanup the whole thing.

The current PLL setup code for mgag200 mixes up computation if the PLL
values and programming the HW. Both is done during atomic commits. As the
computation phase can fail, the patch splits the functions and moves
the computation to atomic-check phase. The PLL values are stores as part
of the CRTC's atomic state.

As the PLL code is currently unmaintainable, apply various cleanups. For
example, split functions that handle multiple HW revisions, constify values,
move compute and update code to distict locations, and unify the
representation of the PLL's values.

Tested on G200EH by setting modes in Weston, fbdev, and Xorg. Further
testing is welcome.

Thomas Zimmermann (12):
  drm/mgag200: Select clock in PLL update functions
  drm/mgag200: Return errno codes from PLL compute functions
  drm/mgag200: Remove P_ARRAY_SIZE
  drm/mgag200: Split PLL setup into compute and update functions
  drm/mgag200: Introduce separate variable for PLL S parameter
  drm/mgag200: Store values (not bits) in struct mgag200_pll_values
  drm/mgag200: Split several PLL functions by device type
  drm/mgag200: Separate PLL compute and update functions from each other
  drm/mgag200: Split PLL computation for G200SE
  drm/mgag200: Declare PLL clock constants static const
  drm/mgag200: Introduce custom CRTC state
  drm/mgag200: Compute PLL values during atomic check

 drivers/gpu/drm/drm_simple_kms_helper.c |  39 +-
 drivers/gpu/drm/mgag200/mgag200_drv.h   |  28 +
 drivers/gpu/drm/mgag200/mgag200_mode.c  | 965 +++++++++++++++---------
 include/drm/drm_simple_kms_helper.h     |  27 +
 4 files changed, 720 insertions(+), 339 deletions(-)

--
2.32.0

