Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8840897EB7A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 14:26:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8425E10E254;
	Mon, 23 Sep 2024 12:26:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tzL1CzvK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3BC10E254
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 12:26:03 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-53659c8d688so3218506e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2024 05:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727094362; x=1727699162; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=6ytxbTFOP+larFHLdQz4J17smflQuPFB0iTe9dEbLuU=;
 b=tzL1CzvKaEVkorAqWDPqIMDKp9SmVMvN34jWQpp5hSh99mbWoAZYHhWAW0bGzDBQWA
 zt87UNrDfWRkgfhaSF2zTRESG6Z/f73dB1ySp7FXDa/J4AZmchfZPdsLZ7eTAwhczg7M
 S4fpMe0+nCyDubDzYbJisTfZgJN4a5t+iHkR8M9PelBMdux7UCrE8r+cVROQ7dTCdaDL
 8Faz+jJyNBRWN0frDl/5ju9dAgT+LMnxD1mR0c6aoxwPZPn0kwbcFCldyARVmVyxJFHJ
 gXEv0xEiAEcdmFBAJ/fqeV3YA9NgE5O0Pp575AxRBLTPdghqPpFv/j1Ql/8TuNBIt4Eg
 xiyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727094362; x=1727699162;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ytxbTFOP+larFHLdQz4J17smflQuPFB0iTe9dEbLuU=;
 b=JQc09xUZbpiWyfjauwCiRDLOaY5G0EzkC8wlb0Fb5NIPORDLJ1jRR49f/4MrbmtUEm
 5COn46pFBAxGG2w/rmtL9RW/KVCvHwjZciwGAywFaPRwTjdjhACbRn7tWTuGvq4wIvZC
 7ORiA5xZBMr8lUAgomgy7+LBTrlgNYC17V3pHl4Q1Dob5MIYuUBsQ9vmLDivvAvo9Smg
 OBd1tcFHK7xVVT8+N5/9YICGwH0cg8emLUMvRReNDfYl7UI0HzCd1wGnwm57OMa5abeu
 3dcLKQC+JodZRT3c2ZYk+TeIlFzM5yRFNNEnlAhKDFb55RYC5aCsn/Y9Hz0RCIX7ZfB2
 xEQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz4wyY2U3e/Dls5RyKbOypAzVE0wp20Bkhc8k5b0XMxP6j8h/O17dnrFcOq6W2NEQIGA7s+Nni/eY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwiLBkLfKnRpftvxjUwmTMITjH4F+vKDYXdqYkgOuA0CGQ5bZ/k
 vUJwFrjvbpZSUVW83Qovu2F8Czm4cqsi+la3KjV+HlJlvj9o3E9FhpVQb74pQ6E=
X-Google-Smtp-Source: AGHT+IEfIJ/SqWqF0V+e+7n1lIL0PUL5n0sGTusVZURdascFfwrvR2/DPQWFBel8zfu6DFRe4COtwQ==
X-Received: by 2002:a05:6512:2807:b0:52e:8161:4ce6 with SMTP id
 2adb3069b0e04-536abb649afmr3737212e87.25.1727094361780; 
 Mon, 23 Sep 2024 05:26:01 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-536870466afsm3249808e87.8.2024.09.23.05.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Sep 2024 05:26:00 -0700 (PDT)
Date: Mon, 23 Sep 2024 15:25:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Aradhya Bhatia <a-bhatia1@ti.com>, 
 dri-devel@lists.freedesktop.org, Marek Vasut <marex@denx.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358767: Fix
 DRM_BRIDGE_ATTACH_NO_CONNECTOR case
