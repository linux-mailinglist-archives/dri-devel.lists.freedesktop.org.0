Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD3FA17C41
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA0F10E555;
	Tue, 21 Jan 2025 10:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="SmmRagim";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF28310E555
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:50:52 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5401bd6cdb4so5660880e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 02:50:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737456651; x=1738061451; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Ux/xXOiWmWNMBQVDeooB3mTOk9NeNtuNYImviR94apo=;
 b=SmmRagim9L5ELgOD3z/HFL2sxS8NALyC2AskOLadPiGnIdNXtNnAD40IQv2H6oFiAT
 icw/yytlxB5TlICVxXv4/+VZOiUlgvBWeMN6/NmZ/QNvn95ih2KoyAIzrHXgYAmvAyja
 X35mlIZVKzkj63anKy3UbEpefRTKvRycgg0BjRKT1RBU+Q0U02zvndjtNxLj75gQSxAp
 C/kA/1DAjTbfDODs1BgzNTUC2FVILZhc3Oj02ZdABrcOLuKn5602zgDNz1lxP4QhHywj
 L6ZhwVlYh9f6JbrEHTQJoB1j+LEZSmnppV6mgcKncPPFA6WGqQ+MmRfyKddHykTPBr2b
 F/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737456651; x=1738061451;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ux/xXOiWmWNMBQVDeooB3mTOk9NeNtuNYImviR94apo=;
 b=fhxF5uY3lGWmsZTPlverHgBhOt52ALKFpdUZbHOMlTuL2DF30MKSpuwqG+rJj0oDQY
 MshY+ffz/VyBNuv54t9TFTQ9XI6I6QHLdbI8eEk970d9DvkALEc1O6W3+UF6kiM7vcG5
 ij2QG8zd15CiJ5/5SsaUBKnVeMjUUBo9FYIxbDacTOfre3yRhZukfZmhHIklorBFMTub
 XjDKQVw3uwtZ0YqfvE0htXpXXWwT8IGd/EjSmLyEQ/4419Ac1NT6FiaTsKjMdHjD3Yy9
 gqFG4w4bFUx/C4bkTWU52wQp6xgHPjVHvWNQeIeXATpZt1HkJa+PXgRS611Mc1IBzq1r
 c4UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvie7yTt6K7uJhCt2zUKy7sC+NEcaFLRx68/HAv+hG7z5N1wt6S+3kVfBvR+6+XZmQRwZ2iF8g0ks=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+YL3bMjbqkhsvPZv0C1FF7GP0HYQjQ/ACJXikdrqZJtZUEYeG
 oOEeMSICt7yt1odj2t4onA108FQ46Bjy0i/o8m/Jx7EruXZmD3OtpKyBkW5FCHI=
X-Gm-Gg: ASbGncvDlhS/S0E7ZoxGUE8YhC0NpV8iBLS+tZBvmuNe9uKlvCWRxn/Sdyt9qWea81t
 QqoHwbeXPpCjShkl2V9Od1IRED7MBw5RLFDaXP943w6zp/jWg2WyzPZCaR+78DckIOUQLUumWHw
 D1AQIXS36+hYrtJb3mMY0q7bPgWbPXXWCNRZV6INkLVxGlLb8uJJGvzQ9MkI5ti+luZ3UfBSkxi
 nmZoEmFglL/0coVkSNaxLUiSEVhognWYHhK8r+GYlR9XfYJoINI3HhVhRFHoYjq+uwXZsAV5QKW
 UkuO5+RbFIIUreSvGXz7QWV8FMzVcTHt1KbNTxYiWceYz/b81A==
X-Google-Smtp-Source: AGHT+IENl6fKy+FiTpz9kpATTaX+JYTz4ttJQJbNOfAI1SQ7Qt11YxeJftrnY7DiuZVZVgWJvd9orA==
X-Received: by 2002:ac2:52bb:0:b0:540:2122:fad7 with SMTP id
 2adb3069b0e04-5439c22a998mr4348489e87.6.1737456650857; 
 Tue, 21 Jan 2025 02:50:50 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af0e833sm1770515e87.77.2025.01.21.02.50.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2025 02:50:49 -0800 (PST)
Date: Tue, 21 Jan 2025 12:50:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Aradhya Bhatia <aradhya.bhatia@linux.dev>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nishanth Menon <nm@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Devarsh Thakkar <devarsht@ti.com>, 
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>, 
 Jayesh Choudhary <j-choudhary@ti.com>,
 DRI Development List <dri-devel@lists.freedesktop.org>, 
 Linux Kernel List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 11/12] drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable
