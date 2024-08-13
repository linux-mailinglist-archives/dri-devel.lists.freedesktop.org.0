Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD66A950BCB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Aug 2024 19:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A158610E3BC;
	Tue, 13 Aug 2024 17:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="JORC/T0g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4A710E3BA
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Aug 2024 17:59:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE18460005;
 Tue, 13 Aug 2024 17:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723571943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=25Fbsx5jgBfKsyKjRJJa4plhorxoqKaUAERcBQL7aeI=;
 b=JORC/T0gcCwUhGtsLTHoBIDD5spF6BBtbBprWVBiQalC5jg7Fhqv8Ydy0q578dyfAJ61p/
 bjFzM5YXsQLedeztCR0krNJewWAKhJ1t5FO0cGrJptcqJoU2f3JJodP0DneVCoJXk4E7Sx
 zrzk47Re+wJ4tgYiiCiKy3K4TF7MLKsswlKDsoYk25huWzrvHiwuGWykbRG/06aThc/htG
 S92TUJ8Teid/oipUZr+PFz2cOuIVk3MJFoirBCMnZ//ahaetDOI9FYfLaH4Lbc2tfgRm5D
 VqHrSCYwhPihm7OJLCKizjXhwDyCq+LEB50uxJXqt0yPqXbP9UgrNjvlJbZNJQ==
Date: Tue, 13 Aug 2024 19:58:55 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Cc: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas@bootlin.com
Subject: Re: [RFC PATCH 00/17] VKMS: Add configfs support
Message-ID: <Zrue3980Z4S6P52z@louis-chauvet-laptop>
Mail-Followup-To: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?=
 <jose.exposito89@gmail.com>, 
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com,
 mairacanal@riseup.net, hamohammed.sa@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 thomas@bootlin.com
References: <20240813105134.17439-1-jose.exposito89@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240813105134.17439-1-jose.exposito89@gmail.com>
X-GND-Sasl: louis.chauvet@bootlin.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le 13/08/24 - 12:44, José Expósito a écrit :
> Hi everyone,

Hi José,
 
> This RFC implements support to configure VKMS using configfs.
> It allows to:
> 
>  - Create multiple devices
>  - Configure multiple overlay planes, CRTCs, encoders and
>    connectors
>  - Enable or disable cursor plane and writeback connector for
>    each CRTC
>  - Hot-plug/unplug connectors after device creation
>  - Disable the creation of the default VKMS instance to be
>    able to use only the configfs ones
> 
> This work is based on a previous attempt to implement configfs
> support by Jim Shargo and Brandon Pollack [1].
> I tried to keep the changes as minimal and simple as possible
> and addressed Sima's comments on [1].
> 
> Currently, there is another RFC by Louis Chauvet [2]. As I
> mentioned on his RFC, I'm not trying to push my implementation.
> Instead, I think that having 2 implementations will make code
> review way easier and I don't mind which implementation is used
> as long as we get the feature implemented :)

I will send few series tomorrow, don't panic, there will be 9 series and a 
total of ~50 commits (I have many conflict to rebase only the configFS 
part, and even if it was easy, I plan to submit all of my work, not 
everything will be RFC).

> I'm looking forward to analyzing Louis's implementation, seeing
> what the differences are and finding a common solution.

There are four main differences:
- I complelty splitted vkms_config and vkms_configfs structures 
- I splitted my work in many different series
- I created a real platform device driver
- I did not manage index by hand, I let drm core doing it
- I used list to link crtc/planes/encoders and not bitfield (because of 
  the previous point)
- The primary and cursor planes are fully configurable

The first two points are personnal preferences, so I am open to 
discussion.

The third point was already discussed before, I don't know if it is a good 
solution or not. I think it should be easy to remove it.

But for the index managment, I really think that for our usage 
in ConfigFS, bitfields are not a good solution and as shown in this 
series, very error-prone. If you have a better solution than what I did, 
let me know, I am not very happy with mine too.

The last point is also important, we don't want to break uAPI once this 
series is merged, so having "default hidden planes" that can't be 
configured is annoying as we will have to manage them with a special case.

> What's missing?
> 
>  - DebugFS only works for the default VKMS instance.
>    If we want to support it on instances created with configfs
>    I'll need to implement it.

