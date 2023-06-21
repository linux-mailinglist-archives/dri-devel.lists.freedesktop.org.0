Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8AA0738F64
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 21:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A1910E34D;
	Wed, 21 Jun 2023 19:01:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7DF310E34A
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 19:00:59 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 1AAD51F5DF;
 Wed, 21 Jun 2023 21:00:56 +0200 (CEST)
Date: Wed, 21 Jun 2023 21:00:54 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/3] drm/msm/dpu: Set DATABUS_WIDEN on command mode
 encoders
Message-ID: <3zsfsfsgegwbfg5wi53z2mwfevqlubfj4ddxwvmpzu4kgezvdj@knhggjm4gbmu>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-2-c7069f2efca1@quicinc.com>
 <c74c9e0e-d059-f0e3-4350-03089c37131a@linaro.org>
 <cce68370-3fd9-4c9a-258e-af0d5d057fda@quicinc.com>
 <n2c5qlujxhbbj2aqlgj7fetzoteood5h4hmbwt4mapi77xlvmt@bpourzaideti>
 <81a5e241-ec82-7414-8752-4ce3cb084959@linaro.org>
 <f14f2c31-38c2-0600-3a29-17e83afececf@quicinc.com>
 <26tvhvqpxtxz5tqc6jbjixadpae34k7uc7fyec2u5o2ccj4tdq@tjvguzlolc3g>
 <8dcd643f-9644-a4e7-a0d5-eefa28084a88@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8dcd643f-9644-a4e7-a0d5-eefa28084a88@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-21 19:36:37, Dmitry Baryshkov wrote:
> On 21/06/2023 18:17, Marijn Suijten wrote:
> > On 2023-06-20 14:38:34, Jessica Zhang wrote:
> > <snip>
> >>>>>>> +    if (phys_enc->hw_intf->ops.enable_widebus)
> >>>>>>> +        phys_enc->hw_intf->ops.enable_widebus(phys_enc->hw_intf);
> >>>>>>
> >>>>>> No. Please provide a single function which takes necessary
> >>>>>> configuration, including compression and wide_bus_enable.
> >>>>>>
> >>>>>
> >>>>> There are two ways to look at this. Your point is coming from the
> >>>>> perspective that its programming the same register but just a different
> >>>>> bit. But that will also make it a bit confusing.
> >>>
> >>> My point is to have a high-level function that configures the INTF for
> >>> the CMD mode. This way it can take a structure with necessary
> >>> configuration bits.
> >>
> >> Hi Dmitry,
> >>
> >> After discussing this approach with Abhinav, we still have a few
> >> questions about it:
> >>
> >> Currently, only 3 of the 32 bits for INTF_CONFIG2 are being used (the
> >> rest are reserved with no plans of being programmed in the future). Does
> >> this still justify the use of a struct to pass in the necessary
> >> configuration?
> > 
> > No.  The point Dmitry is making is **not** about this concidentally
> > using the same register, but about adding a common codepath to enable
> > compression on this hw_intf (regardless of the registers it needs to
> > touch).
> 
> Actually to setup INTF for CMD stream (which is equal to setting up 
> compression at this point).

Yup, thaty is what I suggested below ("or even more generically").

> >  Similar to how dpu_hw_intf_setup_timing_engine() programs the
> > hw_intf - including widebus! - for video-mode.
> > 
> > Or even more generically, have a struct similar to intf_timing_params
> > that says how the intf needs to be configured - without the caller
> > knowing about INTF_CONFIG2.
> > 
> > struct dpu_hw_intf_cfg is a very good example of how we can use a single
> > struct and a single callback to configure multiple registers at once
> > based on some input parameters.
> > 
> >> In addition, it seems that video mode does all its INTF_CONFIG2
> >> configuration separately in dpu_hw_intf_setup_timing_engine(). If we
> >> have a generic set_intf_config2() op, it might be good to have it as
> >> part of a larger cleanup where we have both video and command mode use
> >> the generic op. What are your thoughts on this?
> > 
> > Not in that way, but if there is a generic enable_compression() or
> > configure_compression() callback (or even more generic, similar to
> > setup_intf_cfg in dpu_hw_ctl) that would work for both video-mode and
> > command-mode, maybe that is beneficial.
> 
> I'd rather not do this. Let's just 'setup timing enging' vs 'setup CMD'. 
> For example, it might also include setting up other INTF parameters for 
> CMD mode (if anything is required later on).

Sure, sounds good.  hw_intf internally could even have a static function
that deduplicates these "setup" function if there is any.

We could rename setup_timing_engine to setup_video_mode to be more clear
to the reader?

- Marijn
