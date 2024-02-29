Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C02386C731
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 11:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864ED10E448;
	Thu, 29 Feb 2024 10:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="enPaTIoB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67ADB10E449
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 10:45:12 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-33dcc82ecc1so171119f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 02:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1709203510; x=1709808310; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIG7k4yYwKeN7C5fU4t/ffavSfw5nunyOq/We0rginA=;
 b=enPaTIoBLLPFiKdUDuGSLfgL3FStSvlNQAcyQlkvPjpwG/1iloGkWYi7Ck3Pxp/vrO
 g7H3jZqOmNXjSIU8rz9yqD2n9n+V3m8PI2kfcXngJ35j5Cq7S7Rl1bN29dO8ITbtcZll
 2qBSS7WcYonWEScc/ZyhVFrnLzY2hny3TRzuc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709203510; x=1709808310;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FIG7k4yYwKeN7C5fU4t/ffavSfw5nunyOq/We0rginA=;
 b=OJbgIDWgySr/OQO6CsI+jHdg/s0IV1OWyYUoCxwTsdLkknzRtlDcXAJGm1I41Cs9V7
 bHTI/srYy5WopKADtNtsYxsknqp1hnkY7PLhXcgJgEXoYnjJZ6G5tdLUTSSqx94qtlje
 1oUFag872PxEuXM1Zd/HLjTPfIo8fRSpBZy2LNyB6aMdiM8neB/OpDe51A1FfBSEtqdP
 UUtwnMsCMv6OmtEFCBzMPmwzhH38ZmC71bbeKf25P/mws4HKxwV1XIrFFzbu5PidsjO/
 9EG/tdE6PiHaQbP/vyGrYmO5BjeN4cg6lXW9hpnePVI1KXOGJetg4CBcPG4+0OjmINKD
 eP7A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJPPUPEX6Glvlw3NEHdZ6qfWeoxhP9ilga3ZfeVZlC2H483W1uHlmiBx9G3BdztpKkrqNHvyEbu4brCof3uorR1BIokxnAMcUiEneXnLzv
X-Gm-Message-State: AOJu0YyNw2RVo0dHUk+yYL6cx5R7F9CSm27f69Fl439wUlv2XjJFQrCF
 kAn/3z0LUKGoXxXxG6ubHt2UoQyeY/Cfl/vqwxZJ49xehMzsRUOxN9003syakk0=
X-Google-Smtp-Source: AGHT+IEddsPiJqmxeX/yYcSFQD2n9jwvO1fu5RUcQbKTB5SZn1NFPFMfALlSkq4X0Mt7ej05VQ/xpQ==
X-Received: by 2002:a05:600c:3b1e:b0:412:9a51:d5a6 with SMTP id
 m30-20020a05600c3b1e00b004129a51d5a6mr1367841wms.4.1709203510274; 
 Thu, 29 Feb 2024 02:45:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 jp21-20020a05600c559500b004126101915esm4807415wmb.4.2024.02.29.02.45.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Feb 2024 02:45:09 -0800 (PST)
Date: Thu, 29 Feb 2024 11:45:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH RFC 0/4] Support for Simulated Panels
Message-ID: <ZeBgMx-BwT-o-clA@phenom.ffwll.local>
Mail-Followup-To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maxime Ripard <mripard@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>
References: <20240116-jz-test-sim-panel-v1-0-f9511f46c9c7@quicinc.com>
 <x6wi5xnihnbpqsujjfjfw3ft6njncruta5l3xa44pds5oxmdkw@mmvv4bciy65s>
 <87cyu0qn81.fsf@intel.com>
 <e1f10583-1d5b-fdac-24bf-098a0ba06241@quicinc.com>
 <hhmbghooegclx3jbsx2neryligk3mj77lq7gns5xegags5ltoz@acdu6hssqwlw>
 <99705d73-abcf-6d41-3d50-757e706cf1fc@quicinc.com>
 <Zbi4-S49CWlUkO__@phenom.ffwll.local>
 <gs634bhdctmpxhhdjw3bddirvc6ex7fwdmy4xr4pygyibvmp5g@zfouf76tmti2>
 <6470960a-dbe8-43ca-889a-b5a7cc934569@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6470960a-dbe8-43ca-889a-b5a7cc934569@quicinc.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 28, 2024 at 01:49:34PM -0800, Jessica Zhang wrote:
> 
> 
> On 2/2/2024 2:15 AM, Maxime Ripard wrote:
> > On Tue, Jan 30, 2024 at 09:53:13AM +0100, Daniel Vetter wrote:
> > > > > > > > Wouldn't it be simpler if we had a vkms-like panel that we could either
> > > > > > > > configure from DT or from debugfs that would just be registered the
> > > > > > > > usual way and would be the only panel we register?
> > > > > > > 
> > > > > > 
> > > > > > No, we need to have validate actual hardware pipeline with the simulated
> > > > > > panel. With vkms, actual display pipeline will not be validated. With
> > > > > > incorrect display pipeline misconfigurations arising from different panel
> > > > > > combinations, this can easily be caught with any existing IGT CRC testing.
> > > > > > In addition, all performance related bugs can also be easily caught by
> > > > > > simulating high resolution displays.
> > > > > 
> > > > > That's not what I meant. What I meant was that something like a
> > > > > user-configurable, generic, panel driver would be a good idea. Just like
> > > > > vkms (with the debugfs patches) is for a full blown KMS device.
> > > > > 
> > > > 
> > > > Let me respond for both this question and the one below from you/Jani.
> > > > 
> > > > Certainly having user-configurable information is a goal here. The end-goal
> > > > is to make everything there in the existing panels such as below like I
> > > > wrote:
> > > > 
> > > > 1) Display resolution with timings (drm_display_mode)
> > > > 2) Compression/non-compression
> > > > 3) Command mode/Video mode
> > > > 4) MIPI mode flags
> > > > 5) DCS commands for panel enable/disable and other panel sequences
> > > > 6) Power-up/Power-down sequence for the panel
> > > > 
> > > > But, we also have to see what all is feasible today from the DRM fwk
> > > > standpoint. There are some limitations about what is boot-time configurable
> > > > using bootparams and what is runtime configurable (across a modeset) using
> > > > debugfs.
> > > > 
> > > > 1) Today, everything part of struct mipi_dsi_device needs to be available at
> > > > boot time from what I can see as we need that while calling
> > > > mipi_dsi_attach(). So for that we went with boot-params.
> > > > 
> > > > 2) For the list of modes, we can move this to a debugfs like
> > > > "populate_modes" which the client using a sim panel can call before picking
> > > > a mode and triggering a commit.
> > > > 
> > > > But we need to have some default mode and configuration.
> > > 
> > > Uh, at the risk of sounding a bit like I'm just chasing the latest
> > > buzzwords, but this sounds like something that's screaming for ebpf.
> > 
> > I make a half-joke to Jani on IRC about it, but I was also being
> > half-serious. If the goal we want to have is to fully emulate any panel
> > variation, ebpf really looks like the best and most flexible way
> > forward.
> 
> Hi Maxime and Daniel,
> 
> For our current sim panel requirements, we can go with implementing the
> configfs first then add ebpf if requirements get more complex.

Agreed, this is definitely the pragmatic approach to get this going.
-Sima
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
