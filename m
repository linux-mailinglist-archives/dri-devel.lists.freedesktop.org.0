Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ED11D2FB0
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 14:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82526E357;
	Thu, 14 May 2020 12:28:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CDD6E357
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:28:56 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h17so3791798wrc.8
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=MhSXdQmfGHknlE+HXPCeR7P0ZV8ATRBftwFVeEaaAyc=;
 b=Y7Vf7sChBCU2rfY8xBEExV0I7QnH8MFNWEbOMktjW3Gqlslx3DnyxK4la9SJtQSxKI
 qA++/9v8+v5pkkRVDBpP4CdBvWBlirOOedPFWd8Aq1yzrLg/tcnPNWRJcRikJ/+OFVkM
 VlrAr49vd56PtJvX3vY9cjGnsRty23kLF2Xlo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=MhSXdQmfGHknlE+HXPCeR7P0ZV8ATRBftwFVeEaaAyc=;
 b=aKBqVmEOUlWN6oSHzDeehczJynMpnG2vnE3vMD3X+cYnSAk6SkQqkk6+HxrxXv3Yuh
 67vRf9StlLvOiuL3nKefx+LrFiAvT3rKHPGi8TPaUNiv8Cq9dpE7ry9dwYwAguY1j+DX
 mBmOUYeO/HVIK2j8mYB6KRArfiFbGtXNyYkmR2ZjwMal207vm4EHRT2VMMNWUgX4K2q4
 b1cF42HaJ0H286odUaELOl5IaAQD8texG8M6jfCB4SxeZUabviInUHpXCAKAcMQhcnxu
 upvIdSmBQNUNGTykUoMhBRQt9lKTu0+RvgpJ7XwhbzT7vqRPVjxscbiOMSeg4xS47ww0
 kEWg==
X-Gm-Message-State: AOAM531qdPiWXELVUsbENgJLdkWU2WMQK0HPOVS7TuzVuDFSZnQQOgy0
 YvToNkT18reCu5wp8Wy0YJM50Q==
X-Google-Smtp-Source: ABdhPJyi0dv4TvrSEI6BLeM7V23XeYGER8KAK6n/kWqLKYuPlyYwM4QLzJwBgLkyP3bhqCn4hd3iBw==
X-Received: by 2002:adf:f38b:: with SMTP id m11mr5136675wro.65.1589459334793; 
 Thu, 14 May 2020 05:28:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b2sm4451847wrm.30.2020.05.14.05.28.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:28:53 -0700 (PDT)
Date: Thu, 14 May 2020 14:28:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v3 1/4] dma-buf: add support for virtio exported objects
Message-ID: <20200514122851.GO206103@phenom.ffwll.local>
Mail-Followup-To: David Stevens <stevensd@chromium.org>,
 Tomasz Figa <tfiga@chromium.org>, Gerd Hoffmann <kraxel@redhat.com>,
 David Airlie <airlied@linux.ie>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "open list:VIRTIO CORE, NET..." <virtualization@lists.linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 virtio-dev@lists.oasis-open.org
References: <20200311112004.47138-1-stevensd@chromium.org>
 <20200311112004.47138-2-stevensd@chromium.org>
 <CAKMK7uHFgiHLe9oiFBr-VR-6rU9-hLTpBTEVNh0ezyj54u70jw@mail.gmail.com>
 <CAD=HUj6d9gdZegTGad6thKdHv5b+qOZnkCv5VcWo9AcHifR9uA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=HUj6d9gdZegTGad6thKdHv5b+qOZnkCv5VcWo9AcHifR9uA@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 virtio-dev@lists.oasis-open.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "Michael S . Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Jason Wang <jasowang@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "open list:VIRTIO CORE,
 NET..." <virtualization@lists.linux-foundation.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 11:08:52AM +0900, David Stevens wrote:
> On Thu, May 14, 2020 at 12:45 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, Mar 11, 2020 at 12:20 PM David Stevens <stevensd@chromium.org> wrote:
> > >
> > > This change adds a new dma-buf operation that allows dma-bufs to be used
> > > by virtio drivers to share exported objects. The new operation allows
> > > the importing driver to query the exporting driver for the UUID which
> > > identifies the underlying exported object.
> > >
> > > Signed-off-by: David Stevens <stevensd@chromium.org>
> >
> > Adding Tomasz Figa, I've discussed this with him at elce last year I
> > think. Just to make sure.
> >
> > Bunch of things:
> > - obviously we need the users of this in a few drivers, can't really
> > review anything stand-alone
> 
> Here is a link to the usage of this feature by the currently under
> development virtio-video driver:
> https://markmail.org/thread/j4xlqaaim266qpks
> 
> > - adding very specific ops to the generic interface is rather awkward,
> > eventually everyone wants that and we end up in a mess. I think the
> > best solution here would be if we create a struct virtio_dma_buf which
> > subclasses dma-buf, add a (hopefully safe) runtime upcasting
> > functions, and then a virtio_dma_buf_get_uuid() function. Just storing
> > the uuid should be doable (assuming this doesn't change during the
> > lifetime of the buffer), so no need for a callback.
> 
> So you would prefer a solution similar to the original version of this
> patchset? https://markmail.org/message/z7if4u56q5fmaok4

yup.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
