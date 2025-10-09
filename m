Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C425BC904B
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:30:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB8910EA0B;
	Thu,  9 Oct 2025 12:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O8JIZ9Lb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4B310EA0B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760013026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+jU6y3U31OtGeGVZmCu0gO04BJwFhkS/aeWCbYDaXik=;
 b=O8JIZ9Lbz0PWFRr/5S5pdVFXCFpQjdRQs+skbBtjMnQ0fIB1C1oWNkP+mJwbInDtL4Hd8j
 gpWXq9ruVAfcKKAeyCfTlpK1i0SGRSzYF1u30nXrgLGWHF2z+IxYvBf+9IdlqBpkKUJWow
 SsL5wsUkfXuOBg0Tyo1LFOcVaiSyc5I=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-185-q1Xljwk-N8-wwzTwoFRdAg-1; Thu,
 09 Oct 2025 08:30:23 -0400
X-MC-Unique: q1Xljwk-N8-wwzTwoFRdAg-1
X-Mimecast-MFC-AGG-ID: q1Xljwk-N8-wwzTwoFRdAg_1760013022
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 357A6180048E; Thu,  9 Oct 2025 12:30:22 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.212])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BD2E318004D8; Thu,  9 Oct 2025 12:30:18 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: [PATCH 2/6] drm/panic: Fix overlap between qr code and logo
Date: Thu,  9 Oct 2025 14:24:49 +0200
Message-ID: <20251009122955.562888-3-jfalempe@redhat.com>
In-Reply-To: <20251009122955.562888-1-jfalempe@redhat.com>
References: <20251009122955.562888-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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

The borders of the qr code was not taken into account to check if it
overlap with the logo, leading to the logo being partially covered.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 23ba791c6131..179cbf21f22d 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -749,7 +749,7 @@ static int _draw_panic_static_qr_code(struct drm_scanout_buffer *sb)
 	/* Fill with the background color, and draw text on top */
 	drm_panic_fill(sb, &r_screen, bg_color);
 
-	if (!drm_rect_overlap(&r_logo, &r_msg) && !drm_rect_overlap(&r_logo, &r_qr))
+	if (!drm_rect_overlap(&r_logo, &r_msg) && !drm_rect_overlap(&r_logo, &r_qr_canvas))
 		drm_panic_logo_draw(sb, &r_logo, font, fg_color);
 
 	draw_txt_rectangle(sb, font, panic_msg, panic_msg_lines, true, &r_msg, fg_color);
-- 
2.51.0

