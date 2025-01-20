Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4D6A1684C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 09:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CD510E36A;
	Mon, 20 Jan 2025 08:39:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="JZhRME3D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC5B10E09A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 08:39:00 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-30229d5b21cso35642941fa.1
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 00:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737362338; x=1737967138; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=+H/51ZusCBwzRXIjtakkI9/6R0QOWcXHPI16s0L+YTc=;
 b=JZhRME3DHaaldalZyCN5mw36FN/kFZFqanO+0mA9Ixo4PEZ8S9/VkiZtxXRaPs1gT+
 dBz+EIpqB1qazdkj16J/51QxlyoI8braGmq6ElD2AhcITkzGMtekFmUoh10Sezctaz+v
 nKjFsa3n6Sw6bQkA/2NNy4vQgxnHp9dZ3M6SLR7evz6LiYteM9Gp64/LvMf8b42Bkiam
 Ufd9BAoa4gARUP7FbNUHwkFWPZISumRyVs6EAAQJze5g5Bcl88AJMkg6hq9A+daD24Ol
 dqrDl+QM6YmBZBEhuK0RRrng2Ar5cTOWfO40raA8IYP2ZGRQ1m55iiWuYAOPoUCMO1bx
 TBrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737362338; x=1737967138;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+H/51ZusCBwzRXIjtakkI9/6R0QOWcXHPI16s0L+YTc=;
 b=FSA5gqdBYpRRmcYead/cCAY4SaEOG1zflsyDi8VcT2IdOvnLwphIE7aML2orHPCtIu
 uZoR0cNg/195X9BZrPhwk83lO7ubCesLr/5tGeKyq4QS7snRMjrfRVzXD6xkLLwhUB5G
 YhREusdSypIyqTpuUOLqzgHq7SMnSF4rgTVq4rKaBzj+Yk11vIYHd01p1UW/yJ72H8af
 scH3KN2Tm38IiBabHamJyK8Rv5hW+pJ7sIdf663K/8sVsTgo97RKeEHzMXVXOV7wyCJO
 oDZX4BwIBo7WKbAItD9FuEhp0ErrHB6AlSK3ikF/Xr9merTujtXrKLSzfe/tlALyfGtH
 WkOg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaLodks6eLolzm9MbZ5gclqtBdRv0PMpicwqM0F18/7HGmMpC0npgh7tvMjeFZLTMhfRK88qqVUYQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmDEPawNQcUng05oj+Cpsm2LHqlr1SJRuer3HHNj7YViUO/vT8
 bQZcuFP6UJSQVoBx6UpMoi9eaYd/hKnJlS1sD5aU/SPQFsaDJSBb6a5CqvXj8DY=
X-Gm-Gg: ASbGncv1iPlwf/QjfYvQHnLO4jAR6puMEp1gJSdqnmGB3hmZl3BvFWLaX7l+EyN6zMn
 eEl+LfYdCbU1vuXpj6G5k9ersHCFLmJzpnqzGtIX9I0EenyWfqhseSCCdNm0c63lCpkJRXbJPwP
 bsplhvECPyQhWDPKOLLZAV/CnJReY/QEiSVNlkV9lwf3obCrS7lCIUotgENmO8aFfDM8nqcE866
 ZlgIDVm/0uGF3KRrcKX/A1qiJDstov5JdDvtw9uXWp5O4so20TyRAewiDJ55+DdcZL8CMSe3D3N
 wxxOKsSCJKJ8H+7UqHMx6GvMRk5/gfTefMG40hpWaRPjY9wl1g==
X-Google-Smtp-Source: AGHT+IGcLRalLAc0sNJpLemxcxqUj2Ubzrcn1UFxB2sv3PRdKl5Be8hyEd6uAFjmZGLJ7xT4qh4KFQ==
X-Received: by 2002:ac2:4c24:0:b0:542:213f:78fa with SMTP id
 2adb3069b0e04-5439c21f24bmr3073011e87.7.1737362338226; 
 Mon, 20 Jan 2025 00:38:58 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5439af72b6asm1225983e87.178.2025.01.20.00.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2025 00:38:56 -0800 (PST)
Date: Mon, 20 Jan 2025 10:38:54 +0200
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
Message-ID: <skykzupk353yt6nsooh7wksbexgymzfpbhboi6r33mxegyscwm@agm7yrfb44i4>
References: <20250114055626.18816-1-aradhya.bhatia@linux.dev>
 <20250114055626.18816-12-aradhya.bhatia@linux.dev>
 <psce5mzs5kyw76pkb75lmxliddph6b7yob6nunmxy4ne7g7zin@axa67tkcgr5j>
 <f34a0c76-cb61-4c5a-b16c-e6f715f1d048@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f34a0c76-cb61-4c5a-b16c-e6f715f1d048@linux.dev>
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

