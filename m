Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FF38CD41B
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 15:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8078410E3D9;
	Thu, 23 May 2024 13:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="XJRH/aqz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DF0810E560
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 13:22:03 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a59ad24baa2so93759966b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 06:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1716470521; x=1717075321; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=On9r6HMkgaTSzrnf05gbFZryZJM5WajSuUMiqmrGLOk=;
 b=XJRH/aqzLB5rSthIiONxe6Bz8PAH2qfkH+FZ0N+Q17gtOUnxzrC0uMykZicc+ALQ5b
 vveMdGCzPso/7bmmFNzMfiP1jBfR40ifyrPdLmNz83syL+EyjZtHZBmE/2cmb76/bUD1
 cW6jUZ4p4RLdafKEZ/lCXkXbgS8owprOyuNJE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716470521; x=1717075321;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=On9r6HMkgaTSzrnf05gbFZryZJM5WajSuUMiqmrGLOk=;
 b=sdQBi3nZL3dS1mIyDx5anXiouSDCRNeXFdN5DCGRNtqvZd8bIRFLU9nOzrhLbXyE57
 PrgMItGwj3rrZW1Ez7l/TsNuPatbQwVpA4h0+At0kEpdtgPb7qvIPcZZzv19rE+gLlUN
 KIAUF26cntgnzTs2dLsCr33lzqsBF1BkXuJ8ZQz1k+vYSjn91E4LFqq51JhLUwjEFneY
 ajocrCLypUphOyGzagroah/ARN7VVfzRgUrI9g5f632sApPcJTME+ak3s1cdNaqGeLj1
 DmKgMmn7niK5njhqxVD9hQbCJasoTohCas4Z3RmDiMyw3SCeOuvi+N0i9x23jf5Ertq5
 zveA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVDfjVd0lyS00jAZBW/5c8Y+GZ3zjHZ/J+vpRs7ngbrMHEhQucVw2+mLJ73jGLmjr5dF19ZK/ZJbBFr6lfIfvlTrj9S2LenxSlWgaRhn0yp
X-Gm-Message-State: AOJu0YxoC32FjZrA45wqedga1o3pRrfcq1absDk3AfEHaXQ7wcLgP8Qw
 EH0fbIS0kAdpBQQ+hia9+JDIOW5RnM8rtUz72TbuTDybrMh0ZhNy1zIsMSPwB+M=
X-Google-Smtp-Source: AGHT+IGR0y2bdIOAPy2UsVNakF0nkcO1SJLtEWKLN+I3EqK+AagX4rPCgY602MbsaeBciZNK5T/aag==
X-Received: by 2002:a17:906:64b:b0:a5c:e20c:8255 with SMTP id
 a640c23a62f3a-a622814aefamr315661266b.4.1716470521180; 
 Thu, 23 May 2024 06:22:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a1781d350sm1934790766b.23.2024.05.23.06.22.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 06:22:00 -0700 (PDT)
Date: Thu, 23 May 2024 15:21:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Helen Koike <helen.koike@collabora.com>
Cc: Linus Torvalds <torvalds@linuxfoundation.org>,
 Nikolai Kondrashov <spbnick@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com,
 davidgow@google.com, cocci@inria.fr, Julia.Lawall@inria.fr,
 laura.nao@collabora.com, ricardo.canuelo@collabora.com,
 kernel@collabora.com, gregkh@linuxfoundation.org
Subject: Re: [PATCH 1/3] kci-gitlab: Introducing GitLab-CI Pipeline for
 Kernel Testing
Message-ID: <Zk9C9mCj15hVWUyL@phenom.ffwll.local>
Mail-Followup-To: Helen Koike <helen.koike@collabora.com>,
 Linus Torvalds <torvalds@linuxfoundation.org>,
 Nikolai Kondrashov <spbnick@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, linuxtv-ci@linuxtv.org,
 dave.pigott@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kselftest@vger.kernel.org,
 gustavo.padovan@collabora.com, pawiecz@collabora.com,
 tales.aparecida@gmail.com, workflows@vger.kernel.org,
 kernelci@lists.linux.dev, skhan@linuxfoundation.org,
 kunit-dev@googlegroups.com, nfraprado@collabora.com,
 davidgow@google.com, cocci@inria.fr, Julia.Lawall@inria.fr,
 laura.nao@collabora.com, ricardo.canuelo@collabora.com,
 kernel@collabora.com, gregkh@linuxfoundation.org
