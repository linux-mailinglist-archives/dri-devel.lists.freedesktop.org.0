Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3C5A24117
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 17:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CAE510E3AE;
	Fri, 31 Jan 2025 16:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fM4K3GPU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13F7510E3AE
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 16:53:40 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so1186374f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 08:53:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738342418; x=1738947218; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=YXuudxqXFyd2ufToANT9YRFIa9qwUxwKQHhEaI7Gs+g=;
 b=fM4K3GPUeYsJ1Eb4UXXAE3ZKNvDLAdGQ/dIsqzmxiiEhgQa1YgsK/kJOgJPffQjql9
 v227K9ACCtoUFPw23rjxsZoijjgc5XSvOaU4WvVxsWpIStIU5K8ZNK6RmejfvtW6lEj8
 2XudOsWonO4wP9Gc36/TGUGdyuDWJAAgnz9h7djiJy1wS9ZlqgUI/xQRS6vhTKZ5XXui
 UFXCSGMN07V7YE0Mj25l3/uIJMLRGUJCRL0qVH/JmuKV3AM2yC501DazgFOedwPHBLYL
 lSvGr/R8WfhPdIe2fkG9kx/d4KQxLYNf+mFSlBaYYycxHJQ8saRf4mFfjakJOEGA5GFh
 iKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738342418; x=1738947218;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YXuudxqXFyd2ufToANT9YRFIa9qwUxwKQHhEaI7Gs+g=;
 b=IL0kBCEe/bSxrj4ZVyD0QSqcsTDJz6TWsxiHj9YzfHOCMxzZB2wdR2zNpfuBQ+vyZw
 +5CU4LyqXCgIwoYimZdsjfmfCwV4jCOx6f/htpwykmKlGqampPYxqxntUFg9y2VS3sJ1
 3eqQUdJKK5Gjnwj9D544+CQyLBjLLlo9Hx5pelAmatiSbS/rIkru0++U5wUfLPyl5u8L
 Pdl6FPX/FNAwNVPxT4Xfm0f0Hci0t02zrabwqmxfXIU3y9UVR0bnLDhZIKi2pbjT3HDb
 pQEddaaCvTc60fbNL2fVtW9z9fkQfv9EJsI8RZ0d0u0BZfXVDvannaCUXIEBp0yzrM2b
 Dt1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8xYwFs9/cSYIpoxwP0kFXrLAwxkDwkYpuFcQP/RXtPOS6HHWHEJkZO6WjsysqvRrIzb+7ZCknOMY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyefFDexZf+d43DOXRAiqgoMqQ/m4tEWReMG72Pxc/WbzikCDz5
 ZfWzgVcTTIyFHxklzJKM1iGWkrNiWubvEPHEo4l3YVawkjXOp+qd
X-Gm-Gg: ASbGncsF1BgHW0bA6A6br7agM1riYOefLWBy52d7iKkhDZgALcLzD24AtPrG/CkyVRE
 RpYT0+yqOQKQYqnaNwc6k0opiC5G9KzKcmJPdCLPMD3GklHHRGWEr+bFxAJ+7EzGF7LaQnSSZ+W
 5Llo1O8Zs4MSUIy65BfF3V54Xvqy3UKVgiX5qFgiqo6FiTWeEUo998gg8C91hm2w1FNyh3V8Ipb
 0zXOwZCAfbFJesHY8eLw2mLlg7lvcH/jptVUNVj7wW/tIwysh8Est008NsPU53IjDGE3AG/lQiX
 P0zzNg5kkCJdYA==
X-Google-Smtp-Source: AGHT+IEDMPcLKLxTsK429xwikfWJydkdpUp8S6fPh9gbuoI7xNoBf2p2vOuUzRbf4VSVoFtOdv6iqA==
X-Received: by 2002:a5d:59a6:0:b0:38b:f3f4:57ae with SMTP id
 ffacd0b85a97d-38c51949b97mr11501948f8f.10.1738342418101; 
 Fri, 31 Jan 2025 08:53:38 -0800 (PST)
