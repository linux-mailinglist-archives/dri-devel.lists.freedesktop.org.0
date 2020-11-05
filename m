Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CA32A7D1B
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 12:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CFA36E0E4;
	Thu,  5 Nov 2020 11:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40D346E0E4
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 11:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604576075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BqAyd5oPIZ6twy3M+P8m2ePirTM3ef9UMxPbSLSvBUQ=;
 b=c9sqQwPYUp6ysKxdharqItxAuALACrRKBWiRx4/J1s58pOvssFcHd+RMznfDKGd49Il6Vn
 RtTlwYWzalrIELDiEDt/D65zNPcp2C27gbpbwmxTlD0HS9xiUgLnwO2D5QxToNtI/A7ww9
 h3RD9kptyfxPW3NgWNCvuVcSOQlSvF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-2-CKDof9iRPs6yY3cC_MY5pQ-1; Thu, 05 Nov 2020 06:34:29 -0500
X-MC-Unique: CKDof9iRPs6yY3cC_MY5pQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84B22186841A;
 Thu,  5 Nov 2020 11:34:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-66.ams2.redhat.com
 [10.36.114.66])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C210C6266E;
 Thu,  5 Nov 2020 11:34:26 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id D61CE9D0F; Thu,  5 Nov 2020 12:34:25 +0100 (CET)
Date: Thu, 5 Nov 2020 12:34:25 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: [PATCH] drm/virtio: use kvmalloc for large allocations
Message-ID: <20201105113425.q45omct7eb44eraq@sirius.home.kraxel.org>
References: <20201105014744.1662226-1-senozhatsky@chromium.org>
 <20201105065233.3td3zuyfmbypjtvq@sirius.home.kraxel.org>
 <20201105070054.GD128655@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201105070054.GD128655@google.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Suleiman Souhlal <suleiman@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 04:00:54PM +0900, Sergey Senozhatsky wrote:
> Hi,
> 
> On (20/11/05 07:52), Gerd Hoffmann wrote:
> > > -	*ents = kmalloc_array(*nents, sizeof(struct virtio_gpu_mem_entry),
> > > -			      GFP_KERNEL);
> > > +	*ents = kvmalloc_array(*nents,
> > > +			       sizeof(struct virtio_gpu_mem_entry),
> > > +			       GFP_KERNEL);
> > 
> > Shouldn't that be balanced with a kvfree() elsewhere?
> 
> I think it already is. ents pointer is assigned to vbuf->data_buf,
> and free_vbuf() already uses kvfree(vbuf->data_buf) to free it.

Ah, right, we needed that before elsewhere.
Ok then, pushed to drm-misc-next.

thanks,
  Gerd

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
