Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8F4912AA6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 17:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3749310F2F0;
	Fri, 21 Jun 2024 15:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Yr1RGoGI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B1E10F2F0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 15:52:37 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4247102da30so2653165e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 08:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1718985155; x=1719589955; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vd3HeTeZMYz+szCMLjJ+nPKJvussyehfNdDyWJdflY8=;
 b=Yr1RGoGIHnJQkSz6Ry0I/SVARho0d0uaZ5YA3HxTTgU7rcOcAR8WVW45mTMpRWXYA/
 c3pDDBXtlFwXy4jcpLREA8chRsNqo4kOILM91HpZAzio4o5rxgl7QmEDmGjr8FkMONQ9
 Bd3HY88shDsZSje2nRQHKrjdLnhitlLHp/6Hg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718985155; x=1719589955;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Vd3HeTeZMYz+szCMLjJ+nPKJvussyehfNdDyWJdflY8=;
 b=dgdsBh9jGOL8RefI8sKchy9U2rMB1jyyVIwxT7A+rPwXYEbMBkFQfD922fXaZq9xLR
 YPahcG/JuB31IPy8Tm2iSD1HzBPQBoKQK5r3KVuB4091QJGSBBxbsLIjtMT76SkI0Yyv
 GeCBE6ouibqbWHlwEXriIalT+b/yCp8uSv3AyPXv3TL1g/FZkD+nKdpb6DYYFEZaJrDt
 7j+UhN01G4wEVBxo/pX22zTHEbY8ryi8HMxjaUmcG/V0pR1ewsTvgTZPgux9q+iYg/cX
 sWKBYh92ENvVuOf/p6QtjYq1YPni0Dw6OTqRipBdfOzRGcZn3AJ4yVG+AWgQDBIyMfgd
 ZxVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXvoRXYHgUbxCUDMAih3U/vJb9+QCVzkpDmAm+w0asw0D3ulvLJNo84K5/Lye/1FijE02hk5AwinOFBSeA/l5oooLpHIdZWlMCKaIgidcw
X-Gm-Message-State: AOJu0YxZGI+3CaTEUjg8kz/+W3IcA2MN/n0IHPfm844H+arIVR9r/WUk
 hYHcfBRECQb/rXtnEO01vuKBs/TOdq/WwFwJFDnBogmyWZ96JSvR4iWdgBqp0oQ=
X-Google-Smtp-Source: AGHT+IHTT6f9c44NGR6g+VcrdzZyAm7iHTscK4tEiWZvq36vM9pBm1QlBHsawMSX9ZVQwhSsjv6Cbg==
X-Received: by 2002:a7b:c5ca:0:b0:424:7876:b6ca with SMTP id
 5b1f17b1804b1-4247876b78bmr54773525e9.1.1718985155185; 
 Fri, 21 Jun 2024 08:52:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247101a955sm102812785e9.0.2024.06.21.08.52.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 08:52:34 -0700 (PDT)
Date: Fri, 21 Jun 2024 17:52:32 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Ekansh Gupta <quic_ekangupt@quicinc.com>,
 Oded Gabbay <ogabbay@kernel.org>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <ZnWhwJtTXS32UI9H@phenom.ffwll.local>
Mail-Followup-To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Ekansh Gupta <quic_ekangupt@quicinc.com>,
 Oded Gabbay <ogabbay@kernel.org>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@gmail.com>
References: <20240612064731.25651-1-quic_ekangupt@quicinc.com>
 <zbpia232dh4ojfsvhcqxrp6cwfygaalu5cycdrs47pqmnrisvk@dq24nww26gkm>
 <z6g5ool5vomkudiroyaxh532rhlfu5x4i3l5xoqrsho2sxv4im@v5ghemjkpc3v>
 <CAA8EJprgCJKOnZo7Q31KZV3SA3NqWxcMmoUxuqnVF+8cQW5ucg@mail.gmail.com>
 <6f59552d-d7a3-5e05-3465-e707c1b7eaf2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f59552d-d7a3-5e05-3465-e707c1b7eaf2@quicinc.com>
