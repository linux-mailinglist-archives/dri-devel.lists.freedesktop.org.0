Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01BD42E210
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 21:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62896E8C1;
	Thu, 14 Oct 2021 19:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07BFB6E8C1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 19:35:25 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id e50fd701-2d25-11ec-ac3c-0050568cd888;
 Thu, 14 Oct 2021 19:35:32 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id D1A3E194B57;
 Thu, 14 Oct 2021 21:35:29 +0200 (CEST)
Date: Thu, 14 Oct 2021 21:35:20 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: Ignore -EPROBE_DEFER when bridge attach fails
Message-ID: <YWiGeAaHoAL6Qga2@ravnborg.org>
References: <00493cc61d1443dab1c131c46c5890f95f6f9b25.1634068657.git.agx@sigxcpu.org>
 <YWXrPE/G6gaXA6o3@ravnborg.org>
 <YWXyUHAeoWUeyMY4@qwark.sigxcpu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YWXyUHAeoWUeyMY4@qwark.sigxcpu.org>
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

Hi Guido,

> > >  
> > > +	if (ret != -EPROBE_DEFER) {
> > >  #ifdef CONFIG_OF
> > > -	DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> > > -		  bridge->of_node, encoder->name, ret);
> > > +		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",
> > > +			  bridge->of_node, encoder->name, ret);
> > 
> > It would be better to use drm_probe_err().
> 
> That's what i thought initially but since the rest here uses DRM_*
> logging i stuck with it. Happy to change that though.

If we continue to use the deprecated DRM_ logging functions then we will
never get rid of them. And then I like the simplicity of
drm_probe_err().

In the end it is up to you.

	Sam
