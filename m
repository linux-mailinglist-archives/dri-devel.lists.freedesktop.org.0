Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5805A1665
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 18:10:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C3210E466;
	Thu, 25 Aug 2022 16:10:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F7310E456;
 Thu, 25 Aug 2022 16:10:24 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-11ba6e79dd1so25455008fac.12; 
 Thu, 25 Aug 2022 09:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Tg67a5ZgeqhuPMZYg/nl54FzBqCFxXTIGdWfFEYy1EE=;
 b=ROYRuJa9bi5ztQERSMgohHM+Vhzk9oqzNrGtvNhIXEMh+7PPU7qPG2n3Nx6dG8z6Jt
 2CNcvnurCzJd0eukc9iGHE8lP2vk/MqMnrM1OWwvOORN/jhy3OOmcEIt0UlNnaWcaUBA
 jU/+7XIU4prxNBhnAjGR3nAIOzdXOhsu21RtUHpZg7xuHXaVzIr5iBK4zXSHe+I1p92H
 v0TmWj4Zm42PFAF5WnB/CPlk8KdjkStB2gptDoRBo7hIcHLwRQoymoXVjjzhgSqqIbzo
 XH4xYTo/vEUixFebnY2efjBI2ik0QL5lzsf22gOE65iozFN9EutZP1zIwuCaXTl7hKyp
 K4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Tg67a5ZgeqhuPMZYg/nl54FzBqCFxXTIGdWfFEYy1EE=;
 b=Yb1r9yJEPuhX+pQoWkEyIzWQpN/GgvM5p6H/9X/+Zi+sNSLWUo7KtEU0b7Z+kvyOjs
 DDzcTddL1qWeW5AsB2gPm0NqyYm2tmIi+2qsZ/cyGTaTsCAx9XFImN49burNoP1xWDpE
 XAzQrMTyp0oFYxAl7kiDHSnkHzH+nPVEaLtknC0F6k6kHMaSrQkq8Owk33emdwnJSfiK
 0xBWCD6JU0nof4r+WPWQ7x70+gwhixPeu85AKDGjSo9jDSiVzIUWZBoBZ+YKDV2YbA0H
 gM1I4PxRMeSoq/gNN25fr8/nRK3U2HcMBPynMJea1EWZEKkwVDVqn915zIJtNW0NrBv1
 hARQ==
X-Gm-Message-State: ACgBeo37uPOpxuR3vFa5G3w1H1NtFXrX+j6GBjf/HQkvPKO91jDIbLjC
 Lov/bC5n0F4VU3VIMR8vgFRc/JzoywkhWqMQQQc=
X-Google-Smtp-Source: AA6agR6tplrzH6OYDlgo1Ou22r/z1pFuZkIVOBBMLCIJUDZd/kTwZndnKvRk8EC2ZFI/QHXVhK24lfhrMbu1mll1uKc=
X-Received: by 2002:a05:6870:9a06:b0:11e:3d19:2614 with SMTP id
 fo6-20020a0568709a0600b0011e3d192614mr969158oab.96.1661443823611; Thu, 25 Aug
 2022 09:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220823065001.16872-1-bernard@vivo.com>
In-Reply-To: <20220823065001.16872-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Aug 2022 12:10:12 -0400
Message-ID: <CADnq5_MMGW4fxAt1oBxz1JcERjRRZ0YKDVWXfNNP2hE0TT69JQ@mail.gmail.com>
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

This should be kfree().  Fixed up locally.

Alex

>         return NULL;
>  }
>
> --
> 2.33.1
>
