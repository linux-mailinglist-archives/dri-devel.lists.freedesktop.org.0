Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D936E7249EB
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 19:14:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A717910E385;
	Tue,  6 Jun 2023 17:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B1710E385
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jun 2023 17:13:57 +0000 (UTC)
Received: from pendragon.ideasonboard.com (om126253223039.31.openmobile.ne.jp
 [126.253.223.39])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E828BAB;
 Tue,  6 Jun 2023 19:13:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1686071610;
 bh=Y4+aPNtD+8i5z2EkM/v0YcopLYBAi67VEz/R3NjWN3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kNaEjfV2/a9eQ5DBvaWRM3349hA8qEN9AA3xbrvZfiPkX/PMcNC47Pp1asekxx3pe
 TosYoyjh3/lkGnyJ5kmk0lyZ+ZJ+5t6XZoW36Tqoj7wLNANrm5glEOXxK6KgS0HNn2
 hIJaumLsOUCR8REHqgA1gEp5Z1xXh9/XnDTh6blo=
Date: Tue, 6 Jun 2023 20:13:51 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Siddh Raman Pant <code@siddh.me>
Subject: Re: [PATCH v9 5/8] drm: Remove usage of deprecated DRM_ERROR
Message-ID: <20230606171351.GK25679@pendragon.ideasonboard.com>
References: <cover.1686047727.git.code@siddh.me>
 <247297c1171bc0ddbde0e90d33961fd5636caf0f.1686047727.git.code@siddh.me>
 <20230606144452.GE5197@pendragon.ideasonboard.com>
 <18891ac9112.109b85f8126467.5521217359687209203@siddh.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <18891ac9112.109b85f8126467.5521217359687209203@siddh.me>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Suraj Upadhyay <usuraj35@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 06, 2023 at 10:36:25PM +0530, Siddh Raman Pant wrote:
> On Tue, 06 Jun 2023 20:14:52 +0530, Laurent Pinchart wrote:
> > Hi Siddh,
> > 
> > Thank you for the patch.
> 
> Anytime :)
> 
> > >       if (!crtcs || !modes || !enabled || !offsets) {
> > > -             DRM_ERROR("Memory allocation failed\n");
> > > +             drm_err(client->dev, "Memory allocation failed\n");
> > 
> > We could probably drop this message as memory allocation functions are
> > already vocal on failure, but that's a separate fix.
> 
> Okay. Should I send a patch at the end of the series removing the
> superfluous messages you pointed out in drm core?

That would be nice, thanks.

> > >       if (!drm_core_init_complete) {
> > > -             DRM_ERROR("DRM core is not initialized\n");
> > > +             drm_err(NULL, "DRM core is not initialized\n");
> > 
> > Could this use dev ?
> 
> No, the drm_device's dev pointer is assigned later. See line 621.
> 
> > >       if (!vma_offset_manager) {
> > > -             DRM_ERROR("out of memory\n");
> > > +             drm_err(dev, "out of memory\n");
> > 
> > Same here, I think the message could be dropped.
> 
> Okay.
> 
> > >       if (!ht->table) {
> > > -             DRM_ERROR("Out of memory for hash table\n");
> > > +             drm_err(NULL, "Out of memory for hash table\n");
> > 
> > Same.
> 
> Okay.
>  
> > With the commit message fixed as mentioned in the review of an earlier
> > patch in this series, and the issue in drm_dev_init() addressed if
> > needed,
> > 
> > Reviewed-by: Laurent Pinchart laurent.pinchart+renesas@ideasonboard.com>

-- 
Regards,

Laurent Pinchart
