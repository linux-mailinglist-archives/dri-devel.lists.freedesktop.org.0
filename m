Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4745A2B2990
	for <lists+dri-devel@lfdr.de>; Sat, 14 Nov 2020 01:14:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E556E888;
	Sat, 14 Nov 2020 00:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CB46E888
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 00:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605312879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=kvZEH7ONhBAnPublY2IvjbIJfZZapcurpIByzkC8xT0=;
 b=ds+kDLnNLdjNJ7q8z8dI42J20W17i+xBEmrurSdVDBXhBTj4H1F2z+Kva7BV1iMEWJvDOW
 SNu4oEJfyqVTT+nWPyhjCPbSy1BozY/PtzpxcY/iFLlKIWEi2KhxJ6QCTv/trMAuIptbcd
 onVr6uvzCkgAZ0G8wGtszAxQJXR5geE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-11-OVkQTOlZO0OXpsvuNQ1Pgw-1; Fri, 13 Nov 2020 19:14:37 -0500
X-MC-Unique: OVkQTOlZO0OXpsvuNQ1Pgw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 47F471868407
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Nov 2020 00:14:36 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-115-66.rdu2.redhat.com [10.10.115.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E8DD060C15;
 Sat, 14 Nov 2020 00:14:35 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/8] drm/nouveau: Finish atomic cleanup + fix regression
Date: Fri, 13 Nov 2020 19:14:09 -0500
Message-Id: <20201114001417.155093-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series just fixes a regression I accidentally introduced when
fixing how we find the currently set connectors for a given encoder:

09838c4efe9a ("drm/nouveau/kms: Search for encoders' connectors properly")

As well, this goes through and finishes cleaning up any references to
drm_encoder->crtc, any inappropriate references to drm_crtc->state, and
one inappropriate reference to drm_connector->state that I noticed along
the way.

Lyude Paul (8):
  drm/nouveau/kms/nv50-: Use atomic encoder callbacks everywhere
  drm/nouveau/kms/nv50-: Remove (nv_encoder->crtc) checks in ->disable
    callbacks
  drm/nouveau/kms/nv50-: Rename encoder->atomic_(enable|disable)
    callbacks
  drm/nouveau/kms/nv50-: s/armh/asyh/ in nv50_msto_atomic_enable()
  drm/nouveau/kms/nv50-: Reverse args for
    nv50_outp_get_(old|new)_connector()
  drm/nouveau/kms/nv50-: Lookup current encoder/crtc from atomic state
  drm/nouveau/kms/nv50-: Use nouveau_encoder->crtc in get_eld callback
  drm/nouveau/kms/nv50-: Fix locking for audio callbacks

 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 216 ++++++++++++----------
 drivers/gpu/drm/nouveau/nouveau_drv.h     |   1 +
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  13 +-
 3 files changed, 124 insertions(+), 106 deletions(-)

-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