Message-ID: <srbgele3uejml6c6dmkojc77jspuajlee5kzp5fhnpsn2drc3d@mdcbqucbgdte>
References: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
 <20250114055626.18816-12-aradhya.bhatia@linux.dev>
 <psce5mzs5kyw76pkb75lmxliddph6b7yob6nunmxy4ne7g7zin@axa67tkcgr5j>
 <f34a0c76-cb61-4c5a-b16c-e6f715f1d048@linux.dev>
 <skykzupk353yt6nsooh7wksbexgymzfpbhboi6r33mxegyscwm@agm7yrfb44i4>
 <30dc847b-7b3b-4c6c-be10-b941f6acf4b9@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30dc847b-7b3b-4c6c-be10-b941f6acf4b9@linux.dev>
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

On Mon, Jan 20, 2025 at 11:18:22PM +0530, Aradhya Bhatia wrote:
> Hi Dmitry,
> 
> On 20/01/25 14:08, Dmitry Baryshkov wrote:
> > On Fri, Jan 17, 2025 at 06:37:00PM +0530, Aradhya Bhatia wrote:
> >> Hi Dmitry,
> >>
> >> On 14/01/25 16:54, Dmitry Baryshkov wrote:
> >>> On Tue, Jan 14, 2025 at 11:26:25AM +0530, Aradhya Bhatia wrote:
> >>>> Move the bridge pre_enable call before crtc enable, and the bridge
> >>>> post_disable call after the crtc disable.
> >>>>
> >>>> The sequence of enable after this patch will look like:
> >>>>
> >>>> 	bridge[n]_pre_enable
> >>>> 	...
> >>>> 	bridge[1]_pre_enable
> >>>>
> >>>> 	crtc_enable
> >>>> 	encoder_enable
> >>>>
> >>>> 	bridge[1]_enable
> >>>> 	...
> >>>> 	bridge[n]_enable
> >>>>
> >>>> And, the disable sequence for the display pipeline will look like:
> >>>>
> >>>> 	bridge[n]_disable
> >>>> 	...
> >>>> 	bridge[1]_disable
> >>>>
> >>>> 	encoder_disable
> >>>> 	crtc_disable
> >>>>
> >>>> 	bridge[1]_post_disable
> >>>> 	...
> >>>> 	bridge[n]_post_disable
> >>>>
> >>>> The definition of bridge pre_enable hook says that,
> >>>> "The display pipe (i.e. clocks and timing signals) feeding this bridge
> >>>> will not yet be running when this callback is called".
> >>>>
> >>>> Since CRTC is also a source feeding the bridge, it should not be enabled
> >>>> before the bridges in the pipeline are pre_enabled. Fix that by
> >>>> re-ordering the sequence of bridge pre_enable and bridge post_disable.
> >>>
> >>> The patch contains both refactoring of the corresponding functions and
> >>> changing of the order. Please split it into two separate commits.
> >>>
> >>
> >> I assume that you already understand this, so this is just for the
> >> record -
> >>
> >> There is no trivial way to do this. Initially, this is what I had in my
> >> mind - about what the split patches would look like.
> >>
> >> #1
> >>  * refactoring of entire loops into separate functions.
> >>  * Separate out the pre_enable and enable operations inside the
> >>    encoder_bridge_enable().
> >>  * call them in their (seemingly) original sequences
> >> 	- crtc_enable
> >> 	- encoder_bridge_enable(pre_enable)
> >> 	- encoder_bridge_enable(!pre_enable)
> >>
> >> #2
> >>  * rearrange the calls to re-order the operation
> >> 	- encoder_bridge_enable(pre_enable)
> >> 	- crtc_enable
> >> 	- encoder_bridge_enable(!pre_enable)
> >>
> >> This would have made the patch#2 seem quite trivial, as patch#1 would
> >> take the brunt of changes, while keeping the functionality intact.
> >>
> >>
> >> What I have now realized is that, the above isn't possible,
> >> unfortunately. The moment we separate out pre_enable and enable into 2
> >> different calls, the overall sequence gets even changed when there are
> >> multiple pipelines in the system.
> >>
> >> So to implement the split properly, the first patch would look like this
> >>
> >> #1
> >>  * refactoring of entire loops into separate functions.
> >>  * The calling sequences will be as follows -
> >>  	- crtc_enable()
> >> 	- encoder_bridge_enable()
> >> 		- this will do both pre_enable and enable
> >> 		  unconditionally.
> >>
> >> The pre_enable and enable operations wouldn't be separated in patch 1,
> >> just that the crtc enable and encoder bridge pre_enable/enable loops
> >> would be put into individual functions.
> >>
> >> The next patch will then introduce booleans, and separate out pre_enable
> >> and enable, and implement the new order -
> >>
> >> #2
> >>  * pre_enable and enable operations will be conditionally segregated
> >>    inside encoder_bridge_enable(), based on the pre_enable boolean.
> >>  * The calling sequences will then be updated to -
> >> 	- encoder_bridge_enable(pre_enable)
> >> 	- crtc_enable()
> >> 	- encoder_bridge_enable(!pre_enable)
> > 
> > 
> > I'd say slightly differently:
> > 
> > #1 Refactor loops into separate functions:
> >   - crtc_enable()
> >   - encoder_bridge_enable(), loops over encoders and calls
> >     pre_enable(bridges), enable(encoder), enable(bridges)
> > 
> > #2 Split loops into separate functions:
> >   - crtc_enable()
> >   - encoder_bridge_pre_enable(), loops over encoders and calls
> >     pre_enable(bridges),
> >   - encoder_bridge_enable(), loops over encoders and calls
> >     enable(encoder), enable(bridges)
> > 
> 
> When we consider setups with multiple independent displays, there are
> often multiple crtcs in the system, each with their own encoder-bridge
> chain.
> 
> In such a scenario, the sequence of crtc/encoder/bridge enable calls
> after the #2 that you suggested, will not the remain same as that after
> #1 (which is the _original_ sequence of calls).

