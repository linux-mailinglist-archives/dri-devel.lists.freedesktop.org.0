Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8D3226EB4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 21:07:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E1C789AB2;
	Mon, 20 Jul 2020 19:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38E689BFB
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 19:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595272072;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=uj3loFmci8XBM54oh8PaZfRJfl27CApGXWlYN3XNtq0=;
 b=V2AVv6z/V7wDBfRBG+r47zJwCv8Hbk1XljYYGDTB2HeaWxZiJ2JLF5epql3+90BtelEyey
 5OyLjxJz2HeLtycIuc4cHBRWluzCL9xyZ6YaNNeLbyLXmbb1kZGLE7zjPM9SeTiRLUmRkW
 dvPbPaPNSZUaecTKslrjfPT4MVLSwwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-ZsZxPAYgNsODsmwGAy8ALw-1; Mon, 20 Jul 2020 15:07:44 -0400
X-MC-Unique: ZsZxPAYgNsODsmwGAy8ALw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 381BB80183C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 19:07:43 +0000 (UTC)
Received: from Ruby.redhat.com (ovpn-120-196.rdu2.redhat.com [10.10.120.196])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D07E05C1D4;
 Mon, 20 Jul 2020 19:07:42 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/vblank: Cleanup spin_(un)lock_irqsave() calls
Date: Mon, 20 Jul 2020 15:07:31 -0400
Message-Id: <20200720190736.180297-1-lyude@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a follow-up series for finishing the work that we started here:

https://patchwork.freedesktop.org/patch/373107/?series=74805&rev=8

tl;dr many of the drm_vblank functions only get called within
irq-enabled contexts, so we go through those and convert them over to
using spin_(un)lock_irq() to make this fact more obvious in case we need
to add more blocking calls to any of these functions in the future.

Lyude Paul (5):
  drm/vblank: Use spin_(un)lock_irq() in drm_crtc_vblank_reset()
  drm/vblank: Use spin_(un)lock_irq() in drm_crtc_vblank_on()
  drm/vblank: Use spin_(un)lock_irq() in
    drm_legacy_vblank_post_modeset()
  drm/vblank: Use spin_(un)lock_irq() in drm_queue_vblank_event()
  drm/vblank: Use spin_(un)lock_irq() in drm_crtc_queue_sequence_ioctl()

 drivers/gpu/drm/drm_vblank.c | 29 ++++++++++++-----------------
 1 file changed, 12 insertions(+), 17 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
