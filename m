Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A81459D970C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 13:11:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B866C10E3F8;
	Tue, 26 Nov 2024 12:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=geanix.com header.i=@geanix.com header.b="DhRRFcUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E28A810E3F8
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 12:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com; 
 s=default2211;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID; bh=fPHzRXhcBL/qtJnpL3/OZFvPlNjRqASdJESrY85bw0I=; b=DhRRFc
 UN0xzU37DjRn1oU1/gBRd8wRXM6sWuUQ0DOLtuxsBOJutpFh4jEMe1pGznBXLYshoP1OFLPXaAxfK
 tOe7gRdfCFMJexnjnWTA5OH9WvOvcn/Mos8jRMj+F5L4WzmO2Ri0s8tNsxmsNWLhHAtBKVbBBJ4vT
 TpS+kja1I3YwoflDtW9oX1PpJJRUyd8nnuoEApLCiFAp8c2bovd8TWdFTmTV2z/mTmBPLGIx03izF
 1qh+GrZRK5ticDbiOxOM+wmwjZL/LuRgYVZQN8vbEyEbNW5qaaOlGUWuH/ORlQ0IvgQVjikK/zK/w
 mDUNpa3wpkajpiu2lfMnOLvOljhA==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
 by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <sean@geanix.com>)
 id 1tFuPu-000FS1-0K; Tue, 26 Nov 2024 13:11:42 +0100
Received: from [185.17.218.86] (helo=Seans-MacBook-Pro.local)
 by sslproxy06.your-server.de with esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.96) (envelope-from <sean@geanix.com>) id 1tFuPs-000LCg-30;
 Tue, 26 Nov 2024 13:11:40 +0100
Date: Tue, 26 Nov 2024 13:11:40 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 1/3] drm/modes: introduce drm_mode_validate_mode()
 helper function
Message-ID: <ycvevzp46wv4hr6ktexxjkpifav3wi4glat4a5jagghclcpagb@3jpiyehl2fn7>
References: <20241125-dsi-relax-v2-0-9113419f4a40@geanix.com>
 <20241125-dsi-relax-v2-1-9113419f4a40@geanix.com>
 <20241125-gleaming-anteater-of-perfection-42bd2b@houat>
 <bfuj6w6hsbfpdw24th6dl3ugvj45op6jb45gx5ab5pulud7hiz@o2zbn45z3lt4>
 <20241126-refreshing-slick-pig-baebab@houat>
 <zmrcuqiyz5gojhusysy7cytluedslqmfgzuslutqeg65iv7ju6@bggk7qbm6eas>
 <20241126-observant-coyote-of-glee-3b94dd@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126-observant-coyote-of-glee-3b94dd@houat>
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27469/Tue Nov 26 10:58:20 2024)
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

On Tue, Nov 26, 2024 at 01:09:10PM +0100, Maxime Ripard wrote:
> On Tue, Nov 26, 2024 at 12:34:26PM +0100, Sean Nyekjaer wrote:
> > Hi,
> > 
> > On Tue, Nov 26, 2024 at 09:38:55AM +0100, Maxime Ripard wrote:
> > > Hi,
> > > 
> > > On Tue, Nov 26, 2024 at 08:36:00AM +0100, Sean Nyekjaer wrote:
> > > > On Mon, Nov 25, 2024 at 05:00:56PM +0100, Maxime Ripard wrote:
> > > > > On Mon, Nov 25, 2024 at 02:49:26PM +0100, Sean Nyekjaer wrote:

[...]

> > > > > 
> > > > > Thanks a lot for doing that!
> > > > > 
> > > > > I wonder about the naming though (and prototype). I doesn't really
> > > > > validates a mode, but rather makes sure that a given rate is a good
> > > > > approximation of a pixel clock. So maybe something like
> > > > > drm_mode_check_pixel_clock?
> > > > 
> > > > Naming is hard :) I will use drm_mode_check_pixel_clock() for V2.
> > > > 
> > > > Would it make sense to have the pixel clock requirement as a input
> > > > parameter? For HDMI it is 0.5%
> > > 
> > > This code was only used for panels so far. It reuses the same tolerance
> > > than HDMI because we couldn't come up with anything better, but it
> > > should totally apply to other things.
> > > 
> > > > and in my case the LVDS panel 10%.
> > > 
> > > 10% is a lot, and I'm not sure we'll want that. The framerate being
> > > anywhere between 54 and 66 fps will trip a lot of applications too.
> > > 
> > > Why do you need such a big tolerance?
> > 
> > I don't need it, it was just from the datasheet for the LVDS panel :)
> 
> So you mean the panel accepts a pixel clock within +/- 10%?

Yes :)

> 
> That makes sense, but then we should also adjust the mode timings to
> match so we still keep 60fps. There's much more to *that* than the
> helpers you try to create though, so let's keep it aside for now.

Ok

> 
> Maxime

/Sean
