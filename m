Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D364EBE0D
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:49:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3011A10E1E3;
	Wed, 30 Mar 2022 09:49:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D2B110E1E3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 09:49:44 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id w4so28402021wrg.12
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 02:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BaIJr2lK3I+GbA5Ecex95tLRkw1NynDUUN/vIRiZRHM=;
 b=ANeY6Okf0L2VxcgZBNQP6DfyxwAhOT0w+TKGE8QYbnIkq3ohx/H7FuqrltY6KBlrtu
 JOw//cdUEWlpPWBg3A/u/yrLiihxC6H3G/msNTrPhX/XbRSiqBd83q2frbyNFDIujm10
 F2riOBLEViENCBjpiugc25DZWNjViuNpgymFs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BaIJr2lK3I+GbA5Ecex95tLRkw1NynDUUN/vIRiZRHM=;
 b=rQgnq5cvaOZrzVsSMrcbp8spumxKAPKUug4kqREHNmk5R3suP+gPIqLO4DFSxvDTOx
 CvhfqkSE+pWRtfSmu+vR3d3OWmu0ytSirkEGtnfuAr4niADYfrW1x3wb1dppgpHkgSJ4
 VIybrSOZMNKx9dBUalMQLHJYOWIIkGdUQTSRE1tvkGCW+KGBJWN8CfxYbtR6xcZMDxRg
 eDbO2YZ+ERSEBqknqKZpz5P25+gWRdql3hw4/rAN10k1y36vBbjzxveVdGZF/TSIj+Hs
 mEuICRUR5OB/JdZxWnz5qIg4mrHz/Azkyy5TKSQAZ+IypsdCghPy6RZJkRmxinb78f+b
 vzUQ==
X-Gm-Message-State: AOAM5324Ue8pdRUa2Gdq8qnjqPBK1H81IUzvfdug1pzswZuaRDWcN7hR
 FoNZtXh+tECPQf7H47twZds4Yw==
X-Google-Smtp-Source: ABdhPJzFGT00LteMs47/+t4+ruo8gfEyuSdaIshjCde/jhGMhSgQjzKGgGzFWdj2qWJ3iH4hJtQ4MQ==
X-Received: by 2002:adf:8901:0:b0:205:dc81:be8d with SMTP id
 s1-20020adf8901000000b00205dc81be8dmr1498184wrs.203.1648633781979; 
 Wed, 30 Mar 2022 02:49:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d64a3000000b00203ed35b0aesm28691226wrp.108.2022.03.30.02.49.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 02:49:41 -0700 (PDT)
Date: Wed, 30 Mar 2022 11:49:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Marek =?utf-8?B?T2zFocOhaw==?= <maraeo@gmail.com>
Subject: Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
Message-ID: <YkQnsw9Js1T41qW/@phenom.ffwll.local>
References: <19a67000-d1e5-0582-c6de-07d9988b1735@amd.com>
 <CAF6AEGvDjw6zq3yiorhOc+vp2US+Jso9tF74=8gyJMTm=K5FVQ@mail.gmail.com>
 <3f0b7273-4562-7a55-e52a-bd64334886fd@amd.com>
 <CAF6AEGu6FabmcWE+NsPgnPU0=MpbA6bmO1KkJ2hrVDBLFY92xA@mail.gmail.com>
 <CAPj87rOx1uogqqKX8XZEnzpcKKY6W9TWHQFr-bgZyEU0-ftjVw@mail.gmail.com>
 <CAKMK7uFMmLLRQeONDOMpOg12p7moyrC-+hxVEqpa4hSFopbGtA@mail.gmail.com>
 <5e7d4b55-99ca-5fa4-2995-5e42d0a29473@amd.com>
 <DM6PR12MB473154C6C678EA97C03979A4F91B9@DM6PR12MB4731.namprd12.prod.outlook.com>
 <5818c2a4-80c4-8af2-9937-d2787054c149@amd.com>
 <CAAxE2A642QK0NFRLYsq5PuossG_mLExiJD8SzipVc4xVp_V=tw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAxE2A642QK0NFRLYsq5PuossG_mLExiJD8SzipVc4xVp_V=tw@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Rob Clark <robdclark@chromium.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Sharma,
 Shashank" <Shashank.Sharma@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, "Olsak,
 Marek" <Marek.Olsak@amd.com>, "Somalapuram,
 Amaranath" <Amaranath.Somalapuram@amd.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 Shashank Sharma <contactshashanksharma@gmail.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 29, 2022 at 12:25:55PM -0400, Marek Olšák wrote:
