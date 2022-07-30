Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D43585C39
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jul 2022 23:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799C112B03E;
	Sat, 30 Jul 2022 21:10:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68DD113876;
 Sat, 30 Jul 2022 21:09:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BC85260F68;
 Sat, 30 Jul 2022 21:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20A7FC433C1;
 Sat, 30 Jul 2022 21:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659215395;
 bh=ePqpEWYI6NuRsWft+lvrNOptjvzOQrmx491q5KinAVw=;
 h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
 b=ndyN8CSrdlsjDcPhVIsaxHZ4YEF3xB2rzS/C+brd9fsD3iszC0Rvn4FI0njZ/iqqc
 gNxXzYaGv21bea0XtXuTmzhCRxFEiuyiosjaEMtBVYy5lQSzwoK7MoDeTnIUdndmsz
 Ijfl1ATZDneRrXnu6pzsncTcukFhhNxxX79K2Io6XpLzolvDPbEJrY1cxXkXd198Ja
 6yVI0F4pKdc3QBGxW4deitGpV8te+bZKg+EnKFHhX8RgPGsLF4P4anpu/v0NRRZBHN
 ZZ8Ylqu2Tj6jjCxok+hL5C5grj9gDg4Y48QeeJLCQjkpz4gf+f0Ft+7tyYXkNwrLHv
 rEitkSY0gu9Mg==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
 id BB4B05C034F; Sat, 30 Jul 2022 14:09:54 -0700 (PDT)
Date: Sat, 30 Jul 2022 14:09:54 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: Stack-frame warnings in display_mode_vba_32.c
Message-ID: <20220730210954.GU2860372@paulmck-ThinkPad-P17-Gen-1>
References: <20220730022532.GA1234397@paulmck-ThinkPad-P17-Gen-1>
 <85a49b72-8bb7-b3b3-8a69-2c90cda8079d@igalia.com>
 <20220730051238.GR2860372@paulmck-ThinkPad-P17-Gen-1>
 <80410e6e-838b-fa3d-1f87-710eb3c751c5@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <80410e6e-838b-fa3d-1f87-710eb3c751c5@roeck-us.net>
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
Reply-To: paulmck@kernel.org
Cc: sfr@canb.auug.org.au,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>, arnd@arndb.de,
 sunpeng.li@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 30, 2022 at 02:06:10AM -0700, Guenter Roeck wrote:
> On 7/29/22 22:12, Paul E. McKenney wrote:
> > On Fri, Jul 29, 2022 at 11:41:55PM -0300, André Almeida wrote:
> > > Hi Paul,
> > > 
> > > Às 23:25 de 29/07/22, Paul E. McKenney escreveu:
> > > > Hello!
> > > > 
> > > > I am seeing the following in allmodconfig builds of recent -next on x86:
> > > > 
> > > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: In function ‘DISPCLKDPPCLKDCFCLKDeepSleepPrefetchParametersWatermarksAndPerformanceCalculation’:
> > > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:1659:1: error: the frame size of 2144 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
> > > >   1659 | }
> > > >        | ^
> > > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c: In function ‘dml32_ModeSupportAndSystemConfigurationFull’:
> > > > drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c:3799:1: error: the frame size of 2480 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
> > > >   3799 | } // ModeSupportAndSystemConfigurationFull
> > > >        | ^
> > > 
> > > I think they are fixed at amd-staging-drm-next:
> > > 
> > > git log --oneline amd/amd-staging-drm-next
> > > drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> > > 953daa61981b drm/amd/display: Reduce stack size in the mode support function
> > > 361e705e712d drm/amd/display: reduce stack for
> > > dml32_CalculatePrefetchSchedule
> > > f2dbf5a4dd1e drm/amd/display: reduce stack for
> > > dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport
> > > a0a68cda2ef8 drm/amd/display: reduce stack for dml32_CalculateVMRowAndSwath
> > > ca6730ca0f01 drm/amd/display: reduce stack for
> > > dml32_CalculateSwathAndDETConfiguration
> > > 593eef8c1a5e drm/amd/display: reduce stack size in dcn32 dml (v2)
> > > 
> > > https://gitlab.freedesktop.org/agd5f/linux/-/commits/amd-staging-drm-next/drivers/gpu/drm/amd/display/dc/dml/dcn32/display_mode_vba_32.c
> > 
> > Very good, thank you!  I will test again on the next -next.
> > 
> 
> Did you try next-20220728 ?
> 
> groeck@server:~/src/linux-next$ git describe
> next-20220728
> groeck@server:~/src/linux-next$ git log --oneline drivers/gpu/drm/amd/amdgpu/../display/dc/dml/dcn32/display_mode_vba_32.c
> 1b54a0121dba drm/amd/display: Reduce stack size in the mode support function
> 86e4863e67a9 drm/amd/display: reduce stack for dml32_CalculatePrefetchSchedule
> 3c3abac60117 drm/amd/display: reduce stack for dml32_CalculateWatermarksMALLUseAndDRAMSpeedChangeSupport
> c3b3f9ba25e6 drm/amd/display: reduce stack for dml32_CalculateVMRowAndSwath
> bac4b41d917a drm/amd/display: reduce stack for dml32_CalculateSwathAndDETConfiguration
> 7acc487ab57e drm/amd/display: reduce stack size in dcn32 dml (v2)

Indeed, next-20220728 does avoid the problem, thank you!

							Thanx, Paul