References: <20240228225527.1052240-1-helen.koike@collabora.com>
 <20240228225527.1052240-2-helen.koike@collabora.com>
 <20240229-dancing-laughing-groundhog-d85161@houat>
 <5d7ed81b-37f9-48e9-ab7e-484b74ca886c@gmail.com>
 <CAHk-=wixVy3WYvjbt43ZSrCqPDsS76QJQSkXFbbPsAOs1MCSAQ@mail.gmail.com>
 <44ae0339-daf1-4bb9-a12d-e3d2e79b889e@gmail.com>
 <CAHk-=wiccniE=iZDC_e7T+J8iPVQbh1Wi5BaVee9COfy+ZaYKg@mail.gmail.com>
 <17341b96-5050-4528-867a-9f628434e4e6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17341b96-5050-4528-867a-9f628434e4e6@collabora.com>
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

On Mon, Mar 04, 2024 at 06:45:33PM -0300, Helen Koike wrote:
> Hi Linus,
> 
> Thank you for your reply and valuable inputs.
> 
> On 01/03/2024 17:10, Linus Torvalds wrote:
> > On Fri, 1 Mar 2024 at 02:27, Nikolai Kondrashov <spbnick@gmail.com> wrote:
> > > 
> > > I agree, it's hard to imagine even a simple majority agreeing on how GitLab CI
> > > should be done. Still, we would like to help people, who are interested in
> > > this kind of thing, to set it up. How about we reframe this contribution as a
> > > sort of template, or a reference for people to start their setup with,
> > > assuming that most maintainers would want to tweak it? We would also be glad
> > > to stand by for questions and help, as people try to use it.
> > 
> > Ack. I think seeing it as a library for various gitlab CI models would
> > be a lot more palatable. Particularly if you can then show that yes,
> > it is also relevant to our currently existing drm case.
> 
> Having it as a library would certainly make my work as the DRM-CI maintainer
> easier and  also simplify the process whenever we consider integrating tests
> into other subsystems.

Kinda ignored this thread, just wanted to throw my +1 in here.

To spin it positively, the kernel CI space is wide open (more negatively,
it's a fractured mess). And I think there's just no way to force top-down
unification. Imo the only way is to land subsystem CI support in upstream,
figure out what exactly that should look like (I sketched a lot of open
questions in the DRM CI PR around what should and should not be in
upstream).

Then, once we have a few of those, extract common scripts and tools into
tools/ci/ or scripts/ci or whatever.

And only then, best case years down the road, dare to have some common
top-level CI, once it's clear what the actual common pieces and test
stages even are.

> > So I'm not objecting to having (for example) some kind of CI helper
> > templates - I think a logical place would be in tools/ci/ which is
> > kind of alongside our tools/testing subdirectory.
> 
> Works for me.
> 
> We  can skip having a default .gitlab-ci.yml in the root directory and
> instead include clear instructions in our documentation for using these
> templates.

I'd go a few steps more back and start with trying to get more subsystem
CI into upstream. And then once that dust has settled, figure out what the
common pieces actually are. Because I'm pretty sure that what we have for
drm ci or kernelci right now won't be it, but likely just a local optimum.

Cheers, Sima

> 
> Thanks,
> Helen Koike
> 
> > 
> > (And then perhaps have a 'gitlab' directory under that. I'm not sure
> > whether - and how much - commonality there might be between the
> > different CI models of different hosts).
> > 
> > Just to clarify: when I say "a logical place", I very much want to
> > emphasize the "a" - maybe there are better places, and I'm not saying
> > that is the only possible place. But it sounds more logical to me than
> > some.
> > 
> >              Linus

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
