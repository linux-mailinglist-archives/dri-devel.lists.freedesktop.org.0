Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B90EE91C527
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 19:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3584610ECDD;
	Fri, 28 Jun 2024 17:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="NjSr7qyl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE4AC10ECDA
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 17:47:15 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2ee59cffe01so179881fa.0
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 10:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1719596834; x=1720201634; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oXawiii30SbY22A0WpPOSynPJrUU92tc5F+sXUGGBi4=;
 b=NjSr7qylZ4XnOnIwYvYui7eh+bHqdA4oVskHksQqhAvMNJMlh+TbEVr1gMKmTSqjBg
 jdTxBLL5e9H812ZwiWVaEvYDYDd72qoOnJY1lRSyPSrriG1tRQdEXGAFtcni0iCdrHQN
 Mz13H/a1GeWmV8PkYIuaO3AprSherlq81LL4M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719596834; x=1720201634;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oXawiii30SbY22A0WpPOSynPJrUU92tc5F+sXUGGBi4=;
 b=fch2G5jJ14m+g/OmLAcCBfVpnh9KynjmPuSIEcemAy2ax8eOuDcbjtL9SukZNKIfzN
 lMHdqEDRLwwTjvyQkuz2JpNpJLKEz3+ThsVQsn7968Z0/SpgI3sEgNCKPeGjNYkQYcex
 vipCkmpi9JE+R5z7H2fFccGHbmLTPYvbdrKfz05dxcbhD/F/kQHyjO0vg+Qu3A70eeOs
 wIqD+4lQcnWQlcbAXvqCC8oQJ4dimg37AhaqdRBYmNkKoHQTE6nsmIVlzQaxXvo983s5
 QD72bBWGXWurSuVmSuE/mVHrFDaHQKbMuymRBpWRlLeeTNmU66TUcs/SfQ0BAi5aDBZ0
 t0+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuwqyHhL1VtFqgdwG5vTI7rnBNTHqaDFswjjdw/844KEyThIJlc2RsnGKr9M7Fymys8wrmN9gEFV2vQBnja80Gfv8IlKgp4RtjS6Su7+k3
X-Gm-Message-State: AOJu0Yw8evJ6jK5/9SSMBA3VdqRGz1vlCUdGDNf+4dqVL8kJvmNNCtkE
 44fFftQjp02VbX4sNKswwgd43z4I4m0I47gL6rjnvREPGgAq0gphR4bRkbCd3VQ=
X-Google-Smtp-Source: AGHT+IFupNHWZXb+QLKkwFqtsw/yyqnuJNIOBgzzTmWF8Qysi7dT/74C6TF8L4BTTqPJeAphNz+eXQ==
X-Received: by 2002:a2e:b0d6:0:b0:2ec:4399:9bfc with SMTP id
 38308e7fff4ca-2ec55fe3a56mr117145931fa.0.1719596833481; 
 Fri, 28 Jun 2024 10:47:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4256b09a073sm44514485e9.32.2024.06.28.10.47.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 10:47:12 -0700 (PDT)
Date: Fri, 28 Jun 2024 19:47:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Daniel Stone <daniel@fooishbar.org>
Cc: Lucas Stach <l.stach@pengutronix.de>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Stone <daniels@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/etnaviv: Create an accel device node if compute-only
Message-ID: <Zn73Hr14DUHfhDz6@phenom.ffwll.local>
Mail-Followup-To: Daniel Stone <daniel@fooishbar.org>,
 Lucas Stach <l.stach@pengutronix.de>,
 Tomeu Vizoso <tomeu@tomeuvizoso.net>, linux-kernel@vger.kernel.org,
 Oded Gabbay <ogabbay@kernel.org>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>
References: <97eadcba7cabe56f0f4b4d753bd3d53f8540ef4b.camel@pengutronix.de>
 <CAAObsKAQ=pWQ8MR1W7WwK1nVEeiCFNC3k+NZKsu4Fkts-_+zWg@mail.gmail.com>
 <CAPj87rO7zyDsqUWnkF0pZeNFnNK2UnAVJy4RmB3jmPkKQ+zbEw@mail.gmail.com>
 <CAAObsKBm3D_3ctFyK-rfpM-PU6ox1yoaMA1EES9yR-nRmU4rYw@mail.gmail.com>
 <CAAObsKAt563VNzDcF4rGkWPcxBPzKcq=Hj5RY6K20FWR43nvUQ@mail.gmail.com>
 <ZnvDJVeT3rz-hnv9@phenom.ffwll.local>
 <7cee6b78bc2375d9b014f9671b0d72ae65eba73c.camel@pengutronix.de>
 <CAPj87rPB=N2vJ-5C7xXORYstK3=TpX+jZ7mCr7oxY2wpXeaTTQ@mail.gmail.com>
 <ZnxVWrFJKbVO8PZ0@phenom.ffwll.local>
 <CAPj87rPnA1eKR_b7gAhDiMZRcVt8xPS9xnsscqVQ_a_qO_tD4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPj87rPnA1eKR_b7gAhDiMZRcVt8xPS9xnsscqVQ_a_qO_tD4A@mail.gmail.com>
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

On Wed, Jun 26, 2024 at 08:26:04PM +0100, Daniel Stone wrote:
> On Wed, 26 Jun 2024 at 18:52, Daniel Vetter <daniel@ffwll.ch> wrote:
> > On Wed, Jun 26, 2024 at 11:39:01AM +0100, Daniel Stone wrote:
> > > On Wed, 26 Jun 2024 at 09:28, Lucas Stach <l.stach@pengutronix.de> wrote:
> > > > So we are kind of stuck here between breaking one or the other use-
> > > > case. I'm leaning heavily into the direction of just fixing Mesa, so we
> > > > can specify the type of screen we need at creation time to avoid the
> > > > renderonly issue, porting this change as far back as reasonably
> > > > possible and file old userspace into shit-happens.
> > >
> > > Yeah, honestly this sounds like the best solution to me too.
> >
> > Yeah mesa sounds kinda broken here ...
> >
> > What might work in the kernel is if you publish a fake 3d engine that's
> > too new for broken mesa, if that's enough to make it fail to bind? And if
> > mesa still happily binds against that, then yeah it's probably too broken
> > and we need etnaviv-v2 (as a drm driver uapi name, I think that's what
> > mesa filters?) for anything new (including the NN-only ones).
> >
> > I would still try to avoid that, but just in case someone screams about
> > regressions.
> 
> It's not just etnaviv, it's literally every Mesa driver which works
> with decoupled render/display. So that would be etnaviv-v2,
> panfrost-v2, panthor-v2, v3d-v2, powervr-v2, ... albeit those don't
> tend to have multiple instances.

So essentially mesa just burns&crashes when old mesa runs on a newer
kernel with support for a chip that mesa doesn't know about?

> Anyway, I'm still leaning towards the answer being: this is not an
> etnaviv regression caused by NPU, it's a longstanding generic Mesa
> issue for which the answer is to fix the known fragility.

If the above is correct, then yes I think we should just fix mesa. Feels
like the breakage is too obviously there, and that's all we'll do unless
the screaming gets too loud.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
