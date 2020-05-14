Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B27831D2FD7
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 14:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046256EB2C;
	Thu, 14 May 2020 12:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6886EB29
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 12:32:55 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id f13so1755571wmc.5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 May 2020 05:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Hs0b6CimQtwFi7aqQ0x2t0EfYjjIMEZ9m/N7F6YQDAY=;
 b=YgWHkQTYQPFppqYsLPN4O7w4lYivEAnsEzMA+LRaWDfv1qHjFZT7jJduso+EFh/hnh
 BmsjyF8UrLtntddw7ns7M8+fhWv+y4cDydxv3fKuQ73T16tDKeVw7qrfp+ced3x5ZpsD
 AkPmYBhTTcBPvfKZDxpbZ0iFajRNhq0rxkirk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Hs0b6CimQtwFi7aqQ0x2t0EfYjjIMEZ9m/N7F6YQDAY=;
 b=I8/hxI1Dk0myvuc9UVfm8V6ivzN8EwIH4FPo3tBM2vhGYNCpEIyOYX+k4Ws5eMIWoz
 THdBkADnN8SvqMBjSpugJMB1SJkfLWYG6rjvSB8Aqi0PYUFjgt6lwE6JHAu2fHBo/wWf
 Geb5z105tq9xWRvDOSMvDkeYCpkAoZJm0lC/j17piINIq/2Ob6G6mNBaeAK5yxHvdL9l
 WEPvwpUAnVXPHx8yHmv0DTZDv2yq4QNEF65789FLWf0v3F9ZkU9uvIUohp0sR5W1Gd9N
 D732C3dbMmwyl7+hH/i6jK3wNZ9TaDWCgsA7UJVCDSnaNJuWti4llqpfSeXq8UmyWmLh
 6IHw==
X-Gm-Message-State: AGi0PuZirQakHVkWsNjix8d28MTmAfitpLtLaPRw0n4Zhekd5brnr2ry
 86b+9gNe+xY+up5VkspTj7ykPg==
X-Google-Smtp-Source: APiQypLwlYFf18uBo+jfC26cvoH7AqKeY4MEhPzSMIyKaNwga5O97X2GrG0P30+6HD8/aszlGaAbDg==
X-Received: by 2002:a1c:bbc5:: with SMTP id
 l188mr27784086wmf.163.1589459573864; 
 Thu, 14 May 2020 05:32:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id x23sm38645260wmj.6.2020.05.14.05.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 05:32:53 -0700 (PDT)
Date: Thu, 14 May 2020 14:32:51 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Subject: Re: [PATCH] drm: avoid spurious EBUSY due to nonblocking atomic
 modesets
Message-ID: <20200514123251.GR206103@phenom.ffwll.local>
References: <20200408162403.3616785-1-daniel.vetter@ffwll.ch>
 <CAPj87rMJNwp0t4B0KxH7J_2__4eT7+ZJeG-=_juLSDhPc2hLHQ@mail.gmail.com>
 <CAKMK7uFU7ST9LWmpfhTuk1-_ES6VU-cUogMnPjA15BWFsEVacw@mail.gmail.com>
 <CAPj87rNRLsGJcGEM3dYnitYMwjh7iMNjo9KT=xcDZ0hebRC9iw@mail.gmail.com>
 <CAKMK7uG6krmntPW6Mud7aouvM=NRspYHoBdKeSwxS8wDwDZRkQ@mail.gmail.com>
 <CAPj87rO1oG00ipUA57a1kGu7K2=-ugTreM7QXy_tWjbZ+KzkFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPj87rO1oG00ipUA57a1kGu7K2=-ugTreM7QXy_tWjbZ+KzkFg@mail.gmail.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, May 14, 2020 at 08:40:21AM +0100, Daniel Stone wrote:
> On Thu, 14 May 2020 at 08:25, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > On Thu, May 14, 2020 at 9:18 AM Daniel Stone <daniel@fooishbar.org> wrote:
> > > On Thu, 14 May 2020 at 08:08, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > > I'd be very much in favour of putting the blocking down in the kernel
> > > at least until the kernel can give us a clear indication to tell us
> > > what's going on, and ideally which other resources need to be dragged
> > > in, in a way which is distinguishable from your compositor having
> > > broken synchronisation.
> >
> > We know, the patch already computes that ... So would be a matter of
> > exporting that to userspace. We have a mask of all additional crtc
> > that will get an event and will -EBUSY until that's done.
> 
> Yep, but unless and until that happens, could we please get this in?
> Given it would require uAPI changes, we'd need to modify all the
> compositors to work with the old path (random EBUSY) and the new path
> (predictable and obvious), so at least preserving the promise that
> per-CRTC updates are really independent would be good.

I haven't found the time to look at the intel-gfx-ci fail in igt nor
really think about that. Nor care enough to just hammer this ignoring ci,
since I didn't even get around to understand why the igt now fails If
someone else takes this over, happy to see it land.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
