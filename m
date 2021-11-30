Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA34F462EB9
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 09:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7496EC21;
	Tue, 30 Nov 2021 08:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 997176EC25
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 08:43:50 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a9so42653655wrr.8
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 00:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=sJyA0wgEIxttMi/MVC00O0LmA1DZEBGPTAclUWb8fME=;
 b=Op4WSSG5UGUzW/XYeP1GvmGmeAPH1OXYu6cxevk8eWyzL9BBxON6f9DjOQ47ZaqLci
 1eDLIy1g8iM8u/q0PzUdvz1aZC034cKDJGpWDDbfnrzA5FKZUiCf6H7LCpdcXA+7SOrN
 mYsy3wOlTM4uycnZSB/B90A2KCz0Vk3DN/T78=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=sJyA0wgEIxttMi/MVC00O0LmA1DZEBGPTAclUWb8fME=;
 b=fhIbHbYP+KdqNWMmXYvZ0EVE88UpurLdbUVicvZX/RDMCcI59bth3KHQDG/XE8crl3
 81/74BUTVsNFN/6mZTDJGJWC+TS4+vHWR0Gp65YtadkFcSa463XQs65zyL9/FQU5MErv
 SsVhp0epcmBjz7BT/FdAzkp4bLaNJhvYhoAmVNHrw4Ql66F6Z9nac0W3by4ZwspyKbqL
 jCIwA3CACswiyrsqKD2+dGpwkweOWo0K/+j0NQISGkTyhYE6t79DyDO6VHLA6vJmKu6+
 zAljma90rElXmWkv1w/d8Jci3yrJfXfrqHn8cZjbhfqb0j/9PEo3FzIncs0pdYywqcGR
 vW/w==
X-Gm-Message-State: AOAM533fCbk8ogupPq0Ws9gCmlZaCufKwgXaV36S//3XnbzrnvmNilxJ
 1myV/IUb9aY5wSniLQWv95Xg+jDoErPnfw==
X-Google-Smtp-Source: ABdhPJyTiAxBsuBxuoBHPHIgrpslQEeCRowbGO09n3L4vZrzmXnYGqWZgYAJcta4QX59nENVDniF3A==
X-Received: by 2002:a5d:618f:: with SMTP id j15mr38202876wru.506.1638261829178; 
 Tue, 30 Nov 2021 00:43:49 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b10sm16069956wrt.36.2021.11.30.00.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 00:43:48 -0800 (PST)
Date: Tue, 30 Nov 2021 09:43:46 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [Linaro-mm-sig] [PATCH] dma_fence_array: Fix PENDING_ERROR leak
 in dma_fence_array_signaled()
Message-ID: <YaXkQvdlQ4F6+pvz@phenom.ffwll.local>
References: <20211129073533.414008-1-thomas.hellstrom@linux.intel.com>
 <4fd0eee6-342f-fb31-717c-901440f38c35@gmail.com>
 <58ca11648ab29d96b84640760d2acc3ac2d39d19.camel@linux.intel.com>
 <e4d8e272-8175-4298-f227-240febc0bda0@gmail.com>
 <ee128e237dbc2b6b2341b49ab07661c1f1b65e0b.camel@linux.intel.com>
 <180f069a-bf29-cf05-c9f9-5b1737ec5664@gmail.com>
 <163819167565.18436.3361321032268102014@jlahtine-mobl.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <163819167565.18436.3361321032268102014@jlahtine-mobl.ger.corp.intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>, linaro-mm-sig@lists.linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 29, 2021 at 03:14:35PM +0200, Joonas Lahtinen wrote:
