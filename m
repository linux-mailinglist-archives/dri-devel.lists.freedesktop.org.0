Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E80843258B8
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 22:36:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78726E3C1;
	Thu, 25 Feb 2021 21:36:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39A706E3C1;
 Thu, 25 Feb 2021 21:36:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0020064EFA;
 Thu, 25 Feb 2021 21:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614288982;
 bh=vhR06eEJtDZ0r97bs4jU4YhRSpx9NcqTr0R2mpv+aSo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Avuf5TFdxU8dfLyGY3bl8VlfmjoSEy30btLo9dx84eVSgZAok+ltJN/7aXBZfZpOd
 Bp2zI8zESCw6lYHJjFHlJT5YkjbvUi6WOqNxV92d9u5WEt94NeQN+YKqFDGAEX7fqL
 tM+HYLv0oC4BnZMNfUyIcTRVjXj4EDlRjL3a89eTpPhofePsiDfSwAJRmdKWxJPIYf
 Uk8Paz4LdHZvpM4Zz4zaS/KxUxQlnnm2wP/6MDSjEz8SjiOgZxLVatxXurGdfNQsgU
 vs55lHfX1LpXtlgKN8JHB8a8eQQYO9swShtJlwblI0JTQ5hPhyH3C9nG1NoISmhnbw
 UwGZnQ4Ke6kKg==
Received: by mail-oi1-f171.google.com with SMTP id q186so7576770oig.12;
 Thu, 25 Feb 2021 13:36:21 -0800 (PST)
X-Gm-Message-State: AOAM531ITe8zF+EX/f30LqL/jSNd36RNJaw13j0zAi/cO/M0FqRjHY8+
 DA/lq/dw08PmigsKS2nVYt304Wg0LpQtdcouAtU=
X-Google-Smtp-Source: ABdhPJybVJcHMJTDZedQxlBiUnKZZcDkyTWHOLi5187NOxBRl/xxjKkBQg64kUB5T4FFzlA5mQYjKZG0yiDibO3jb2M=
X-Received: by 2002:aca:b457:: with SMTP id d84mr312789oif.4.1614288981097;
 Thu, 25 Feb 2021 13:36:21 -0800 (PST)
MIME-Version: 1.0
References: <20210225143339.3693838-1-arnd@kernel.org>
In-Reply-To: <20210225143339.3693838-1-arnd@kernel.org>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 25 Feb 2021 22:36:04 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0Zi2MAzG2f6Te-LYuDuLd4yiy4b3VRYQY6EspqzMnQ5w@mail.gmail.com>
Message-ID: <CAK8P3a0Zi2MAzG2f6Te-LYuDuLd4yiy4b3VRYQY6EspqzMnQ5w@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix 64-bit integer division
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Bindu Ramamurthy <bindu.r@amd.com>, 
 Vladimir Stempen <vladimir.stempen@amd.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Dmytro Laktyushkin <Dmytro.Laktyushkin@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 25, 2021 at 3:33 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The new display synchronization code caused a regression
> on all 32-bit architectures:
>
> ld.lld: error: undefined symbol: __aeabi_uldivmod
> >>> referenced by dce_clock_source.c
> >>>               gpu/drm/amd/display/dc/dce/dce_clock_source.o:(get_pixel_clk_frequency_100hz) in archive drivers/built-in.a
>
> ld.lld: error: undefined symbol: __aeabi_ldivmod
> >>> referenced by dc_resource.c
> >>>               gpu/drm/amd/display/dc/core/dc_resource.o:(resource_are_vblanks_synchronizable) in archive drivers/built-in.a
> >>> referenced by dc_resource.c
> >>>               gpu/drm/amd/display/dc/core/dc_resource.o:(resource_are_vblanks_synchronizable) in archive drivers/built-in.a
> >>> referenced by dc_resource.c
> >>>               gpu/drm/amd/display/dc/core/dc_resource.o:(resource_are_vblanks_synchronizable) in archive drivers/built-in.a
>
> This is not a fast path, so the use of an explicit div_u64/div_s64
> seems appropriate.

I found two more instances:

>>> referenced by dcn20_optc.c
>>>               gpu/drm/amd/display/dc/dcn20/dcn20_optc.o:(optc2_align_vblanks) in archive drivers/built-in.a

>>> referenced by dcn10_hw_sequencer.c
>>>               gpu/drm/amd/display/dc/dcn10/dcn10_hw_sequencer.o:(reduceSizeAndFraction) in archive drivers/built-in.a

I have patches for both, but will let the randconfig build box keep working
on it over night to see if there are any others. Let me know if you want a
combined patch or one per file once there are no more regressions.

        Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