Message-ID: <lxcxo3y7z6emrpvisibj6ccr6qx5nozchuyy5aizfvkvvlp44m@jecj6k5y6z2t>
References: <f6af46e0-aadb-450a-9349-eec1337ea870@ti.com>
 <b221c978-2ce0-4d31-8146-ab43a9f86a1f@ti.com>
 <st6vgd2k6dxo4vd3pmqmqlc5haofhbym2jeb2eeh2pa2n6zcca@tradpzxrzexl>
 <2469374.jE0xQCEvom@steina-w>
 <CAA8EJpraKjBZRLL5U+BVQRf98_EBa5b=nSPxZATU+yvvq9Kfmw@mail.gmail.com>
 <4133a684-61a1-4d18-bb25-212d5fdc5620@siemens.com>
 <5bb0459a-ec3a-487f-a9b5-28ee643a1215@ideasonboard.com>
 <9b0e99f5-554b-428f-856c-cc32f4520c73@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9b0e99f5-554b-428f-856c-cc32f4520c73@siemens.com>
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

On Mon, Sep 23, 2024 at 09:42:27AM GMT, Jan Kiszka wrote:
> On 28.08.24 15:32, Tomi Valkeinen wrote:
> > On 26/08/2024 22:35, Jan Kiszka wrote:
> >> On 24.06.24 12:17, Dmitry Baryshkov wrote:
> >>> On Mon, 24 Jun 2024 at 13:07, Alexander Stein
> >>> <alexander.stein@ew.tq-group.com> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> Am Montag, 24. Juni 2024, 11:49:04 CEST schrieb Dmitry Baryshkov:
> >>>>> On Mon, Jun 24, 2024 at 03:07:10PM GMT, Aradhya Bhatia wrote:
> >>>>>>
> >>>>>>
> >>>>>> On 22/06/24 17:49, Dmitry Baryshkov wrote:
> >>>>>>> On Sat, Jun 22, 2024 at 05:16:58PM GMT, Aradhya Bhatia wrote:
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> On 17-Jun-24 13:41, Dmitry Baryshkov wrote:
> >>>>>>>>> On Mon, Jun 17, 2024 at 07:40:32AM GMT, Jan Kiszka wrote:
> >>>>>>>>>> On 16.02.24 15:57, Marek Vasut wrote:
> >>>>>>>>>>> On 2/16/24 10:10, Tomi Valkeinen wrote:
> >>>>>>>>>>>> Ok. Does anyone have a worry that these patches make the
> >>>>>>>>>>>> situation
> >>>>>>>>>>>> worse for the DSI case than it was before? Afaics, if the
> >>>>>>>>>>>> DSI lanes
> >>>>>>>>>>>> are not set up early enough by the DSI host, the driver
> >>>>>>>>>>>> would break
> >>>>>>>>>>>> with and without these patches.
> >>>>>>>>>>>>
> >>>>>>>>>>>> These do fix the driver for DRM_BRIDGE_ATTACH_NO_CONNECTOR
> >>>>>>>>>>>> and DPI, so
> >>>>>>>>>>>> I'd like to merge these unless these cause a regression with
> >>>>>>>>>>>> the DSI
> >>>>>>>>>>>> case.
> >>>>>>>>>>>
> >>>>>>>>>>> 1/2 looks good to me, go ahead and apply .
> >>>>>>>>
> >>>>>>>> Isn't there any way for the second patch to move forward as well
> >>>>>>>> though?
> >>>>>>>> The bridge device (under DPI to (e)DP mode) cannot really work
> >>>>>>>> without
> >>>>>>>> it, and the patches have been pending idle for a long time. =)
> >>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>> My local patches still apply on top of 6.10-rc4, so I don't
> >>>>>>>>>> think this
> >>>>>>>>>> ever happened. What's still holding up this long-pending fix
> >>>>>>>>>> (at least
> >>>>>>>>>> for our devices)?
> >>>>>>>>>
> >>>>>>>>> Neither of the patches contains Fixes tags. If the first patch
> >>>>>>>>> fixes an
> >>>>>>>>> issue in previous kernels, please consider following the stable
> >>>>>>>>> process.
> >>>>>>>>>
> >>>>>>>>> If we are unsure about the second patch, please send the first
> >>>>>>>>> patch
> >>>>>>>>> separately, adding proper tags.
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Thanks Dmitry! I can send the patches again with the required fixes
> >>>>>>>> tags (or just patch-1 if we cannot do anything about patch-2).
> >>>>>>>
> >>>>>>> The problem with the second patch is that it get mixed reviews. I
> >>>>>>> can
> >>>>>>> ack the first patch, but for the second one I'd need a
> >>>>>>> confirmation from
> >>>>>>> somebody else. I'll go on and apply the first patch later today.
> >>>>>>>
> >>>>>>
> >>>>>> Thanks Dmitry!
> >>>>>>
> >>>>>> However, would it be okay if I instead add another patch that makes 2
> >>>>>> versions of the "tc_edp_bridge_funcs", say
> >>>>>> "tc_dpi_edp_bridge_funcs" and
> >>>>>> "tc_dsi_edp_bridge_funcs", that have all the same function hooks
> >>>>>> except
> >>>>>> for the .edid_read()?
> >>>>>>
> >>>>>> The dsi edid_read() will remain the same, and Tomi's patch - patch
> >>>>>> 2/2 -
> >>>>>> will only fix the dpi version of the edid_read()?
> >>>>>>
> >>>>>> The bridge already has the capability to distinguish a DSI input
> >>>>>> from a
> >>>>>> DPI input. This can be leveraged to decide which set of functions
> >>>>>> need
> >>>>>> to be used without any major changes.
> >>>>>
> >>>>> I'd prefer if somebody with the DSI setup can ack / test the second
> >>>>> patch.
> >>>>>
> >>>>>
> >>>>
> >>>> Now that my DSI-DP setup works apparently without issue I could test
> >>>> patch 2.
> >>>> Since my setup does not use DRM_BRIDGE_ATTACH_NO_CONNECTOR (running on
> >>>> drivers/gpu/drm/mxsfb/lcdif_drv.c), I can only say
> >>>> there is no regression.
> >>>
> >>> Let me send a (non-tested) patch, switching to drm_bridge_connector,
> >>> then you can probably test both of them
> >>>
> >>
> >> I suppose [1] was that follow-up, just not leading to success, right?
> >>
> >> Now, what's next? I'd love to see the regression we have for the IOT2050
> >> devices finally fixed, even if it now only requires a short downstream
> >> patch.
> >>
> >> Jan
> >>
> >> [1]
> >> https://lore.kernel.org/dri-devel/20240624-mxc-lcdif-bridge-attach-v1-1-37e8c5d5d934@linaro.org/
> > 
> > I have to say I don't remember the details for this anymore, but half a
> > year ago I said:
> > 
> >> Afaics, if the DSI lanes are not set up early enough by the DSI host,
> >> the driver would break with and without these patches.
> > 
> > I'm not sure if that is correct or not. But if it is, then, afaiu, this
> > (the second patch):
> > 
> > - Fixes the issue for the DPI-DP use case
> > 
> > - Doesn't cause issues for the DSI-DP use case without
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR (as per Alexander's test)
> > 
> > - Shouldn't cause (new) issues for the DSI-DP use case with
> > DRM_BRIDGE_ATTACH_NO_CONNECTOR (as per my code review and guessing...)
> > 
> > The third point is somewhat concerning, of course, but do we have any
> > setup with DSI-DP and DRM_BRIDGE_ATTACH_NO_CONNECTOR that works now? If
> > not, maybe we can just ignore the possible issues, as this fixes
> > problems on a setup we do have.
> > 
> 
> As Dmitry asked me during Plumbers to revalidate if our setup still
> needs patch 2, I just did that over 6.11.0-next-20240923 (where patch 1
> is now included). No surprise, it is still needed for our iot2050 device
> series, otherwise the display remains black.

Granted that nobody with the DRM_BRIDGE_ATTACH_NO_CONNECTOR + DSI-DP
spoke in the last several months, I think we'd better merge the patch as
it is now. If noone objects (last call), I'll do that in one or two
days.

-- 
With best wishes
Dmitry
