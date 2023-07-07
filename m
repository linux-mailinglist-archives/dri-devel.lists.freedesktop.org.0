Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E058074B67A
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 20:40:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D80C10E5D1;
	Fri,  7 Jul 2023 18:40:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc35.google.com (mail-oo1-xc35.google.com
 [IPv6:2607:f8b0:4864:20::c35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B7910E5D1;
 Fri,  7 Jul 2023 18:40:49 +0000 (UTC)
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-56598263d1dso1605914eaf.0; 
 Fri, 07 Jul 2023 11:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688755248; x=1691347248;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m4khBbbMzZOqVO6sgwUxA/mR93/pguaqzC86olg1A9Q=;
 b=IvQs+5Bd72VtYmZOzs/keL4rEe6Y8ERi9NcvH2dfxSHBEMFJJ6pesO1qYZq+WULb0m
 oFOmtgCN/xYyC5sMwYMccXqQB4os0XJ6F89YGhE0eTXcEAu/9VkCcAR+/1bgwD4HXDFu
 bBl/BhlBskGskIaCo8xb5oMpTjG0/CxuiN12IvRNlqcwF6NOiFduaCNxiY049aekB+WS
 a54E4faLUUVXMETTTcDzjETJPFQAfqUCb3KMPe6X/8yaLGTkNwoy8De8Pawf3lbOnoDp
 z+Td1wmDer6ni86YAw0IRlvdF6MjPuex4CW7+872FFhhpgnxfvpT625MrwgsFhWg2nJz
 518g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688755248; x=1691347248;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m4khBbbMzZOqVO6sgwUxA/mR93/pguaqzC86olg1A9Q=;
 b=jsuBhtlUNnC1g9Hr+u7b/KRy3jzUd/gVqTXxqSnyWo2hXC73EZQbYU2rUlyWitb59a
 b0VpU9+POFKEJiPalS1QzewKVhi7q9r3qfI5L/kcPSSPloPh4sFK1yQLuGz5hj94x9j6
 UFkQRqlmE3Q/7jLzKm57C/Y9URl8c+LtK9Gp5Yc/DfdvL20G9UkZJipq98cahWubVxCX
 aLPpzsCm7NJItt6M7v2jZowrahC8fsmsc8uhiEcFlcEq/PVEKypvzcAOyuw0/LLxN/JE
 8XXNQE3cQn0xU+nX5MuxbssaAonKpKqiSN0L/6ygqEMki5HrvJQPqH0oIAfWelDPSWY9
 v7HA==
X-Gm-Message-State: ABy/qLbvULf478y9MPKcmj/SBBIETim7URKuAmhJTeRnj3Xx4GXKdvUW
 Zcz6/rXsinblEbGN1Bq/3avykAnk0VTgPugNeCA=
X-Google-Smtp-Source: APBJJlEuci3uJQdI2So5qxh1kJtVbYtHUhBLmgc2t5ZV0Tj7CtsJuQGY5emu9lGlC2mgfen19d52vWR1A1pTHvNJGvg=
X-Received: by 2002:a4a:641:0:b0:558:b482:c3b3 with SMTP id
 62-20020a4a0641000000b00558b482c3b3mr3874548ooj.1.1688755248313; Fri, 07 Jul
 2023 11:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230707111157.209432-1-arnd@kernel.org>
 <f32098e2-d680-d02e-8181-cad76daf2416@amd.com>
In-Reply-To: <f32098e2-d680-d02e-8181-cad76daf2416@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 7 Jul 2023 14:40:37 -0400
Message-ID: <CADnq5_M5KE_woBVfsmVhQPzc4YJon_5mKKuQ72mCnKqU-SdumQ@mail.gmail.com>
Subject: Re: [PATCH] [v2] drm/amdgpu: avoid integer overflow warning in
 amdgpu_device_resize_fb_bar()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Lijo Lazar <lijo.lazar@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Bokun Zhang <Bokun.Zhang@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Shiwu Zhang <shiwu.zhang@amd.com>,
 Le Ma <le.ma@amd.com>, YiPeng Chai <YiPeng.Chai@amd.com>,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  thanks!

On Fri, Jul 7, 2023 at 7:47=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 07.07.23 um 13:11 schrieb Arnd Bergmann:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > On 32-bit architectures comparing a resource against a value larger tha=
n
> > U32_MAX can cause a warning:
> >
> > drivers/gpu/drm/amd/amdgpu/amdgpu_device.c:1344:18: error: result of co=
mparison of constant 4294967296 with expression of type 'resource_size_t' (=
aka 'unsigned int') is always false [-Werror,-Wtautological-constant-out-of=
-range-compare]
> >                      res->start > 0x100000000ull)
> >                      ~~~~~~~~~~ ^ ~~~~~~~~~~~~~~
> >
> > As gcc does not warn about this in dead code, add an IS_ENABLED() check=
 at
> > the start of the function. This will always return success but not actu=
ally resize
> > the BAR on 32-bit architectures without high memory, which is exactly w=
hat
> > we want here, as the driver can fall back to bank switching the VRAM
> > access.
> >
> > Fixes: 31b8adab3247e ("drm/amdgpu: require a root bus window above 4GB =
for BAR resize")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> > v2: return early instead of shutting up the warning with a cast and
> > running into a failure
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 +++
> >   1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/d=
rm/amd/amdgpu/amdgpu_device.c
> > index 7f069e1731fee..fcf5f07c47751 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -1325,6 +1325,9 @@ int amdgpu_device_resize_fb_bar(struct amdgpu_dev=
ice *adev)
> >       u16 cmd;
> >       int r;
> >
> > +     if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
> > +             return 0;
> > +
> >       /* Bypass for VF */
> >       if (amdgpu_sriov_vf(adev))
> >               return 0;
>
