Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 284E096E5BF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2024 00:31:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3890710E960;
	Thu,  5 Sep 2024 22:31:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UCMXbJSA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFF610E960
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Sep 2024 22:31:39 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-277fa3de06fso769595fac.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Sep 2024 15:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725575498; x=1726180298; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ByTGY4/YW1oFlLnwGbDA1qTS9L9gMEUay1+a7RZYMwo=;
 b=UCMXbJSAaTT4T/NlzEOvs0Yyf0vwbD8M8U0LcSOIWmHuNAPewM7Y94nWj1LS08xiAt
 mGXrjWwRN8Wj5WTR1pOFYxohoXkuKTeVWKOQC0y8DKf5/YISZ+9cUJAmM0wraIk4izYh
 Q1Pbjg1g0wnNY97Z3rHq99p23o4cC9Cc+z7ytM+b+Vy3XJJJj4NLPN5dBFagk4SnSZuX
 r4vN0j6xTNWWteap1V4JP3g+qzOq23CtjYKUetOGZtltMR6NCDp4SMx8X/yjy9lrdcdD
 J2Ejvskc9Z8D/6rW3mMAoM0W1A2hHqD9WFph3qGMzpOoSWVGUhp+xBmKwiWmoQ9lRAP9
 ugQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725575498; x=1726180298;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ByTGY4/YW1oFlLnwGbDA1qTS9L9gMEUay1+a7RZYMwo=;
 b=G6tdLE8/6ZCs6E4cdsmTetIW74PTiGACBp7u//QLOOyONoii0o6Wk09nJCdzzfpT+0
 xWJUVmYVFwxE9zHsFhYfwDqEiAPGWsbo9glWyO+BHPmbZyxgXNCPg6t70dddKaM6Gdfo
 J3HobabjdXU04UaHO3/t5rrzoN69iaXJ3uvptVz/Txhqq6jLuRYx3VzkdexD4gTQbYDt
 +R5O3FYM08OcP6oknD28D27q9fAgoC2rd5DuzxeXmvUwPYn2DfkPOEh+SoCoyQHTS4VD
 Q/3a9OucwZNMG6tY2PitIdv/bE9SqEaMp+HpH/i00PjaSrm+Z7tOXMdD8T8wW1FpfzdC
 qC4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7B7gKGalWBP/QV1et8TXKkcmtGU/MgAKG43mqPTJURVCYzBN127T1S9Jiva24tj7Shngb2e08txg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmprPfRsVRpeWZ8gAq6/+QxB4501dgNAPV4MOHSKCzmwDoPlSa
 umUK6JqfewT/67N0heIoUJcKgEFJDX6wNDHAL73ocThdoZNLEhjc
X-Google-Smtp-Source: AGHT+IElrwBYH/D0EmLH69uk3BJrH7NaeKR2pAOqLsxRNAM44HDm9e8DYGn+wJTGKzyP8BcdCGua7w==
X-Received: by 2002:a05:6870:ac14:b0:277:d8ee:6dda with SMTP id
 586e51a60fabf-27b82ed99acmr842093fac.23.1725575498562; 
 Thu, 05 Sep 2024 15:31:38 -0700 (PDT)
Received: from VM-Arch (ool-1826d901.dyn.optonline.net. [24.38.217.1])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7a98ef1e6efsm115978685a.23.2024.09.05.15.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 15:31:38 -0700 (PDT)
Date: Thu, 5 Sep 2024 18:31:35 -0400
From: Alex Lanzano <lanzano.alex@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>, 
 christophe.jaillet@wanadoo.fr, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: display: Add Sharp Memory LCD bindings
Message-ID: <w6izw3nv35zhquqipv5elp7hqf5pdtu6b2ss2infh4mmxr4aop@cxypawy5rufr>
References: <20240905124432.834831-1-lanzano.alex@gmail.com>
 <20240905124432.834831-2-lanzano.alex@gmail.com>
 <a4520c05-d64b-4ef0-823c-6c568b459e21@kernel.org>
 <trlyhlclf74itbgj4x6baj6ga6yipdicw3c6odtjgxtbw3cjyl@lyfiny2yiz35>
 <8bab34a9-0fe4-4c69-b12b-7ad663bde2d0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bab34a9-0fe4-4c69-b12b-7ad663bde2d0@kernel.org>
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

On Thu, Sep 05, 2024 at 11:12:47PM GMT, Krzysztof Kozlowski wrote:
> On 05/09/2024 22:27, Alex Lanzano wrote:
> > On Thu, Sep 05, 2024 at 03:23:20PM GMT, Krzysztof Kozlowski wrote:
> >> On 05/09/2024 14:43, Alex Lanzano wrote:
> >>> Add device tree bindings for the monochrome Sharp Memory LCD
> >>>
> >>> Co-developed-by: Mehdi Djait <mehdi.djait@bootlin.com>
> >>> Signed-off-by: Mehdi Djait <mehdi.djait@bootlin.com>
> >>> Signed-off-by: Alex Lanzano <lanzano.alex@gmail.com>
> >>
> >> I don't understand what happened here. Your process of handling patches
> >> is odd. Tags do not disappear, you had to remove them, right? So where
> >> is the explanation for this?
> > 
> > Whoops! My apologies for wasting time. Nothing changed in this patch
> > I forgot to add in your reviewed-by tag.
> 
> Tag was there before, so you removed it...

In prior versions I was manually adding the tag to the patch file. But I
have since added it to the commit message like I should have from the
beginning. Again, I apologize for any time wasted and appreciate the
review.
