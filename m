Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD3299A21A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 12:56:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B49FF10EABA;
	Fri, 11 Oct 2024 10:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Qg+qJ8ou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B16E210EABA
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 10:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1728644164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESAFmO5CDFEtABw+ze2jRMM8mwaGYPOwHPSKAEXy4z4=;
 b=Qg+qJ8ouaJzsTIjpJK1rujjL/8X+TJCFblBaJGf6QlKdT7QtHasPZGI+CBnnIO/noWEoTQ
 1UVj0sqawLU4gC1zRgRuZpG48Lwga1nlzn8FharMeE1kNWusyjt0NzIbTtdD+54/sDWjMG
 3ZPvoBqNmacK5eewc4f8AACbRKo1plo=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-696-JoxU1mbbNZWQG0H2YU9auw-1; Fri,
 11 Oct 2024 06:56:01 -0400
X-MC-Unique: JoxU1mbbNZWQG0H2YU9auw-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 8B5DC1954B18; Fri, 11 Oct 2024 10:55:59 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.224])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9EFFC19560AA; Fri, 11 Oct 2024 10:55:54 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v4 4/7] drm/log: Do not draw if drm_master is taken
Date: Fri, 11 Oct 2024 12:50:01 +0200
Message-ID: <20241011105526.615812-5-jfalempe@redhat.com>
In-Reply-To: <20241011105526.615812-1-jfalempe@redhat.com>
References: <20241011105526.615812-1-jfalempe@redhat.com>
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

When userspace takes drm_master, the drm_client buffer is no more
visible, so drm_log shouldn't waste CPU cycle to draw on it.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_log.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_log.c b/drivers/gpu/drm/drm_log.c
index 376ee173d99d..226e206e8b6a 100644
--- a/drivers/gpu/drm/drm_log.c
+++ b/drivers/gpu/drm/drm_log.c
@@ -18,6 +18,7 @@
 #include <drm/drm_print.h>
 
 #include "drm_draw.h"
+#include "drm_internal.h"
 #include "drm_log.h"
 
 MODULE_AUTHOR("Jocelyn Falempe");
@@ -308,8 +309,13 @@ static void drm_log_write_thread(struct console *con, struct nbcon_write_context
 	if (!dlog->probed)
 		drm_log_init_client(dlog);
 
-	for (i = 0; i < dlog->n_scanout; i++)
-		drm_log_draw_kmsg_record(&dlog->scanout[i], wctxt->outbuf, wctxt->len);
+	/* Check that we are still the master before drawing */
+	if (drm_master_internal_acquire(dlog->client.dev)) {
+		drm_master_internal_release(dlog->client.dev);
+
+		for (i = 0; i < dlog->n_scanout; i++)
+			drm_log_draw_kmsg_record(&dlog->scanout[i], wctxt->outbuf, wctxt->len);
+	}
 }
 
 static void drm_log_lock(struct console *con, unsigned long *flags)
-- 
2.46.2

