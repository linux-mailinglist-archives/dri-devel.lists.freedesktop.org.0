Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E30A8C890A
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 17:11:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2677610E33C;
	Fri, 17 May 2024 15:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WjwFfok4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4489D10E33C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2024 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715958666;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=f8/zRx5HNIb97Sx2MnHqDwXMzX5zxF/9jp4XLplFOok=;
 b=WjwFfok4PggSd/dGaubymCxOEzk4bb97ZRX26jt0kaW227CZD+xsxG/i0/TEcz1sVUwMbg
 HvcfU/Om32dMqVp461gjIFkjwcx4nn5ZnMfhvcxfj4uomhZO0CqBXScCWQtvOOTTF8aPyt
 I1d7ilvynpisyVteZfRfqvOZmMMp1R8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-178-DpgRHqcYPuKi3jU3rBLAjQ-1; Fri,
 17 May 2024 11:11:02 -0400
X-MC-Unique: DpgRHqcYPuKi3jU3rBLAjQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 628C83C0C2C3;
 Fri, 17 May 2024 15:11:02 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24A44491032;
 Fri, 17 May 2024 15:11:01 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH v2 0/2] drm/mgag200: Add an option to disable Write-Combine
Date: Fri, 17 May 2024 17:09:56 +0200
Message-ID: <20240517151050.624797-1-jfalempe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
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
 drivers/gpu/drm/mgag200/mgag200_drv.c  | 23 ++++++-----------------
 drivers/gpu/drm/mgag200/mgag200_mode.c |  8 --------
 3 files changed, 14 insertions(+), 35 deletions(-)


base-commit: 3179338750d83877bbc491493032bdf192266ad9
-- 
2.45.0

