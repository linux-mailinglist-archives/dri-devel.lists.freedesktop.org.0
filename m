Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7501AC47A04
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 16:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C537710E410;
	Mon, 10 Nov 2025 15:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2193C10E410
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Nov 2025 15:46:30 +0000 (UTC)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 431BF204AB;
 Mon, 10 Nov 2025 15:46:22 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CA51B14485;
 Mon, 10 Nov 2025 15:46:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id aKbzL80IEmlHXQAAD6G6ig
 (envelope-from <tzimmermann@suse.de>); Mon, 10 Nov 2025 15:46:21 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com, javierm@redhat.com, francesco@valla.it,
 rrameshbabu@nvidia.com, simona@ffwll.ch, airlied@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 3/3] drm/client: log: Implement struct
 drm_client_funcs.restore
Date: Mon, 10 Nov 2025 16:44:23 +0100
Message-ID: <20251110154616.539328-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251110154616.539328-1-tzimmermann@suse.de>
References: <20251110154616.539328-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Queue-Id: 431BF204AB
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
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

Restore the log client's output when the DRM core invokes the restore
callback. Follow the existing behavior of fbdev emulation wrt. the
value of the force parameter.

If force is false, acquire the DRM master lock and reprogram the
display. This is the case when the user-space compositor exits and
the DRM core transfers the display back to the in-kernel client. This
also enables drm_log output during reboot and shutdown.

If force is true, reprogram without considering the master lock. This
overrides the current compositor and prints the log to the screen. In
case of system malfunction, users can enter SysRq+v to invoke the
emergency error reporting. See Documentation/admin-guide/sysrq.rst for
more information.

v2:
- s/exists/exits/ in second paragraph of commit description
- fix grammar in commit description

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/clients/drm_log.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/clients/drm_log.c b/drivers/gpu/drm/clients/drm_log.c
index 19e55aa0ed74..4d3005273b27 100644
--- a/drivers/gpu/drm/clients/drm_log.c
+++ b/drivers/gpu/drm/clients/drm_log.c
@@ -315,6 +315,18 @@ static void drm_log_client_unregister(struct drm_client_dev *client)
 	drm_client_release(client);
 }
 
+static int drm_log_client_restore(struct drm_client_dev *client, bool force)
+{
+	int ret;
+
+	if (force)
+		ret = drm_client_modeset_commit_locked(client);
+	else
+		ret = drm_client_modeset_commit(client);
+
+	return ret;
+}
+
 static int drm_log_client_hotplug(struct drm_client_dev *client)
 {
 	struct drm_log *dlog = client_to_drm_log(client);
@@ -348,6 +360,7 @@ static const struct drm_client_funcs drm_log_client_funcs = {
 	.owner		= THIS_MODULE,
 	.free		= drm_log_client_free,
 	.unregister	= drm_log_client_unregister,
+	.restore	= drm_log_client_restore,
 	.hotplug	= drm_log_client_hotplug,
 	.suspend	= drm_log_client_suspend,
 	.resume		= drm_log_client_resume,
-- 
2.51.1

