Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E825E8C7483
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 12:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24D7D10EC4E;
	Thu, 16 May 2024 10:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Dq/E+AYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8CC710EC50
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 10:18:16 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-41ff95798d4so8666395e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 03:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715854695; x=1716459495; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8TJDXJKaQUdW/2WF0Ge4iVoqYkhg+zWynHOclwI6BcY=;
 b=Dq/E+AYA6SmRE4knh38lAwPHFTIe7pbypN1KJSqRKSwvwOoMkDrKVAaByV6kojCxVD
 7tHeT0wIwcSuki+tpBZYXezLF+kOYlj/swTo5XYIcW1jF8IGBgqY3udfjtmkorBQBPBv
 3JrHpPt7s81YNWlxLjyBlUilSnFhtPsr9i1a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715854695; x=1716459495;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8TJDXJKaQUdW/2WF0Ge4iVoqYkhg+zWynHOclwI6BcY=;
 b=MtjPaqTdBi98rLpf9HGlzwCx5s2E28YfbGZgp8SzHFRxA4nKpZiYwbiklwHQ4RQwxm
 ZgupP/HGjmyVtFqEfdNCgvlEpdhoisdYYmrt7JmVv7N3bTs4rVJ8q/cLyem3AA1wwz+l
 1ql+UwbPKv27Vqb7c9zGhYTUdeycrUhF1Z2fehkmdfEzdwJls7D+MP0aABWT76n8rcMa
 i5/Ip7rw1YK3Vd3AtbBHHUmc9zop81eq8JMGt/2leCyIYBXNZpKdEN3xfF8wI+vMQ+r+
 BMwFJQIeVvhnOZW+nys6R6rRVM5JUl6GVyhCk7HK2jjxXmR27+UMRgZAvliv7vw96q/0
 SHGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPbmX25VtOL/I9lvltyvVxjNKSTKp908/hlEUAhX1Ys8SAziWYKjhvG65fLw+rWXinGBKM2o+jeitorxU0+5F6miUzhKe/8n7Wb+V0Vu04
X-Gm-Message-State: AOJu0YwGmDqkj5Q79Ue2xqeciOAqc8twkJWgEjf1wziY0e+qht5yGpUa
 OsLM1KIMNi51srbhmpqtVjjcS3bpiH+Iqp/us/8Xn9z7nhRGUo8pYRPDVM3xifU=
X-Google-Smtp-Source: AGHT+IG1TPzGwHl4apjazHkVeFsaJK8zkxRgSZYPHdggvbCW8ifvCjuF5EuKt5xYF73xI9ZzEUOQZA==
X-Received: by 2002:a05:600c:5116:b0:418:ef65:4b11 with SMTP id
 5b1f17b1804b1-41feac59e8amr154465585e9.2.1715854694962; 
 Thu, 16 May 2024 03:18:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4201088fe8csm183349845e9.32.2024.05.16.03.18.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 03:18:14 -0700 (PDT)
Date: Thu, 16 May 2024 12:18:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Maxime Ripard <mripard@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
Subject: Re: Safety of opening up /dev/dma_heap/* to physically present users
 (udev uaccess tag) ?
Message-ID: <ZkXdZBwPvZun33Fi@phenom.ffwll.local>
Mail-Followup-To: Daniel Stone <daniel@fooishbar.org>,
 Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@redhat.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>,
 John Stultz <jstultz@google.com>,
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Lennart Poettering <mzxreary@0pointer.de>,
 Robert Mader <robert.mader@collabora.com>,
 Sebastien Bacher <sebastien.bacher@canonical.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linaro-mm-sig@lists.linaro.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Milan Zamazal <mzamazal@redhat.com>,
 Andrey Konovalov <andrey.konovalov.ynk@gmail.com>
References: <bb372250-e8b8-4458-bc99-dd8365b06991@redhat.com>
 <20240506-dazzling-nippy-rhino-eabccd@houat>
 <ZjjdUBYYKXJ1EPr5@phenom.ffwll.local>
 <cbe5a743-d8be-4b0e-99c4-e804fbadc099@redhat.com>
 <ZjoNTw-TkPnnWLTG@phenom.ffwll.local>
 <CAPj87rN3uSZoHpWLSQqz1SW9YMZNj9fkoA_EDEE_bzv-Tw8tSw@mail.gmail.com>
 <Zjs42PGvilLlF0Cg@phenom.ffwll.local>
 <CAPj87rN-wSbGSAoB8y3MXCS20_MAQvfpWSeUKYR6XzQ+Oh0FZA@mail.gmail.com>
 <Zjue98r4ZgGbMN5K@phenom.ffwll.local>
 <CAPj87rPywSjKLrv00N-0SrkDndPdYGCBeveO0adh4xGCp20h9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rPywSjKLrv00N-0SrkDndPdYGCBeveO0adh4xGCp20h9g@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Thu, May 09, 2024 at 10:23:16AM +0100, Daniel Stone wrote:
> Hi,
> 
> On Wed, 8 May 2024 at 16:49, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, May 08, 2024 at 09:38:33AM +0100, Daniel Stone wrote:
> > > Right now, if your platform requires CMA for display, then the app
> > > needs access to the GPU render node and the display node too, in order
> > > to allocate buffers which the compositor can scan out directly. If it
> > > only has access to the render nodes and not the display node, it won't
> > > be able to allocate correctly, so its content will need a composition
> > > pass, i.e. performance penalty for sandboxing. But if it can allocate
> > > correctly, then hey, it can exhaust CMA just like heaps can.
> > >
> > > Personally I think we'd be better off just allowing access and
> > > figuring out cgroups later. It's not like the OOM story is great
> > > generally, and hey, you can get there with just render nodes ...
> >
> > Imo the right fix is to ask the compositor to allocate the buffers in this
> > case, and then maybe have some kind of revoke/purge behaviour on these
> > buffers. Compositor has an actual idea of who's a candidate for direct
> > scanout after all, not the app. Or well at least force migrate the memory
> > from cma to shmem.
> >
> > If you only whack cgroups on this issue you're still stuck in the world
> > where either all apps together can ddos the display or no one can
> > realistically direct scanout.
> 
> Mmm, back to DRI2. I can't say I'm wildly enthused about that, not
> least because a client using GPU/codec/etc for those buffers would
> have to communicate its requirements (alignment etc) forward to the
> compositor in order for the compositor to allocate for it. Obviously
> passing the constraints etc around isn't a solved problem yet, but it
> is at least contained down in clients rather than making it back and
> forth between client and compositor.

I don't think you need the compositor to allocate the buffer from the
requirements, you only need a protocol that a) allocates a buffer of a
given size from a given heap and b) has some kinda of revoke provisions so
that the compositor can claw back the memory again when it needs it.

> I'm extremely not-wild about the compositor migrating memory from CMA
> to shmem behind the client's back, and tbh I'm not sure how that would
> even work if the client has it pinned through whatever API it's
> imported into.

Other option is revoke on cma buffers that are allocated by clients, for
the case the compositor needs it.

> Anyway, like Laurent says, if we're deciding that heaps can't be used
> by generic apps (unlike DRM/V4L2/etc), then we need gralloc.

gralloc doesn't really fix this, it's just abstraction around how/where
you allocate?

Anyway the current plan is that we all pretend this issue of CMA allocated
buffers don't exist and we let clients allocate without limits. Given that
we don't even have cgroups to sort out the mess for anything else I
wouldn't worry too much ...
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
