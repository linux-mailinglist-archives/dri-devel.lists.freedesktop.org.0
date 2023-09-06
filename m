Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EE17940F5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 18:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05D210E6AB;
	Wed,  6 Sep 2023 16:01:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002D410E6A7;
 Wed,  6 Sep 2023 16:01:05 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-1cc61f514baso2299909fac.1; 
 Wed, 06 Sep 2023 09:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694016065; x=1694620865; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=X6LWx34t6RPAjjhmdGIBM9ahXBcms5DV7AzJj+GPzQA=;
 b=LCOALADZCexz0ZRSTQWB57xLnn3JQN68o6kvyvntivnepN2PUlhdJNgb0iXpoZ85k3
 dNQTRCzabFIBP7MfSBNnobpxZ7gucIbytbmV0dNXCRP3dRt5VHXk/wVg+tbcQJlfXHWi
 WqVh7o/ASncKIemBXXHO91vFhX+bFSkOfTrV0R1ko706AaKhiE033dtYiSRJp/cvbd05
 1lmeNjOZGsI54LqLtr/jn2+ZGsh9Kytd9Dm6HEzoiAfX6eslkU9xbY6OKJ/vtTaeLPq2
 0t/Db/LDnqWBgXggUYygj+D1REDNbfvkFnDDxVb0Z2JzGfcSQ94cxYFA1QA8GQP5bv6/
 hXxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694016065; x=1694620865;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X6LWx34t6RPAjjhmdGIBM9ahXBcms5DV7AzJj+GPzQA=;
 b=OmdoeP09cLpNwtG+KBBjfU8VNicMH9kD9HYr2B8czYZpmkZBs95RqMmfaxavMk5qw7
 VU3UV8cJedNCYHLXABOkc5K4X9k7QeK07USWAH3vHi1pIovFn8IadzW7liILB0A0jFgc
 vA4uIRgeAiSs8eCzh18reKs+g1G6wuJ19jfYRSc3gDWuywy9tT9jZz0EdAGnzhyrg0CM
 B1GQY/At6KyOjEGrEQzfI+/ziKWh2cCQqK39UTyP5Xi0gVShder9VZowwtCkQwqHdBzA
 /Oe4g/a5a7PpcWBBeh/FBbMkIO8rwP3YABN7uzZ2i3bE2CwXdHYp/CYgjKX1BlrGxy37
 Z/VQ==
X-Gm-Message-State: AOJu0YwAsTdtFVIUQkCT8SUY+oobUe+Gs14LdSeBnkeZP/IKCShqSbLR
 aVOIvBYqPD/UuihfOgCFmPsd5yraqMNv/oMvHhykyTD+b4Y=
X-Google-Smtp-Source: AGHT+IF+5jWUuhtjXrUwCDU2vqm+oD8PcmuCjMCceh985Ms+NPGpiBmtRG8mj/pojUh/Gya7OusMLGeBbVHAX3QI5GA=
X-Received: by 2002:a05:6870:d79f:b0:1bc:26d:6664 with SMTP id
 bd31-20020a056870d79f00b001bc026d6664mr17177800oab.16.1694016065112; Wed, 06
 Sep 2023 09:01:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230904195724.633404-1-sui.jingfeng@linux.dev>
 <20230904195724.633404-4-sui.jingfeng@linux.dev>
 <d3e6a9ce-1c7a-8e44-3127-413cd471a8e9@amd.com>
 <40f32814-ca87-6e29-0e10-4b4463a2920d@loongson.cn>
In-Reply-To: <40f32814-ca87-6e29-0e10-4b4463a2920d@loongson.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 Sep 2023 12:00:53 -0400
Message-ID: <CADnq5_OYPha5cGF+tSj4fvSmf-6tObzNSe2__nG-SbjX6v_2vw@mail.gmail.com>
Subject: Re: [RFC,
 drm-misc-next v4 3/9] drm/radeon: Implement .be_primary() callback
To: suijingfeng <suijingfeng@loongson.cn>
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
Cc: Sui Jingfeng <sui.jingfeng@linux.dev>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 5, 2023 at 1:25=E2=80=AFPM suijingfeng <suijingfeng@loongson.cn=
> wrote:
>
> Hi,
>
>
> On 2023/9/5 13:50, Christian K=C3=B6nig wrote:
> > Am 04.09.23 um 21:57 schrieb Sui Jingfeng:
> >> From: Sui Jingfeng <suijingfeng@loongson.cn>
> >>
> >> On a machine with multiple GPUs, a Linux user has no control over
> >> which one
> >> is primary at boot time.
> >
> > Question is why is that useful? Should we give users the ability to
> > control that?
> >
> > I don't see an use case for this.
> >
>
> On a specific machine with multiple GPUs mounted, only the
> primary graphics get POST-ed (initialized) by the firmware.
> Therefore the DRM drivers for the rest video cards have to
> work without the prerequisite setups done by firmware, This
> is called as POST.

