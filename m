Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F41B9C17C4
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 09:21:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1025C10E92C;
	Fri,  8 Nov 2024 08:21:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fEapmEEb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B01A10E92C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 08:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731054072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/0GzBCk13OKVkgHm5stvUgUmTAl0xdMeFO65rKj1joY=;
 b=fEapmEEbTOtL42ReqVcpKe4sRyk/2YzvvvPJB1cvLcDOPjQPSI+Vk9mOTIs5NjaniyaVof
 EyRsjzeSfGzMJz0mWZJ4ZtpJQcVChn4+qwRgu60VrwpayDCr3ZzW9SX6rrnLJvkTho1vvd
 Ws5tl3Ib1dCYF9ZG/lBUEZhasLcgDKE=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-673-ug9N4FElO6CLGD6vLpNrIg-1; Fri,
 08 Nov 2024 03:21:08 -0500
X-MC-Unique: ug9N4FElO6CLGD6vLpNrIg-1
X-Mimecast-MFC-AGG-ID: ug9N4FElO6CLGD6vLpNrIg
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1B9481953957; Fri,  8 Nov 2024 08:21:07 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.51])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 222411956054; Fri,  8 Nov 2024 08:21:02 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v7 6/7] drm/log: Implement suspend/resume
Date: Fri,  8 Nov 2024 09:10:24 +0100
Message-ID: <20241108082025.1004653-7-jfalempe@redhat.com>
In-Reply-To: <20241108082025.1004653-1-jfalempe@redhat.com>
References: <20241108082025.1004653-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

Normally the console is already suspended when the graphic driver
suspend callback is called, but if the parameter no_console_suspend
is set, it might still be active.
So call console_stop()/console_start() in the suspend/resume
callbacks, to make sure it won't try to write to the framebuffer
while the graphic driver is suspended.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: John Ogness <john.ogness@linutronix.de>
Acked-by: Petr Mladek <pmladek@suse.com>
---

v6:
 * Use console_stop() and console_start() in the suspend/resume callback (Petr Mladek).


 drivers/gpu/drm/drm_log.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/drm_log.c b/drivers/gpu/drm/drm_log.c
index 635dff7b37ce5..e6900c6b96436 100644
--- a/drivers/gpu/drm/drm_log.c
+++ b/drivers/gpu/drm/drm_log.c
@@ -310,10 +310,30 @@ static int drm_log_client_hotplug(struct drm_client_dev *client)
 	return 0;
 }
 
+static int drm_log_client_suspend(struct drm_client_dev *client, bool _console_lock)
+{
+	struct drm_log *dlog = client_to_drm_log(client);
+
+	console_stop(&dlog->con);
+
+	return 0;
+}
+
+static int drm_log_client_resume(struct drm_client_dev *client, bool _console_lock)
+{
+	struct drm_log *dlog = client_to_drm_log(client);
+
+	console_start(&dlog->con);
+
+	return 0;
+}
+
 static const struct drm_client_funcs drm_log_client_funcs = {
 	.owner		= THIS_MODULE,
 	.unregister	= drm_log_client_unregister,
 	.hotplug	= drm_log_client_hotplug,
+	.suspend	= drm_log_client_suspend,
+	.resume		= drm_log_client_resume,
 };
 
 static void drm_log_write_thread(struct console *con, struct nbcon_write_context *wctxt)
-- 
2.47.0

