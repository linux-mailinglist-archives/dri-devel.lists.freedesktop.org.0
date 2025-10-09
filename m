Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3692BC9478
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 15:23:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0878910EA5B;
	Thu,  9 Oct 2025 13:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A9E10EA57
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 13:23:09 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D16C51F7E1;
 Thu,  9 Oct 2025 13:22:55 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7916313AA6;
 Thu,  9 Oct 2025 13:22:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id yGdeHC+352iECAAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Oct 2025 13:22:55 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/4] drm/log: Add free callback
Date: Thu,  9 Oct 2025 15:16:30 +0200
Message-ID: <20251009132006.45834-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009132006.45834-1-tzimmermann@suse.de>
References: <20251009132006.45834-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: D16C51F7E1
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
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

Free the client memory in the client free callback. Also move the
debugging output into the free callback: drm_client_release() puts
the reference on the DRM device, so pointers to the device should
be considered dangling afterwards.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/clients/drm_log.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index 116e0ef9ae5d..470df4148e96 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -293,19 +293,26 @@ static void drm_log_free_scanout(struct drm_client_dev *client)
 	}
 }
 
-static void drm_log_client_unregister(struct drm_client_dev *client)
+static void drm_log_client_free(struct drm_client_dev *client)
 {
 	struct drm_log *dlog = client_to_drm_log(client);
 	struct drm_device *dev = client->dev;
 
+	kfree(dlog);
+
+	drm_dbg(dev, "Unregistered with drm log\n");
+}
+
+static void drm_log_client_unregister(struct drm_client_dev *client)
+{
+	struct drm_log *dlog = client_to_drm_log(client);
+
 	unregister_console(&dlog->con);
 
 	mutex_lock(&dlog->lock);
 	drm_log_free_scanout(client);
 	mutex_unlock(&dlog->lock);
 	drm_client_release(client);
-	kfree(dlog);
-	drm_dbg(dev, "Unregistered with drm log\n");
 }
 
 static int drm_log_client_hotplug(struct drm_client_dev *client)
@@ -339,6 +346,7 @@ static int drm_log_client_resume(struct drm_client_dev *client, bool _console_lo
 
 static const struct drm_client_funcs drm_log_client_funcs = {
 	.owner		= THIS_MODULE,
+	.free		= drm_log_client_free,
 	.unregister	= drm_log_client_unregister,
 	.hotplug	= drm_log_client_hotplug,
 	.suspend	= drm_log_client_suspend,
-- 
2.51.0

