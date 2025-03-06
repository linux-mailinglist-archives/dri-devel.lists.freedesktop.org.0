Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B98AA55111
	for <lists+dri-devel@lfdr.de>; Thu,  6 Mar 2025 17:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59DE910E9F9;
	Thu,  6 Mar 2025 16:33:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IHaM0PGp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47B9810E9F5
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Mar 2025 16:33:57 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30bb64a4060so7742251fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Mar 2025 08:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741278836; x=1741883636; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=mcYfZGCaAKvP2JNTvUnndgZpH/B+98c6oldv3E5aRaA=;
 b=IHaM0PGpfU2ojtqRQ+MPfktuy9npBKongAmbd41IsDxEcFAQU009YBVfvxQciKHIqO
 kcgEW1sqcrpztI1T5wLnfip8ZBXTyJBwPDaACoQcwVxyYDyavyphiALuzchGAE0fERBM
 E6M9Grqp8lo9Ids0LVua849rFbXqO9JiIs94EEml5+kVqql9MrhyForQxci4Hc2D0sb+
 h3HJCe7qNqp9ZHML1C3hU6WCcoHFgkun4TW/erYjwSq5VEwxsubGG9zQSI3sNfwqeOgX
 BLK5u4S6Fp0KLmTObNmqkkplKlshVZ/cHq7z7Y/qboJRIWD6OUZW4VtasyjExqCXMC+Q
 6V5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741278836; x=1741883636;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mcYfZGCaAKvP2JNTvUnndgZpH/B+98c6oldv3E5aRaA=;
 b=wJX0LCRhyOg0NPPjSftRmHOs5zshzVWyU4aj6kF66DX8DN7U35E37xbbkAXIrqCSKk
 C2Fxbx0/py3cOCaLKbJF9fvbhkj6TS6OyelEywvO1Ig5RGYZs5rUx9TQhrYFQyNMaCZ+
 OL/C7LqOtg4wxGiRYMAm8z0dIfqite68EHrLy1aqbDf7kMA1b0f1mSkr8HLfb0ysD2Fe
 kkHxA7NwyES3z6xRO7TtUPUPvcmPumVSbbsPlgO9zIokp72fVwAImFAQI4FUgbbPd46X
 8p1XQq3Ug1urObRc0fqUxTTCDY/kqUZP6vUHXr3G8NK85OFIP4PryNfln2d4aU+05oVb
 bFqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8ZlYREseM7IYlhtaU4/bZFfywopv8cpLw+bmxh2JQWFpCw09uNtd2amxH77m1Ehqvjo9RPy5c9r4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYtKbW9jTir9HGYrcE8RDMLf/zJeiqnGGDC+ul1QDg/XEdZ01y
 FVKFeMGgm6OUC26YVSiHSXmFaZMTJEEFk4n/v3l7B2IxYrFpH9rz8pQyYjbfoZ0D3xH8jI14Ksk
 BWro=
X-Gm-Gg: ASbGncu9vf74P9dWlIzk7I8u8g5MV9zlH6UZr12YIf62W12txuPTg/Qaas35YzyrYsK
 TmQc3Uh6cVbH7LnI4ChIeVZAFqsbCMS50KEAfQo6BmPdKUWZ4tX8QbkCrnYfZ6eDoQ10HAlB8Yp
 ythfaDnVg/5Un2EiEga9v8o2P8MmMZU4bat2yCsxjNRQ5YwfYxp1T61Mdjdn7+w3trh2xGFReL8
 JeZ5AaiB53+K+hyGnteHk6Y1hYN8fdb1lpv9MlN0b7F8BsZbU7n4vNL1al4pzYxYUOfOjtzNARL
 KiBhjTxCKeoel7Zduo7kpncC3QWUgBqIirK/QbIEQEJClew3YPiuk3kVqwEkOnL2dMu7o+zsHbS
 sqciI2iw7PUxo74OygQB14sy4
X-Google-Smtp-Source: AGHT+IEhK8WPCNQ2ny4wFVJ0Mn/g931J/pH6k2jlLt44c80Y4amsFqDiQ97ufGuuRZNFOtxZQ3FiJA==
X-Received: by 2002:a2e:be05:0:b0:30b:b852:2f85 with SMTP id
 38308e7fff4ca-30bd7a3dbd6mr32951271fa.13.1741278835567; 
 Thu, 06 Mar 2025 08:33:55 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30be98f2f9bsm2526731fa.35.2025.03.06.08.33.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 08:33:54 -0800 (PST)
Date: Thu, 6 Mar 2025 18:33:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: neil.armstrong@linaro.org
Cc: Tejas Vipin <tejasvipin76@gmail.com>, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, lujianhua000@gmail.com, quic_jesszhan@quicinc.com, 
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panel: novatek-nt36523: transition to mipi_dsi
 wrapped functions
Message-ID: <p2esqngynwfrshz5rqfnmx6qgwf4dclpkb3mphwg2vavx2jbcg@clqoy5tjh7bb>
References: <20250306134350.139792-1-tejasvipin76@gmail.com>
 <ca5b0825-a485-4bec-bd93-b57a8d7ced99@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca5b0825-a485-4bec-bd93-b57a8d7ced99@linaro.org>
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

On Thu, Mar 06, 2025 at 03:05:10PM +0100, neil.armstrong@linaro.org wrote:
> On 06/03/2025 14:43, Tejas Vipin wrote:
> > Changes the novatek-nt36523 panel to use multi style functions for
> > improved error handling.
> > 
> > Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> > ---
> >   drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1683 ++++++++---------
> >   1 file changed, 823 insertions(+), 860 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> > index 04f1d2676c78..922a225f6258 100644
> > --- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> > +++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
> > @@ -23,10 +23,12 @@
> >   #define DSI_NUM_MIN 1
> > -#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)        \
> > -		do {                                                 \
> > -			mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
> > -			mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
> > +#define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx0, dsi_ctx1, cmd, seq...)      \
> > +		do {								\
> > +			mipi_dsi_dcs_write_seq_multi(&dsi_ctx0, cmd, seq);	\
> > +			dsi_ctx1.accum_err = dsi_ctx0.accum_err;		\
> > +			mipi_dsi_dcs_write_seq_multi(&dsi_ctx1, cmd, seq);	\
> > +			dsi_ctx0.accum_err = dsi_ctx1.accum_err;		\
> 
> Just thinking out loud, but can't we do :
> 
> struct mipi_dsi_multi_context dsi_ctx = { .dsi = NULL };
> 
> #define mipi_dsi_dual_dcs_write_seq_multi(dsi_ctx, dsi0, dsi1, cmd, seq...)      \
> 		do {						
> 			dsi_ctx.dsi = dsi0;					\
> 			mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);	\
> 			dsi_ctx.dsi = dsi1;					\
> 			mipi_dsi_dcs_write_seq_multi(&dsi_ctx, cmd, seq);	\
> 
> ?
> 
> So we have a single accum_err.

I'd say that can be counter-prodactive. If only one of the links falls
apart, then the second link still can be initialized (and by observing a
half of the screen the user / devloper can make several assumptions).
In case of using just one context the driver will fail on the first
error and skip the rest of the init for both halves.

I'd have a different suggestion though: what about passing two contexts
to the init_sequence callback and letting nt36523_prepare() handle each
of the error separately?


-- 
With best wishes
Dmitry
