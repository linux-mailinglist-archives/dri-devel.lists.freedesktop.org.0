Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 984AA302551
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jan 2021 14:10:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B23E8893D5;
	Mon, 25 Jan 2021 13:10:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDEA289243;
 Mon, 25 Jan 2021 13:10:48 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5C9EF22EBD;
 Mon, 25 Jan 2021 13:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611580248;
 bh=6JJ4Nm0kaHBVbitV9armeYd/HjXqVZ6g0euhuEoNPuA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=t6Ke8RvDAhHlgjg3pXQAieLR77l39DEV2VbpK/aByE5AkziwhGkizw64Z61n0+vX5
 VR679Q5z/MMLm2eq1tqx2M3Wk8IW+jZ6qv2w8VLrTfJTGv8eOq9B7KKpuYyeNGtALa
 lJr0MrH1LVc7L6H4WWR4i5VW6b7F+hGz5vGc51fd3sKEZQLqbln0iyxHNo9sb/rNnQ
 h3mYnpUgULwrwERDWT9iQkOk0psv7L4xjuzCuQxzOy0uN/zeyXDo1qKdkUaLRLw83B
 zHBrnkdsvym2oAFPD2Qj+kW/3MqSZxl4ZeYP4v9/U9r8peP34y6PHNsmayxeAqQOf+
 Ia2WjrXJ/dFjg==
Received: by mail-ot1-f44.google.com with SMTP id s2so10455816otp.5;
 Mon, 25 Jan 2021 05:10:48 -0800 (PST)
X-Gm-Message-State: AOAM5315DpK7FpqdtuyDMFDjYJejiP+9T1UyG6AWvgp2T2tgKV3vUFET
 QJCKC20BHu7Rrh59oNSiEsLqOtT2R/E9BGrcdzU=
X-Google-Smtp-Source: ABdhPJwnN84NqKdW3l2u+qaTx2r0WtE4eDaZO+Bzs3/LR9lqmjVYXpjT3MmQyzJh8+M38iiBKhDDF6FVaomIwqf97UA=
X-Received: by 2002:a05:6830:139a:: with SMTP id
 d26mr376081otq.305.1611580247723; 
 Mon, 25 Jan 2021 05:10:47 -0800 (PST)
MIME-Version: 1.0
References: <20210125114012.2480845-1-arnd@kernel.org>
 <CY4PR12MB1287B8B020D280A5F12ED62DF1BD9@CY4PR12MB1287.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB1287B8B020D280A5F12ED62DF1BD9@CY4PR12MB1287.namprd12.prod.outlook.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 25 Jan 2021 14:10:31 +0100
X-Gmail-Original-Message-ID: <CAK8P3a06+7sC8yWEFb1D_Op=76RR2OqY7j4s11h3sos-SJ=v6Q@mail.gmail.com>
Message-ID: <CAK8P3a06+7sC8yWEFb1D_Op=76RR2OqY7j4s11h3sos-SJ=v6Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: use div_s64() for 64-bit division
To: "Chen, Guchun" <Guchun.Chen@amd.com>
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
Cc: "Aberback, Joshua" <Joshua.Aberback@amd.com>, "Chalmers,
 Wesley" <Wesley.Chalmers@amd.com>, Arnd Bergmann <arnd@arndb.de>, "Li,
 Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>, "Zhuo,
 Qingqing" <Qingqing.Zhuo@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Kazlauskas,
 Nicholas" <Nicholas.Kazlauskas@amd.com>, David Airlie <airlied@linux.ie>,
 Jacky Liao <ziyu.liao@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Leung,
 Martin" <Martin.Leung@amd.com>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 25, 2021 at 1:51 PM Chen, Guchun <Guchun.Chen@amd.com> wrote:
>
> [AMD Public Use]
>
> Hi Arnd Bergmann,
>
> Thanks for your patch. This link error during compile has been fixed by below commit and been submitted to drm-next branch already.
>
> 5da047444e82 drm/amd/display: fix 64-bit division issue on 32-bit OS

Ok, thanks. I assume this will make it into linux-next in the coming days then.

     Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
