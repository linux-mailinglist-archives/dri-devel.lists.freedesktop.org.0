Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A08754F55E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 12:32:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1862211A77E;
	Fri, 17 Jun 2022 10:32:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A693411A77E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 10:32:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 54D171FDB3;
 Fri, 17 Jun 2022 10:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655461950; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VarfKqOgwKt+pKob3rThCiZpNYiqC3s2qmDVRlBxcBk=;
 b=JzEaJtIIpWVsajxomzGekVp3LV7V8agCiqefrz8FptcuQ+FK4+xRRGn3CmunHLnuOVV51W
 LGRylVcEIHfs7iiFj+Q7ZKsE+y8YLoIlf1yB5zURA+pgWtAES5lh5PigWWHYhZVQDfFf6V
 I8o5hUQh+O3wSraGNrvObKIE4k9ZA9w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655461950;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=VarfKqOgwKt+pKob3rThCiZpNYiqC3s2qmDVRlBxcBk=;
 b=R3jOcxZZOx1hzZbYLJM9gcHCAJPQpdRiG1k7fRwjcY+E+YpRtRKsTxa8LzOJWJTBgXv3Je
 fEOK+DlWKfndoUCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1DA661348E;
 Fri, 17 Jun 2022 10:32:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IfYUBj5YrGKeSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Jun 2022 10:32:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, airlied@linux.ie, javierm@redhat.com,
 noralf@tronnes.org, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
Subject: [PATCH 0/3] drm: Test for primary plane in new
 drm_atomic_helper_check_crtc_state()
Date: Fri, 17 Jun 2022 12:32:23 +0200
Message-Id: <20220617103226.25617-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.1
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

Provide drm_atomic_helper_check_crtc_state() for validating a CRTC
state against common constraints. As many CRTC need a primary plane
to work correctly, add this as the first test.

The simple-KMS helpers already contain related code. Convert it
to the new helper. Also add this test to ast.

The simple-kms changes were tested with simpledrm. The ast changes
were tested in AST2300 hardware.

Thomas Zimmermann (3):
  drm/atomic-helper: Add helper drm_atomic_helper_check_crtc_state()
  drm/simple-kms: Use drm_atomic_helper_check_crtc_state()
  drm/ast: Enable primary plane with CRTC

 drivers/gpu/drm/ast/ast_mode.c          | 13 ++++--
 drivers/gpu/drm/drm_atomic_helper.c     | 55 +++++++++++++++++++++++++
 drivers/gpu/drm/drm_simple_kms_helper.c | 14 +++----
 include/drm/drm_atomic_helper.h         |  2 +
 4 files changed, 72 insertions(+), 12 deletions(-)


base-commit: 822a8442835012ce405080cb40f6317ef1e854ac
-- 
2.36.1