Same on my side, I forgot to reimplement this :-). It will not be in my 
RFC, but on the v1 for sure!

> Known bugs:
> 
>  - When a CRTC is added and removed before device creation, there
>    is a vblank warning.
>    The issue is caused because vblanks are referenced using the
>    CRTC index but, because one of the CRTCs is removed, the
>    indices are not consecutives and drm_crtc_vblank_crtc() tries to
>    access and invalid index
>    I'm not sure if CRTC's indices *must* start at 0 and be
>    consecutives or if this is a bug in the drm_crtc_vblank_crtc()
>    implementation.

Very nice work, but you hurted many issue I had too, and I attempted to 
solve them as nicely as I can. Overall there is one main issues for me:
the crtc index managment is not correct and the configfs behavior is very 
easily broken because of this.

This is an issue for two reason I think:
- We are trying to implement a new index allocation mecanism, but it is 
  not very difficult to let drm manage this part on device creation, so 
  maybe just dont store indexes in config
- The usage of a simple index++ is not suitable for configFS usecase, 
  crating 32 crtcs and deleting 1 should be possible:
	mkdir {1..32};rmdir 1;mkdir 1
  but the index of 1 is now 33, which is forbidden by drm, so you have to 
  do a "complex" algorithim "find_first_value_not_used_bellow_32".

Thanks for all your work! You were right, while reviewing your work, I 
found issues in mine :-)

Have a nice day,
Louis Chauvet

> 
> Best wishes,
> José Expósito
> 
> [1] https://patchwork.kernel.org/project/dri-devel/list/?series=780110&archive=both
> [2] https://lore.kernel.org/dri-devel/ZrZZFQW5RiG12ApN@louis-chauvet-laptop/T/#u
> 
> José Expósito (17):
>   drm/vkms: Extract vkms_config header
>   drm/vkms: Move default_config creation to its own function
>   drm/vkms: Set device name from vkms_config
>   drm/vkms: Allow to configure multiple CRTCs
>   drm/vkms: Use managed memory to create encoders
>   drm/vkms: Allow to configure multiple encoders
>   drm/vkms: Use managed memory to create connectors
>   drm/vkms: Allow to configure multiple connectors
>   drm/vkms: Allow to configure multiple overlay planes
>   drm/vkms: Allow to change connector status
>   drm/vkms: Add and remove VKMS instances via configfs
>   drm/vkms: Allow to configure multiple CRTCs via configfs
>   drm/vkms: Allow to configure multiple encoders via configfs
>   drm/vkms: Allow to configure multiple encoders
>   drm/vkms: Allow to configure multiple planes via configfs
>   drm/vkms: Allow to configure the default device creation
>   drm/vkms: Remove completed task from the TODO list
> 
>  Documentation/gpu/vkms.rst            | 102 +++-
>  drivers/gpu/drm/vkms/Kconfig          |   1 +
>  drivers/gpu/drm/vkms/Makefile         |   4 +-
>  drivers/gpu/drm/vkms/vkms_composer.c  |  30 +-
>  drivers/gpu/drm/vkms/vkms_config.c    | 265 ++++++++++
>  drivers/gpu/drm/vkms/vkms_config.h    | 101 ++++
>  drivers/gpu/drm/vkms/vkms_configfs.c  | 721 ++++++++++++++++++++++++++
>  drivers/gpu/drm/vkms/vkms_configfs.h  |   9 +
>  drivers/gpu/drm/vkms/vkms_crtc.c      |  99 ++--
>  drivers/gpu/drm/vkms/vkms_drv.c       |  75 ++-
>  drivers/gpu/drm/vkms/vkms_drv.h       |  52 +-
>  drivers/gpu/drm/vkms/vkms_output.c    | 187 ++++---
>  drivers/gpu/drm/vkms/vkms_plane.c     |   6 +-
>  drivers/gpu/drm/vkms/vkms_writeback.c |  27 +-
>  14 files changed, 1464 insertions(+), 215 deletions(-)
>  create mode 100644 drivers/gpu/drm/vkms/vkms_config.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_config.h
>  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.c
>  create mode 100644 drivers/gpu/drm/vkms/vkms_configfs.h
> 
> -- 
> 2.46.0
> 

-- 
Louis Chauvet, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
