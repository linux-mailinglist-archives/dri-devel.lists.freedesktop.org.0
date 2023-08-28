Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 019AC78B199
	for <lists+dri-devel@lfdr.de>; Mon, 28 Aug 2023 15:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283AE10E2DC;
	Mon, 28 Aug 2023 13:22:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB0B010E2D2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Aug 2023 13:21:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C42601FD69;
 Mon, 28 Aug 2023 13:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693228895; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NML8iokhOzgcRUuPruaBldkgErx0VDUQPo56b5aaTOQ=;
 b=kwuJ2Oe4vJFUSEopXOctZfhG5lFgxIJv3guXKfU9q+3aBJbYw1bTpWHwMt1T2TQPQsqCX4
 mEpvdyIHuEE0JbIKc+8OmI5qFEqq7s3Mb/N4CuUWvGMEBZmitc8wWpnQOjAvuLPPssR0sB
 7tjrcQPZfN+wdpDjKRIdLts8Fhgzzh0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693228895;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NML8iokhOzgcRUuPruaBldkgErx0VDUQPo56b5aaTOQ=;
 b=7agvQZb3zEebD56+O+FjRInFJ/aN/5SlHCxXknurvmqDBNgafHfl7aoSqutH5Emq1EVKcS
 gp3M/YTEhDQCkuBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8F95F13A11;
 Mon, 28 Aug 2023 13:21:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id uB4WIl+f7GTyOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 28 Aug 2023 13:21:35 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	daniel@ffwll.ch,
	sam@ravnborg.org,
	javierm@redhat.com
Subject: [PATCH 3/8] fbdev: Add Kconfig macro FB_IOMEM_HELPERS_DEFERRED
Date: Mon, 28 Aug 2023 15:14:19 +0200
Message-ID: <20230828132131.29295-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230828132131.29295-1-tzimmermann@suse.de>
References: <20230828132131.29295-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The new Kconfig macro FB_IOMEM_HELPERS_DEFERRED selects fbdev's
helpers for device I/O memory and deferred I/O. Drivers should
use it if they perform damage updates on device I/O memory.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index baf7e852c75b..e80d6429f76a 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -151,6 +151,12 @@ config FB_IOMEM_HELPERS
 	select FB_CFB_FILLRECT
 	select FB_CFB_IMAGEBLIT
 
+config FB_IOMEM_HELPERS_DEFERRED
+	bool
+	depends on FB_CORE
+	select FB_DEFERRED_IO
+	select FB_IOMEM_HELPERS
+
 config FB_SYSMEM_HELPERS
 	bool
 	depends on FB_CORE
-- 
2.41.0

