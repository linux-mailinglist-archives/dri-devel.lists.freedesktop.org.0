Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4A63A7C68
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 12:49:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD08A6E02C;
	Tue, 15 Jun 2021 10:49:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73EC06E22B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 10:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623754192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x1ren7OSMjaDh6q/6WrOJye4kFus7TOYh5vtXdd/RZc=;
 b=g0DgSjIF+EeU+it5cpFrYUdorJiWj1g4I5l1+jKjQjnslsa7ihJUuuO96nK6iTKcuU1lz2
 07I2Ia6tLGQDnudNi6IzEUe0tjODgkj1W8BFjsTrxwqvfjWFMHmAXA+PBwPs2F9YmsLrri
 tIQbv7hxhV7RwHCiychvqDr8FQflTQQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-b-Wl5m1PMUiDRtr-mHZcyw-1; Tue, 15 Jun 2021 06:49:49 -0400
X-MC-Unique: b-Wl5m1PMUiDRtr-mHZcyw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 24806947;
 Tue, 15 Jun 2021 10:49:45 +0000 (UTC)
Received: from localhost (ovpn-113-156.ams2.redhat.com [10.36.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A5EAA5D9CA;
 Tue, 15 Jun 2021 10:49:40 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@nvidia.com>, Alex
 Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>
Subject: Re: [PATCH 05/10] driver core: Export device_driver_attach()
In-Reply-To: <20210614150846.4111871-6-hch@lst.de>
Organization: Red Hat GmbH
References: <20210614150846.4111871-1-hch@lst.de>
 <20210614150846.4111871-6-hch@lst.de>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 15 Jun 2021 12:49:39 +0200
Message-ID: <87bl87xv0c.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>, Jason Herne <jjherne@linux.ibm.com>,
 kvm@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 14 2021, Christoph Hellwig <hch@lst.de> wrote:

> From: Jason Gunthorpe <jgg@nvidia.com>
>
> This is intended as a replacement API for device_bind_driver(). It has at
> least the following benefits:
>
> - Internal locking. Few of the users of device_bind_driver() follow the
>   locking rules
>
> - Calls device driver probe() internally. Notably this means that devm
>   support for probe works correctly as probe() error will call
>   devres_release_all()
>
> - struct device_driver -> dev_groups is supported
>
> - Simplified calling convention, no need to manually call probe().
>
> The general usage is for situations that already know what driver to bind
> and need to ensure the bind is synchronized with other logic. Call
> device_driver_attach() after device_add().
>
> If probe() returns a failure then this will be preserved up through to the
> error return of device_driver_attach().
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/base/base.h    | 1 -
>  drivers/base/dd.c      | 3 +++
>  include/linux/device.h | 2 ++
>  3 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