> (Switching to my @linux.intel.com address)
> 
> Quoting Christian König (2021-11-29 14:55:37)
> > Am 29.11.21 um 13:46 schrieb Thomas Hellström:
> > > On Mon, 2021-11-29 at 13:33 +0100, Christian König wrote:
> > >> Am 29.11.21 um 13:23 schrieb Thomas Hellström:
> > >>> Hi, Christian,
> > >>>
> > >>> On Mon, 2021-11-29 at 09:21 +0100, Christian König wrote:
> > >>>> Am 29.11.21 um 08:35 schrieb Thomas Hellström:
> > >>>>> If a dma_fence_array is reported signaled by a call to
> > >>>>> dma_fence_is_signaled(), it may leak the PENDING_ERROR status.
> > >>>>>
> > >>>>> Fix this by clearing the PENDING_ERROR status if we return true
> > >>>>> in
> > >>>>> dma_fence_array_signaled().
> > >>>>>
> > >>>>> Fixes: 1f70b8b812f3 ("dma-fence: Propagate errors to dma-fence-
> > >>>>> array container")
> > >>>>> Cc: linaro-mm-sig@lists.linaro.org
> > >>>>> Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
> > >>>>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > >>>>> Signed-off-by: Thomas Hellström
> > >>>>> <thomas.hellstrom@linux.intel.com>
> > >>>> Reviewed-by: Christian König <christian.koenig@amd.com>
> > >>> How are the dma-buf / dma-fence patches typically merged? If i915
> > >>> is
> > >>> the only fence->error user, could we take this through drm-intel to
> > >>> avoid a backmerge for upcoming i915 work?
> > >> Well that one here looks like a bugfix to me, so either through
> > >> drm-misc-fixes ore some i915 -fixes branch sounds fine to me.
> > >>
> > >> If you have any new development based on that a backmerge of the -
> > >> fixes
> > >> into your -next branch is unavoidable anyway.
> > > Ok, I'll check with Joonas if I can take it through
> > > drm-intel-gt-next, since fixes are cherry-picked from that one. Patch
> > > will then appear in both the -fixes and the -next branch.
> > 
> > Well exactly that's the stuff Daniel told me to avoid :)
> > 
> > But maybe your i915 workflow is somehow better handling that than the 
> > AMD workflow.
> 
> If it's a bugfix to a patch that merged through drm-misc-next, I'd
> always be inclined to merge the fixup using the same process (which
> would be drm-next-fixes).
> 
> In i915 we do always merge the patches to -next first, and never do a
> backmerge of -fixes (as it's a cherry-picked branch) so the workflows
> differ there.
> 
> Here the time between the fixup and the previous patch is so long that
> either way is fine with. So feel free to apply to drm-intel-gt-next.

To make this clear and avoid confusion: drm-misc and drm-intel work
differently for bugfixes.

drm-intel has paid maintainers who take care of cherry-picking and testing
and making sure nothing is lost.

drm-misc is all volunteers, so committers need to make sure stuff ends up
in the right place.

Hence different rules.
-Daniel

> 
> Regards, Joonas
> 
> > Christian.
> > 
> > >
> > > Thanks,
> > > /Thomas
> > >
> > >
> > >> Regards,
> > >> Christian.
> > >>
> > >>> /Thomas
> > >>>
> > >>>
> > >>>>> ---
> > >>>>>     drivers/dma-buf/dma-fence-array.c | 6 +++++-
> > >>>>>     1 file changed, 5 insertions(+), 1 deletion(-)
> > >>>>>
> > >>>>> diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-
> > >>>>> buf/dma-fence-array.c
> > >>>>> index d3fbd950be94..3e07f961e2f3 100644
> > >>>>> --- a/drivers/dma-buf/dma-fence-array.c
> > >>>>> +++ b/drivers/dma-buf/dma-fence-array.c
> > >>>>> @@ -104,7 +104,11 @@ static bool
> > >>>>> dma_fence_array_signaled(struct
> > >>>>> dma_fence *fence)
> > >>>>>     {
> > >>>>>           struct dma_fence_array *array =
> > >>>>> to_dma_fence_array(fence);
> > >>>>>     
> > >>>>> -       return atomic_read(&array->num_pending) <= 0;
> > >>>>> +       if (atomic_read(&array->num_pending) > 0)
> > >>>>> +               return false;
> > >>>>> +
> > >>>>> +       dma_fence_array_clear_pending_error(array);
> > >>>>> +       return true;
> > >>>>>     }
> > >>>>>     
> > >>>>>     static void dma_fence_array_release(struct dma_fence *fence)
> > >
> > 
> _______________________________________________
> Linaro-mm-sig mailing list
> Linaro-mm-sig@lists.linaro.org
> https://lists.linaro.org/mailman/listinfo/linaro-mm-sig

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
