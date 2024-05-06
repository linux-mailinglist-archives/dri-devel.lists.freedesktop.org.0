Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A885D8BCE90
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2024 14:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C2D10F685;
	Mon,  6 May 2024 12:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="B4JGL0Zf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E0A10F644
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2024 12:56:13 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-41ecf80482bso1276155e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 06 May 2024 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715000172; x=1715604972; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+ma/nnUaeLLzglBXRpl/JPCuBgBd6mucb+wTOwKA/yc=;
 b=B4JGL0ZfWvN5e7Fb1+jazX4gB4elpSuGVNs+ijIZcPmTQjhkANZfNbTL01qDBy747m
 aPQWRzvKWszRGydQ/jwp761r94ig6MvH9ednMDMgyNzsZsX97E03+Nhck6aB3bFWjnBL
 2joqReT1OK5pCYsRMq09tHSUOEJpSwgLx2eO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715000172; x=1715604972;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ma/nnUaeLLzglBXRpl/JPCuBgBd6mucb+wTOwKA/yc=;
 b=X/6MYn8vW8ZPfo8xpffLChzLKD5r6OYY2xJleaWqxaFtOXIp5LhMo5RR2LrUgUi3LY
 pqiSlya5h+mJb7fQTJN1dm8rtjxEEUd0d7cabRQ/fCfJLk5PNDoNErTYVqVUl7VLwhVk
 2h2MboLp7QWb3b+ZAApuzUQHBrlFcaNcSAiqvWB8BeWDutDJ5CJZpL4zttMK7NJh8G6j
 AYjkdjZu9if9jteNP2jG1LZolJ51AMFuOndpiMaqUs9+EXWCF0XPl1c/50jmNhPhwXXo
 gIgyAS+XNiWfNcCHYx6WWIcj6wnUormNwbu5szlQeq3CbotV6ZKh+uwhGN8QPq8xgiER
 tgBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSYuB0x2INpHaQDhoVLhm7N/2YqQWZLeHOaLM2x3vXsySuujJiR4a8pOc6oC8FY5+C2tsxN+jg/Nb/TAHSLUQbFU7YpMb14WqSLNqpE5Xk
X-Gm-Message-State: AOJu0Yy3mehdZUxtgp6xdfWT3M4rKkyaSmMtSPBAPFCHqFOHmtywDl0o
 kNiyXTdz4b+2u6xhg1ZAO6hv7UWboux2eqofeV2Rje5gGrt+IfxP/GixHWdFmn0+63Lr8c/TtG9
 X
X-Google-Smtp-Source: AGHT+IGuhgk/7E8DdeWEM8fe/i6u1yO6mEsbNwBvEPf5rjb3dpEk0wKfti4hfBcPgMmPsXRfuUsXoA==
X-Received: by 2002:a5d:590b:0:b0:34c:f9c9:f51c with SMTP id
 v11-20020a5d590b000000b0034cf9c9f51cmr7624536wrd.4.1715000171637; 
 Mon, 06 May 2024 05:56:11 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a5d658f000000b0034ddf05a3e6sm10681322wru.76.2024.05.06.05.56.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 05:56:11 -0700 (PDT)
Date: Mon, 6 May 2024 14:56:09 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Alex Deucher <alexdeucher@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Rob Clark <robdclark@chromium.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] Documentation/gpu: Document the situation with
 unqualified drm-memory-
Message-ID: <ZjjTaeZYNqVSj2y-@phenom.ffwll.local>
References: <20240503123657.9441-1-tursulin@igalia.com>
 <736ba0a2-035b-4727-bbcc-437029420377@igalia.com>
 <2cdee989-f48d-4923-b12a-f09a1cc2b34d@igalia.com>
 <ZjUDsRIHHmJ0oM-1@phenom.ffwll.local>
 <CADnq5_Mp0y559dGHuK2HWJp_UuiknOhvQB90yw_tdOuo1eV8gQ@mail.gmail.com>
 <4705c6e4-04e3-4f97-9f9a-629b6495e92a@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4705c6e4-04e3-4f97-9f9a-629b6495e92a@igalia.com>
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

