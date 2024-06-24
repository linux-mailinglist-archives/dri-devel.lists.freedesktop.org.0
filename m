Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEC8914675
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4B510E3D8;
	Mon, 24 Jun 2024 09:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="ddz4LlBg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CBC010E3D8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:31:32 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-36310cb3961so133402f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 02:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719221490; x=1719826290; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fhj3olTv6SUOY87PzY2paXqF2zIZ/sD/SzJjIPsH4iY=;
 b=ddz4LlBg20Nv+qE/QVSmUurWq984Q90HQ1r7Cy1m/4inSXKCqbqYIdjqbjioSSRXjw
 5WLynaNM9yc5dUMy0t5R3kU9V5orSlqYSHc/0xo4JbANoCXmpHif3z4hR/sCRVJpjkIN
 6pGHXOIWb/uIFiV3iCQMtaI1dIs5qIobkHYvs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719221490; x=1719826290;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fhj3olTv6SUOY87PzY2paXqF2zIZ/sD/SzJjIPsH4iY=;
 b=OUudbC6sWtO8yvKhjTzaaH5sIQlcyl8wmirkBt2LjO7xIMsv7gTO9sPNtpHuHjk9+g
 zbg2Ygel/xENvemghPvS9vIgseoMsxPP3y6jPFLkTAzWyRUOT5JamyXHtZIXSaD1pxlw
 mVOYHkY5Bab6s7UHDVMBHvxgaO5qyGAzx6YKDCfaLhiPf8dmdPHHd2GN6h8avp375qta
 nC2aHRLoAXGHTHlCtcmzxt4c/9CFcCgBkCY6xuBjbBODOE6pomN78qDeEu7n3yt97C4E
 qLBYDO+b0Yjwt+aNCkiULxaBZyufvLZZu9BfdUiJDQCfhdyyvWyLV5//BbloTFm9aPNf
 A1Tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS87HNG3R+x+6Eha3p+YKPP3RIMiJyvMCudwKRdJyKl8jUfzJwF3hqi2RpgwxmogsZpyBtbYOJ1e2kKYNMqsT2wnRnW4ZZXW98Zzb8Ix+P
X-Gm-Message-State: AOJu0YyhdjZ9pdO7of4eKPkTGKtgV2G0JR054B0/XDcY+ZmcM+T6eoA9
 ja+Mri6jSZm1URVR86DY5mkWq7r75xkzDdwh65iwuSbIzKt8pDAJExgNFU5XbLU=
X-Google-Smtp-Source: AGHT+IGBvhkvIomB/OFmxsSh5OVMla/tqc6JCmz9Gjt/KuAZcaeO00S9dc+jYrcpEBr0xQnh5CMXDw==
X-Received: by 2002:a5d:59aa:0:b0:366:e4b4:c055 with SMTP id
 ffacd0b85a97d-366e4b4c18fmr3641032f8f.7.1719221490289; 
 Mon, 24 Jun 2024 02:31:30 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36638e90cbesm9513907f8f.58.2024.06.24.02.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 02:31:29 -0700 (PDT)
Date: Mon, 24 Jun 2024 11:31:27 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Ekansh Gupta <quic_ekangupt@quicinc.com>,
 Oded Gabbay <ogabbay@kernel.org>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <Znk87-xCx8f3fIUL@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
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
 <ZnWhwJtTXS32UI9H@phenom.ffwll.local>
 <CAA8EJppRP0HdM6AfmL0uga2esDey12LVjuSn=wJZtV4Uz0CgZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA8EJppRP0HdM6AfmL0uga2esDey12LVjuSn=wJZtV4Uz0CgZg@mail.gmail.com>
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

