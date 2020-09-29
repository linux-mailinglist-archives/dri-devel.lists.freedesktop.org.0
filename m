Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C261527C0AC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 11:14:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9C56E3BB;
	Tue, 29 Sep 2020 09:14:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04D836E457
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 09:14:50 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z1so4520640wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 02:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=nL1RJ1CBsQM4FRjSLIq4hF2LWibhorMGgFGx7FERzoU=;
 b=gdHdOjUtbzxqgqGnhYkIQLu0EJiUF0CxOiu4yUaVxxsB4Y1RcTXJZcQOXBz5fuywkl
 3wLF7s89+6APQbGCO/in/zuRexI7frcXl+jlrQB4dr5Rj/Ic/VLtFtQncOVf2Pof5qEi
 AuckYtsq3x9uMOT/b5FP7SeE6uEKI90YGf5II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nL1RJ1CBsQM4FRjSLIq4hF2LWibhorMGgFGx7FERzoU=;
 b=inXIb4T9NI80hfyQe4RD0rmX2QJmTjlrd57AwgtEyabk9lU15/k40Tiq4kYDOLhbsv
 ZtPXcg9Yn/V16pWXa7hs25uV5wjTIAnCMaDvRAnhwLD1+iysYVqSAR4IHNS18AX9971h
 RMxGZ3ZlOrplmepn7cz8n8dMSLYFtARVhSEzVrYgob1cSwp8lbO5604DSaeO43BQi9WX
 8l4gBszqvpdXLgfBoGsM/Fc79ntni3Z3gUMAtnfE5nxm3pmlBMoVzQHtcAThlGo0YsBh
 kEJT7nEh2c69rfk2JCe+9aiBjUjrAsFqfS6B1XStRkbxIirM4iMM+KnTd5/VeuvGpUb/
 KcHQ==
X-Gm-Message-State: AOAM532tb+Geudri4p8/4kfjy8FEju0+TYJQsHUvebsSGagHcIda0O29
 wZCDJsBoF+qEv3y2E0eLtw0xkg==
X-Google-Smtp-Source: ABdhPJzUpk5sRYoMWrtr0UlpR9ORIRx/KJD45hyn02zRFIKDUXFqG2Is9+7QHPaCNhxuEtvE05yF9A==
X-Received: by 2002:a5d:470e:: with SMTP id y14mr3112131wrq.354.1601370888619; 
 Tue, 29 Sep 2020 02:14:48 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l126sm4669148wmf.39.2020.09.29.02.14.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 02:14:47 -0700 (PDT)
Date: Tue, 29 Sep 2020 11:14:45 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v3 0/4] dma-buf: Flag vmap'ed memory as system or I/O
 memory
Message-ID: <20200929091445.GI438822@phenom.ffwll.local>
References: <20200925115601.23955-1-tzimmermann@suse.de>
 <20200926071334.GA42915@ravnborg.org>
 <8761e0dd-569e-0ea0-7bc5-25e4f7cb67cc@suse.de>
 <20200927191605.GA237178@ravnborg.org>
 <3f703297-7b4f-dcca-ea56-70b2413a1e3d@amd.com>
 <ef4400a7-397b-e550-7114-1d4238dd36f3@suse.de>
 <49c4dcec-cd69-510a-9781-e8fa5fb669f9@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49c4dcec-cd69-510a-9781-e8fa5fb669f9@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-doc@vger.kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com, kraxel@redhat.com,
 tfiga@chromium.org, Sam Ravnborg <sam@ravnborg.org>, m.szyprowski@samsung.com,
 arnd@arndb.de, corbet@lwn.net, jonathanh@nvidia.com, matthew.auld@intel.com,
 linux+etnaviv@armlinux.org.uk, labbott@redhat.com, linux-media@vger.kernel.org,
 pawel@osciak.com, intel-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 thomas.hellstrom@intel.com, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
 lmark@codeaurora.org, afd@ti.com, kyungmin.park@samsung.com,
 Thomas Zimmermann <tzimmermann@suse.de>, robin.murphy@arm.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 28, 2020 at 01:22:13PM +0200, Christian K=F6nig wrote:
> Am 28.09.20 um 09:37 schrieb Thomas Zimmermann:
> > Hi
> > =

> > Am 28.09.20 um 08:50 schrieb Christian K=F6nig:
> > > Am 27.09.20 um 21:16 schrieb Sam Ravnborg:
> > > > Hi Thomas.
> > > > =

