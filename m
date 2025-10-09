Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35C4BBC9054
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93D8610EA11;
	Thu,  9 Oct 2025 12:30:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LB5eQYYx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C406510EA11
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760013042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cn5dPHJR4fGLCx+LL6EWkDNRU/ebLqiGoCggED75pSc=;
 b=LB5eQYYxBd7yG1Q2oxK2Ldxr0SmVHRyUMafz8xoXjNczNVl9uouSWIFrn1zk5z6LIQrvLx
 G+8fefhE9lDJYWm7H0JjQq7Z4ln/8Rc1MqY5BE4se0w+wDr1vzqKXTJFXHd3kW4HZJ3lkq
 hWnr849hCcDgIF9on7/bMxFRPnfq9Sc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-15-uVIGwZ_LMbGTAMeUefY4JQ-1; Thu,
 09 Oct 2025 08:30:35 -0400
X-MC-Unique: uVIGwZ_LMbGTAMeUefY4JQ-1
X-Mimecast-MFC-AGG-ID: uVIGwZ_LMbGTAMeUefY4JQ_1760013034
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 288F4195608E; Thu,  9 Oct 2025 12:30:34 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.212])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BEF51180035E; Thu,  9 Oct 2025 12:30:30 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: [PATCH 5/6] drm/panic: Fix divide by 0 if the screen width < font
 width
Date: Thu,  9 Oct 2025 14:24:52 +0200
Message-ID: <20251009122955.562888-6-jfalempe@redhat.com>
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

In the unlikely case that the screen is tiny, and smaller than the
font width, it leads to a divide by 0:

draw_line_with_wrap()
chars_per_row = sb->width / font->width = 0
line_wrap.len = line->len % chars_per_row;

This will trigger a divide by 0

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 69be9d835ccf..bc5158683b2b 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -523,7 +523,7 @@ static void draw_panic_static_kmsg(struct drm_scanout_buffer *sb)
 	struct drm_panic_line line;
 	int yoffset;
 
-	if (!font)
+	if (!font || font->width > sb->width)
 		return;
 
 	yoffset = sb->height - font->height - (sb->height % font->height) / 2;
-- 
2.51.0

