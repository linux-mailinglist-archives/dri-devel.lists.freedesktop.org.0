Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0741BFFB
	for <lists+dri-devel@lfdr.de>; Wed, 29 Sep 2021 09:35:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A96636E183;
	Wed, 29 Sep 2021 07:35:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58696E183
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Sep 2021 07:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632900911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IMDI2E73qXRB3yeMEZv9xyoCJCBX2zBIBIIbMZQiNL0=;
 b=BMK2F6xCDUgtzhpAalRlL7GqA2gCc3gU9sBnrbi5DBIzalPUqzbJUe+j8V79iEKNbbH5QG
 y1qD8r4jkuoQ3dn5C2P72QifevCfhEwpvOFTVOvD4QsLJp93B/rxivn11AEAAAqOaYY2jx
 O1cHP/Ukf0BTGMtKZqGeUZT87B0Zh+s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-49-GObF8-hpPoS9TA_hLoocxA-1; Wed, 29 Sep 2021 03:33:25 -0400
X-MC-Unique: GObF8-hpPoS9TA_hLoocxA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5DB8F1966321;
 Wed, 29 Sep 2021 07:33:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E4A45D6BA;
 Wed, 29 Sep 2021 07:33:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 450821800386; Wed, 29 Sep 2021 09:33:22 +0200 (CEST)
Date: Wed, 29 Sep 2021 09:33:22 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: dri-devel@lists.freedesktop.org, virtio-dev@lists.oasis-open.org
Subject: Re: [PATCH v3 00/12] Context types, v3
Message-ID: <20210929073322.rtakdo6isjucsj25@sirius.home.kraxel.org>
References: <20210921232024.817-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20210921232024.817-1-gurchetansingh@chromium.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

> Gurchetan Singh (10):
>   virtio-gpu api: multiple context types with explicit initialization
>   drm/virtgpu api: create context init feature
>   drm/virtio: implement context init: track valid capabilities in a mask
>   drm/virtio: implement context init: track {ring_idx, emit_fence_info}
>     in virtio_gpu_fence
>   drm/virtio: implement context init: plumb {base_fence_ctx, ring_idx}
>     to virtio_gpu_fence_alloc
>   drm/virtio: implement context init: stop using drv->context when
>     creating fence
>   drm/virtio: implement context init: allocate an array of fence
>     contexts
>   drm/virtio: implement context init: handle
>     VIRTGPU_CONTEXT_PARAM_POLL_RINGS_MASK
>   drm/virtio: implement context init: add virtio_gpu_fence_event
>   drm/virtio: implement context init: advertise feature to userspace

Pushed to drm-misc-next.

thanks,
  Gerd