> > > > > > struct simap {
> > > > > >  =A0=A0=A0=A0=A0=A0=A0 union {
> > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 void __iomem *va=
ddr_iomem;
> > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 void *vaddr;
> > > > > >  =A0=A0=A0=A0=A0=A0=A0 };
> > > > > >  =A0=A0=A0=A0=A0=A0=A0 bool is_iomem;
> > > > > > };
> > > > > > =

> > > > > > Where simap is a shorthand for system_iomem_map
> > > > > > And it could al be stuffed into a include/linux/simap.h file.
> > > > > > =

> > > > > > Not totally sold on the simap name - but wanted to come up with
> > > > > > something.
> > > > > Yes. Others, myself included, have suggested to use a name that d=
oes not
> > > > > imply a connection to the dma-buf framework, but no one has come =
up with
> > > > >  =A0 a good name.
> > > > > =

> > > > > I strongly dislike simap, as it's entirely non-obvious what it do=
es.
> > > > > dma-buf-map is not actually wrong. The structures represents the =
mapping
> > > > > of a dma-able buffer in most cases.
> > > > > =

> > > > > > With this approach users do not have to pull in dma-buf to use =
it and
> > > > > > users will not confuse that this is only for dma-buf usage.
> > > > > There's no need to enable dma-buf. It's all in the header file wi=
thout
> > > > > dependencies on dma-buf. It's really just the name.
> > > > > =

> > > > > But there's something else to take into account. The whole issue =
here is
> > > > > that the buffer is disconnected from its originating driver, so w=
e don't
> > > > > know which kind of memory ops we have to use. Thinking about it, I
> > > > > realized that no one else seemed to have this problem until now.
> > > > > Otherwise there would be a solution already. So maybe the dma-buf
> > > > > framework *is* the native use case for this data structure.
> > > > We have at least:
> > > > linux/fb.h:
> > > >  =A0=A0=A0=A0union {
> > > >  =A0=A0=A0=A0=A0=A0=A0 char __iomem *screen_base;=A0=A0=A0=A0=A0 /*=
 Virtual address */
> > > >  =A0=A0=A0=A0=A0=A0=A0 char *screen_buffer;
> > > >  =A0=A0=A0=A0};
> > > > =

> > > > Which solve more or less the same problem.
> > I thought this was for convenience. The important is_iomem bit is missi=
ng.
> > =

> > > I also already noted that in TTM we have exactly the same problem and=
 a
> > > whole bunch of helpers to allow operations on those pointers.
> > How do you call this within TTM?
> =

> ttm_bus_placement, but I really don't like that name.
> =

> > =

> > The data structure represents a pointer to either system or I/O memory,
> > but not necessatrily device memory. It contains raw data. That would
> > give something like
> > =

> >    struct databuf_map
> >    struct databuf_ptr
> >    struct dbuf_map
> >    struct dbuf_ptr
> > =

> > My favorite would be dbuf_ptr. It's short and the API names would make
> > sense: dbuf_ptr_clear() for clearing, dbuf_ptr_set_vaddr() to set an
> > address, dbuf_ptr_incr() to increment, etc. Also, the _ptr indicates
> > that it's a single address; not an offset with length.
> =

> Puh, no idea. All of that doesn't sound like it 100% hits the underlying
> meaning of the structure.

Imo first let's merge this and then second with more users we might come
up with a better name. And cocci is fairly good at large-scale rename, to
the point where we manged to rename struct fence to struct dma_fence.

Also this entire thread here imo shows that we haven't yet figured out the
perfect name anyway, and I don't think it's worth it to hold this up
because of this bikeshed :-)

Cheers, Daniel

> =

> Christian.
> =

> > =

> > Best regards
> > Thomas
> > =

> > > Christian.
> > > =

> > > > > Anyway, if a better name than dma-buf-map comes in, I'm willing to
> > > > > rename the thing. Otherwise I intend to merge the patchset by the=
 end of
> > > > > the week.
> > > > Well, the main thing is that I think this shoud be moved away from
> > > > dma-buf. But if indeed dma-buf is the only relevant user in drm then
> > > > I am totally fine with the current naming.
> > > > =

> > > > One alternative named that popped up in my head: struct sys_io_map =
{}
> > > > But again, if this is kept in dma-buf then I am fine with the curre=
nt
> > > > naming.
> > > > =

> > > > In other words, if you continue to think this is mostly a dma-buf
> > > > thing all three patches are:
> > > > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > > > =

> > > >  =A0=A0=A0=A0Sam
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
