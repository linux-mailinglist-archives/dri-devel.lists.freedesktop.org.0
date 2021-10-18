Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0133A43180F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 13:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BBB6E9E0;
	Mon, 18 Oct 2021 11:50:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48AF46E9E0;
 Mon, 18 Oct 2021 11:50:04 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id e10so5199169uab.3;
 Mon, 18 Oct 2021 04:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5k/lpb+l8LiCQGm9WxrBH5sQpLcaEAbjVKVFfUJrgn0=;
 b=41xdMmIcLV4fWfsiRHNULS5TknQlhCY07pCSdBbylTsYGPoCmy92wtYRTZan2gnMfc
 8sW/72OhuC+QLA2pCaw+UVXGnrliH8FYhdf3tHZW2uFuoRmPyZrc+YpPYN7oLZXhBX26
 otAlVH9qj8ULQwJnKxmBLANgGT7TVxVF8z8tisetanU8oXqZ2Pcc41DxqEC9OYPwsWUb
 ArZ0q+ACOu+BD1Hx/vyOnGr1ZwcmtNlQ1EdGGRhauntY941N36lj1b3dAbWUQLlTzASC
 WgzlDVYcWUmy5dPhE/arLxuK9kwK5XzHc7CHHQFTJ4j7miH/PGRTDsAJTloapLaEm5b0
 7cDw==
X-Gm-Message-State: AOAM532aFodr0mij29+0dL7yow3HpfbeOt5xzoyGDrmU9l8pIxl8ZIa8
 mRXRH9i4QZXqu3GZdFALmgV9f2qircLr1g==
X-Google-Smtp-Source: ABdhPJzM3YlElx/mnydAa42qYPqCI0vxDlfEi4BwzwFei3XkXMfTYsw4c/Nbad/l0VJ3CxjZ/Zzt7g==
X-Received: by 2002:a67:e30d:: with SMTP id j13mr25778037vsf.3.1634557802826; 
 Mon, 18 Oct 2021 04:50:02 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id y73sm8747405vkc.43.2021.10.18.04.50.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 04:50:02 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id r22so2670176uat.11;
 Mon, 18 Oct 2021 04:50:01 -0700 (PDT)
X-Received: by 2002:ab0:538a:: with SMTP id k10mr25439724uaa.14.1634557801457; 
 Mon, 18 Oct 2021 04:50:01 -0700 (PDT)
MIME-Version: 1.0
References: <20211013144308.2248978-1-arnd@kernel.org>
 <25ccdc75-67da-a955-b8ef-641a2f007d13@amd.com>
 <CAMuHMdWKp-v=df0JA_tr-YgNnyfu7NS9dA3Zr+bqwZX9JuBAGQ@mail.gmail.com>
 <ad5d95ab-7cb5-aef7-9904-eda0befe8519@amd.com>
In-Reply-To: <ad5d95ab-7cb5-aef7-9904-eda0befe8519@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Oct 2021 13:49:50 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVW3eBAozRLcWXfeh20ycC4sjfrjPv+yrf89xLSM0VMpQ@mail.gmail.com>
Message-ID: <CAMuHMdVW3eBAozRLcWXfeh20ycC4sjfrjPv+yrf89xLSM0VMpQ@mail.gmail.com>
Subject: Re: [PATCH] drm: msm: fix building without CONFIG_COMMON_CLK
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Alex Elder <elder@linaro.org>, Akhil P Oommen <akhilpo@codeaurora.org>, 
 Rajeev Nandan <rajeevny@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>,
 freedreno@lists.freedesktop.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi Christian,

On Mon, Oct 18, 2021 at 1:41 PM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
> Am 18.10.21 um 13:38 schrieb Geert Uytterhoeven:
> > On Mon, Oct 18, 2021 at 1:37 PM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >> Am 13.10.21 um 16:42 schrieb Arnd Bergmann:
> >>> From: Arnd Bergmann <arnd@arndb.de>
> >>>
> >>> When CONFIG_COMMON_CLOCK is disabled, the 8996 specific
> >>> phy code is left out, which results in a link failure:
> >>>
> >>> ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3f0): undefined re=
ference to `msm_hdmi_phy_8996_cfg'
> >>>
> >>> This was only exposed after it became possible to build
> >>> test the driver without the clock interfaces.
> >>>
> >>> Make COMMON_CLK a hard dependency for compile testing,
> >>> and simplify it a little based on that.
> >>>
> >>> Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
> >>> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> >>> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> >>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >>> ---
> >>>    drivers/gpu/drm/msm/Kconfig  | 2 +-
> >>>    drivers/gpu/drm/msm/Makefile | 6 +++---
> >>>    2 files changed, 4 insertions(+), 4 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfi=
g
> >>> index f5107b6ded7b..cb204912e0f4 100644
> >>> --- a/drivers/gpu/drm/msm/Kconfig
> >>> +++ b/drivers/gpu/drm/msm/Kconfig
> >>> @@ -4,8 +4,8 @@ config DRM_MSM
> >>>        tristate "MSM DRM"
> >>>        depends on DRM
> >>>        depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
> >>> +     depends on COMMON_CLK
> >>>        depends on IOMMU_SUPPORT
> >> We also need a "depends on MMU" here because some automated test is no=
w
> >> trying to compile the driver on parisc as well.
> >>
> >> I have absolutely no idea how a platform can have IOMMU but no MMU
> >> support but it indeed seems to be the case here.
> > Huh?
> >
> > Parisc has config MMU def_bool y?
>
> Then why vmap isn't available?
>
> See the mail thread: [linux-next:master 3576/7806]
> drivers/gpu/drm/msm/msm_gem.c:624:20: error: implicit declaration of
> function 'vmap'

You mean https://lore.kernel.org/all/202110141259.i36iJnsA-lkp@intel.com/?

Hexagon !=3D parisc.
.
And Hexagon also has config MMU def_bool y

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
