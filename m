Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC3F6D7956
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 12:12:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E072110E8B8;
	Wed,  5 Apr 2023 10:12:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122F610E8B3
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 10:12:40 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 k14-20020a9d700e000000b0069faa923e7eso18752543otj.10
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680689559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+oTyLhGTzln/7jPt/iX+Rd2l1L5Mgvm2dhW/v+eKHdk=;
 b=SvJki+8wMGruLAyCY5/FTP2J6ZrxeL6G/V0+7DyX35MmvN3DK/hVyQlJvhzr7qTT3D
 86kfNZ58Afcxs14xRFWqI9slHnzlQ3XAG3EWY08MqqlZjqTxk6yA268muJLWctoLdXWc
 rF4Ma6mHsXDT8RUvjNFQK33tcGAZ8hxY4Grh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680689559;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+oTyLhGTzln/7jPt/iX+Rd2l1L5Mgvm2dhW/v+eKHdk=;
 b=lRdSmUME6JQEjTyhSDDvL/ywu9kfH4fA619Bl9WmJCjEXwEvlD+yQNdE2ZLM7JU91/
 ++08D5GUxQNWl/On1NVKUbkU44NjV2S3yVGI/hA3S4oAaHi3ti/upXyEGbrTgzMihHD0
 EtuFJy8L+b+VnoOFL3hrZOaTjkcmrfizUOZTU0PW3YX7KNDhOsgrEGLyG41aK6kY38k6
 XL2INv0ODIdMLE7ETSc0LvIhjAoerZYzRm8nEBrbCqOGzwV/8VN7kcMzfok0xLuOqtLF
 9Vze+28b0Eoq7Rgy87XCQxOtNw2ATmVp6ZMO9VNNPKHqXLCR+vtwcnkrkGMvRyqu8E9H
 mruQ==
X-Gm-Message-State: AAQBX9d3tUpNgyfkmj2UPn52pPXvWmrxPtjIg1iSXzvRJaW/qcfS0pSy
 YOvPWj5VhNxKsIXHXbaSVh4WYRRfs7IyTFZ8fsMuDA==
X-Google-Smtp-Source: AKy350YzW3NqtFMtNfHbIUABteC1JZhEev3FUijNuV4dA35MCQFpjboQ6fn4Nm2jp6QIr8oPqpXEEXBinQr5XZN3eC4=
X-Received: by 2002:a9d:7e96:0:b0:69f:5701:de09 with SMTP id
 m22-20020a9d7e96000000b0069f5701de09mr1821049otp.6.1680689558972; Wed, 05 Apr
 2023 03:12:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230404002211.3611376-1-matthew.brost@intel.com>
 <87c7f659-387c-3e23-69c6-03e0c9820bab@amd.com>
 <ZCwoL3Wgv90tlQWR@DUT025-TGLU.fm.intel.com>
 <d740a81a-8919-b6c8-a8c1-f5d8f9c5549c@amd.com>
 <ZC0yq9XZ2t9cV0Nz@phenom.ffwll.local>
 <a2236a9d-e21a-269c-aad3-184c402065b7@amd.com>
 <ZC06Rl6TGe7itZvW@phenom.ffwll.local>
 <ec128743-699b-3722-0ab2-ff96552fdddd@amd.com>
In-Reply-To: <ec128743-699b-3722-0ab2-ff96552fdddd@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 5 Apr 2023 12:12:27 +0200
Message-ID: <CAKMK7uFEGoaOmewGmP4H_ouqZiMKAiaKwEohGCZq5T-UJYMf_w@mail.gmail.com>
Subject: Re: [RFC PATCH 00/10] Xe DRM scheduler and long running workload plans
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Matthew Brost <matthew.brost@intel.com>, robdclark@chromium.org,
 thomas.hellstrom@linux.intel.com, airlied@linux.ie, lina@asahilina.net,
 dri-devel@lists.freedesktop.org, boris.brezillon@collabora.com,
 intel-xe@lists.freedesktop.org, faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Apr 2023 at 11:57, Christian K=C3=B6nig <christian.koenig@amd.com=
> wrote:
>
> Am 05.04.23 um 11:07 schrieb Daniel Vetter:
> > [SNIP]
> >> I would approach it from the complete other side. This component here =
is a
> >> tool to decide what job should run next.
> >>
> >> How that is then signaled and run should not be part of the scheduler,=
 but
> >> another more higher level component.
> >>
> >> This way you also don't have a problem with not using DMA-fences as
> >> dependencies as well as constrains for running more jobs.
> > I think we're talking about two things here and mixing them up.
> >
> > For the dependencies I agree with you, and imo that higher level tool
> > should probably just be an on-demand submit thread in userspace for the
> > rare case where the kernel would need to sort out a dependency otherwis=
e
> > (due to running out of ringspace in the per-ctx ringbuffer).
> >
> > The other thing is the message passing stuff, and this is what I was
> > talking about above. This has nothing to do with handling dependencies,
> > but with talking to the gpu fw. Here the intel design issue is that the=
 fw
> > only provides a single queue, and it's in-order. Which means it
> > fundamentally has the stalling issue you describe as a point against a
> > message passing design. And fundamentally we need to be able to talk to
> > the fw in the scheduler ->run_job callback.
> >
> > The proposal here for the message passing part is that since it has the
> > stalling issue already anyway, and the scheduler needs to be involved
> > anyway, it makes sense to integrated this (as an optional thing, only f=
or
> > drivers which have this kind of fw interface) into the scheduler.
> > Otherwise you just end up with two layers for no reason and more ping-p=
ong
> > delay because the ->run_job needs to kick off the subordinate driver la=
yer
> > first. Note that for this case the optional message passing support in =
the
> > drm/scheduler actually makes things better, because it allows you to cu=
t
> > out one layer.
> >
> > Of course if a driver with better fw interface uses this message passin=
g
> > support, then that's bad. Hence the big warning in the kerneldoc.
>
> Well what I wanted to say is that if you design the dependency handling
> / scheduler properly you don't need the message passing through it.
>
> For example if the GPU scheduler component uses a work item to do it's
> handling instead of a kthread you could also let the driver specify the
> work queue where this work item is executed on.
>
> When you design it like this the driver specifies the thread context of
> execution for it's job. In other words it can specify a single threaded
> firmware work queue as well.
>
> When you then have other messages which needs to be passed to the
> firmware you can also use the same single threaded workqueue for this.
>
> Drivers which have a different firmware interface would just use one of
> the system work queues instead.
>
> This approach basically decouples the GPU scheduler component from the
> message passing functionality.

Hm I guess we've been talking past each another big time, because
that's really what I thought was under discussions? Essentially the
current rfc, but implementing with some polish.

iow I agree with you (I think at least).
-Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
