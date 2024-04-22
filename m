Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF308AD15D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Apr 2024 17:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4181B10F6A3;
	Mon, 22 Apr 2024 15:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IQ0eRoFb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C70A10F6A3
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Apr 2024 15:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713801497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bsAXjGXhjstEb8d8u0SHUmeEuWEO6T4A+MU82s3pDYw=;
 b=IQ0eRoFbWr47mtDNPfvEJ+tfCtZ3H//TgJt6eVPELWxX5fFlPexyK1L0v0e9UvNG7tWRSX
 xyvAMU/Y5Iz+VGPCaBv9CSeG5JNgRFCgxAdv2H0L6WiUWCSSYOexkU8kDKwbwYyX980yU2
 Dyip9mGtlWBqbO75g+qQvOE2iY+idRE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-qJ3n4eeRMYi_FIsQgi_48g-1; Mon, 22 Apr 2024 11:58:16 -0400
X-MC-Unique: qJ3n4eeRMYi_FIsQgi_48g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ACF8680CDA6;
 Mon, 22 Apr 2024 15:58:15 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.184])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7062D492BC6;
 Mon, 22 Apr 2024 15:58:14 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 0/2] drm/panic: Allows to run with fbcon
Date: Mon, 22 Apr 2024 17:57:31 +0200
Message-ID: <20240422155811.83648-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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

fbcon and drm_panic cannot be built together because they both write
to the screen when a panic occurs, leading to a corrupted panic image.
With this 2 patches, drm_panic will disable the fbdev output before
writing the panic screen, so only drm_panic screen will be shown.

Jocelyn Falempe (2):
  drm/fb-helper: Add drm_fb_helper_emergency_disable
  drm/panic: Allows to run with fbcon

 drivers/gpu/drm/Kconfig         |  2 +-
 drivers/gpu/drm/drm_fb_helper.c | 17 +++++++++++++++++
 drivers/gpu/drm/drm_panic.c     |  4 ++++
 include/drm/drm_fb_helper.h     |  5 +++++
 4 files changed, 27 insertions(+), 1 deletion(-)


base-commit: 105aa4c65b76c3a344ca89a2d2dc96c84cca557f
-- 
2.44.0

