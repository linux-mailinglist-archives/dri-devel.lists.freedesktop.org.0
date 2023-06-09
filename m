Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD0A72A0F0
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 19:10:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FF8310E6D5;
	Fri,  9 Jun 2023 17:10:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF5310E6D3;
 Fri,  9 Jun 2023 17:10:12 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6b16c53a85aso867372a34.2; 
 Fri, 09 Jun 2023 10:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686330611; x=1688922611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u+yWHt5GZH/1N73zFWnTYLJ06N8gJEYDkgF9wODa+vg=;
 b=JfAV3voLCl7UprapAQd/cBcwrAITubZAJdS1jL40cImLt2y9SiCMc4gZyReRscMNHw
 2XWjAjna1ybrNOgeI48VkScIdL9AGdZ4pTmBXy1MxtJGjZIBPoed78Ro/Tr4Us3c5pBq
 VCUSB5ERIFQKkodEvUR4wcRSZJ7lKuyotgV6qz/4JQ5UZtZrvQE7N+VADLLw3KC0lzek
 b7zHOSS1MG3iNI7NZzQMeF3fnpJ7Hzz8a0GEYkLGJ1QAvOk7JnMFaNij7bQIQfJBJ/gK
 ZA/fSGWTgpZ1WrfOpsZkIIziMkEf4mxz27Ft6rKPPqWCtHKCxKNHUqFc1thvrYNfLTsG
 p5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686330611; x=1688922611;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u+yWHt5GZH/1N73zFWnTYLJ06N8gJEYDkgF9wODa+vg=;
 b=UB/dKs8q4TM9Zkf+xa9AKuylF8SfGcGS76OqetsR6f9TdDeQz7d4vdVVikCiYDRATG
 9hWCq94aEM152Gbt70OInIJP7MWrBt7gHHP81l51QS7FhG1iL1+Tum+iqujbVmH70wPt
 +LFyDZWgenwRJrLWoXtvgpzezMBVCXvwUxjISIoCZax/Qy5lZHW+JoSjVSxxe1e5ZlTb
 b+4428pdxcCiJ2BRZPSIg5iMffkIU9oRvUCubd8wNsjvkj25Hk/JftqYYoMVabevZPEb
 bS6jsQgL4P/eN9BctFrTLvc7d8nJV5UqwS+xZh7ZGdzbiixBBZoKwD9JoJbnJIxHoiwN
 d+jw==
X-Gm-Message-State: AC+VfDw1tNgKYgyKG81Kka2GCY5OJIuNiULf4sY3s6iSgKYnvstqiLyu
 spvs2R1covWiLKYfJbLMuX/M/eC3tuNSTwhoAi4=
X-Google-Smtp-Source: ACHHUZ6sKlE66DtGp51ln42jNCdblZHS46TSoeR7nSoPWyxt3hc8rVs/Ki7viGhq0tp5Z6PUb3BBXbI7DJeZkUixGhY=
X-Received: by 2002:a05:6870:c789:b0:1a2:eee8:c0a6 with SMTP id
 dy9-20020a056870c78900b001a2eee8c0a6mr1448468oab.2.1686330610992; Fri, 09 Jun
 2023 10:10:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230609121143.1232420-1-tvrtko.ursulin@linux.intel.com>
 <20230609121143.1232420-7-tvrtko.ursulin@linux.intel.com>
 <2faa3900-6456-136c-0a1a-8629ed6d3784@intel.com>
 <bfa71c75-4b61-ce17-8eba-0aa48ec14097@linux.intel.com>
In-Reply-To: <bfa71c75-4b61-ce17-8eba-0aa48ec14097@linux.intel.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 9 Jun 2023 10:09:59 -0700
Message-ID: <CAF6AEGtcezsfSV3kqdbPUHGN8Pr1Jwo78fvtDQ4aGVZ+b8Ni_w@mail.gmail.com>
Subject: Re: [PATCH 6/8] drm: Add drm_gem_prime_fd_to_handle_obj
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Iddamsetty,
 Aravind" <aravind.iddamsetty@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 9, 2023 at 7:12=E2=80=AFAM Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
>
> On 09/06/2023 13:44, Iddamsetty, Aravind wrote:
> > On 09-06-2023 17:41, Tvrtko Ursulin wrote:
> >> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> >>
> >> I need a new flavour of the drm_gem_prime_fd_to_handle helper, one whi=
ch
> >> will return a reference to a newly created GEM objects (if created), i=
n
> >> order to enable tracking of imported i915 GEM objects in the following
> >> patch.
> >
> > instead of this what if we implement the open call back in i915
> >
> > struct drm_gem_object_funcs {
> >
> >          /**
> >           * @open:
> >           *
> >           * Called upon GEM handle creation.
> >           *
> >           * This callback is optional.
> >           */
> >          int (*open)(struct drm_gem_object *obj, struct drm_file *file)=
;
> >
> > which gets called whenever a handle(drm_gem_handle_create_tail) is
> > created and in the open we can check if to_intel_bo(obj)->base.dma_buf
> > then it is imported if not it is owned or created by it.
>
> I wanted to track as much memory usage as we have which is buffer object
> backed, including page tables and contexts. And since those are not user
> visible (they don't have handles), they wouldn't be covered by the
> obj->funcs->open() callback.
>
> If we wanted to limit to objects with handles we could simply do what
> Rob proposed and that is to walk the handles idr. But that does not feel
> like the right direction to me. Open for discussion I guess.

I guess you just have a few special case objects per context?
Wouldn't it be easier to just track _those_ specially and append them
to the results after doing the normal idr table walk?

(Also, doing something special for dma-buf smells a bit odd..
considering that we also have legacy flink name based sharing as
well.)

BR,
-R
