Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D958C7A2B
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 18:18:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1D010E0C9;
	Thu, 16 May 2024 16:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hJDqW/TQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568D310E087
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 16:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715876285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=nPT9io/jdrbI8NweiBJuH/eKtfma0EH72wTWqmYuAM8=;
 b=hJDqW/TQEzp0249MtE4C59aMSaQeiX/Et4XYKoupXFopweB9NB1iaNsnzdKz1laQ0CQvjX
 0WnQDGcqNzeV+m7lLEuIjfwOJfubTzUt5bjpDfV7yRGOO+rxgRV784GcLWaC4R6zINBeUz
 omdj7dXfqifCVMvRN2TWYsDCvEE1NU4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-583-P0HVTvCVPHeOf6e4fqc-hQ-1; Thu,
 16 May 2024 12:17:59 -0400
X-MC-Unique: P0HVTvCVPHeOf6e4fqc-hQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E036129AB3FE;
 Thu, 16 May 2024 16:17:58 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9258DC15BB1;
 Thu, 16 May 2024 16:17:57 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 0/2] drm/mgag200: Add an option to disable Write-Combine
Date: Thu, 16 May 2024 18:17:08 +0200
Message-ID: <20240516161751.479558-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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

Unfortunately, the G200 ioburst workaround doesn't work on some servers
like Dell poweredge XR11, XR5610, or HPE XL260
In this case completely disabling WC is the only option to achieve
low-latency.
It's probably useless to maintain two workarounds for this,
so I reverted commit bfa4437fd3938 drm/mgag200: Add a workaround for low-latency
and added a new and simpler option, to just disable Write-Combine.


Jocelyn Falempe (2):
  Revert "drm/mgag200: Add a workaround for low-latency"
  drm/mgag200: Add an option to disable Write-Combine

 drivers/gpu/drm/mgag200/Kconfig        | 18 ++++++++----------
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 24 +++++++-----------------
 drivers/gpu/drm/mgag200/mgag200_mode.c |  8 --------
 3 files changed, 15 insertions(+), 35 deletions(-)


base-commit: 2c3d1bd284c5141a85188f48e7f42112e81ffcd8
-- 
2.45.0

