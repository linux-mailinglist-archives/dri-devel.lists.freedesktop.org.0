Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EF31F15BB
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jun 2020 11:43:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E6EB89CB2;
	Mon,  8 Jun 2020 09:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E8989CB2
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jun 2020 09:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591609415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=U5U6dQ9lCe7itmDsGxNs3cBdub7pl5VNIW2XNh4JFS0=;
 b=in4Xqh0bprheN2mejL2opuVWZslUMYnP4BSpYhfMy4+JwIkqhOGH4GpDoKXhwMr2Mo7q6u
 HBuqojjgHTu0dmIqcerwrxafsn+FAbejl86wKUNa75UrNkT0i0cLuh/fHp0xwA31D3w7UU
 VeGJjFyE2msRwUfW5FXaWtry/N6W2/8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-440-_JMA2NtoO3i10vgxYD82tA-1; Mon, 08 Jun 2020 05:43:32 -0400
X-MC-Unique: _JMA2NtoO3i10vgxYD82tA-1
Received: by mail-wr1-f71.google.com with SMTP id a4so6919318wrp.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jun 2020 02:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=U5U6dQ9lCe7itmDsGxNs3cBdub7pl5VNIW2XNh4JFS0=;
 b=EIvavyWqd46gFgVbnXIaAA9Kyigk/u+EC8zB1Wd3UaAPCL0a+y8b/kEFO9OZqBH9xE
 BFH7wrktH3zODZ35L2d3lixlcych945OJptNxDzarjA3nFUv2+KqinXWqqsfTiWz9Foj
 eeLuuKOhyfkg5Geh06wrAipQQzS/KA8o0RD5OkPIQEqX/naMmUYZQmBYexguH9yWTv7J
 qLu9wspxTQSqVpTjVLQOjwQnk2o7SX+qxA0xwY2BPQunZ8pEJtiCx4e0W6HDBuMBF/ty
 USWsZy3N773HJFuus8PkVYVQ7aLVosMvTzTlSMXQ9veqkJVOEHsh71BS786K7GSjuz1L
 aVdA==
X-Gm-Message-State: AOAM531XnlDq7MkXxHMzduSlBd2SrU/zb6ZDoFuIK7ytpBnE+IR/HVkb
 jpm0+Xh5eMULVvshLn2lW4vo1eKQwq8JgOAPIgAF1hj9xhrhdwRA2s4tW5o9iL78IPa9+w7jMsJ
 DwJKMOiztPHTzMv65Q3lYokfEl6u6
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr15017564wmc.1.1591609411311; 
 Mon, 08 Jun 2020 02:43:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9ub5wP+xupLuBkOQ4No1b88FQ9dkWFcatrNsLpDTfEgifdZsj9YIaaEa0/E6d/CL6f3lWtw==
X-Received: by 2002:a1c:7c0e:: with SMTP id x14mr15017554wmc.1.1591609411160; 
 Mon, 08 Jun 2020 02:43:31 -0700 (PDT)
Received: from redhat.com (bzq-109-64-41-91.red.bezeqint.net. [109.64.41.91])
 by smtp.gmail.com with ESMTPSA id
 u9sm18951734wme.16.2020.06.08.02.43.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2020 02:43:30 -0700 (PDT)
Date: Mon, 8 Jun 2020 05:43:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v3 4/4] drm/virtio: Support virtgpu exported resources
Message-ID: <20200608054234-mutt-send-email-mst@kernel.org>
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-5-stevensd@chromium.org>
 <20200513123326-mutt-send-email-mst@kernel.org>
 <CAD=HUj5qcMLw__LfJizR6nzCR9Qmu21Sjk3i0j_8+=rxt1Hk=w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAD=HUj5qcMLw__LfJizR6nzCR9Qmu21Sjk3i0j_8+=rxt1Hk=w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Jason Wang <jasowang@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:VIRTIO GPU DRIVER" <virtualization@lists.linux-foundation.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 04:26:15PM +0900, David Stevens wrote:
> > > +     if (virtio_has_feature(vgdev->vdev, VIRTIO_GPU_F_RESOURCE_UUID)) {
> > > +             vgdev->has_resource_assign_uuid = true;
> > > +     }
> >
> >
> > Just a question: this relies on DMA bufs so I assume it is
> > not really assumed to work when DMA API is bypassed, right?
> > Rather than worry what does it mean, how about just
> > disabling  this feature without PLATFORM_DMA for now?
> 
> By PLATFORM_DMA, do you mean CONFIG_DMA_SHARED_BUFFER?

Sorry, no. I mean VIRTIO_F_IOMMU_PLATFORM which in the
future will be renamed to VIRTIO_F_PLATFORM_ACCESS.


> Virtio-gpu
> depends on DRM, which selects that feature. So I think DMA bufs should
> always be available when virtio-gpu is present.
> 
> -David

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
