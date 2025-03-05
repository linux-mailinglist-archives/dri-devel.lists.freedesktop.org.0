Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD80A50D70
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 22:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66BD10E07C;
	Wed,  5 Mar 2025 21:28:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RD7LQqUS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 096BE10E07C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Mar 2025 21:28:53 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-54965898051so3927705e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Mar 2025 13:28:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741210131; x=1741814931; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=qgnK/dsQDqVevTIS+vzAayMgUb2QQS8JA32FshFegrE=;
 b=RD7LQqUSDS+BGVJ+8hn4SiK0rEbtDSFjy4C0nZO7smetyL9lldPAAXgLEmWfhHbE+j
 m+Qpoa29XlIn8FcxDLEBpFH1rouLYwG+DvlfpV1bJItWD+/CGN0ycZZ3cempgnZhUiXw
 LcCSJe88FH+Djl6VdtDfCeVjoEgCiGbHApyfr+hK7KkVF1FRWvC4AYlinE5vXvHjC61O
 j6aY0/GHzXAzyRaWO2s8WHw56twtF4JSJwvrGnyjrI4x7SYpCTiwKKYliy6A+ADUWE/3
 rZrYyMwnSEmYLfTmz86wo5jvj3FuI7hb9u6/c5teID4uD2PcBXv6ixX58lfzgYPwwwDs
 CsMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741210131; x=1741814931;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qgnK/dsQDqVevTIS+vzAayMgUb2QQS8JA32FshFegrE=;
 b=YXYI/bXHZZL9t1h31b8aLokMPsR7M4zIjdxtkF07aS8LgAoBTSLLkSn3e532XB9aTg
 KrM5NGuXOzLr80gYKYzYlDPQ2IzE9SGuPANf71UveEZjes2XxDL/IzngMapAU2CTEmqa
 svygMqQN8KWdb0uBM8zqpTn0/GPnBcVDd6N3JCwVRP3ghPfcn8iYABQpVzZtRKeOBCUS
 vOZktO4dCGJgYRWjcjrHzUIzDwZ5gzH1IZvvgGX+BUGRi+plcYjzOX9CcOy6tHFeM5iK
 7VQux36Z74bQwu6vCrlxl7npgqRh7biTGOEX/H8lITT4l0eTJYa8cAfcq/FnRugmk+uJ
 fwfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUnL1w1gl2NA6/uTUrGWpEE/aIDpyJ2IlOGhKmavziQ6vt1W33BAdQcx5ipGqLm6qJozYPlk2PlEuQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBWwORUZ2Ac/0RDW0sAQl98+Ta/jxaJhUUM2ksy/jTKTHs6PL3
 nMD+poI8ioOb/W9mWtXdPNVky8xuQneglMOUpcYuxjNpO2XwuqyIEIPcBEzCjBQ=
X-Gm-Gg: ASbGncvb/Rqd9Fa4svAdWiQQ/AIj8uIhVMwZ2tTShoQnI0gqR++EJOGlk4Y39wFrZBC
 38JN3lXty8OAeXY3OYPViUg+5cprJ9oyNNgrDY+NiFOu/S4/FYkY5sTuXKt+WUBPtqeKOueGs3g
 yzN6CIcm4Umyg33Wo10bM7k4wn5PmIVtkQ9mBCtKUrfx4j4SosF2oYIK4BP7U6xt1ytpS9kMsrj
 eI66RFHMz06WZVNHfkIjTrdbelAUoXmlXKZmu7BwqY+5GBaIW2HlijXujSYUtSmUVWcEpSNrBGW
 Le4m7SL3UkfA4BCx+bj7wYSthpgr+2Ck7YGazM14wWC80XhOWVfpeulzs0bYglAh9gYndDbeBhN
 BS96VheUGFO4lBgej2ahqGMLf
X-Google-Smtp-Source: AGHT+IH2qGb5qPmpNY2+Tt7o5llhv1gkGQNprrWhdZNfFd33pV50IdQ/Kc8ny7RCAvA4GDgOXB71KQ==
X-Received: by 2002:a05:6512:b20:b0:545:fba:8a57 with SMTP id
 2adb3069b0e04-5497d32f412mr1645346e87.8.1741210131261; 
 Wed, 05 Mar 2025 13:28:51 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54957fe5d00sm1467587e87.154.2025.03.05.13.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 13:28:49 -0800 (PST)
