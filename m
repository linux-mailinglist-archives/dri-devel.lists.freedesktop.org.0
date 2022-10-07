Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFE75F7823
	for <lists+dri-devel@lfdr.de>; Fri,  7 Oct 2022 14:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30F1310E086;
	Fri,  7 Oct 2022 12:43:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C77B610E0BF
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Oct 2022 12:43:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B357C1F896;
 Fri,  7 Oct 2022 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665146624; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mnL1YIcdAmJnekbBjiUt9t+wh7wBGfCIblXkuicfFds=;
 b=dfkOeIjblynD+pamzaMskJAp3OMTUIKUx7npV/D8DnTs1rh+8xPslj3h9159ZoEjxUvcHu
 JeaW1QtU6F4wPd41uP/x11/IFqlpHxnaBfsPxE7DK5DgFOwtvTlcUL6Aun9FqMIjxt1jLj
 MnoY5UxEJjnofaUfUOkozZ3E9G44U1o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665146624;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=mnL1YIcdAmJnekbBjiUt9t+wh7wBGfCIblXkuicfFds=;
 b=FNgfS+5hIEkIHJw7Pzxn8gl4BNXYWLH7NM8ZsvNzwNdAcijjQJ+xn64qGNOSZjpnBPPpv6
 sE2e5a8CgaYircAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 768EF13A9A;
 Fri,  7 Oct 2022 12:43:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1vsqGwAfQGPdZAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Oct 2022 12:43:44 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, daniel@ffwll.ch, airlied@gmail.com,
 ville.syrjala@linux.intel.com, daniel@fooishbar.org, javierm@redhat.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Subject: [PATCH v5 0/2] drm/atomic-helpers: Fix CRTC primary-plane test
Date: Fri,  7 Oct 2022 14:43:36 +0200
Message-Id: <20221007124338.24152-1-tzimmermann@suse.de>
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

Fix the test for the CRTC's primary plane and clean up the test function
to only do the test.

v5:
	* fix commit message of patch 1 (Javier)
	* rebase onto latest drm-tip
v4:
	* clean up the helper function (Ville)

Thomas Zimmermann (2):
  drm/atomic-helper: Don't allocate new plane state in CRTC check
  drm/atomic-helper: Replace drm_atomic_helper_check_crtc_state()

 drivers/gpu/drm/ast/ast_mode.c          |  8 ++--
 drivers/gpu/drm/drm_atomic_helper.c     | 60 ++++++++-----------------
 drivers/gpu/drm/drm_simple_kms_helper.c |  6 ++-
 drivers/gpu/drm/mgag200/mgag200_mode.c  |  8 ++--
 drivers/gpu/drm/solomon/ssd130x.c       |  6 ++-
 drivers/gpu/drm/tiny/simpledrm.c        |  6 ++-
 drivers/gpu/drm/udl/udl_modeset.c       |  5 ++-
 include/drm/drm_atomic_helper.h         |  3 +-
 8 files changed, 46 insertions(+), 56 deletions(-)

-- 
2.37.3

