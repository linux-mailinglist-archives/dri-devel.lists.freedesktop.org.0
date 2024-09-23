Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DB0697E923
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 11:55:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D5C810E23A;
	Mon, 23 Sep 2024 09:55:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="O8/UmZGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 188A010E23A
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 09:55:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 209D2E0017;
 Mon, 23 Sep 2024 09:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1727085301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GtciH+6fYB+wPGJcsZy95HneQ85Qj6dnHAz8ksQYExw=;
 b=O8/UmZGPTcjprGbxxASUWJKHYLiT3S1+ld1M1aV/HU4ca4gwhlpvxE0p0frIyALyRNNNDU
 34iIuvN/kB44vFZ7pK6oXgzLpckAKWVWD00PXU+zes3BkQ+tZJijaTNIPAYa5d1mRRXuvu
 9GzhJXS2qWMD8tpec/NlhOf/z/Cy5r4b6SjxGz1jE6P/iGUNMb0kIyjNVH4sQg8fEXP3mF
 kByYvzEWIfXOM4f92H62Ka59OjgRjuOwRY8HSYMX0hQUH/3XFLbjG4jsuEHfxSGDif9w2U
 7F5rCwHudpY0+3K52KCOPyMIDeIvw7jknQONG0z8tF+J5I7be7NnSuX02/hHbA==
Date: Mon, 23 Sep 2024 11:54:57 +0200
From: Louis Chauvet <louis.chauvet@bootlin.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 jani.nikula@linux.intel.com, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: writeback: Introduce drm managed helpers
Message-ID: <ZvE68e95dwLqjVuW@2a02-8440-b157-69df-aafc-5046-a3b3-4ce9.rev.sfr.net>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 jani.nikula@linux.intel.com, thomas.petazzoni@bootlin.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240906-writeback-drmm-v1-1-01ede328182c@bootlin.com>
 <rz3xk3kwwsfstjrqffp4vfkm7mvn5sdviwjzb5dodmsnb5v2fz@vuamquxmvt4r>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <rz3xk3kwwsfstjrqffp4vfkm7mvn5sdviwjzb5dodmsnb5v2fz@vuamquxmvt4r>
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

Le 22/09/24 - 18:31, Dmitry Baryshkov a écrit :
> On Fri, Sep 06, 2024 at 07:28:17PM GMT, Louis Chauvet wrote:
> > Currently drm_writeback_connector are created by
> > drm_writeback_connector_init or drm_writeback_connector_init_with_encoder.
> > Both of the function uses drm_connector_init and drm_encoder_init, but
> > there is no way to properly clean those structure from outside. By using
> > drm managed variants, we can ensure that the writeback connector is
> > properly cleaned.
> > 
> > This patch introduce drmm_writeback_connector_init, an helper to initialize
> > a writeback connector using drm managed helpers. This function allows the
> > caller to use its own encoder.
> 
> Also it introduces drm_writeback_connector_cleanup(). Ideally that
> should be a separate commit with a proper description.

Will do for the v2.

> You should also
> document that existing users should call that function (and maybe add a
> WARN_ON that can check if the function wasn't called).

It was my initial implementation [2] (usage in [3]), but Maxime suggested 
switching to drmm. If I make it non-static, this will be a new API with no 
user.

I don't know how to add a warning if this function is not called. Do you 
have an example somewhere where a warning is emitted after everything has 
been cleaned up?

> Last, but not least, please don't add API without a user. Please switch
> at least one driver into using this API.

The user will be VKMS, see [1].

[1]:https://lore.kernel.org/all/20240912-google-vkms-managed-v3-4-7708d6ad262d@bootlin.com/
[2]:https://lore.kernel.org/all/20240814-google-remove-crtc-index-from-parameter-v1-11-6e179abf9fd4@bootlin.com/
[3]:https://lore.kernel.org/all/20240814-google-remove-crtc-index-from-parameter-v1-12-6e179abf9fd4@bootlin.com/

Thanks,
Louis Chauvet

> > 
> > Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > ---
> > Hi Maxime, Jani,
> > 
> > I tried with this commit to implement the drm-managed version of writeback 
> > connector initialization. I tested with the current vkms driver, and it 
> > seems to works (at least no crash/warns).
> > 
> > As suggested by Jani, I only created one function, which takes a 
> > NULL-able pointer for encoder/encoder functions/possible_crtc. What do you 
> > think about it?
> > 
> > Regarding the documentation, I think I repeated too much, can I simply add 
> > comments like "see documentation of @... for the details / requirements"?
> > 
> > Good weekend,
> > Louis Chauvet
> > ---
> >  drivers/gpu/drm/drm_writeback.c | 224 ++++++++++++++++++++++++++++++++++------
> >  include/drm/drm_writeback.h     |   7 ++
> >  2 files changed, 201 insertions(+), 30 deletions(-)
> > 
> 
> -- 
> With best wishes
> Dmitry
