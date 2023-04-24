Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3086EC82F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 10:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE1B610E0DC;
	Mon, 24 Apr 2023 08:58:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965BC10E0DC
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 08:58:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7513121A14;
 Mon, 24 Apr 2023 08:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682326707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+XJKKs849sQThStkQBOzc9zUGVmnw3q29MM/bZVqjno=;
 b=sTHEbv0Qsj31NwYUZzEROdQpCSS5LV/X6EuZYOl8EJ/bnEQLJc2J8oV6QktbiKtYcaJuuu
 bBnHLvNYCglfbu5XkDrmY/YYnMwCjos6qAXMMu6vvsD24subW2YeAo3U/UBSrLftjgjYjW
 711In0IAbrsSC3ikIF9+94JqNbFPsPo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682326707;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=+XJKKs849sQThStkQBOzc9zUGVmnw3q29MM/bZVqjno=;
 b=v8+j+2rycJN/3aArKwUvpMuDbTcryq8BQGXsbwDQWcVhH5EDTbrMI2eMMxAJgCq6OQwUBV
 jxp5mg9z0y66loDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 39AB513780;
 Mon, 24 Apr 2023 08:58:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id t0TQDLNERmQneQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 24 Apr 2023 08:58:27 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, geert@linux-m68k.org
Subject: [PATCH 0/3] fbdev: Set missing owner fields in fb_ops
Date: Mon, 24 Apr 2023 10:58:22 +0200
Message-Id: <20230424085825.18287-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Set the owner field of various drivers' fb_ops instance. The
setting is required by fbcon, which acquires a reference on the
fbdev driver's module. Otherwise, users could attempt to unload
the module while it's still in use.

Thomas Zimmermann (3):
  fbdev/68328fb: Init owner field of struct fb_ops
  fbdev/ps3fb: Init owner field of struct fb_ops
  fbdev/vfb: Init owner field of struct fb_ops

 drivers/video/fbdev/68328fb.c | 1 +
 drivers/video/fbdev/ps3fb.c   | 1 +
 drivers/video/fbdev/vfb.c     | 1 +
 3 files changed, 3 insertions(+)

-- 
2.40.0