I think that should be regarded as a bug in the driver that should be
fixed and this would not help with that case.  If a driver can't
initialize a device without aid from the pre-OS environment, that
should be fixed in the driver.  This solution also doesn't fix which
device is selected as the primary by the pre-OS environment.  That can
only be fixed in the pre-OS environment code.

>
> One of the use cases is to test if a specific DRM driver
> would works properly, under the circumstance of not being
> POST-ed, The ast drm driver is the first one which refused
> to work if not being POST-ed by the firmware.
>
> Before apply this series, I was unable make drm/ast as the
> primary video card easily. The problem is that on a multiple
> video card configuration, the monitor connected with my
> AST2400 card not light up. While confusing, a naive programmer
> may suspect the PRIME is not working.
>
> After applied this series and passing ast.modeset=3D10 on the
> kernel cmd line, I found that the monitor connected with my
> ast2400 video card still black, It doesn't display and It
> doesn't show image to me.

The problem with adding modeset=3D10 is that it only helps when you have
one GPU driven by that driver in the system.  If you have multiple
GPUs driven by that driver, which one would that apply to?  E.g., what
if you have 2 AMD GPUs in the system.

>
> While in the process of study drm/ast, I know that drm/ast
> driver has the POST code shipped, See the ast_post_gpu() function.
> Then, I was wondering why this function doesn't works.
>
> After a short-time (hasty) debugging, I found that the ast_post_gpu()
> function didn't get run. Because it have something to do with the
> ast->config_mode. Without thinking too much, I hardcoded the
> ast->config_mode as ast_use_p2a, the key point is to force the
> ast_post_gpu() function to run.
>
>
> ```
>
> --- a/drivers/gpu/drm/ast/ast_main.c
> +++ b/drivers/gpu/drm/ast/ast_main.c
> @@ -132,6 +132,8 @@ static int ast_device_config_init(struct ast_device
> *ast)
>                  }
>          }
>
> +       ast->config_mode =3D ast_use_p2a;
> +
>          switch (ast->config_mode) {
>          case ast_use_defaults:
>                  drm_info(dev, "Using default configuration\n");
>
> ```
>
> Then, the monitor light up, it display the Ubuntu greeter to me. Therefor=
e
> my patch is useful, at least for the Linux drm driver tester and develope=
r.
> It allow programmers to test the specific part of a specific driver witho=
ut
> changing a line of the source code and without the need of sudo authority=
.
>
> It improves the efficiency of the testing and patch verification. I know
> the PrimaryGPU option of Xorg conf, but this approach will remember the
> setup have been made, you need modify it with root authority each time
> you want to switch the primary. But on the process of rapid developing
> and/or testing for multiple video drivers, with only one computer hardwar=
e
> resource available. What we really want is a one-shot command, as provide=
d
> by this series.  So, this is the first use case.
>
>
> The second use case is that sometime the firmware is not reliable.
> While there are thousands of ARM64, PowerPC and Mips servers machine,
> Most of them don't have a good UEFI firmware support. I haven't test the
> drm/amdgpu and drm/radeon at my ARM64 server yet. Because this ARM64
> server always use the platform(BMC) integrated display controller as prim=
ary.
> The UEFI firmware of it does not provide options menu to tune.
> So, for the first time, the discrete card because useless, despite more p=
owerful.
> I will take time to carry on the testing, so I will be able to tell more
> in the future.
>
>
> Even on X86, when select the PEG as primary on the UEFI BIOS menu.
> There is no way to tell the bios which one of my three
> discrete video be the primary. Not to mention some old UEFI
> firmware, which doesn't provide a setting at all.
> While the benefit of my approach is the flexibility.
> Yes the i915, amdgpu and radeon are good quality,
> but there may have programmers want to try nouveau.
>
>
> The third use case is that VGAARB is also not reliable, It will
> select a wrong device as primary. Especially on Arm64, Loongarch
> and mips arch etc. And the X server will use this wrong device
> as primary and completely crash there. Either because of lacking
> a driver or the driver has a bug which can not bear the graphic
> environment up. VGAARB is firmware dependent.
> My patch provide a temporary method to rescue.
>

It sounds like we need a general purpose "primary" selector.  I think
it's sort of orthogonal to VGA.  VGAARB is just for managing VGA
routing on PCI.  It's not really directly related to which GPU you
want to be the primary when the OS loads.  Maybe some new kernel
parameter, E.g., primary_display=3D<string> where the string would be
the specific device you wanted to be the primary,  E.g., you could use
the PCI BDF on PCI devices, primary_display=3D0000:0a:00.0 or some other
device string for non-PCI devices.

Alex
