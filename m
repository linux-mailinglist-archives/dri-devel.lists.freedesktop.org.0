Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F7155ACFD
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jun 2022 00:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798FE10E08E;
	Sat, 25 Jun 2022 22:45:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AF4310E145
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 22:45:41 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id q6so11578228eji.13
 for <dri-devel@lists.freedesktop.org>; Sat, 25 Jun 2022 15:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=uGoiU2t5SS0RI/4Kw3vICeCyRJ6DgcsgJQfohM/0CcM=;
 b=NlOL7R5zTkOhnrd3ZR7YEuBsQn6TOw208jSueNZl3n+tlYTgmD7WnjY7sc8xJugvKY
 LDl9gsGuPOcpPCAEA/FsyzvKfPCpJ4CEgD1c57UEmBTGdpezzf/MDJOzMeC6tatSNgGq
 TIx01wYoT1elOk2gdLCElUBiTsQrrDzahoUKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=uGoiU2t5SS0RI/4Kw3vICeCyRJ6DgcsgJQfohM/0CcM=;
 b=N9zIMnyq6od8KrueASyYXBz5BmIPJDHXLv9GCwa1+LNSzgSwk+2kWYp1BF6ngwi0jA
 yxLl5Yli+G6PenrdIL+p2/3oU0oP7tNAym+zSKzhVJxdMSQ/ba5bZf1czgR8vmz70ToM
 6c217UR11Bv2jOzh0IvjWaoSIN291woO/SiC2M8/rLEW5H3tE5wzM05zxcWvvvP+AGvS
 zgBD9LUWFrw7HbBDX5GIkd5G4Owf58FSDa4zGCNI3eJ1GoMXQmxODGnDEoEtPSQO6FNG
 1H15910J4ffWDU6jH1ohQUrFAMT8M+XDfXXKSgDXfWQoCIdHVfYQOnUlG22/SoP/gOmI
 /b8g==
X-Gm-Message-State: AJIora/lBFehur8uk21DZ2WLWAwHCaEmrW3Hx+Ool+f7tpm23l/wZ1Ao
 xMvbRYf9xfQK443Ia4PkoxaxVVxGONj8wA==
X-Google-Smtp-Source: AGRyM1smfaU9vlKuuh+kWx3sV+XC9PyAq3DukZlTRBBh88+Yeb1/xVhUsMTV1QwkvXO7hZ8LfCdE4Q==
X-Received: by 2002:a17:906:74c2:b0:722:e1e2:edea with SMTP id
 z2-20020a17090674c200b00722e1e2edeamr5806641ejl.658.1656197139713; 
 Sat, 25 Jun 2022 15:45:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a170906c28e00b00722edb5fb53sm3100861ejz.116.2022.06.25.15.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jun 2022 15:45:38 -0700 (PDT)
