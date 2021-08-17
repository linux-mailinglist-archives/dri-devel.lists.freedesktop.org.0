Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD2C3EF199
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 20:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DF1897F0;
	Tue, 17 Aug 2021 18:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FF4897F0
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 18:16:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 865D921FAA;
 Tue, 17 Aug 2021 18:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629224190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Vj33KiPUzFn0QGb9mUjblBiWngR3AV42WvK6K4rdaik=;
 b=QiImQbqY8a2xKcvM/NxHMMwJFHcumEP2yzP6BBs70AW9PwmGAlKIzJ/WsW9m0K0KE2UMD9
 G/s/fPK9CmHkYsvS6SOaN0+5xa9/ahOATeSUEDPkOkXhc3cS96RZ/bplgXdZ++vKQV2xhX
 puO9s2zNqQ/mBxahHKhz5C6yV4tU5eg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629224190;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Vj33KiPUzFn0QGb9mUjblBiWngR3AV42WvK6K4rdaik=;
 b=8feIgENr160HMP+H+ZbgqbWdg3N7Vz1q2326aFiM+JfcYEE44JX9FaK5O/AEDAxtUN6bwr
 tiFzSBeGl6x91BBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4FEC313DCD;
 Tue, 17 Aug 2021 18:16:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LlNCEv78G2HqegAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 17 Aug 2021 18:16:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, daniel@ffwll.ch, sam@ravnborg.org,
 dan.carpenter@oracle.com
Cc: dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/mgag200: Initialize delta variable in PLL compute function
Date: Tue, 17 Aug 2021 20:16:26 +0200
Message-Id: <20210817181626.30230-1-tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Initialize delta variable in PLL compute function for G200SE, rev 00 to
the maximum value. Fixes uninitialized usage.

  smatch warnings:
  drivers/gpu/drm/mgag200/mgag200_pll.c:142 mgag200_pixpll_compute_g200se_00() \
  error: uninitialized symbol 'delta'.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 2545ac960364 ("drm/mgag200: Abstract pixel PLL via struct mgag200_pll")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/mgag200/mgag200_pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mgag200/mgag200_pll.c b/drivers/gpu/drm/mgag200/mgag200_pll.c
index 7c903cf19c0d..e9ae22b4f813 100644
--- a/drivers/gpu/drm/mgag200/mgag200_pll.c
+++ b/drivers/gpu/drm/mgag200/mgag200_pll.c
@@ -124,6 +124,7 @@ static int mgag200_pixpll_compute_g200se_00(struct mgag200_pll *pixpll, long clo
 	unsigned int computed;

 	m = n = p = s = 0;
+	delta = 0xffffffff;
 	permitteddelta = clock * 5 / 1000;

 	for (testp = 8; testp > 0; testp /= 2) {
--
2.32.0

