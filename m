Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8845A1639
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 17:59:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E328210E075;
	Thu, 25 Aug 2022 15:59:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15BA10E075;
 Thu, 25 Aug 2022 15:59:31 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id r10so17966472oie.1;
 Thu, 25 Aug 2022 08:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=4W8sbga13vF4WDksQp6y3D5fZvihCL3tYDFOfdvfLZc=;
 b=SJgqQ5bCbirbRTCLVk61AB1UqyE0/TeFroOFgSCwTQmSkIMyKRH7peBwGMcwW4uaTm
 Z5zzIy5lmODpKJozwalKwef4CCI/FtB8oP+RS/12+HMob0CeVlyVaUw7UCI1jk1Hn8dO
 cOkOw+6Yq2DjkvK/QFBl6vJ8P/dg+8gnO7JA4uqWniQ6VHKqRDsGYByf2/iDLI1HHzW0
 RztFyvZriJkNtpCKQd1F5NSkgKKKW+0DrhC8xbarnw9jZM61/ixSKUlzT/FKbQnxBdLb
 J3ciH8q3TvBObx33TcU+jj82pNd2zfu20r8OyUZr5P1gGTP/r0Frgg5hlwfKXsvOmrZ2
 Pt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=4W8sbga13vF4WDksQp6y3D5fZvihCL3tYDFOfdvfLZc=;
 b=4FWKG29mDWowBBoTxzrHtWRuepzegmjbvDJGuQddU0yA0t+W9BncSQIWTvinr8uvFA
 uYrHKo+Q9KjdkQLRf63rpEfH/FRPUECOu9FBtykt8fpZadZjFCCgzMXhfDfX1xmuZ1w6
 UQ/IpdNQarSv/ZZoWlsiIx7VaE3YYolennijqeM7Ag5/eZYqRdC4Y/DKzHqeQPX4Gb5N
 L6A9OOshz/zlhA+O3S0DLlH+qsokfW5yd/Jd0LrSSZJKXcaoUgFk0zdRvSlf2bDDMG92
 d+N8X9ADIEhyc2UvaVGTmQKflvKnQf357x/tELn9K4xpKx/X7FdZbnmdni4539CalcLs
 0dgw==
X-Gm-Message-State: ACgBeo03Bc3Z7+/bxSWZ9UgIHelFRKJvwyUZgagMbI3Ym2WP4ap7C+hl
 6vLU6moRGUg0o9/6V1xsjBf5hy7TthWTni8icE0=
X-Google-Smtp-Source: AA6agR5mCsJkJx+TJF4q8EJOBBcvvHuVfq9LpQ3+egvzyXQ+FPo4kGWaPWMkrrj7AesPgq3CvJGrQwVH0EAcyTELYnU=
X-Received: by 2002:a05:6808:2187:b0:344:eccd:3fc5 with SMTP id
 be7-20020a056808218700b00344eccd3fc5mr5927139oib.46.1661443171311; Thu, 25
 Aug 2022 08:59:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220823063546.11499-1-bernard@vivo.com>
In-Reply-To: <20220823063546.11499-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Aug 2022 11:59:20 -0400
Message-ID: <CADnq5_NiyLjKtZ_C0jLBp8ChzvXvFkLd82dLN3x_JFeqV+XaVw@mail.gmail.com>
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

Alex

On Tue, Aug 23, 2022 at 2:36 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> This patch fix potential memory leak (clk_src) when function run
> into last return NULL.
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
> index 85f32206a766..c7bb76a2a8c2 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn314/dcn314_resource.c
> @@ -1643,6 +1643,7 @@ static struct clock_source *dcn31_clock_source_create(
>         }
>
>         BREAK_TO_DEBUGGER();
> +       kfree(clk_src);
>         return NULL;
>  }
>
> --
> 2.33.1
>
