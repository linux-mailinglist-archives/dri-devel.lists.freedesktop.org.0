Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D310244E85E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 15:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BBD6EAA3;
	Fri, 12 Nov 2021 14:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7728B6E334
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 14:16:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F1C0D1FD62;
 Fri, 12 Nov 2021 14:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636726590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qNGZlr+Pb4VTxO2rSuwJCsnvZGx6FNy7JVundtns4eg=;
 b=kqo0KuTJHId5udMDPF6y4YZ/aVULeLOEwa/OSQC1eXUjRakl1rm4gxPUQ4mF+G1husUr9I
 dGzc2+f5gjFmPB3vJGHLhcGAdoC2b+jVpjX3LwZhAMfCq/Ngg3la8DXTFsoYkglq1x7xyZ
 i//IopVOpmPsKgb8JTLrKoVCkXMbPnI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636726591;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qNGZlr+Pb4VTxO2rSuwJCsnvZGx6FNy7JVundtns4eg=;
 b=CTLAtIAKqjTlw8BTJMfy5bMmx1fC4YtVRHp/AQvtRByNPcuXZgehhupGdFfOt5+naNLJK+
 MDSK8VxjbdrWhuBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BDF0613C7C;
 Fri, 12 Nov 2021 14:16:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SEscLT53jmHhPAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Nov 2021 14:16:30 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel.vetter@ffwll.ch, arnd@arndb.de,
 gregkh@linuxfoundation.org, James.Bottomley@HansenPartnership.com,
 deller@gmx.de
Subject: [PATCH 2/7] agp: Include "compat_ioctl.h" where necessary
Date: Fri, 12 Nov 2021 15:16:23 +0100
Message-Id: <20211112141628.12904-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211112141628.12904-1-tzimmermann@suse.de>
References: <20211112141628.12904-1-tzimmermann@suse.de>
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

Fix compiler warnings like

  drivers/char/agp/frontend.c:46:20: warning: no previous prototype for 'agp_find_mem_by_key' [-Wmissing-prototypes]
    46 | struct agp_memory *agp_find_mem_by_key(int key)

by including the compat_ioctl.h in the source file.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/char/agp/frontend.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/char/agp/frontend.c b/drivers/char/agp/frontend.c
index 6802a6bbf0f2..321118a9cfa5 100644
--- a/drivers/char/agp/frontend.c
+++ b/drivers/char/agp/frontend.c
@@ -39,7 +39,9 @@
 #include <linux/fs.h>
 #include <linux/sched.h>
 #include <linux/uaccess.h>
+
 #include "agp.h"
+#include "compat_ioctl.h"
 
 struct agp_front_data agp_fe;
 
-- 
2.33.1

