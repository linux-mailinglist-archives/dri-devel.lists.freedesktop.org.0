Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ABDF5AE150
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 09:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4DD10E5A2;
	Tue,  6 Sep 2022 07:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A459210E59A
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 07:39:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 5F7EA336E4;
 Tue,  6 Sep 2022 07:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662449994; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4hFdCuz1aZgzmgtnY0njr/afmoWuavqMx5WcOQEpdOI=;
 b=COpvJ5d7tbAStYGhO7bc1zFXuUGKOb84iPIzkhLGUPAMkEwYhh68Dpc+0B1hFi1uhGTE+W
 KE5n1VS8NfhAYQubOl8V/ROcV/kQwTRjF4bHyI0+98T6CPE0pMXOG/Fjxnfg39LSzBdiqf
 EAw6mGGSK0oG4NLM76ZPHA7JOJ8ipKM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662449994;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=4hFdCuz1aZgzmgtnY0njr/afmoWuavqMx5WcOQEpdOI=;
 b=SsK9gb+qMRiNOhlwAW0W6mmxii6Nh0CKLY+0XskfgUak3e1lEIjAirAscWAacj/KOeCKp6
 0iZJDHBDSbYghEBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3ED2D13A7A;
 Tue,  6 Sep 2022 07:39:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id O7OFDkr5FmPeOgAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 06 Sep 2022 07:39:54 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/11] drm/udl: More fixes
Date: Tue,  6 Sep 2022 09:39:40 +0200
Message-Id: <20220906073951.2085-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

this is a revised patch set for cleaning up and fixes for UDL driver.
It covers the PM problems, regressions in the previous patch set,
fixes for the stalls on some systems, as well as more hardening.


Takashi

===

v1->v2: cleanups as suggested by Thomas
- Drop numurbs parameter patch
- Clean up / simplify clipping patch
- Code cleanup and changes for urb management patch
- Put Acks on some given patches

===

Takashi Iwai (8):
  Revert "drm/udl: Kill pending URBs at suspend and disconnect"
  drm/udl: Suppress error print for -EPROTO at URB completion
  drm/udl: Increase the default URB list size to 20
  drm/udl: Drop unneeded alignment
  drm/udl: Fix potential URB leaks
  drm/udl: Fix inconsistent urbs.count value during udl_free_urb_list()
  drm/udl: Don't re-initialize stuff at retrying the URB list allocation
  drm/udl: Sync pending URBs at the end of suspend

Thomas Zimmermann (3):
  drm/udl: Restore display mode on resume
  drm/udl: Add reset_resume
  drm/udl: Enable damage clipping

 drivers/gpu/drm/udl/udl_drv.c      | 19 +++++-
 drivers/gpu/drm/udl/udl_drv.h      | 13 +---
 drivers/gpu/drm/udl/udl_main.c     | 95 +++++++++++++++---------------
 drivers/gpu/drm/udl/udl_modeset.c  | 36 ++---------
 drivers/gpu/drm/udl/udl_transfer.c | 45 ++------------
 5 files changed, 75 insertions(+), 133 deletions(-)

-- 
2.35.3