> I don't know what iris does, but I would guess that the same problems as
> with AMD GPUs apply, making GPUs resets very fragile.

iris_batch_check_for_reset -> replace_kernel_ctx -> iris_lost_context_state

is I think the main call chain of how this is handled/detected. There's
also a side-chain which handles -EIO from execbuf.

Also this is using non-recoverable contexts, i.e. any time they suffer
from a gpu reset (either because guilty themselves, or collateral damage
of a reset that shot more than just the guilty context) the context stops
entirely and refuses any further execbuf with -EIO.

Cheers, Daniel

> 
> Marek
> 
> On Tue., Mar. 29, 2022, 08:14 Christian König, <christian.koenig@amd.com>
> wrote:
> 
> > My main question is what does the iris driver better than radeonsi when
> > the client doesn't support the robustness extension?
> >
> > From Daniels description it sounds like they have at least a partial
> > recovery mechanism in place.
> >
> > Apart from that I completely agree to what you said below.
> >
> > Christian.
> >
> > Am 26.03.22 um 01:53 schrieb Olsak, Marek:
> >
> > [AMD Official Use Only]
> >
> > amdgpu has 2 resets: soft reset and hard reset.
> >
> > The soft reset is able to recover from an infinite loop and even some GPU
> > hangs due to bad shaders or bad states. The soft reset uses a signal that
> > kills all currently-running shaders of a certain process (VM context),
> > which unblocks the graphics pipeline, so draws and command buffers finish
> > but are not correctly. This can then cause a hard hang if the shader was
> > supposed to signal work completion through a shader store instruction and a
> > non-shader consumer is waiting for it (skipping the store instruction by
> > killing the shader won't signal the work, and thus the consumer will be
> > stuck, requiring a hard reset).
> >
> > The hard reset can recover from other hangs, which is great, but it may
> > use a PCI reset, which erases VRAM on dGPUs. APUs don't lose memory
> > contents, but we should assume that any process that had running jobs on
> > the GPU during a GPU reset has its memory resources in an inconsistent
> > state, and thus following command buffers can cause another GPU hang. The
> > shader store example above is enough to cause another hard hang due to
> > incorrect content in memory resources, which can contain synchronization
> > primitives that are used internally by the hardware.
> >
> > Asking the driver to replay a command buffer that caused a hang is a sure
> > way to hang it again. Unrelated processes can be affected due to lost VRAM
> > or the misfortune of using the GPU while the GPU hang occurred. The window
> > system should recreate GPU resources and redraw everything without
> > affecting applications. If apps use GL, they should do the same. Processes
> > that can't recover by redrawing content can be terminated or left alone,
> > but they shouldn't be allowed to submit work to the GPU anymore.
> >
> > dEQP only exercises the soft reset. I think WebGL is only able to trigger
> > a soft reset at this point, but Vulkan can also trigger a hard reset.
> >
> > Marek
> > ------------------------------
> > *From:* Koenig, Christian <Christian.Koenig@amd.com>
> > <Christian.Koenig@amd.com>
> > *Sent:* March 23, 2022 11:25
> > *To:* Daniel Vetter <daniel@ffwll.ch> <daniel@ffwll.ch>; Daniel Stone
> > <daniel@fooishbar.org> <daniel@fooishbar.org>; Olsak, Marek
> > <Marek.Olsak@amd.com> <Marek.Olsak@amd.com>; Grodzovsky, Andrey
> > <Andrey.Grodzovsky@amd.com> <Andrey.Grodzovsky@amd.com>
> > *Cc:* Rob Clark <robdclark@gmail.com> <robdclark@gmail.com>; Rob Clark
> > <robdclark@chromium.org> <robdclark@chromium.org>; Sharma, Shashank
> > <Shashank.Sharma@amd.com> <Shashank.Sharma@amd.com>; Christian König
> > <ckoenig.leichtzumerken@gmail.com> <ckoenig.leichtzumerken@gmail.com>;
> > Somalapuram, Amaranath <Amaranath.Somalapuram@amd.com>
> > <Amaranath.Somalapuram@amd.com>; Abhinav Kumar <quic_abhinavk@quicinc.com>
> > <quic_abhinavk@quicinc.com>; dri-devel <dri-devel@lists.freedesktop.org>
> > <dri-devel@lists.freedesktop.org>; amd-gfx list
> > <amd-gfx@lists.freedesktop.org> <amd-gfx@lists.freedesktop.org>; Deucher,
> > Alexander <Alexander.Deucher@amd.com> <Alexander.Deucher@amd.com>;
> > Shashank Sharma <contactshashanksharma@gmail.com>
> > <contactshashanksharma@gmail.com>
> > *Subject:* Re: [PATCH v2 1/2] drm: Add GPU reset sysfs event
> >
> > [Adding Marek and Andrey as well]
> >
> > Am 23.03.22 um 16:14 schrieb Daniel Vetter:
> > > On Wed, 23 Mar 2022 at 15:07, Daniel Stone <daniel@fooishbar.org>
> > <daniel@fooishbar.org> wrote:
> > >> Hi,
> > >>
> > >> On Mon, 21 Mar 2022 at 16:02, Rob Clark <robdclark@gmail.com>
> > <robdclark@gmail.com> wrote:
> > >>> On Mon, Mar 21, 2022 at 2:30 AM Christian König
> > >>> <christian.koenig@amd.com> <christian.koenig@amd.com> wrote:
> > >>>> Well you can, it just means that their contexts are lost as well.
> > >>> Which is rather inconvenient when deqp-egl reset tests, for example,
> > >>> take down your compositor ;-)
> > >> Yeah. Or anything WebGL.
> > >>
> > >> System-wide collateral damage is definitely a non-starter. If that
> > >> means that the userspace driver has to do what iris does and ensure
> > >> everything's recreated and resubmitted, that works too, just as long
> > >> as the response to 'my adblocker didn't detect a crypto miner ad'  is
> > >> something better than 'shoot the entire user session'.
> > > Not sure where that idea came from, I thought at least I made it clear
> > > that legacy gl _has_ to recover. It's only vk and arb_robustness gl
> > > which should die without recovery attempt.
> > >
> > > The entire discussion here is who should be responsible for replay and
> > > at least if you can decide the uapi, then punting that entirely to
> > > userspace is a good approach.
> >
> > Yes, completely agree. We have the approach of re-submitting things in
> > the kernel and that failed quite miserable.
> >
> > In other words currently a GPU reset has something like a 99% chance to
> > get down your whole desktop.
> >
> > Daniel can you briefly explain what exactly iris does when a lost
> > context is detected without gl robustness?
> >
> > It sounds like you guys got that working quite well.
> >
> > Thanks,
> > Christian.
> >
> > >
> > > Ofc it'd be nice if the collateral damage is limited, i.e. requests
> > > not currently on the gpu, or on different engines and all that
> > > shouldn't be nuked, if possible.
> > >
> > > Also ofc since msm uapi is that the kernel tries to recover there's
> > > not much we can do there, contexts cannot be shot. But still trying to
> > > replay them as much as possible feels a bit like overkill.
> > > -Daniel
> > >
> > >> Cheers,
> > >> Daniel
> > >
> > >
> >
> >
> >

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
