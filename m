Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA8E13B6E1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 02:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D82CA6E808;
	Wed, 15 Jan 2020 01:28:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567D26E808
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2020 01:28:02 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B85C580487;
 Wed, 15 Jan 2020 02:27:57 +0100 (CET)
Date: Wed, 15 Jan 2020 02:27:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Subject: Re: [PATCH 09/10] drm/vkms: plane_state->fb iff plane_state->crtc
Message-ID: <20200115012756.GA4129@ravnborg.org>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
 <20191213172612.1514842-9-daniel.vetter@ffwll.ch>
 <20200114235013.o6y2hgu6mzfpf6dx@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200114235013.o6y2hgu6mzfpf6dx@smtp.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=QyXUC8HyAAAA:8
 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8 a=tgIJ6WjhPxUqa3LDiFcA:9
 a=CjuIK1q_8ugA:10 a=ViBQuv4y83sA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rodrigo.

On Tue, Jan 14, 2020 at 06:50:13PM -0500, Rodrigo Siqueira wrote:
> On 12/13, Daniel Vetter wrote:
> > Checking both is one too much, so wrap a WARN_ON around it to stope
> > the copypasta.
> > 
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  drivers/gpu/drm/vkms/vkms_plane.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> > index 5fc8f85aaf3d..6d31265a2ab7 100644
> > --- a/drivers/gpu/drm/vkms/vkms_plane.c
> > +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> > @@ -117,7 +117,7 @@ static int vkms_plane_atomic_check(struct drm_plane *plane,
> >  	bool can_position = false;
> >  	int ret;
> >  
> > -	if (!state->fb | !state->crtc)
> > +	if (!state->fb || WARN_ON(!state->crtc))
> >  		return 0;
> >  
> >  	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
> > -- 
> > 2.24.0
> >
> 
> Hi,
> 
> Sorry, the delay in taking a look at this patch.
> 
> I tried to find the whole series for getting the context related to this
> patch, but I could not find it in my mailbox. Could you shed some light
> here? Why check fb and crtc is too much? How the WARN_ON fix the issue?

You can find some background in the first patch:
https://lists.freedesktop.org/archives/dri-devel/2019-December/248981.html

Hope this sched enough light on the topic.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
