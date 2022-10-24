Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85013609B3E
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 09:24:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8971A10E29D;
	Mon, 24 Oct 2022 07:24:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18DE710E2AB
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:24:11 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 86A53B80ED4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2256EC4314D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 07:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666596247;
 bh=oMp4bDmweM0zCRQHLAKdcIPSEe7hySM9WY0ly2HUhW0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=FOHUHrXU0bSCZUrz8P+wq7MieRM/XVj6uCuOGtnmvw5euG2A9m8AA9JP4rrWpj/AS
 12fxLTdDMivX8I+OBOd2z8uTADBdgC/mmeQ1r5JRVKN7MCpKkWi9PFiN7rhLBRwZ3a
 hi06VhZqexpO1GhBGV/97oVBQPHxqmF/QdvfIUYuS0ybjO893vSdD6e5tBoel2aXF3
 NnTpaJsIzMoTVY4oQZRRgC0AVl5CI9FYc+5a8kCcDkxbLuLJwvkyRdJZMvguZRrJWW
 gKLZUiJOuDb4OGcEiZC9wt0iuhHWW3KxUyRPcXqea94NoVgH+kbMImrmvT3G0pG1mD
 n79UOcBDz4W0w==
Received: by mail-ed1-f52.google.com with SMTP id z97so27802965ede.8
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 00:24:07 -0700 (PDT)
X-Gm-Message-State: ACrzQf1E/ZDX1FyPca8T+Bp/1dYpl/+qEpckERqtuONMN1mSSSt2y76D
 JlddWdnMMtfZMEFzLakG/+vqGtrCiyWBS39pTv4=
X-Google-Smtp-Source: AMsMyM4Z6rymPGvgTHgOsQf1d/yZ32NZ2glSwlHMcPQ3AwukVQi7Uhv315OjZE4oP6NxbcX3CqeJbJvUb9p4ikVehG0=
X-Received: by 2002:a05:6402:42c6:b0:45c:fc58:bd0f with SMTP id
 i6-20020a05640242c600b0045cfc58bd0fmr29969691edc.19.1666596245318; Mon, 24
 Oct 2022 00:24:05 -0700 (PDT)
MIME-Version: 1.0
References: <20221022214622.18042-1-ogabbay@kernel.org>
 <20221022214622.18042-4-ogabbay@kernel.org>
 <Y1U2iBedfSzqTjer@kroah.com>
In-Reply-To: <Y1U2iBedfSzqTjer@kroah.com>
From: Oded Gabbay <ogabbay@kernel.org>
Date: Mon, 24 Oct 2022 10:23:38 +0300
X-Gmail-Original-Message-ID: <CAFCwf126L5GZ52R7nayg8c-Avxpbv-rxAq+_q1OLw41jA5ow7A@mail.gmail.com>
Message-ID: <CAFCwf126L5GZ52R7nayg8c-Avxpbv-rxAq+_q1OLw41jA5ow7A@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] drm: add dedicated minor for accelerator devices
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Thomas Zimmermann <tzimmermann@suse.de>, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Jagan Teki <jagan@amarulasolutions.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Jiho Chu <jiho.chu@samsung.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christoph Hellwig <hch@infradead.org>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 23, 2022 at 3:41 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Oct 23, 2022 at 12:46:22AM +0300, Oded Gabbay wrote:
> > +/**
> > + * accel_open - open method for ACCEL file
> > + * @inode: device inode
> > + * @filp: file pointer.
> > + *
> > + * This function must be used by drivers as their &file_operations.open method.
> > + * It looks up the correct ACCEL device and instantiates all the per-file
> > + * resources for it. It also calls the &drm_driver.open driver callback.
> > + *
> > + * RETURNS:
> > + *
> > + * 0 on success or negative errno value on failure.
> > + */
> > +int accel_open(struct inode *inode, struct file *filp)
> > +{
> > +     struct drm_minor *minor;
> > +
> > +     minor = drm_minor_acquire(iminor(inode), true);
> > +     if (IS_ERR(minor))
> > +             return PTR_ERR(minor);
> > +
> > +     return __drm_open(inode, filp, minor);
> > +}
> > +EXPORT_SYMBOL(accel_open);
>
> EXPORT_SYMBOL_GPL() please.
>
> And again, this should probably to into drivers/accel/ not here.
Got it, will do.
Thanks,
Oded
>
> thanks,
>
> greg k-h
