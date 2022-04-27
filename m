Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 259CF5118AB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 16:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBED410E00D;
	Wed, 27 Apr 2022 14:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE42710E00D
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Apr 2022 14:14:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2123A1F74E;
 Wed, 27 Apr 2022 14:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651068853; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aWVWlZng8KhEr+s9ddPi0v6kT6qXBazXYdQRlsPtTOw=;
 b=ll6FJGMio4NldMmknayocoaJUuHhwrSn1ybDOdy6Ibm2vqso6P6eG61bIqgFiDfa26kvq8
 1Ml4EHw2oGYiYBq5PeCk3jS8IJoBlGJ8bxkgsEfB4xZcV+AwkGazIRpy0JgZcC6JFjytGD
 fc8Nw7oRdNMr2DKQZmjyWz7H2MU5QTE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651068853;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=aWVWlZng8KhEr+s9ddPi0v6kT6qXBazXYdQRlsPtTOw=;
 b=4JSGZ1Xka8i9fDGYT2Jykuxl++slpcGK0PqM2kPNclm0Tag+TSdIZfmYEu4bCdUzoL76iE
 iDFKQzkxUHySx1CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E0B2613A39;
 Wed, 27 Apr 2022 14:14:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oreXNbRPaWLfbwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 27 Apr 2022 14:14:12 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: javierm@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 0/4] drm/format-helper: Share common code among conversion
 helpers
Date: Wed, 27 Apr 2022 16:14:05 +0200
Message-Id: <20220427141409.22842-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.36.0
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

Move all format-specific handling in per-line conversion functions and
share the overall loop among conversion helpers. This is another step
towards composable format conversion. 

Thomas Zimmermann (4):
  drm/format-helper: Implement drm_fb_swab() with per-line helpers
  drm/format-helper: Remove optional byte-swap from line convertion
  drm/format-helper: Unify the parameters of all per-line conversion
    helpers
  drm/format-helper: Share implementation among conversion helpers

 drivers/gpu/drm/drm_format_helper.c | 479 ++++++++++++----------------
 1 file changed, 198 insertions(+), 281 deletions(-)

-- 
2.36.0

