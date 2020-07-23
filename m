Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA59B22B1C7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 16:46:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF3C66E17D;
	Thu, 23 Jul 2020 14:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BCF6E0E2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 14:46:39 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jycUX-0006B6-UH; Thu, 23 Jul 2020 16:46:37 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jycUX-0000v0-Dj; Thu, 23 Jul 2020 16:46:37 +0200
Message-ID: <d05752c669260a7662d7208a4ce602b75ff33b30.camel@pengutronix.de>
Subject: Re: [PATCH] drm/simple_kms_helper: add drmm_simple_encoder_init()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: daniel@ffwll.ch
Date: Thu, 23 Jul 2020 16:46:37 +0200
In-Reply-To: <20200722222243.GM6419@phenom.ffwll.local>
References: <20200722132558.28289-1-p.zabel@pengutronix.de>
 <34224c32-7c17-4c7e-1ec9-03215ec7ed8a@suse.de>
 <e11f2cc1a3348260d08d13f1d43df4ef534f09f6.camel@pengutronix.de>
 <20200722222243.GM6419@phenom.ffwll.local>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Thu, 2020-07-23 at 00:22 +0200, daniel@ffwll.ch wrote:
[...]
> Yeah the drmm_ versions of these need to check that the ->cleanup hook is
> NULL.
>
> Also there's not actually a double-free, since drm_foo_cleanup removes it
> from the lists, which means drm_mode_config_cleanup won't even see it. But
> if the driver has some additional code in ->cleanup that won't ever run,
> so probably still a bug.
>
> I also think that the drmm_foo_ wrappers should also do the allocation
> (and upcasting) kinda like drmm_dev_alloc(). Otherwise we're still stuck
> with tons of boilerplate.

Ok, I'll try this:

drmm_encoder_init() variant can verify that the passed
drm_encoder_funcs::destroy hook is NULL.

drmm_simple_encoder_init() can just provide empty drm_encoder_funcs
internally.

> For now I think it's ok if drivers that switch to drmm_ just copypaste,
> until we're sure this is the right thing to do. And then maybe also roll
> these out for all objects that stay for the entire lifetime of drm_device
> (plane, crtc, encoder, plus variants). Just to make sure we're consistent
> across all of them.

Thank you for clarifying, I wasn't sure this was the goal. I've started
with this function mostly because this is the most used one in imx-drm
and the only one where I didn't have to deal with va_args boilerplate.

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
