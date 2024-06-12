Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C0A904A17
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 06:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C4E10E77D;
	Wed, 12 Jun 2024 04:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZqExVpDk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com
 [209.85.160.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4239110E77D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 04:37:53 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-254c22faf4cso1299321fac.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jun 2024 21:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718167072; x=1718771872;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DkRmaXYdVwSedvVUVG2r+hTZqVuOSK1T8k/kpQ+eeNI=;
 b=ZqExVpDkmGT1NoOPcmXdu7s5/yktKU8GaHXgv9s+idUijbiUjPfexT3C0Z2QLirLn9
 mHkNe+0ozvm1xNHOMiHSz/K02+0r8d456Wu0Irv5+QGyLCc17o3A5M7Tn9lRl1Slw521
 bZCaTM4MlEpVKSC/xPlv2aV9ovHrGOq+ne8/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718167072; x=1718771872;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DkRmaXYdVwSedvVUVG2r+hTZqVuOSK1T8k/kpQ+eeNI=;
 b=unituDeroVRDJW7NyQDZh520yITHtlMr0dr0eMBmdymflvwlp0sUWxaGq/4swzzSpJ
 mB4blQMAgvHvVQ+JgZwZGs9bJ473EksNMPPZriOeC8d25dZK1qJ/NJ5R8fBY76M6fSRd
 UTlQNd9iocLMQKPaQy0lM/fN8XhDpfmFbgCbL85yAeQsKvlYaIUUc6CKXmQ+H/ixOjpl
 Nk9qtQ0IWsOl2OnGPPMvnR7TcA7O6RTVAK7MkCTumRqv2fpB6BeO1+tweTZr57KxDQ1/
 4FPHtT+X/LmLKS5YGtHReTPtWaUHHfdlBb8kOwJWzRL5pwPlXOLV3OZDulJ1pA+Y3C8L
 aHhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhVEkyhvY0Pik7zIjTlmWa5klu+NW1mEkIIj+AKI9VrMBRKb9zpcUFdf2QUWeC0N+yPmgxJiVN+U2CO1O3kRAPEKvmt3X6bn49JqE6qJ0V
X-Gm-Message-State: AOJu0YyTEAt8BDXfJTbLgyimvz85IoqpTit/omixu/gn2U7fpisQhq74
 Qg3HwJwKLmsGV2F80EeyjTHVFFSJafkXC7/9DAEHdRCUx3bdGigN68monu4DFA==
X-Google-Smtp-Source: AGHT+IG7f6MklQ9uaEK4A66ROk94t0wNZGlsKVegXA6Omzsq6FR8KOS6Vlm+0Pwr/7yo2CTKXViBuw==
X-Received: by 2002:a05:6870:f112:b0:250:7a43:aefd with SMTP id
 586e51a60fabf-25514b4e1a3mr793220fac.2.1718167072112; 
 Tue, 11 Jun 2024 21:37:52 -0700 (PDT)
Received: from chromium.org (174.71.80.34.bc.googleusercontent.com.
 [34.80.71.174]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7042a10c359sm6519597b3a.183.2024.06.11.21.37.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jun 2024 21:37:51 -0700 (PDT)
Date: Wed, 12 Jun 2024 13:37:46 +0900
From: Tomasz Figa <tfiga@chromium.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Yunfei Dong <yunfei.dong@mediatek.com>, 
 Jeffrey Kardatzke <jkardatzke@google.com>, 
 =?utf-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4=?= Prado <nfraprado@collabora.com>,
 Nathan Hebert <nhebert@chromium.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Yong Wu <yong.wu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>, 
 Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
 "T . J . Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v6,04/24] v4l: add documentation for restricted memory flag
Message-ID: <bhgv5djcjc4yt75pyug2yirrymeucjyslthnvq6k2kpp7axfph@jzo5wpcbgwun>
References: <20240516122102.16379-1-yunfei.dong@mediatek.com>
 <20240516122102.16379-5-yunfei.dong@mediatek.com>
 <20240522111622.GA31185@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240522111622.GA31185@pendragon.ideasonboard.com>
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

On Wed, May 22, 2024 at 02:16:22PM +0300, Laurent Pinchart wrote:
> Hi Jefrey,
> 
> Thank you for the patch.
> 
> On Thu, May 16, 2024 at 08:20:42PM +0800, Yunfei Dong wrote:
> > From: Jeffrey Kardatzke <jkardatzke@google.com>
> > 
> > Adds documentation for V4L2_MEMORY_FLAG_RESTRICTED.
> > 
> > Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >  Documentation/userspace-api/media/v4l/buffer.rst | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/userspace-api/media/v4l/buffer.rst b/Documentation/userspace-api/media/v4l/buffer.rst
> > index 52bbee81c080..807e43bfed2b 100644
> > --- a/Documentation/userspace-api/media/v4l/buffer.rst
> > +++ b/Documentation/userspace-api/media/v4l/buffer.rst
> > @@ -696,7 +696,7 @@ enum v4l2_memory
> >  
> >  .. _memory-flags:
> >  
> > -Memory Consistency Flags
> > +Memory Flags
> >  ------------------------
> >  
> >  .. raw:: latex
> > @@ -728,6 +728,14 @@ Memory Consistency Flags
> >  	only if the buffer is used for :ref:`memory mapping <mmap>` I/O and the
> >  	queue reports the :ref:`V4L2_BUF_CAP_SUPPORTS_MMAP_CACHE_HINTS
> >  	<V4L2-BUF-CAP-SUPPORTS-MMAP-CACHE-HINTS>` capability.
> > +    * .. _`V4L2-MEMORY-FLAG-RESTRICTED`:
> > +
> > +      - ``V4L2_MEMORY_FLAG_RESTRICTED``
> > +      - 0x00000002
> > +      - The queued buffers are expected to be in restricted memory. If not, an
> > +	error will be returned. This flag can only be used with ``V4L2_MEMORY_DMABUF``.
> > +	Typically restricted buffers are allocated using a restricted dma-heap. This flag
> > +	can only be specified if the ``V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM`` is set.
> 
> Why is this flag needed ? Given that the usage model requires the V4L2
> device to be a dma buf importer, why would userspace set the
> V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag and pass a non-restricted
> buffer to the device ?

Given that the flag is specified at REQBUF / CREATE_BUFS time, it's
actually useful to tell the driver the queue is operating in restricted
(aka secure) mode.

I suppose we could handle that at the time of a first QBUF, but that
would make the driver initialization and validation quite a bit of pain.
So I'd say that the design being proposed here makes things simpler and
more clear, even if it doesn't add any extra functionality.

> 
> The V4L2_BUF_CAP_SUPPORTS_RESTRICTED_MEM flag also needs to be
> documented in the relevant section, I don't think that's done in this
> series.
> 

+1

Best regards,
Tomasz

> >  
> >  .. raw:: latex
> >  
> 
> -- 
> Regards,
> 
> Laurent Pinchart
