Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2603A601610
	for <lists+dri-devel@lfdr.de>; Mon, 17 Oct 2022 20:16:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 258CA10E9B7;
	Mon, 17 Oct 2022 18:16:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCE610EDEA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 18:16:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 69542B819A0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 18:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA7EC433D7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 18:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666030570;
 bh=bC+/cya3KMQ7ZR+S6dM4jCfaG/o95my92WsHxec/tmM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Im0QvOQkcDh9n/LSlegRTaIMhk5lyz2BSvjq5rvEsDq0IG7qKGQN20KDnI3i79h38
 MUrrpL5+lJJ8X2RG8JTGEvkUdp02CHhQ20z8AXwx9CxWx35ninpuctfnlCGT/X4FFJ
 Jk+XYZB1BjGW5r9eIgE50k86kgGBb1WxUQb4YkaSLOw3qyQMhKQh+1HTlz2dZppMJu
 NCsJ6Y062GuIMf+C6o6uYfzWTOTrQqi6XEwlXcyBB8CdNFoOIhBAecUpt4lyNM24Eq
 mTWxjf8Rousv0+85TXufRq2Ngwx+sK+xxPDUYaowtpQmfhLsYH5qw7EaNr2v+ChHFh
 /cax+mCkLrGmg==
Received: by mail-vs1-f54.google.com with SMTP id 3so12347379vsh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Oct 2022 11:16:09 -0700 (PDT)
X-Gm-Message-State: ACrzQf2KfnC0bse2r7Q8Z4Y0iROIECq3SFID+PCbGCcwFsKMrsgu9Aoe
 RnF7FaeMamEKzT6HU8W/XvL9+ojEadOsh9GdpA==
X-Google-Smtp-Source: AMsMyM7chLsN+79vZUm6IwwIyOYTUmu0e5xkXf8cjzjCxvNdC3kO2CvscxuAQOwHWh/CFI3aR3PwKfF6K+NsaTmlV0c=
X-Received: by 2002:a67:e19a:0:b0:3a7:6b54:cc63 with SMTP id
 e26-20020a67e19a000000b003a76b54cc63mr5305559vsl.26.1666030568947; Mon, 17
 Oct 2022 11:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20221007124946.406808-1-thierry.reding@gmail.com>
 <20221007124946.406808-5-thierry.reding@gmail.com>
 <dd869713-6eb2-fadd-fdef-6ca155198a8c@suse.de>
 <Y01sunkDsQQQhXuC@orome>
In-Reply-To: <Y01sunkDsQQQhXuC@orome>
From: Rob Herring <robh+dt@kernel.org>
Date: Mon, 17 Oct 2022 13:15:59 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKzSife8_ob3P=KVVcQ_ny=ppMF5LsjLxvYz95roy-y2A@mail.gmail.com>
Message-ID: <CAL_JsqKzSife8_ob3P=KVVcQ_ny=ppMF5LsjLxvYz95roy-y2A@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] drm/simpledrm: Add support for system memory
 framebuffers
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-tegra@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 17, 2022 at 9:54 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Mon, Oct 10, 2022 at 10:12:34AM +0200, Thomas Zimmermann wrote:
> > Hi
> >
> > Am 07.10.22 um 14:49 schrieb Thierry Reding:
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Simple framebuffers can be set up in system memory, which cannot be
> > > requested and/or I/O remapped using the I/O resource helpers. Add a
> > > separate code path that obtains system memory framebuffers from the
> > > reserved memory region referenced in the memory-region property.
> > >
> > > v2: make screen base a struct iosys_map to avoid sparse warnings

[...]

> > > +static int simple_framebuffer_init(struct reserved_mem *rmem)
> > > +{
> > > +   pr_info("framebuffer memory at %pa, size %lu bytes\n", &rmem->base,
> > > +           (unsigned long)rmem->size);
> > > +
> > > +   rmem->ops = &simple_framebuffer_ops;
> > > +
> > > +   return 0;
> > > +}
> > > +RESERVEDMEM_OF_DECLARE(simple_framebuffer, "framebuffer", simple_framebuffer_init);
> >
> > What's the prupose of these code at all?  I looked through the kernel, but
> > there aren't many other examples of it.
>
> This is a fairly standard construct to deal with early memory
> reservations. What happens is roughly this: during early kernel boot,
> the reserved-memory core code will iterate over all children of the top-
> level reserved-memory node and see if they have a compatible string that
> matches one of the entries in the table created by these
> RESERVEDMEM_OF_DECLARE entries. It will then call the init function for
> a matched entry and register a struct reserved_mem for these. The init
> function in this case just dumps an informational message to the boot
> log to provide some information about the framebuffer region that was
> reserved (which can be used for example for troubleshooting purposes)
> and sets the device init/release operations (which will be called when a
> device is associated with the reserved memory region, i.e. when the
> of_reserved_mem_device_init_by_idx() function is called).
>
> The reason why there aren't many examples of this is because these are
> special memory regions that (at least upstream) kernels seldom support.
> Perhaps the most common use-cases are the shared DMA pools (such as
> CMA).

Also, not all regions need to be handled 'early' before slab allocator
or drivers are probed. Do you need early handling here? I can't see
why other than if fbcon is up early.

Rob
