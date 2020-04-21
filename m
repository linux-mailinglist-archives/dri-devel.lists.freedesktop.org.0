Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EA71B313F
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 22:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2266C6E0D2;
	Tue, 21 Apr 2020 20:32:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E4F6E0D2;
 Tue, 21 Apr 2020 20:32:52 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id DA4F980472;
 Tue, 21 Apr 2020 22:32:46 +0200 (CEST)
Date: Tue, 21 Apr 2020 22:32:45 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/59] drm: Add devm_drm_dev_alloc macro
Message-ID: <20200421203245.GA25673@ravnborg.org>
References: <20200415074034.175360-1-daniel.vetter@ffwll.ch>
 <20200415074034.175360-2-daniel.vetter@ffwll.ch>
 <4d5229c2-acb4-b76f-13c7-88a5f3de4760@suse.de>
 <CAKMK7uH2vhrQ7eTTF1B+==UJS9ZxhDv2RDvR0ct4P0vVJobf=w@mail.gmail.com>
 <ea9c5a37-118f-1243-26f7-f03a3068dfeb@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea9c5a37-118f-1243-26f7-f03a3068dfeb@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=T6N2gumegzX6L0F5R2IA:9 a=CjuIK1q_8ugA:10
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

> > Hm, I see the point of this (and the dev_field below, although I'd go
> > with dev_member there for some consistency with other macros using
> > offset_of or container_of), but I'm not sure about the dev_ prefix.
> > Drivers use that sometimes for the struct device *, and usage for
> > struct drm_device * is also very inconsistent. I've seen ddev, drm,
> > dev and base (that one only for embedded structs ofc). So not sure
> > which prefix to pick, aside from dev_ seems the most confusing. Got
> > ideas?
> 
> We have pdev for the PCI device, dev for the abstract device, and things
> like mdev for struct mga_device in mgag200. So I'd go with ddev. I don't
> like drm, because it could be anything in DRM. I guess struct drm_driver
> is more 'drm' than struct drm_device.
> 
> But all of this is bikeshedding. It's probably best to keep the patch
> as-is, and maybe rename variables later if we ever find consent on the
> naming.

bikeshedding - I know.
But reading code is is quite natural for me that drm equals the central
drm_device data structure. Maybe thats because this was is in the code
I started looking at.

So as an example:

	drm_err(drm, "bla bla\n");

This parses nicely and is easy to type and get right.
And matches nicely that drm_device => drm.
But bikeshedding  - I will go to bed...
(Whatever is the conclusion we should not hold back the patch in
questions).

	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
