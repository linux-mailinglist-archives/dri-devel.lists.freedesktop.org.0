Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D293A6ED49B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Apr 2023 20:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1360810E5D1;
	Mon, 24 Apr 2023 18:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3991410E5D1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 18:40:40 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-507bdc5ca2aso8546883a12.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 11:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682361636; x=1684953636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wzJOzH+7Z8w3/WGFZ7bEKUxGZRSO1RUpCg2aWmbmuJ4=;
 b=Xlsh1dnvxH4Rhmaqp+YZbzeXQYEPyjVZhfnq3CgiAa9mEJt5/4BFI5hUqu8uxIO7Nl
 eoH9JfIcJXRUY69/yYzDNqDJ4UY+pMTy53BnhFVTnZ9n/mI9DhJoYgPSKQ/O1sOHrb5h
 5y8y8UcHYq3X9v4Bne6h/6OvM763JXLP8wcWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682361636; x=1684953636;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wzJOzH+7Z8w3/WGFZ7bEKUxGZRSO1RUpCg2aWmbmuJ4=;
 b=A5Za8CAENxHbvuVQvciiZZr6TQFMpU7CmU/9XHGVUOeQHhj+fxBkK9RHkwIAgNf0Ee
 6sPuwraXWIHcwa85n7DmdMaU9g4AGANSUVaHjmAdMbpsk1AEqQHRLD3wXAoFd9yOstxf
 NJy3qWQimvYTIo8OvovTEYj2qSnXdJCvytKd2MnQNH+YxiJzvnT6/XBUfmr1jyr6++on
 hoPEq5ldVKvKrWOqIvrc3atYSAb+kOOi2qtLihh2GzQDGng702w72jKkYbIodIIA+5rT
 ppFs/vCF8Ra6KGdhFjMWIqwe2xEd0qePh4WBCFpn5Y9nvy2x2vh20YZSrB3ldkNS6i4W
 bZTA==
X-Gm-Message-State: AAQBX9cOGO092Vp+2IaJvijYAefjCNQf5z/57KZFmM9YCg//Iaj5yreV
 nvApb6ctm1ttrJKBtbHooQN8IKUD1Xubc+r4WeGD6Q==
X-Google-Smtp-Source: AKy350aVpL+IfUyqBu9TR7FKqt0O0UkYmKxEchQo/EHcDUJwwUI77Gwoj/zso1VwzldGqKUElpA2Fg==
X-Received: by 2002:aa7:cb01:0:b0:506:a2bb:fc43 with SMTP id
 s1-20020aa7cb01000000b00506a2bbfc43mr12012293edt.15.1682361635930; 
 Mon, 24 Apr 2023 11:40:35 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com.
 [209.85.208.42]) by smtp.gmail.com with ESMTPSA id
 f15-20020a056402150f00b00506adf55ae2sm4920216edw.6.2023.04.24.11.40.33
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 11:40:34 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-4af3773448fso31399a12.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Apr 2023 11:40:33 -0700 (PDT)
X-Received: by 2002:a05:6402:354f:b0:502:2af:7b1d with SMTP id
 f15-20020a056402354f00b0050202af7b1dmr11568edd.3.1682361633471; Mon, 24 Apr
 2023 11:40:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230416115237.798604-1-dmitry.osipenko@collabora.com>
 <CAAfnVB=5TVKxUmLhNMLMdgAPx7KoSKTsZQtq7Hv36FcP7bmgLA@mail.gmail.com>
 <6fef7bd4-6d02-6de8-e5f0-0ec8f57321f2@collabora.com>
In-Reply-To: <6fef7bd4-6d02-6de8-e5f0-0ec8f57321f2@collabora.com>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Mon, 24 Apr 2023 11:40:21 -0700
X-Gmail-Original-Message-ID: <CAAfnVBkNrWGOqBZa1xUqrVPSz+0BJYgVvVjguXwN8XJ_KWrpKQ@mail.gmail.com>
Message-ID: <CAAfnVBkNrWGOqBZa1xUqrVPSz+0BJYgVvVjguXwN8XJ_KWrpKQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] Add sync object UAPI support to VirtIO-GPU driver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 Dominik Behr <dbehr@google.com>, David Airlie <airlied@redhat.com>,
 kernel@collabora.com, Emil Velikov <emil.velikov@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 19, 2023 at 2:22=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> Hello Gurchetan,
>
> On 4/18/23 02:17, Gurchetan Singh wrote:
> > On Sun, Apr 16, 2023 at 4:53=E2=80=AFAM Dmitry Osipenko <
> > dmitry.osipenko@collabora.com> wrote:
> >
> >> We have multiple Vulkan context types that are awaiting for the additi=
on
> >> of the sync object DRM UAPI support to the VirtIO-GPU kernel driver:
> >>
> >>  1. Venus context
> >>  2. Native contexts (virtio-freedreno, virtio-intel, virtio-amdgpu)
> >>
> >> Mesa core supports DRM sync object UAPI, providing Vulkan drivers with=
 a
> >> generic fencing implementation that we want to utilize.
> >>
> >> This patch adds initial sync objects support. It creates fundament for=
 a
> >> further fencing improvements. Later on we will want to extend the
> >> VirtIO-GPU
> >> fencing API with passing fence IDs to host for waiting, it will be a n=
ew
> >> additional VirtIO-GPU IOCTL and more. Today we have several VirtIO-GPU
> >> context
> >> drivers in works that require VirtIO-GPU to support sync objects UAPI.
> >>
> >> The patch is heavily inspired by the sync object UAPI implementation o=
f the
> >> MSM driver.
> >>
> >
> > The changes seem good, but I would recommend getting a full end-to-end
> > solution (i.e, you've proxied the host fence with these changes and sha=
red
> > with the host compositor) working first.  You'll never know what you'll
> > find after completing this exercise.  Or is that the plan already?
> >
> > Typically, you want to land the uAPI and virtio spec changes last.
> > Mesa/gfxstream/virglrenderer/crosvm all have the ability to test out
> > unstable uAPIs ...
>
> The proxied host fence isn't directly related to sync objects, though I
> prepared code such that it could be extended with a proxied fence later
> on, based on a prototype that was made some time ago.

Proxying the host fence is the novel bit.  If you have code that does
this, you should rebase/send that out (even as an RFC) so it's easier
to see how the pieces fit.

Right now, if you've only tested synchronization objects between the
same virtio-gpu context that skips the guest side wait, I think you
can already do that with the current uAPI (since ideally you'd wait on
the host side and can encode the sync resource in the command stream).

Also, try to come with a simple test (so we can meet requirements here
[a]) that showcases the new feature/capability.  An example would be
the virtio-intel native context sharing a fence with KMS or even
Wayland.

[a] https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-user=
space-requirements

>
> The proxied host fence shouldn't require UAPI changes, but only
> virtio-gpu proto extension. Normally, all in-fences belong to a job's
> context, and thus, waits are skipped by the guest kernel. Hence, fence
> proxying is a separate feature from sync objects, it can be added
> without sync objects.
>
> Sync objects primarily wanted by native context drivers because Mesa
> relies on the sync object UAPI presence. It's one of direct blockers for
> Intel and AMDGPU drivers, both of which has been using this sync object
> UAPI for a few months and now wanting it to land upstream.
>
> --
> Best regards,
> Dmitry
>
