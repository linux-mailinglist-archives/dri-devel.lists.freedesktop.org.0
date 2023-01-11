Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF0E665F08
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 16:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7962710E764;
	Wed, 11 Jan 2023 15:26:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BE1510E764
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 15:26:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 231E561D68;
 Wed, 11 Jan 2023 15:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090C5C433EF;
 Wed, 11 Jan 2023 15:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1673450766;
 bh=U2f1tKBJYlfCEhxdorOo/7D7jHkArttEmitpGOp2Svk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2JdBpA+LJYDToIW/T9oIkaa9WSBMHcR4IoKgqdUF1upb4E9cDXTvK8C62GPzc0HfY
 gQcrMsyJFyBFo/c56qrujWaLIL8fcladaOAVrL04f1NbeZrTpn9salym/F6dY56jxG
 wVYd8v/wQaeKtWH57V2D397lY0l7rybUL325lLBY=
Date: Wed, 11 Jan 2023 16:26:04 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 01/16] of: device: make of_device_uevent_modalias()
 take a const device *
Message-ID: <Y77VDGvHGu8gDIga@kroah.com>
References: <20230111113018.459199-1-gregkh@linuxfoundation.org>
 <20230111113018.459199-2-gregkh@linuxfoundation.org>
 <CAL_JsqJ4QsLym-bQGGjUpzT14MYuTE1n8BQkGn6Ey9NiFF7u7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_JsqJ4QsLym-bQGGjUpzT14MYuTE1n8BQkGn6Ey9NiFF7u7w@mail.gmail.com>
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
Cc: dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Liang He <windhl@126.com>,
 Zou Wei <zou_wei@huawei.com>, Samuel Holland <samuel@sholland.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Chen-Yu Tsai <wens@csie.org>,
 Corentin Labbe <clabbe@baylibre.com>, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 11, 2023 at 08:54:04AM -0600, Rob Herring wrote:
> On Wed, Jan 11, 2023 at 5:30 AM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > of_device_uevent_modalias() does not modify the device pointer passed to
> > it, so mark it constant.  In order to properly do this, a number of
> > busses need to have a modalias function added as they were attempting to
> > just point to of_device_uevent_modalias instead of their bus-specific
> > modalias function.  This is fine except if the prototype for a bus and
> > device type modalias function diverges and then problems could happen.  To
> > prevent all of that, just wrap the call to of_device_uevent_modalias()
> > directly for each bus and device type individually.
> 
> Why not just put the wrapper function in the DT code instead of making
> 4 copies of it?

I could, if you think that it would be better there instead of in each
individual bus (like all of the other bus callbacks).  This way each bus
"owns" their implementation :)

thanks,

greg k-h
