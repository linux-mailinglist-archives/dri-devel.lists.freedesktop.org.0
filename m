Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C269622CB9D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 19:05:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A63616E0C1;
	Fri, 24 Jul 2020 17:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B4BC6E0C1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jul 2020 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595610307;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EkhpS3wqaNXO4cxa/b8xv7UQUnqRm4iM9Bn4hHqzUoE=;
 b=DhkRzNfm0iSeyW9Bjgig/ttBgbO/aT+lmlgnioJRHAb9keoU/ZUHRNW0ff7y58U8XlSe0G
 6F4HWGDr1ZeAm1fhUjGSB8VuBrUezWQmeuTcfRL3FofY6L3ryMmrxVTMFDjcZ241XGcsJw
 bIxGkU3TUZ01CwdBA3QzKhi3WpunnuA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-332-UiscuXF7NBy_TGDG_1_okA-1; Fri, 24 Jul 2020 13:05:04 -0400
X-MC-Unique: UiscuXF7NBy_TGDG_1_okA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D311B800597;
 Fri, 24 Jul 2020 17:05:03 +0000 (UTC)
Received: from Whitewolf.redhat.com (ovpn-119-175.rdu2.redhat.com
 [10.10.119.175])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 17D7869332;
 Fri, 24 Jul 2020 17:05:03 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/probe_helper,
 drm/nouveau: Validate MST modes against PBN
Date: Fri, 24 Jul 2020 13:04:55 -0400
Message-Id: <20200724170457.711072-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that we've added the hooks that we've needed for this and used them
in i915, let's add one more hook (which I could use some feedback on,
I'm not sure if it's worth maybe just reworking how we do mode pruning
in nouveau instead...) and start using this in our mst ->mode_valid
callback to filter out impossible to set modes on MST connectors.

Lyude Paul (2):
  drm/probe_helper: Add drm_connector_helper_funcs->get_modes_ctx()
  drm/nouveau/kms/nv50-: Check MST display modes against available PBN

 drivers/gpu/drm/drm_probe_helper.c          | 11 +++++-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 41 ++++++++++++++------
 drivers/gpu/drm/nouveau/nouveau_connector.c | 24 ++++++++++--
 drivers/gpu/drm/nouveau/nouveau_connector.h |  4 +-
 include/drm/drm_modeset_helper_vtables.h    | 42 +++++++++++++++++++++
 5 files changed, 104 insertions(+), 18 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