X-Operating-System: Linux phenom 6.8.9-amd64 
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

On Fri, Jun 21, 2024 at 09:40:09AM -0600, Jeffrey Hugo wrote:
> On 6/21/2024 5:19 AM, Dmitry Baryshkov wrote:
> > On Fri, 21 Jun 2024 at 09:19, Bjorn Andersson <andersson@kernel.org> wrote:
> > > 
> > > On Wed, Jun 12, 2024 at 09:28:39PM GMT, Dmitry Baryshkov wrote:
> > > > On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
> > > > > Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> > > > > to be added for PD notifications and other missing features. Adding
> > > > > and maintaining new files from within fastrpc directory would be easy.
> > > > > 
> > > > > Example of feature that is being planned to be introduced in a new C
> > > > > file:
> > > > > https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> > > > > 
> > > > > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > > > > ---
> > > > >   MAINTAINERS                          |  2 +-
> > > > >   drivers/misc/Kconfig                 | 13 +------------
> > > > >   drivers/misc/Makefile                |  2 +-
> > > > >   drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
> > > > >   drivers/misc/fastrpc/Makefile        |  2 ++
> > > > >   drivers/misc/{ => fastrpc}/fastrpc.c |  0
> > > > >   6 files changed, 21 insertions(+), 14 deletions(-)
> > > > >   create mode 100644 drivers/misc/fastrpc/Kconfig
> > > > >   create mode 100644 drivers/misc/fastrpc/Makefile
> > > > >   rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> > > > 
> > > > Please consider whether it makes sense to move to drivers/accel instead
> > > > (and possibly writing a better Kconfig entry, specifying that the driver
> > > > is to be used to offload execution to the DSP).
> > > > 
> > > 
> > > Wouldn't this come with the expectation of following the ABIs of
> > > drivers/accel and thereby breaking userspace?
> > 
> > As I wrote earlier, that depends on the accel/ maintainers decision,
> > whether it's acceptable to have non-DRM_ACCEL code underneath.
> > But at least I'd try doing that on the grounds of keeping the code at
> > the proper place in the drivers/ tree, raising awareness of the
> > FastRPC, etc.
> > For example current fastrpc driver bypasses dri-devel reviews, while
> > if I remember correctly, at some point it was suggested that all
> > dma-buf-handling drivers should also notify the dri-devel ML.
> > 
> > Also having the driver under drivers/accels makes it possible and
> > logical to  implement DRM_ACCEL uAPI at some point. In the ideal world
> > we should be able to declare existing FastRPC uAPI as legacy /
> > deprecated / backwards compatibility only and migrate to the
> > recommended uAPI approach, which is DRM_ACCEL.
> > 
> 
> I suspect Vetter/Airlie need to be involved in this.
> 
> Its my understanding that accelerator drivers are able to reside in misc as
> long as there is no use of dma-buf.  Use of dma-buf means they need to be in
> drm/accel.
> 
> There is precedent for moving a driver from misc to accel (HabanaLabs).
> 
> Right now, I'm not aware that fastRPC meets the requirements for drm/accel.
> There is an open source userspace driver, but I'm not aware of an open
> source compiler.  From what I know of the architecture, it should be
> possible to utilize upstream LLVM to produce one.

Yeah so fastrpc is one of the reasons why I've added a dma_buf regex match
to MAINTAINERS, and given this move has shown up here on dri-devel that
seems to work.

But also, it slipped through, can't break uapi, so I just pretend it's not
really there :-)

That aside, going forward it might make sense to look into drivers/accel,
and also going forward new dma_buf uapi will be reviewed to fairly
stringent standards. We're not going to impose the dri-devel userspace
rules on everyone, each subsystem tends to know what's best in their
ecosystem. But if something just ends up in misc so it can avoid the drm
or accel rules (and I think media is also pretty much on the same page
nowadays), then expect some serious heat ...

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