On Fri, May 03, 2024 at 06:06:03PM +0100, Tvrtko Ursulin wrote:
> 
> On 03/05/2024 16:58, Alex Deucher wrote:
> > On Fri, May 3, 2024 at 11:33 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > 
> > > On Fri, May 03, 2024 at 01:58:38PM +0100, Tvrtko Ursulin wrote:
> > > > 
> > > > [And I forgot dri-devel.. doing well!]
> > > > 
> > > > On 03/05/2024 13:40, Tvrtko Ursulin wrote:
> > > > > 
> > > > > [Correcting Christian's email]
> > > > > 
> > > > > On 03/05/2024 13:36, Tvrtko Ursulin wrote:
> > > > > > From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > 
> > > > > > Currently it is not well defined what is drm-memory- compared to other
> > > > > > categories.
> > > > > > 
> > > > > > In practice the only driver which emits these keys is amdgpu and in them
> > > > > > exposes the total memory use (including shared).
> > > > > > 
> > > > > > Document that drm-memory- and drm-total-memory- are aliases to
> > > > > > prevent any
> > > > > > confusion in the future.
> > > > > > 
> > > > > > While at it also clarify that the reserved sub-string 'memory' refers to
> > > > > > the memory region component.
> > > > > > 
> > > > > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > > > > Cc: Alex Deucher <alexander.deucher@amd.com>
> > > > > > Cc: Christian König <christian.keonig@amd.com>
> > > > > 
> > > > > Mea culpa, I copied the mistake from
> > > > > 77d17c4cd0bf52eacfad88e63e8932eb45d643c5. :)
> > > > > 
> > > > > Regards,
> > > > > 
> > > > > Tvrtko
> > > > > 
> > > > > > Cc: Rob Clark <robdclark@chromium.org>
> > > > > > ---
> > > > > >    Documentation/gpu/drm-usage-stats.rst | 10 +++++++++-
> > > > > >    1 file changed, 9 insertions(+), 1 deletion(-)
> > > > > > 
> > > > > > diff --git a/Documentation/gpu/drm-usage-stats.rst
> > > > > > b/Documentation/gpu/drm-usage-stats.rst
> > > > > > index 6dc299343b48..ef5c0a0aa477 100644
> > > > > > --- a/Documentation/gpu/drm-usage-stats.rst
> > > > > > +++ b/Documentation/gpu/drm-usage-stats.rst
> > > > > > @@ -128,7 +128,9 @@ Memory
> > > > > >    Each possible memory type which can be used to store buffer
> > > > > > objects by the
> > > > > >    GPU in question shall be given a stable and unique name to be
> > > > > > returned as the
> > > > > > -string here.  The name "memory" is reserved to refer to normal
> > > > > > system memory.
> > > > > > +string here.
> > > > > > +
> > > > > > +The region name "memory" is reserved to refer to normal system memory.
> > > > > >    Value shall reflect the amount of storage currently consumed by
> > > > > > the buffer
> > > > > >    objects belong to this client, in the respective memory region.
> > > > > > @@ -136,6 +138,9 @@ objects belong to this client, in the respective
> > > > > > memory region.
> > > > > >    Default unit shall be bytes with optional unit specifiers of 'KiB'
> > > > > > or 'MiB'
> > > > > >    indicating kibi- or mebi-bytes.
> > > > > > +This is an alias for drm-total-<region> and only one of the two
> > > > > > should be
> > > > > > +present.
> > > 
> > > This feels a bit awkward and seems to needlessly complicate fdinfo uapi.
> > > 
> > > - Could we just patch amdgpu to follow everyone else, and avoid the
> > >    special case? If there's no tool that relies on the special amdgpu
> > >    prefix then that would be a lot easier.
> > > 
> > > - If that's not on the table, could we make everyone (with a suitable
> > >    helper or something) just print both variants, so that we again have
> > >    consisent fdinfo output? Or breaks that a different set of existing
> > >    tools.
> > > 
> > > - Finally maybe could we get away with fixing amd by adding the common
> > >    format there, deprecating the old, fixing the tools that would break and
> > >    then maybe if we're lucky, remove the old one from amdgpu in a year or
> > >    so?
> > 
> > I'm not really understanding what amdgpu is doing wrong.  It seems to
> > be following the documentation.  Is the idea that we would like to
> > deprecate drm-memory-<region> in favor of drm-total-<region>?
> > If that's the case, I think the 3rd option is probably the best.  We
> > have a lot of tools and customers using this.  It would have also been
> > nice to have "memory" in the string for the newer ones to avoid
> > conflicts with other things that might be a total or shared in the
> > future, but I guess that ship has sailed.  We should also note that
> > drm-memory-<region> is deprecated.  While we are here, maybe we should
> > clarify the semantics of resident, purgeable, and active.  For
> > example, isn't resident just a duplicate of total?  If the memory was
> > not resident, it would be in a different region.
> 
> Amdgpu isn't doing anything wrong. It just appears when the format was
> discussed no one noticed (me included) that the two keys are not clearly
> described. And it looks there also wasn't a plan to handle the uncelar
> duality in the future.

Yeah I didnt want to imply that amdgpu did anything wrong, just that if we
have a spec where everyone does one thing, except one driver, that's a
really unfortunate situation that will cause endless amounts of pains to
userspace people.

Like entirely different example, but vmwgfx started out as a driver not
using gem buffer ids for it's per-fd buffer objects. And after a decade
they switched because aside from their own vmwgfx specific userspace just
about no-one got the memo. Despite that it was all documented and designed
to allow that case, and we tried to tilt that windmill for years
educating userspace.

Anyway I think you have I plan, I'm out :-)
-Sima

> For me deprecating sounds fine, the 3rd option. I understand we would only
> make amdgpu emit both sets of keys and then remove drm-memory- in due time.
> 
> With regards to key naming, yeah, memory in the name would have been nice.
> We had a lot of discussion on this topic but ship has indeed sailed. It is
> probably workarble for anything new that might come to add their prefix. As
> long as it does not clash with the memory categories is should be fine.
> 
> In terms of resident semantics, think of it as VIRT vs RES in top(1). It is
> for drivers which allocate backing store lazily, on first use.
> 
> Purgeable is for drivers which have a form of MADV_DONTNEED ie. currently
> have backing store but userspace has indicated it can be dropped without
> preserving the content on memory pressure.
> 
> Active is when reservation object says there is activity on the buffer.
> 
> Regards,
> 
> Tvrtko
> 
> > 
> > Alex
> > 
> > > 
> > > Uapi that's "either do $foo or on this one driver, do $bar" is just
> > > guaranteed to fragement the ecosystem, so imo that should be the absolute
> > > last resort.
> > > -Sima
> > > 
> > > > > > +
> > > > > >    - drm-shared-<region>: <uint> [KiB|MiB]
> > > > > >    The total size of buffers that are shared with another file (e.g.,
> > > > > > have more
> > > > > > @@ -145,6 +150,9 @@ than a single handle).
> > > > > >    The total size of buffers that including shared and private memory.
> > > > > > +This is an alias for drm-memory-<region> and only one of the two
> > > > > > should be
> > > > > > +present.
> > > > > > +
> > > > > >    - drm-resident-<region>: <uint> [KiB|MiB]
> > > > > >    The total size of buffers that are resident in the specified region.
> > > 
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