Yes. The order of ops between display has changed, but each display is
still programmed in exactly the same way as before.

> 
> Do we still require #2 as an intermediate step between the original
> sequence, and the intended new sequence? Wouldn't having the sequence
> change in 2 half-steps add to the confusion (should some driver break
> due to either of the refactorings)?

That's the point. Having two refactorings in one commit makes it harder
to understand, which one broke the driver. Having two separate commits
allows users to revert the latter commit and check what caused the
issue.

> 
> > #3 Move crtc_enable() calls:
> >   - encoder_bridge_pre_enable(), loops over encoders and calls
> >     pre_enable(bridges),
> >   - crtc_enable()
> >   - encoder_bridge_enable(), loops over encoders and calls
> >     enable(encoder), enable(bridges)
> > 
> > You might use enum or booleans to implement encoder_bridge_pre_enable(),
> > or just keep it as a completely separate function (might be a better
> > option).
> 
> Yeah, I suppose a separate function may be better. There will, however,
> be some code duplication when we loop over the encoder twice, once for
> pre_enable(bridge) and the other for enable(encoder) and enable(bridge).
> 
> I hope that will be acceptable?

I'd prefer two separate functions, but I won't insist on that.

> 
> > 
> > The reason why I'm suggesting it is pretty easy: your patch performs two
> > refactorings at the same time. If one of the drivers breaks, we have no
> > way to identify, which of the refactorings caused the break.>
> >>
> >> This wouldn't be all that much trivial as I had imagined it to be earlier.
> >>
> >> It would also *kind of* like these patches in a previous revision,
> >> v5:11/13 [0], and v5:12/13 [1]. The only differences being,
> >>
> >> 1) these older patches separated out only the bridge/encoder operations
> >> into a function, and not the crtc operations, and
> >>
> >> 2) An enum is being used instead of the booleans.
> >>
> >>
> >> I believe this is what you are looking for? If I have misunderstood
> >> something, do let me know.
> >>
> >>
> >> Regards
> >> Aradhya
> >>
> >>
> >> [0]: v5:11/13
> >> drm/atomic-helper: Separate out Encoder-Bridge enable and disable
> >> https://lore.kernel.org/all/20241019200530.270738-4-aradhya.bhatia@linux.dev/
> >>
> >> [1]: v5:12/13
> >> drm/atomic-helper: Re-order bridge chain pre-enable and post-disable
> >> https://lore.kernel.org/all/20241019200530.270738-5-aradhya.bhatia@linux.dev/
> >>
> > 
> 
> 
> Regards
> Aradhya
> 

-- 
With best wishes
Dmitry
