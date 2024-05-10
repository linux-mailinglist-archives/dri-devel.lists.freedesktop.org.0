Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7D8C2CA6
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2024 00:33:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0656810E0E9;
	Fri, 10 May 2024 22:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="IXleRW4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924B710E0E9
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 22:33:50 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id
 af79cd13be357-792b8d989e4so195633285a.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1715380429; x=1715985229;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NVisxd1xtcmhvxdpqTGyNvzYQwpGM+4jeLB5LKdcrvQ=;
 b=IXleRW4J2aHmKhjonQWsIWpZjfL+DMSCl/nS1oco4svGT5PzjcpcZowQ4OjrlfsSas
 cSKhbSl2HeteIHV2apra9nTwKuWq/MmzNKq7JB2BbCQ1CFLGLxuwbfR72NN+GNl6D3/k
 GqXKBzWQkN3XxD1hziihlA74q+dtGRL/rPfZs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715380429; x=1715985229;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NVisxd1xtcmhvxdpqTGyNvzYQwpGM+4jeLB5LKdcrvQ=;
 b=un4zPbpCY4XhKWvi2e80do68a86dZxbyhl+BDzstSgzMn9ayKnr8wsqDoAUm68HbW5
 0hIjG7u3taVaDTjQsesCSSLqcmoIt0Jd3SVWkCvb6AqhaCg2G+LF7jM8KByra2vqN9vH
 0WXWse4rUFpDxZqb5WH4k9quMQ3qHl8MaJST76LQ84910xkrZTHSsoFGOfODvp9FsaeP
 BtyQ0vBP3BSjzWJWVJK9J+XYrOkxkID2urVmV3B9YsmVlwnG2JpzrpPdE7TNqgehhH3r
 M47795dERe54Q3s9HpewjGJziA8r4IXDy0ar+BlS5a+kk7kHjkrwmaquqeBtq71a3u0H
 AwoQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe0cxMdWWIa9PeaO4fVvetaRyXWYOiWKnqEpK0IL+4G3k5fOKmzEt9erVJzteW31+pxVgTzgZFD9fphIHBFJXNDz6LSoYnHLcW3jeq0H8E
X-Gm-Message-State: AOJu0YwGZNy8Bp7hZq8FA4s+IU8beBPwjYuf0ldM36V2bZeQyE/ZIIDh
 5hG9+eNzRuRZJUS8X2hLgET9kbuPsoBjgrpox3B+O3+4uyFi8rs6T1a91RXYZDigiwbWlBNwdWo
 =
X-Google-Smtp-Source: AGHT+IFLqP+93+YOboIljMNSl2awwL6BCj5P2aJKnRJOYqyBZO0eI4oy5ouJHf6UlJDAyJPVs1qTOQ==
X-Received: by 2002:a05:6214:4a03:b0:6a0:e6a6:773f with SMTP id
 6a1803df08f44-6a16824c58amr51991176d6.52.1715380428843; 
 Fri, 10 May 2024 15:33:48 -0700 (PDT)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com.
 [209.85.160.170]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6a15f1feb5esm21039386d6.139.2024.05.10.15.33.48
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 May 2024 15:33:48 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-43dfe020675so156491cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 15:33:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXp6JeEJh+JwUk1Yisyec6qWq5ClUyy5JaXYBI951z4XswGZUb520EbJUae8vnEWUJEqRsUBl72kukgYquiUDxeYiYwQsJawTVQ3GhLhSts
X-Received: by 2002:a05:622a:1c15:b0:43a:f42f:f0b4 with SMTP id
 d75a77b69052e-43e0a22b948mr305931cf.13.1715380098995; Fri, 10 May 2024
 15:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240510-dsi-panels-upd-api-v1-0-317c78a0dcc8@linaro.org>
 <20240510-dsi-panels-upd-api-v1-6-317c78a0dcc8@linaro.org>
 <CAD=FV=Uu2=6c_3Q44BK384cgSLX=++_bBbg6=CCqBaXnqcEK=g@mail.gmail.com>
 <hf7u3rxard7yg2z3fkmntemhnnmwnsgmhmfhpt74modswg7nj4@7kwyba55x6o7>
In-Reply-To: <hf7u3rxard7yg2z3fkmntemhnnmwnsgmhmfhpt74modswg7nj4@7kwyba55x6o7>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 May 2024 15:28:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ukk2JGV5jP_WUVFKfOsK2z=FUbUDDG5pnOumw0S-9CjQ@mail.gmail.com>
Message-ID: <CAD=FV=Ukk2JGV5jP_WUVFKfOsK2z=FUbUDDG5pnOumw0S-9CjQ@mail.gmail.com>
Subject: Re: [PATCH RFC 6/7] drm/panel: lg-sw43408: add missing error handling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Caleb Connolly <caleb.connolly@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 cong yang <yangcong5@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Fri, May 10, 2024 at 3:25=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Fri, May 10, 2024 at 02:47:05PM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, May 9, 2024 at 3:37=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > Add missing error handling for the mipi_dsi_ functions that actually
> > > return error code instead of silently ignoring it.
> > >
> > > Fixes: 069a6c0e94f9 ("drm: panel: Add LG sw43408 panel driver")
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >  drivers/gpu/drm/panel/panel-lg-sw43408.c | 33 ++++++++++++++++++++++=
++++------
> > >  1 file changed, 27 insertions(+), 6 deletions(-)
> >
> > Looks right to me. Only slight nit would be that I'd put this as the
> > first patch in the series to make it obvious to anyone backporting it
> > to older kernels that it doesn't have any dependencies on the earlier
> > patches in the series. It's fairly obvious so this isn't a huge deal,
> > but still could be nice.
>
> Yes. I wanted to emphasise the _multi stuff rather than this fix. I'll
> reorder patches for v2. Maybe I should also rebase the series on top of
> patches by Cong Yang. WDYT?

Sounds good. I think Cong is planning on a V6 to fix the last nit I
had on his patch series [1] but otherwise this plan sounds fine to me.

[1] https://lore.kernel.org/r/CAHwB_NKtw0AyMgFb4rMFNgr4WF10o9_0pYvbKpnDM45a=
Yma9zg@mail.gmail.com

-Doug
