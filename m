Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 632D35A1636
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 17:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1507010E2CD;
	Thu, 25 Aug 2022 15:59:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E76D10E062;
 Thu, 25 Aug 2022 15:58:55 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 o15-20020a9d718f000000b00638c1348012so14226938otj.2; 
 Thu, 25 Aug 2022 08:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=j+VXQR5pjPp1qqY+mCv39sQii/lw0V0SoJNg1H+SGfM=;
 b=eWFooHpe7iAYZmgL7/qWvc3KXLQmoiNDPoqUHkukC19j0wOKbMKmemC1mTNeKVXUso
 ojxe6R/tAxrGpuTv2oVQGI8T8jcsPUTWUwZbj4lcH4lfph/FD5riUcepD6gfaCZtN9JM
 +ofJfbxfxa9de+xdocWonrlW6B9Lqvbt7x4NwkTPIx/Hfb+j4uIrlSJc71VRxgJ5mYm8
 FDzIeN7sfeAB4zugNatkQelVC7etlJlwrQLNU9G5esvOtepXQZDNJuP+Vj+JFhH73JML
 FxjChEAlOgpw9PBR8eK3M6Rfa2LpPpDhD9Hv4F+kL0gz5HRE+pQtp4bB+kP8VJAhcWUq
 2NiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=j+VXQR5pjPp1qqY+mCv39sQii/lw0V0SoJNg1H+SGfM=;
 b=fySiqK4FUCC8q/g/h7cMiQIvZ82u3V1RiCPjXNvnHuQogEfktxvywLERe/XZtai+JR
 OzS5KCTo58npPU5eKK6Psuz33Qr742a2tYvUP3lzgOJ1yGgpQ8gfK+DD1e8RB4ExoPM5
 JOrpFIpJlUeiNQBf/+OCIhmKWJKPOhpOCV0UqkFvH5LKfrl+qM1Rh/YZC4nogXY20VXL
 G6REDs8IcHFjjjHNkMikOScVNp04L94ZukByF933wM3tUYO19Jt+URftTK07/yOizQGS
 HK5yWTIZvh4WmdXCUjh7gswnMZ0Sj5YSCyWTlMALZ3MEMTw7i1bgGxD0sixf79zL/lY6
 9RUA==
X-Gm-Message-State: ACgBeo0l9xi+t3WDZ9eL6i+N07Dq/5vGDBBTAc5ieriOI8CATVACrExe
 qSFrJgx5o0tDn+TOzaOI65LT11vOeLaMfETIa8s=
X-Google-Smtp-Source: AA6agR5gQk9VJ4uU/OnL5wnN7qnr9Nq4p4F+5UpRJRWTSJCq+qbC+iFjKzMZbsJ0AxbXpriG6R0vjPjd5JF445MBg64=
X-Received: by 2002:a9d:6ad7:0:b0:636:f76b:638a with SMTP id
 m23-20020a9d6ad7000000b00636f76b638amr1649240otq.233.1661443134560; Thu, 25
 Aug 2022 08:58:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220823065001.16872-1-bernard@vivo.com>
In-Reply-To: <20220823065001.16872-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Aug 2022 11:58:43 -0400
Message-ID: <CADnq5_NsRSFb18pE1m-eUtPW_Y2z0arm0U5wzaBh=VUr978ZJw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: fix potential memory leak
To: Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: zhaojunkui2008@126.com, Eric Yang <Eric.Yang2@amd.com>,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Melissa Wen <mwen@igalia.com>, David Airlie <airlied@linux.ie>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Michael Strauss <michael.strauss@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Aug 23, 2022 at 3:29 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> This patch fix potential memory leak (clk_src) when function run
> into last return NULL.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
> index 85f32206a766..76f263846c6b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
> @@ -1715,6 +1715,7 @@ static struct clock_source *dcn30_clock_source_create(
>         }
>
>         BREAK_TO_DEBUGGER();
> +       free(clk_src);
>         return NULL;
>  }
>
> --
> 2.33.1
>
