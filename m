Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 061CA3CB873
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 16:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2513C6E997;
	Fri, 16 Jul 2021 14:08:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A876E991
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 14:08:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B6A1D22B44;
 Fri, 16 Jul 2021 14:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626444485; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2ZlzXQ0PnxP/tR0SH3Ea2gTMVtQurhM85x284nrHsK8=;
 b=OBJjrLG+hxe/HIg54V61uoCV6zgIMNM/0zUZRb0YgeTnPy8CwyrRWCcWtKTjv1QOJlOgTK
 mE4Iffx5u/C7P4sybXLtxcZCJbN+gPQszKq/8XKCEZ10vm/9s2bHpH9Ys36scA5UkWAdZH
 uzFv2YRg4zMe57Exy/mug/ow1Pa83TQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626444485;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=2ZlzXQ0PnxP/tR0SH3Ea2gTMVtQurhM85x284nrHsK8=;
 b=Fr2RYjOp8mhucgeV62wUVVdYfrLQS7klwv3DgLlv3fbvNxKPSX0R79WstJYDc/O4ZG5S7X
 lz1fCnZYJCl5+ADg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 72DC313C70;
 Fri, 16 Jul 2021 14:08:05 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QWeOGsWS8WBTSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Jul 2021 14:08:05 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, noralf@tronnes.org, hdegoede@redhat.com,
 david@lechnology.com, airlied@redhat.com, sean@poorly.run
Subject: [PATCH 0/7] drm: Provide framebuffer dma-buf helpers
Date: Fri, 16 Jul 2021 16:07:54 +0200
Message-Id: <20210716140801.1215-1-tzimmermann@suse.de>
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

Provide helpers that wrap dma_buf_{begin,end}_cpu_access() for all
GEM BOs attached to a framebuffer. Convert drivers and remove ugly
boilerplate code.

Thomas Zimmermann (7):
  drm/gem: Provide drm_gem_fb_{begin,end}_cpu_access() helpers
  drm/udl: Use framebuffer dma-buf helpers
  drm/mipi-dbi: Use framebuffer dma-buf helpers
  drm/gud: Use framebuffer dma-buf helpers
  drm/gm12u320: Use framebuffer dma-buf helpers
  drm/repaper: Use framebuffer dma-buf helpers
  drm/st7586: Use framebuffer dma-buf helpers

 drivers/gpu/drm/drm_gem_framebuffer_helper.c | 89 ++++++++++++++++++++
 drivers/gpu/drm/drm_mipi_dbi.c               | 20 ++---
 drivers/gpu/drm/gud/gud_pipe.c               | 13 ++-
 drivers/gpu/drm/tiny/gm12u320.c              | 19 ++---
 drivers/gpu/drm/tiny/repaper.c               | 18 +---
 drivers/gpu/drm/tiny/st7586.c                | 18 ++--
 drivers/gpu/drm/udl/udl_modeset.c            | 29 ++-----
 include/drm/drm_gem_framebuffer_helper.h     |  6 ++
 8 files changed, 130 insertions(+), 82 deletions(-)

--
2.32.0

