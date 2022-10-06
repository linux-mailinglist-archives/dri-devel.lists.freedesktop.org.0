Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 737745F6CD3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Oct 2022 19:23:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF03610E84B;
	Thu,  6 Oct 2022 17:23:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34E5910E84B;
 Thu,  6 Oct 2022 17:23:41 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id u24so2271753plq.12;
 Thu, 06 Oct 2022 10:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UAw0bo7BpTjbC8TYsIXNTxWUDQl2qr0AwdNXiKiDC5I=;
 b=Vi5knA1otkqB5+jtpnDMPTqLoMRutD6lVJ8HpHSBZv0XiHl/hWWWrS5HE3UG+eRg4U
 trridq884uNFOrwcf7QHSavxXsVnNGAE4lFccLyS2HAp/c/Q+X7WfNe14oxf8V/igNRQ
 1NrgGnXJfSXOZEVSsD4FvFJTtmYfWzZ1SkjgpcouOyFjvbsFgZZAoL4cAbgAZAdCOiQS
 dSIkeOkMwUqcrYZgVyZZ9PyhhA/bDTAs2eBDmrpKcEqCkwKj4lG9NOx+SDRb5sOOgRZH
 lQIRQEJa73XHrWGVX+wakhbMTIY6suLIpzqSdsv1wMU6vrqK8i3LMkc8AVrZAfFDLuhj
 R1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:sender
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UAw0bo7BpTjbC8TYsIXNTxWUDQl2qr0AwdNXiKiDC5I=;
 b=gf8AMPA0qtxpoSXhb/dO9QMKvpnP8IL2GYxRRaXRQYwrsbQpgO46f5jt6Vi5sXxVW6
 bo5gJKVcsr2RoMqSA+QaHv9nsCshP4wKHnn6rwSpBMm4gqvu+sMFgus23jKIOCEITjey
 ASZPOr9zF+kGzMRmgxraeGrIRZ4E1kAoRHMgl7XMHsXl3H4nQ8iTDu5em2JiQgCQSgl6
 x46J7BGFe8diyCAQN9jf+DY1m5GNq9mH14N4IGc+ynjfIbny8IGIm3gmgTiVjfVBT0OF
 yGm17dXwO9ZVdK8z3S5cRsDK+17W1HAh37Ph61dTEH/+CUtyNfQBPXZt0ihEJjc4dbCt
 xcjA==
X-Gm-Message-State: ACrzQf3v4P19JkH20hy0igNd5zkPuJsmNACDiCc+ijS2oBsAoTR6QNdw
 N13sl/eZMtWdx4Kw/VForXE=
X-Google-Smtp-Source: AMsMyM76SSe/RbAiHrLfTgpz8b467HPmPADlaDsRY97uhvhSLw0E9/3l2Zvsfj3NUUgzLaoQhZummg==
X-Received: by 2002:a17:90b:1805:b0:20a:cd8e:abd with SMTP id
 lw5-20020a17090b180500b0020acd8e0abdmr767315pjb.94.1665077020618; 
 Thu, 06 Oct 2022 10:23:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 y62-20020a17090a53c400b0020aaa678098sm3098894pjh.49.2022.10.06.10.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 10:23:39 -0700 (PDT)
Date: Thu, 6 Oct 2022 10:23:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
Subject: Re: [PATCH] drm/amd/display: fix array-bounds error in
 dc_stream_remove_writeback()
Message-ID: <20221006172337.GA753466@roeck-us.net>
References: <20220927191200.216488-1-hamza.mahfooz@amd.com>
 <20221006064615.GA2817657@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221006064615.GA2817657@roeck-us.net>
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
Cc: Stylon Wang <stylon.wang@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Leo Li <sunpeng.li@amd.com>,
 Paul Hsieh <paul.hsieh@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 Hersen Wu <hersenwu@amd.com>, regressions@lists.linux.dev,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Alex Hung <alex.hung@amd.com>, "Lee, Alvin" <Alvin.Lee2@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "Leo \(Hanghong\) Ma" <hanghong.ma@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Pavle Kotarac <Pavle.Kotarac@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 05, 2022 at 11:46:15PM -0700, Guenter Roeck wrote:
> On Tue, Sep 27, 2022 at 03:12:00PM -0400, Hamza Mahfooz wrote:
> > Address the following error:
> > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function ‘dc_stream_remove_writeback’:
> > drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:55: error: array subscript [0, 0] is outside array bounds of ‘struct dc_writeback_info[1]’ [-Werror=array-bounds]
> >   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
> >       |                                 ~~~~~~~~~~~~~~~~~~~~~~^~~
> > In file included from ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc.h:1269,
> >                  from ./drivers/gpu/drm/amd/amdgpu/../display/dc/inc/core_types.h:29,
> >                  from ./drivers/gpu/drm/amd/amdgpu/../display/dc/basics/dc_common.h:29,
> >                  from drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:27:
> > ./drivers/gpu/drm/amd/amdgpu/../display/dc/dc_stream.h:241:34: note: while referencing ‘writeback_info’
> >   241 |         struct dc_writeback_info writeback_info[MAX_DWB_PIPES];
> >       |
> > 
> > Currently, we aren't checking to see if j remains within
> > writeback_info[]'s bounds. So, add a check to make sure that we aren't
> > overflowing the buffer.
> > 
> > Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>
> 
> With gcc 11.3, this patch doesn't fix a problem, it introduces one.
> 
> Building csky:allmodconfig ... failed
> --------------
> Error log:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: array subscript 1 is above array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
>   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
> 
> Building mips:allmodconfig ... failed
> --------------
> Error log:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: array subscript [0, 0] is outside array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
>   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
> 
> Building arm:allmodconfig ... failed
> --------------
> Error log:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c: In function 'dc_stream_remove_writeback':
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc_stream.c:527:83: error: array subscript [0, 0] is outside array bounds of 'struct dc_writeback_info[1]' [-Werror=array-bounds]
>   527 |                                 stream->writeback_info[j] = stream->writeback_info[i];
> 

#regzbot introduced: 5d8c3e836fc2

Complete list of build failures in my test system due to this patch,
observed when building with gcc 11.3:

Build results:
	total: 149 pass: 131 fail: 18
Failed builds:
	alpha:allmodconfig
	arm:allmodconfig
	arm64:allmodconfig
	csky:allmodconfig
	i386:allyesconfig
	i386:allmodconfig
	mips:allmodconfig
	openrisc:allmodconfig
	parisc:allmodconfig
	powerpc:allmodconfig
	powerpc:ppc32_allmodconfig
	riscv32:allmodconfig
	riscv:allmodconfig
	s390:allmodconfig
	sparc64:allmodconfig
	x86_64:allyesconfig
	x86_64:allmodconfig
	xtensa:allmodconfig

Guenter
