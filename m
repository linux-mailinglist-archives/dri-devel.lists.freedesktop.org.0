Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 012703A81B3
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 16:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB1488AD9;
	Tue, 15 Jun 2021 14:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0331988AD9
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 14:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623765825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kLMUNwIYFZdrtc2NmHvIqgVHyZsoQim6Z5rwLBywteg=;
 b=i13smERRoqIIUARzcnZCsZjXjWyC7xA40eqEloJrnhq2qqXyriLWuxedxguzKTtB2zCh1c
 XW6qCaDCa4r44JqRYQAQfFJ+e14mdXCSyEoXsbMz2QJH4DIJArSXJNi2/wBsNtWZGdwKss
 9N8EJVBTQrzxJuV9GT+t4FIuxNDZ9e0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-V1Sr6BHiOI64oEIdkGxxcg-1; Tue, 15 Jun 2021 10:03:41 -0400
X-MC-Unique: V1Sr6BHiOI64oEIdkGxxcg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E32AD101F7D0;
 Tue, 15 Jun 2021 14:03:32 +0000 (UTC)
Received: from localhost (ovpn-113-156.ams2.redhat.com [10.36.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D721318B4B;
 Tue, 15 Jun 2021 14:03:28 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jason Gunthorpe <jgg@nvidia.com>, Alex
 Williamson <alex.williamson@redhat.com>, Kirti Wankhede
 <kwankhede@nvidia.com>
Subject: Re: [PATCH 04/10] driver core: Don't return EPROBE_DEFER to
 userspace during sysfs bind
In-Reply-To: <20210615133519.754763-5-hch@lst.de>
Organization: Red Hat GmbH
References: <20210615133519.754763-1-hch@lst.de>
 <20210615133519.754763-5-hch@lst.de>
User-Agent: Notmuch/0.32.1 (https://notmuchmail.org)
Date: Tue, 15 Jun 2021 16:03:27 +0200
Message-ID: <87zgvrw7gw.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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

On Tue, Jun 15 2021, Christoph Hellwig <hch@lst.de> wrote:

> EPROBE_DEFER is an internal kernel error code and it should not be leaked
> to userspace via the bind_store() sysfs. Userspace doesn't have this
> constant and cannot understand it.
>
> Further, it doesn't really make sense to have userspace trigger a deferred
> probe via bind_store(), which could eventually succeed, while
> simultaneously returning an error back.
>
> Resolve this by splitting driver_probe_device so that the version used
> by the sysfs binding that turns EPROBE_DEFER into -EAGAIN, while the one
> used for internally binding keeps the error code, and calls
> driver_deferred_probe_add where needed.  This also allows to nicely split
> out the defer_all_probes / probe_count checks so that they actually allow
> for full device_{block,unblock}_probing protection while not bothering
> the sysfs bind case.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/base/dd.c | 78 +++++++++++++++++++++++++----------------------
>  1 file changed, 42 insertions(+), 36 deletions(-)
>

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