Received: from fedora ([94.73.37.161]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1b61f1sm5205377f8f.68.2025.01.31.08.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jan 2025 08:53:37 -0800 (PST)
Date: Fri, 31 Jan 2025 17:53:35 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: airlied@gmail.com, arthurgrillo@riseup.net, corbet@lwn.net,
 dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
 jeremie.dautheribes@bootlin.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 mairacanal@riseup.net, marcheu@google.com, melissa.srw@gmail.com,
 miquel.raynal@bootlin.com, mripard@kernel.org,
 nicolejadeyee@google.com, pekka.paalanen@haloniitty.fi,
 rdunlap@infradead.org, rodrigosiqueiramelo@gmail.com,
 seanpaul@google.com, simona.vetter@ffwll.ch, simona@ffwll.ch,
 thomas.petazzoni@bootlin.com, tzimmermann@suse.de
Subject: Re: [PATCH v16 3/7] drm/vkms: Drop YUV formats TODO
Message-ID: <Z50AD91RnzK2lWSd@fedora>
References: <20250121-yuv-v16-3-a61f95a99432@bootlin.com>
 <20250131084045.2874-1-jose.exposito89@gmail.com>
 <Z5zJ1h91AINbQRVF@louis-chauvet-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5zJ1h91AINbQRVF@louis-chauvet-laptop>
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

On Fri, Jan 31, 2025 at 02:02:14PM +0100, Louis Chauvet wrote:
> On 31/01/25 - 09:40, José Expósito wrote:
> > Hi Louis,
> > 
> > Thanks a lot for the patches.
> > 
> > I'm not well versed in YUV color formats, so I did my best reading the kernel
> > documentation before reviewing this series... But I'll most likely ask some
> > basic/dump questions.
> > 
> > > From: Arthur Grillo <arthurgrillo@riseup.net>
> > > 
> > > VKMS has support for YUV formats now. Remove the task from the TODO
> > > list.
> > > 
> > > Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> > > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > ---
> > >  Documentation/gpu/vkms.rst | 3 +--
> > >  1 file changed, 1 insertion(+), 2 deletions(-)
> > > 
> > > diff --git a/Documentation/gpu/vkms.rst b/Documentation/gpu/vkms.rst
> > > index ba04ac7c2167a9d484c54c69a09a2fb8f2d9c0aa..13b866c3617cd44043406252d3caa912c931772f 100644
> > > --- a/Documentation/gpu/vkms.rst
> > > +++ b/Documentation/gpu/vkms.rst
> > > @@ -122,8 +122,7 @@ There's lots of plane features we could add support for:
> > >  
> > >  - Scaling.
> > >  
> > > -- Additional buffer formats, especially YUV formats for video like NV12.
> > > -  Low/high bpp RGB formats would also be interesting.
> > > +- Additional buffer formats. Low/high bpp RGB formats would be interesting.
> > 
> > I see that you implemented support for 6 DRM_FORMAT_NV* formats, but
> > DRM_FORMAT_NV15, DRM_FORMAT_NV20 and DRM_FORMAT_NV30 are not implemented.
> > 
> > The same applies to DRM_FORMAT_Y210 or DRM_FORMAT_YUV410 among others.
> > 
> > Could it be useful to implement all of them in the future? If so, should we add
> > it to the ToDo list?
> 
> I don't think we need "all of them" (there are ≈100 + all the modifiers), 
> but definitly all the commonly used ones (I have some of the "common" one 
> ready here [1], I just wait for the YUV series to be accepted to avoid 
> conflicts).

Good to know, thanks for the clarification. I think we are good with this
to-do item as it is. There's plenty of work that can be done :)

Jose

> > It might be a great task to get started in kernel development, as there are
> > already similar examples and tests.
> 
> I don't think we need to specify which format are missing, the point 
> "Additionnal buffer formats. [...]" seems sufficient. If you think this is 
> relevant, I can add "Easy task" so beginners will find it easier?
>  
> [1]:https://lore.kernel.org/all/20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com/
> 
> > >  
> > >  - Async updates (currently only possible on cursor plane using the legacy
> > >    cursor api).
> > > 
