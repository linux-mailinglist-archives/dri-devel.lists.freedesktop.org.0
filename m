Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D3F3B19A2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 14:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D5E96E8C3;
	Wed, 23 Jun 2021 12:14:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64E136E8C3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 12:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624450440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8rzbKpDe7cnFnDItzuNwdaYlU3GisHtg5A3ii2JnpoM=;
 b=cl5nQd9cBbxQc5QVqffdrQquhC1o7NTbJ+IrAjm56sASqrzYsyWxdYBgjkZeosdzwKCc1v
 aqL/jLhFNDufRsyafpFJvS2f/PdzMdqqZgUshU/fKAtNTCBTnq8K7DyGx1Wd9o+/TC1OOi
 5qbG4vDaZxY59/YnXr2E8qAwr2RQ3M8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-XhnrZbYaPUaaI0I0gx71PA-1; Wed, 23 Jun 2021 08:13:57 -0400
X-MC-Unique: XhnrZbYaPUaaI0I0gx71PA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7561E19251AC;
 Wed, 23 Jun 2021 12:13:56 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-38.ams2.redhat.com
 [10.36.112.38])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A3DB1000324;
 Wed, 23 Jun 2021 12:13:56 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 77C7C180060E; Wed, 23 Jun 2021 14:13:54 +0200 (CEST)
Date: Wed, 23 Jun 2021 14:13:54 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v1 0/3] drm/virtio: Add a default synchronization
 mechanism for blobs
Message-ID: <20210623121354.raajeo2fy6lj7gcx@sirius.home.kraxel.org>
References: <20210610232456.671905-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210610232456.671905-1-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Dongwon Kim <dongwon.kim@intel.com>, dri-devel@lists.freedesktop.org,
 Tina Zhang <tina.zhang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 04:24:53PM -0700, Vivek Kasireddy wrote:
> This 3 patch series is the counterpart for this other series:
> https://lists.nongnu.org/archive/html/qemu-devel/2021-06/msg02906.html
> 
> It makes it possible for the Guest to wait until the Host has 
> completely consumed its FB before reusing it again thereby ensuring
> that both the parties don't access it at the same time.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Dongwon Kim <dongwon.kim@intel.com>
> Cc: Tina Zhang <tina.zhang@intel.com>
> 
> Vivek Kasireddy (3):
>   drm/virtio: Add fences for Guest blobs
>   drm/virtio: Prepare resource_flush to accept a fence
>   drm/virtio: Add the fence in resource_flush if present

Pushed to drm-misc-next.

thanks,
  Gerd