Date: Sun, 26 Jun 2022 00:45:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [RFC PATCH 3/5] drm/amdgpu: Allow explicit sync for VM ops.
Message-ID: <YreQER+Szg5dxyNN@phenom.ffwll.local>
References: <CAP+8YyEWE9KCmo2pGOHMyT3fSEXskTG-tfymwQmmy7d1c9CuRQ@mail.gmail.com>
 <3b6a7d56-6c65-046d-0a51-bbe167e04322@amd.com>
 <CAP+8YyGL_WEME-1_oB_K5_K600c5kcmO0GxXBQGVQEF7aP_D7w@mail.gmail.com>
 <91e843ca-928a-7ab1-12e4-89fbba085403@amd.com>
 <CAP+8YyHqcoxVeropBpeuSRX4kNtVezi1-s3FKSic_Z_OQ8BcAg@mail.gmail.com>
 <1e04e766-4a5b-6825-6991-3bd542f562b5@amd.com>
 <CAP+8YyGEHUZhCCUa-3sSVmgGMrTkj=vQomPar=hTN=3-RCznOA@mail.gmail.com>
 <71cc9552-4bf6-4941-e903-2ea62a22a2e9@amd.com>
 <YrYfw6T4MGvifIco@phenom.ffwll.local>
 <785d01ba-7d4a-1b69-a97a-6144ce0f6772@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <785d01ba-7d4a-1b69-a97a-6144ce0f6772@amd.com>
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
Cc: ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jun 25, 2022 at 03:58:17PM +0200, Christian König wrote:
> Am 24.06.22 um 22:34 schrieb Daniel Vetter:
> > Digging out of a hole, apologies to everyone.
> 
> No problem, I'm totally overworked as well.
> 
> > On Fri, Jun 17, 2022 at 03:08:00PM +0200, Christian König wrote:
> > > Am 17.06.22 um 15:03 schrieb Bas Nieuwenhuizen:
> > > > [SNIP]
> > > BOOKKEEP is exactly for that, but as discussed with Daniel that's not what
> > > we want in the kernel.
> > Not sure which Daniel you talked to, but this wasn't me.
> 
> Hui what? Of course I'm talking about you.
> 
> > > When you mix implicit with explicit synchronization (OpenGL with RADV for
> > > example) it should be mandatory for the OpenGL to wait for any RADV
> > > submission before issuing an operation.
> > > 
> > > What you want to do is intentionally not supported.
> > vk is very intentional in it's rejecting of any implicit sync.
> 
> [SNIP]
> 
> > We should probably also document this in the kerneldoc for the BOOKKEEPING
> > usage that this is the fence type that vulkan cs should use in all
> > drivers, otherwise this will become an endless mess of driver specific
> > hacks (i.e. the world we currently live in).
> 
> Well, Daniel somehow we are somehow not talking about the same thing here :)
> 
> I've documented exactly what you describe above in the initial patch which
> added BOOKKEEPING (I've still called it OTHER in that iteration):
> 
> > >/+ /**/
> > >/+ * @DMA_RESV_USAGE_OTHER: No implicit sync./
> > >/+ */
> > >/+ * This should be used for operations which don't want to add an/
> > >/+ * implicit dependency at all, but still have a dependency on memory/
> > >/+ * management./
> > >/+ */
> > >/+ * This might include things like preemption fences as well as device/
> > >/+ * page table updates or even userspace command submissions./
> > >/+ */
> > >/+ * The kernel memory management *always* need to wait for those fences/
> > >/+ * before moving or freeing the resource protected by the dma_resv/
> > >/+ * object./
> > >/+ *//
> > >/+ DMA_RESV_USAGE_OTHER/
> 
> Later on I've even explicitly mentioned that this is for Vulkan submissions.
> 
> But it was *you* who made me remove that with the explanation that we have
> to use READ for that or we break existing userspace.

Hm the only discussion I've found I actually mentioend we should highlight
that vk should use OTHER even more than what you had. Quoting myself:

> +      * This might include things like preemption fences as well as device
> +      * page table updates or even userspace command submissions.

I think we should highlight a bit more that for explicitly synchronized
userspace like vk OTHER is the normal case. So really not an exception.
Ofc aside from amdkgf there's currently no driver doing this, but really
we should have lots of them ...

See https://lore.kernel.org/dri-devel/YZ+y+Uwo809qtvs5@phenom.ffwll.local/

I didn't find anything else. So not sure how we managed to create
confusion here :-(

> I mean that still makes a lot of sense to me because if I'm not completely
> mistaken we do have use cases which break, especially Vulkan+encoding.

Yeah I think we only have some communication fumble here, nothing else :-)

And yes libva doesn't have any support for vk's explicit sync model, so
that will just fall flat on its face. Might motivate a few folks to fix
libva :-)

Note that on i915 side it's exactly the same, we've also been setting the
READ fence thus far. Since the breakage will be introduced by upgrading
mesa we'll at least avoid the kernel regression complaints, or at least I
hope we can get away with that.

Since really I don't have any idea how it could be fixed otherwise, except
through some really, really terrible hacks. Maybe kernel module option or
so.

Anyway I think all we need is just a patch to the dma_resv docs to explain
that USAGE_BOOKKEEPING is what vulkan userspace wants, and why. Bas,
you're up to typing that?

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
