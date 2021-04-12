Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA2935CDB1
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 18:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB83689E11;
	Mon, 12 Apr 2021 16:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D852F89DC9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 16:39:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id m9so892370wrx.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 09:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=gBrKuvDKkR3e7XA9QOnpxTMX8EdeZ49jxUcl3tSoCXY=;
 b=MpIZT5BnIcga50DtM/8iS38GNFZNtDg2DYhF7BfiKzU4a0f4r2Fyr+TlaiYKA0Yh1C
 bPcef3qEM8sFmwmQRBxf/ERXVkJROCJeHJ8F5n6zkWvC7ERYdibMhwrmYjURFZBfRM92
 DQ+aB/E8iJZxMl9gGkMaCNjfQyKitjsm1Jxlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=gBrKuvDKkR3e7XA9QOnpxTMX8EdeZ49jxUcl3tSoCXY=;
 b=uCArvQTXpc+ZsXevfwcWOB4rSoVbO85rx2vPHtz9ECPmP3SdMh/5nT8DWOADNeXWLI
 x0mduIpXPv7Mm6xlYdwlodXLdSAchV6nYpdQsKRiN70bf3QjN4yh4H8y2GY226XopXpe
 0IlqrVen0/IoRbFeKfocjxn9lol60OSzAeIZYdQbvI9VU2EtCN6Wpgf/AJh454R12G/I
 AW7+2B9Av4VCZ+2N94yD0yb3XtHaWpaMR8BgvqGpRjRyE0U6EgpuCLDv8u/pv8wj5rsf
 n8gDqZLLrGlL99K3cD4mRSPWV29kJrQ+g4lW7Gd+sliSFJqm12DuSrbi6igqZzPV9VtN
 Xoqg==
X-Gm-Message-State: AOAM530wlnR19G4cXi30aIzXYRHgTVhUF1Vz46iNg/66miT2wJS+n4Sx
 cjaVsLR0m6HdIWhUqp/fSGIZkw==
X-Google-Smtp-Source: ABdhPJwSp/htNobKOTYoYAn6NFnrsrblL7rBQMRasGGzFeIXfenDyw3zx9Fe2Q7CdIsHURyqJx5Cdw==
X-Received: by 2002:adf:f3c1:: with SMTP id g1mr3147564wrp.344.1618245577662; 
 Mon, 12 Apr 2021 09:39:37 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b6sm18617236wrv.12.2021.04.12.09.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 09:39:36 -0700 (PDT)
Date: Mon, 12 Apr 2021 18:39:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC PATCH] drm/ttm: Simplify the delayed destroy locking
Message-ID: <YHR3x+wrT1PnC4eg@phenom.ffwll.local>
References: <20210412131740.10257-1-thomas.hellstrom@linux.intel.com>
 <cfa22b90-575d-c87e-a993-5ed13cea0f02@amd.com>
 <715d7cbd-264c-9422-e173-c57266800c5f@linux.intel.com>
 <4d8d0ccb-c635-acd7-c6e9-6c11a9b9409f@amd.com>
 <YHRqr2PhPvSZeq19@phenom.ffwll.local>
 <fc54ec361eb3456b90bd4ef2f8151643dd6100c4.camel@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc54ec361eb3456b90bd4ef2f8151643dd6100c4.camel@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 05:49:50PM +0200, Thomas Hellstr=F6m wrote:
> On Mon, 2021-04-12 at 17:43 +0200, Daniel Vetter wrote:
> > On Mon, Apr 12, 2021 at 04:21:37PM +0200, Christian K=F6nig wrote:
> > > =

> > > =

> > > Am 12.04.21 um 16:16 schrieb Thomas Hellstr=F6m:
> > > > Hi, Christian,
> > > > =

> > > > On 4/12/21 4:01 PM, Christian K=F6nig wrote:
> > > > > Hi Thomas,
> > > > > =

> > > > > well in general a good idea, but I'm working on a different
> > > > > plan for
> > > > > a while now.
> > > > > =

> > > > > My idea here is that instead of the BO the resource object is
> > > > > kept
> > > > > on a double linked lru list.
> > > > > =

> > > > > The resource objects then have a pointer to either the BO or a
> > > > > fence
> > > > > object.
> > > > > =

> > > > > When it is a fence object we can just grab a reference to it
> > > > > and
> > > > > wait for it to complete.
> > > > > =

> > > > > If it is a BO we evict it the same way we currently do.
> > > > > =

> > > > > This allows to remove both the delayed delete,
> > > > > individualization of
> > > > > BOs, ghost objects etc...
> > > > =

> > > > Hmm, ok. So in that case, what would trigger the final release of
> > > > the
> > > > buffer object in the absence of a delayed delete list? Would we
> > > > use a
> > > > fence callback for that?
> > > =

> > > Key point is you don't need any final release of the BO any more.
> > > When the
> > > BOs reference count becomes zero it can be destructed immediately.
> > > =

> > > Only the resource object is kept around and protected by a fence
> > > until it
> > > can be released finally.
> > =

> > I was reading dma_resv here for a second, and wondered how we figure
> > out
> > the refcounting for that. But since you aim for a fence, that's
> > refcounted,=A0
> =

> Hmm, Good point. What about objects with multiple shared fences?

Package it up into a new fence as part of the privatization step. We
already have the helpers for that I think.

It does mean a memory allocation in there, but I /think/ that's fine.
-Daniel
-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