On Fri, Jun 21, 2024 at 10:48:27PM +0300, Dmitry Baryshkov wrote:
> On Fri, 21 Jun 2024 at 18:52, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Jun 21, 2024 at 09:40:09AM -0600, Jeffrey Hugo wrote:
> > > On 6/21/2024 5:19 AM, Dmitry Baryshkov wrote:
> > > > On Fri, 21 Jun 2024 at 09:19, Bjorn Andersson <andersson@kernel.org> wrote:
> > > > >
> > > > > On Wed, Jun 12, 2024 at 09:28:39PM GMT, Dmitry Baryshkov wrote:
> > > > > > On Wed, Jun 12, 2024 at 12:17:28PM +0530, Ekansh Gupta wrote:
> > > > > > > Move fastrpc.c from misc/ to misc/fastrpc/. New C files are planned
> > > > > > > to be added for PD notifications and other missing features. Adding
> > > > > > > and maintaining new files from within fastrpc directory would be easy.
> > > > > > >
> > > > > > > Example of feature that is being planned to be introduced in a new C
> > > > > > > file:
> > > > > > > https://lore.kernel.org/all/20240606165939.12950-6-quic_ekangupt@quicinc.com/
> > > > > > >
> > > > > > > Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> > > > > > > ---
> > > > > > >   MAINTAINERS                          |  2 +-
> > > > > > >   drivers/misc/Kconfig                 | 13 +------------
> > > > > > >   drivers/misc/Makefile                |  2 +-
> > > > > > >   drivers/misc/fastrpc/Kconfig         | 16 ++++++++++++++++
> > > > > > >   drivers/misc/fastrpc/Makefile        |  2 ++
> > > > > > >   drivers/misc/{ => fastrpc}/fastrpc.c |  0
> > > > > > >   6 files changed, 21 insertions(+), 14 deletions(-)
> > > > > > >   create mode 100644 drivers/misc/fastrpc/Kconfig
> > > > > > >   create mode 100644 drivers/misc/fastrpc/Makefile
> > > > > > >   rename drivers/misc/{ => fastrpc}/fastrpc.c (100%)
> > > > > >
> > > > > > Please consider whether it makes sense to move to drivers/accel instead
> > > > > > (and possibly writing a better Kconfig entry, specifying that the driver
> > > > > > is to be used to offload execution to the DSP).
> > > > > >
> > > > >
> > > > > Wouldn't this come with the expectation of following the ABIs of
> > > > > drivers/accel and thereby breaking userspace?
> > > >
> > > > As I wrote earlier, that depends on the accel/ maintainers decision,
> > > > whether it's acceptable to have non-DRM_ACCEL code underneath.
> > > > But at least I'd try doing that on the grounds of keeping the code at
> > > > the proper place in the drivers/ tree, raising awareness of the
> > > > FastRPC, etc.
> > > > For example current fastrpc driver bypasses dri-devel reviews, while
> > > > if I remember correctly, at some point it was suggested that all
> > > > dma-buf-handling drivers should also notify the dri-devel ML.
> > > >
> > > > Also having the driver under drivers/accels makes it possible and
> > > > logical to  implement DRM_ACCEL uAPI at some point. In the ideal world
> > > > we should be able to declare existing FastRPC uAPI as legacy /
> > > > deprecated / backwards compatibility only and migrate to the
> > > > recommended uAPI approach, which is DRM_ACCEL.
> > > >
> > >
> > > I suspect Vetter/Airlie need to be involved in this.
> > >
> > > Its my understanding that accelerator drivers are able to reside in misc as
> > > long as there is no use of dma-buf.  Use of dma-buf means they need to be in
> > > drm/accel.
> > >
> > > There is precedent for moving a driver from misc to accel (HabanaLabs).
> > >
> > > Right now, I'm not aware that fastRPC meets the requirements for drm/accel.
> > > There is an open source userspace driver, but I'm not aware of an open
> > > source compiler.  From what I know of the architecture, it should be
> > > possible to utilize upstream LLVM to produce one.
> >
> > Yeah so fastrpc is one of the reasons why I've added a dma_buf regex match
> > to MAINTAINERS, and given this move has shown up here on dri-devel that
> > seems to work.
> >
> > But also, it slipped through, can't break uapi, so I just pretend it's not
> > really there :-)
> >
> > That aside, going forward it might make sense to look into drivers/accel,
> > and also going forward new dma_buf uapi will be reviewed to fairly
> > stringent standards. We're not going to impose the dri-devel userspace
> > rules on everyone, each subsystem tends to know what's best in their
> > ecosystem. But if something just ends up in misc so it can avoid the drm
> > or accel rules (and I think media is also pretty much on the same page
> > nowadays), then expect some serious heat ...
> 
> After discussing this on #dri-devel, I'm going to retract my
> suggestion of moving the driver to drivers/accel/, unless there is an
> actual interest in moving to drm_accel.h style of uAPI.
> 
> It should still be noted that there is a strong recommendation to
> start from scratch and to use DRM / accel uAPI, either using the
> existing driver for the legacy platforms or dropping it completely.
> When the fastrpc driver was started by Qualcomm engineers, there was
> no standard method of implementing the accel drivers. Since 1st of
> November 2022 we have drm_accel.h.

Yeah, if fastrpc just keeps growing the story will completely different.

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
