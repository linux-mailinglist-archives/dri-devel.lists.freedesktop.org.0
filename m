Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDB8843E63
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jan 2024 12:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F42113526;
	Wed, 31 Jan 2024 11:30:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3C97112A4A
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 11:30:03 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a352d9c0f9dso148925966b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jan 2024 03:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1706700542; x=1707305342; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=UqhHWwD0G4uA9KZYS4hbxluQXzkwr0OlBUL6FsGhiWg=;
 b=j2QU3F8OOQE4XCrBCB4ISzYReUQ9o1tkjC4dqRawanGdeujOqhALUGU57FD70SN4V2
 yqUjcxO+IaHa+cmRfOF11RWem1JqpDHq/1OsRLNcQd0YOjDO208x6C/KuMk+jxnX+Vjb
 AWy4dtcXtN0P/Ar7lX73C94nV0HaTyM5hB0C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706700542; x=1707305342;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UqhHWwD0G4uA9KZYS4hbxluQXzkwr0OlBUL6FsGhiWg=;
 b=Q1Ogcv/SfZkmwJ+5fjNpKzR2NCUzCra2Tpmd7oZLC1frIRMhhJpflfXUZ3j5CQhIwj
 IuJnfcO6B8X9c2BOI6BIIYqhvowP8mWb2rDVkVvCvt1k2ncLqlKXKfmpMaEgRojwv5Ff
 iqt8v825EY3eLKdE5b9wDSkqv4wajulll85oKdP8tlcqsh1yFyjLGxk7LiXH0mB4JvpE
 QJgqskF6/G16nUReNPNkrrnWek8LVaHn6TDJhoeKfL3IG9T0l74a1PJk0f6YWpKMsXXr
 f94b/MpDsmPMj3Bv92tpEaAEKPMrrQZ0rQJa9KT1MJ38W+LUWrys6kYvXodeG5O01BKb
 jaUg==
X-Gm-Message-State: AOJu0YxNg/ghZkcwulvXsg7dY3GEN7a0sRFtBUEozQBpLtDf3JSvoYls
 jSoVk4WnahDPYry9hkXzdJC41mS0BrrT6mIxkUJUMKsvzi0ZYfH7qCdMM5gBnmo=
X-Google-Smtp-Source: AGHT+IEF59TprIa6Ram1HS7MhbdsWEwmnMxvdors8usQrdNdBa4tbbMATy8t9TnYJpReIzZrvsqyxg==
X-Received: by 2002:a17:906:4f0e:b0:a31:410a:18e4 with SMTP id
 t14-20020a1709064f0e00b00a31410a18e4mr886491eju.4.1706700541914; 
 Wed, 31 Jan 2024 03:29:01 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCVQg6OreM8PpU4kdOWR1ROcpBxhI0KOFi8yuDak8zGiFs/4kT7V4Qx4VBX/FFBu06AKIYEyB4sPazzAizbPK7O49rHn8RS/gfXPjPGlI3SFOKCnewgu9bTfvPiRy6rb+7LNEfNKSpT6Vc+zIXkx+2GSyurNfiDgq+2Y8DUIVVbNs5hpmZUiJ7vP7IZIW6yi+ANAiZgRLbTvGIDj5lqe+H+EGj3nX0xTDTbLhK8RB/PcVIzZhollLovJA8MDvLVfWYtYkxkOHRaznsXa1zX+pye0pO6eo0Srsd/DxM7Wu48P0Uvw0P6fCWrt/e6HFJ5nCo7N+Uv2CyCjx/6EMAdAysp+TrNle4NeRcLeHJTmHpdwN51QAAwHxFA3Fy7Fa45Pw0ssb5xa8FHH2LToB1fH3So/24Og/rzhAcI8XqHSNDAE9FAfkNR5BNI1a1WHZkvjey8uCi/YS08UxRgAhWWlqZiapxLMvqhv8ktKBxnrwPPi0ODL0lQAtuR7ZJ/F//zYx27zFTZd93HtkeSz+4CBuqU38t6OkyKkvrdRihf2ZivOvEA/30EzLmdN0byBwyCYgHWWm5DuYUX+GktDiCwHpC1Lm4xji1nifQ70uncJBkhW66Fnl2jdnrNSR0GWmqNpAgljJJYHDK2SNh8TU+4IGIzAXARHIpXsBy4BcEWb32RXcjeKxR2R46J7lshdAGBdhqIEBFu+1nni32ojt5Oh1nl6hjS34D8kg9cJErcDZtFFUDQaVvxp2IhtZu6HCsJ7G4nDB4Xh4Y9nNCPrhxBek+wPmXtL2CovnAVDzoqNGxnFF7zBrh8+ZKH/mXm0lFcKxxwDnApqwzgi6HQCtEfeoW1mtH5yfXvbHUMOYioIJwMVDISp2In+OG8lWcLrQ4kC86M5MZN1HsJRbgO7AfUb/2VoqTsCgXlGygKgR3CDBZHY4uMQPgqRW/B+7FPFDz4u4bBDTF
 PCe9piEndN99AfqgZO/Yg+q1HbZ/V1e02L7iL1fV+VfhrVr2bovvCzuOfP5ry4VQ==
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a170906784600b00a30e1f233b4sm6064491ejm.128.2024.01.31.03.29.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jan 2024 03:29:01 -0800 (PST)
Date: Wed, 31 Jan 2024 12:28:59 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <Zbou-y7eNhQTMpKo@phenom.ffwll.local>
Mail-Followup-To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "michel@daenzer.net" <michel@daenzer.net>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "mikita.lipski@amd.com" <mikita.lipski@amd.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "fshao@chromium.org" <fshao@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, 
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
References: <20230216111214.3489223-1-daniel.vetter@ffwll.ch>
 <20230307145613.xvhru3fpcudlpazt@houat>
 <aac416742920953999a9ce230ac68139bf5b9790.camel@mediatek.com>
 <ZbKlsTEvGPiGtzS3@phenom.ffwll.local>
 <1349365de499bae53a8c868738c7270fc16813d5.camel@mediatek.com>
 <ZboOp7JOp5teV1Cs@phenom.ffwll.local>
 <CAA8EJpqAU=RvqJUPmPO2LCJ+6KMOT8Pi2WrkPq8YHzhyRVxHeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAA8EJpqAU=RvqJUPmPO2LCJ+6KMOT8Pi2WrkPq8YHzhyRVxHeg@mail.gmail.com>
