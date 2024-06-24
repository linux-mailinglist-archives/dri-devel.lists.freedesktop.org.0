Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C68E91467F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 11:33:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD8989C0A;
	Mon, 24 Jun 2024 09:33:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="CrylG6J7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CAC989C0A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:33:48 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-364068c0ec5so278833f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 02:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719221626; x=1719826426; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hDecevrNwUO63hAzBHMfL3jldrZsRCPWB7PKUAe6PW4=;
 b=CrylG6J7XouWpOLV8iSyls48Jvsdzp+mtx2Vmcd+5RJnCb5v6pQRBLcjLawXZom/eu
 i2v5AXiC03OkVQqBZJZkkdPvB97heZlnHhpjhj1+CzeLIrOB7gYIpHK2NJIN75WO/ovy
 K0sAStlkfenVi8vUqNlFLbJSk/goiJ9hoOi7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719221626; x=1719826426;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hDecevrNwUO63hAzBHMfL3jldrZsRCPWB7PKUAe6PW4=;
 b=hytIllh6lvnRbvkxUubVzR3q0INbnd8kpDIrFbvp3YngkjYapD4jqXBDRtHhZWhgEe
 0feBUif7NfwWqfwQo/2jFNXytDsjiCeTUvPA9YVUTouqN1ttvvksl+Xyn/81yxfp1WvI
 1kD1toa+X3xFZ8f7ED5SIxEYuxSPHjOH5wILEz5QA99RJimOPAgqm6sHaTzLug/YXhwA
 uvSBdLuHxuPKSQt14HI4z8W4NZMeJRV8l661enobs6HDk01CMQCLdPX00sNJsGteRvkk
 yOmTK68/AvCWkM49dmIVo7Y6OVg7JLTpXG8fippbw86QgNc/f8HAARHpSaeWSQP6dJg/
 uYJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1uSG6+Cd5MXzWRb1E2kR6vtxTyZOy87G9S1efqHamBdsTsDzr1ZchIx3hNV6ipfZtIYDXyjdxWqa0j84CTmp4xwKKwWl5rEdcdEsM5+ZW
X-Gm-Message-State: AOJu0YzhqTigsyt1HYmCgXFH0l7y1wiHzdFmehzltSDOPU9w0POULF/D
 +jp0yH1mTYTB5EPwfgiyyaRXoLwQcC/eaiO1ZieuByMDqeb4tXSJJzpKrEqQklQ=
X-Google-Smtp-Source: AGHT+IFmDBOhp59HDggw1pz7CehJXLtxtOoh3bEUePIFnDfBhsEsaT5adH0/nPk85Q2FcM5IFWiknA==
X-Received: by 2002:a5d:5983:0:b0:35f:2929:8460 with SMTP id
 ffacd0b85a97d-366dfa2d903mr4504328f8f.3.1719221626371; 
 Mon, 24 Jun 2024 02:33:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-366389b8634sm9593317f8f.34.2024.06.24.02.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 02:33:45 -0700 (PDT)
Date: Mon, 24 Jun 2024 11:33:43 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Ekansh Gupta <quic_ekangupt@quicinc.com>,
 Oded Gabbay <ogabbay@kernel.org>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
 quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
 quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@gmail.com>
Subject: Re: [PATCH v1] misc: fastrpc: Move fastrpc driver to misc/fastrpc/
Message-ID: <Znk9d80pd67cWEYU@phenom.ffwll.local>
Mail-Followup-To: Bjorn Andersson <andersson@kernel.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 <fin5dnpf3jyo5mk4b7fktdutbds5lkpxwzojecxa4zh7gwfad2@rkryxqzt6maq>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fin5dnpf3jyo5mk4b7fktdutbds5lkpxwzojecxa4zh7gwfad2@rkryxqzt6maq>
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

On Sun, Jun 23, 2024 at 03:19:17PM -0500, Bjorn Andersson wrote:
> On Fri, Jun 21, 2024 at 05:52:32PM GMT, Daniel Vetter wrote:
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
> 
> If the agreement is that dma-buf-handling drivers must get reviews from
> dri-devel, then let's document that in MAINTAINERS and agree with the
> maintainer.

About 5 years ahead of you here with 78baee8d3b97 ("MAINTAINERS: Match on
dma_buf|fence|resv anywhere").

Cheers, Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
