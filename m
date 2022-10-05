Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 693C25F53C9
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 13:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F6B510E1D6;
	Wed,  5 Oct 2022 11:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3C310E1D6
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 11:40:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2BF2D1F88F;
 Wed,  5 Oct 2022 11:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664970005; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yXJ8Dgb2kC1FKQTJNW4HVwgRuZ0eM+GydG7yj9WARQY=;
 b=Dhjbp5bgxiCc6Ooa5TPQa8wOaXcRFu9EgWNsUemVUkZgcW1UnSRg8jxsCYlgFj7EcQSVGv
 sHpksEh6uzTDxL70GMfybOUvg3B6hniN+a8llBh9fmnJBq23AbH9uNkddhGC+oJLXgLQ1r
 V22Vem+Hvkjvj4cm9JEOZ12NM/kfZiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664970005;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=yXJ8Dgb2kC1FKQTJNW4HVwgRuZ0eM+GydG7yj9WARQY=;
 b=SIBAIcJnDMHRRnBTWXvlnylcpWplN9/n+SH4dV68B6hYT37zpdijJrEb8Pkr6aQkCVISjn
 pqvZZvb33u/YhpAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EF77013345;
 Wed,  5 Oct 2022 11:40:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yPSjORRtPWMmVAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Oct 2022 11:40:04 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, daniel@ffwll.ch, airlied@gmail.com,
 ville.syrjala@linux.intel.com, daniel@fooishbar.org, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH v4 0/2] drm/atomic-helpers: Fix CRTC primary-plane test
Date: Wed,  5 Oct 2022 13:40:00 +0200
Message-Id: <20221005114002.3715-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.37.3
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

(was: drm/atomic-helper: Don't allocated plane state in CRTC check)

Fix the test for a CRTC's primary plane and clean up the test function
to only do the test. Up to v3, this patchset was a single patch, but
the cleanup turns it into a series.

v4:
	* clean up the helper function (Ville)

Thomas Zimmermann (2):
  drm/atomic-helper: Don't allocated plane state in CRTC check
  drm/atomic-helper: Replace drm_atomic_helper_check_crtc_state()

 drivers/gpu/drm/ast/ast_mode.c          |  8 ++--
 drivers/gpu/drm/drm_atomic_helper.c     | 60 ++++++++-----------------
 drivers/gpu/drm/drm_simple_kms_helper.c |  6 ++-
 drivers/gpu/drm/mgag200/mgag200_mode.c  |  8 ++--
 drivers/gpu/drm/solomon/ssd130x.c       |  6 ++-
 drivers/gpu/drm/tiny/simpledrm.c        |  6 ++-
 include/drm/drm_atomic_helper.h         |  3 +-
 7 files changed, 42 insertions(+), 55 deletions(-)

-- 
2.37.3