X-Operating-System: Linux phenom 6.6.11-amd64 
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
Cc: "fshao@chromium.org" <fshao@chromium.org>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "daniel.vetter@intel.com" <daniel.vetter@intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "dmitry.osipenko@collabora.com" <dmitry.osipenko@collabora.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "michel@daenzer.net" <michel@daenzer.net>,
 "lucas.demarchi@intel.com" <lucas.demarchi@intel.com>,
 "quic_abhinavk@quicinc.com" <quic_abhinavk@quicinc.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "maxime@cerno.tech" <maxime@cerno.tech>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "mikita.lipski@amd.com" <mikita.lipski@amd.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 Jason-JH Lin =?utf-8?B?KOael+edv+elpSk=?= <Jason-JH.Lin@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "manasi.d.navare@intel.com" <manasi.d.navare@intel.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>,
 "nicholas.kazlauskas@amd.com" <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 31, 2024 at 12:26:45PM +0200, Dmitry Baryshkov wrote:
> On Wed, 31 Jan 2024 at 11:11, Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, Jan 31, 2024 at 05:17:08AM +0000, Jason-JH Lin (林睿祥) wrote:
> > > On Thu, 2024-01-25 at 19:17 +0100, Daniel Vetter wrote:
> > > >
> > > > External email : Please do not click links or open attachments until
> > > > you have verified the sender or the content.
> > > >  On Tue, Jan 23, 2024 at 06:09:05AM +0000, Jason-JH Lin (林睿祥) wrote:
> > > > > Hi Maxime, Daniel,
> > > > >
> > > > > We encountered similar issue with mediatek SoCs.
> > > > >
> > > > > We have found that in drm_atomic_helper_commit_rpm(), when
> > > > disabling
> > > > > the cursor plane, the old_state->legacy_cursor_update in
> > > > > drm_atomic_wait_for_vblank() is set to true.
> > > > > As the result, we are not actually waiting for a vlbank to wait for
> > > > our
> > > > > hardware to close the cursor plane. Subsequently, the execution
> > > > > proceeds to drm_atomic_helper_cleanup_planes() to  free the cursor
> > > > > buffer. This can lead to use-after-free issues with our hardware.
> > > > >
> > > > > Could you please apply this patch to fix our problem?
> > > > > Or are there any considerations for not applying this patch?
> > > >
> > > > Mostly it needs someone to collect a pile of acks/tested-by and then
> > > > land
> > > > it.
> > > >
> > >
> > > Got it. I would add tested-by tag for mediatek SoC.
> > >
> > > > I'd be _very_ happy if someone else can take care of that ...
> > > >
> > > > There's also the potential issue that it might slow down some of the
> > > > legacy X11 use-cases that really needed a non-blocking cursor, but I
> > > > think
> > > > all the drivers where this matters have switched over to the async
> > > > plane
> > > > update stuff meanwhile. So hopefully that's good.
> > > >
> > >
> > > I think all the drivers should have switched to async plane update.
> > >
> > > Can we add the checking condition to see if atomic_async_update/check
> > > function are implemented?
> >
> > Pretty sure not all have done that, so really it boils down to whether we
> > break a real user's use-case. Which pretty much can only be checked by
> > merging the patch (hence the requirement to get as many acks as possible
> > from display drivers) and then being willing to handle any fallout that's
> > reported as regressions for a specific driver.
> >
> > It's a pile of work, at least when it goes south, that's why I'm looking
> > for volunteers.
> 
> I can check this on all sensible msm generations, including mdp4, but
> it will be next week, after the FOSDEM.
> 
> BTW, for technical reasons one of the msm platforms still has the
> legacy cursor implementation might it be related?

Yeah, msm is one of the drivers I had to change with some hacks to avoid
really bad fallout. It should still work like before, but that's one that
definitely needs testing.
-Sima

> 
> >
> > Note that handling the fallout doesn't mean you have to fix that specific
> > driver, the only realistic option might be to reinstate the legacy cursor
> > behaviour, but as an explicit opt-in that only that specific driver
> > enables.
> >
> > So maybe for next round of that patch it might be good to have a 2nd patch
> > which implements this fallback plan in the shared atomic modeset code?
> >
> > Cheers, Sima
> 
> 
> -- 
> With best wishes
> Dmitry

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
