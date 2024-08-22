Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CCE95B874
	for <lists+dri-devel@lfdr.de>; Thu, 22 Aug 2024 16:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C84A10EAEE;
	Thu, 22 Aug 2024 14:33:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Ln47OoDJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3998810EAEE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Aug 2024 14:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1724337189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TiOSeK0uV1KVkgiWm5BAMAyKVF0fbg0HQk83Zne93d8=;
 b=Ln47OoDJa8KyZZK0kdr3EgeKMM7aqdi40iMdle9sCQT8k8cymv9WhYpMwlZcTXk7l5BLjV
 UEBAOXWJBuGfRHl63sksWT5k+4MpDnX01ouRVILttJL13o7hFBzyhs0Uj8F8Arsih6E4Xa
 n8PvtBiYjDxhYe91VSy5eq0UFiCY+YY=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-484-r0P94my6NrmoCck1wVf-Ww-1; Thu,
 22 Aug 2024 10:33:05 -0400
X-MC-Unique: r0P94my6NrmoCck1wVf-Ww-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 0FF251955D4B; Thu, 22 Aug 2024 14:33:01 +0000 (UTC)
Received: from [192.168.37.1] (unknown [10.22.50.5])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E14321932D1B; Thu, 22 Aug 2024 14:32:38 +0000 (UTC)
From: Benjamin Coddington <bcodding@redhat.com>
To: Zack Rusin <zack.rusin@broadcom.com>
Cc: dri-devel@lists.freedesktop.org,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com
Subject: Re: [PATCH 0/3] Various prime/dumb buffer fixes
Date: Thu, 22 Aug 2024 10:32:36 -0400
Message-ID: <F78CFF8E-60AD-4FC7-A4A4-A9E29BDC5AA6@redhat.com>
In-Reply-To: <20240816183332.31961-1-zack.rusin@broadcom.com>
References: <20240816183332.31961-1-zack.rusin@broadcom.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

On 16 Aug 2024, at 14:32, Zack Rusin wrote:

> This is the same series I've sent out earlier but with one extra patch,
> that fixes the dumb buffer coherency on low mem systems.
>
> The second patch has also been updated to not use math functions.
>
> Zack Rusin (3):
>   drm/vmwgfx: Prevent unmapping active read buffers
>   drm/vmwgfx: Fix prime with external buffers
>   drm/vmwgfx: Disable coherent dumb buffers without 3d
>
>  drivers/gpu/drm/vmwgfx/vmwgfx_blit.c    | 114 +++++++++++++++++++++++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c      |  13 ++-
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.h      |   3 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |   4 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c    |  12 +--
>  drivers/gpu/drm/vmwgfx/vmwgfx_surface.c |   6 +-
>  6 files changed, 136 insertions(+), 16 deletions(-)
>
> -- 
> 2.43.0

I applied these three to v6.11-rc4 to fix the regression:
https://lore.kernel.org/all/0d0330f3-2ac0-4cd5-8075-7f1cbaf72a8e@heusel.eu/

Thanks for the fix! Seems to make my setup work again, so FWIW you can use my:
Tested-by: Benjamin Coddington <bcodding@redhat.com>

Ben

