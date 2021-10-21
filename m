Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8343F4360D4
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 13:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3796EB34;
	Thu, 21 Oct 2021 11:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB776EC3B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 11:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634817137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nkR+oFxKKFhfvl+Z7jaZhoo5MOuwspO0iqnEPlialBQ=;
 b=EaLDMRpXXdBvmaXxL47LmRHwghgOTmBzDfjjodzjJECzwYYBZmZUSfIcrEkwqhN4sqs2v/
 zNJsJsdusDQrMoWdUBXbzV4BXFZzN2219eN/9TKHtRaxKx/nh90NwRRKhJCMIp50L1orTQ
 BzMDeNZ9oTm0LRrNznzVDiPjyexvtzQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-OMUUkmnpMmiO8tjOKpbysg-1; Thu, 21 Oct 2021 07:52:16 -0400
X-MC-Unique: OMUUkmnpMmiO8tjOKpbysg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF4A619253C3;
 Thu, 21 Oct 2021 11:52:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.23])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 533AB13C8A;
 Thu, 21 Oct 2021 11:52:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id C668E1800796; Thu, 21 Oct 2021 13:52:12 +0200 (CEST)
Date: Thu, 21 Oct 2021 13:52:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Maksym Wezdecki <maksym.wezdecki@collabora.co.uk>
Cc: Maksym Wezdecki <maksym.wezdecki@collabora.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Subject: Re: drm/virtio: not pin pages on demand
Message-ID: <20211021115212.dk2kl2vbl6qotjwa@sirius.home.kraxel.org>
References: <20211021074445.452309-1-maksym.wezdecki@collabora.com>
 <20211021092535.ozafsijlakj7ccwc@sirius.home.kraxel.org>
 <327a5c8a-d82d-f115-27bb-37125affe24b@collabora.co.uk>
MIME-Version: 1.0
In-Reply-To: <327a5c8a-d82d-f115-27bb-37125affe24b@collabora.co.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

On Thu, Oct 21, 2021 at 11:55:47AM +0200, Maksym Wezdecki wrote:
> I get your point. However, we need to make resource_create ioctl,
> in order to create corresponding resource on the host.

That used to be the case but isn't true any more with the new
blob resources.  virglrenderer allows to create gpu objects
via execbuffer.  Those gpu objects can be linked to a
virtio-gpu resources, but it's optional.  In your case you
would do that only for your staging buffer.  The other textures
(which you fill with a host-side copy from the staging buffer)
do not need a virtio-gpu resource in the first place.

take care,
  Gerd

