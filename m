Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD2E939D5D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2024 11:16:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169B289FF7;
	Tue, 23 Jul 2024 09:16:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FK8cvxR7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D33689FF7
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2024 09:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1721726177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SgPCeK6tPhNX4oFmaz8MOcbZloQSfnOG4X0J0SvlSEc=;
 b=FK8cvxR7yynHDiHUiv9jFmZF8UWexL82ap5Cv0ny7XcHRgGdzmQ/m6BGf6UMBmrIEY+QtY
 eJvkFfTviiNjAuW1uZwSjOscIeQaKn3ARPtwas+vs0y5Oe0av3ZxNJ6/o/NaWc24MZMypl
 Oy2x1opyYJqgGMU45GVr6fTjXbJDDrA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-59-qNViNSKuNWW-bPiBLkLUzQ-1; Tue,
 23 Jul 2024 05:16:14 -0400
X-MC-Unique: qNViNSKuNWW-bPiBLkLUzQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id F01C11944A89; Tue, 23 Jul 2024 09:16:11 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.192.165])
 by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 488D21955D4A; Tue, 23 Jul 2024 09:16:07 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 0/5] drm/panic: Cleanup and add panic description
Date: Tue, 23 Jul 2024 11:11:29 +0200
Message-ID: <20240723091553.286844-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
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

This small series removes unused export symbols, moves internal include to drm_crtc_internal.h, and adds the panic description, now that kmsg_dump provides this information.

Jocelyn Falempe (5):
  drm/panic: Remove space before "!" in panic message
  drm/panic: Remove useless export symbols
  drm/panic: Move drm_panic_register prototype to drm_crtc_internal.h
  drm/panic: Move copyright notice to the top
  drm/panic: Add panic description

 drivers/gpu/drm/drm_crtc_internal.h |  4 ++++
 drivers/gpu/drm/drm_panic.c         | 27 +++++++++++++++++++++------
 include/drm/drm_panic.h             | 21 ++++++---------------
 3 files changed, 31 insertions(+), 21 deletions(-)


base-commit: f00bfaca704ca1a2c4e31501a0a7d4ee434e73a7
-- 
2.45.2

