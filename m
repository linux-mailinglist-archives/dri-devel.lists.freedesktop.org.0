Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 700CA42EC9C
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 10:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 012996E23F;
	Fri, 15 Oct 2021 08:40:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 813FE6E23F
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 08:40:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0C6E82196B;
 Fri, 15 Oct 2021 08:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634287255; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=z6tYD4iBEybz7UxX/JoRUE7w/jH6iAVM0G7YvTO/ovs=;
 b=Ka3CxY28ey2T3w+vPyvMJgZTdBB+xwXP0U2G1/khN0uCW0jBy5WM8UXQMLzwqceWVDbv9O
 d2gu5XCBQUnDLE151nve/p9EUBjgazqGOp9YwBRT2dbPV/4yW5rR3MdhDkF1dFy628Xgcc
 OhJ0sRsc4N3ynWtyBr+k9wYl9IOmDE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634287255;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=z6tYD4iBEybz7UxX/JoRUE7w/jH6iAVM0G7YvTO/ovs=;
 b=I7iox0KvT6YyDCmNm+GM7jZwSLTLk/RlZO6VePtCAjF4zWT2QFivesfQVsP1/fAbnAhx+2
 Q/joX+vle7R4uvCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DD0F413B87;
 Fri, 15 Oct 2021 08:40:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 6R3fNJY+aWHBGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 15 Oct 2021 08:40:54 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: patrik.r.jakobsson@gmail.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 00/10] drm/gma500: Refactor GEM code
Date: Fri, 15 Oct 2021 10:40:43 +0200
Message-Id: <20211015084053.13708-1-tzimmermann@suse.de>
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

v3:
	* replace [static 1] with pointer notation
	* keep lost comments about GTT locking
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
 drivers/gpu/drm/gma500/gtt.c               | 326 +++++----------------
 drivers/gpu/drm/gma500/gtt.h               |  29 +-
 drivers/gpu/drm/gma500/oaktrail_crtc.c     |   3 +-
 drivers/gpu/drm/gma500/psb_intel_display.c |  17 +-
 drivers/gpu/drm/gma500/psb_intel_drv.h     |   2 +-
 9 files changed, 325 insertions(+), 417 deletions(-)

--
2.33.0

