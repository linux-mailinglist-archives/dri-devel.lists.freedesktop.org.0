Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9178870060
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 12:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D2310FFF2;
	Mon,  4 Mar 2024 11:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9BD7310FFF2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 11:24:45 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EFB081FB;
 Mon,  4 Mar 2024 03:25:21 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B65A23F738;
 Mon,  4 Mar 2024 03:24:43 -0800 (PST)
Date: Mon, 4 Mar 2024 11:24:41 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Naresh Kamboju" <naresh.kamboju@linaro.org>, "open list"
 <linux-kernel@vger.kernel.org>, "Linux ARM"
 <linux-arm-kernel@lists.infradead.org>, linux-sunxi@lists.linux.dev,
 dri-devel@lists.freedesktop.org, lkft-triage@lists.linaro.org, "Maxime
 Ripard" <mripard@kernel.org>, "Dave Airlie" <airlied@redhat.com>, "Dan
 Carpenter" <dan.carpenter@linaro.org>, "Ard Biesheuvel" <ardb@kernel.org>
Subject: Re: arm: ERROR: modpost: "__aeabi_uldivmod"
 [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
Message-ID: <20240304112441.707ded23@donnerap.manchester.arm.com>
In-Reply-To: <338c89bb-a70b-4f35-b71b-f974e90e3383@app.fastmail.com>
References: <CA+G9fYvG9KE15PGNoLu+SBVyShe+u5HBLQ81+kK9Zop6u=ywmw@mail.gmail.com>
 <338c89bb-a70b-4f35-b71b-f974e90e3383@app.fastmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 04 Mar 2024 12:11:36 +0100
"Arnd Bergmann" <arnd@arndb.de> wrote:

Hi,

> On Mon, Mar 4, 2024, at 09:07, Naresh Kamboju wrote:
> > The arm defconfig builds failed on today's Linux next tag next-20240304.
> >
> > Build log:
> > ---------
> > ERROR: modpost: "__aeabi_uldivmod"
> > [drivers/gpu/drm/sun4i/sun4i-drm-hdmi.ko] undefined!
> >  
> 
> Apparently caused by the 64-bit division in 358e76fd613a
> ("drm/sun4i: hdmi: Consolidate atomic_check and mode_valid"):
> 
> 
> +static enum drm_mode_status
> +sun4i_hdmi_connector_clock_valid(const struct drm_connector *connector,
> +                                const struct drm_display_mode *mode,
> +                                unsigned long long clock)
>  {
> -       struct sun4i_hdmi *hdmi = drm_encoder_to_sun4i_hdmi(encoder);
> -       unsigned long rate = mode->clock * 1000;
> -       unsigned long diff = rate / 200; /* +-0.5% allowed by HDMI spec */
> +       const struct sun4i_hdmi *hdmi = drm_connector_to_sun4i_hdmi(connector);
> +       unsigned long diff = clock / 200; /* +-0.5% allowed by HDMI spec */

Wouldn't "div_u64(clock, 200)" solve this problem?

Cheers,
Andre

>         long rounded_rate;
> 
> This used to be a 32-bit division. If the rate is never more than
> 4.2GHz, clock could be turned back into 'unsigned long' to avoid
> the expensive div_u64().
> 
>       Arnd
> 

