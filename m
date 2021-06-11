Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A70223A4AC2
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 23:48:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3F56F3E3;
	Fri, 11 Jun 2021 21:48:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC59F6F3E3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 21:48:48 +0000 (UTC)
IronPort-SDR: bmTP5QzgjBV2ekRKNPCqAHVzSO//unB39qj2gYOVkBeDBRdgPJ+Zi89DZ91pZX1Od2vrjZ5rc3
 XajTBKXBYUAw==
X-IronPort-AV: E=McAfee;i="6200,9189,10012"; a="185311682"
X-IronPort-AV: E=Sophos;i="5.83,267,1616482800"; d="scan'208";a="185311682"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 14:48:31 -0700
IronPort-SDR: o6xwjx4H3vfEOIwKxOfL7Ad2VqI/FoZEFUivsGpQ2OHdBotoUzDzKBykzx5TW3zC8vQAOoDo6p
 P5JGMPo+1zDg==
X-IronPort-AV: E=Sophos;i="5.83,267,1616482800"; d="scan'208";a="486731137"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.254.186.136])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2021 14:48:31 -0700
Date: Fri, 11 Jun 2021 14:48:30 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH] drm: set DRM_RENDER_ALLOW flag on
 DRM_IOCTL_MODE_CREATE/DESTROY_DUMB ioctls
Message-ID: <20210611214830.GA1067@dongwonk-MOBL.amr.corp.intel.com>
References: <20210610213659.22728-1-dongwon.kim@intel.com>
 <YMMxFHvRCp+u5GvX@phenom.ffwll.local>
 <CACvgo503NE61XOZQ3V8PVVTeMM2TVJonAL+ob80EgOhOVOu4HA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACvgo503NE61XOZQ3V8PVVTeMM2TVJonAL+ob80EgOhOVOu4HA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Understood. I saw weston client apps were failing to create render buffers
from kmsro driver and found it was because they were not allowed to
create and destroy dumb objects then I came up with this patch. I just thought
it's the simplest solution. I didn't know it violates the rule. I think I should
look into kmsro to make the client app to get the render buffer from
ro-device instead. Thanks

On Fri, Jun 11, 2021 at 11:39:46AM +0100, Emil Velikov wrote:
> On Fri, 11 Jun 2021 at 10:47, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Thu, Jun 10, 2021 at 02:36:59PM -0700, Dongwon Kim wrote:
> > > Render clients should be able to create/destroy dumb object to import
> > > and use it as render buffer in case the default DRM device is different
> > > from the render device (i.e. kmsro).
> > >
> > > Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
> >
> > Uh no.
> >
> > Well I know everyone just hacks around this, but the idea behind dumb
> > buffer objects is that they're for kms scanout only. Furthermore on many
> > drivers they allocate a limited resource like CMA memory. Handing that out
> > like candy isn't a great idea.
> >
> > And it's exactly those drivers that kmsro currently is used for where the
> > display driver needs special memory.
> 
> Couldn't agree more. Perhaps we should add an inline comment and/or
> reference to a thread why?
> 
> -Emil
