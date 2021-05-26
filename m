Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F1C391921
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 15:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E056E4E8;
	Wed, 26 May 2021 13:44:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0BE6E4E8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 13:44:32 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id y7so1595047eda.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 06:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=IrekuzcPRWPXzoAqGgXt7A1rKiiVia5E9kkf/E2+IYI=;
 b=NyuCDIFwmZFyFRwolNs0vIAuskWcXFJTE3HQ6FauAG5CDB1xjU9xNSGACq0H5UZfKY
 eKUMwjZB0jL0axA8t2qfE9N27VLEXnvDLNe3B/0TzpH9IThl6wjka4REXTSO9zrtA6S9
 CS4e4K/ZT4HPLXEZhawfp5TfEAruhTzmHt5gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IrekuzcPRWPXzoAqGgXt7A1rKiiVia5E9kkf/E2+IYI=;
 b=oXkzzF1s+FEdWvzD2FEvbUb7NM2FYi+STnFFCN8p5BPxOyIB5duEXqFTJ6rzH0Qn/5
 YJHoeXDZ2af3iGGDmsOkov+0gcPgyMlgqNU6EQ7GB20yeag6MWqN2eqCk7FZi+ss1sSV
 gdlaCQTqrCA2q5cdAiadK/KZmnjvOhHuTdwWOUxRlf8Ta3DrKGmW/u0baZdghSBgK0y5
 6V7hYQ9C9WJcvi1G97oAth39WzNr7yVswczlVpnd6386lZM8OyIHo1M/TtfhBav7lQsD
 KcO8d7p0zK20NhtpGEw2Ue+A0IHxKgTZ6QvY+2CL8tRZuHkJETA3jteMaEdI3gSbQVEd
 eNyw==
X-Gm-Message-State: AOAM5330mDqk61UXnukP3IsM6ligUi/VvAzld3e49lDusmIgdT3kmcCC
 o0ODN118rdBYDolYp3DZtqHXPQ==
X-Google-Smtp-Source: ABdhPJxgdbf7PsEqllDPyT26ivI7CesgKrZOBZLmTAU/Eptp+9LagI57fCa4Tnn91xykDdHmBLjWvA==
X-Received: by 2002:a05:6402:510e:: with SMTP id
 m14mr37996415edd.320.1622036670950; 
 Wed, 26 May 2021 06:44:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b16sm12791401edu.53.2021.05.26.06.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 06:44:30 -0700 (PDT)
Date: Wed, 26 May 2021 15:44:28 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH 4/4] RFC: dma-buf: Add an API for importing sync files (v6)
Message-ID: <YK5QvIJYTJ7AJZNx@phenom.ffwll.local>
References: <20210520190007.534046-1-jason@jlekstrand.net>
 <20210520190007.534046-5-jason@jlekstrand.net>
 <CAPj87rPW2xmOLKg6OgQST6QrH9u5-qmdRJrNDug+rWa=Uv6ZBQ@mail.gmail.com>
 <CAOFGe97b-djqwV95Y91xe9-ZVUyeGqjdPE8vj7MoSfV0Kcrp1Q@mail.gmail.com>
 <CAPj87rNJTHNKkdiZREVb8v6iiwUhYLXW10pjVOdV=zttd+tG3Q@mail.gmail.com>
 <CAKMK7uHqxLe_CH_cOjfy-rouYcxwg=n6AkkxprzAKnb-y_A3NQ@mail.gmail.com>
 <CAPj87rOW_633K_n4nwq2qkPt5Q5efc3BpRnzT+=Npb=agWGTew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rOW_633K_n4nwq2qkPt5Q5efc3BpRnzT+=Npb=agWGTew@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 26, 2021 at 02:08:19PM +0100, Daniel Stone wrote:
> Hey,
> 
> On Wed, 26 May 2021 at 13:35, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, May 26, 2021 at 1:09 PM Daniel Stone <daniel@fooishbar.org> wrote:
> > > Yeah, I don't think there's any difference between shared and
> > > exclusive wrt safety. The difference lies in, well, exclusive putting
> > > a hard serialisation barrier between everything which comes before and
> > > everything that comes after, and shared being more relaxed to allow
> > > for reads to retire in parallel.
> > >
> > > As said below, I think there's a good argument for the latter once you
> > > get out of the very straightforward uses. One of the arguments for
> > > these ioctls is to eliminate oversync, but then the import ioctl
> > > mandates oversync in the case where the consumer only does
> > > non-destructive reads - which is the case for the vast majority of
> > > users!
> >
> > Just wanted to comment on this: Right now we attach always attach a
> > shared end-of-batch fence to every dma_resv. So reads are
> > automatically and always synced. So in that sense having an explicit
> > ioct to set the read fence is not really useful, since at most you
> > just make everything worse.
> 
> Are you saying that if a compositor imports a client-provided dmabuf
> as an EGLImage to use as a source texture for its rendering, and then
> provides it to VA-API or V4L2 to use as a media encode source (both
> purely read-only ops), that these will both serialise against each
> other? Like, my media decode job won't begin execution until the
> composition read has fully retired?
> 
> If so, a) good lord that hurts, and b) what are shared fences actually ... for?

Shared is shared, I just meant to say that we always add the shared fence.
So an explicit ioctl to add more shared fences is kinda pointless.

So yeah on a good driver this will run in parallel. On a not-so-good
driver (which currently includes amdgpu and panfrost) this will serialize,
because those drivers don't have the concept of a non-exclusive fence for
such shared buffers (amdgpu does not sync internally, but will sync as
soon as it's cross-drm_file).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
