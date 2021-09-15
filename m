Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B406D40BF6B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 07:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BBD6E8CF;
	Wed, 15 Sep 2021 05:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C486E8CF
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 05:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631685234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PCL5txqMuv/TNtH3fCb2903jsrgfnFQwKwAFn7w7nk0=;
 b=JPBbEmJoQUzeUuuL2QqckdN4KINdEokAoxtTKBITjw/QJ5FWWEcLLoO/cXG9lrgPx4KIyF
 kjdakUNaGX/ju2e6lRZvv9jLMXX+Fb5zwX1ABY9BWSrgMVzG4IofY2MoEy465pehL4Y254
 ImYtNyrRTxYSYLO6tYZCE7nQFUI/bD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-244-vhkas9gjMieGmYiBaKTFRQ-1; Wed, 15 Sep 2021 01:53:53 -0400
X-MC-Unique: vhkas9gjMieGmYiBaKTFRQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74543800FF4;
 Wed, 15 Sep 2021 05:53:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 395887A5CE;
 Wed, 15 Sep 2021 05:53:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8731418003BF; Wed, 15 Sep 2021 07:53:50 +0200 (CEST)
Date: Wed, 15 Sep 2021 07:53:50 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: dri-devel@lists.freedesktop.org, virtio-dev@lists.oasis-open.org
Subject: Re: [PATCH v1 08/12] drm/virtio: implement context init: stop using
 drv->context when creating fence
Message-ID: <20210915055350.sgfadzktcl5bngtq@sirius.home.kraxel.org>
References: <20210909013717.861-1-gurchetansingh@chromium.org>
 <20210909013717.861-9-gurchetansingh@chromium.org>
MIME-Version: 1.0
In-Reply-To: <20210909013717.861-9-gurchetansingh@chromium.org>
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

On Wed, Sep 08, 2021 at 06:37:13PM -0700, Gurchetan Singh wrote:
> The plumbing is all here to do this.  Since we always use the
> default fence context when allocating a fence, this makes no
> functional difference.
> 
> We can't process just the largest fence id anymore, since it's
> it's associated with different timelines.  It's fine for fence_id
> 260 to signal before 259.  As such, process each fence_id
> individually.

I guess you need to also update virtio_gpu_fence_event_process()
then?  It currently has the strict ordering logic baked in ...

take care,
  Gerd

