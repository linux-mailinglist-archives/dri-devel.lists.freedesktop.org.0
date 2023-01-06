Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C47660654
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 19:26:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FB7910E8B2;
	Fri,  6 Jan 2023 18:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB5710E8B2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 18:26:07 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 m7-20020a17090a730700b00225ebb9cd01so5960615pjk.3
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Jan 2023 10:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Etvgo4W/Bn/Yds1RaoPmYaD2tSLdLiqxTez7oy5VZRs=;
 b=A8NvWdDCMQncy/4WKf/cAARoGWewnXA3g6Tp5Rh9VPAzIfTfel23NxT3u5Kfxnt/IT
 Gp/JFOBxkbIHSI86Lk3shuES2HLMtSdN2vDG7G8ZrFEOirX2m+w2jbh8gaQbrgaJ/IB1
 SpBUnzCMU4VTIf3jNpxKvidAyYfcQdK6PGzX0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Etvgo4W/Bn/Yds1RaoPmYaD2tSLdLiqxTez7oy5VZRs=;
 b=AFfX+WQp8gQeJtjZzvgHDPxQPDxk7k64Qhnp5nqszyVKA/OpI6vS0apdaWDKypV1U1
 M4Q9ZpZiD9Rk+ggR177fo6dWD0IwriLgAE3BV6MENOQLtGoFYsL3r0qJ17uujPfKBPb5
 9WBQVaIWDUgMnrx57jlBxnVecFIfdhi3bNJ/kLD3z6vijG//TX0YHvTQVbUYMq5y0/5B
 TwQWsQvSnTS+WOXHd7BfhbN+3S7g4NfGyXHTX945Rp/JJOzexCO3WuU0oXdFxSU9Xzf4
 x34YBRu5EsTSpP7gAQb6uiHf+aPfcf8UA5oI7BpNPREFQQ+bWAqnnRPfKk7RrBfPY2Pa
 KZZg==
X-Gm-Message-State: AFqh2krmgNHdvvjE6uJFa7I+QenQXjA/QKc0TBNMhKbBga6qCLVzDXNe
 QBpiiWo/dHFd/ScIPGUerWEUVQA7uR5EzORSjkQfMGaE7usrlw==
X-Google-Smtp-Source: AMrXdXup48E2sGIUDllDtInJ3xLLSrfjomIx6I71/YT5YNThxbOomeztgWX2HxrERl6keLADeA+DhnOYQlI7Snpz3Jc=
X-Received: by 2002:a17:902:7884:b0:192:bf3c:b85e with SMTP id
 q4-20020a170902788400b00192bf3cb85emr1394646pll.68.1673029567120; Fri, 06 Jan
 2023 10:26:07 -0800 (PST)
MIME-Version: 1.0
References: <20221208110733.5498-1-jacek.lawrynowicz@linux.intel.com>
 <20221208110733.5498-4-jacek.lawrynowicz@linux.intel.com>
 <Y7f83SKldf9uaTi3@phenom.ffwll.local>
 <20230106132255.GD1586324@linux.intel.com>
In-Reply-To: <20230106132255.GD1586324@linux.intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 6 Jan 2023 19:25:55 +0100
Message-ID: <CAKMK7uG8Qudy2Cf5zZ5CLwQd1+J5M3MyiNhKGuNrGbZNz4Bs4A@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] accel/ivpu: Add GEM buffer object management
To: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: quic_jhugo@quicinc.com, dri-devel@lists.freedesktop.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>, tzimmermann@suse.de,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 6 Jan 2023 at 14:23, Stanislaw Gruszka
<stanislaw.gruszka@linux.intel.com> wrote:
>
> On Fri, Jan 06, 2023 at 11:50:05AM +0100, Daniel Vetter wrote:
> > On Thu, Dec 08, 2022 at 12:07:29PM +0100, Jacek Lawrynowicz wrote:
> > > Adds four types of GEM-based BOs for the VPU:
> > >   - shmem
> > >   - userptr
> > >   - internal
> >
> > Uh what do you need this for? Usually the way we do these is just alloce a
> > normal bo, and then pin them.
>
> I think we do alloc/pin this way, but all our bo's are GEM based.
> For those bo's we use internally and other non-shmem we create them
> with drm_gem_private_object_init(). I think this way is simpler than
> have separate code for non-GEM and GEM bo's ...

They should be all gem bo, I guess you mean shmem vs non-shmem? And
the allocate+pin is the standard approach for drivers that have
somewhat dynamic bo (i.e. not using dma_alloc) and need some of them
(hopefully only for driver internal objects, not for userspace) pinned
in place. So you handrolling a perma-pinned gem bo for internal
objects is rather strange by drm driver standards.

> > Also, gem shmem helpers should be able to mostly cover you here, why not
> > use those? Might need some work to push basic userptr to them, but we have
> > enough drivers reinventing that wheel to justify that work.
> >
> > Can I guess also be done after merging.
>
> ... but if not, we can add this to TODO.

Yeah I'm fine with todo to cut these over to shmem helpers, this
driver has been stuck in limbo for way too long anyway.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
