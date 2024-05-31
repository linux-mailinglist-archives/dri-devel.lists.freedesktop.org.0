Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D028D5C5A
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 10:08:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E65B10E9E8;
	Fri, 31 May 2024 08:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MOhGKeXK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF49113570
 for <dri-devel@lists.freedesktop.org>; Fri, 31 May 2024 08:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1717142901;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=TGzLV4qefUPPF7AvP1/VofHubizdtlATUElE+VBq9z8=;
 b=MOhGKeXK9T82NWNg70fhEUh22mWfOPwvAz/TWKIzzqD8xt2m8vCGe4hWn/bkHb/SZKmbBa
 GODNTHPhi4VmVFtk9mq/sxCvHjmCws1P2p1WQwEmeLu6RRSG1RyEDWMjKU2mr1WQETIitW
 wJiN3EPlLiO1FD0+0HP5LFZ2bvqKE38=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-271-TULJXnNLOfOxHGjBRZzorA-1; Fri, 31 May 2024 04:08:18 -0400
X-MC-Unique: TULJXnNLOfOxHGjBRZzorA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C6CA2800169;
 Fri, 31 May 2024 08:08:17 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.193.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 31C3940EF8B;
 Fri, 31 May 2024 08:08:16 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Subject: [PATCH 0/3] drm/panic: Add a kmsg dump screen
Date: Fri, 31 May 2024 10:06:31 +0200
Message-ID: <20240531080750.765982-1-jfalempe@redhat.com>
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

Add a kmsg dump option, which will display the last lines of kmsg,
and should be similar to fbcon.
Add a Kconfig choice for the panic screen, so that the user can
choose between this new kmsg dump, or the userfriendly option.

Patch 1-2 are the same as https://patchwork.freedesktop.org/series/133963/
and are here to avoid conflicts.

Jocelyn Falempe (3):
  drm/panic: only draw the foreground color in drm_panic_blit()
  drm/panic: Add a set_pixel() callback to drm_scanout_buffer
  drm/panic: Add a kmsg dump screen

 drivers/gpu/drm/Kconfig     |  21 +++
 drivers/gpu/drm/drm_panic.c | 322 +++++++++++++++++++++++-------------
 include/drm/drm_panic.h     |   9 +
 3 files changed, 241 insertions(+), 111 deletions(-)


base-commit: 86266829ea755f737762ebda614c59b136c8feac
-- 
2.45.1

