Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0761CA8E7
	for <lists+dri-devel@lfdr.de>; Fri,  8 May 2020 13:03:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031FC6EAE2;
	Fri,  8 May 2020 11:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70F6F6EAE2
 for <dri-devel@lists.freedesktop.org>; Fri,  8 May 2020 11:02:55 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 4250180500;
 Fri,  8 May 2020 13:02:53 +0200 (CEST)
Date: Fri, 8 May 2020 13:02:51 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 36/36] drm/gem: remove _unlocked suffix in
 drm_object_put_unlocked
Message-ID: <20200508110251.GA15931@ravnborg.org>
References: <20200507150822.114464-1-emil.l.velikov@gmail.com>
 <20200507150822.114464-37-emil.l.velikov@gmail.com>
 <20200507181413.GD13247@ravnborg.org>
 <CACvgo52pq=of3NTAte5anuYGfXRiGXY7PL6b9gp7SWGpOZSw+w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo52pq=of3NTAte5anuYGfXRiGXY7PL6b9gp7SWGpOZSw+w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=QX4gbG5DAAAA:8
 a=gMF24IRGu3KNNTbqFggA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=AbAUZ8qAyYyZVLSsDulk:22
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
Cc: David Airlie <airlied@linux.ie>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Emil.

On Fri, May 08, 2020 at 11:15:24AM +0100, Emil Velikov wrote:
> On Thu, 7 May 2020 at 19:14, Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > Hi Emil.
> >
> > On Thu, May 07, 2020 at 04:08:22PM +0100, Emil Velikov wrote:
> > > From: Emil Velikov <emil.velikov@collabora.com>
> > >
> > > Spelling out _unlocked for each and every driver is a annoying.
> > > Especially if we consider how many drivers, do not know (or need to)
> > > about the horror stories involving struct_mutex.
> > >
> > > Just drop the suffix. It makes the API cleaner.
> > >
> > > Done via the following script:
> > >
> > > __from=drm_gem_object_put_unlocked
> > > __to=drm_gem_object_put
> > > for __file in $(git grep --name-only $__from); do
> > >   sed -i  "s/$__from/$__to/g" $__file;
> > > done
> > >
> > > With this patch, the _unlocked define is no longer needed - remove it.
> > >
> > > Cc: David Airlie <airlied@linux.ie>
> > > Cc: Daniel Vetter <daniel@ffwll.ch>
> > > Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
> >
> > I had prefeered this was spilt in three patches:
> > 1) drm_gem*
> > 2) drm_client, drm_prime, drm-mm
> > 3) Removal of the define
> >
> > Maybe just squash 1) and 2) in the above, but I like it spelled out that
> > the backward compatible define is dropped.
> >
> Think that we can combine your and Thomas' suggestions:
> - fold all of drm in once patch - move it all to patch 11
> - keep the #define removal as separate patch
Yup, sound like a good plan.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
