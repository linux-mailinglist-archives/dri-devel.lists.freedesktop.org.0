Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E147325942
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 23:08:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAB266E5D4;
	Thu, 25 Feb 2021 22:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93A9C6E58A;
 Thu, 25 Feb 2021 22:08:40 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A28E64F30;
 Thu, 25 Feb 2021 22:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614290920;
 bh=lgsSKsv5WWGw6seu4nq2AHtd41HuWunf07o+L8YoEzI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZggjfsYN5FrR9SupneuU2IRJjdzTdVaTsxv1Ie4wAMfYkcPd+2sXuu4YGSeIaV4nv
 8/01nMunkI7RZIO4i803veSZ5IaPoiJndTcXU4x5+ANnUNfxgDqUYUKhbUsdQKhIdk
 GPgHbFuaNAnvOdTwF9w6UIEpudU/zxKsHFuQQ3oyEpDDUOaEjKgL6new7zEyVv/0h4
 nsrowbXbCT3VeigwR5X56xc5bKhu4SjL6UvAN3PLtkvxs1/56GIcXJgXwOwOSvX487
 wY7RcofYniaCfx6I9No7ymbnohUh12JsTNf3q9iayJoDFm8rJnPsUs65OjqYj1GbLj
 96rt4hYCqdguQ==
Received: by mail-ot1-f46.google.com with SMTP id f33so7231803otf.11;
 Thu, 25 Feb 2021 14:08:40 -0800 (PST)
X-Gm-Message-State: AOAM5303Izbrun7NIPs5ehEwuLs7Os+PIYSkVAGzuoKrqszfCX7DQ9vO
 SxTq4WjWjw0ygGZP6f66yPd1WiPvXysGgtS+j94=
X-Google-Smtp-Source: ABdhPJy2J3/ZUvDiUbXnSkH6WsBBt1QpKTB1bWQ5CobTQTvdZQ++1o1JSl+X0cNGw2xDt070WbD+2Vi6fwPPHNEcwTI=
X-Received: by 2002:a9d:6b8b:: with SMTP id b11mr4028035otq.210.1614290919292; 
 Thu, 25 Feb 2021 14:08:39 -0800 (PST)
MIME-Version: 1.0
References: <20210225150119.405469-1-arnd@kernel.org>
 <CAKwvOdkWfQi4vPphJ9X+xQ5MdzGhrHr1mj=oFGh3Yv5TB=76_Q@mail.gmail.com>
In-Reply-To: <CAKwvOdkWfQi4vPphJ9X+xQ5MdzGhrHr1mj=oFGh3Yv5TB=76_Q@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 25 Feb 2021 23:08:23 +0100
X-Gmail-Original-Message-ID: <CAK8P3a32ECSnoi=4Ux5RFLdtTxZQe3vuyoLht1SdZ8zujtNrQw@mail.gmail.com>
Message-ID: <CAK8P3a32ECSnoi=4Ux5RFLdtTxZQe3vuyoLht1SdZ8zujtNrQw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix an uninitialized index variable
To: Nick Desaulniers <ndesaulniers@google.com>
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
Cc: Stylon Wang <stylon.wang@amd.com>, Eryk Brol <eryk.brol@amd.com>,
 Arnd Bergmann <arnd@arndb.de>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Nathan Chancellor <nathan@kernel.org>, David Airlie <airlied@linux.ie>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 25, 2021 at 10:34 PM 'Nick Desaulniers' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
> return parse_edid_cea(aconnector, edid_ext, EDID_LENGTH, vsdb_info) ? i : -ENODEV;
>
> would suffice, but the patch is still fine as is.

Right, I did not want to change more than necessary here, and the
original code already had the extra assignment instead of returning
the value.

> > @@ -9857,8 +9857,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
> >                         }
> >                 }
> >         } else if (edid && amdgpu_dm_connector->dc_sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A) {
> > -               hdmi_valid_vsdb_found = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
> > -               if (hdmi_valid_vsdb_found && vsdb_info.freesync_supported) {
> > +               i = parse_hdmi_amd_vsdb(amdgpu_dm_connector, edid, &vsdb_info);
> > +               if (i >= 0 && vsdb_info.freesync_supported) {
>
> reusing `i` here is safe, for now, but reuse of variables like this in
> separate branches like this might not get noticed if the function is
> amended in the future.
>
> >                         timing  = &edid->detailed_timings[i];
> >                         data    = &timing->data.other_data;

The entire point of the patch is that 'i' is in fact used in the following line,
but was lacking an intialization.

       Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
