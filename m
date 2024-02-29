Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A982D86C758
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0F3F10E33B;
	Thu, 29 Feb 2024 10:52:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="SH+gQ12n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969F710E33B
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 10:52:16 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-33df8203a08so220959f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 02:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1709203935; x=1709808735; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=rZ/thrxMVVndEcA3bMM2Cp/I2KBhchTZW9Z7apsasnQ=;
 b=SH+gQ12n5yWNGpfHdL3TWw0AVpqVgFl2s4ExS55B7GXXQz35XBRpYs50qIQ2XCloQ4
 PH3A+7QSA+50wWdYeTGIDCxsB0Ojz/7d/UdWvSpQ++LMnDvVYpTsmAbLpbAPFPWsDDqd
 b9blNGjYEaYuht4Jd9RCVd84XvKOVobKZ+F5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709203935; x=1709808735;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rZ/thrxMVVndEcA3bMM2Cp/I2KBhchTZW9Z7apsasnQ=;
 b=vO2oDglLeaooEd119cQBDnsf1rHAgf+KGv03UmgqTocsKiynD0gv0PNJLFVnpW+klR
 zhVwcPPtVQeiDCkSFV7f8FItCS+AJWhC+vhVNa4POxmSPo0axBZCIpQs4aVGULzeJVtP
 ZyXzG6oyp491Ap+Q1h/8mKj4qMt/OskOSpZBvOzr74vOHD6UULUCPXKHLCYwzT68nbII
 AuP3lmc7PVULkwwT2zJygExwlQRr4tU+rED8rRv5GfAzqsCUQ1LiO816fm/S/zWWAuFv
 EmoNQ6w6J4PP1dtbbl8/FG9PEDOUi4tEJw5rTVG5Pqg6Lo4gXqwhXc5vDEfQpIvnP1iQ
 q+Ww==
X-Forwarded-Encrypted: i=1;
 AJvYcCX56u60LZjd1nuUOG/CssjxamekB1KhFAL6KmpYceYVVihpdpr1FXq5yGV4BnQFBca+ZWllOqzdi+7OEKiUcALnaBBvMhC0ryaXxWZxhOlx
X-Gm-Message-State: AOJu0YwfRK0W0xTgvyEObXyqlkOuyyCBcZmrI65Texyhsr5ESAh3WMgu
 xRR6+n7bt0nq0ijzZbryUclylrFRiLaS6ju6k4MZFU0WWOAA63GX42DaTniBhgc=
X-Google-Smtp-Source: AGHT+IHalvGXLJ+b2pKfwa95ga1mHGjUkDSjclif5RKOQPF4Nvq/fZK0yjCne4LsW6epDEpA7qchVA==
X-Received: by 2002:a05:600c:3b1e:b0:412:9a51:d5a6 with SMTP id
 m30-20020a05600c3b1e00b004129a51d5a6mr1380504wms.4.1709203934739; 
 Thu, 29 Feb 2024 02:52:14 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l21-20020a05600c4f1500b004101543e843sm4992718wmq.10.2024.02.29.02.52.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 02:52:14 -0800 (PST)
Date: Thu, 29 Feb 2024 11:52:12 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Pekka Paalanen <pekka.paalanen@haloniitty.fi>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Subject: Re: UAPI Re: [PATCH 1/3] drm: Add DRM_MODE_TV_MODE_MONOCHROME
Message-ID: <ZeBh3N4uttG53qhU@phenom.ffwll.local>
References: <20240216184857.245372-1-dave.stevenson@raspberrypi.com>
 <20240216184857.245372-2-dave.stevenson@raspberrypi.com>
 <20240221110751.48da8190@eldfell>
 <b43rdl7yebxn6z3pvyeyxbikccr7umrojo5kqw5i3ybloxktso@de4oxsbskkwp>
 <20240226171143.27e60c30@eldfell>
 <CAPY8ntCHi8joN-w3PNjMj31FSkCjqmJ4ZyhSDFZ1-PnfL4+FrQ@mail.gmail.com>
 <5us3AK9XJ5zu1AOKQeZxKWsK0f6Xtm7vHWttRTFPRo57Ph5WO62deVIK8TrkQIFmjFMrn-a2qusgP3W74dV6SKTA5OdTt4zncR7J2qQ_Qck=@emersion.fr>
 <20240228-nice-flat-cormorant-badff7@houat>
 <ttd0tkA6ym5NBhHqKQFa88BjxMoctTVJd03aIqnSyXZ0ve0jPPrlkTVmUNWIQGNyNBpFvxzplydGqGFQa5VaYuf5mm1n9dEGDM5MG25j_4Q=@emersion.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ttd0tkA6ym5NBhHqKQFa88BjxMoctTVJd03aIqnSyXZ0ve0jPPrlkTVmUNWIQGNyNBpFvxzplydGqGFQa5VaYuf5mm1n9dEGDM5MG25j_4Q=@emersion.fr>
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

On Wed, Feb 28, 2024 at 04:22:56PM +0000, Simon Ser wrote:
> On Wednesday, February 28th, 2024 at 17:14, Maxime Ripard <mripard@kernel.org> wrote:
> 
> > > I don't know what the rules were 8 years ago, but the current uAPI rules
> > > are what they are, and a new enum entry is new uAPI.
> > 
> > TBF, and even if the wayland compositors support is missing, this
> > property is perfectly usable as it is with upstream, open-source code,
> > through either the command-line or X.org, and it's documented.
> > 
> > So it's fine by me from a UAPI requirement side.
> 
> That is not a valid way to pass the uAPI requirements IMHO. Yes, one
> can program any KMS property via modetest or xrandr. Does that mean that
> none of the new uAPI need a "real" implementation anymore? Does that mean
> that the massive patch adding a color pipeline uAPI doesn't need
> user-space anymore?

xrandr only supports properties on the connector, so it's right out for
the color pipeline.

Also "we use xrandr for color properties" very much doesn't pass the bs
filter of "is it a toy".

My take would be that this escape hatch is also not valid for all
connector property, stuff that is clearly meant to be configured
automatically by the compositors cannot use the "we use xrandr" excuse,
because users can't type fast enough and hit <Enter> precisely enough to
update a property in lockstep with the compositor's redraw loop :-)

> The only thing I'm saying is that this breaks the usual DRM requirements.
> If, as a maintainer, you're fine with breaking the rules and have a good
> motivation to do so, that's fine by me. Rules are meant to be broken from
> time to time depending on the situation. But please don't pretend that
> modetest/xrandr is valid user-space to pass the rules.

I think it bends it pretty badly, because people running native Xorg are
slowly going away, and the modetest hack does not clear the bar for "is it
a joke/test/demo hack" for me.

I think some weston (or whatever compositor you like) config file support
to set a bunch of "really only way to configure is by hand" output
properties would clear the bar here for me. Because that is a feature I
already mentioned that xrandr _does_ have, and which modetest hackery very
much does not.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