On Fri, Jan 17, 2025 at 06:37:00PM +0530, Aradhya Bhatia wrote:
> Hi Dmitry,
> 
> On 14/01/25 16:54, Dmitry Baryshkov wrote:
> > On Tue, Jan 14, 2025 at 11:26:25AM +0530, Aradhya Bhatia wrote:
> >> Move the bridge pre_enable call before crtc enable, and the bridge
> >> post_disable call after the crtc disable.
> >>
> >> The sequence of enable after this patch will look like:
> >>
> >> 	bridge[n]_pre_enable
> >> 	...
> >> 	bridge[1]_pre_enable
> >>
> >> 	crtc_enable
> >> 	encoder_enable
> >>
> >> 	bridge[1]_enable
> >> 	...
> >> 	bridge[n]_enable
> >>
> >> And, the disable sequence for the display pipeline will look like:
> >>
> >> 	bridge[n]_disable
> >> 	...
> >> 	bridge[1]_disable
> >>
> >> 	encoder_disable
> >> 	crtc_disable
> >>
> >> 	bridge[1]_post_disable
> >> 	...
> >> 	bridge[n]_post_disable
> >>
> >> The definition of bridge pre_enable hook says that,
> >> "The display pipe (i.e. clocks and timing signals) feeding this bridge
> >> will not yet be running when this callback is called".
> >>
> >> Since CRTC is also a source feeding the bridge, it should not be enabled
> >> before the bridges in the pipeline are pre_enabled. Fix that by
> >> re-ordering the sequence of bridge pre_enable and bridge post_disable.
> > 
> > The patch contains both refactoring of the corresponding functions and
> > changing of the order. Please split it into two separate commits.
> > 
> 
> I assume that you already understand this, so this is just for the
> record -
> 
> There is no trivial way to do this. Initially, this is what I had in my
> mind - about what the split patches would look like.
> 
> #1
>  * refactoring of entire loops into separate functions.
>  * Separate out the pre_enable and enable operations inside the
>    encoder_bridge_enable().
>  * call them in their (seemingly) original sequences
> 	- crtc_enable
> 	- encoder_bridge_enable(pre_enable)
> 	- encoder_bridge_enable(!pre_enable)
> 
> #2
>  * rearrange the calls to re-order the operation
> 	- encoder_bridge_enable(pre_enable)
> 	- crtc_enable
> 	- encoder_bridge_enable(!pre_enable)
> 
> This would have made the patch#2 seem quite trivial, as patch#1 would
> take the brunt of changes, while keeping the functionality intact.
> 
> 
> What I have now realized is that, the above isn't possible,
> unfortunately. The moment we separate out pre_enable and enable into 2
> different calls, the overall sequence gets even changed when there are
> multiple pipelines in the system.
> 
> So to implement the split properly, the first patch would look like this
> 
> #1
>  * refactoring of entire loops into separate functions.
>  * The calling sequences will be as follows -
>  	- crtc_enable()
> 	- encoder_bridge_enable()
> 		- this will do both pre_enable and enable
> 		  unconditionally.
> 
> The pre_enable and enable operations wouldn't be separated in patch 1,
> just that the crtc enable and encoder bridge pre_enable/enable loops
> would be put into individual functions.
> 
> The next patch will then introduce booleans, and separate out pre_enable
> and enable, and implement the new order -
> 
> #2
>  * pre_enable and enable operations will be conditionally segregated
>    inside encoder_bridge_enable(), based on the pre_enable boolean.
>  * The calling sequences will then be updated to -
> 	- encoder_bridge_enable(pre_enable)
> 	- crtc_enable()
> 	- encoder_bridge_enable(!pre_enable)


I'd say slightly differently:

#1 Refactor loops into separate functions:
  - crtc_enable()
  - encoder_bridge_enable(), loops over encoders and calls
    pre_enable(bridges), enable(encoder), enable(bridges)

#2 Split loops into separate functions:
  - crtc_enable()
  - encoder_bridge_pre_enable(), loops over encoders and calls
    pre_enable(bridges),
  - encoder_bridge_enable(), loops over encoders and calls
    enable(encoder), enable(bridges)

#3 Move crtc_enable() calls:
  - encoder_bridge_pre_enable(), loops over encoders and calls
    pre_enable(bridges),
  - crtc_enable()
  - encoder_bridge_enable(), loops over encoders and calls
    enable(encoder), enable(bridges)

You might use enum or booleans to implement encoder_bridge_pre_enable(),
or just keep it as a completely separate function (might be a better
option).

The reason why I'm suggesting it is pretty easy: your patch performs two
refactorings at the same time. If one of the drivers breaks, we have no
way to identify, which of the refactorings caused the break.

> 
> This wouldn't be all that much trivial as I had imagined it to be earlier.
> 
> It would also *kind of* like these patches in a previous revision,
> v5:11/13 [0], and v5:12/13 [1]. The only differences being,
> 
> 1) these older patches separated out only the bridge/encoder operations
> into a function, and not the crtc operations, and
> 
> 2) An enum is being used instead of the booleans.
> 
> 
> I believe this is what you are looking for? If I have misunderstood
> something, do let me know.
> 
> 
> Regards
> Aradhya
> 
> 
> [0]: v5:11/13
> drm/atomic-helper: Separate out Encoder-Bridge enable and disable
> https://lore.kernel.org/all/20241019200530.270738-4-aradhya.bhatia@linux.dev/
> 
> [1]: v5:12/13
> drm/atomic-helper: Re-order bridge chain pre-enable and post-disable
> https://lore.kernel.org/all/20241019200530.270738-5-aradhya.bhatia@linux.dev/
> 

-- 
With best wishes
Dmitry
