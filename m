Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A93CF2351
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 08:26:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9863710E1BA;
	Mon,  5 Jan 2026 07:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="y0578I7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752A310E1BA
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 07:26:12 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-477619f8ae5so87362015e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 04 Jan 2026 23:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767597971; x=1768202771; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=tqXPGRlmqIR2c73hehXqAT4WnRWsCFlwnXSzbZ1gZgI=;
 b=y0578I7D7HHIxH197q/rIPjBphbA28LD2cBvg3WCSdSXh5+eXitTeL6GfVdh/tE2+U
 Vp2khXTkQkni/PkT1fCsPr/wMHZ8CYy1pPwZZgCoL3KwejCwIs0JmOGnFrha8HmTdsx+
 Aque/5J9Nq/z7BlKDsdrLZo2yccHHIwu3q1oeCiFd9xSvdcbY1zU/14cCPe+vajlImfz
 PUrlewhGYpNqAdSa0g451MZYLYUEkZdqebYOELF6IPoZpPmmYBzd5sf/JxEYchvMTDp2
 u0D+ioBdBCZVVzyWCqGoSrql7B2v4zmaH+k20IvaZLNaMl/JTCHwym1UebpOqVYsI7tV
 CNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767597971; x=1768202771;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tqXPGRlmqIR2c73hehXqAT4WnRWsCFlwnXSzbZ1gZgI=;
 b=hrs1z/4fZBTqG7VVHHYHdEKoGGDGZIasTc2Ut3kU1tZgCncBXZFKdRZzCm7UWLkRXk
 cuyuLYXDYEed4o0GXcSJhMH844BXgfHwxum7VxnD77/+p3LxRG0ba73plR5HBRHgSyQJ
 rOigQo0gHWyX6rbN/rmQ+u72D56WIQfMuqw5tnJwz/uTscNbqjjtC/mBO3avviVd9bpU
 TV8TmRTF/cuZ8pnZpswmkPdiVJVKwCwDNWMV3+tYOdGeo/ElEdEBBMWxGbOCOWnenkhV
 7ee+mUJRiy4lDvpPF2t5FEG5IBMZk8RW/OAZnwDesSaOd2DK27QE64syziIkjOiQKJri
 ptzA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCvj8npa1sb/qGXwmirU4VylJxZyfxYYXDqyhIPFbUmX8viOSVzrE8nO9vxqxU1DtYgSEtGy7D5M4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWKzB53hfpAtDuNNdpsAztgxJJ3/s2T2nbqL+nTStCRrDzc47X
 ag3/WpWBMplxHWxQ62a6ZWlQ6O53RVU8H3pkr9SR3VMJNw44Oq8Sy1kCxaLypm7JmUI=
X-Gm-Gg: AY/fxX7cz5qPrISSAwhjezEeDQ2Qjk/F/zlVO/BHvWScNsMrf09V8Za7FIAZzeiDU4U
 esTTBlQXRBQenFyN4ak0g3yDzKoMY5uWQkJItLa2iOCqISa3z4ymBS1asXBZORcIVswlajyD30X
 wK7zweUCgVQnoosgpioO4roh0t/+1ZHGa8YR2gBRRL5VzxjcyykjIvyVWC3uqAeji9xojtJtHV6
 6enR1soBSFwYS266RFD/8nvLxDAETooGGshKimS3nJo2D3iU7Dn8kHqukdw5Aeq/uYyKsGXXVB4
 hDCbDYwoZjBXuND+yBVeZLzUzFV5TBlzjQi3sa/jzN2xsZCrI/L/j7c58wIhvEsl416HbRIq/sk
 VjO8dAPkRQTEl7dJlVw1wT0RZ+5FpdIM8RT8VlwRZs18EKu9K0MCVoLKoZIXRaLo7aroRmPgVCc
 VfQFLzWDSeJp9wO5AN
X-Google-Smtp-Source: AGHT+IFrdZFxzxTrmRZMpsP27Ztfl7Uoc6pbDtE/T7BSP5JYGzpyq/KpLAX/yGG7sIYcOpNE6ZVEuA==
X-Received: by 2002:a05:600c:1d1d:b0:477:8ba7:fe0a with SMTP id
 5b1f17b1804b1-47d1957da90mr604728865e9.24.1767597970515; 
 Sun, 04 Jan 2026 23:26:10 -0800 (PST)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6d45bb57sm148423745e9.14.2026.01.04.23.26.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jan 2026 23:26:09 -0800 (PST)
Date: Mon, 5 Jan 2026 10:26:06 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Vincent Mailhol <mailhol@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Nicolas Schier <nicolas@fjasle.eu>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kbuild@vger.kernel.org, linux-sparse@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-btrfs@vger.kernel.org,
 linux-hardening@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] overflow: Update is_non_negative() and is_negative()
 comment
