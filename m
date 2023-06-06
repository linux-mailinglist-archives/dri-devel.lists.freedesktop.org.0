Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B12CA723FD0
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 12:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877DB10E1A2;
	Tue,  6 Jun 2023 10:41:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C031D10E1A2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 10:41:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 619B821987;
 Tue,  6 Jun 2023 10:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1686048059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=RFRhA53OrpoRIGlRg0Wm+s0hzuLRv5C/FjeqAiv5RVQ=;
 b=YABc6428qBup7gTPDtzPNifRPArSt62oMEfrVrJ2VU5TjjDevAE+1JhW9+gD5n22aOMFXo
 32UXn1518IwtkNS3Z3BzKuZxIJR1o/D/RtHBW+lIB8+RumQ7yivryeIBwGb4rxLCYrDd5Q
 +5u7xw1Rjb2dqGet6aycRTox/jnslKo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1686048059;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=RFRhA53OrpoRIGlRg0Wm+s0hzuLRv5C/FjeqAiv5RVQ=;
 b=GyggOgYwcALJa3UrrDCMIgv2T+a/C1kT1RrYl0u4da0+XmF5jk19ombO5XVtEvJqGveG3a
 e/5LPtozKSwOw2Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3640613776;
 Tue,  6 Jun 2023 10:40:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MWdpDDsNf2SHewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 06 Jun 2023 10:40:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	David.Laight@ACULAB.COM
Subject: [PATCH 0/3] fbdev/hitfb: Various fixes
Date: Tue,  6 Jun 2023 12:40:53 +0200
Message-Id: <20230606104056.29553-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.1
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-sh@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a number of minor warnings in the hitfb driver. I discovered
them while working on bb47f218fd01 ("fbdev/hitfb: Cast I/O offset
to address").

Thomas Zimmermann (3):
  fbdev/hitfb: Declare hitfb_blank() as static
  fbdev/hitfb: Fix integer-to-pointer cast
  fbdev/hitfb: Use NULL for pointers

 drivers/video/fbdev/hitfb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: 29c0f369e17ba0abf08c65ca065417aebab208c6
-- 
2.40.1