Date: Wed, 5 Mar 2025 23:28:47 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Doug Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Joel Selvaraj <jo@jsfamily.in>,
 Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>,
 Artur Weber <aweber.kernel@gmail.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Tejas Vipin <tejasvipin76@gmail.com>
Subject: Re: [PATCH 00/14] drm/panel: Transition away from using
 mipi_dsi_*_write_seq()
Message-ID: <bifqi2pn4cmefj5sxt26n7xc3kpn4rwaajgxcyv6aujlgpx3dt@tjfignye446u>
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
 <CAD=FV=WkPefg00R_TAQQA6waRqGdD+3e84JXfPLk2i9BRzW6Yg@mail.gmail.com>
 <CAN9Xe3S6u1hjp0YifoFC4N9t6Ek3+ZZQPPbL529Y1_+AvnPNLg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAN9Xe3S6u1hjp0YifoFC4N9t6Ek3+ZZQPPbL529Y1_+AvnPNLg@mail.gmail.com>
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

On Wed, Mar 05, 2025 at 12:29:06PM -0500, Anusha Srivatsa wrote:
> On Sat, Feb 8, 2025 at 3:43 PM Doug Anderson <dianders@chromium.org> wrote:
> 
> > Hi,
> >
> > On Thu, Feb 6, 2025 at 1:06 PM Anusha Srivatsa <asrivats@redhat.com>
> > wrote:
> > >
> > > Transition away from mipi_dsi_generic_write_seq() and
> > > mipi_dsi_dcs_write_seq() to mipi_dsi_generic_write_seq_multi()
> > > and mipi_dsi_dcs_write_seq_multi() respectively.
> > >
> > > This is addressing one of the gpu todo items [1]
> > >
> > > Used Coccinelle to make the code changes.
> >
> > As Dmitry mentioned [1], I think a real cleanup needs more thought
> > than can be done in a Coccinelle script. Maybe you can make a script
> > that's super fancy and does a perfect conversion, but I sorta doubt it
> > in this case.
> >
> > A few other note:
> >
> > * Tejas Vipin has been slowly whittling down this TODO item. It would
> > be good to CC him on any attempts to avoid duplicating work. He just
> > submitted a patch [2] that duplicates one of the panels you ran your
> > script on. It would also be good to look at the patches he has been
> > posting to see some of the extra complexities.
> >
> > * I'm happy you CCed on the cover letter, but given that I've been
> > helping with this TODO entry it would have been nice to have been CCed
> > on all the patches.
> >
> > For now I'm not going to review the individual patches in this series.
> > If there are any where you think your Coccinelle script really got
> > everything adjusted perfectly then feel free to point them out and
> > I'll review them. If you want to help with this effort, my own
> > personal preference would be to at least start w/ one panel at a time
> > since probably review feedback on all the conversions will be similar.
> >
> > Thanks!
> >
> >
> I thought I had replied to this  :( (face-palm) sincere apologies. Luckily
> I bumped into this today.  Thanks for the feedback. I agree with what you
> said. While the script catches the patterns , a little of manual conversion
> and proof checking is needed. I am taking this into account while I spin
> the next version. WIll CC everyone in individual patches who have taken
> their time to take a look at my clearly incomplete approach to this
> redesign.

- Please post them one by one rather than the whole series
- As you are looking into the same set of items as Tejas has been
  working on, please make sure to discuss the order, so that you don't
  do the same job twice.

> 
> Again, thanks Dough
> 
> Anusha
> 
> > -Doug
> >
> > [1]
> > https://lore.kernel.org/r/mz6usiheb2lx6wlk47z3btvf6t6kbo4ja4n6mli5hosrpcvdwp@wmvfvhaqhpkm
> > [2]
> > http://lore.kernel.org/r/20250208051541.176667-1-tejasvipin76@gmail.com
> >
> >

-- 
With best wishes
Dmitry
