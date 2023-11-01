Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B20D7DDF89
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 11:36:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A565610E6BD;
	Wed,  1 Nov 2023 10:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D396710E6BF
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 10:36:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9816C1F853;
 Wed,  1 Nov 2023 10:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698834980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=cO+fF9yAqv4YUx5oKEdgeWcYXyljClfw8iSQv+W7d0Q=;
 b=CgQ/gVxa1wEf/H1nVTRQOLTP/dWgn9xl+mYCF4W6BOq7/L2B7bbO9ES598fhoqyJJqm+Ja
 de0uYvVIwhS23Li+POVvWhF3+a5Q8O5exxKzIRngoNOkdTKFLiU4sh+C+qBGDZSX4ifMyP
 itEckl/zDA137KzsfLd0er+f0IkWLXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698834980;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=cO+fF9yAqv4YUx5oKEdgeWcYXyljClfw8iSQv+W7d0Q=;
 b=hpNNmLeD0LkgBqjew71WoCjihcJNYouFNJHIjLXXzpfbOAdonRhcEhXfEcRF1b02jfjPBH
 5t6AnmKw+JRrCkAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65AC81348D;
 Wed,  1 Nov 2023 10:36:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nv/vFyQqQmVfJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Nov 2023 10:36:20 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: bbrezillon@kernel.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH v2 0/2] drm: Flip-task cleanups
Date: Wed,  1 Nov 2023 11:35:41 +0100
Message-ID: <20231101103618.23806-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.42.0
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

Remove several public interfaces from the DRM flip-task code and
fix the documentation.

v2:
	* documentation fixes (Daniel)

Thomas Zimmermann (2):
  drm: Remove struct drm_flip_task from DRM interfaces
  drm: Fix flip-task docs

 drivers/gpu/drm/drm_flip_work.c | 27 +++++++--------------------
 include/drm/drm_flip_work.h     | 20 +++-----------------
 2 files changed, 10 insertions(+), 37 deletions(-)

-- 
2.42.0

