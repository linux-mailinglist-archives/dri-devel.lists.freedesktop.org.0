Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDD8168728
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 20:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EA46E480;
	Fri, 21 Feb 2020 19:01:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BE2E6E480;
 Fri, 21 Feb 2020 19:01:02 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id A1E9C8066D;
 Fri, 21 Feb 2020 20:00:58 +0100 (CET)
Date: Fri, 21 Feb 2020 20:00:57 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 3/4] drm/mgag200: Use simple encoder
Message-ID: <20200221190057.GA27701@ravnborg.org>
References: <20200218084815.2137-1-tzimmermann@suse.de>
 <20200218084815.2137-4-tzimmermann@suse.de>
 <20200220185642.GA20011@ravnborg.org>
 <3044661c-7552-e685-37b3-88865f97a991@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3044661c-7552-e685-37b3-88865f97a991@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10
 a=B5t_mNtYuAhHjmY7mtcA:9 a=CjuIK1q_8ugA:10
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, kraxel@redhat.com,
 alexander.deucher@amd.com, spice-devel@lists.freedesktop.org,
 emil.velikov@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.

On Fri, Feb 21, 2020 at 08:48:48AM +0100, Thomas Zimmermann wrote:
> Hi Sam
> 
> thanks for reviewing the patch set.
> 
> Am 20.02.20 um 19:56 schrieb Sam Ravnborg:
> > Hi Thomas.
> > 
> > On Tue, Feb 18, 2020 at 09:48:14AM +0100, Thomas Zimmermann wrote:
> >> The mgag200 driver uses an empty implementation for its encoder. Replace
> >> the code with the generic simple encoder.
> >>
> >> v2:
> >> 	* rebase onto new simple-encoder interface
> >>
> >> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> >> ---
> >>  drivers/gpu/drm/mgag200/mgag200_drv.h  |  7 ---
> >>  drivers/gpu/drm/mgag200/mgag200_mode.c | 61 ++------------------------
> >>  2 files changed, 3 insertions(+), 65 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
> >> index aa32aad222c2..9bb9e8e14539 100644
> >> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
> >> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
> >> @@ -95,7 +95,6 @@
> >>  #define MATROX_DPMS_CLEARED (-1)
> >>  
> >>  #define to_mga_crtc(x) container_of(x, struct mga_crtc, base)
> >> -#define to_mga_encoder(x) container_of(x, struct mga_encoder, base)
> >>  #define to_mga_connector(x) container_of(x, struct mga_connector, base)
> >>  
> >>  struct mga_crtc {
> >> @@ -110,12 +109,6 @@ struct mga_mode_info {
> >>  	struct mga_crtc *crtc;
> >>  };
> >>  
> >> -struct mga_encoder {
> >> -	struct drm_encoder base;
> >> -	int last_dpms;
> >> -};
> >> -
> >> -
> >>  struct mga_i2c_chan {
> >>  	struct i2c_adapter adapter;
> >>  	struct drm_device *dev;
> > 
> > Any particular reason why the drm_encoder is not embedded in struct
> > mga_device?
> > 
> > I found it more elegant - like you did it for ast in the previous patch.
> 
> I think I wanted something that uses drm_simple_encoder_create(). But I
> can change that. The embedded variant is indeed better.

You should consider to drop drm_simple_encoder_create() until there
is a driver that really needs it.

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
