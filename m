Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A634836CF5
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 18:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC1710E652;
	Mon, 22 Jan 2024 17:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 036BA10E68A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 17:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705944090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=YRefZ/wsrn6xc/POzLXdqCo2wo2k5mzHvh76/txm/d0=;
 b=LWlMLnwMyJwS7MqRBa7vRuV+F/sUSI2qCNet1OqM8Zd+jVjYdDdmKnMz9AaAOJOp0j+r+7
 h5DetVj20hiCdigFWgYY5zcSPSn1RKl8W7KGqgq3mJcLspEzjLMuH80Z411hvkmjYx85vk
 ufv73FuJ+zl3/zs5UVTRWGUROkWo7lw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-HDr-DmkRM0ymMmHIgC6W3g-1; Mon, 22 Jan 2024 12:21:27 -0500
X-MC-Unique: HDr-DmkRM0ymMmHIgC6W3g-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E397185A783;
 Mon, 22 Jan 2024 17:21:26 +0000 (UTC)
Received: from hydra.redhat.com (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8DE8840C1430;
 Mon, 22 Jan 2024 17:21:25 +0000 (UTC)
From: Jocelyn Falempe <jfalempe@redhat.com>
To: zack.rusin@broadcom.com, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/vmwgfx backport two fixes to v6.1.x branch
Date: Mon, 22 Jan 2024 18:10:11 +0100
Message-ID: <20240122172031.243604-1-jfalempe@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I've backported this two commits:
f9e96bf19054 drm/vmwgfx: Fix possible invalid drm gem put calls
91398b413d03 drm/vmwgfx: Keep a gem reference to user bos in surfaces

They both fixes a950b989ea29 ("drm/vmwgfx: Do not drop the reference
to the handle too soon")
which has been backported to v6.1.x branch as 0a127ac97240

There was a lot of conflicts, and as I'm not familiar with the vmwgfx
driver, it's better to review and test them.
I've run a short test, and it worked, but that's certainly not enough.

Thanks,

Zack Rusin (2):
  drm/vmwgfx: Fix possible invalid drm gem put calls
  drm/vmwgfx: Keep a gem reference to user bos in surfaces

 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c       |  7 ++----
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c  |  8 +++----
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.h      | 20 ++++++++++++++++++
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c  | 12 +++++------
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c      | 24 ++++++++++++++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c      | 10 ++++-----
 drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c  |  3 +--
 drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 18 ++++++++--------
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c   |  5 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c  | 27 +++++++-----------------
 10 files changed, 75 insertions(+), 59 deletions(-)


base-commit: fec3b1451d5febbc9e04250f879c10f8952e6bed
-- 
2.43.0

