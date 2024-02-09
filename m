Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A8784FD05
	for <lists+dri-devel@lfdr.de>; Fri,  9 Feb 2024 20:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA51110FB8E;
	Fri,  9 Feb 2024 19:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="geVjCY8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C0710FB8D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Feb 2024 19:40:32 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-40fb17fd179so2890605e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Feb 2024 11:40:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1707507631; x=1708112431; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0tW/i6priEcrQG2x5Iv8T9kmua5rlprr/xlqbBzFMYE=;
 b=geVjCY8oo3CHITurwMan1/4XvFnUfpe9oD0X6p6/h7xavEy5Edwp541IV2HyBF8jmM
 Ouc/Fp3KxgIxkijg8CLrtQYX/q0QSwzRGdC7lTZdWP/MtLlqJngr85e8g6pkU7wuUiCl
 NWgc4e9islH3A26dYHH3cZNuhnSz90ng8/0NE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707507631; x=1708112431;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0tW/i6priEcrQG2x5Iv8T9kmua5rlprr/xlqbBzFMYE=;
 b=GvPpRQM9Oi9LWvMbJ69QrtGfU4bLMO8SyRPbO03XykFeF10u1dq+m/dsu8e0WU6Tz6
 T6591D/dO5sE4JLk1Eq0IPHjyEUP5qer/Z+Gtzg/yMkX27gP+k4Ik/RXP7pbC4iPhVia
 B0nqNIYEoR1f5tdDEf8Itfb69MJeQ04cpL0UPDpFJp0zjBhNZ63G5nIhyIac0wtAHTca
 L7xlIl/UArMY67Ewi7o6DrtsBxxAvzJ7p1k/sxzq7YBNeWcEMWhZZ8rVpcL2eTpycKEO
 Lg9AoVoQlqTJ6Hu5UOQRkeQRFZiFh+2jQCO5aqRrMmV4K3y/JqopJw2UoMacgEqpChAF
 2XQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/al3ePVCn92rDPx1cKaMYmYgHsbsyCNrnV5AaVHBjiQNl2NdtuWy2HjqnqeKfjd0mwRnhNeO/UniRCpcxxJyoGqae2D9ikmM2X8SIuZRa
X-Gm-Message-State: AOJu0YxKBwM7TM+iqGNDopbaIwDGhETLRHCEsVGRu+SlQlaQ3lBYzuBM
 sGu7Yz8LJTHNjTj37535tvmqVZ9NU4eityRAZvxXpvZ/yv7qMUBpB/9Jz3HQSjk=
X-Google-Smtp-Source: AGHT+IG7etAAs3gp2cJ8AQ+uFdPZ0v5yg2KA4Pyw9SWYoYV8xjA1gXe2y6k0L2xCVo674E+KM0r32A==
X-Received: by 2002:a05:600c:4c18:b0:410:896d:ca9 with SMTP id
 d24-20020a05600c4c1800b00410896d0ca9mr1950wmp.4.1707507631115; 
 Fri, 09 Feb 2024 11:40:31 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXajWfx5YzrxNJupEWK3onJx29zijUNMD9venW8ezCbHndI54Gzo7T1cphgYDGv19hvoHQqiwiQb6t0lZjYF76XafcOGydqDHmd0ecdxFBrY07Kp1KUprL553MudEypU2fhR6zge8suZ9x9/oXpEJ8vjMxlpiqWsQBtC9rx7EtPmSuZpJkFejKG4qwde1PbyXotbRaGB9C8ItNZowI36ODAodbcYctuWhGM5g5Q0bIsyXtFDWiVAlgHhqs+wucqpsOmsAodgbraLGMEDFp8v3tqmmMXK8JeipNIix65deBS0YlYFxRqOYZlG3ip10XGng90XFIK3Zsa1H8v12/tp0fOqN3pZaCCllffD1a0VykA
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i19-20020a05600c355300b0040ff2933959sm1536685wmq.7.2024.02.09.11.40.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Feb 2024 11:40:30 -0800 (PST)
Date: Fri, 9 Feb 2024 20:40:28 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, alexander.deucher@amd.com,
 matthew.auld@intel.com, mario.limonciello@amd.com, stable@vger.kernel.org
Subject: Re: [PATCH] drm/buddy: Fix alloc_range() error handling code
Message-ID: <ZcZ_rLEjLTTHO14w@phenom.ffwll.local>
References: <20240209152624.1970-1-Arunpravin.PaneerSelvam@amd.com>
 <ZcZpH3hwBjv7s8WK@phenom.ffwll.local>
 <543e5800-8ac8-215f-2377-7a0e75a98cac@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <543e5800-8ac8-215f-2377-7a0e75a98cac@amd.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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

On Sat, Feb 10, 2024 at 12:06:58AM +0530, Arunpravin Paneer Selvam wrote:
> Hi Daniel,
> 
> On 2/9/2024 11:34 PM, Daniel Vetter wrote:
> > On Fri, Feb 09, 2024 at 08:56:24PM +0530, Arunpravin Paneer Selvam wrote:
> > > Few users have observed display corruption when they boot
> > > the machine to KDE Plasma or playing games. We have root
> > > caused the problem that whenever alloc_range() couldn't
> > > find the required memory blocks the function was returning
> > > SUCCESS in some of the corner cases.
> > > 
> > > The right approach would be if the total allocated size
> > > is less than the required size, the function should
> > > return -ENOSPC.
> > > 
> > > Cc:  <stable@vger.kernel.org> # 6.7+
> > > Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
> > > Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/3097
> > > Tested-by: Mario Limonciello <mario.limonciello@amd.com>
> > > Link: https://patchwork.kernel.org/project/dri-devel/patch/20240207174456.341121-1-Arunpravin.PaneerSelvam@amd.com/
> > > Acked-by: Christian König <christian.koenig@amd.com>
> > > Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> > > Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> > New unit test for this would be most excellent - these kind of missed edge
> > cases is exactly what kunit is for. Can you please follow up with, since
> > we don't want to hold up the bugfix for longer?
> Matthew Auld has added a new unit test for this case. Please let us know if
> this will suffice.
> https://patchwork.freedesktop.org/patch/577497/?series=129671&rev=1

Ah yeah, might be best to submit them both together as one series (you
just need to add your own signed-off-by if you resend other people's
patches). That way bots can pick it up together, since new testcase and
bugfix only make sense together.
-Sima

> 
> Thanks,
> Arun.
> > -Sima
> > 
> > > ---
> > >   drivers/gpu/drm/drm_buddy.c | 6 ++++++
> > >   1 file changed, 6 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> > > index f57e6d74fb0e..c1a99bf4dffd 100644
> > > --- a/drivers/gpu/drm/drm_buddy.c
> > > +++ b/drivers/gpu/drm/drm_buddy.c
> > > @@ -539,6 +539,12 @@ static int __alloc_range(struct drm_buddy *mm,
> > >   	} while (1);
> > >   	list_splice_tail(&allocated, blocks);
> > > +
> > > +	if (total_allocated < size) {
> > > +		err = -ENOSPC;
> > > +		goto err_free;
> > > +	}
> > > +
> > >   	return 0;
> > >   err_undo:
> > > -- 
> > > 2.25.1
> > > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
