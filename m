Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B66464D3A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 12:47:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDD126F988;
	Wed,  1 Dec 2021 11:46:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAFC46F96F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 11:46:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6532F2171F;
 Wed,  1 Dec 2021 11:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638359208; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j9JpfCXR5KZxj1UdTwkV9fSt2oVs5kvOrWGLkS5s63o=;
 b=qMRyYQ/PYLg6YNcERExTu2b/nf2HoTVSSPmlQRbR949wuAJEAv75sSGgp7yFyzvUDADemE
 9+3hhHFtsP6kYuRvV8vLwK427n2LlyGyOtce4GcKjuDex5jj2Ko/kjPK4p+ryuB9nmgFwU
 XP5IzBiwI4G7cawqxKrlNauzu0RS+eI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638359208;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j9JpfCXR5KZxj1UdTwkV9fSt2oVs5kvOrWGLkS5s63o=;
 b=aWNJK0APRtVR5HZQkQ9cZORGK6DNjrle1bOuzdHzb0/D2lHJeQfbUdDYU4bJKi0ZBcc7Mg
 9OafW45DHNd1TiCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2F9B013FF6;
 Wed,  1 Dec 2021 11:46:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WCKoCqhgp2HbDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 01 Dec 2021 11:46:48 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
Subject: [PATCH v2 5/7] agp/nvidia: Declare value returned by readl() as unused
Date: Wed,  1 Dec 2021 12:46:43 +0100
Message-Id: <20211201114645.15384-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.0
In-Reply-To: <20211201114645.15384-1-tzimmermann@suse.de>
References: <20211201114645.15384-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the compiler warning

  drivers/char/agp/nvidia-agp.c: In function 'nvidia_tlbflush':
  drivers/char/agp/nvidia-agp.c:264:22: warning: variable 'temp' set but not used [-Wunused-but-set-variable]
    264 |         u32 wbc_reg, temp;

by marking the temp variable with __maybe_unused. The affected readl()
is only required for flushing caches, but the returned value is not of
interest.

v2:
	* declare temp as __maybe_unused (Helge)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/char/agp/nvidia-agp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/char/agp/nvidia-agp.c b/drivers/char/agp/nvidia-agp.c
index f78e756157db..826dbd06f6bb 100644
--- a/drivers/char/agp/nvidia-agp.c
+++ b/drivers/char/agp/nvidia-agp.c
@@ -261,7 +261,8 @@ static int nvidia_remove_memory(struct agp_memory *mem, off_t pg_start, int type
 static void nvidia_tlbflush(struct agp_memory *mem)
 {
 	unsigned long end;
-	u32 wbc_reg, temp;
+	u32 wbc_reg;
+	u32 __maybe_unused temp;
 	int i;
 
 	/* flush chipset */
-- 
2.34.0

