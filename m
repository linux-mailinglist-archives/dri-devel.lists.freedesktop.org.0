Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535019C8865
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 12:07:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD35110E7DC;
	Thu, 14 Nov 2024 11:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="NhZsYQrO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E1DE10E7DC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 11:07:07 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1CDC6827;
 Thu, 14 Nov 2024 12:06:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1731582412;
 bh=MC0qAnKUOKRMjKCytDn/FhqZ625PpC6tf3/omYyZ3h0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NhZsYQrORAxxFCoHmARsziNnA7Nr/4PueBSPyshQGdet6rqyDUnJ4EPeFylQs6yG+
 9RYPlbmmeEzrEc2MlpZ+DKF1YkTiBE5pnEfFFhDiQ/jskYh/3un3/LKtESTE34Xse5
 Tk7NpZ5B0LdtMmUVCXNUzhPZlvncfw9twvAgwmOs=
Date: Thu, 14 Nov 2024 13:06:58 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/bridge: Constify struct i2c_device_id
Message-ID: <20241114110658.GF26171@pendragon.ideasonboard.com>
References: <bdba1f49b4b48e22628482b49ce81f8e1f0d97b1.1731445901.git.christophe.jaillet@wanadoo.fr>
 <20241112224335.GA29944@pendragon.ideasonboard.com>
 <71348ac9-07bf-460f-a200-653f57ed4061@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71348ac9-07bf-460f-a200-653f57ed4061@wanadoo.fr>
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

Hi Christophe,

On Wed, Nov 13, 2024 at 10:19:24PM +0100, Christophe JAILLET wrote:
> Le 12/11/2024 à 23:43, Laurent Pinchart a écrit :
> > On Tue, Nov 12, 2024 at 10:12:25PM +0100, Christophe JAILLET wrote:
> >> 'struct i2c_device_id' is not modified in these drivers.
> >>
> >> Constifying this structure moves some data to a read-only section, so
> >> increase overall security.
> >>
> >> On a x86_64, with allmodconfig, as an example:
> >> Before:
> >> ======
> >>     text	   data	    bss	    dec	    hex	filename
> >>    15566	    987	     32	  16585	   40c9	drivers/gpu/drm/bridge/chipone-icn6211.o
> >>
> >> After:
> >> =====
> >>     text	   data	    bss	    dec	    hex	filename
> >>    15630	    923	     32	  16585	   40c9	drivers/gpu/drm/bridge/chipone-icn6211.o
> >>
> >> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> >> ---
> >> Compile tested-only.
> >> ---
> >>   drivers/gpu/drm/bridge/chipone-icn6211.c   | 2 +-
> >>   drivers/gpu/drm/bridge/lontium-lt9211.c    | 2 +-
> >>   drivers/gpu/drm/bridge/lontium-lt9611.c    | 2 +-
> >>   drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
> >>   drivers/gpu/drm/bridge/ti-sn65dsi83.c      | 2 +-
> >>   drivers/gpu/drm/bridge/ti-sn65dsi86.c      | 2 +-
> > 
> > While at it, could you address drivers/gpu/drm/i2c/tda9950.c too ? If I
> > were to push a tad more, there are only two other drivers in the kernel
> > with the same issues outside of drivers/gpu/ according to
> 
> Hi Laurent,
> 
> this is in my todo list. I wanted to send it separately because all 
> these files are in gpu/drm/bridge/ and tda9950.c is in gpu/drm/.
> 
> Most of the times, maintainers ask for separate patches when several 
> drivers are patched. For such clean-ups, I try at least to group them by 
> directory.

I would probably have included tda9950.c in this patch, but I'm also
fine handling it separately.

> Same answer the other files in input and sound. Patches will be sent in 
> a few days.

Thank you. If you have extra time, there are also a handful of similar
issues with of_device_id :-)

> I've also sent one for the documentation [1] and will send one for 
> const_structs.checkpatch as well.

Thank you for that.

> CJ
> 
> [1]: https://lore.kernel.org/linux-kernel/c8e6da4adb7381ee27e8e11854c9d856382cdc93.1731445244.git.christophe.jaillet@wanadoo.fr/
> 
> > $ git grep '^static struct i2c_device_id'
> > drivers/gpu/drm/bridge/chipone-icn6211.c:static struct i2c_device_id chipone_i2c_id[] = {
> > drivers/gpu/drm/bridge/lontium-lt9211.c:static struct i2c_device_id lt9211_id[] = {
> > drivers/gpu/drm/bridge/lontium-lt9611.c:static struct i2c_device_id lt9611_id[] = {
> > drivers/gpu/drm/bridge/lontium-lt9611uxc.c:static struct i2c_device_id lt9611uxc_id[] = {
> > drivers/gpu/drm/bridge/ti-sn65dsi83.c:static struct i2c_device_id sn65dsi83_id[] = {
> > drivers/gpu/drm/bridge/ti-sn65dsi86.c:static struct i2c_device_id ti_sn65dsi86_id[] = {
> > drivers/gpu/drm/i2c/tda9950.c:static struct i2c_device_id tda9950_ids[] = {
> > drivers/input/keyboard/cypress-sf.c:static struct i2c_device_id cypress_sf_id_table[] = {
> > sound/soc/codecs/cs42l51-i2c.c:static struct i2c_device_id cs42l51_i2c_id[] = {
> > 
> > :-)
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > 
> >>   6 files changed, 6 insertions(+), 6 deletions(-)

-- 
Regards,

Laurent Pinchart