Message-ID: <aVtnjgJOjMp9cMDn@stanley.mountain>
References: <20251220-remove_wtype-limits-v3-3-24b170af700e@kernel.org>
 <acdd84b2-e893-419c-8a46-da55d695dda2@kernel.org>
 <20260101-futuristic-petrel-of-ecstasy-23db5f@lindesnes>
 <CANiq72=jRT+6+2PBgshsK-TpxPiRK70H-+3D6sYaN-fdfC83qw@mail.gmail.com>
 <b549e430-5623-4c60-acb1-4b5e095ae870@kernel.org>
 <b6b35138-2c37-4b82-894e-59e897ec7d58@kernel.org>
 <903ba91b-f052-4b1c-827d-6292965026c5@moroto.mountain>
 <c84557e6-aa92-42e9-8768-e246676ec1e9@kernel.org>
 <aVlKTculhgJzuZJy@stanley.mountain>
 <e66bd09b-9879-4562-a71e-a1e1a964f3f2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e66bd09b-9879-4562-a71e-a1e1a964f3f2@kernel.org>
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

On Sat, Jan 03, 2026 at 08:40:17PM +0100, Vincent Mailhol wrote:
> On 03/01/2026 at 17:56, Dan Carpenter wrote:
> > On Sat, Jan 03, 2026 at 12:10:45PM +0100, Vincent Mailhol wrote:
> >> On 03/01/2026 at 11:02, Dan Carpenter wrote:
> >>> Thanks Randy, for sending this to me.  I'm on the sparse list, but
> >>> I've been on vacation and haven't caught up with my email. 
> >>
> >> Welcome back, hope you enjoyed your holidays!
> >>
> >>> I can easily silence this in Smatch.
> >>
> >> Thanks. I ran this locally, I can confirm that this silences the
> >> warning. So:
> >>
> >> Tested-by: Vincent Mailhol <mailhol@kernel.org>
> >>
> >>> diff --git a/check_unsigned_lt_zero.c b/check_unsigned_lt_zero.c
> >>> index bfeb3261f91d..ac3e650704ce 100644
> >>> --- a/check_unsigned_lt_zero.c
> >>> +++ b/check_unsigned_lt_zero.c
> >>> @@ -105,7 +105,8 @@ static bool is_allowed_zero(struct expression *expr)
> >>>  	    strcmp(macro, "STRTO_H") == 0 ||
> >>>  	    strcmp(macro, "SUB_EXTEND_USTAT") == 0 ||
> >>>  	    strcmp(macro, "TEST_CASTABLE_TO_TYPE_VAR") == 0 ||
> >>> -	    strcmp(macro, "TEST_ONE_SHIFT") == 0)
> >>> +	    strcmp(macro, "TEST_ONE_SHIFT") == 0 ||
> >>> +	    strcmp(macro, "check_shl_overflow") == 0)
> >>
> >> But, for the long term, wouldn't it better to just ignore all the code
> >> coming from macro extensions instead of maintaining this allow-list?
> >>
> > 
> > Of course, that idea occured to me, but so far the allow list is not
> > very burdensome to maintain.
> 
> Indeed, but my concern was more on how people would treat such smatch
> warnings coming from the kernel test robot. It is very uncommon to have
> an allow-list hard coded into the static analyzer. Actually, this is the
> first time I see this. My fear here is that people will just uglify the
> code rather than sending a patch to extend the allow list in smatch.
> 

People need to learn to ignore false positives.  The zero day bot sends
a one time email and if you just delete it, then it's gone forever.
Forget about it.

It's really limitting to try be totally static checker clean.  Things
like passing a zero to ERR_PTR() for example.  It's a perfectly valid way
to return NULL and the fs/ subsystem uses this a lot.  But 80% when you
see it in new code, then it's a bug where they returned the wrong
variable or something.  It's a high quality warning.  The solution is to
look at it one time, when the code is fresh and then never look at it
again.

In this case when I disable the unsigned < 0 checking for macros then it
means that if someone does if (WARN_ON(u32_var < 0)) { it's silenced.  I
don't want that.

I could create a much better way to silence false positives like this
if I passed an expression pointer to the sm_warning()...  It's a bit of
a re-work.

regards,
dan carpenter












It's really limitting
if we can only check 

> > I maybe should disable it for all macros unless the --spammy option is used...
> 
> IMHO, that would be an even better approach. That said, I am happy
> enough with your previous patch which resolves my issue and which is way
> better than updating the is_non_negative() and is_negative() comments as
> I did in my patch!
> 
> 
> Yours sincerely,
> Vincent Mailhol
