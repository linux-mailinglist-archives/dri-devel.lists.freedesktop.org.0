Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FA3422047
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 10:12:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A266F5B2;
	Tue,  5 Oct 2021 08:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253DF6EB3A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 08:11:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 967FC223E6;
 Tue,  5 Oct 2021 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633421513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=BwCjpUS+tEBK1M9c5K/31GnnVCh88FJbudr3lOJt8IM=;
 b=cvXKHeAH9wcTa7i7whE9QA6+vuEaauvbFQIomFzaxWauDcmDNCMsYfF/XNqKH/n1IEaiU/
 qbyJVb52WuR5KodIVexQgiboiTRMHmpmdnmIOs5nMb9zGHD1VzGfGwdHGUvnRC9PLPLa9M
 NuZBiSem35yR5ndSFkqJnZEOtefKzqI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633421513;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=BwCjpUS+tEBK1M9c5K/31GnnVCh88FJbudr3lOJt8IM=;
 b=JEy2ZDWsFfTSF1m2ihwY3mdAkKlf4V/DmvNTFkDlMta1+rcLCWKIdEgIPRxhCFOJAe6ldW
 tHgmWk+g6/0Yz6Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 753EA13A78;
 Tue,  5 Oct 2021 08:11:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id L0q3G8kIXGEgXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 05 Oct 2021 08:11:53 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 00/10] drm/gma500: Refactor GEM code
Date: Tue,  5 Oct 2021 10:11:41 +0200
Message-Id: <20211005081151.23612-1-tzimmermann@suse.de>
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

Bring GEM code up to current standards and untangle the connection to
GTT helpers.

The allocation and pinning helpers for struct gtt_range are located in
the GTT code, but actually part of the GEM implementation. The patchset
moves them to GEM code and refactors much of the implementation. Most
of the GTT code is then independend from the struct gtt_range, while
the GEM code does not contain GTT management.

In addition to internal refiactoring, patches 2 to 4 update the rest of
the driver to use the GEM interfaces for object allocation and release.

Finally, rename struct gtt_range to struct psb_gem_object to designate
it as a 'real' GEM object.

Future work: with the GEM and GTT code separated, future patchsets can
implement on-demand release of GTT entries, or remove the perma-mapping
of stolen memory. Dma-buf support might also be added.

Tested on Atom N2800 hardware.

v2:
	* keep docs about GTT locking
	* release mutex in pin error path

Thomas Zimmermann (10):
  drm/gma500: Move helpers for struct gtt_range from gtt.c to gem.c
  drm/gma500: Use to_gtt_range() everywhere
  drm/gma500: Reimplement psb_gem_create()
  drm/gma500: Allocate GTT ranges in stolen memory with psb_gem_create()
  drm/gma500: Rename psb_gtt_{pin,unpin}() to psb_gem_{pin,unpin}()
  drm/gma500: Inline psb_gtt_attach_pages() and psb_gtt_detach_pages()
  drm/gma500: Inline psb_gtt_{alloc,free}_range() into rsp callers
  drm/gma500: Set page-caching flags in GEM pin/unpin
  drm/gma500: Rewrite GTT page insert/remove without struct gtt_range
  drm/gma500: Rename struct gtt_range to struct psb_gem_object

 drivers/gpu/drm/gma500/framebuffer.c       |  52 +---
 drivers/gpu/drm/gma500/gem.c               | 234 +++++++++++----
 drivers/gpu/drm/gma500/gem.h               |  28 +-
 drivers/gpu/drm/gma500/gma_display.c       |  51 ++--
 drivers/gpu/drm/gma500/gtt.c               | 320 ++++-----------------
 drivers/gpu/drm/gma500/gtt.h               |  29 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c     |   3 +-
 drivers/gpu/drm/gma500/psb_intel_display.c |  17 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h     |   2 +-
 9 files changed, 317 insertions(+), 419 deletions(-)

--
2.33.0

