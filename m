Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDB6BC9045
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 14:30:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31DE210EA08;
	Thu,  9 Oct 2025 12:30:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dBrJn10o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B827810EA08
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760013021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=yfXby9RG/E2bm8lZbmljaLyZVcFvDDfxPZJ7gYNKWp8=;
 b=dBrJn10o6IBUoNyAdLSe2yqk1OQg6cni6036f9P8XQxrYornps9vD20jFd4x7SfJidhK7r
 m7z+CDaYyBi2GxTjiljJSA1oXrGC0XhTb5Bg1fYvT09sX0KL1xzPcPJ3fTzOsAZZeEHydS
 AuqIIR5g7lD6SSs42h5BmozVedCSODY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-221-0AGHXA23Ona6NSfcX5mCaw-1; Thu,
 09 Oct 2025 08:30:15 -0400
X-MC-Unique: 0AGHXA23Ona6NSfcX5mCaw-1
X-Mimecast-MFC-AGG-ID: 0AGHXA23Ona6NSfcX5mCaw_1760013013
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B1F001800294; Thu,  9 Oct 2025 12:30:13 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.45.225.212])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2C6BC1800578; Thu,  9 Oct 2025 12:30:09 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jocelyn Falempe <jfalempe@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org
Subject: [PATCH 0/6] drm/panic: Fixes found with kunit.
Date: Thu,  9 Oct 2025 14:24:47 +0200
Message-ID: <20251009122955.562888-1-jfalempe@redhat.com>
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

A few fixes for drm panic, that I found when writing unit tests with kunit.

Jocelyn Falempe (6):
  drm/panic: Fix drawing the logo on a small narrow screen
  drm/panic: Fix overlap between qr code and logo
  drm/panic: Fix qr_code, ensure vmargin is positive
  drm/panic: Fix kmsg text drawing rectangle
  drm/panic: Fix divide by 0 if the screen width < font width
  drm/panic: Fix 24bit pixel crossing page boundaries

 drivers/gpu/drm/drm_panic.c | 60 +++++++++++++++++++++++++++++++++----
 1 file changed, 54 insertions(+), 6 deletions(-)


base-commit: e4bea919584ff292c9156cf7d641a2ab3cbe27b0
-- 
2.51.0

